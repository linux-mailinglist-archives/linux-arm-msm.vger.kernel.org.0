Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CBED397647
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jun 2021 17:15:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234066AbhFAPQl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 11:16:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233924AbhFAPQk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 11:16:40 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EC43C061756
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jun 2021 08:14:59 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id n17-20020a7bc5d10000b0290169edfadac9so1836947wmk.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jun 2021 08:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=zAPRwiSTsBnNnMN52mKyAPCXe27aZPsDLFAEB6TcYPU=;
        b=puY1kTSAxOEdP+fRCthS7daQu3jMlTM4wIyuI0OYtVKsYNN7F3PtoH9ByZcW2LoFeL
         e/Clf3LcoTaVsIBbP1ZUehVHZoTWcQNlWrwK8/zzRpkHNdVtPc5EJMBBLTRSVmATzCbs
         MVch5uWUoYyRLXeNcSiMrhsTSGpY8N+R0mnBOgYbnM7AGvSLoZNw2e+ruXSGuGbhjIt7
         pCQVq3n4Ox9g93w3OPAVNV+p6Gj9hKXGWeHodLzZHjvj59N7krT0nnhDsepJl10hpMyj
         s+eZEuO/8WCZCfcytM/P6Xzy1GsnJ0TOB9XyIjARSKsxOIIiA1IACNT7KxReIiT0c1yl
         /JRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=zAPRwiSTsBnNnMN52mKyAPCXe27aZPsDLFAEB6TcYPU=;
        b=nD085ojYHHWbYSAouYbsHGlg4g/Yc8tlcVOVAr6QRmmYptIwGX7Tiqlfa69R4dnZl9
         b4qbbnfo9Ij/27Ys5vRbp4WNC4etcpahn9PJMweNNcl2dAt4xddKfqI57ibx5m/xuydP
         twH/h5WMm0r5mhRQ8pTZQNftxZIShZmKOe3bVVSWcpokyOT4b7lEecD6d1QiNHMqmQ95
         DEDljQm1w0yNYTmzcG9B9qowodnjiCC+SPQb8YOJM8ZDJT9pw9kySs7j/MO/IvuulmdB
         A2TUhtYCimxKiT2qhFEq68cb+huo2yGbBdY/DuC7XVrgCptyIoLsgNDNRRkFboEERl9r
         H37g==
X-Gm-Message-State: AOAM530220OousitKrdwiujaGwOtp2NIIsLF/VlwzQLgiJxB+4RXv78O
        Tu33nQHrZ/KmqBwnNXQVcCHseQ==
X-Google-Smtp-Source: ABdhPJxwMg+e9QSUoEFtoEy3x4sqSfHuth7QSk/0u4Kj83HWFu7zQyx9TCbEbI819s0NJAbQXRC9rQ==
X-Received: by 2002:a1c:e354:: with SMTP id a81mr11240158wmh.98.1622560497758;
        Tue, 01 Jun 2021 08:14:57 -0700 (PDT)
Received: from dell ([91.110.221.249])
        by smtp.gmail.com with ESMTPSA id r7sm3812981wma.9.2021.06.01.08.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 08:14:57 -0700 (PDT)
Date:   Tue, 1 Jun 2021 16:14:55 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Guru Das Srinagesh <gurus@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v4 1/3] dt-bindings: mfd: pm8008: Add IRQ listing
Message-ID: <20210601151455.GQ543307@dell>
References: <cover.1621965146.git.gurus@codeaurora.org>
 <78c196438af8cdb6f2f2c4fa9adf39151448ef8f.1621965146.git.gurus@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <78c196438af8cdb6f2f2c4fa9adf39151448ef8f.1621965146.git.gurus@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 25 May 2021, Guru Das Srinagesh wrote:

> Add a header file listing all of the IRQs that Qualcomm Technologies,
> Inc. PM8008 supports. The constants defined in this file may be used in
> the client device tree node to specify interrupts.
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>

Tags should be chronological.

> ---
>  include/dt-bindings/mfd/qcom-pm8008.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 include/dt-bindings/mfd/qcom-pm8008.h

Fixed *-by tag order and applied.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
