Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2278172A90
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 22:55:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729162AbgB0Vyi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 16:54:38 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38778 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729773AbgB0Vyh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 16:54:37 -0500
Received: by mail-pg1-f195.google.com with SMTP id d6so375256pgn.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2020 13:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+0IYi++vwthLQ5uajPvjEjpHHtTOH92Ozi2ToC54VL0=;
        b=KAkHE4e8tQ+bi2Skwt3+5etnTno6Zh5gXipu+VdnG6pVHAWRgIr1UQpOhGFWHPDieP
         7WtmzuwYqbtIeDybrv00r26KF6Mcbe36zp7sT6go8JEuId7dZudVR66c/tDhgq7e7gQC
         bODwYmOTz1WWVOk7VjZx8O6ju4TZGOz45T15k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+0IYi++vwthLQ5uajPvjEjpHHtTOH92Ozi2ToC54VL0=;
        b=IHBZTqgbdugu2rlUUPWAH7cjhfMEwu8vM8R8hFWAV6f32CEKzoiIAVxqLJdTA3TId4
         kPRPJKTwLilXv86yUxh49Mjw05dC8AcSqMuS6J7ULRwXtKzVfcyAmyb0j1CtV6PWDd2S
         M4y6CpWTbVEMtU6XkjhEo+YMkpx0RBK7guLuvUGpd449vX1axFCzIU+gHfW4gAMxOUaX
         HmTpefo4xd0sMU0pxEMeMa9FoXe0gPDgO/uAFm7/PmWZw926VpQ/ecPwnY6TwT7NNT8+
         KjBNAsspqwtwJVvtEeR/qQitr7Z9pMLqc3Vje+3ppYYbi1BRVj9GgqUawuFQTMC1J3IZ
         gxjw==
X-Gm-Message-State: APjAAAUpC2oDJW/xl3OGoLOm7hnw7qhiZ7ZC+51tXNGqbiuGT6ymIL5c
        JbN43fGzXIUY67KijYiGGeER4nRocXk=
X-Google-Smtp-Source: APXvYqyLnLDusW3NGVjQNpS9d9K/5/oRkpDv3IJt5GsUJhMBBZuHwD5k1HpU1eYbxibVTOyx0XoRaA==
X-Received: by 2002:a63:2cd6:: with SMTP id s205mr1332761pgs.258.1582840474892;
        Thu, 27 Feb 2020 13:54:34 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id d69sm9088008pfd.72.2020.02.27.13.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2020 13:54:34 -0800 (PST)
Date:   Thu, 27 Feb 2020 13:54:33 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Chandan Uddaraju <chandanu@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, seanpaul@chromium.org,
        abhinavk@codeaurora.org, hoegsberg@google.com,
        dri-devel@lists.freedesktop.org
Subject: Re: [DPU PATCH v3 3/5] drm/msm/dp: add displayPort driver support
Message-ID: <20200227215433.GK24720@google.com>
References: <1575294437-6129-1-git-send-email-chandanu@codeaurora.org>
 <0101016ec6df0e54-2af1f4a6-8f72-4799-89e0-0ff87b514eb2-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0101016ec6df0e54-2af1f4a6-8f72-4799-89e0-0ff87b514eb2-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 02, 2019 at 01:48:57PM +0000, Chandan Uddaraju wrote:
> Add the needed displayPort files to enable DP driver
> on msm target.
> 
> "dp_display" module is the main module that calls into
> other sub-modules. "dp_drm" file represents the interface
> between DRM framework and DP driver.
> 
> changes in v2:
> -- Update copyright markings on all relevant files.
> -- Change pr_err() to DRM_ERROR()
> -- Use APIs directly instead of function pointers.
> -- Use drm_display_mode structure to store link parameters in the driver.
> -- Use macros for register definitions instead of hardcoded values.
> -- Replace writel_relaxed/readl_relaxed with writel/readl
>    and remove memory barriers.
> -- Remove unnecessary NULL checks.
> -- Use drm helper functions for dpcd read/write.
> -- Use DRM_DEBUG_DP for debug msgs.
> 
> changes in V3:
> -- Removed changes in dpu_io_util.[ch]
> -- Added locking around "is_connected" flag and removed atomic_set()
> -- Removed the argument validation checks in all the static functions
>    except initialization functions and few API calls across msm/dp files
> -- Removed hardcoded values for register reads/writes
> -- Removed vreg related generic structures.
> -- Added return values where ever necessary.
> -- Updated dp_ctrl_on function.
> -- Calling the ctrl specific catalog functions directly instead of
>    function pointers.
> -- Added seperate change that adds standard value in drm_dp_helper file.
> -- Added separate change in this list that is used to initialize
>    displayport in DPU driver.
> -- Added change to use drm_dp_get_adjust_request_voltage() function.
> 
> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> ---
> +++ b/drivers/gpu/drm/msm/dp/dp_power.c
>
> ...
>
> +int dp_power_init(struct dp_power *dp_power, bool flip)
> +{
> +	int rc = 0;
> +	struct dp_power_private *power;
> +
> +	if (!dp_power) {
> +		DRM_ERROR("invalid power data\n");
> +		rc = -EINVAL;
> +		goto exit;
> +	}

drive-by comment:

this would lead to calling 'pm_runtime_put_sync(&power->pdev->dev)'
below with 'power' being NULL, which doesn't seem a good idea.

It is probably sane to expect that 'dp_power' is not NULL, if that's
the case the check can be removed. Otherwise the function should just
return -EINVAL instead of jumping to 'exit'.

> +
> +	power = container_of(dp_power, struct dp_power_private, dp_power);
> +
> +	pm_runtime_get_sync(&power->pdev->dev);
> +	rc = dp_power_regulator_enable(power);
> +	if (rc) {
> +		DRM_ERROR("failed to enable regulators, %d\n", rc);
> +		goto exit;
> +	}
> +
> +	rc = dp_power_pinctrl_set(power, true);
> +	if (rc) {
> +		DRM_ERROR("failed to set pinctrl state, %d\n", rc);
> +		goto err_pinctrl;
> +	}
> +
> +	rc = dp_power_config_gpios(power, flip);
> +	if (rc) {
> +		DRM_ERROR("failed to enable gpios, %d\n", rc);
> +		goto err_gpio;
> +	}
> +
> +	rc = dp_power_clk_enable(dp_power, DP_CORE_PM, true);
> +	if (rc) {
> +		DRM_ERROR("failed to enable DP core clocks, %d\n", rc);
> +		goto err_clk;
> +	}
> +
> +	return 0;
> +
> +err_clk:
> +	dp_power_disable_gpios(power);
> +err_gpio:
> +	dp_power_pinctrl_set(power, false);
> +err_pinctrl:
> +	dp_power_regulator_disable(power);
> +exit:
> +	pm_runtime_put_sync(&power->pdev->dev);
> +	return rc;
> +}
