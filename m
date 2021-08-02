Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44DB13DE2E3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Aug 2021 01:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232208AbhHBXIc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 19:08:32 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:43189 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232130AbhHBXIb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 19:08:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627945702; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=u2fKWWH1QLsGjTyMx+r7+X2+8jw9mmapYxT4cTm9Wq0=;
 b=qKO5xLDHfFNdzXOfIC+k7vN62tYK7mslirImGzyDX2AMjbE+EGWOZPLThht6095/dKAqMGso
 z20hsQojflwS/08z3DenmZz4SdIlNPXsHeulZbcxMGWaCOFbpEpfeptco2VR9cSfMQ7xqp+m
 erPD+hUbFT2GlSg1D/ZUwi2j2fo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 61087acc4815712f3a2a06d4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 02 Aug 2021 23:07:56
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 81E4AC43460; Mon,  2 Aug 2021 23:07:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9127AC433D3;
        Mon,  2 Aug 2021 23:07:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 02 Aug 2021 16:07:54 -0700
From:   abhinavk@codeaurora.org
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        freedreno@lists.freedesktop.org,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [Freedreno] [PATCH 03/11] drm/msm/disp/dpu1: Add support for DSC
 in pingpong block
In-Reply-To: <20210715065203.709914-4-vkoul@kernel.org>
References: <20210715065203.709914-1-vkoul@kernel.org>
 <20210715065203.709914-4-vkoul@kernel.org>
Message-ID: <3ad3ca623d9b88e3350071313324a924@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-14 23:51, Vinod Koul wrote:
> In SDM845, DSC can be enabled by writing to pingpong block registers, 
> so
> add support for DSC in hw_pp
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 32 +++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   | 14 ++++++++
>  2 files changed, 46 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 245a7a62b5c6..07fc131ca9aa 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -28,6 +28,9 @@
>  #define PP_FBC_MODE                     0x034
>  #define PP_FBC_BUDGET_CTL               0x038
>  #define PP_FBC_LOSSY_MODE               0x03C
> +#define PP_DSC_MODE                     0x0a0
> +#define PP_DCE_DATA_IN_SWAP             0x0ac
> +#define PP_DCE_DATA_OUT_SWAP            0x0c8
> 
>  #define PP_DITHER_EN			0x000
>  #define PP_DITHER_BITDEPTH		0x004
> @@ -245,6 +248,32 @@ static u32 dpu_hw_pp_get_line_count(struct
> dpu_hw_pingpong *pp)
>  	return line;
>  }
> 
> +static int dpu_hw_pp_dsc_enable(struct dpu_hw_pingpong *pp)
> +{
> +	struct dpu_hw_blk_reg_map *c = &pp->hw;
> +
> +	DPU_REG_WRITE(c, PP_DSC_MODE, 1);
> +	return 0;
> +}
> +
> +static void dpu_hw_pp_dsc_disable(struct dpu_hw_pingpong *pp)
> +{
> +	struct dpu_hw_blk_reg_map *c = &pp->hw;
> +
> +	DPU_REG_WRITE(c, PP_DSC_MODE, 0);
> +}
> +
> +static int dpu_hw_pp_setup_dsc(struct dpu_hw_pingpong *pp)
> +{
> +	struct dpu_hw_blk_reg_map *pp_c = &pp->hw;
> +	int data;
> +
> +	data = DPU_REG_READ(pp_c, PP_DCE_DATA_OUT_SWAP);
> +	data |= BIT(18); /* endian flip */
> +	DPU_REG_WRITE(pp_c, PP_DCE_DATA_OUT_SWAP, data);
> +	return 0;
> +}
> +
>  static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
>  				unsigned long features)
>  {
> @@ -256,6 +285,9 @@ static void _setup_pingpong_ops(struct 
> dpu_hw_pingpong *c,
>  	c->ops.get_autorefresh = dpu_hw_pp_get_autorefresh_config;
>  	c->ops.poll_timeout_wr_ptr = dpu_hw_pp_poll_timeout_wr_ptr;
>  	c->ops.get_line_count = dpu_hw_pp_get_line_count;
> +	c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
> +	c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
> +	c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
> 
>  	if (test_bit(DPU_PINGPONG_DITHER, &features))
>  		c->ops.setup_dither = dpu_hw_pp_setup_dither;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
> index 845b9ce80e31..5058e41ffbc0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
> @@ -124,6 +124,20 @@ struct dpu_hw_pingpong_ops {
>  	 */
>  	void (*setup_dither)(struct dpu_hw_pingpong *pp,
>  			struct dpu_hw_dither_cfg *cfg);
> +	/**
> +	 * Enable DSC
> +	 */
> +	int (*enable_dsc)(struct dpu_hw_pingpong *pp);
> +
> +	/**
> +	 * Disable DSC
> +	 */
> +	void (*disable_dsc)(struct dpu_hw_pingpong *pp);
> +
> +	/**
> +	 * Setup DSC
> +	 */
> +	int (*setup_dsc)(struct dpu_hw_pingpong *pp);
>  };
> 
>  struct dpu_hw_pingpong {
