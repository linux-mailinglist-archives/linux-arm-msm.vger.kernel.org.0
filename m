Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1846749A83D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jan 2022 05:08:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S3415847AbiAYDAy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jan 2022 22:00:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S3416597AbiAYCEW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jan 2022 21:04:22 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4A1BC055A87
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jan 2022 17:56:50 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id e9so2346590ljq.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jan 2022 17:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Vl7zRt7CzWsP5dsK8jjPyozz1f+nDjiiAEcQBupI+gg=;
        b=n9wQmxV93FBjl1p6UWAnsR/Rp4I78wtTrlfGHx2HeDJvo28sEJ3Ui/yv/jSLo4OkTG
         itA+Z96FdTg7IqxtkVMyEUrAn80XGgC428mPsYkUzqOljwTg6O8NJ+iyMdieCWRi1nu9
         sh4JrOqePDuMC+5iw0mOkb2LuYDCSJgzjiQllRYSTB5bk8coihMSwkqQibGyeJm5h8C6
         5E0nkFOjRLe3vSC+lKGnA98V0sj51CEJ7yFiI9AqYgG50MwMhT7TrGZhHHRuAkswRbv+
         0TSMJAnk9PBntohIujBiATwlDwISz5tX0ggyfMVBmcFHJW0zFNrq4djqIjZZ5fb9dI1+
         Mydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Vl7zRt7CzWsP5dsK8jjPyozz1f+nDjiiAEcQBupI+gg=;
        b=8FvFh6dNJ0DlT5AomlLOCPUB/2tl4WwKQZg21d8dn9YytMN4+ZWYSJvqlDlPSZhUyC
         9pjK3dndVx07Ct+Nr29onr9CdiRWry3t4Ma8mCxtK7/U9hcBf9z3eA/2IYBv9puktXC9
         XNomCBN19PI4sf7T47tG1QGrc+edaiqK9RKjElcR3YMUoeGNOodfJJBAYS98D1VN54tB
         lOFw1XiA+1qTUmWYU1Gv1PlQmvFyqRBED0AlCFREF+xCTU1IbhhaAcEf9RVIaQ+mF+un
         xe0855vcXPoOdWz8AbnnvGEUvCnfYOO2xz8+oyBIgAK/6mWihFwEKNAug4+dKniDG7DG
         SnqQ==
X-Gm-Message-State: AOAM531bqhOV9MHc81oYujDwVhhtSOoj5CzOvmeA35e+iOB15h6nk1Et
        ajk5Z8H7rC3uvwyGVicMdLSZLA==
X-Google-Smtp-Source: ABdhPJyGoLMRs00RgcJNojAwWsrQUnnYJ9BDZG0uXkgal8iXcUoDVBKfNsOhG8xLGfNq7k8uCISjgw==
X-Received: by 2002:a2e:8551:: with SMTP id u17mr3356586ljj.35.1643075809221;
        Mon, 24 Jan 2022 17:56:49 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w16sm474939ljg.14.2022.01.24.17.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jan 2022 17:56:48 -0800 (PST)
Message-ID: <e3ef9c30-ffc2-b7c1-a361-09a6d35da03d@linaro.org>
Date:   Tue, 25 Jan 2022 04:56:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [v3 2/3] drm/msm/dsi: Add dsi phy tuning configuration support
Content-Language: en-GB
To:     Rajeev Nandan <quic_rajeevny@quicinc.com>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, sean@poorly.run, robdclark@gmail.com,
        robh+dt@kernel.org, robh@kernel.org, quic_abhinavk@quicinc.com,
        quic_kalyant@quicinc.com, quic_mkrishn@quicinc.com,
        jonathan@marek.ca, airlied@linux.ie, daniel@ffwll.ch,
        swboyd@chromium.org
References: <1642538320-1127-1-git-send-email-quic_rajeevny@quicinc.com>
 <1642538320-1127-3-git-send-email-quic_rajeevny@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1642538320-1127-3-git-send-email-quic_rajeevny@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/01/2022 23:38, Rajeev Nandan wrote:
> Add support for MSM DSI PHY tuning configuration. Current design is
> to support drive strength and drive level/amplitude tuning for
> 10nm PHY version, but this can be extended to other PHY versions.
> 
> Signed-off-by: Rajeev Nandan <quic_rajeevny@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> 
> Changes in v2:
>   - New.
>   - Split into generic code and 10nm-specific part (Dmitry Baryshkov)
> 
> Changes in v3:
>   - s/ops.tuning_cfg_init/ops.parse_dt_properties
>     To parse phy version specific DT properties (Dmitry Baryshkov)
>   - Address comments for phy tuning data structure (Dmitry Baryshkov)
> 
> 
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 6 ++++++
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h | 4 ++++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 8c65ef6..fcbca76 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -739,6 +739,12 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> +	if (phy->cfg->ops.parse_dt_properties) {
> +		ret = phy->cfg->ops.parse_dt_properties(phy);
> +		if (ret)
> +			goto fail;
> +	}
> +
>   	ret = dsi_phy_regulator_init(phy);
>   	if (ret)
>   		goto fail;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index b91303a..9e08081 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -25,6 +25,7 @@ struct msm_dsi_phy_ops {
>   	void (*save_pll_state)(struct msm_dsi_phy *phy);
>   	int (*restore_pll_state)(struct msm_dsi_phy *phy);
>   	bool (*set_continuous_clock)(struct msm_dsi_phy *phy, bool enable);
> +	int (*parse_dt_properties)(struct msm_dsi_phy *phy);
>   };
>   
>   struct msm_dsi_phy_cfg {
> @@ -81,6 +82,8 @@ struct msm_dsi_dphy_timing {
>   #define DSI_PIXEL_PLL_CLK		1
>   #define NUM_PROVIDED_CLKS		2
>   
> +#define DSI_LANE_MAX			5
> +
>   struct msm_dsi_phy {
>   	struct platform_device *pdev;
>   	void __iomem *base;
> @@ -98,6 +101,7 @@ struct msm_dsi_phy {
>   
>   	struct msm_dsi_dphy_timing timing;
>   	const struct msm_dsi_phy_cfg *cfg;
> +	void *tuning_cfg;
>   
>   	enum msm_dsi_phy_usecase usecase;
>   	bool regulator_ldo_mode;


-- 
With best wishes
Dmitry
