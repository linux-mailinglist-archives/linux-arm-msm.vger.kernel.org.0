Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2596370B0D7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 23:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbjEUVbN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 17:31:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjEUVbM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 17:31:12 -0400
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB3ABF
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 14:31:12 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 626C43F342;
        Sun, 21 May 2023 23:31:10 +0200 (CEST)
Date:   Sun, 21 May 2023 23:31:09 +0200
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
Subject: Re: [PATCH v2 1/3] drm/msm/dpu: drop
 dpu_encoder_phys_ops::late_register()
Message-ID: <qxs3qeycbnxcvsqoy3lrap7j7cuamhb7k4sfsic7aiu5b3zrmj@qjgd2ojhsysw>
References: <20230521192230.9747-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230521192230.9747-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-21 22:22:28, Dmitry Baryshkov wrote:
> This callback has been unused since the driver being added. Drop it now.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 7 -------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h | 3 ---
>  2 files changed, 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1dc5dbe58572..c771383446f2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2115,7 +2115,6 @@ DEFINE_SHOW_ATTRIBUTE(_dpu_encoder_status);
>  static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
>  {
>  	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> -	int i;
>  
>  	char name[DPU_NAME_SIZE];
>  
> @@ -2134,12 +2133,6 @@ static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
>  	debugfs_create_file("status", 0600,
>  		dpu_enc->debugfs_root, dpu_enc, &_dpu_encoder_status_fops);
>  
> -	for (i = 0; i < dpu_enc->num_phys_encs; i++)
> -		if (dpu_enc->phys_encs[i]->ops.late_register)
> -			dpu_enc->phys_encs[i]->ops.late_register(
> -					dpu_enc->phys_encs[i],
> -					dpu_enc->debugfs_root);
> -
>  	return 0;
>  }
>  #else
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index 1d434b22180d..9e29079a6fc4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -63,7 +63,6 @@ struct dpu_encoder_phys;
>  /**
>   * struct dpu_encoder_phys_ops - Interface the physical encoders provide to
>   *	the containing virtual encoder.
> - * @late_register:		DRM Call. Add Userspace interfaces, debugfs.
>   * @prepare_commit:		MSM Atomic Call, start of atomic commit sequence
>   * @is_master:			Whether this phys_enc is the current master
>   *				encoder. Can be switched at enable time. Based
> @@ -93,8 +92,6 @@ struct dpu_encoder_phys;
>   */
>  
>  struct dpu_encoder_phys_ops {
> -	int (*late_register)(struct dpu_encoder_phys *encoder,
> -			struct dentry *debugfs_root);
>  	void (*prepare_commit)(struct dpu_encoder_phys *encoder);
>  	bool (*is_master)(struct dpu_encoder_phys *encoder);
>  	void (*atomic_mode_set)(struct dpu_encoder_phys *encoder,
> -- 
> 2.39.2
> 
