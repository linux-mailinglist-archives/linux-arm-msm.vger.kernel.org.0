Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D9A71B2CB3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2020 18:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbgDUQav (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 12:30:51 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:21763 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725994AbgDUQau (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 12:30:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587486648; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=p2pqHYfX5tcU/ZFVHOz/ZCIkibKmHfF8ThmOXGwa8QU=; b=s36r9SJ8P2c/Z2Zf0Qmekg6q85TRuaotNQxiOlvC0wy90E3EEpeSs02vaHKQDmsGIIAKM6CN
 XgXhpuJKe8v+fLlQJunCglHFQn84hGWUt+gSQxjMOc93q+2pvvqxDQAs3VMso0NgIVtoxYEu
 oyOprEqgulqSgTv1e3WtNnPOB8U=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9f1f96.7f7bba5a6570-smtp-out-n01;
 Tue, 21 Apr 2020 16:30:14 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C6948C433CB; Tue, 21 Apr 2020 16:30:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B6A65C433D2;
        Tue, 21 Apr 2020 16:30:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B6A65C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Tue, 21 Apr 2020 10:30:09 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sharat Masetty <smasetty@codeaurora.org>,
        "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/9] drm/msm/a6xx: HFI v2 for A640 and A650
Message-ID: <20200421163009.GA13825@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Jonathan Marek <jonathan@marek.ca>,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sharat Masetty <smasetty@codeaurora.org>,
        "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200420140313.7263-1-jonathan@marek.ca>
 <20200420140313.7263-5-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420140313.7263-5-jonathan@marek.ca>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Apr 20, 2020 at 10:03:08AM -0400, Jonathan Marek wrote:
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  68 ++++++++++++---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |   7 ++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c |   6 +-
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 117 ++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.h |  50 ++++++++++-
>  5 files changed, 224 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index c6ecb3189ec5..dc2d69837110 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -126,8 +126,6 @@ static void __a6xx_gmu_set_freq(struct a6xx_gmu *gmu, int index)
>  	if (ret)
>  		dev_err(gmu->dev, "GMU set GPU frequency error: %d\n", ret);
>  
> -	gmu->freq = gmu->gpu_freqs[index];
> -
>  	/*
>  	 * Eventually we will want to scale the path vote with the frequency but
>  	 * for now leave it at max so that the performance is nominal.
> @@ -151,7 +149,12 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, unsigned long freq)
>  
>  	gmu->current_perf_index = perf_index;
>  
> -	__a6xx_gmu_set_freq(gmu, perf_index);
> +	if (gmu->legacy)
> +		__a6xx_gmu_set_freq(gmu, perf_index);
> +	else
> +		a6xx_hfi_set_freq(gmu, perf_index);

Welcome to the first great GMU schism. There are going to be a lot of these if()
statements and my guess is that it won't get any cleaner in the future.

The best option in my opinion would be to make two separate GMU implementations
and select the probe either from the gpu list or the compatible string and use
function pointers for the functions that are called from a6xx_gpu.c and
a6xx_gpu_state.c.

We _could_ make the gmu->legacy thing work but if someday there is a another
schism we would be sad that we didn't do the ground work now.

We could also do the same for HFI, but I think there is a bit less of a delta
there and there isn't a harm in having a _v1 function or two laying around.

> +
> +	gmu->freq = gmu->gpu_freqs[perf_index];
>  }
>  
>  unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu)
> @@ -231,19 +234,26 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
>  
>  	switch (state) {
>  	case GMU_OOB_GPU_SET:
> -		request = GMU_OOB_GPU_SET_REQUEST;
> -		ack = GMU_OOB_GPU_SET_ACK;
> +		if (gmu->legacy) {
> +			request = GMU_OOB_GPU_SET_REQUEST;
> +			ack = GMU_OOB_GPU_SET_ACK;
> +		} else {
> +			request = GMU_OOB_GPU_SET_REQUEST_NEW;
> +			ack = GMU_OOB_GPU_SET_ACK_NEW;
> +		}
>  		name = "GPU_SET";
>  		break;
>  	case GMU_OOB_BOOT_SLUMBER:
>  		request = GMU_OOB_BOOT_SLUMBER_REQUEST;
>  		ack = GMU_OOB_BOOT_SLUMBER_ACK;
>  		name = "BOOT_SLUMBER";
> +		WARN_ON(!gmu->legacy);

This is unlikely to be the case - these should only be called from within the
GMU code and we should be able to control it.

>  		break;
>  	case GMU_OOB_DCVS_SET:
>  		request = GMU_OOB_DCVS_REQUEST;
>  		ack = GMU_OOB_DCVS_ACK;
>  		name = "GPU_DCVS";
> +		WARN_ON(!gmu->legacy);

Same.

>  		break;
>  	default:
>  		return -EINVAL;
> @@ -271,6 +281,13 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
>  /* Clear a pending OOB state in the GMU */
>  void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
>  {
> +	if (!gmu->legacy) {
> +		WARN_ON(state != GMU_OOB_GPU_SET);
> +		gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET,
> +			1 << GMU_OOB_GPU_SET_CLEAR_NEW);
> +		return;
> +	}

A good example of the usefulness of per-implementation functions.

> +
>  	switch (state) {
>  	case GMU_OOB_GPU_SET:
>  		gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET,
> @@ -293,6 +310,9 @@ static int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
>  	int ret;
>  	u32 val;
>  
> +	if (!gmu->legacy)
> +		return 0;
> +
>  	gmu_write(gmu, REG_A6XX_GMU_GX_SPTPRAC_POWER_CONTROL, 0x778000);
>  
>  	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_SPTPRAC_PWR_CLK_STATUS, val,
> @@ -312,6 +332,9 @@ static void a6xx_sptprac_disable(struct a6xx_gmu *gmu)
>  	u32 val;
>  	int ret;
>  
> +	if (!gmu->legacy)
> +		return;
> +
>  	/* Make sure retention is on */
>  	gmu_rmw(gmu, REG_A6XX_GPU_CC_GX_GDSCR, 0, (1 << 11));
>  
> @@ -355,6 +378,11 @@ static int a6xx_gmu_notify_slumber(struct a6xx_gmu *gmu)
>  	if (gmu->idle_level < GMU_IDLE_STATE_SPTP)
>  		a6xx_sptprac_disable(gmu);
>  
> +	if (!gmu->legacy) {
> +		ret = a6xx_hfi_send_prep_slumber(gmu);
> +		goto out;
> +	}
> +
>  	/* Tell the GMU to get ready to slumber */
>  	gmu_write(gmu, REG_A6XX_GMU_BOOT_SLUMBER_OPTION, 1);
>  
> @@ -370,6 +398,7 @@ static int a6xx_gmu_notify_slumber(struct a6xx_gmu *gmu)
>  		}
>  	}
>  
> +out:
>  	/* Put fence into allow mode */
>  	gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
>  	return ret;
> @@ -639,9 +668,11 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
>  	if (ret)
>  		return ret;
>  
> -	ret = a6xx_gmu_gfx_rail_on(gmu);
> -	if (ret)
> -		return ret;
> +	if (gmu->legacy) {
> +		ret = a6xx_gmu_gfx_rail_on(gmu);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	/* Enable SPTP_PC if the CPU is responsible for it */
>  	if (gmu->idle_level < GMU_IDLE_STATE_SPTP) {
> @@ -760,7 +791,10 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
>  	enable_irq(gmu->hfi_irq);
>  
>  	/* Set the GPU to the current freq */
> -	__a6xx_gmu_set_freq(gmu, gmu->current_perf_index);
> +	if (gmu->legacy)
> +		__a6xx_gmu_set_freq(gmu, gmu->current_perf_index);
> +	else
> +		a6xx_hfi_set_freq(gmu, gmu->current_perf_index);
>  
>  	/*
>  	 * "enable" the GX power domain which won't actually do anything but it
> @@ -1305,6 +1339,7 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
>  
>  int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  {
> +	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>  	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>  	struct platform_device *pdev = of_find_device_by_node(node);
>  	int ret;
> @@ -1331,16 +1366,21 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  	if (ret)
>  		goto err_put_device;
>  
> +	if (!adreno_is_a640(adreno_gpu) && !adreno_is_a650(adreno_gpu)) {
> +		/* HFI v1, no sptprac */

This comment isn't accurate, 630 and 618 have sptprac, 640 and 650 do not need
it.

> +		gmu->legacy = true;
> +
> +		/* Allocate memory for the GMU debug region */
> +		gmu->debug = a6xx_gmu_memory_alloc(gmu, SZ_16K, 0);
> +		if (IS_ERR(gmu->debug))
> +			goto err_memory;
> +	}
> +
>  	/* Allocate memory for for the HFI queues */
>  	gmu->hfi = a6xx_gmu_memory_alloc(gmu, SZ_16K, 0);
>  	if (IS_ERR(gmu->hfi))
>  		goto err_memory;
>  
> -	/* Allocate memory for the GMU debug region */
> -	gmu->debug = a6xx_gmu_memory_alloc(gmu, SZ_16K, 0);
> -	if (IS_ERR(gmu->debug))
> -		goto err_memory;
> -
>  	/* Map the GMU registers */
>  	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
>  	if (IS_ERR(gmu->mmio))
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index 2af91ed7ed0c..781714ffaa91 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -80,6 +80,7 @@ struct a6xx_gmu {
>  
>  	bool initialized;
>  	bool hung;
> +	bool legacy; /* a618 or a630 */
>  };
>  
>  static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)
> @@ -160,10 +161,16 @@ enum a6xx_gmu_oob_state {
>  #define GMU_OOB_GPU_SET_ACK	24
>  #define GMU_OOB_GPU_SET_CLEAR	24
>  
> +#define GMU_OOB_GPU_SET_REQUEST_NEW	30
> +#define GMU_OOB_GPU_SET_ACK_NEW		31
> +#define GMU_OOB_GPU_SET_CLEAR_NEW	31
> +
>  
>  void a6xx_hfi_init(struct a6xx_gmu *gmu);
>  int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state);
>  void a6xx_hfi_stop(struct a6xx_gmu *gmu);
> +int a6xx_hfi_send_prep_slumber(struct a6xx_gmu *gmu);
> +int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int index);
>  
>  bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu);
>  bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 68af24150de5..a860d4970e10 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -566,8 +566,10 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>  	 */
>  	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
>  
> -	/* Take the GMU out of its special boot mode */
> -	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_BOOT_SLUMBER);
> +	if (a6xx_gpu->gmu.legacy) {
> +		/* Take the GMU out of its special boot mode */
> +		a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_BOOT_SLUMBER);
> +	}
>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index e450e0b97211..3d4b142d8fb3 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -17,10 +17,14 @@ static const char * const a6xx_hfi_msg_id[] = {
>  	HFI_MSG_ID(HFI_H2F_MSG_BW_TABLE),
>  	HFI_MSG_ID(HFI_H2F_MSG_PERF_TABLE),
>  	HFI_MSG_ID(HFI_H2F_MSG_TEST),
> +	HFI_MSG_ID(HFI_H2F_MSG_START),
> +	HFI_MSG_ID(HFI_H2F_MSG_CORE_FW_START),
> +	HFI_MSG_ID(HFI_H2F_MSG_GX_BW_PERF_VOTE),
> +	HFI_MSG_ID(HFI_H2F_MSG_PREPARE_SLUMBER),
>  };
>  
> -static int a6xx_hfi_queue_read(struct a6xx_hfi_queue *queue, u32 *data,
> -		u32 dwords)
> +static int a6xx_hfi_queue_read(struct a6xx_gmu *gmu,
> +	struct a6xx_hfi_queue *queue, u32 *data, u32 dwords)
>  {
>  	struct a6xx_hfi_queue_header *header = queue->header;
>  	u32 i, hdr, index = header->read_index;
> @@ -48,6 +52,9 @@ static int a6xx_hfi_queue_read(struct a6xx_hfi_queue *queue, u32 *data,
>  		index = (index + 1) % header->size;
>  	}
>  
> +	if (!gmu->legacy)
> +		index = ALIGN(index, 4) % header->size;
> +
>  	header->read_index = index;
>  	return HFI_HEADER_SIZE(hdr);
>  }
> @@ -73,6 +80,12 @@ static int a6xx_hfi_queue_write(struct a6xx_gmu *gmu,
>  		index = (index + 1) % header->size;
>  	}
>  
> +	/* Cookify any non used data at the end of the write buffer */
> +	if (!gmu->legacy) {
> +		for (; index % 4; index = (index + 1) % header->size)
> +			queue->data[index] = 0xfafafafa;
> +	}
> +
>  	header->write_index = index;
>  	spin_unlock(&queue->lock);
>  
> @@ -106,7 +119,7 @@ static int a6xx_hfi_wait_for_ack(struct a6xx_gmu *gmu, u32 id, u32 seqnum,
>  		struct a6xx_hfi_msg_response resp;
>  
>  		/* Get the next packet */
> -		ret = a6xx_hfi_queue_read(queue, (u32 *) &resp,
> +		ret = a6xx_hfi_queue_read(gmu, queue, (u32 *) &resp,
>  			sizeof(resp) >> 2);
>  
>  		/* If the queue is empty our response never made it */
> @@ -195,6 +208,28 @@ static int a6xx_hfi_get_fw_version(struct a6xx_gmu *gmu, u32 *version)
>  		version, sizeof(*version));
>  }
>  
> +static int a6xx_hfi_send_perf_table_v1(struct a6xx_gmu *gmu)
> +{
> +	struct a6xx_hfi_msg_perf_table_v1 msg = { 0 };
> +	int i;
> +
> +	msg.num_gpu_levels = gmu->nr_gpu_freqs;
> +	msg.num_gmu_levels = gmu->nr_gmu_freqs;
> +
> +	for (i = 0; i < gmu->nr_gpu_freqs; i++) {
> +		msg.gx_votes[i].vote = gmu->gx_arc_votes[i];
> +		msg.gx_votes[i].freq = gmu->gpu_freqs[i] / 1000;
> +	}
> +
> +	for (i = 0; i < gmu->nr_gmu_freqs; i++) {
> +		msg.cx_votes[i].vote = gmu->cx_arc_votes[i];
> +		msg.cx_votes[i].freq = gmu->gmu_freqs[i] / 1000;
> +	}
> +
> +	return a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_PERF_TABLE, &msg, sizeof(msg),
> +		NULL, 0);
> +}
> +
>  static int a6xx_hfi_send_perf_table(struct a6xx_gmu *gmu)
>  {
>  	struct a6xx_hfi_msg_perf_table msg = { 0 };
> @@ -205,6 +240,7 @@ static int a6xx_hfi_send_perf_table(struct a6xx_gmu *gmu)
>  
>  	for (i = 0; i < gmu->nr_gpu_freqs; i++) {
>  		msg.gx_votes[i].vote = gmu->gx_arc_votes[i];
> +		msg.gx_votes[i].acd = 0xffffffff;
>  		msg.gx_votes[i].freq = gmu->gpu_freqs[i] / 1000;
>  	}
>  
> @@ -306,7 +342,45 @@ static int a6xx_hfi_send_test(struct a6xx_gmu *gmu)
>  		NULL, 0);
>  }
>  
> -int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state)
> +int a6xx_hfi_send_start(struct a6xx_gmu *gmu)
> +{
> +	struct a6xx_hfi_msg_start msg = { 0 };
> +
> +	return a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_START, &msg, sizeof(msg),
> +		NULL, 0);
> +}
> +
> +int a6xx_hfi_send_core_fw_start(struct a6xx_gmu *gmu)
> +{
> +	struct a6xx_hfi_msg_core_fw_start msg = { 0 };
> +
> +	return a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_CORE_FW_START, &msg,
> +		sizeof(msg), NULL, 0);
> +}
> +
> +int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int index)
> +{
> +	struct a6xx_hfi_gx_bw_perf_vote_cmd msg = { 0 };
> +
> +	msg.ack_type = 1; /* blocking */
> +	msg.freq = index;
> +	msg.bw = 0; /* TODO: bus scaling */
> +
> +	return a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_GX_BW_PERF_VOTE, &msg,
> +		sizeof(msg), NULL, 0);
> +}
> +
> +int a6xx_hfi_send_prep_slumber(struct a6xx_gmu *gmu)
> +{
> +	struct a6xx_hfi_prep_slumber_cmd msg = { 0 };
> +
> +	/* TODO: should freq and bw fields be non-zero ? */
> +
> +	return a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_PREPARE_SLUMBER, &msg,
> +		sizeof(msg), NULL, 0);
> +}
> +
> +static int a6xx_hfi_start_v1(struct a6xx_gmu *gmu, int boot_state)
>  {
>  	int ret;
>  
> @@ -324,7 +398,7 @@ int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state)
>  	 * the GMU firmware
>  	 */
>  
> -	ret = a6xx_hfi_send_perf_table(gmu);
> +	ret = a6xx_hfi_send_perf_table_v1(gmu);
>  	if (ret)
>  		return ret;
>  
> @@ -341,6 +415,37 @@ int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state)
>  	return 0;
>  }
>  
> +int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state)
> +{
> +	int ret;
> +
> +	if (gmu->legacy)
> +		return a6xx_hfi_start_v1(gmu, boot_state);
> +
> +
> +	ret = a6xx_hfi_send_perf_table(gmu);
> +	if (ret)
> +		return ret;
> +
> +	ret = a6xx_hfi_send_bw_table(gmu);
> +	if (ret)
> +		return ret;
> +
> +	ret = a6xx_hfi_send_core_fw_start(gmu);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Downstream driver sends this in its "a6xx_hw_init" equivalent,
> +	 * but seems to be no harm in sending it here
> +	 */
> +	ret = a6xx_hfi_send_start(gmu);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
>  void a6xx_hfi_stop(struct a6xx_gmu *gmu)
>  {
>  	int i;
> @@ -415,5 +520,5 @@ void a6xx_hfi_init(struct a6xx_gmu *gmu)
>  	/* GMU response queue */
>  	offset += SZ_4K;
>  	a6xx_hfi_queue_init(&gmu->queues[1], &headers[1], hfi->virt + offset,
> -		hfi->iova + offset, 4);
> +		hfi->iova + offset, gmu->legacy ? 4 : 1);
>  }
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
> index 60d1319fa44f..2bd670ca42d6 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
> @@ -51,7 +51,8 @@ struct a6xx_hfi_queue {
>  /* HFI message types */
>  
>  #define HFI_MSG_CMD 0
> -#define HFI_MSG_ACK 2
> +#define HFI_MSG_ACK 1
> +#define HFI_MSG_ACK_V1 2
>  
>  #define HFI_F2H_MSG_ACK 126
>  
> @@ -94,7 +95,13 @@ struct perf_level {
>  	u32 freq;
>  };
>  
> -struct a6xx_hfi_msg_perf_table {
> +struct perf_gx_level {
> +	u32 vote;
> +	u32 acd;
> +	u32 freq;
> +};

These all need to be __packed for the usual sad reasons.

> +
> +struct a6xx_hfi_msg_perf_table_v1 {
>  	u32 header;
>  	u32 num_gpu_levels;
>  	u32 num_gmu_levels;
> @@ -103,6 +110,15 @@ struct a6xx_hfi_msg_perf_table {
>  	struct perf_level cx_votes[4];
>  };
>  
> +struct a6xx_hfi_msg_perf_table {
> +	u32 header;
> +	u32 num_gpu_levels;
> +	u32 num_gmu_levels;
> +
> +	struct perf_gx_level gx_votes[16];
> +	struct perf_level cx_votes[4];
> +};
> +
>  #define HFI_H2F_MSG_BW_TABLE 3
>  
>  struct a6xx_hfi_msg_bw_table {
> @@ -124,4 +140,34 @@ struct a6xx_hfi_msg_test {
>  	u32 header;
>  };
>  
> +#define HFI_H2F_MSG_START 10
> +
> +struct a6xx_hfi_msg_start {
> +	u32 header;
> +};
> +
> +#define HFI_H2F_MSG_CORE_FW_START 14
> +
> +struct a6xx_hfi_msg_core_fw_start {
> +	u32 header;
> +	u32 handle;
> +};
> +
> +#define HFI_H2F_MSG_GX_BW_PERF_VOTE 30
> +
> +struct a6xx_hfi_gx_bw_perf_vote_cmd {
> +	u32 header;
> +	u32 ack_type;
> +	u32 freq;
> +	u32 bw;
> +};
> +
> +#define HFI_H2F_MSG_PREPARE_SLUMBER 33
> +
> +struct a6xx_hfi_prep_slumber_cmd {
> +	u32 header;
> +	u32 bw;
> +	u32 freq;
> +};
> +
>  #endif
> -- 
> 2.26.1
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
