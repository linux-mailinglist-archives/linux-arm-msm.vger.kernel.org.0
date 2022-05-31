Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45B7E5398C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 May 2022 23:29:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347642AbiEaV3H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 May 2022 17:29:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346692AbiEaV3H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 May 2022 17:29:07 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D08E39CF28;
        Tue, 31 May 2022 14:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1654032545; x=1685568545;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Jki36/w5PHqjsUf6hSCUylHPIQnwQ9joo020v6GkUrU=;
  b=IFjva2Oy9ctIPmJhikzGEE+ViJOtgEB8Bn10Tobknh4iQorBDDc85543
   DhEZZD5/VHuNYZG4yjiWxfmwDcC2ze3b3XNdQq4CjrjQ2+5BjmxoQmSVG
   lqie9w96sf5pyVrbnzcRBjq29rrbu8FDBWgRk0IrwhHW7L3VmBPfYH/vU
   c=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 31 May 2022 14:29:05 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 14:29:04 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 31 May 2022 14:29:04 -0700
Received: from [10.38.242.41] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 31 May
 2022 14:29:02 -0700
Message-ID: <1ce24f74-3c9e-60ed-46ad-3ba714fb7c61@quicinc.com>
Date:   Tue, 31 May 2022 14:29:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dpu: Move min BW request and full BW disable back
 to mdss
Content-Language: en-US
To:     Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20220531072757.1.Ie7f6d4bf8cce28131da31a43354727e417cae98d@changeid>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220531072757.1.Ie7f6d4bf8cce28131da31a43354727e417cae98d@changeid>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug

On 5/31/2022 7:28 AM, Douglas Anderson wrote:
> In commit a670ff578f1f ("drm/msm/dpu: always use mdp device to scale
> bandwidth") we fully moved interconnect stuff to the DPU driver. This
> had no change for sc7180 but _did_ have an impact for other SoCs. It
> made them match the sc7180 scheme.
> 
> Unfortunately, the sc7180 scheme seems like it was a bit broken.
> Specifically the interconnect needs to be on for more than just the
> DPU driver's AXI bus. In the very least it also needs to be on for the
> DSI driver's AXI bus. This can be seen fairly easily by doing this on
> a ChromeOS sc7180-trogdor class device:
> 
>    set_power_policy --ac_screen_dim_delay=5 --ac_screen_off_delay=10
>    sleep 10
>    cd /sys/bus/platform/devices/ae94000.dsi/power
>    echo on > control
> 
> When you do that, you'll get a warning splat in the logs about
> "gcc_disp_hf_axi_clk status stuck at 'off'".
> 
> One could argue that perhaps what I have done above is "illegal" and
> that it can't happen naturally in the system because in normal system
> usage the DPU is pretty much always on when DSI is on. That being
> said:
> * In official ChromeOS builds (admittedly a 5.4 kernel with backports)
>    we have seen that splat at bootup.
> * Even though we don't use "autosuspend" for these components, we
>    don't use the "put_sync" variants. Thus plausibly the DSI could stay
>    "runtime enabled" past when the DPU is enabled. Techncially we
>    shouldn't do that if the DPU's suspend ends up yanking our clock.
> 
> Let's change things such that the "bare minimum" request for the
> interconnect happens in the mdss driver again. That means that all of
> the children can assume that the interconnect is on at the minimum
> bandwidth. We'll then let the DPU request the higher amount that it
> wants.
> 
> It should be noted that this isn't as hacky of a solution as it might
> initially appear. Specifically:
> * Since MDSS and DPU individually get their own references to the
>    interconnect then the framework will actually handle aggregating
>    them. The two drivers are _not_ clobbering each other.
> * When the Qualcomm interconnect driver aggregates it takes the max of
>    all the peaks. Thus having MDSS request a peak, as we're doing here,
>    won't actually change the total interconnect bandwidth (it won't be
>    added to the request for the DPU). This perhaps explains why the
>    "average" requested in MDSS was historically 0 since that one
>    _would_ be added in.
> 
> NOTE also that in the downstream ChromeOS 5.4 and 5.15 kernels, we're
> also seeing some RPMH hangs that are addressed by this fix. These
> hangs are showing up in the field and on _some_ devices with enough
> stress testing of suspend/resume. Specifically right at suspend time
> with a stack crawl that looks like this (from chromeos-5.15 tree):
>    rpmh_write_batch+0x19c/0x240
>    qcom_icc_bcm_voter_commit+0x210/0x420
>    qcom_icc_set+0x28/0x38
>    apply_constraints+0x70/0xa4
>    icc_set_bw+0x150/0x24c
>    dpu_runtime_resume+0x50/0x1c4
>    pm_generic_runtime_resume+0x30/0x44
>    __genpd_runtime_resume+0x68/0x7c
>    genpd_runtime_resume+0x12c/0x20c
>    __rpm_callback+0x98/0x138
>    rpm_callback+0x30/0x88
>    rpm_resume+0x370/0x4a0
>    __pm_runtime_resume+0x80/0xb0
>    dpu_kms_enable_commit+0x24/0x30
>    msm_atomic_commit_tail+0x12c/0x630
>    commit_tail+0xac/0x150
>    drm_atomic_helper_commit+0x114/0x11c
>    drm_atomic_commit+0x68/0x78
>    drm_atomic_helper_disable_all+0x158/0x1c8
>    drm_atomic_helper_suspend+0xc0/0x1c0
>    drm_mode_config_helper_suspend+0x2c/0x60
>    msm_pm_prepare+0x2c/0x40
>    pm_generic_prepare+0x30/0x44
>    genpd_prepare+0x80/0xd0
>    device_prepare+0x78/0x17c
>    dpm_prepare+0xb0/0x384
>    dpm_suspend_start+0x34/0xc0
> 
> We don't completely understand all the mechanisms in play, but the
> hang seemed to come and go with random factors. It's not terribly
> surprising that the hang is gone after this patch since the line of
> code that was failing is no longer present in the kernel.
> 
> Fixes: a670ff578f1f ("drm/msm/dpu: always use mdp device to scale bandwidth")
> Fixes: c33b7c0389e1 ("drm/msm/dpu: add support for clk and bw scaling for display")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  8 ----
>   drivers/gpu/drm/msm/msm_mdss.c          | 58 +++++++++++++++++++++++++
>   2 files changed, 58 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 2b9d931474e0..3025184053e0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -49,8 +49,6 @@
>   #define DPU_DEBUGFS_DIR "msm_dpu"
>   #define DPU_DEBUGFS_HWMASKNAME "hw_log_mask"
>   
> -#define MIN_IB_BW	400000000ULL /* Min ib vote 400MB */
> -
>   static int dpu_kms_hw_init(struct msm_kms *kms);
>   static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms);
>   
> @@ -1303,15 +1301,9 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
>   	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
>   	struct drm_encoder *encoder;
>   	struct drm_device *ddev;
> -	int i;
>   
>   	ddev = dpu_kms->dev;
>   
> -	WARN_ON(!(dpu_kms->num_paths));
> -	/* Min vote of BW is required before turning on AXI clk */
> -	for (i = 0; i < dpu_kms->num_paths; i++)
> -		icc_set_bw(dpu_kms->path[i], 0, Bps_to_icc(MIN_IB_BW));
> -
>   	rc = clk_bulk_prepare_enable(dpu_kms->num_clocks, dpu_kms->clocks);
>   	if (rc) {
>   		DPU_ERROR("clock enable failed rc:%d\n", rc);
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 0454a571adf7..fe2c398d99b7 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -5,6 +5,7 @@
>   
>   #include <linux/clk.h>
>   #include <linux/delay.h>
> +#include <linux/interconnect.h>
>   #include <linux/irq.h>
>   #include <linux/irqchip.h>
>   #include <linux/irqdesc.h>
> @@ -25,6 +26,8 @@
>   #define UBWC_CTRL_2			0x150
>   #define UBWC_PREDICTION_MODE		0x154
>   
> +#define MIN_IB_BW	400000000UL /* Min ib vote 400MB */
> +
>   struct msm_mdss {
>   	struct device *dev;
>   
> @@ -36,8 +39,47 @@ struct msm_mdss {
>   		unsigned long enabled_mask;
>   		struct irq_domain *domain;
>   	} irq_controller;
> +	struct icc_path *path[2];
> +	u32 num_paths;
>   };
>   
> +static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
> +					    struct msm_mdss *msm_mdss)
> +{
> +	struct icc_path *path0 = of_icc_get(dev, "mdp0-mem");
> +	struct icc_path *path1 = of_icc_get(dev, "mdp1-mem");
> +
> +	if (IS_ERR_OR_NULL(path0))
> +		return PTR_ERR_OR_ZERO(path0);
> +
> +	msm_mdss->path[0] = path0;
> +	msm_mdss->num_paths = 1;
> +
> +	if (!IS_ERR_OR_NULL(path1)) {
> +		msm_mdss->path[1] = path1;
> +		msm_mdss->num_paths++;
> +	}
> +
> +	return 0;
> +}
> +
> +static void msm_mdss_put_icc_path(void *data)
> +{
> +	struct msm_mdss *msm_mdss = data;
> +	int i;
> +
> +	for (i = 0; i < msm_mdss->num_paths; i++)
> +		icc_put(msm_mdss->path[i]);
> +}
> +
> +static void msm_mdss_icc_request_bw(struct msm_mdss *msm_mdss, unsigned long bw)
> +{
> +	int i;
> +
> +	for (i = 0; i < msm_mdss->num_paths; i++)
> +		icc_set_bw(msm_mdss->path[i], 0, Bps_to_icc(bw));
> +}
> +
>   static void msm_mdss_irq(struct irq_desc *desc)
>   {
>   	struct msm_mdss *msm_mdss = irq_desc_get_handler_data(desc);
> @@ -136,6 +178,13 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>   {
>   	int ret;
>   
> +	/*
> +	 * Several components have AXI clocks that can only be turned on if
> +	 * the interconnect is enabled (non-zero bandwidth). Let's make sure
> +	 * that the interconnects are at least at a minimum amount.
> +	 */
> +	msm_mdss_icc_request_bw(msm_mdss, MIN_IB_BW);
> +

This patch does two things :

1) Move the min icc vote from the dpu_runtime_resume() path to the 
msm_mdss_enable() so that while resuming, we add the min vote to the 
parent device. We do need a min vote before turning on the AXI clk as 
per this comment mentioned in c33b7c0389e1 (drm/msm/dpu: add support for 
clk and bw scaling for display)


@@ -1101,8 +1129,15 @@ static int __maybe_unused 
dpu_runtime_resume(struct device *dev)
         struct drm_encoder *encoder;
         struct drm_device *ddev;
         struct dss_module_power *mp = &dpu_kms->mp;
+       int i;

         ddev = dpu_kms->dev;
+
+       /* Min vote of BW is required before turning on AXI clk */
+       for (i = 0; i < dpu_kms->num_paths; i++)
+               icc_set_bw(dpu_kms->path[i], 0,
+                       dpu_kms->catalog->perf.min_dram_ib);

So I understand and I am fine with this part.

2) Add a min vote in msm_mdss_init().

This is the part I am not able to fully follow.

If we only need to add the min vote before voting for the clocks, adding 
it in mdss_mdss_enable() should be enough.

Do we need this part of adding the min vote to the msm_mdss_init()?

If so, why?

>   	ret = clk_bulk_prepare_enable(msm_mdss->num_clocks, msm_mdss->clocks);
>   	if (ret) {
>   		dev_err(msm_mdss->dev, "clock enable failed, ret:%d\n", ret);
> @@ -178,6 +227,7 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>   static int msm_mdss_disable(struct msm_mdss *msm_mdss)
>   {
>   	clk_bulk_disable_unprepare(msm_mdss->num_clocks, msm_mdss->clocks);
> +	msm_mdss_icc_request_bw(msm_mdss, 0);
>   
>   	return 0;
>   }
> @@ -271,6 +321,14 @@ static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5
>   
>   	dev_dbg(&pdev->dev, "mapped mdss address space @%pK\n", msm_mdss->mmio);
>   
> +	ret = msm_mdss_parse_data_bus_icc_path(&pdev->dev, msm_mdss);
> +	if (ret)
> +		return ERR_PTR(ret);
> +	ret = devm_add_action_or_reset(&pdev->dev, msm_mdss_put_icc_path, msm_mdss);
> +	if (ret)
> +		return ERR_PTR(ret);
> +	msm_mdss_icc_request_bw(msm_mdss, MIN_IB_BW);
> +
>   	if (is_mdp5)
>   		ret = mdp5_mdss_parse_clock(pdev, &msm_mdss->clocks);
>   	else
