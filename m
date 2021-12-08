Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62D0146CCDC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 06:15:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231325AbhLHFSg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 00:18:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231293AbhLHFSf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 00:18:35 -0500
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61227C061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Dec 2021 21:15:04 -0800 (PST)
Received: by mail-oo1-xc35.google.com with SMTP id w15-20020a4a9d0f000000b002c5cfa80e84so456396ooj.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Dec 2021 21:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dfMISllvOyWeVC+M/Lt3oKRlwVYRNEKwNNcO13cHMrM=;
        b=w7gbnGzi2TRt1kl7Ye3Z2EYtK7pcvLy3h8DtGE8yu71lLVdrLfLjnLhs/ofVGC+wQL
         aDFSUtexED6u1bVPnz7CGBIKKivW/u6/EftnTLM3i7mJ+DD0ioOaN878DbmMICsMcPbc
         MkrTq6tpeW+Amee4Kyzlxe767YdqHvGBQ/m1RsOjfmvD6mtyN9FSoXM+T/lB279emjKg
         cmWvPCc2/6dN2JbeRPzeNHFYeG/eGbVp2RObbNHxRTfUriUSYIuIg3p636d3YtzWe2Pq
         k6Tn5JSy8N3Gg81/7SncEQj+p+tgAF/ob/2rRwdAsR5unY1ltFqgzSyQpST/4s4o8g78
         u1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dfMISllvOyWeVC+M/Lt3oKRlwVYRNEKwNNcO13cHMrM=;
        b=WDLe2K2s6SkPIeDJBjAzIP+a4+3EitLaWHZbUoqlC+9G0K7j5eahQfVbuzktvsdlmY
         xMaRiJqMemsgAM0vvHhmDH5BulS0YQH5O/3+1Jc3PqOHPhFzMOr/PwfWoONa80EWNWTa
         AMnNjtZsmKvApj/lCYs63i4bRi8F9l+etLv9podQkTqJZHPl7LnnYa7UiK4h+9zF2i6D
         UP2BxLOd5NFgew6efvbpEZjWD4cKS+QQTHPqGBacu97VFXcqJvg3aZWjbcAuKxl1ocGP
         l9r0Y95qOV/l5rvE2tP0nIOyUcw071LGKT+2HZZskG8z4yn9FLybmU0PpyFSrS5NudzE
         SOgA==
X-Gm-Message-State: AOAM533ZTAJBR2VeEQ0GkV16ynXVm0K2cSzdJ8eTwlnpedTAXztbOIfB
        bX0hs2+nH72sdu3/8FkESJs2GQ==
X-Google-Smtp-Source: ABdhPJyWLHJDdtX55Elxz47dPEkRUd9l59nFSHL4yGwZIVmqFg4uYvT1tdiVUtNZ8gwkJ4vASweeIQ==
X-Received: by 2002:a4a:300f:: with SMTP id q15mr13770211oof.36.1638940503654;
        Tue, 07 Dec 2021 21:15:03 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c9sm389389oog.43.2021.12.07.21.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 21:15:03 -0800 (PST)
Date:   Tue, 7 Dec 2021 21:16:27 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     davidcomponentone@gmail.com
Cc:     agross@kernel.org, kishon@ti.com, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>,
        Yang Guang <yang.guang5@zte.com.cn>
Subject: Re: [PATCH] pyh: qcom: fix the application of sizeof to pointer
Message-ID: <YbA/q+dYoIh5qdbb@ripper>
References: <c74d05d5197fa4fba96c4bd1cd597cd644c694b6.1638924754.git.davidcomponentone@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c74d05d5197fa4fba96c4bd1cd597cd644c694b6.1638924754.git.davidcomponentone@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 07 Dec 17:03 PST 2021, davidcomponentone@gmail.com wrote:

> From: David Yang <davidcomponentone@gmail.com>
> 
> The coccinelle check report:
> ./drivers/phy/qualcomm/phy-qcom-edp.c:574:31-37:
> ERROR: application of sizeof to pointer
> 
> Using the real size to fix it.
> 

Thanks for the fix David.

Please see my answer here
https://lore.kernel.org/all/Ya96KOynsO478cVx@ripper/

Regards,
Bjorn

> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Yang Guang <yang.guang5@zte.com.cn>
> Signed-off-by: David Yang <davidcomponentone@gmail.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index 17d5653b661d..5fe4eab9cac1 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -571,7 +571,7 @@ static int qcom_edp_clks_register(struct qcom_edp *edp, struct device_node *np)
>  	struct clk_init_data init = { };
>  	int ret;
>  
> -	data = devm_kzalloc(edp->dev, sizeof(data), GFP_KERNEL);
> +	data = devm_kzalloc(edp->dev, sizeof(*data), GFP_KERNEL);
>  	if (!data)
>  		return -ENOMEM;
>  
> -- 
> 2.30.2
> 
