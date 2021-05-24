Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8913938F544
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 May 2021 23:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233126AbhEXWAR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 May 2021 18:00:17 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:15746 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233603AbhEXWAR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 May 2021 18:00:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621893528; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=n4xS9bVG2/aaNHZivGQisZdcjs0o519pg1Z5+o+rBi0=;
 b=jB4WocyJPXR3zt41ilVj8GNbLfsoozWKsT0Jb7HZAa3jW7LXdmkWOs6fCTSRle8SBZzNRdG6
 EObX13hY5YbWvUkH+EKkfeqOpffhIDlCuM0kykCGCZTfV0cdUfCgbewMjKALmo2JCp0R8ul7
 C00SiWx1RKe+O2zu0DOKYcXhy5Y=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60ac2194c229adfeff3b03d5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 24 May 2021 21:58:44
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F2418C4323A; Mon, 24 May 2021 21:58:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        UPPERCASE_50_75 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1A665C4338A;
        Mon, 24 May 2021 21:58:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 24 May 2021 14:58:37 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH v2 5/6] drm/msm/dpu: drop remains of old irq
 lookup subsystem
In-Reply-To: <20210516202910.2141079-6-dmitry.baryshkov@linaro.org>
References: <20210516202910.2141079-1-dmitry.baryshkov@linaro.org>
 <20210516202910.2141079-6-dmitry.baryshkov@linaro.org>
Message-ID: <43cd7da587cd51af2ef91cb2b3e06743@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-16 13:29, Dmitry Baryshkov wrote:
> There is no more need for the dpu_intr_type types, dpu_irq_map table,
> individual intr defines and obsolete_irq field. Drop all of them now.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |    2 -
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |    4 -
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |    2 -
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |    9 -
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |    2 -
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 1234 -----------------
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |   64 -
>  7 files changed, 1317 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index 3bd12ce45a80..e7270eb6b84b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -165,7 +165,6 @@ enum dpu_intr_idx {
>  /**
>   * dpu_encoder_irq - tracking structure for interrupts
>   * @name:		string name of interrupt
> - * @intr_type:		Encoder interrupt type
>   * @intr_idx:		Encoder interrupt enumeration
>   * @irq_idx:		IRQ interface lookup index from DPU IRQ framework
>   *			will be -EINVAL if IRQ is not registered
> @@ -173,7 +172,6 @@ enum dpu_intr_idx {
>   */
>  struct dpu_encoder_irq {
>  	const char *name;
> -	enum dpu_intr_type intr_type;
>  	enum dpu_intr_idx intr_idx;
>  	int irq_idx;
>  	struct dpu_irq_callback cb;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index 6f06e379b97f..36064004d6ff 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -789,25 +789,21 @@ struct dpu_encoder_phys 
> *dpu_encoder_phys_cmd_init(
> 
>  	irq = &phys_enc->irq[INTR_IDX_CTL_START];
>  	irq->name = "ctl_start";
> -	irq->intr_type = DPU_IRQ_TYPE_CTL_START;
>  	irq->intr_idx = INTR_IDX_CTL_START;
>  	irq->cb.func = dpu_encoder_phys_cmd_ctl_start_irq;
> 
>  	irq = &phys_enc->irq[INTR_IDX_PINGPONG];
>  	irq->name = "pp_done";
> -	irq->intr_type = DPU_IRQ_TYPE_PING_PONG_COMP;
>  	irq->intr_idx = INTR_IDX_PINGPONG;
>  	irq->cb.func = dpu_encoder_phys_cmd_pp_tx_done_irq;
> 
>  	irq = &phys_enc->irq[INTR_IDX_RDPTR];
>  	irq->name = "pp_rd_ptr";
> -	irq->intr_type = DPU_IRQ_TYPE_PING_PONG_RD_PTR;
>  	irq->intr_idx = INTR_IDX_RDPTR;
>  	irq->cb.func = dpu_encoder_phys_cmd_pp_rd_ptr_irq;
> 
>  	irq = &phys_enc->irq[INTR_IDX_UNDERRUN];
>  	irq->name = "underrun";
> -	irq->intr_type = DPU_IRQ_TYPE_INTF_UNDER_RUN;
>  	irq->intr_idx = INTR_IDX_UNDERRUN;
>  	irq->cb.func = dpu_encoder_phys_cmd_underrun_irq;
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index 6cdb4ecbc173..4ef3d7357c2d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -729,13 +729,11 @@ struct dpu_encoder_phys 
> *dpu_encoder_phys_vid_init(
> 
>  	irq = &phys_enc->irq[INTR_IDX_VSYNC];
>  	irq->name = "vsync_irq";
> -	irq->intr_type = DPU_IRQ_TYPE_INTF_VSYNC;
>  	irq->intr_idx = INTR_IDX_VSYNC;
>  	irq->cb.func = dpu_encoder_phys_vid_vblank_irq;
> 
>  	irq = &phys_enc->irq[INTR_IDX_UNDERRUN];
>  	irq->name = "underrun";
> -	irq->intr_type = DPU_IRQ_TYPE_INTF_UNDER_RUN;
>  	irq->intr_idx = INTR_IDX_UNDERRUN;
>  	irq->cb.func = dpu_encoder_phys_vid_underrun_irq;
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index f929131ed260..d01c4c919504 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -74,13 +74,6 @@
>  			 BIT(MDP_INTF0_INTR) | \
>  			 BIT(MDP_INTF1_INTR))
> 
> -#define INTR_SC7180_MASK \
> -	(BIT(DPU_IRQ_TYPE_PING_PONG_RD_PTR) |\
> -	BIT(DPU_IRQ_TYPE_PING_PONG_WR_PTR) |\
> -	BIT(DPU_IRQ_TYPE_PING_PONG_AUTO_REF) |\
> -	BIT(DPU_IRQ_TYPE_PING_PONG_TEAR_CHECK) |\
> -	BIT(DPU_IRQ_TYPE_PING_PONG_TE_CHECK))
> -
>  #define IRQ_SC7280_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>  			 BIT(MDP_SSPP_TOP0_INTR2) | \
>  			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> @@ -1171,7 +1164,6 @@ static void sc7180_cfg_init(struct dpu_mdss_cfg 
> *dpu_cfg)
>  		.dma_cfg = sdm845_regdma,
>  		.perf = sc7180_perf_data,
>  		.mdss_irqs = IRQ_SC7180_MASK,
> -		.obsolete_irq = INTR_SC7180_MASK,
>  	};
>  }
> 
> @@ -1261,7 +1253,6 @@ static void sc7280_cfg_init(struct dpu_mdss_cfg 
> *dpu_cfg)
>  		.vbif = sdm845_vbif,
>  		.perf = sc7280_perf_data,
>  		.mdss_irqs = IRQ_SC7280_MASK,
> -		.obsolete_irq = INTR_SC7180_MASK,
>  	};
>  }
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 316da2971320..7c86fdd14493 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -733,7 +733,6 @@ struct dpu_perf_cfg {
>   * @cursor_formats     Supported formats for cursor pipe
>   * @vig_formats        Supported formats for vig pipe
>   * @mdss_irqs:         Bitmap with the irqs supported by the target
> - * @obsolete_irq:       Irq types that are obsolete for a particular 
> target
>   */
>  struct dpu_mdss_cfg {
>  	u32 hwversion;
> @@ -780,7 +779,6 @@ struct dpu_mdss_cfg {
>  	const struct dpu_format_extended *vig_formats;
> 
>  	unsigned long mdss_irqs;
> -	unsigned long obsolete_irq;
>  };
> 
>  struct dpu_mdss_hw_cfg_handler {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index adc1f04ac257..ef16ba57aac1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -29,145 +29,6 @@
>  #define MDP_INTF_1_OFF_REV_7xxx             0x35000
>  #define MDP_INTF_5_OFF_REV_7xxx             0x39000
> 
> -/**
> - * WB interrupt status bit definitions
> - */
> -#define DPU_INTR_WB_0_DONE BIT(0)
> -#define DPU_INTR_WB_1_DONE BIT(1)
> -#define DPU_INTR_WB_2_DONE BIT(4)
> -
> -/**
> - * WDOG timer interrupt status bit definitions
> - */
> -#define DPU_INTR_WD_TIMER_0_DONE BIT(2)
> -#define DPU_INTR_WD_TIMER_1_DONE BIT(3)
> -#define DPU_INTR_WD_TIMER_2_DONE BIT(5)
> -#define DPU_INTR_WD_TIMER_3_DONE BIT(6)
> -#define DPU_INTR_WD_TIMER_4_DONE BIT(7)
> -
> -/**
> - * Pingpong interrupt status bit definitions
> - */
> -#define DPU_INTR_PING_PONG_0_DONE BIT(8)
> -#define DPU_INTR_PING_PONG_1_DONE BIT(9)
> -#define DPU_INTR_PING_PONG_2_DONE BIT(10)
> -#define DPU_INTR_PING_PONG_3_DONE BIT(11)
> -#define DPU_INTR_PING_PONG_0_RD_PTR BIT(12)
> -#define DPU_INTR_PING_PONG_1_RD_PTR BIT(13)
> -#define DPU_INTR_PING_PONG_2_RD_PTR BIT(14)
> -#define DPU_INTR_PING_PONG_3_RD_PTR BIT(15)
> -#define DPU_INTR_PING_PONG_0_WR_PTR BIT(16)
> -#define DPU_INTR_PING_PONG_1_WR_PTR BIT(17)
> -#define DPU_INTR_PING_PONG_2_WR_PTR BIT(18)
> -#define DPU_INTR_PING_PONG_3_WR_PTR BIT(19)
> -#define DPU_INTR_PING_PONG_0_AUTOREFRESH_DONE BIT(20)
> -#define DPU_INTR_PING_PONG_1_AUTOREFRESH_DONE BIT(21)
> -#define DPU_INTR_PING_PONG_2_AUTOREFRESH_DONE BIT(22)
> -#define DPU_INTR_PING_PONG_3_AUTOREFRESH_DONE BIT(23)
> -
> -/**
> - * Interface interrupt status bit definitions
> - */
> -#define DPU_INTR_INTF_0_UNDERRUN BIT(24)
> -#define DPU_INTR_INTF_1_UNDERRUN BIT(26)
> -#define DPU_INTR_INTF_2_UNDERRUN BIT(28)
> -#define DPU_INTR_INTF_3_UNDERRUN BIT(30)
> -#define DPU_INTR_INTF_5_UNDERRUN BIT(22)
> -#define DPU_INTR_INTF_0_VSYNC BIT(25)
> -#define DPU_INTR_INTF_1_VSYNC BIT(27)
> -#define DPU_INTR_INTF_2_VSYNC BIT(29)
> -#define DPU_INTR_INTF_3_VSYNC BIT(31)
> -#define DPU_INTR_INTF_5_VSYNC BIT(23)
> -
> -/**
> - * Pingpong Secondary interrupt status bit definitions
> - */
> -#define DPU_INTR_PING_PONG_S0_AUTOREFRESH_DONE BIT(0)
> -#define DPU_INTR_PING_PONG_S0_WR_PTR BIT(4)
> -#define DPU_INTR_PING_PONG_S0_RD_PTR BIT(8)
> -#define DPU_INTR_PING_PONG_S0_TEAR_DETECTED BIT(22)
> -#define DPU_INTR_PING_PONG_S0_TE_DETECTED BIT(28)
> -
> -/**
> - * Pingpong TEAR detection interrupt status bit definitions
> - */
> -#define DPU_INTR_PING_PONG_0_TEAR_DETECTED BIT(16)
> -#define DPU_INTR_PING_PONG_1_TEAR_DETECTED BIT(17)
> -#define DPU_INTR_PING_PONG_2_TEAR_DETECTED BIT(18)
> -#define DPU_INTR_PING_PONG_3_TEAR_DETECTED BIT(19)
> -
> -/**
> - * Pingpong TE detection interrupt status bit definitions
> - */
> -#define DPU_INTR_PING_PONG_0_TE_DETECTED BIT(24)
> -#define DPU_INTR_PING_PONG_1_TE_DETECTED BIT(25)
> -#define DPU_INTR_PING_PONG_2_TE_DETECTED BIT(26)
> -#define DPU_INTR_PING_PONG_3_TE_DETECTED BIT(27)
> -
> -/**
> - * Ctl start interrupt status bit definitions
> - */
> -#define DPU_INTR_CTL_0_START BIT(9)
> -#define DPU_INTR_CTL_1_START BIT(10)
> -#define DPU_INTR_CTL_2_START BIT(11)
> -#define DPU_INTR_CTL_3_START BIT(12)
> -#define DPU_INTR_CTL_4_START BIT(13)
> -
> -/**
> - * Concurrent WB overflow interrupt status bit definitions
> - */
> -#define DPU_INTR_CWB_2_OVERFLOW BIT(14)
> -#define DPU_INTR_CWB_3_OVERFLOW BIT(15)
> -
> -/**
> - * Histogram VIG done interrupt status bit definitions
> - */
> -#define DPU_INTR_HIST_VIG_0_DONE BIT(0)
> -#define DPU_INTR_HIST_VIG_1_DONE BIT(4)
> -#define DPU_INTR_HIST_VIG_2_DONE BIT(8)
> -#define DPU_INTR_HIST_VIG_3_DONE BIT(10)
> -
> -/**
> - * Histogram VIG reset Sequence done interrupt status bit definitions
> - */
> -#define DPU_INTR_HIST_VIG_0_RSTSEQ_DONE BIT(1)
> -#define DPU_INTR_HIST_VIG_1_RSTSEQ_DONE BIT(5)
> -#define DPU_INTR_HIST_VIG_2_RSTSEQ_DONE BIT(9)
> -#define DPU_INTR_HIST_VIG_3_RSTSEQ_DONE BIT(11)
> -
> -/**
> - * Histogram DSPP done interrupt status bit definitions
> - */
> -#define DPU_INTR_HIST_DSPP_0_DONE BIT(12)
> -#define DPU_INTR_HIST_DSPP_1_DONE BIT(16)
> -#define DPU_INTR_HIST_DSPP_2_DONE BIT(20)
> -#define DPU_INTR_HIST_DSPP_3_DONE BIT(22)
> -
> -/**
> - * Histogram DSPP reset Sequence done interrupt status bit definitions
> - */
> -#define DPU_INTR_HIST_DSPP_0_RSTSEQ_DONE BIT(13)
> -#define DPU_INTR_HIST_DSPP_1_RSTSEQ_DONE BIT(17)
> -#define DPU_INTR_HIST_DSPP_2_RSTSEQ_DONE BIT(21)
> -#define DPU_INTR_HIST_DSPP_3_RSTSEQ_DONE BIT(23)
> -
> -/**
> - * INTF interrupt status bit definitions
> - */
> -#define DPU_INTR_VIDEO_INTO_STATIC BIT(0)
> -#define DPU_INTR_VIDEO_OUTOF_STATIC BIT(1)
> -#define DPU_INTR_DSICMD_0_INTO_STATIC BIT(2)
> -#define DPU_INTR_DSICMD_0_OUTOF_STATIC BIT(3)
> -#define DPU_INTR_DSICMD_1_INTO_STATIC BIT(4)
> -#define DPU_INTR_DSICMD_1_OUTOF_STATIC BIT(5)
> -#define DPU_INTR_DSICMD_2_INTO_STATIC BIT(6)
> -#define DPU_INTR_DSICMD_2_OUTOF_STATIC BIT(7)
> -#define DPU_INTR_PROG_LINE BIT(8)
> -
> -/**
> - * AD4 interrupt status bit definitions
> - */
> -#define DPU_INTR_BACKLIGHT_UPDATED BIT(0)
>  /**
>   * struct dpu_intr_reg - array of DPU register sets
>   * @clr_off:	offset to CLEAR reg
> @@ -180,20 +41,6 @@ struct dpu_intr_reg {
>  	u32 status_off;
>  };
> 
> -/**
> - * struct dpu_irq_type - maps each irq with i/f
> - * @intr_type:		type of interrupt listed in dpu_intr_type
> - * @instance_idx:	instance index of the associated HW block in DPU
> - * @irq_mask:		corresponding bit in the interrupt status reg
> - * @reg_idx:		which reg set to use
> - */
> -struct dpu_irq_type {
> -	u32 intr_type;
> -	u32 instance_idx;
> -	u32 irq_mask;
> -	u32 reg_idx;
> -};
> -
>  /*
>   * struct dpu_intr_reg -  List of DPU interrupt registers
>   *
> @@ -270,1086 +117,6 @@ static const struct dpu_intr_reg dpu_intr_set[] 
> = {
>  #define DPU_IRQ_REG(irq_idx)	(irq_idx / 32)
>  #define DPU_IRQ_MASK(irq_idx)	(BIT(irq_idx % 32))
> 
> -/*
> - * struct dpu_irq_type - IRQ mapping table use for lookup an irq_idx 
> in this
> - *			 table that have a matching interface type and
> - *			 instance index.
> - */
> -static const struct dpu_irq_type dpu_irq_map[] = {
> -	/* BEGIN MAP_RANGE: 0-31, INTR */
> -	/* irq_idx: 0-3 */
> -	{ DPU_IRQ_TYPE_WB_ROT_COMP, WB_0, DPU_INTR_WB_0_DONE, 0},
> -	{ DPU_IRQ_TYPE_WB_ROT_COMP, WB_1, DPU_INTR_WB_1_DONE, 0},
> -	{ DPU_IRQ_TYPE_WD_TIMER, WD_TIMER_0, DPU_INTR_WD_TIMER_0_DONE, 0},
> -	{ DPU_IRQ_TYPE_WD_TIMER, WD_TIMER_1, DPU_INTR_WD_TIMER_1_DONE, 0},
> -	/* irq_idx: 4-7 */
> -	{ DPU_IRQ_TYPE_WB_WFD_COMP, WB_2, DPU_INTR_WB_2_DONE, 0},
> -	{ DPU_IRQ_TYPE_WD_TIMER, WD_TIMER_2, DPU_INTR_WD_TIMER_2_DONE, 0},
> -	{ DPU_IRQ_TYPE_WD_TIMER, WD_TIMER_3, DPU_INTR_WD_TIMER_3_DONE, 0},
> -	{ DPU_IRQ_TYPE_WD_TIMER, WD_TIMER_4, DPU_INTR_WD_TIMER_4_DONE, 0},
> -	/* irq_idx: 8-11 */
> -	{ DPU_IRQ_TYPE_PING_PONG_COMP, PINGPONG_0,
> -		DPU_INTR_PING_PONG_0_DONE, 0},
> -	{ DPU_IRQ_TYPE_PING_PONG_COMP, PINGPONG_1,
> -		DPU_INTR_PING_PONG_1_DONE, 0},
> -	{ DPU_IRQ_TYPE_PING_PONG_COMP, PINGPONG_2,
> -		DPU_INTR_PING_PONG_2_DONE, 0},
> -	{ DPU_IRQ_TYPE_PING_PONG_COMP, PINGPONG_3,
> -		DPU_INTR_PING_PONG_3_DONE, 0},
> -	/* irq_idx: 12-15 */
> -	{ DPU_IRQ_TYPE_PING_PONG_RD_PTR, PINGPONG_0,
> -		DPU_INTR_PING_PONG_0_RD_PTR, 0},
> -	{ DPU_IRQ_TYPE_PING_PONG_RD_PTR, PINGPONG_1,
> -		DPU_INTR_PING_PONG_1_RD_PTR, 0},
> -	{ DPU_IRQ_TYPE_PING_PONG_RD_PTR, PINGPONG_2,
> -		DPU_INTR_PING_PONG_2_RD_PTR, 0},
> -	{ DPU_IRQ_TYPE_PING_PONG_RD_PTR, PINGPONG_3,
> -		DPU_INTR_PING_PONG_3_RD_PTR, 0},
> -	/* irq_idx: 16-19 */
> -	{ DPU_IRQ_TYPE_PING_PONG_WR_PTR, PINGPONG_0,
> -		DPU_INTR_PING_PONG_0_WR_PTR, 0},
> -	{ DPU_IRQ_TYPE_PING_PONG_WR_PTR, PINGPONG_1,
> -		DPU_INTR_PING_PONG_1_WR_PTR, 0},
> -	{ DPU_IRQ_TYPE_PING_PONG_WR_PTR, PINGPONG_2,
> -		DPU_INTR_PING_PONG_2_WR_PTR, 0},
> -	{ DPU_IRQ_TYPE_PING_PONG_WR_PTR, PINGPONG_3,
> -		DPU_INTR_PING_PONG_3_WR_PTR, 0},
> -	/* irq_idx: 20-23 */
> -	{ DPU_IRQ_TYPE_PING_PONG_AUTO_REF, PINGPONG_0,
> -		DPU_INTR_PING_PONG_0_AUTOREFRESH_DONE, 0},
> -	{ DPU_IRQ_TYPE_PING_PONG_AUTO_REF, PINGPONG_1,
> -		DPU_INTR_PING_PONG_1_AUTOREFRESH_DONE, 0},
> -	{ DPU_IRQ_TYPE_PING_PONG_AUTO_REF, PINGPONG_2,
> -		DPU_INTR_PING_PONG_2_AUTOREFRESH_DONE, 0},
> -	{ DPU_IRQ_TYPE_PING_PONG_AUTO_REF, PINGPONG_3,
> -		DPU_INTR_PING_PONG_3_AUTOREFRESH_DONE, 0},
> -	/* irq_idx: 24-27 */
> -	{ DPU_IRQ_TYPE_INTF_UNDER_RUN, INTF_0, DPU_INTR_INTF_0_UNDERRUN, 0},
> -	{ DPU_IRQ_TYPE_INTF_VSYNC, INTF_0, DPU_INTR_INTF_0_VSYNC, 0},
> -	{ DPU_IRQ_TYPE_INTF_UNDER_RUN, INTF_1, DPU_INTR_INTF_1_UNDERRUN, 0},
> -	{ DPU_IRQ_TYPE_INTF_VSYNC, INTF_1, DPU_INTR_INTF_1_VSYNC, 0},
> -	/* irq_idx: 28-31 */
> -	{ DPU_IRQ_TYPE_INTF_UNDER_RUN, INTF_2, DPU_INTR_INTF_2_UNDERRUN, 0},
> -	{ DPU_IRQ_TYPE_INTF_VSYNC, INTF_2, DPU_INTR_INTF_2_VSYNC, 0},
> -	{ DPU_IRQ_TYPE_INTF_UNDER_RUN, INTF_3, DPU_INTR_INTF_3_UNDERRUN, 0},
> -	{ DPU_IRQ_TYPE_INTF_VSYNC, INTF_3, DPU_INTR_INTF_3_VSYNC, 0},
> -	/* irq_idx:32-33 */
> -	{ DPU_IRQ_TYPE_INTF_UNDER_RUN, INTF_5, DPU_INTR_INTF_5_UNDERRUN, 0},
> -	{ DPU_IRQ_TYPE_INTF_VSYNC, INTF_5, DPU_INTR_INTF_5_VSYNC, 0},
> -	/* irq_idx:34-63 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
> -	/* BEGIN MAP_RANGE: 64-95, INTR2 */
> -	/* irq_idx: 64-67 */
> -	{ DPU_IRQ_TYPE_PING_PONG_AUTO_REF, PINGPONG_S0,
> -		DPU_INTR_PING_PONG_S0_AUTOREFRESH_DONE, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	/* irq_idx: 68-71 */
> -	{ DPU_IRQ_TYPE_PING_PONG_WR_PTR, PINGPONG_S0,
> -		DPU_INTR_PING_PONG_S0_WR_PTR, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	/* irq_idx: 72 */
> -	{ DPU_IRQ_TYPE_PING_PONG_RD_PTR, PINGPONG_S0,
> -		DPU_INTR_PING_PONG_S0_RD_PTR, 1},
> -	/* irq_idx: 73-77 */
> -	{ DPU_IRQ_TYPE_CTL_START, CTL_0,
> -		DPU_INTR_CTL_0_START, 1},
> -	{ DPU_IRQ_TYPE_CTL_START, CTL_1,
> -		DPU_INTR_CTL_1_START, 1},
> -	{ DPU_IRQ_TYPE_CTL_START, CTL_2,
> -		DPU_INTR_CTL_2_START, 1},
> -	{ DPU_IRQ_TYPE_CTL_START, CTL_3,
> -		DPU_INTR_CTL_3_START, 1},
> -	{ DPU_IRQ_TYPE_CTL_START, CTL_4,
> -		DPU_INTR_CTL_4_START, 1},
> -	/* irq_idx: 78-79 */
> -	{ DPU_IRQ_TYPE_CWB_OVERFLOW, CWB_2, DPU_INTR_CWB_2_OVERFLOW, 1},
> -	{ DPU_IRQ_TYPE_CWB_OVERFLOW, CWB_3, DPU_INTR_CWB_3_OVERFLOW, 1},
> -	/* irq_idx: 80-83 */
> -	{ DPU_IRQ_TYPE_PING_PONG_TEAR_CHECK, PINGPONG_0,
> -		DPU_INTR_PING_PONG_0_TEAR_DETECTED, 1},
> -	{ DPU_IRQ_TYPE_PING_PONG_TEAR_CHECK, PINGPONG_1,
> -		DPU_INTR_PING_PONG_1_TEAR_DETECTED, 1},
> -	{ DPU_IRQ_TYPE_PING_PONG_TEAR_CHECK, PINGPONG_2,
> -		DPU_INTR_PING_PONG_2_TEAR_DETECTED, 1},
> -	{ DPU_IRQ_TYPE_PING_PONG_TEAR_CHECK, PINGPONG_3,
> -		DPU_INTR_PING_PONG_3_TEAR_DETECTED, 1},
> -	/* irq_idx: 84-87 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_PING_PONG_TEAR_CHECK, PINGPONG_S0,
> -		DPU_INTR_PING_PONG_S0_TEAR_DETECTED, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	/* irq_idx: 88-91 */
> -	{ DPU_IRQ_TYPE_PING_PONG_TE_CHECK, PINGPONG_0,
> -		DPU_INTR_PING_PONG_0_TE_DETECTED, 1},
> -	{ DPU_IRQ_TYPE_PING_PONG_TE_CHECK, PINGPONG_1,
> -		DPU_INTR_PING_PONG_1_TE_DETECTED, 1},
> -	{ DPU_IRQ_TYPE_PING_PONG_TE_CHECK, PINGPONG_2,
> -		DPU_INTR_PING_PONG_2_TE_DETECTED, 1},
> -	{ DPU_IRQ_TYPE_PING_PONG_TE_CHECK, PINGPONG_3,
> -		DPU_INTR_PING_PONG_3_TE_DETECTED, 1},
> -	/* irq_idx: 92-95 */
> -	{ DPU_IRQ_TYPE_PING_PONG_TE_CHECK, PINGPONG_S0,
> -		DPU_INTR_PING_PONG_S0_TE_DETECTED, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	/* irq_idx: 96-127 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
> -	/* BEGIN MAP_RANGE: 128-159 HIST */
> -	/* irq_idx: 128-131 */
> -	{ DPU_IRQ_TYPE_HIST_VIG_DONE, SSPP_VIG0, DPU_INTR_HIST_VIG_0_DONE, 
> 2},
> -	{ DPU_IRQ_TYPE_HIST_VIG_RSTSEQ, SSPP_VIG0,
> -		DPU_INTR_HIST_VIG_0_RSTSEQ_DONE, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	/* irq_idx: 132-135 */
> -	{ DPU_IRQ_TYPE_HIST_VIG_DONE, SSPP_VIG1, DPU_INTR_HIST_VIG_1_DONE, 
> 2},
> -	{ DPU_IRQ_TYPE_HIST_VIG_RSTSEQ, SSPP_VIG1,
> -		DPU_INTR_HIST_VIG_1_RSTSEQ_DONE, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	/* irq_idx: 136-139 */
> -	{ DPU_IRQ_TYPE_HIST_VIG_DONE, SSPP_VIG2, DPU_INTR_HIST_VIG_2_DONE, 
> 2},
> -	{ DPU_IRQ_TYPE_HIST_VIG_RSTSEQ, SSPP_VIG2,
> -		DPU_INTR_HIST_VIG_2_RSTSEQ_DONE, 2},
> -	{ DPU_IRQ_TYPE_HIST_VIG_DONE, SSPP_VIG3, DPU_INTR_HIST_VIG_3_DONE, 
> 2},
> -	{ DPU_IRQ_TYPE_HIST_VIG_RSTSEQ, SSPP_VIG3,
> -		DPU_INTR_HIST_VIG_3_RSTSEQ_DONE, 2},
> -	/* irq_idx: 140-143 */
> -	{ DPU_IRQ_TYPE_HIST_DSPP_DONE, DSPP_0, DPU_INTR_HIST_DSPP_0_DONE, 2},
> -	{ DPU_IRQ_TYPE_HIST_DSPP_RSTSEQ, DSPP_0,
> -		DPU_INTR_HIST_DSPP_0_RSTSEQ_DONE, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	/* irq_idx: 144-147 */
> -	{ DPU_IRQ_TYPE_HIST_DSPP_DONE, DSPP_1, DPU_INTR_HIST_DSPP_1_DONE, 2},
> -	{ DPU_IRQ_TYPE_HIST_DSPP_RSTSEQ, DSPP_1,
> -		DPU_INTR_HIST_DSPP_1_RSTSEQ_DONE, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	/* irq_idx: 148-151 */
> -	{ DPU_IRQ_TYPE_HIST_DSPP_DONE, DSPP_2, DPU_INTR_HIST_DSPP_2_DONE, 2},
> -	{ DPU_IRQ_TYPE_HIST_DSPP_RSTSEQ, DSPP_2,
> -		DPU_INTR_HIST_DSPP_2_RSTSEQ_DONE, 2},
> -	{ DPU_IRQ_TYPE_HIST_DSPP_DONE, DSPP_3, DPU_INTR_HIST_DSPP_3_DONE, 2},
> -	{ DPU_IRQ_TYPE_HIST_DSPP_RSTSEQ, DSPP_3,
> -		DPU_INTR_HIST_DSPP_3_RSTSEQ_DONE, 2},
> -	/* irq_idx: 152-155 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	/* irq_idx: 156-159 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	/* irq_idx: 160-191 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
> -	/* BEGIN MAP_RANGE: 192-255 INTF_0_INTR */
> -	/* irq_idx: 192-195 */
> -	{ DPU_IRQ_TYPE_SFI_VIDEO_IN, INTF_0,
> -		DPU_INTR_VIDEO_INTO_STATIC, 3},
> -	{ DPU_IRQ_TYPE_SFI_VIDEO_OUT, INTF_0,
> -		DPU_INTR_VIDEO_OUTOF_STATIC, 3},
> -	{ DPU_IRQ_TYPE_SFI_CMD_0_IN, INTF_0,
> -		DPU_INTR_DSICMD_0_INTO_STATIC, 3},
> -	{ DPU_IRQ_TYPE_SFI_CMD_0_OUT, INTF_0,
> -		DPU_INTR_DSICMD_0_OUTOF_STATIC, 3},
> -	/* irq_idx: 196-199 */
> -	{ DPU_IRQ_TYPE_SFI_CMD_1_IN, INTF_0,
> -		DPU_INTR_DSICMD_1_INTO_STATIC, 3},
> -	{ DPU_IRQ_TYPE_SFI_CMD_1_OUT, INTF_0,
> -		DPU_INTR_DSICMD_1_OUTOF_STATIC, 3},
> -	{ DPU_IRQ_TYPE_SFI_CMD_2_IN, INTF_0,
> -		DPU_INTR_DSICMD_2_INTO_STATIC, 3},
> -	{ DPU_IRQ_TYPE_SFI_CMD_2_OUT, INTF_0,
> -		DPU_INTR_DSICMD_2_OUTOF_STATIC, 3},
> -	/* irq_idx: 200-203 */
> -	{ DPU_IRQ_TYPE_PROG_LINE, INTF_0, DPU_INTR_PROG_LINE, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	/* irq_idx: 204-207 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	/* irq_idx: 208-211 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	/* irq_idx: 212-215 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	/* irq_idx: 216-219 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	/* irq_idx: 220-223 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	/* irq_idx: 224-255 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
> -	/* BEGIN MAP_RANGE: 256-319 INTF_1_INTR */
> -	/* irq_idx: 256-259 */
> -	{ DPU_IRQ_TYPE_SFI_VIDEO_IN, INTF_1,
> -		DPU_INTR_VIDEO_INTO_STATIC, 4},
> -	{ DPU_IRQ_TYPE_SFI_VIDEO_OUT, INTF_1,
> -		DPU_INTR_VIDEO_OUTOF_STATIC, 4},
> -	{ DPU_IRQ_TYPE_SFI_CMD_0_IN, INTF_1,
> -		DPU_INTR_DSICMD_0_INTO_STATIC, 4},
> -	{ DPU_IRQ_TYPE_SFI_CMD_0_OUT, INTF_1,
> -		DPU_INTR_DSICMD_0_OUTOF_STATIC, 4},
> -	/* irq_idx: 260-263 */
> -	{ DPU_IRQ_TYPE_SFI_CMD_1_IN, INTF_1,
> -		DPU_INTR_DSICMD_1_INTO_STATIC, 4},
> -	{ DPU_IRQ_TYPE_SFI_CMD_1_OUT, INTF_1,
> -		DPU_INTR_DSICMD_1_OUTOF_STATIC, 4},
> -	{ DPU_IRQ_TYPE_SFI_CMD_2_IN, INTF_1,
> -		DPU_INTR_DSICMD_2_INTO_STATIC, 4},
> -	{ DPU_IRQ_TYPE_SFI_CMD_2_OUT, INTF_1,
> -		DPU_INTR_DSICMD_2_OUTOF_STATIC, 4},
> -	/* irq_idx: 264-267 */
> -	{ DPU_IRQ_TYPE_PROG_LINE, INTF_1, DPU_INTR_PROG_LINE, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	/* irq_idx: 268-271 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	/* irq_idx: 272-275 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	/* irq_idx: 276-279 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	/* irq_idx: 280-283 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	/* irq_idx: 284-287 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	/* irq_idx: 288-319 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
> -	/* BEGIN MAP_RANGE: 320-383 INTF_2_INTR */
> -	/* irq_idx: 320-323 */
> -	{ DPU_IRQ_TYPE_SFI_VIDEO_IN, INTF_2,
> -		DPU_INTR_VIDEO_INTO_STATIC, 5},
> -	{ DPU_IRQ_TYPE_SFI_VIDEO_OUT, INTF_2,
> -		DPU_INTR_VIDEO_OUTOF_STATIC, 5},
> -	{ DPU_IRQ_TYPE_SFI_CMD_0_IN, INTF_2,
> -		DPU_INTR_DSICMD_0_INTO_STATIC, 5},
> -	{ DPU_IRQ_TYPE_SFI_CMD_0_OUT, INTF_2,
> -		DPU_INTR_DSICMD_0_OUTOF_STATIC, 5},
> -	/* irq_idx: 324-327 */
> -	{ DPU_IRQ_TYPE_SFI_CMD_1_IN, INTF_2,
> -		DPU_INTR_DSICMD_1_INTO_STATIC, 5},
> -	{ DPU_IRQ_TYPE_SFI_CMD_1_OUT, INTF_2,
> -		DPU_INTR_DSICMD_1_OUTOF_STATIC, 5},
> -	{ DPU_IRQ_TYPE_SFI_CMD_2_IN, INTF_2,
> -		DPU_INTR_DSICMD_2_INTO_STATIC, 5},
> -	{ DPU_IRQ_TYPE_SFI_CMD_2_OUT, INTF_2,
> -		DPU_INTR_DSICMD_2_OUTOF_STATIC, 5},
> -	/* irq_idx: 328-331 */
> -	{ DPU_IRQ_TYPE_PROG_LINE, INTF_2, DPU_INTR_PROG_LINE, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	/* irq_idx: 332-335 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	/* irq_idx: 336-339 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	/* irq_idx: 340-343 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	/* irq_idx: 344-347 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	/* irq_idx: 348-351 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	/* irq_idx: 352-383 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
> -	/* BEGIN MAP_RANGE: 384-447 INTF_3_INTR */
> -	/* irq_idx: 384-387 */
> -	{ DPU_IRQ_TYPE_SFI_VIDEO_IN, INTF_3,
> -		DPU_INTR_VIDEO_INTO_STATIC, 6},
> -	{ DPU_IRQ_TYPE_SFI_VIDEO_OUT, INTF_3,
> -		DPU_INTR_VIDEO_OUTOF_STATIC, 6},
> -	{ DPU_IRQ_TYPE_SFI_CMD_0_IN, INTF_3,
> -		DPU_INTR_DSICMD_0_INTO_STATIC, 6},
> -	{ DPU_IRQ_TYPE_SFI_CMD_0_OUT, INTF_3,
> -		DPU_INTR_DSICMD_0_OUTOF_STATIC, 6},
> -	/* irq_idx: 388-391 */
> -	{ DPU_IRQ_TYPE_SFI_CMD_1_IN, INTF_3,
> -		DPU_INTR_DSICMD_1_INTO_STATIC, 6},
> -	{ DPU_IRQ_TYPE_SFI_CMD_1_OUT, INTF_3,
> -		DPU_INTR_DSICMD_1_OUTOF_STATIC, 6},
> -	{ DPU_IRQ_TYPE_SFI_CMD_2_IN, INTF_3,
> -		DPU_INTR_DSICMD_2_INTO_STATIC, 6},
> -	{ DPU_IRQ_TYPE_SFI_CMD_2_OUT, INTF_3,
> -		DPU_INTR_DSICMD_2_OUTOF_STATIC, 6},
> -	/* irq_idx: 392-395 */
> -	{ DPU_IRQ_TYPE_PROG_LINE, INTF_3, DPU_INTR_PROG_LINE, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	/* irq_idx: 396-399 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	/* irq_idx: 400-403 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	/* irq_idx: 404-407 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	/* irq_idx: 408-411 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	/* irq_idx: 412-415 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	/* irq_idx: 416-447*/
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
> -	/* BEGIN MAP_RANGE: 448-511 INTF_4_INTR */
> -	/* irq_idx: 448-451 */
> -	{ DPU_IRQ_TYPE_SFI_VIDEO_IN, INTF_4,
> -		DPU_INTR_VIDEO_INTO_STATIC, 7},
> -	{ DPU_IRQ_TYPE_SFI_VIDEO_OUT, INTF_4,
> -		DPU_INTR_VIDEO_OUTOF_STATIC, 7},
> -	{ DPU_IRQ_TYPE_SFI_CMD_0_IN, INTF_4,
> -		DPU_INTR_DSICMD_0_INTO_STATIC, 7},
> -	{ DPU_IRQ_TYPE_SFI_CMD_0_OUT, INTF_4,
> -		DPU_INTR_DSICMD_0_OUTOF_STATIC, 7},
> -	/* irq_idx: 452-455 */
> -	{ DPU_IRQ_TYPE_SFI_CMD_1_IN, INTF_4,
> -		DPU_INTR_DSICMD_1_INTO_STATIC, 7},
> -	{ DPU_IRQ_TYPE_SFI_CMD_1_OUT, INTF_4,
> -		DPU_INTR_DSICMD_1_OUTOF_STATIC, 7},
> -	{ DPU_IRQ_TYPE_SFI_CMD_2_IN, INTF_4,
> -		DPU_INTR_DSICMD_2_INTO_STATIC, 7},
> -	{ DPU_IRQ_TYPE_SFI_CMD_2_OUT, INTF_4,
> -		DPU_INTR_DSICMD_2_OUTOF_STATIC, 7},
> -	/* irq_idx: 456-459 */
> -	{ DPU_IRQ_TYPE_PROG_LINE, INTF_4, DPU_INTR_PROG_LINE, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	/* irq_idx: 460-463 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	/* irq_idx: 464-467 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	/* irq_idx: 468-471 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	/* irq_idx: 472-475 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	/* irq_idx: 476-479 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	/* irq_idx: 480-511 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
> -	/* BEGIN MAP_RANGE: 512-575 AD4_0_INTR */
> -	/* irq_idx: 512-515 */
> -	{ DPU_IRQ_TYPE_AD4_BL_DONE, DSPP_0, DPU_INTR_BACKLIGHT_UPDATED, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	/* irq_idx: 516-519 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	/* irq_idx: 520-523 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	/* irq_idx: 524-527 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	/* irq_idx: 528-531 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	/* irq_idx: 532-535 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	/* irq_idx: 536-539 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	/* irq_idx: 540-543 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	/* irq_idx: 544-575*/
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
> -	/* BEGIN MAP_RANGE: 576-639 AD4_1_INTR */
> -	/* irq_idx: 576-579 */
> -	{ DPU_IRQ_TYPE_AD4_BL_DONE, DSPP_1, DPU_INTR_BACKLIGHT_UPDATED, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	/* irq_idx: 580-583 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	/* irq_idx: 584-587 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	/* irq_idx: 588-591 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	/* irq_idx: 592-595 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	/* irq_idx: 596-599 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	/* irq_idx: 600-603 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	/* irq_idx: 604-607 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	/* irq_idx: 608-639 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
> -	/* BEGIN MAP_RANGE: 640-703 INTF_0_SC7280_INTR */
> -	/* irq_idx: 640-643 */
> -	{ DPU_IRQ_TYPE_SFI_VIDEO_IN, INTF_0,
> -		DPU_INTR_VIDEO_INTO_STATIC, 10},
> -	{ DPU_IRQ_TYPE_SFI_VIDEO_OUT, INTF_0,
> -		DPU_INTR_VIDEO_OUTOF_STATIC, 10},
> -	{ DPU_IRQ_TYPE_SFI_CMD_0_IN, INTF_0,
> -		DPU_INTR_DSICMD_0_INTO_STATIC, 10},
> -	{ DPU_IRQ_TYPE_SFI_CMD_0_OUT, INTF_0,
> -		DPU_INTR_DSICMD_0_OUTOF_STATIC, 10},
> -	/* irq_idx: 644-647 */
> -	{ DPU_IRQ_TYPE_SFI_CMD_1_IN, INTF_0,
> -		DPU_INTR_DSICMD_1_INTO_STATIC, 10},
> -	{ DPU_IRQ_TYPE_SFI_CMD_1_OUT, INTF_0,
> -		DPU_INTR_DSICMD_1_OUTOF_STATIC, 10},
> -	{ DPU_IRQ_TYPE_SFI_CMD_2_IN, INTF_0,
> -		DPU_INTR_DSICMD_2_INTO_STATIC, 10},
> -	{ DPU_IRQ_TYPE_SFI_CMD_2_OUT, INTF_0,
> -		DPU_INTR_DSICMD_2_OUTOF_STATIC, 10},
> -	/* irq_idx: 648-651 */
> -	{ DPU_IRQ_TYPE_PROG_LINE, INTF_0, DPU_INTR_PROG_LINE, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	/* irq_idx: 652-655 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	/* irq_idx: 656-659 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	/* irq_idx: 660-663 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	/* irq_idx: 664-667 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	/* irq_idx: 668-671 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	/* irq_idx: 672-703 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
> -	/* BEGIN MAP_RANGE: 704-767 INTF_1_SC7280_INTR */
> -	/* irq_idx: 704-707 */
> -	{ DPU_IRQ_TYPE_SFI_VIDEO_IN, INTF_1,
> -		DPU_INTR_VIDEO_INTO_STATIC, 11},
> -	{ DPU_IRQ_TYPE_SFI_VIDEO_OUT, INTF_1,
> -		DPU_INTR_VIDEO_OUTOF_STATIC, 11},
> -	{ DPU_IRQ_TYPE_SFI_CMD_0_IN, INTF_1,
> -		DPU_INTR_DSICMD_0_INTO_STATIC, 11},
> -	{ DPU_IRQ_TYPE_SFI_CMD_0_OUT, INTF_1,
> -		DPU_INTR_DSICMD_0_OUTOF_STATIC, 11},
> -	/* irq_idx: 708-711 */
> -	{ DPU_IRQ_TYPE_SFI_CMD_1_IN, INTF_1,
> -		DPU_INTR_DSICMD_1_INTO_STATIC, 11},
> -	{ DPU_IRQ_TYPE_SFI_CMD_1_OUT, INTF_1,
> -		DPU_INTR_DSICMD_1_OUTOF_STATIC, 11},
> -	{ DPU_IRQ_TYPE_SFI_CMD_2_IN, INTF_1,
> -		DPU_INTR_DSICMD_2_INTO_STATIC, 11},
> -	{ DPU_IRQ_TYPE_SFI_CMD_2_OUT, INTF_1,
> -		DPU_INTR_DSICMD_2_OUTOF_STATIC, 11},
> -	/* irq_idx: 712-715 */
> -	{ DPU_IRQ_TYPE_PROG_LINE, INTF_1, DPU_INTR_PROG_LINE, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	/* irq_idx: 716-719 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	/* irq_idx: 720-723 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	/* irq_idx: 724-727 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	/* irq_idx: 728-731 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	/* irq_idx: 732-735 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	/* irq_idx: 736-767 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
> -	/* BEGIN MAP_RANGE: 768-831 INTF_5_SC7280_INTR */
> -	/* irq_idx: 768-771 */
> -	{ DPU_IRQ_TYPE_SFI_VIDEO_IN, INTF_5,
> -		DPU_INTR_VIDEO_INTO_STATIC, 12},
> -	{ DPU_IRQ_TYPE_SFI_VIDEO_OUT, INTF_5,
> -		DPU_INTR_VIDEO_OUTOF_STATIC, 12},
> -	{ DPU_IRQ_TYPE_SFI_CMD_0_IN, INTF_5,
> -		DPU_INTR_DSICMD_0_INTO_STATIC, 12},
> -	{ DPU_IRQ_TYPE_SFI_CMD_0_OUT, INTF_5,
> -		DPU_INTR_DSICMD_0_OUTOF_STATIC, 12},
> -	/* irq_idx: 772-775 */
> -	{ DPU_IRQ_TYPE_SFI_CMD_1_IN, INTF_5,
> -		DPU_INTR_DSICMD_1_INTO_STATIC, 12},
> -	{ DPU_IRQ_TYPE_SFI_CMD_1_OUT, INTF_5,
> -		DPU_INTR_DSICMD_1_OUTOF_STATIC, 12},
> -	{ DPU_IRQ_TYPE_SFI_CMD_2_IN, INTF_5,
> -		DPU_INTR_DSICMD_2_INTO_STATIC, 12},
> -	{ DPU_IRQ_TYPE_SFI_CMD_2_OUT, INTF_5,
> -		DPU_INTR_DSICMD_2_OUTOF_STATIC, 12},
> -	/* irq_idx: 776-779 */
> -	{ DPU_IRQ_TYPE_PROG_LINE, INTF_5, DPU_INTR_PROG_LINE, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	/* irq_idx: 780-783 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	/* irq_idx: 784-787 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	/* irq_idx: 788-791 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	/* irq_idx: 792-795 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	/* irq_idx: 796-799 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	/* irq_idx: 800-831 */
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
> -};
> -
>  static void dpu_hw_intr_clear_intr_status_nolock(struct dpu_hw_intr 
> *intr,
>  		int irq_idx)
>  {
> @@ -1658,7 +425,6 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem 
> *addr,
>  	}
> 
>  	intr->irq_mask = m->mdss_irqs;
> -	intr->obsolete_irq = m->obsolete_irq;
> 
>  	spin_lock_init(&intr->irq_lock);
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> index c6b3d373ce75..3c8b788d78e6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> @@ -12,68 +12,6 @@
>  #include "dpu_hw_util.h"
>  #include "dpu_hw_mdss.h"
> 
> -/**
> - * dpu_intr_type - HW Interrupt Type
> - * @DPU_IRQ_TYPE_WB_ROT_COMP:		WB rotator done
> - * @DPU_IRQ_TYPE_WB_WFD_COMP:		WB WFD done
> - * @DPU_IRQ_TYPE_PING_PONG_COMP:	PingPong done
> - * @DPU_IRQ_TYPE_PING_PONG_RD_PTR:	PingPong read pointer
> - * @DPU_IRQ_TYPE_PING_PONG_WR_PTR:	PingPong write pointer
> - * @DPU_IRQ_TYPE_PING_PONG_AUTO_REF:	PingPong auto refresh
> - * @DPU_IRQ_TYPE_PING_PONG_TEAR_CHECK:	PingPong Tear check
> - * @DPU_IRQ_TYPE_PING_PONG_TE_CHECK:	PingPong TE detection
> - * @DPU_IRQ_TYPE_INTF_UNDER_RUN:	INTF underrun
> - * @DPU_IRQ_TYPE_INTF_VSYNC:		INTF VSYNC
> - * @DPU_IRQ_TYPE_CWB_OVERFLOW:		Concurrent WB overflow
> - * @DPU_IRQ_TYPE_HIST_VIG_DONE:		VIG Histogram done
> - * @DPU_IRQ_TYPE_HIST_VIG_RSTSEQ:	VIG Histogram reset
> - * @DPU_IRQ_TYPE_HIST_DSPP_DONE:	DSPP Histogram done
> - * @DPU_IRQ_TYPE_HIST_DSPP_RSTSEQ:	DSPP Histogram reset
> - * @DPU_IRQ_TYPE_WD_TIMER:		Watchdog timer
> - * @DPU_IRQ_TYPE_SFI_VIDEO_IN:		Video static frame INTR into static
> - * @DPU_IRQ_TYPE_SFI_VIDEO_OUT:		Video static frame INTR out-of static
> - * @DPU_IRQ_TYPE_SFI_CMD_0_IN:		DSI CMD0 static frame INTR into static
> - * @DPU_IRQ_TYPE_SFI_CMD_0_OUT:		DSI CMD0 static frame INTR out-of 
> static
> - * @DPU_IRQ_TYPE_SFI_CMD_1_IN:		DSI CMD1 static frame INTR into static
> - * @DPU_IRQ_TYPE_SFI_CMD_1_OUT:		DSI CMD1 static frame INTR out-of 
> static
> - * @DPU_IRQ_TYPE_SFI_CMD_2_IN:		DSI CMD2 static frame INTR into static
> - * @DPU_IRQ_TYPE_SFI_CMD_2_OUT:		DSI CMD2 static frame INTR out-of 
> static
> - * @DPU_IRQ_TYPE_PROG_LINE:		Programmable Line interrupt
> - * @DPU_IRQ_TYPE_AD4_BL_DONE:		AD4 backlight
> - * @DPU_IRQ_TYPE_CTL_START:		Control start
> - * @DPU_IRQ_TYPE_RESERVED:		Reserved for expansion
> - */
> -enum dpu_intr_type {
> -	DPU_IRQ_TYPE_WB_ROT_COMP,
> -	DPU_IRQ_TYPE_WB_WFD_COMP,
> -	DPU_IRQ_TYPE_PING_PONG_COMP,
> -	DPU_IRQ_TYPE_PING_PONG_RD_PTR,
> -	DPU_IRQ_TYPE_PING_PONG_WR_PTR,
> -	DPU_IRQ_TYPE_PING_PONG_AUTO_REF,
> -	DPU_IRQ_TYPE_PING_PONG_TEAR_CHECK,
> -	DPU_IRQ_TYPE_PING_PONG_TE_CHECK,
> -	DPU_IRQ_TYPE_INTF_UNDER_RUN,
> -	DPU_IRQ_TYPE_INTF_VSYNC,
> -	DPU_IRQ_TYPE_CWB_OVERFLOW,
> -	DPU_IRQ_TYPE_HIST_VIG_DONE,
> -	DPU_IRQ_TYPE_HIST_VIG_RSTSEQ,
> -	DPU_IRQ_TYPE_HIST_DSPP_DONE,
> -	DPU_IRQ_TYPE_HIST_DSPP_RSTSEQ,
> -	DPU_IRQ_TYPE_WD_TIMER,
> -	DPU_IRQ_TYPE_SFI_VIDEO_IN,
> -	DPU_IRQ_TYPE_SFI_VIDEO_OUT,
> -	DPU_IRQ_TYPE_SFI_CMD_0_IN,
> -	DPU_IRQ_TYPE_SFI_CMD_0_OUT,
> -	DPU_IRQ_TYPE_SFI_CMD_1_IN,
> -	DPU_IRQ_TYPE_SFI_CMD_1_OUT,
> -	DPU_IRQ_TYPE_SFI_CMD_2_IN,
> -	DPU_IRQ_TYPE_SFI_CMD_2_OUT,
> -	DPU_IRQ_TYPE_PROG_LINE,
> -	DPU_IRQ_TYPE_AD4_BL_DONE,
> -	DPU_IRQ_TYPE_CTL_START,
> -	DPU_IRQ_TYPE_RESERVED,
> -};
> -
>  /* When making changes be sure to sync with dpu_intr_set */
>  enum dpu_hw_intr_reg {
>  	MDP_SSPP_TOP0_INTR,
> @@ -172,7 +110,6 @@ struct dpu_hw_intr_ops {
>   * @save_irq_status:  array of IRQ status reg storage created during 
> init
>   * @total_irqs: total number of irq_idx mapped in the hw_interrupts
>   * @irq_lock:         spinlock for accessing IRQ resources
> - * @obsolete_irq:      irq types that are obsolete for a particular 
> target
>   */
>  struct dpu_hw_intr {
>  	struct dpu_hw_blk_reg_map hw;
> @@ -182,7 +119,6 @@ struct dpu_hw_intr {
>  	u32 total_irqs;
>  	spinlock_t irq_lock;
>  	unsigned long irq_mask;
> -	unsigned long obsolete_irq;
>  };
> 
>  /**
