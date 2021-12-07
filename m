Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3A6C46BEF5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Dec 2021 16:13:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbhLGPPu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Dec 2021 10:15:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbhLGPPu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Dec 2021 10:15:50 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C62D8C061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Dec 2021 07:12:19 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id 35-20020a9d08a6000000b00579cd5e605eso18539602otf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Dec 2021 07:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2dXIPzvKXL/0XHAniN5ixw9zTONENlVQpVmdzuJjKmg=;
        b=rqU6GY5ntjRkYqXxOUSIWtDihVOINk3LhHZh43bwBMPNnuJ3WuC+aS1nRzh0ORm/Vb
         kaz/s2ej/8hT7+HIg19Sxq5L3xLusJw0wLSbk5pL+Ll8dEQJXeYJaxjB1oWQ2M+EgEOM
         ivUnFPCiueTJuEmJBD7hp26Dq83JGSVwQAdEu1acZrPKzcO65JHZ1gLnzZfo17bxoSKr
         XmduCeztcCSVNYJUcZC5f5cwpt74s7uEVrvHh1KKy0TmtOrUWqwgIgb4N89rqQkhnJ9P
         RwXVSLG4jOLPWu4XIspwgblYuMZb+Dg6HSsaOHa6KX+S+cjp5rYWExUluuWuD2Dfet4G
         BU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2dXIPzvKXL/0XHAniN5ixw9zTONENlVQpVmdzuJjKmg=;
        b=iiRoCOP22sUV1paBbICXVbqbLKFGapYHdwAIdoHPTwjyPH7qO6tKA+LKApP2bz/dty
         GuidhUNO+C97IMKhoqFMSRGQ8ylcUY6Azcv2VUi6Poy2DuMrFeWRAxaGaBMF+YcMC9+w
         mLm+hVMHtm4gpdHh8wmLZVibk3j6onBwK4rReAdVmqnlY5YgXeTT5t/UgnQFhcpE5Au2
         3+eW1XPod02tBnNzp+7r6DLU9yP22fC1izOSwJ4XPc5/2/R+krx4MO0XzjPLfstwaUSx
         yNZH9GdhQ9L4ZhNEfUWlIsuZcKrayFCsPdpnzgyBd0k3r9STBXzzctNTPBLY/j7BJ+py
         1JLA==
X-Gm-Message-State: AOAM5318+mMM70rW7LewiVsjV7X4SOU32eM6XJ4UQXc+iVTiEw0YTd7i
        5WF9W4vQ/F0IwJzp7y5DfDE5sg==
X-Google-Smtp-Source: ABdhPJxGDA5E1j8PGQLhg8Ah1uL+m+DMGpdwG4j76U73RL7cKyHVJyW8WuUHtQstdKAqDQV0LdXopw==
X-Received: by 2002:a9d:4d0f:: with SMTP id n15mr35888387otf.125.1638889939138;
        Tue, 07 Dec 2021 07:12:19 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q9sm2779689oti.32.2021.12.07.07.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 07:12:18 -0800 (PST)
Date:   Tue, 7 Dec 2021 07:13:44 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Guo Zhengkui <guozhengkui@vivo.com>
Cc:     Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>, kernel@vivo.com
Subject: Re: [PATCH] phy: qcom: fix bug: application of sizeof to pointer
Message-ID: <Ya96KOynsO478cVx@ripper>
References: <20211207131642.5313-1-guozhengkui@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211207131642.5313-1-guozhengkui@vivo.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 07 Dec 05:16 PST 2021, Guo Zhengkui wrote:

> Fix following coccicheck error:
> ./drivers/phy/qualcomm/phy-qcom-edp.c:574:31-37:
> ERROR: application of sizeof to pointer.
> 
> Use sizeof(*data) instead.
> 
> Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
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

Ouch, thanks for catching that!

But the clk_hw_onecell_data actually has a variable size array at the
end and as you can see further down I store 2 items in that array.

So that sizeof should be struct_size(data, hws, 2)

Would you be willing to update your patch with that?

And please add:
Fixes: f199223cb490 ("phy: qcom: Introduce new eDP PHY driver")

Regards,
Bjorn

>  	if (!data)
>  		return -ENOMEM;
>  
> -- 
> 2.20.1
> 
