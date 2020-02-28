Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25EA4172D8A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2020 01:43:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729984AbgB1Anc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 19:43:32 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:54827 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730120AbgB1Anc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 19:43:32 -0500
Received: by mail-pj1-f68.google.com with SMTP id dw13so514807pjb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2020 16:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8t+QF1jUrbFLO8yI08wmjsR+GeHNrEjF1Md3xiMC8NA=;
        b=lhRclAojaWh7DXh2Fy7nrZd8SyMa2JcnmOKVrBR+FQiN1Mp028BI+MGpcddDUXGFCo
         JVM/kWmCyIpvTdqmy3Mp4rlnHT6E8MxWgHEdVS/cOIvQC91hdqRkEyRVVWVfhwxJ6h4X
         Gnc/1uU0weocAgDStM+BvrwkpxoNH/IGzP4P4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8t+QF1jUrbFLO8yI08wmjsR+GeHNrEjF1Md3xiMC8NA=;
        b=SPag794lY93dSkJKHyml5p5QnLj5eU20N5e8vQboAHlAzdVP4o0VFLipohz1GWq9Bo
         XuqlLprxA/Cv3PyuFdLluUk3Jkd33wx2qYcP+ahg5u6l9fdbP9Yv5eYzvYIEFyMKAMnu
         8wB4PhLS48NgLPy7BXm7OqK7vp/3RZsw2dxhL7yBLvuwPm2/9yl0jjFhRByIfFzniyB1
         YCHKHy0j6toB9eXiiP7f/HbLn343qs8r+N+50NafdXJtlazjozcabt4ysdbDLgRt99/7
         c70L863MOUI2owYqhQArhmU53kLEYV3JvYgEWAEHwYefTpreqezKxRGdJXNgOOhI9DPF
         qI5Q==
X-Gm-Message-State: APjAAAWMNmsGMFqKlpLhz9XHhmrq6jdIFS9iVPq2QXP4vb/hNZuy4duk
        7LrFuh+EsE0RI/IluKkwXgy9klb6YB8=
X-Google-Smtp-Source: APXvYqwWMiiJ4fXkvydaOnQd5+1b2ygxswq4zp1nvGJdIdnG9xiMkdkUMdjzVxim7xA7gB0Eus81Qg==
X-Received: by 2002:a17:90a:8586:: with SMTP id m6mr1724274pjn.121.1582850610811;
        Thu, 27 Feb 2020 16:43:30 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id 13sm7713961pgo.13.2020.02.27.16.43.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2020 16:43:29 -0800 (PST)
Date:   Thu, 27 Feb 2020 16:43:28 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Chandan Uddaraju <chandanu@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, seanpaul@chromium.org,
        abhinavk@codeaurora.org, hoegsberg@google.com,
        dri-devel@lists.freedesktop.org
Subject: Re: [DPU PATCH v3 3/5] drm/msm/dp: add displayPort driver support
Message-ID: <20200228004328.GM24720@google.com>
References: <1575294437-6129-1-git-send-email-chandanu@codeaurora.org>
 <0101016ec6df0e54-2af1f4a6-8f72-4799-89e0-0ff87b514eb2-000000@us-west-2.amazonses.com>
 <20200227215433.GK24720@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200227215433.GK24720@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 27, 2020 at 01:54:33PM -0800, Matthias Kaehlcke wrote:
> On Mon, Dec 02, 2019 at 01:48:57PM +0000, Chandan Uddaraju wrote:
> > Add the needed displayPort files to enable DP driver
> > on msm target.
> > 
> > "dp_display" module is the main module that calls into
> > other sub-modules. "dp_drm" file represents the interface
> > between DRM framework and DP driver.
> > 
> > changes in v2:
> > -- Update copyright markings on all relevant files.
> > -- Change pr_err() to DRM_ERROR()
> > -- Use APIs directly instead of function pointers.
> > -- Use drm_display_mode structure to store link parameters in the driver.
> > -- Use macros for register definitions instead of hardcoded values.
> > -- Replace writel_relaxed/readl_relaxed with writel/readl
> >    and remove memory barriers.
> > -- Remove unnecessary NULL checks.
> > -- Use drm helper functions for dpcd read/write.
> > -- Use DRM_DEBUG_DP for debug msgs.
> > 
> > changes in V3:
> > -- Removed changes in dpu_io_util.[ch]
> > -- Added locking around "is_connected" flag and removed atomic_set()
> > -- Removed the argument validation checks in all the static functions
> >    except initialization functions and few API calls across msm/dp files
> > -- Removed hardcoded values for register reads/writes
> > -- Removed vreg related generic structures.
> > -- Added return values where ever necessary.
> > -- Updated dp_ctrl_on function.
> > -- Calling the ctrl specific catalog functions directly instead of
> >    function pointers.
> > -- Added seperate change that adds standard value in drm_dp_helper file.
> > -- Added separate change in this list that is used to initialize
> >    displayport in DPU driver.
> > -- Added change to use drm_dp_get_adjust_request_voltage() function.
> > 
> > Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> > ---
> > +++ b/drivers/gpu/drm/msm/dp/dp_power.c
> >
> > ...
> >
> > +int dp_power_init(struct dp_power *dp_power, bool flip)
> > +{
> > +	int rc = 0;
> > +	struct dp_power_private *power;
> > +
> > +	if (!dp_power) {
> > +		DRM_ERROR("invalid power data\n");
> > +		rc = -EINVAL;
> > +		goto exit;
> > +	}
> 
> drive-by comment:
> 
> this would lead to calling 'pm_runtime_put_sync(&power->pdev->dev)'
> below with 'power' being NULL, which doesn't seem a good idea.

correction: with 'power' being uninitialized, which isn't a good idea
either.

> It is probably sane to expect that 'dp_power' is not NULL, if that's
> the case the check can be removed. Otherwise the function should just
> return -EINVAL instead of jumping to 'exit'.
> 
> > +
> > +	power = container_of(dp_power, struct dp_power_private, dp_power);
> > +
> > +	pm_runtime_get_sync(&power->pdev->dev);
> > +	rc = dp_power_regulator_enable(power);
> > +	if (rc) {
> > +		DRM_ERROR("failed to enable regulators, %d\n", rc);
> > +		goto exit;
> > +	}
> > +
> > +	rc = dp_power_pinctrl_set(power, true);
> > +	if (rc) {
> > +		DRM_ERROR("failed to set pinctrl state, %d\n", rc);
> > +		goto err_pinctrl;
> > +	}
> > +
> > +	rc = dp_power_config_gpios(power, flip);
> > +	if (rc) {
> > +		DRM_ERROR("failed to enable gpios, %d\n", rc);
> > +		goto err_gpio;
> > +	}
> > +
> > +	rc = dp_power_clk_enable(dp_power, DP_CORE_PM, true);
> > +	if (rc) {
> > +		DRM_ERROR("failed to enable DP core clocks, %d\n", rc);
> > +		goto err_clk;
> > +	}
> > +
> > +	return 0;
> > +
> > +err_clk:
> > +	dp_power_disable_gpios(power);
> > +err_gpio:
> > +	dp_power_pinctrl_set(power, false);
> > +err_pinctrl:
> > +	dp_power_regulator_disable(power);
> > +exit:
> > +	pm_runtime_put_sync(&power->pdev->dev);
> > +	return rc;
> > +}
