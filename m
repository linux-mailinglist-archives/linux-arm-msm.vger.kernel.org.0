Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE9E3269D88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 06:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726158AbgIOEmA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 00:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbgIOEl7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 00:41:59 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77C92C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 21:41:58 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id g10so1987298otq.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 21:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=I/ZnzMpFblwaWryRS21SJ/GyazzhCSsArSdcbBdV5LQ=;
        b=ToH3Ovt7Gu16Tk3FQija82rEvQjY97itvmMTSLJvj2ztm8dAoWTTAeQgvY4s2GPy8k
         3czF78ECJQ4Yb1DPXtMOOYwZchibDTSdlyDtvrRQiGYjtEs1mfbnXOaEm6O81YrY3tz9
         Ch2tso6Wt+mHTsPcmc8D/Gd+Qdf+2+sh6voSL/Y8vfnevbHb737qHzeBKul0lE/X9DVN
         U1vToegbxuDVL4xMNZeDzjR4uENEwFa1JaO59bITPBZx62vKbhrmC5OTBv6xx44fsCFs
         d+gjm5eBuF2erL+0H3ko5zIlLzdBcw22leurTGk+55scHWvrolRzqXgANPg2gHsTE+YW
         InZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=I/ZnzMpFblwaWryRS21SJ/GyazzhCSsArSdcbBdV5LQ=;
        b=rNAcsBgkqszCqfG1exLyRTl7Q4Z77w/BnmXFbyEqjx+pj8skg+aAumAIRRRQoIsycq
         v5Wz7pUwbM8efzxNZwzlcaj4zH8UZaJ6y72WNro7B1aJau+7jNaTZXrxsVgMZo7qgc+Y
         7Vb3uDP3H5cxMLsqnsMyMPQRwDV91e1DwYFcaU4xnqVFHYXzyo765aUaLtmv/cGuzruU
         pFgySsc1Pz5ySSMjE9/SceKIkin1NiUVnT859oTWpFPV75ZO+06A6eNGPynvYxH3uRdh
         Y2Vk5dNyZU98Yo8PI5NCVBm5vqfwn094GAHkc8yUqdkgdLYjg6RJmwJDnC/8j7pqqlyx
         L3Dg==
X-Gm-Message-State: AOAM5329OLUj1kUFPmiEliXYis/g748IGWOPXD3Pqthvq6DmkgOaTAHr
        s4XFc3dY+R1oVn+IYhBbRHldhA==
X-Google-Smtp-Source: ABdhPJwsjtbia2zRcFgxcthB6iDRW9n/DpQMSzL87iGZhXFNS7DLpTSgAV4OiMmIDfzMCuhg3ZKQyQ==
X-Received: by 2002:a05:6830:1653:: with SMTP id h19mr10617054otr.147.1600144917697;
        Mon, 14 Sep 2020 21:41:57 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
        by smtp.gmail.com with ESMTPSA id i23sm5843654oos.17.2020.09.14.21.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 21:41:56 -0700 (PDT)
Date:   Mon, 14 Sep 2020 23:41:54 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "Bao D. Nguyen" <nguyenb@codeaurora.org>
Cc:     cang@codeaurora.org, asutoshd@codeaurora.org,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Avri Altman <Avri.Altman@wdc.com>,
        Vinod Koul <vkoul@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] scsi: dt-bindings: ufs: Add vcc-voltage-level for
 UFS
Message-ID: <20200915044154.GB670377@yoga>
References: <cover.1598939393.git.nguyenb@codeaurora.org>
 <0a9d395dc38433501f9652a9236856d0ac840b77.1598939393.git.nguyenb@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a9d395dc38433501f9652a9236856d0ac840b77.1598939393.git.nguyenb@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 01 Sep 01:00 CDT 2020, Bao D. Nguyen wrote:

> UFS's specifications supports a range of Vcc operating
> voltage levels. Add documentation for the UFS's Vcc voltage
> levels setting.
> 
> Signed-off-by: Can Guo <cang@codeaurora.org>
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> index 415ccdd..7257b32 100644
> --- a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> +++ b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> @@ -23,6 +23,8 @@ Optional properties:
>                            with "phys" attribute, provides phandle to UFS PHY node
>  - vdd-hba-supply        : phandle to UFS host controller supply regulator node
>  - vcc-supply            : phandle to VCC supply regulator node
> +- vcc-voltage-level     : specifies voltage levels for VCC supply.
> +                          Should be specified in pairs (min, max), units uV.

What exactly are these pairs representing?

Is this supposed to be 3 pairs of (min,max) for vcc, vcc and vccq2 to be
passed into a regulator_set_voltage() for each regulator?

Or are these some sort of "operating points" for the vcc-supply?

Regards,
Bjorn

>  - vccq-supply           : phandle to VCCQ supply regulator node
>  - vccq2-supply          : phandle to VCCQ2 supply regulator node
>  - vcc-supply-1p8        : For embedded UFS devices, valid VCC range is 1.7-1.95V
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
