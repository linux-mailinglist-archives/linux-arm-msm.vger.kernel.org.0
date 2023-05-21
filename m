Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9533170AFCA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 21:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjEUTVP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 15:21:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbjEUTVO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 15:21:14 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B755E1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 12:21:12 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 48F063F30B;
        Sun, 21 May 2023 21:21:10 +0200 (CEST)
Date:   Sun, 21 May 2023 21:21:09 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/msm/dpu: switch dpu_encoder to use
 drm_debugfs_add_file()
Message-ID: <4qsldyocdlx6ddoitu76atec5ph2iijtznpbnefdrao5nuiant@v2vcnnkn2fkb>
References: <20230521190442.8293-1-dmitry.baryshkov@linaro.org>
 <20230521190442.8293-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230521190442.8293-3-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-21 22:04:42, Dmitry Baryshkov wrote:
> Use drm_debugfs_add_file() for encoder's status file. This changes the
> name of the status file from encoder%d/status to just encoder%d.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 40 ++++++---------------
>  1 file changed, 11 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index af34932729db..0ac68f44ec74 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -14,6 +14,7 @@
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_crtc.h>
> +#include <drm/drm_debugfs.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_probe_helper.h>
>  
> @@ -142,7 +143,6 @@ enum dpu_enc_rc_states {
>   * @crtc_kickoff_cb:		Callback into CRTC that will flush & start
>   *				all CTL paths
>   * @crtc_kickoff_cb_data:	Opaque user data given to crtc_kickoff_cb
> - * @debugfs_root:		Debug file system root file node
>   * @enc_lock:			Lock around physical encoder
>   *				create/destroy/enable/disable
>   * @frame_busy_mask:		Bitmask tracking which phys_enc we are still
> @@ -186,7 +186,6 @@ struct dpu_encoder_virt {
>  	struct drm_crtc *crtc;
>  	struct drm_connector *connector;
>  
> -	struct dentry *debugfs_root;
>  	struct mutex enc_lock;
>  	DECLARE_BITMAP(frame_busy_mask, MAX_PHYS_ENCODERS_PER_VIRTUAL);
>  	void (*crtc_frame_event_cb)(void *, u32 event);
> @@ -2091,7 +2090,8 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>  #ifdef CONFIG_DEBUG_FS
>  static int _dpu_encoder_status_show(struct seq_file *s, void *data)
>  {
> -	struct dpu_encoder_virt *dpu_enc = s->private;
> +	struct drm_debugfs_entry *entry = s->private;
> +	struct dpu_encoder_virt *dpu_enc = entry->file.data;
>  	int i;
>  
>  	mutex_lock(&dpu_enc->enc_lock);
> @@ -2110,48 +2110,31 @@ static int _dpu_encoder_status_show(struct seq_file *s, void *data)
>  	return 0;
>  }
>  
> -DEFINE_SHOW_ATTRIBUTE(_dpu_encoder_status);
> -
> -static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
> +static void _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
>  {
>  	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> -
> -	char name[12];
> +	char *name;
>  
>  	if (!drm_enc->dev) {
>  		DPU_ERROR("invalid encoder or kms\n");
> -		return -EINVAL;
> +		return;
>  	}
>  
> -	snprintf(name, sizeof(name), "encoder%u", drm_enc->base.id);
> +	name = devm_kasprintf(drm_enc->dev->dev, GFP_KERNEL, "encoder%u", drm_enc->base.id);
>  
> -	/* create overall sub-directory for the encoder */
> -	dpu_enc->debugfs_root = debugfs_create_dir(name,
> -			drm_enc->dev->primary->debugfs_root);
> -
> -	/* don't error check these */
> -	debugfs_create_file("status", 0600,
> -		dpu_enc->debugfs_root, dpu_enc, &_dpu_encoder_status_fops);

I still have a looping callback to late_register() here, what series
does this depend on?

- Marijn

> -
> -	return 0;
> +	drm_debugfs_add_file(drm_enc->dev, name, _dpu_encoder_status_show, dpu_enc);
>  }
>  #else
> -static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
> +static void _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
>  {
> -	return 0;
>  }
>  #endif
>  
>  static int dpu_encoder_late_register(struct drm_encoder *encoder)
>  {
> -	return _dpu_encoder_init_debugfs(encoder);
> -}
> -
> -static void dpu_encoder_early_unregister(struct drm_encoder *encoder)
> -{
> -	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
> +	_dpu_encoder_init_debugfs(encoder);
>  
> -	debugfs_remove_recursive(dpu_enc->debugfs_root);
> +	return 0;
>  }
>  
>  static int dpu_encoder_virt_add_phys_encs(
> @@ -2380,7 +2363,6 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
>  static const struct drm_encoder_funcs dpu_encoder_funcs = {
>  		.destroy = dpu_encoder_destroy,
>  		.late_register = dpu_encoder_late_register,
> -		.early_unregister = dpu_encoder_early_unregister,
>  };
>  
>  int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
> -- 
> 2.39.2
> 
