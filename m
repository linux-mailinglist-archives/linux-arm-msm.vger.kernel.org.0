Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC8B91D1DB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 20:41:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389579AbgEMSl2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 May 2020 14:41:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387492AbgEMSl2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 May 2020 14:41:28 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 628D1C061A0C
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2020 11:41:28 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id a5so11479427pjh.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2020 11:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qqS14t8H02Fv7hWfyEPJzlH+UmqqsaPVREz98ODrRok=;
        b=jKjBPPN/1yanI61VjiiDpMMNFJYZYR/is1pBkEn2TDprQrrosPQLqsJWfcpsYTvJ1u
         CQ+6l0V7ju76j/3hgBe7nRgyp3Kh+Yh35T4oFcSwznBAhfEEP/nuDVxdwkfCWQQb3N5U
         tY6+1NHYvviIc82Qd0YBO4M86Vxo5J6d5Mvcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qqS14t8H02Fv7hWfyEPJzlH+UmqqsaPVREz98ODrRok=;
        b=XwVoFx2lDDHxuEFUPXO+F41lOs7b0TcTl/rjE8C0d1M32v2J2jgUwA/2lL+69dyoOy
         XEkM6VrcKI85kOanLAVv1FvtDI6UZZOCykc5rPTHH5M9XKB5aqlnL37jC2i837NIC8iu
         U1OTU/qZrzcJrqNHclBVHbQU15mgtURbEZdVUCTUU0TGGZhIK6mf0JU5w6qnNhGxASJO
         6RF9iHwrTiV2LxDv+wuhpoptUnAtPK4WKOUrYlBAWEmGvfSp2VGNeAGRn3h2CqS9UYuM
         dLF6WDk3690N90A/FdQWt+uF0F+GFYMTh+9DxNcozOXZkc80GN76sF8wbuEx2aO26aVc
         TYEw==
X-Gm-Message-State: AGi0PuZR53rng9J/zm4KAqMxnTNfqV1we6uBMTSS2ebIKk0GsfaGQ/mj
        9DECTjlG2FhipH+Y/ZbV59n0ag==
X-Google-Smtp-Source: APiQypLdRE6hiXyRqJsD92hrWHzCEo4WW6QuTHMdTZVeKho3+AczlTUSZwXnkGrgT+Ml1FHUepYzLA==
X-Received: by 2002:a17:90a:d504:: with SMTP id t4mr35934036pju.123.1589395287805;
        Wed, 13 May 2020 11:41:27 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id d124sm225558pfa.98.2020.05.13.11.41.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2020 11:41:27 -0700 (PDT)
Date:   Wed, 13 May 2020 11:41:26 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v5 5/6] media: venus: core: Add support for opp
 tables/perf voting
Message-ID: <20200513184126.GM4525@google.com>
References: <1589368382-19607-1-git-send-email-rnayak@codeaurora.org>
 <1589368382-19607-6-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1589368382-19607-6-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 13, 2020 at 04:43:01PM +0530, Rajendra Nayak wrote:
> Add support to add OPP tables and perf voting on the OPP powerdomain.
> This is needed so venus votes on the corresponding performance state
> for the OPP powerdomain along with setting the core clock rate.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> Cc: linux-media@vger.kernel.org
> ---
> Changes in v5: Fixed up error handling in probe and vcodec_domains_get()
> Bindings update to add optional PD https://lore.kernel.org/patchwork/patch/1241077/
> 
>  drivers/media/platform/qcom/venus/core.c       | 45 +++++++++++++++++----
>  drivers/media/platform/qcom/venus/core.h       |  5 +++
>  drivers/media/platform/qcom/venus/pm_helpers.c | 54 ++++++++++++++++++++++++--
>  3 files changed, 93 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 194b10b9..2a8ff08 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -12,6 +12,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> +#include <linux/pm_opp.h>
>  #include <linux/pm_runtime.h>
>  #include <media/videobuf2-v4l2.h>
>  #include <media/v4l2-mem2mem.h>
> @@ -214,21 +215,37 @@ static int venus_probe(struct platform_device *pdev)
>  	if (!core->pm_ops)
>  		return -ENODEV;
>  
> +	core->opp_table = dev_pm_opp_set_clkname(dev, "core");
> +	if (IS_ERR(core->opp_table))
> +		return PTR_ERR(core->opp_table);
> +
> +	if (core->res->opp_pmdomain) {
> +		ret = dev_pm_opp_of_add_table(dev);
> +		if (!ret) {
> +			core->has_opp_table = true;
> +		} else if (ret != -ENODEV) {
> +			dev_err(dev, "invalid OPP table in device tree\n");
> +			return ret;
> +		}
> +	}
> +
>  	if (core->pm_ops->core_get) {
>  		ret = core->pm_ops->core_get(dev);
>  		if (ret)
> -			return ret;
> +			goto err_opp_cleanup;
>  	}
>  
>  	ret = dma_set_mask_and_coherent(dev, core->res->dma_mask);
>  	if (ret)
> -		return ret;
> +		goto err_opp_cleanup;
>  
>  	if (!dev->dma_parms) {
>  		dev->dma_parms = devm_kzalloc(dev, sizeof(*dev->dma_parms),
>  					      GFP_KERNEL);
> -		if (!dev->dma_parms)
> -			return -ENOMEM;
> +		if (!dev->dma_parms) {
> +			ret = -ENOMEM;
> +			goto err_opp_cleanup;
> +		}
>  	}
>  	dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
>  
> @@ -240,15 +257,15 @@ static int venus_probe(struct platform_device *pdev)
>  					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
>  					"venus", core);
>  	if (ret)
> -		return ret;
> +		goto err_opp_cleanup;
>  
>  	ret = icc_set_bw(core->cpucfg_path, 0, kbps_to_icc(1000));
>  	if (ret)
> -		return ret;
> +		goto err_opp_cleanup;
>  
>  	ret = hfi_create(core, &venus_core_ops);
>  	if (ret)
> -		return ret;
> +		goto err_opp_cleanup;
>  
>  	pm_runtime_enable(dev);
>  
> @@ -304,6 +321,10 @@ static int venus_probe(struct platform_device *pdev)
>  	pm_runtime_set_suspended(dev);
>  	pm_runtime_disable(dev);
>  	hfi_destroy(core);
> +err_opp_cleanup:
> +	if (core->has_opp_table)
> +		dev_pm_opp_of_remove_table(dev);
> +	dev_pm_opp_put_clkname(core->opp_table);
>  	return ret;
>  }
>  
> @@ -329,6 +350,10 @@ static int venus_remove(struct platform_device *pdev)
>  	pm_runtime_put_sync(dev);
>  	pm_runtime_disable(dev);
>  
> +	if (core->has_opp_table)
> +		dev_pm_opp_of_remove_table(dev);
> +	dev_pm_opp_put_clkname(core->opp_table);
> +
>  	if (pm_ops->core_put)
>  		pm_ops->core_put(dev);
>  
> @@ -350,6 +375,10 @@ static __maybe_unused int venus_runtime_suspend(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> +	/* Drop the performance state vote */
> +	if (core->opp_pmdomain)
> +		dev_pm_opp_set_rate(dev, 0);
> +
>  	if (pm_ops->core_power)
>  		ret = pm_ops->core_power(dev, POWER_OFF);
>  
> @@ -511,6 +540,7 @@ static const struct venus_resources sdm845_res_v2 = {
>  	.vcodec_clks_num = 2,
>  	.vcodec_pmdomains = { "venus", "vcodec0", "vcodec1" },
>  	.vcodec_pmdomains_num = 3,
> +	.opp_pmdomain = (const char *[]) { "opp-pd", NULL },
>  	.vcodec_num = 2,
>  	.max_load = 3110400,	/* 4096x2160@90 */
>  	.hfi_version = HFI_VERSION_4XX,
> @@ -556,6 +586,7 @@ static const struct venus_resources sc7180_res = {
>  	.vcodec_clks_num = 2,
>  	.vcodec_pmdomains = { "venus", "vcodec0" },
>  	.vcodec_pmdomains_num = 2,
> +	.opp_pmdomain = (const char *[]) { "opp-pd", NULL },
>  	.vcodec_num = 1,
>  	.hfi_version = HFI_VERSION_4XX,
>  	.vmem_id = VIDC_RESOURCE_NONE,
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index bd3ac6a..cc1d511 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -62,6 +62,7 @@ struct venus_resources {
>  	unsigned int vcodec_clks_num;
>  	const char * const vcodec_pmdomains[VIDC_PMDOMAINS_NUM_MAX];
>  	unsigned int vcodec_pmdomains_num;
> +	const char **opp_pmdomain;
>  	unsigned int vcodec_num;
>  	enum hfi_version hfi_version;
>  	u32 max_load;
> @@ -144,8 +145,12 @@ struct venus_core {
>  	struct clk *vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
>  	struct icc_path *video_path;
>  	struct icc_path *cpucfg_path;
> +	struct opp_table *opp_table;
> +	bool has_opp_table;
>  	struct device_link *pd_dl_venus;
>  	struct device *pmdomains[VIDC_PMDOMAINS_NUM_MAX];
> +	struct device_link *opp_dl_venus;
> +	struct device *opp_pmdomain;
>  	struct video_device *vdev_dec;
>  	struct video_device *vdev_enc;
>  	struct v4l2_device v4l2_dev;
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index abf9315..bfe7421 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -9,6 +9,7 @@
>  #include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  #include <linux/pm_domain.h>
> +#include <linux/pm_opp.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/types.h>
>  #include <media/v4l2-mem2mem.h>
> @@ -66,10 +67,9 @@ static void core_clks_disable(struct venus_core *core)
>  
>  static int core_clks_set_rate(struct venus_core *core, unsigned long freq)
>  {
> -	struct clk *clk = core->clks[0];
>  	int ret;
>  
> -	ret = clk_set_rate(clk, freq);
> +	ret = dev_pm_opp_set_rate(core->dev, freq);
>  	if (ret)
>  		return ret;
>  
> @@ -740,13 +740,16 @@ static int venc_power_v4(struct device *dev, int on)
>  
>  static int vcodec_domains_get(struct device *dev)
>  {
> +	int ret;
> +	struct opp_table *opp_table;
> +	struct device **opp_virt_dev;
>  	struct venus_core *core = dev_get_drvdata(dev);
>  	const struct venus_resources *res = core->res;
>  	struct device *pd;
>  	unsigned int i;
>  
>  	if (!res->vcodec_pmdomains_num)
> -		return -ENODEV;
> +		goto skip_pmdomains;
>  
>  	for (i = 0; i < res->vcodec_pmdomains_num; i++) {
>  		pd = dev_pm_domain_attach_by_name(dev,
> @@ -763,7 +766,41 @@ static int vcodec_domains_get(struct device *dev)
>  	if (!core->pd_dl_venus)
>  		return -ENODEV;
>  
> +skip_pmdomains:
> +	if (!core->has_opp_table)
> +		return 0;
> +
> +	/* Attach the power domain for setting performance state */
> +	opp_table = dev_pm_opp_attach_genpd(dev, res->opp_pmdomain, &opp_virt_dev);
> +	if (IS_ERR(opp_table)) {
> +		ret = PTR_ERR(opp_table);
> +		goto opp_attach_err;
> +	}
> +
> +	core->opp_pmdomain = *opp_virt_dev;
> +	core->opp_dl_venus = device_link_add(dev, core->opp_pmdomain,
> +					     DL_FLAG_RPM_ACTIVE |
> +					     DL_FLAG_PM_RUNTIME |
> +					     DL_FLAG_STATELESS);
> +	if (!core->opp_dl_venus) {
> +		ret = -ENODEV;
> +		goto opp_dl_add_err;
> +	}
> +
>  	return 0;
> +
> +opp_dl_add_err:
> +	dev_pm_domain_detach(core->opp_pmdomain, true);
> +opp_attach_err:
> +	if (core->pd_dl_venus) {
> +		device_link_del(core->pd_dl_venus);
> +		for (i = 0; i < res->vcodec_pmdomains_num; i++) {
> +			if (IS_ERR_OR_NULL(core->pmdomains[i]))
> +				continue;
> +			dev_pm_domain_detach(core->pmdomains[i], true);
> +		}
> +	}
> +	return ret;
>  }
>  
>  static void vcodec_domains_put(struct device *dev)
> @@ -773,7 +810,7 @@ static void vcodec_domains_put(struct device *dev)
>  	unsigned int i;
>  
>  	if (!res->vcodec_pmdomains_num)
> -		return;
> +		goto skip_pmdomains;
>  
>  	if (core->pd_dl_venus)
>  		device_link_del(core->pd_dl_venus);
> @@ -783,6 +820,15 @@ static void vcodec_domains_put(struct device *dev)
>  			continue;
>  		dev_pm_domain_detach(core->pmdomains[i], true);
>  	}
> +
> +skip_pmdomains:
> +	if (!res->opp_pmdomain)
> +		return;
> +
> +	if (core->opp_dl_venus)
> +		device_link_del(core->opp_dl_venus);
> +
> +	dev_pm_domain_detach(core->opp_pmdomain, true);
>  }
>  
>  static int core_get_v4(struct device *dev)

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
