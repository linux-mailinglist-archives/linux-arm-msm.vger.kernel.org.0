Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C891636CB8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Apr 2021 21:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238041AbhD0TUk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Apr 2021 15:20:40 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:34156 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237999AbhD0TUj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Apr 2021 15:20:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619551196; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=MAzkDIlRtplfc49CEL3ntp+UxNNPspW4EbqnNFGwaW4=;
 b=haSrMChZLLJzRPulFdJyLlvNV7bQwuxWWB7NXyoL9VKSUpaWsNMxQNSqyp2G9hG3o5N37F4y
 +YpYTUyBkmOitCDWO3tItVICSCteMTG9x9g+iaqlaktOw967JkEDi1Lm9V7VL5LUBcVgdI+o
 KxZI/MCplFzvP1BUtW+ojpACptY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 608863dae0e9c9a6b6b95342 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 27 Apr 2021 19:19:54
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 664A0C43144; Tue, 27 Apr 2021 19:19:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A278FC433F1;
        Tue, 27 Apr 2021 19:19:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 27 Apr 2021 12:19:52 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH v2 2/4] drm/msm: make msm_disp_state transient
 data struct
In-Reply-To: <20210427001828.2375555-3-dmitry.baryshkov@linaro.org>
References: <20210427001828.2375555-1-dmitry.baryshkov@linaro.org>
 <20210427001828.2375555-3-dmitry.baryshkov@linaro.org>
Message-ID: <64eb1a3343cc9530eecea6816d298ae0@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry

On 2021-04-26 17:18, Dmitry Baryshkov wrote:
> Instead of allocating snapshotting structure at the driver probe time
> and later handling concurrent access, actual state, etc, make
> msm_disp_state transient struct. Allocate one when snapshotting happens
> and free it after coredump data is read by userspace.
> 
Can you please check my previous comment on coredump_pending?

https://lore.kernel.org/dri-devel/186825e2fb7bea8d45f33b5c1fa3509f@codeaurora.org/T/#u

That helps to serialize read/write of coredump.

Rest of the changes on this one look fine to me.

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/msm_disp_snapshot.c  | 90 ++++++-------------
>  drivers/gpu/drm/msm/disp/msm_disp_snapshot.h  | 13 +--
>  .../gpu/drm/msm/disp/msm_disp_snapshot_util.c |  5 +-
>  drivers/gpu/drm/msm/msm_kms.h                 |  6 +-
>  4 files changed, 37 insertions(+), 77 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
> b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
> index 70fd5a1fe13e..a4a7cb06bc87 100644
> --- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
> +++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
> @@ -7,8 +7,7 @@
> 
>  #include "msm_disp_snapshot.h"
> 
> -#ifdef CONFIG_DEV_COREDUMP
> -static ssize_t disp_devcoredump_read(char *buffer, loff_t offset,
> +static ssize_t __maybe_unused disp_devcoredump_read(char *buffer,
> loff_t offset,
>  		size_t count, void *data, size_t datalen)
>  {
>  	struct drm_print_iterator iter;
> @@ -29,52 +28,47 @@ static ssize_t disp_devcoredump_read(char *buffer,
> loff_t offset,
>  	return count - iter.remain;
>  }
> 
> -static void disp_devcoredump_free(void *data)
> +static void _msm_disp_snapshot_work(struct kthread_work *work)
>  {
> +	struct msm_kms *kms = container_of(work, struct msm_kms, dump_work);
> +	struct drm_device *drm_dev = kms->dev;
>  	struct msm_disp_state *disp_state;
> +	struct drm_printer p;
> 
> -	disp_state = data;
> -
> -	msm_disp_state_free(disp_state);
> +	disp_state = kzalloc(sizeof(struct msm_disp_state), GFP_KERNEL);
> +	if (!disp_state)
> +		return;
> 
> -	disp_state->coredump_pending = false;
> -}
> -#endif /* CONFIG_DEV_COREDUMP */
> +	disp_state->dev = drm_dev->dev;
> +	disp_state->drm_dev = drm_dev;
> 
> -static void _msm_disp_snapshot_work(struct kthread_work *work)
> -{
> -	struct msm_disp_state *disp_state = container_of(work, struct
> msm_disp_state, dump_work);
> -	struct drm_printer p;
> +	INIT_LIST_HEAD(&disp_state->blocks);
> 
> -	mutex_lock(&disp_state->mutex);
> +	/* Serialize dumping here */
> +	mutex_lock(&kms->dump_mutex);
> 
>  	msm_disp_snapshot_capture_state(disp_state);
> 
> +	mutex_unlock(&kms->dump_mutex);
> +
>  	if (MSM_DISP_SNAPSHOT_DUMP_IN_CONSOLE) {
>  		p = drm_info_printer(disp_state->drm_dev->dev);
>  		msm_disp_state_print(disp_state, &p);
>  	}
> 
>  	/*
> -	 * if devcoredump is not defined free the state immediately
> -	 * otherwise it will be freed in the free handler.
> +	 * If COREDUMP is disabled, the stub will call the free function.
> +	 * If there is a codedump pending for the device, the dev_coredumpm()
> +	 * will also free new coredump state.
>  	 */
> -#ifdef CONFIG_DEV_COREDUMP
>  	dev_coredumpm(disp_state->dev, THIS_MODULE, disp_state, 0, 
> GFP_KERNEL,
> -			disp_devcoredump_read, disp_devcoredump_free);
> -	disp_state->coredump_pending = true;
> -#else
> -	msm_disp_state_free(disp_state);
> -#endif
> -
> -	mutex_unlock(&disp_state->mutex);
> +			disp_devcoredump_read, msm_disp_state_free);
>  }
> 
>  void msm_disp_snapshot_state(struct drm_device *drm_dev)
>  {
>  	struct msm_drm_private *priv;
>  	struct msm_kms *kms;
> -	struct msm_disp_state *disp_state;
> 
>  	if (!drm_dev) {
>  		DRM_ERROR("invalid params\n");
> @@ -83,30 +77,13 @@ void msm_disp_snapshot_state(struct drm_device 
> *drm_dev)
> 
>  	priv = drm_dev->dev_private;
>  	kms = priv->kms;
> -	disp_state = kms->disp_state;
> -
> -	if (!disp_state) {
> -		DRM_ERROR("invalid params\n");
> -		return;
> -	}
> 
> -	/*
> -	 * if there is a coredump pending return immediately till dump
> -	 * if read by userspace or timeout happens
> -	 */
> -	if (disp_state->coredump_pending) {
> -		DRM_DEBUG("coredump is pending read\n");
> -		return;
> -	}
> -
> -	kthread_queue_work(disp_state->dump_worker,
> -			&disp_state->dump_work);
> +	kthread_queue_work(kms->dump_worker, &kms->dump_work);
>  }
> 
>  int msm_disp_snapshot_init(struct drm_device *drm_dev)
>  {
>  	struct msm_drm_private *priv;
> -	struct msm_disp_state *disp_state;
>  	struct msm_kms *kms;
> 
>  	if (!drm_dev) {
> @@ -117,22 +94,13 @@ int msm_disp_snapshot_init(struct drm_device 
> *drm_dev)
>  	priv = drm_dev->dev_private;
>  	kms = priv->kms;
> 
> -	disp_state = devm_kzalloc(drm_dev->dev, sizeof(struct
> msm_disp_state), GFP_KERNEL);
> -
> -	mutex_init(&disp_state->mutex);
> +	mutex_init(&kms->dump_mutex);
> 
> -	disp_state->dev = drm_dev->dev;
> -	disp_state->drm_dev = drm_dev;
> -
> -	INIT_LIST_HEAD(&disp_state->blocks);
> -
> -	disp_state->dump_worker = kthread_create_worker(0, "%s", 
> "disp_snapshot");
> -	if (IS_ERR(disp_state->dump_worker))
> +	kms->dump_worker = kthread_create_worker(0, "%s", "disp_snapshot");
> +	if (IS_ERR(kms->dump_worker))
>  		DRM_ERROR("failed to create disp state task\n");
> 
> -	kthread_init_work(&disp_state->dump_work, _msm_disp_snapshot_work);
> -
> -	kms->disp_state = disp_state;
> +	kthread_init_work(&kms->dump_work, _msm_disp_snapshot_work);
> 
>  	return 0;
>  }
> @@ -141,7 +109,6 @@ void msm_disp_snapshot_destroy(struct drm_device 
> *drm_dev)
>  {
>  	struct msm_kms *kms;
>  	struct msm_drm_private *priv;
> -	struct msm_disp_state *disp_state;
> 
>  	if (!drm_dev) {
>  		DRM_ERROR("invalid params\n");
> @@ -150,12 +117,9 @@ void msm_disp_snapshot_destroy(struct drm_device 
> *drm_dev)
> 
>  	priv = drm_dev->dev_private;
>  	kms = priv->kms;
> -	disp_state = kms->disp_state;
> -
> -	if (disp_state->dump_worker)
> -		kthread_destroy_worker(disp_state->dump_worker);
> 
> -	list_del(&disp_state->blocks);
> +	if (kms->dump_worker)
> +		kthread_destroy_worker(kms->dump_worker);
> 
> -	mutex_destroy(&disp_state->mutex);
> +	mutex_destroy(&kms->dump_mutex);
>  }
> diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
> b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
> index 32f52799a1ba..c6174a366095 100644
> --- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
> +++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
> @@ -41,26 +41,17 @@
>   * struct msm_disp_state - structure to store current dpu state
>   * @dev: device pointer
>   * @drm_dev: drm device pointer
> - * @mutex: mutex to serialize access to serialze dumps, debugfs access
> - * @coredump_pending: coredump is pending read from userspace
>   * @atomic_state: atomic state duplicated at the time of the error
> - * @dump_worker: kworker thread which runs the dump work
> - * @dump_work: kwork which dumps the registers and drm state
>   * @timestamp: timestamp at which the coredump was captured
>   */
>  struct msm_disp_state {
>  	struct device *dev;
>  	struct drm_device *drm_dev;
> -	struct mutex mutex;
> -
> -	bool coredump_pending;
> 
>  	struct list_head blocks;
> 
>  	struct drm_atomic_state *atomic_state;
> 
> -	struct kthread_worker *dump_worker;
> -	struct kthread_work dump_work;
>  	ktime_t timestamp;
>  };
> 
> @@ -123,11 +114,11 @@ void msm_disp_snapshot_capture_state(struct
> msm_disp_state *disp_state);
> 
>  /**
>   * msm_disp_state_free - free the memory after the coredump has been 
> read
> - * @disp_state:	    handle to struct msm_disp_state
> + * @data:	    handle to struct msm_disp_state
> 
>   * Returns: none
>   */
> -void msm_disp_state_free(struct msm_disp_state *disp_state);
> +void msm_disp_state_free(void *data);
> 
>  /**
>   * msm_disp_snapshot_add_block - add a hardware block with its 
> register dump
> diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> index ca6632550337..cabe15190ec1 100644
> --- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> +++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> @@ -142,8 +142,9 @@ void msm_disp_snapshot_capture_state(struct
> msm_disp_state *disp_state)
>  	msm_disp_capture_atomic_state(disp_state);
>  }
> 
> -void msm_disp_state_free(struct msm_disp_state *disp_state)
> +void msm_disp_state_free(void *data)
>  {
> +	struct msm_disp_state *disp_state = data;
>  	struct msm_disp_state_block *block, *tmp;
> 
>  	if (disp_state->atomic_state) {
> @@ -156,6 +157,8 @@ void msm_disp_state_free(struct msm_disp_state 
> *disp_state)
>  		kfree(block->state);
>  		kfree(block);
>  	}
> +
> +	kfree(disp_state);
>  }
> 
>  void msm_disp_snapshot_add_block(struct msm_disp_state *disp_state, 
> u32 len,
> diff --git a/drivers/gpu/drm/msm/msm_kms.h 
> b/drivers/gpu/drm/msm/msm_kms.h
> index 146dcab123f4..086a2d59b8c8 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -156,8 +156,10 @@ struct msm_kms {
>  	/* mapper-id used to request GEM buffer mapped for scanout: */
>  	struct msm_gem_address_space *aspace;
> 
> -	/* handle to disp snapshot state */
> -	struct msm_disp_state *disp_state;
> +	/* disp snapshot support */
> +	struct kthread_worker *dump_worker;
> +	struct kthread_work dump_work;
> +	struct mutex dump_mutex;
> 
>  	/*
>  	 * For async commit, where ->flush_commit() and later happens
