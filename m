Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C23E39C1D8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 23:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbhFDVKZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Jun 2021 17:10:25 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:61350 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229665AbhFDVKX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Jun 2021 17:10:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622840916; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=dCKOEVrjIfHgT1ckEm2KXvtgz8rqh0CFoEBsVNgfo8I=;
 b=wpF8KeBB44+IVAdKpa4ua/85jfUEdfzyxjX/H1Ilutqz22AFJnMwAeYznAaem9/vVvG7rTCA
 j4wAqfSY4CJOt8C6HtGig4WBE9gIj+oUztsPAefZGdlNptrkgPhCfCcWJnt41mQs0r98u1nS
 pt0CUiMotUlWLXaDK+3ErfHaMhg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60ba964b2eaeb98b5e753d29 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 04 Jun 2021 21:08:27
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B2905C4338A; Fri,  4 Jun 2021 21:08:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BA491C433D3;
        Fri,  4 Jun 2021 21:08:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 04 Jun 2021 14:08:25 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH v3 1/4] drm/msm/dpu: remove unused dpu_hw_blk
 features
In-Reply-To: <20210515190909.1809050-2-dmitry.baryshkov@linaro.org>
References: <20210515190909.1809050-1-dmitry.baryshkov@linaro.org>
 <20210515190909.1809050-2-dmitry.baryshkov@linaro.org>
Message-ID: <e74f4df7969e6b74799bcd8d6d92781c@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-15 12:09, Dmitry Baryshkov wrote:
> Remove all unused dpu_hw_blk features and functions:
> - dpu_hw_blk_get()/_put() and respective refcounting,
> - global list of all dpu_hw_blk instances,
> - dpu_hw_blk_ops and empty implementation inside each hw_blk subdriver.
> 
> This leaves dpu_hw_blk as a placeholder with just type and index.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c    | 104 +-----------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h    |  19 +---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |   4 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c   |   4 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   |   4 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c     |   4 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    |   4 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |   4 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |   4 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    |   4 +-
>  10 files changed, 10 insertions(+), 145 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
> index 819b26e660b9..abad043f35f5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
> @@ -11,33 +11,16 @@
>  #include "dpu_hw_mdss.h"
>  #include "dpu_hw_blk.h"
> 
> -/* Serialization lock for dpu_hw_blk_list */
> -static DEFINE_MUTEX(dpu_hw_blk_lock);
> -
> -/* List of all hw block objects */
> -static LIST_HEAD(dpu_hw_blk_list);
> -
>  /**
>   * dpu_hw_blk_init - initialize hw block object
>   * @hw_blk: pointer to hw block object
>   * @type: hw block type - enum dpu_hw_blk_type
>   * @id: instance id of the hw block
> - * @ops: Pointer to block operations
>   */
> -void dpu_hw_blk_init(struct dpu_hw_blk *hw_blk, u32 type, int id,
> -		struct dpu_hw_blk_ops *ops)
> +void dpu_hw_blk_init(struct dpu_hw_blk *hw_blk, u32 type, int id)
>  {
> -	INIT_LIST_HEAD(&hw_blk->list);
>  	hw_blk->type = type;
>  	hw_blk->id = id;
> -	atomic_set(&hw_blk->refcount, 0);
> -
> -	if (ops)
> -		hw_blk->ops = *ops;
> -
> -	mutex_lock(&dpu_hw_blk_lock);
> -	list_add(&hw_blk->list, &dpu_hw_blk_list);
> -	mutex_unlock(&dpu_hw_blk_lock);
>  }
> 
>  /**
> @@ -51,89 +34,4 @@ void dpu_hw_blk_destroy(struct dpu_hw_blk *hw_blk)
>  		pr_err("invalid parameters\n");
>  		return;
>  	}
> -
> -	if (atomic_read(&hw_blk->refcount))
> -		pr_err("hw_blk:%d.%d invalid refcount\n", hw_blk->type,
> -				hw_blk->id);
> -
> -	mutex_lock(&dpu_hw_blk_lock);
> -	list_del(&hw_blk->list);
> -	mutex_unlock(&dpu_hw_blk_lock);
> -}
> -
> -/**
> - * dpu_hw_blk_get - get hw_blk from free pool
> - * @hw_blk: if specified, increment reference count only
> - * @type: if hw_blk is not specified, allocate the next available of 
> this type
> - * @id: if specified (>= 0), allocate the given instance of the above 
> type
> - * return: pointer to hw block object
> - */
> -struct dpu_hw_blk *dpu_hw_blk_get(struct dpu_hw_blk *hw_blk, u32 type, 
> int id)
> -{
> -	struct dpu_hw_blk *curr;
> -	int rc, refcount;
> -
> -	if (!hw_blk) {
> -		mutex_lock(&dpu_hw_blk_lock);
> -		list_for_each_entry(curr, &dpu_hw_blk_list, list) {
> -			if ((curr->type != type) ||
> -					(id >= 0 && curr->id != id) ||
> -					(id < 0 &&
> -						atomic_read(&curr->refcount)))
> -				continue;
> -
> -			hw_blk = curr;
> -			break;
> -		}
> -		mutex_unlock(&dpu_hw_blk_lock);
> -	}
> -
> -	if (!hw_blk) {
> -		pr_debug("no hw_blk:%d\n", type);
> -		return NULL;
> -	}
> -
> -	refcount = atomic_inc_return(&hw_blk->refcount);
> -
> -	if (refcount == 1 && hw_blk->ops.start) {
> -		rc = hw_blk->ops.start(hw_blk);
> -		if (rc) {
> -			pr_err("failed to start  hw_blk:%d rc:%d\n", type, rc);
> -			goto error_start;
> -		}
> -	}
> -
> -	pr_debug("hw_blk:%d.%d refcount:%d\n", hw_blk->type,
> -			hw_blk->id, refcount);
> -	return hw_blk;
> -
> -error_start:
> -	dpu_hw_blk_put(hw_blk);
> -	return ERR_PTR(rc);
> -}
> -
> -/**
> - * dpu_hw_blk_put - put hw_blk to free pool if decremented refcount is 
> zero
> - * @hw_blk: hw block to be freed
> - */
> -void dpu_hw_blk_put(struct dpu_hw_blk *hw_blk)
> -{
> -	if (!hw_blk) {
> -		pr_err("invalid parameters\n");
> -		return;
> -	}
> -
> -	pr_debug("hw_blk:%d.%d refcount:%d\n", hw_blk->type, hw_blk->id,
> -			atomic_read(&hw_blk->refcount));
> -
> -	if (!atomic_read(&hw_blk->refcount)) {
> -		pr_err("hw_blk:%d.%d invalid put\n", hw_blk->type, hw_blk->id);
> -		return;
> -	}
> -
> -	if (atomic_dec_return(&hw_blk->refcount))
> -		return;
> -
> -	if (hw_blk->ops.stop)
> -		hw_blk->ops.stop(hw_blk);
>  }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h
> index 2bf737f8dd1b..fb3be9a36a50 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h
> @@ -7,19 +7,9 @@
> 
>  #include <linux/types.h>
>  #include <linux/list.h>
> -#include <linux/atomic.h>
> 
>  struct dpu_hw_blk;
> 
> -/**
> - * struct dpu_hw_blk_ops - common hardware block operations
> - * @start: start operation on first get
> - * @stop: stop operation on last put
> - */
> -struct dpu_hw_blk_ops {
> -	int (*start)(struct dpu_hw_blk *);
> -	void (*stop)(struct dpu_hw_blk *);
> -};
> 
>  /**
>   * struct dpu_hw_blk - definition of hardware block object
> @@ -29,17 +19,10 @@ struct dpu_hw_blk_ops {
>   * @refcount: reference/usage count
>   */
>  struct dpu_hw_blk {
> -	struct list_head list;
>  	u32 type;
>  	int id;
> -	atomic_t refcount;
> -	struct dpu_hw_blk_ops ops;
>  };
> 
> -void dpu_hw_blk_init(struct dpu_hw_blk *hw_blk, u32 type, int id,
> -		struct dpu_hw_blk_ops *ops);
> +void dpu_hw_blk_init(struct dpu_hw_blk *hw_blk, u32 type, int id);
>  void dpu_hw_blk_destroy(struct dpu_hw_blk *hw_blk);
> -
> -struct dpu_hw_blk *dpu_hw_blk_get(struct dpu_hw_blk *hw_blk, u32 type, 
> int id);
> -void dpu_hw_blk_put(struct dpu_hw_blk *hw_blk);
>  #endif /*_DPU_HW_BLK_H */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 2d4645e01ebf..04a2c4b9a357 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -589,8 +589,6 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops 
> *ops,
>  		ops->set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
>  };
> 
> -static struct dpu_hw_blk_ops dpu_hw_ops;
> -
>  struct dpu_hw_ctl *dpu_hw_ctl_init(enum dpu_ctl idx,
>  		void __iomem *addr,
>  		const struct dpu_mdss_cfg *m)
> @@ -615,7 +613,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(enum dpu_ctl 
> idx,
>  	c->mixer_count = m->mixer_count;
>  	c->mixer_hw_caps = m->mixer;
> 
> -	dpu_hw_blk_init(&c->base, DPU_HW_BLK_CTL, idx, &dpu_hw_ops);
> +	dpu_hw_blk_init(&c->base, DPU_HW_BLK_CTL, idx);
> 
>  	return c;
>  }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> index e42f901a7de5..d2f1045a736a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> @@ -85,8 +85,6 @@ static const struct dpu_dspp_cfg *_dspp_offset(enum
> dpu_dspp dspp,
>  	return ERR_PTR(-EINVAL);
>  }
> 
> -static struct dpu_hw_blk_ops dpu_hw_ops;
> -
>  struct dpu_hw_dspp *dpu_hw_dspp_init(enum dpu_dspp idx,
>  			void __iomem *addr,
>  			const struct dpu_mdss_cfg *m)
> @@ -112,7 +110,7 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(enum dpu_dspp 
> idx,
>  	c->cap = cfg;
>  	_setup_dspp_ops(c, c->cap->features);
> 
> -	dpu_hw_blk_init(&c->base, DPU_HW_BLK_DSPP, idx, &dpu_hw_ops);
> +	dpu_hw_blk_init(&c->base, DPU_HW_BLK_DSPP, idx);
> 
>  	return c;
>  }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 1599e3f49a4f..6ffe97601716 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -299,8 +299,6 @@ static void _setup_intf_ops(struct dpu_hw_intf_ops 
> *ops,
>  		ops->bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
>  }
> 
> -static struct dpu_hw_blk_ops dpu_hw_ops;
> -
>  struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf idx,
>  		void __iomem *addr,
>  		const struct dpu_mdss_cfg *m)
> @@ -327,7 +325,7 @@ struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf 
> idx,
>  	c->mdss = m;
>  	_setup_intf_ops(&c->ops, c->cap->features);
> 
> -	dpu_hw_blk_init(&c->base, DPU_HW_BLK_INTF, idx, &dpu_hw_ops);
> +	dpu_hw_blk_init(&c->base, DPU_HW_BLK_INTF, idx);
> 
>  	return c;
>  }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> index 6ac0b5a0e057..554bb881de3a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> @@ -160,8 +160,6 @@ static void _setup_mixer_ops(const struct 
> dpu_mdss_cfg *m,
>  	ops->setup_border_color = dpu_hw_lm_setup_border_color;
>  }
> 
> -static struct dpu_hw_blk_ops dpu_hw_ops;
> -
>  struct dpu_hw_mixer *dpu_hw_lm_init(enum dpu_lm idx,
>  		void __iomem *addr,
>  		const struct dpu_mdss_cfg *m)
> @@ -184,7 +182,7 @@ struct dpu_hw_mixer *dpu_hw_lm_init(enum dpu_lm 
> idx,
>  	c->cap = cfg;
>  	_setup_mixer_ops(m, &c->ops, c->cap->features);
> 
> -	dpu_hw_blk_init(&c->base, DPU_HW_BLK_LM, idx, &dpu_hw_ops);
> +	dpu_hw_blk_init(&c->base, DPU_HW_BLK_LM, idx);
> 
>  	return c;
>  }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
> index 720813e5a8ae..863229dd0140 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
> @@ -58,8 +58,6 @@ static void _setup_merge_3d_ops(struct 
> dpu_hw_merge_3d *c,
>  	c->ops.setup_3d_mode = dpu_hw_merge_3d_setup_3d_mode;
>  };
> 
> -static struct dpu_hw_blk_ops dpu_hw_ops;
> -
>  struct dpu_hw_merge_3d *dpu_hw_merge_3d_init(enum dpu_merge_3d idx,
>  		void __iomem *addr,
>  		const struct dpu_mdss_cfg *m)
> @@ -81,7 +79,7 @@ struct dpu_hw_merge_3d *dpu_hw_merge_3d_init(enum
> dpu_merge_3d idx,
>  	c->caps = cfg;
>  	_setup_merge_3d_ops(c, c->caps->features);
> 
> -	dpu_hw_blk_init(&c->base, DPU_HW_BLK_MERGE_3D, idx, &dpu_hw_ops);
> +	dpu_hw_blk_init(&c->base, DPU_HW_BLK_MERGE_3D, idx);
> 
>  	return c;
>  }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 245a7a62b5c6..334d5b28f533 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -261,8 +261,6 @@ static void _setup_pingpong_ops(struct 
> dpu_hw_pingpong *c,
>  		c->ops.setup_dither = dpu_hw_pp_setup_dither;
>  };
> 
> -static struct dpu_hw_blk_ops dpu_hw_ops;
> -
>  struct dpu_hw_pingpong *dpu_hw_pingpong_init(enum dpu_pingpong idx,
>  		void __iomem *addr,
>  		const struct dpu_mdss_cfg *m)
> @@ -284,7 +282,7 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(enum
> dpu_pingpong idx,
>  	c->caps = cfg;
>  	_setup_pingpong_ops(c, c->caps->features);
> 
> -	dpu_hw_blk_init(&c->base, DPU_HW_BLK_PINGPONG, idx, &dpu_hw_ops);
> +	dpu_hw_blk_init(&c->base, DPU_HW_BLK_PINGPONG, idx);
> 
>  	return c;
>  }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 34d81aa16041..ceb2488ea270 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -706,8 +706,6 @@ static const struct dpu_sspp_cfg
> *_sspp_offset(enum dpu_sspp sspp,
>  	return ERR_PTR(-ENOMEM);
>  }
> 
> -static struct dpu_hw_blk_ops dpu_hw_ops;
> -
>  struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
>  		void __iomem *addr, struct dpu_mdss_cfg *catalog,
>  		bool is_virtual_pipe)
> @@ -735,7 +733,7 @@ struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp 
> idx,
>  	hw_pipe->cap = cfg;
>  	_setup_layer_ops(hw_pipe, hw_pipe->cap->features);
> 
> -	dpu_hw_blk_init(&hw_pipe->base, DPU_HW_BLK_SSPP, idx, &dpu_hw_ops);
> +	dpu_hw_blk_init(&hw_pipe->base, DPU_HW_BLK_SSPP, idx);
> 
>  	return hw_pipe;
>  }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> index 01b76766a9a8..5d2c33ec1de7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> @@ -295,8 +295,6 @@ static const struct dpu_mdp_cfg *_top_offset(enum
> dpu_mdp mdp,
>  	return ERR_PTR(-EINVAL);
>  }
> 
> -static struct dpu_hw_blk_ops dpu_hw_ops;
> -
>  struct dpu_hw_mdp *dpu_hw_mdptop_init(enum dpu_mdp idx,
>  		void __iomem *addr,
>  		const struct dpu_mdss_cfg *m)
> @@ -324,7 +322,7 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(enum dpu_mdp 
> idx,
>  	mdp->caps = cfg;
>  	_setup_mdp_ops(&mdp->ops, mdp->caps->features);
> 
> -	dpu_hw_blk_init(&mdp->base, DPU_HW_BLK_TOP, idx, &dpu_hw_ops);
> +	dpu_hw_blk_init(&mdp->base, DPU_HW_BLK_TOP, idx);
> 
>  	return mdp;
>  }
