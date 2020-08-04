Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06DE523B4C6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Aug 2020 08:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728119AbgHDGFJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Aug 2020 02:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726797AbgHDGFJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Aug 2020 02:05:09 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2078AC06174A
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2020 23:05:09 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id t6so1416735pjr.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2020 23:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=29RX8bXAuW3G0jtpg7c07xftgd6wAAyG9UIW4GkKkEE=;
        b=KkLn8YU63zAqqKEqBxzj8VgPytKimcuOSG62fWGwsmSKCplvu+pSTTOhZlnhVMl0x2
         3FYwjL8gJehForcHWlq53ixj/peur2dmTjDXxvGpprq/z9uGcT9NW+RPBItW2ty2zn/K
         d1RmHMauflrekOsAZtkgMo1WTH+sipmLGpIRHev75H610NRRiIKqTSflqwJMNs5EdOEo
         yVNc7LotapWaHklZdxCIuObQmNZACw5oxP064/kWiY2fQ/4pM/Qg4J3MGQzUw5WmvXAY
         juJEJRrK2ZUtHjWDdwwzejVi9+HpL/jSNxmCxVrhrRlg/ok2iR167hKTGZZwo6ac/1HH
         JjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=29RX8bXAuW3G0jtpg7c07xftgd6wAAyG9UIW4GkKkEE=;
        b=EgDj/NQdKQ5B2MsoG6uB/MJuLQb+CZpsMmiRiEBs7Plqo8E8AEA4ht9/Lz/CqFYuTT
         64Y1SO1mFeIRS+UyWkQvJGMTyGd1Kpb7nN9DRoXp1c+5G3irfUl0kmmrUa61fPVD/IWA
         i4lMH8nDmtU8I8l10PNN5BOpoSo+FJmg5IpKt7mZBhWgznIXq/XI73RNt0siRwMoi3rp
         wBB/kTwEYyD4tr5eWxp0ZLno6Nhwib9lEM3n1PUocNwq9qaJXx7A90LuRoTVUMiEQLKG
         LxBL7jFuM62QVhAXkWAg+71PHg2iWjfh+uvkQmqfMl386fXc5zR/zhNQ2q8beoNxSRRP
         rxIw==
X-Gm-Message-State: AOAM533RtB6Qlslp3Bbg9FzGinXT1OU7d7wnnYRCfZTQpjTV+bVMbAhQ
        pD7ynXJEjcplkvHJZHaBb5mDcQ==
X-Google-Smtp-Source: ABdhPJwLL5n6gEYWYzbVJtSX2UtSyopSxs/VQFcZUH1Ttai8mPQYDOSqhsn/4gxSrBnvlERUgZaFkw==
X-Received: by 2002:a17:902:221:: with SMTP id 30mr18452271plc.222.1596521108530;
        Mon, 03 Aug 2020 23:05:08 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id n26sm16606191pgl.42.2020.08.03.23.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 23:05:07 -0700 (PDT)
Date:   Mon, 3 Aug 2020 23:05:05 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Cc:     agross@kernel.org, kishon@ti.com, vkoul@kernel.org,
        dovl@codeaurora.org, ygardi@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        tianjia.zhang@alibaba.com
Subject: Re: [PATCH] phy: qcom-ufs: Fix wrong return value in
 ufs_qcom_phy_calibrate()
Message-ID: <20200804060505.GJ61202@yoga>
References: <20200802111546.5611-1-tianjia.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200802111546.5611-1-tianjia.zhang@linux.alibaba.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 02 Aug 04:15 PDT 2020, Tianjia Zhang wrote:

> On an error exit path, a negative error code should be returned
> instead of a positive return value.
> 
> Fixes: adaafaa393ef1 ("phy: qcom-ufs: add support for QUALCOMM Technologies UFS PHY drivers")
> Cc: Yaniv Gardi <ygardi@codeaurora.org>
> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>

Thanks for your patch Tianjia.

The support provided by this driver was added to phy-qcom-qmp.c a while
back and in what's will become 5.9 the phy-qcom-ufs.c driver is removed.
So your change is unfortunately no longer needed.

Regards,
Bjorn

> ---
>  drivers/phy/qualcomm/phy-qcom-ufs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-ufs.c b/drivers/phy/qualcomm/phy-qcom-ufs.c
> index 763c8d396af1..49d47dc5bfd4 100644
> --- a/drivers/phy/qualcomm/phy-qcom-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-ufs.c
> @@ -24,7 +24,7 @@ int ufs_qcom_phy_calibrate(struct ufs_qcom_phy *ufs_qcom_phy,
>  
>  	if (!tbl_A) {
>  		dev_err(ufs_qcom_phy->dev, "%s: tbl_A is NULL", __func__);
> -		ret = EINVAL;
> +		ret = -EINVAL;
>  		goto out;
>  	}
>  
> @@ -42,7 +42,7 @@ int ufs_qcom_phy_calibrate(struct ufs_qcom_phy *ufs_qcom_phy,
>  		if (!tbl_B) {
>  			dev_err(ufs_qcom_phy->dev, "%s: tbl_B is NULL",
>  				__func__);
> -			ret = EINVAL;
> +			ret = -EINVAL;
>  			goto out;
>  		}
>  
> -- 
> 2.26.2
> 
