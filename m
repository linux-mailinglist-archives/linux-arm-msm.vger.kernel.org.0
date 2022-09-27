Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B16665ECACA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 19:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232139AbiI0R0f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 13:26:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232072AbiI0R0e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 13:26:34 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DE42B0898;
        Tue, 27 Sep 2022 10:26:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id E2451CE13B1;
        Tue, 27 Sep 2022 17:26:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1964AC433C1;
        Tue, 27 Sep 2022 17:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664299589;
        bh=7qW4NoYfDpzCVbAcPMno7UyKuLi2bhHCAlraw+xf0DU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ah9kXG5WXTnm4IQfxw0kTiNqLFGQtpPXAwE/8mRaytERIGpRPJA7plDtS0pKtRKQK
         6FVQKT9fsZgjjiGIxz3V7bRd3ogBSVIQKHZRArlodpWDmnspRE/E6cmuLdCh2OVruj
         9gfSy0wfh45qDbDNyPpKRzpGoKF/PT4N6NotqFYw/kLfhdjSSMLWDdL5kHj77ALdAq
         m86sTM6PztdqZtdNnqPccZn/Ftgv3KucRwPi4i6Vaf54J7HY6BGorcUF6zelf3BAs7
         VUFM7Xoq7LprWEIjmaHp2wg6mBJjkfy6XAupj2HDUZDSTH8XgERJZoeOcKualjUDva
         2exQjN63qeGCw==
Date:   Tue, 27 Sep 2022 12:26:26 -0500
From:   Bjorn Andersson <andersson@kernel.org>
To:     Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        krzysztof.kozlowski@linaro.org, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] clk: qcom: gdsc: Add a reset op to poll gdsc
 collapse
Message-ID: <20220927172626.cwxpmrqkb7zsuolx@builder.lan>
References: <1660853919-987-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220819014758.v3.3.I162c4be55f230cd439f0643f1624527bdc8a9831@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220819014758.v3.3.I162c4be55f230cd439f0643f1624527bdc8a9831@changeid>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 19, 2022 at 01:48:37AM +0530, Akhil P Oommen wrote:
> Add a reset op compatible function to poll for gdsc collapse.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - Minor update to function prototype
> 
>  drivers/clk/qcom/gdsc.c | 23 +++++++++++++++++++----
>  drivers/clk/qcom/gdsc.h |  7 +++++++
>  2 files changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index 44520ef..2d0f1d1 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -17,6 +17,7 @@
>  #include <linux/reset-controller.h>
>  #include <linux/slab.h>
>  #include "gdsc.h"
> +#include "reset.h"
>  
>  #define PWR_ON_MASK		BIT(31)
>  #define EN_REST_WAIT_MASK	GENMASK_ULL(23, 20)
> @@ -116,7 +117,8 @@ static int gdsc_hwctrl(struct gdsc *sc, bool en)
>  	return regmap_update_bits(sc->regmap, sc->gdscr, HW_CONTROL_MASK, val);
>  }
>  
> -static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status)
> +static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status,
> +		s64 timeout_us, unsigned int interval_ms)
>  {
>  	ktime_t start;
>  
> @@ -124,7 +126,9 @@ static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status)
>  	do {
>  		if (gdsc_check_status(sc, status))
>  			return 0;
> -	} while (ktime_us_delta(ktime_get(), start) < TIMEOUT_US);
> +		if (interval_ms)
> +			msleep(interval_ms);

You effectively msleep(5) here, for which you shouldn't use msleep() -
or more likely, this only happens in exceptional circumstances, so a
longer interval_ms seems reasonable.

> +	} while (ktime_us_delta(ktime_get(), start) < timeout_us);
>  
>  	if (gdsc_check_status(sc, status))
>  		return 0;
> @@ -172,7 +176,7 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status)
>  		udelay(1);
>  	}
>  
> -	ret = gdsc_poll_status(sc, status);
> +	ret = gdsc_poll_status(sc, status, TIMEOUT_US, 0);
>  	WARN(ret, "%s status stuck at 'o%s'", sc->pd.name, status ? "ff" : "n");
>  
>  	if (!ret && status == GDSC_OFF && sc->rsupply) {
> @@ -343,7 +347,7 @@ static int _gdsc_disable(struct gdsc *sc)
>  		 */
>  		udelay(1);
>  
> -		ret = gdsc_poll_status(sc, GDSC_ON);
> +		ret = gdsc_poll_status(sc, GDSC_ON, TIMEOUT_US, 0);
>  		if (ret)
>  			return ret;
>  	}
> @@ -565,3 +569,14 @@ int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain)
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(gdsc_gx_do_nothing_enable);
> +
> +int gdsc_wait_for_collapse(void *priv)
> +{
> +	struct gdsc *sc = priv;
> +	int ret;
> +
> +	ret = gdsc_poll_status(sc, GDSC_OFF, 500000, 5);

So I presume the GPU driver will put() the GDSC and then issue a reset,
which will wait up to 5 seconds for the GDSC to be turned off.

So essentially, this logic is needed because we don't wait for VOTABLE
GDSCs to be turned off? And we have no way to do the put-with-wait for
this specific case.

I would like the commit message to capture this reasoning.

Thanks,
Bjorn

> +	WARN(ret, "%s status stuck at 'on'", sc->pd.name);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(gdsc_wait_for_collapse);
> diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
> index ad313d7..d484bdb 100644
> --- a/drivers/clk/qcom/gdsc.h
> +++ b/drivers/clk/qcom/gdsc.h
> @@ -12,6 +12,7 @@
>  struct regmap;
>  struct regulator;
>  struct reset_controller_dev;
> +struct qcom_reset_map;
>  
>  /**
>   * struct gdsc - Globally Distributed Switch Controller
> @@ -79,6 +80,7 @@ int gdsc_register(struct gdsc_desc *desc, struct reset_controller_dev *,
>  		  struct regmap *);
>  void gdsc_unregister(struct gdsc_desc *desc);
>  int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain);
> +int gdsc_wait_for_collapse(void *priv);
>  #else
>  static inline int gdsc_register(struct gdsc_desc *desc,
>  				struct reset_controller_dev *rcdev,
> @@ -88,5 +90,10 @@ static inline int gdsc_register(struct gdsc_desc *desc,
>  }
>  
>  static inline void gdsc_unregister(struct gdsc_desc *desc) {};
> +
> +static int gdsc_wait_for_collapse(void *priv)
> +{
> +	return  -ENOSYS;
> +}
>  #endif /* CONFIG_QCOM_GDSC */
>  #endif /* __QCOM_GDSC_H__ */
> -- 
> 2.7.4
> 
