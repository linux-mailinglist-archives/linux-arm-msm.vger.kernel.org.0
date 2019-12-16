Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D51B8120F2E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2019 17:19:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbfLPQRg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Dec 2019 11:17:36 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:61624 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726368AbfLPQRf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Dec 2019 11:17:35 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576513054; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=YeRwlo4GOudE9eXytp9SkA6vVAN5wYGkqpSgleOvhjs=; b=A3zchwIMpORSYvtfJvIZd6pWkP5p4vcb2La7NgGGwC2bfbNzgL7rKXrTDn7SRB/8vCS+2nnL
 6xQtsc9/JCdvbhhNjX/vlQJO6gcnkb5kVaE1UybEknK6wz/v7YTnwY8/TFhBq+xoWcEWPfju
 HwL6I3pZ6YMb/YE/DA+VfUg+3DY=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5df7ae16.7f17035bbb58-smtp-out-n02;
 Mon, 16 Dec 2019 16:17:26 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 30A79C4479C; Mon, 16 Dec 2019 16:17:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B9B37C433CB;
        Mon, 16 Dec 2019 16:17:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B9B37C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 16 Dec 2019 09:17:23 -0700
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        dri-devel@freedesktop.org
Subject: Re: [PATCH 3/5] drm: msm: a6xx: Dump GBIF registers, debugbus in gpu
 state
Message-ID: <20191216161721.GE487@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Sharat Masetty <smasetty@codeaurora.org>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        dri-devel@freedesktop.org
References: <1575385543-11290-1-git-send-email-smasetty@codeaurora.org>
 <0101016ecc4c2621-178923ff-2100-4c3d-95e2-71bdf6f61c0f-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016ecc4c2621-178923ff-2100-4c3d-95e2-71bdf6f61c0f-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 03, 2019 at 03:06:12PM +0000, Sharat Masetty wrote:
> Add the relevant GBIF registers and the debug bus to the a6xx gpu
> state. This comes in pretty handy when debugging GPU bus related
> issues.
> 
> Change-Id: I224fda727012a456ccd28ca14caf9fcce236e629
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 52 +++++++++++++++++++++++------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h | 16 +++++++--
>  2 files changed, 55 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index e686331..99b5a41 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0
> -/* Copyright (c) 2018 The Linux Foundation. All rights reserved. */
> +/* Copyright (c) 2018-2019 The Linux Foundation. All rights reserved. */
>  
>  #include <linux/ascii85.h>
>  #include "msm_gem.h"
> @@ -320,6 +320,7 @@ static void a6xx_get_debugbus(struct msm_gpu *gpu,
>  {
>  	struct resource *res;
>  	void __iomem *cxdbg = NULL;
> +	int nr_debugbus_blocks;
>  
>  	/* Set up the GX debug bus */
>  
> @@ -374,9 +375,11 @@ static void a6xx_get_debugbus(struct msm_gpu *gpu,
>  		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_MASKL_3, 0);
>  	}
>  
> -	a6xx_state->debugbus = state_kcalloc(a6xx_state,
> -		ARRAY_SIZE(a6xx_debugbus_blocks),
> -		sizeof(*a6xx_state->debugbus));
> +	nr_debugbus_blocks = ARRAY_SIZE(a6xx_debugbus_blocks) +
> +		(a6xx_has_gbif(to_adreno_gpu(gpu)) ? 1 : 0);
> +
> +	a6xx_state->debugbus = state_kcalloc(a6xx_state, nr_debugbus_blocks,
> +			sizeof(*a6xx_state->debugbus));
>  
>  	if (a6xx_state->debugbus) {
>  		int i;

VBIF died with the A630, never to return. Instead of a single function that
uses if statements all over the place we should split this into two functions -
a630_get_debugbus and a6xx_get_debugbus and treat GBIF as the default and VBIF
as the exception. It might result in a bit more code duplication but IMO is
better than forcing all future targets through a half dozen logic checks that
will always be true.

> @@ -388,15 +391,31 @@ static void a6xx_get_debugbus(struct msm_gpu *gpu,
>  				&a6xx_state->debugbus[i]);
>  
>  		a6xx_state->nr_debugbus = ARRAY_SIZE(a6xx_debugbus_blocks);
> +
> +		/*
> +		 * GBIF has same debugbus as of other GPU blocks, fall back to
> +		 * default path if GPU uses GBIF, also GBIF uses exactly same
> +		 * ID as of VBIF.
> +		 */
> +		if (a6xx_has_gbif(to_adreno_gpu(gpu))) {
> +			a6xx_get_debugbus_block(gpu, a6xx_state,
> +				&a6xx_gbif_debugbus_block,
> +				&a6xx_state->debugbus[i]);
> +
> +			a6xx_state->nr_debugbus += 1;
> +		}
>  	}
>  
> -	a6xx_state->vbif_debugbus =
> -		state_kcalloc(a6xx_state, 1,
> -			sizeof(*a6xx_state->vbif_debugbus));
> +	/*  Dump the VBIF debugbus on applicable targets */
> +	if (!a6xx_has_gbif(to_adreno_gpu(gpu))) {
> +		a6xx_state->vbif_debugbus =
> +			state_kcalloc(a6xx_state, 1,
> +					sizeof(*a6xx_state->vbif_debugbus));
>  
> -	if (a6xx_state->vbif_debugbus)
> -		a6xx_get_vbif_debugbus_block(gpu, a6xx_state,
> -			a6xx_state->vbif_debugbus);
> +		if (a6xx_state->vbif_debugbus)
> +			a6xx_get_vbif_debugbus_block(gpu, a6xx_state,
> +					a6xx_state->vbif_debugbus);
> +	}
>  
>  	if (cxdbg) {
>  		a6xx_state->cx_debugbus =
> @@ -770,14 +789,16 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
>  		&a6xx_state->gmu_registers[1]);
>  }
>  
> +#define A6XX_GBIF_REGLIST_SIZE   1
>  static void a6xx_get_registers(struct msm_gpu *gpu,
>  		struct a6xx_gpu_state *a6xx_state,
>  		struct a6xx_crashdumper *dumper)
>  {
>  	int i, count = ARRAY_SIZE(a6xx_ahb_reglist) +
>  		ARRAY_SIZE(a6xx_reglist) +
> -		ARRAY_SIZE(a6xx_hlsq_reglist);
> +		ARRAY_SIZE(a6xx_hlsq_reglist) + A6XX_GBIF_REGLIST_SIZE;
>  	int index = 0;
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  
>  	a6xx_state->registers = state_kcalloc(a6xx_state,
>  		count, sizeof(*a6xx_state->registers));
> @@ -792,6 +813,15 @@ static void a6xx_get_registers(struct msm_gpu *gpu,
>  			a6xx_state, &a6xx_ahb_reglist[i],
>  			&a6xx_state->registers[index++]);
>  
> +	if (a6xx_has_gbif(adreno_gpu))
> +		a6xx_get_ahb_gpu_registers(gpu,
> +				a6xx_state, &a6xx_gbif_reglist,
> +				&a6xx_state->registers[index++]);
> +	else
> +		a6xx_get_ahb_gpu_registers(gpu,
> +				a6xx_state, &a6xx_vbif_reglist,
> +				&a6xx_state->registers[index++]);
> +
>  	for (i = 0; i < ARRAY_SIZE(a6xx_reglist); i++)
>  		a6xx_get_crashdumper_registers(gpu,
>  			a6xx_state, &a6xx_reglist[i],
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
> index 68cccfa..e67c20c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0
> -/* Copyright (c) 2018 The Linux Foundation. All rights reserved. */
> +/* Copyright (c) 2018-2019 The Linux Foundation. All rights reserved. */
>  
>  #ifndef _A6XX_CRASH_DUMP_H_
>  #define _A6XX_CRASH_DUMP_H_
> @@ -307,11 +307,20 @@ struct a6xx_registers {
>  	0x3410, 0x3410, 0x3800, 0x3801,
>  };
>  
> +static const u32 a6xx_gbif_registers[] = {
> +	0x3C00, 0X3C0B, 0X3C40, 0X3C47, 0X3CC0, 0X3CD1, 0xE3A, 0xE3A,

Lower case hex, please.

> +};
> +
>  static const struct a6xx_registers a6xx_ahb_reglist[] = {
>  	REGS(a6xx_ahb_registers, 0, 0),
> -	REGS(a6xx_vbif_registers, 0, 0),
>  };
>  
> +static const struct a6xx_registers a6xx_vbif_reglist =
> +			REGS(a6xx_vbif_registers, 0, 0);
> +
> +static const struct a6xx_registers a6xx_gbif_reglist =
> +			REGS(a6xx_gbif_registers, 0, 0);
> +
>  static const u32 a6xx_gmu_gx_registers[] = {
>  	/* GMU GX */
>  	0x0000, 0x0000, 0x0010, 0x0013, 0x0016, 0x0016, 0x0018, 0x001b,
> @@ -422,6 +431,9 @@ struct a6xx_registers {
>  	DEBUGBUS(A6XX_DBGBUS_TPL1_3, 0x100),
>  };
>  
> +static const struct a6xx_debugbus_block a6xx_gbif_debugbus_block =
> +			DEBUGBUS(A6XX_DBGBUS_VBIF, 0x100);
> +
>  static const struct a6xx_debugbus_block a6xx_cx_debugbus_blocks[] = {
>  	DEBUGBUS(A6XX_DBGBUS_GMU_CX, 0x100),
>  	DEBUGBUS(A6XX_DBGBUS_CX, 0x100),
> -- 
> 1.9.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
