Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 816C83DE30F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Aug 2021 01:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232768AbhHBX3c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 19:29:32 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:26515 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232912AbhHBX3c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 19:29:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627946962; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=z+JDakS6oBPxfrP1vTnx/1hdOuWBI9ChcRCCEhtvYTE=;
 b=ilEzyXlniqLbTlay7YQcsf2SFs7qefW60cb0PcUyMcaw8RMggxyh9sNc7Kvx92i60xMCeCs1
 d3RC1+yhDBP42p7g1CV1vgEaj+EpppRBKcnSGeGkNulTqlBXHaj2qHX51P0D1ql80WyrBcDX
 DHfhocmaYHIe9fDHhTZrwZfPbVo=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 61087fbfb653fbdaddf57c64 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 02 Aug 2021 23:29:03
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7F843C433D3; Mon,  2 Aug 2021 23:29:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 04CA7C433F1;
        Mon,  2 Aug 2021 23:29:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 02 Aug 2021 16:29:00 -0700
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
Subject: Re: [Freedreno] [PATCH 05/11] drm/msm/disp/dpu1: Add DSC for SDM845
 to hw_catalog
In-Reply-To: <20210715065203.709914-6-vkoul@kernel.org>
References: <20210715065203.709914-1-vkoul@kernel.org>
 <20210715065203.709914-6-vkoul@kernel.org>
Message-ID: <fa65a19fb47f4066158a1aa2d7ab4626@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-14 23:51, Vinod Koul wrote:
> This add SDM845 DSC blocks into hw_catalog
/add --> adds
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
> Changes since RFC:
>  - use BIT values from MASK
> 
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index b569030a0847..b45a08303c99 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -40,6 +40,8 @@
> 
>  #define PINGPONG_SDM845_MASK BIT(DPU_PINGPONG_DITHER)
> 
> +#define DSC_SDM845_MASK BIT(1)
agree with dmitry again : 
https://patchwork.freedesktop.org/patch/444072/?series=90413&rev=2
this is unused. you can use .features = 0
> +
>  #define PINGPONG_SDM845_SPLIT_MASK \
>  	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
> 
> @@ -751,6 +753,24 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = 
> {
>  	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk),
>  	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk),
>  };
> +
> +/*************************************************************
> + * DSC sub blocks config
> + *************************************************************/
> +#define DSC_BLK(_name, _id, _base) \
> +	{\
> +	.name = _name, .id = _id, \
> +	.base = _base, .len = 0x140, \
> +	.features = DSC_SDM845_MASK, \
> +	}
> +
> +static struct dpu_dsc_cfg sdm845_dsc[] = {
> +	DSC_BLK("dsc_0", DSC_0, 0x80000),
> +	DSC_BLK("dsc_1", DSC_1, 0x80400),
> +	DSC_BLK("dsc_2", DSC_2, 0x80800),
> +	DSC_BLK("dsc_3", DSC_3, 0x80c00),
> +};
> +
>  /*************************************************************
>   * INTF sub blocks config
>   *************************************************************/
> @@ -1053,6 +1073,8 @@ static void sdm845_cfg_init(struct dpu_mdss_cfg 
> *dpu_cfg)
>  		.mixer = sdm845_lm,
>  		.pingpong_count = ARRAY_SIZE(sdm845_pp),
>  		.pingpong = sdm845_pp,
> +		.dsc_count = ARRAY_SIZE(sdm845_dsc),
> +		.dsc = sdm845_dsc,
>  		.intf_count = ARRAY_SIZE(sdm845_intf),
>  		.intf = sdm845_intf,
>  		.vbif_count = ARRAY_SIZE(sdm845_vbif),
