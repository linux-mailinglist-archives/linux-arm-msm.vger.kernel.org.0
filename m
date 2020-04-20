Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC96C1B00D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 06:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725825AbgDTEwm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 00:52:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgDTEwm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 00:52:42 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 147C5C061A0F
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2020 21:52:41 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id y25so4378603pfn.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2020 21:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oNKRiUuDH3HcT8/Qwk9sSK+q6T3XdbwZxPtum7dk+0k=;
        b=llneVi56W55NiLr4/oEdHvQsx+uYbkRQzHPT7RXrZNrdWl4RLJewuv+rVJiKFrxkY4
         nmoFjBHPPeFNYEhI0kfaqgQBF6znWdA/EnlSHtnOx4AclT+kIaTuWS5tm4iSecLCnJ2R
         dooRwMKfMVWt3HMIgWpLAcKKHUSvFmDPybPwq4jo9AkyuK8Dnd4CBBSVaOkqsH7FwfLR
         s0D/bjS8qTOYDnSracP58KpC0hBcOwJYF3kbiuPScSMwMAdeyIIRIryN1guKVbLzk3eE
         1Rl9U9+MmfT//SMqV+TPzyfgxNh7I+SU//n/RgeKQLzsejwKAlcB3D8JTWza3p0o0Svh
         WsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oNKRiUuDH3HcT8/Qwk9sSK+q6T3XdbwZxPtum7dk+0k=;
        b=X/VYirRIT7Pdb8M/rq+k6nhP6Csmrg7U4m3Fjok+YucgmwfzQwCM16GLBbhgXsHNZW
         kMKCYVamCPZtcs8vJwYBABOsoTKHhTvgeR4rSrHC89PAgd+PqwksEWAD6hGkgXEul+Ch
         lm/F/ihMpX2AyPXxtG5l4TmsZ0mSk/H9+QIRg2HsoeFIf8RH6JizeQshHU1605ivTzg6
         kdz5MSsLsNFntNk/ps8bQOUhqGTSL3J9emxnYoPEd1EyanAemnzyaBiS0gxIcsK6A8aQ
         5WKRFA9U6hXdw+Mt3ubdFBmWu0WotI9/rcIgOxAk77EKQvrQYLTbqqaFqTu5voWxwB6D
         SYXA==
X-Gm-Message-State: AGi0PuYMOM2zUvO5o2tIT/kzaI23YX/3rpPJZb5Lf4lfn9oCWrlHf/1J
        X21C55A+h1Y3bRMLxShQ1Vok6A==
X-Google-Smtp-Source: APiQypL47lTKmGwxOxVtKUAf13H57l0+QHnxWnUbjOkYcpSlzaMu1RjcsaR+CpdIXKiQMYpYBNys4A==
X-Received: by 2002:a63:514a:: with SMTP id r10mr12687721pgl.246.1587358360091;
        Sun, 19 Apr 2020 21:52:40 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e26sm25908782pfi.84.2020.04.19.21.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 21:52:39 -0700 (PDT)
Date:   Sun, 19 Apr 2020 21:52:37 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Tang Bin <tangbin@cmss.chinamobile.com>
Cc:     joro@8bytes.org, agross@kernel.org, robdclark@gmail.com,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2]iommu/qcom:fix local_base status check
Message-ID: <20200420045237.GH987656@yoga>
References: <20200418134703.1760-1-tangbin@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200418134703.1760-1-tangbin@cmss.chinamobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 18 Apr 06:47 PDT 2020, Tang Bin wrote:

> The function qcom_iommu_device_probe() does not perform sufficient
> error checking after executing devm_ioremap_resource(), which can
> result in crashes if a critical error path is encountered.
> 

Thanks, that's much better.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Fixes: 0ae349a0f33f ("iommu/qcom: Add qcom_iommu")
> 
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
> v2:
>  - fix commit message and add fixed tag
> ---
>  drivers/iommu/qcom_iommu.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
> index 4328da0b0..b160cf140 100644
> --- a/drivers/iommu/qcom_iommu.c
> +++ b/drivers/iommu/qcom_iommu.c
> @@ -813,8 +813,11 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
>  	qcom_iommu->dev = dev;
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (res)
> +	if (res) {
>  		qcom_iommu->local_base = devm_ioremap_resource(dev, res);
> +		if (IS_ERR(qcom_iommu->local_base))
> +			return PTR_ERR(qcom_iommu->local_base);
> +	}
>  
>  	qcom_iommu->iface_clk = devm_clk_get(dev, "iface");
>  	if (IS_ERR(qcom_iommu->iface_clk)) {
> -- 
> 2.20.1.windows.1
> 
> 
> 
