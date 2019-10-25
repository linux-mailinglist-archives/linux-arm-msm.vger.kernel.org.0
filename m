Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 110D2E4E52
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2019 16:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503000AbfJYOGf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Oct 2019 10:06:35 -0400
Received: from mail-yb1-f193.google.com ([209.85.219.193]:39709 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407355AbfJYOGe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Oct 2019 10:06:34 -0400
Received: by mail-yb1-f193.google.com with SMTP id e9so889598ybp.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2019 07:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9hV5nwXUEgXhwQ5IosopcGJTF2NHW7/vTGTmNW9G34I=;
        b=VifDnRc70NasJQuNqZ6GKXuHy+pog7Il9EYThxh46rlyggmTevIjVlWWW3BDI7BX8/
         wlYX5LkB0paoZC1KPIFgth+U25Pfzy2Dk+RpUyeGJsnhZnPg79LzGQqXe2KkzPXYRghH
         NqFkRvxXEQKju+Q6MFIb/wZkpDCWXgdNX0WvFHPXl+Hr4DgxgainAF6JcS6oBo3xgcg/
         vxUQBHZLFuS1+XqP0ChE2d7qlZoP4D5ficQilafhQ6deH/GmdCOz6+L4Zegsbr44ierq
         DMjOgUz0FWpLxwy3K8HlVU/BmUkx5ZqxIJDa/FJiJPTiMLvUlBUumiRmSBCIcGZa9FGd
         g7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9hV5nwXUEgXhwQ5IosopcGJTF2NHW7/vTGTmNW9G34I=;
        b=eF9uhKfqYm2T4oLAKXs3LH985k6pqlfqNxow++b3Huk0VnEqQxEWXJt1mtgsK/7Fdc
         HsAME/PMWwp5MVPYshxy5+srBFYUCsaoHpnD0NqHivMgtWs4flOH+yHxziny/SCody2b
         6ghzzZSlZ7L33RM6QEw+MUlR3Gjz0uR62XLFAm/biOkxkLc5GV2eNA3NwI5Nmj6yd8xv
         YvpLoHi0Zau+EyfxHq9oke58AWmEu/g6cf9oDKGnilYYan6HINEmBc98u/n1fWOhh5IJ
         g6C6eRFk9HZF0EQ3FxuyCtNJd+J/SWJIQHEAiTvg12i/SnCHKUV9w3SSpNnZbJieydNL
         8oXg==
X-Gm-Message-State: APjAAAULfrnk9zU4wt0erjnXfD208P/hEJGE5dox31XuScwo8gvNjjhP
        xjO8oCKWjy0WEwYTyrOTQSn7fA==
X-Google-Smtp-Source: APXvYqx7fYQnCFaQaxuLFh4DK2xG1DIqcPQZX3c4Cb03ut+f4/rVew1nspg17lq1TCTJePaSNg3xIQ==
X-Received: by 2002:a25:7611:: with SMTP id r17mr3361276ybc.399.1572012393139;
        Fri, 25 Oct 2019 07:06:33 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id b201sm710130ywe.2.2019.10.25.07.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 07:06:32 -0700 (PDT)
Date:   Fri, 25 Oct 2019 10:06:32 -0400
From:   Sean Paul <sean@poorly.run>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Hai Li <hali@codeaurora.org>, David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        Nikita Travkin <nikitos.tr@gmail.com>,
        freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dsi: Implement qcom,
 dsi-phy-regulator-ldo-mode for 28nm PHY
Message-ID: <20191025140632.GH85762@art_vandelay>
References: <20191023165617.28738-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191023165617.28738-1-stephan@gerhold.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 23, 2019 at 06:56:17PM +0200, Stephan Gerhold wrote:
> The DSI PHY regulator supports two regulator modes: LDO and DCDC.
> This mode can be selected using the "qcom,dsi-phy-regulator-ldo-mode"
> device tree property.
> 
> However, at the moment only the 20nm PHY driver actually implements
> that option. Add a check in the 28nm PHY driver to program the
> registers correctly for LDO mode.
> 
> Tested-by: Nikita Travkin <nikitos.tr@gmail.com> # l8150
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Thanks for your patch! I've pushed it to msm-next.

Sean

> ---
> Changes in v2: Move DCDC/LDO code into separate methods
> v1: https://lore.kernel.org/linux-arm-msm/20191021163425.83697-1-stephan@gerhold.net/
> 
> This is needed to make the display work on Longcheer L8150,
> which has recently gained mainline support in:
> https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?id=16e8e8072108426029f0c16dff7fbe77fae3df8f
> 
> This patch is based on code from the downstream kernel:
> https://source.codeaurora.org/quic/la/kernel/msm-3.10/tree/drivers/video/msm/mdss/msm_mdss_io_8974.c?h=LA.BR.1.2.9.1-02310-8x16.0#n152
> 
> The LDO regulator configuration is taken from msm8916-qrd.dtsi:
> https://source.codeaurora.org/quic/la/kernel/msm-3.10/tree/arch/arm/boot/dts/qcom/msm8916-qrd.dtsi?h=LA.BR.1.2.9.1-02310-8x16.0#n56
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 42 +++++++++++++++++-----
>  1 file changed, 34 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> index b3f678f6c2aa..b384ea20f359 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> @@ -39,15 +39,10 @@ static void dsi_28nm_dphy_set_timing(struct msm_dsi_phy *phy,
>  		DSI_28nm_PHY_TIMING_CTRL_11_TRIG3_CMD(0));
>  }
>  
> -static void dsi_28nm_phy_regulator_ctrl(struct msm_dsi_phy *phy, bool enable)
> +static void dsi_28nm_phy_regulator_enable_dcdc(struct msm_dsi_phy *phy)
>  {
>  	void __iomem *base = phy->reg_base;
>  
> -	if (!enable) {
> -		dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CAL_PWR_CFG, 0);
> -		return;
> -	}
> -
>  	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_0, 0x0);
>  	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CAL_PWR_CFG, 1);
>  	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_5, 0);
> @@ -56,6 +51,39 @@ static void dsi_28nm_phy_regulator_ctrl(struct msm_dsi_phy *phy, bool enable)
>  	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_1, 0x9);
>  	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_0, 0x7);
>  	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_4, 0x20);
> +	dsi_phy_write(phy->base + REG_DSI_28nm_PHY_LDO_CNTRL, 0x00);
> +}
> +
> +static void dsi_28nm_phy_regulator_enable_ldo(struct msm_dsi_phy *phy)
> +{
> +	void __iomem *base = phy->reg_base;
> +
> +	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_0, 0x0);
> +	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CAL_PWR_CFG, 0);
> +	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_5, 0x7);
> +	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_3, 0);
> +	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_2, 0x1);
> +	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_1, 0x1);
> +	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_4, 0x20);
> +
> +	if (phy->cfg->type == MSM_DSI_PHY_28NM_LP)
> +		dsi_phy_write(phy->base + REG_DSI_28nm_PHY_LDO_CNTRL, 0x05);
> +	else
> +		dsi_phy_write(phy->base + REG_DSI_28nm_PHY_LDO_CNTRL, 0x0d);
> +}
> +
> +static void dsi_28nm_phy_regulator_ctrl(struct msm_dsi_phy *phy, bool enable)
> +{
> +	if (!enable) {
> +		dsi_phy_write(phy->reg_base +
> +			      REG_DSI_28nm_PHY_REGULATOR_CAL_PWR_CFG, 0);
> +		return;
> +	}
> +
> +	if (phy->regulator_ldo_mode)
> +		dsi_28nm_phy_regulator_enable_ldo(phy);
> +	else
> +		dsi_28nm_phy_regulator_enable_dcdc(phy);
>  }
>  
>  static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
> @@ -77,8 +105,6 @@ static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
>  
>  	dsi_28nm_phy_regulator_ctrl(phy, true);
>  
> -	dsi_phy_write(base + REG_DSI_28nm_PHY_LDO_CNTRL, 0x00);
> -
>  	dsi_28nm_dphy_set_timing(phy, timing);
>  
>  	dsi_phy_write(base + REG_DSI_28nm_PHY_CTRL_1, 0x00);
> -- 
> 2.23.0
> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
Sean Paul, Software Engineer, Google / Chromium OS
