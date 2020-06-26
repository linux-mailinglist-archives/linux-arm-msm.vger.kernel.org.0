Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28C5D20AD63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2020 09:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728229AbgFZHi0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jun 2020 03:38:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725855AbgFZHiZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jun 2020 03:38:25 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30D26C08C5C1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2020 00:38:25 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id i4so4603413pjd.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2020 00:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=P3HL5+bSChK1YtwRIrhkmDTjksyjt+eZyM2LoDS34Jk=;
        b=rqkhCcfl7RyFVUyQ8T/iCG+2fY8N0dOORfCDXaN/rvOYsxyUu6yQee3gMM4g/dV/dt
         nviMPmNkvc0oOElLtWQktqpv5kMEEiYty4bXvj35yd48mLXzEXBSWPUdResExmMv1W5k
         khBNFBT65vXYfs+ZVVcwlN4/BjsPvJjXdxFlyV1wnoi1Yl9C2JnVrV0Oq3pdxR2bS/4c
         IAPSVtwOeF1DwLzqP8aCnhzVZSWifQYTr2D7Yf495A0OqPD0NBnYb7h7iD64JRrdUHci
         MmhDKi8c/NXpEbnwRD9Zn7ifZSGMxTlc3GxdsNwPVbPGQNHPpEApGWQ6EijzY/dIhEo1
         DHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P3HL5+bSChK1YtwRIrhkmDTjksyjt+eZyM2LoDS34Jk=;
        b=mTcRb1X1FqhwekUOdynv/Q9GwS53A+CJL/1QpyuYaCKajyYBiZntHzEIhbtnSmwZWR
         tZWqR4rUZCwxElVLVApAt3E7+zs/e+2B9g7JMmkqZDXi8QjXzNQcIW8scwNLoy7V/h+Z
         YSq/F92UoEmt/zEHL8eIqWa9vmIAbEe3hLSOpXAHYrBKVWXlxAKp4eSFu2hJe02Ya2Zn
         dPgDWxqF4MeCsEUJMMV/NplDQICZjI7yAzHZ5XOA7M2kSUDuzsqQYT5Jh8tOb/gVQwty
         3vM8FnfsatyfztedagP55NqWg6djLwOJa3FoDNAm1Q8/V+tbyIIWjQ+YbTd41ETHAwl/
         HHtw==
X-Gm-Message-State: AOAM533utTd7WKjs0fxiVu4TGLm4YtCS8D7jmYNkYye+31JQ01EinKnv
        uS3NHMe08AjP37he0B2aoWaD5g==
X-Google-Smtp-Source: ABdhPJwwl2YCNeE48VOOQP8qv+DejczBn8DQaqwRxififM6P2ju4Tw8qxSjRPjolft1L+6F+QSuqOA==
X-Received: by 2002:a17:90a:39ce:: with SMTP id k14mr2010039pjf.39.1593157104483;
        Fri, 26 Jun 2020 00:38:24 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q16sm25071934pfg.49.2020.06.26.00.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:38:23 -0700 (PDT)
Date:   Fri, 26 Jun 2020 00:35:45 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        "open list:GENERIC PHY FRAMEWORK" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] phy: qcom-qmp: Allow different values for second lane
Message-ID: <20200626073545.GE388985@builder.lan>
References: <20200524021416.17049-1-jonathan@marek.ca>
 <20200524021416.17049-2-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200524021416.17049-2-jonathan@marek.ca>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 23 May 19:14 PDT 2020, Jonathan Marek wrote:

> The primary USB PHY on sm8250 sets some values differently for the second
> lane. This makes it possible to represent that.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 52 ++++++++++++++++++++++-------
>  1 file changed, 40 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index e91040af3394..b3e07afca3ca 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -82,20 +82,34 @@ struct qmp_phy_init_tbl {
>  	 * register part of layout ?
>  	 * if yes, then offset gives index in the reg-layout
>  	 */
> -	int in_layout;
> +	bool in_layout;
> +	/*
> +	 * mask of lanes for which this register is written
> +	 * for cases when second lane needs different values
> +	 */
> +	u8 lane_mask;
>  };
>  
>  #define QMP_PHY_INIT_CFG(o, v)		\
>  	{				\
>  		.offset = o,		\
>  		.val = v,		\
> +		.lane_mask = 0xff,	\
>  	}
>  
>  #define QMP_PHY_INIT_CFG_L(o, v)	\
>  	{				\
>  		.offset = o,		\
>  		.val = v,		\
> -		.in_layout = 1,		\
> +		.in_layout = true,	\
> +		.lane_mask = 0xff,	\
> +	}
> +
> +#define QMP_PHY_INIT_CFG_LANE(o, v, l)	\
> +	{				\
> +		.offset = o,		\
> +		.val = v,		\
> +		.lane_mask = l,		\
>  	}
>  
>  /* set of registers with offsets different per-PHY */
> @@ -1986,10 +2000,11 @@ static const struct qmp_phy_cfg sm8150_usb3phy_cfg = {
>  	.is_dual_lane_phy	= true,
>  };
>  
> -static void qcom_qmp_phy_configure(void __iomem *base,
> -				   const unsigned int *regs,
> -				   const struct qmp_phy_init_tbl tbl[],
> -				   int num)
> +static void qcom_qmp_phy_configure_lane(void __iomem *base,
> +					const unsigned int *regs,
> +					const struct qmp_phy_init_tbl tbl[],
> +					int num,
> +					u8 lane_mask)
>  {
>  	int i;
>  	const struct qmp_phy_init_tbl *t = tbl;
> @@ -1998,6 +2013,9 @@ static void qcom_qmp_phy_configure(void __iomem *base,
>  		return;
>  
>  	for (i = 0; i < num; i++, t++) {
> +		if (!(t->lane_mask & lane_mask))
> +			continue;
> +
>  		if (t->in_layout)
>  			writel(t->val, base + regs[t->offset]);
>  		else
> @@ -2005,6 +2023,14 @@ static void qcom_qmp_phy_configure(void __iomem *base,
>  	}
>  }
>  
> +static void qcom_qmp_phy_configure(void __iomem *base,
> +				   const unsigned int *regs,
> +				   const struct qmp_phy_init_tbl tbl[],
> +				   int num)
> +{
> +	qcom_qmp_phy_configure_lane(base, regs, tbl, num, 0xff);
> +}
> +
>  static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
>  {
>  	struct qcom_qmp *qmp = qphy->qmp;
> @@ -2219,16 +2245,18 @@ static int qcom_qmp_phy_enable(struct phy *phy)
>  	}
>  
>  	/* Tx, Rx, and PCS configurations */
> -	qcom_qmp_phy_configure(tx, cfg->regs, cfg->tx_tbl, cfg->tx_tbl_num);
> +	qcom_qmp_phy_configure_lane(tx, cfg->regs,
> +				    cfg->tx_tbl, cfg->tx_tbl_num, 1);

Please ignore the 80-char suggestion and keep this on one line.

With that...
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

>  	/* Configuration for other LANE for USB-DP combo PHY */
>  	if (cfg->is_dual_lane_phy)
> -		qcom_qmp_phy_configure(qphy->tx2, cfg->regs,
> -				       cfg->tx_tbl, cfg->tx_tbl_num);
> +		qcom_qmp_phy_configure_lane(qphy->tx2, cfg->regs,
> +					    cfg->tx_tbl, cfg->tx_tbl_num, 2);
>  
> -	qcom_qmp_phy_configure(rx, cfg->regs, cfg->rx_tbl, cfg->rx_tbl_num);
> +	qcom_qmp_phy_configure_lane(rx, cfg->regs,
> +				    cfg->rx_tbl, cfg->rx_tbl_num, 1);
>  	if (cfg->is_dual_lane_phy)
> -		qcom_qmp_phy_configure(qphy->rx2, cfg->regs,
> -				       cfg->rx_tbl, cfg->rx_tbl_num);
> +		qcom_qmp_phy_configure_lane(qphy->rx2, cfg->regs,
> +					    cfg->rx_tbl, cfg->rx_tbl_num, 2);
>  
>  	qcom_qmp_phy_configure(pcs, cfg->regs, cfg->pcs_tbl, cfg->pcs_tbl_num);
>  	ret = reset_control_deassert(qmp->ufs_reset);
> -- 
> 2.26.1
> 
