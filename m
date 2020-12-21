Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 035F32DFABE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Dec 2020 11:06:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbgLUKG1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Dec 2020 05:06:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbgLUKG1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Dec 2020 05:06:27 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0785C061285
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Dec 2020 01:02:48 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id a12so10235965wrv.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Dec 2020 01:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=9T79yJoOT1+QdV+mhYYSVVbCJJCbFg1PwQWJR6WlAbY=;
        b=CrOk4paEcVPIbRLrtPVfsENnSeMvHYBK3tECGdTXy4b0hyhOnlQCD1Ha8huLL1YENp
         HagRLuyeQJbly0u4rdxvf4yl/YBPMG4oI5VqPQJEbdnmGTZMVpgnIby4iDUG50dBfqgJ
         Mve9OYb+esAAPwqe1+NiQ6NAoefDoGKfEBIRbr1oihubG6Aglpea32y0RriMDKW89KX/
         WgtsKOyrHiALd9nDSOhywSa2e0oEHjMOxSHbMmLLvKcP8hHxqU0T2hkktTWDnlU1Q+6j
         pg59z8o924n0QoIhtuH3upONhZSrCi5FKC2qXW9OLYiRp74DIiANaAD1gahOj09a7hGl
         ZKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=9T79yJoOT1+QdV+mhYYSVVbCJJCbFg1PwQWJR6WlAbY=;
        b=XhF3vDrfNEk7rAOvAoBUJmB04kvI4RoV9hkQFie+y7xn9kTUOTM5lBfvfDhe3la6zT
         RYyogTudReendxpR8HO+9r81jitTdq/cDnB+v51g582dMhrI2MC45sFHdhRSMU1QBnhS
         Z/oL1XoTbrR1MrffxPtrspd6+m2WtnQwwfbrltrA+9qMeeflRr3GrYTmzWW8AxKXhFSk
         KptlUNhoPDuZc2YkvCd6sOH3fGIir/C409f6iETvT7YHdOM5NF75vWOSr0N3eCVV0JrB
         UymKDuLYsl9DTY36axBBhGQep6TApK0oK7DJo80lltAamZPQwJgTg2tv9caGIIxLcg7N
         61kA==
X-Gm-Message-State: AOAM532TpbFPJxQ3G/lc7fGuZhGHAnTdB/3MUShOockG2Kf2mzboO+Fa
        wC80CgHlOOCP5qKN8oFl+bXxng==
X-Google-Smtp-Source: ABdhPJzusCr9B67aMTossxbYkFkGLR2hkvsmxy7JE4yImnR5q0WhgIPr1/aGMQrBdvFp2ptpvysl3w==
X-Received: by 2002:a5d:6cad:: with SMTP id a13mr17302756wra.275.1608541367389;
        Mon, 21 Dec 2020 01:02:47 -0800 (PST)
Received: from dell ([91.110.221.144])
        by smtp.gmail.com with ESMTPSA id j10sm24582598wmj.7.2020.12.21.01.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 01:02:46 -0800 (PST)
Date:   Mon, 21 Dec 2020 09:02:44 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] mfd: qca639x: add support for QCA639x powerup
 sequence
Message-ID: <20201221090244.GA53991@dell>
References: <20201220165845.3712599-1-dmitry.baryshkov@linaro.org>
 <20201220165845.3712599-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201220165845.3712599-3-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 20 Dec 2020, Dmitry Baryshkov wrote:

> Qualcomm QCA639x is a family of WiFi + Bluetooth SoCs, with BT part
> being controlled through the UART and WiFi being present on PCIe
> bus. Both blocks share common power sources. So add mfd device driver
> handling power sequencing of QCA6390/1.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/mfd/Kconfig        |  12 +++
>  drivers/mfd/Makefile       |   1 +
>  drivers/mfd/qcom-qca639x.c | 168 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 181 insertions(+)
>  create mode 100644 drivers/mfd/qcom-qca639x.c

This is not an MFD, since it utilised neither the MFD API nor
of_platform_populate() to register child devices.

Suggest you use drivers/power or similar to handle shared power
sequencing requirements.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
