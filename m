Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3D269107D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 19:43:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbjBISnQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Feb 2023 13:43:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjBISnN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Feb 2023 13:43:13 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 558E357746
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Feb 2023 10:43:10 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id m2so9171608ejb.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Feb 2023 10:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hrav6ua2RQc3ThZ6PaiqkS0hJexKMC8H82PZ7XBGrFw=;
        b=SghGp0pWKk3UmYe7wP2bEW0y1AyQWaoiRs9fzsW7eZ6Ou8vMP5tIM6IcJ5M7IbxXRX
         lAI4r37jixdAWiciZJN+EDG/I/JsU3w8We7Q5MFqsj+boQLryGpF32b/heHxYBa9v4mL
         Uzvsj52RUJ9ATFPQPLlVJXXiWjQmO8lt2/qGNBEL+Sn5Vnaqc+L9Iyvk89UBe7TzU5Dd
         efKatlZp9g5m7uIAtUJb9PCJIpR9k5YOZTf+c7RcOzWnGCxfCvn7WUn/qJLero9QDW68
         ogDmuQIWUB87OFJv2hhsMKsBDYNJDl39yOZZcPLOduyJhyfcq+kY/rm6TK0gKSmBJuKg
         lW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hrav6ua2RQc3ThZ6PaiqkS0hJexKMC8H82PZ7XBGrFw=;
        b=QN2AstwmE3snphf+JIKdWWBSTAhSkMjmnhxRhn9XYCheczuUMmJ8htm7jtjzSPnqpP
         17SKGVErHy1h4Umku2XzDvM3HITJIZxzob4QyY70uv1UacQ2vfP7tD7RbOuomiyaIE0u
         noLfXATv2w1gKRtGbHHlVpWNnQIeFeTwcjMF/w2+LPTPZLf0XSpv6TlivJKD0LE9zsHZ
         h4FdX9QGDBEo8345MIj5zbbpCY4c7FZqi/jSAMtia7rn5flY4Ci89qxHYhPMOfT1x4Gh
         wHSlBlRgi4SmyYwQJNZVYsqxGBMoZxD+uXlQrV1iZTQRrmg9JUt0rN/UgRCIfIW91T5L
         xsog==
X-Gm-Message-State: AO0yUKUmGu4ZyF81nKDdZiWZQQAuXAWkOSrFWXKZJnYZd2eUdMN45J1z
        36QbBc2fsMSV+2GOJoNjq9y2i3qjCcdkevN5
X-Google-Smtp-Source: AK7set/m7LIHIo3iQlW67Py5E9mjdRfSV0DyOQ3fu1HoTZxrGe1UdS9KTpi/NpKsaN26l1ylk7nzyA==
X-Received: by 2002:a17:906:a18c:b0:88a:bb13:7329 with SMTP id s12-20020a170906a18c00b0088abb137329mr13578349ejy.53.1675968188843;
        Thu, 09 Feb 2023 10:43:08 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id de56-20020a1709069bf800b00878530f5324sm1217948ejc.90.2023.02.09.10.43.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 10:43:07 -0800 (PST)
Message-ID: <d711066b-58e6-da43-f8d0-c33fabae2f26@linaro.org>
Date:   Thu, 9 Feb 2023 20:43:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/3] drm/msm/adreno: Add Adreno A690 support
Content-Language: en-GB
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, johan@kernel.org, mani@kernel.org
References: <20230208034052.2047681-1-quic_bjorande@quicinc.com>
 <20230208034052.2047681-2-quic_bjorande@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230208034052.2047681-2-quic_bjorande@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/02/2023 05:40, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Introduce support for the Adreno A690, found in Qualcomm SC8280XP.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 120 ++++++++++++++++++++-
>   drivers/gpu/drm/msm/adreno/a6xx_hfi.c      |  34 ++++++
>   drivers/gpu/drm/msm/adreno/adreno_device.c |  14 +++
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  10 +-
>   4 files changed, 173 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index aae60cbd9164..81dfcc5073ad 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -588,6 +588,63 @@ const struct adreno_reglist a660_hwcg[] = {
>   	{},
>   };
>   
> +const struct adreno_reglist a690_hwcg[] = {
> +	{REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x02222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080},
> +	{REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000F3CF},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00022222},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111},
> +	{REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111},
> +	{REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111},
> +	{REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111},
> +	{REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777},
> +	{REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777},
> +	{REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777},
> +	{REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x01002222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220},
> +	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040F00},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x25222022},
> +	{REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00005555},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011},
> +	{REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00445044},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222},
> +	{REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00002222},
> +	{REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x00222222},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ_2, 0x00000002},
> +	{REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00002222},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004},
> +	{REG_A6XX_RBBM_CLOCK_HYST_HLSQ, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_TEX_FCHE, 0x00000222},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_TEX_FCHE, 0x00000111},
> +	{REG_A6XX_RBBM_CLOCK_HYST_TEX_FCHE, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_HYST_UCHE, 0x00000004},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002},
> +	{REG_A6XX_RBBM_CLOCK_CNTL, 0x8AA8AA82},
> +	{REG_A6XX_RBBM_ISDB_CNT, 0x00000182},
> +	{REG_A6XX_RBBM_RAC_THRESHOLD_CNT, 0x00000000},
> +	{REG_A6XX_RBBM_SP_HYST_CNT, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
> +	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555},
> +	{REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL, 0x20200},
> +	{REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL, 0x10111},
> +	{REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL, 0x5555},
> +	{}
> +};
> +
>   static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>   {
>   	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> @@ -747,6 +804,45 @@ static const u32 a660_protect[] = {
>   	A6XX_PROTECT_NORDWR(0x1f8c0, 0x0000), /* note: infinite range */
>   };
>   
> +/* These are for a690 */
> +static const u32 a690_protect[] = {
> +	A6XX_PROTECT_RDONLY(0x00000, 0x004ff),
> +	A6XX_PROTECT_RDONLY(0x00501, 0x00001),

Judging from msm-5.4 this should be , 0x0005

> +	A6XX_PROTECT_RDONLY(0x0050b, 0x002f4),
> +	A6XX_PROTECT_NORDWR(0x0050e, 0x00000),
> +	A6XX_PROTECT_NORDWR(0x00510, 0x00000),
> +	A6XX_PROTECT_NORDWR(0x00534, 0x00000),
> +	A6XX_PROTECT_NORDWR(0x00800, 0x00082),
> +	A6XX_PROTECT_NORDWR(0x008a0, 0x00008),
> +	A6XX_PROTECT_NORDWR(0x008ab, 0x00024),
> +	A6XX_PROTECT_RDONLY(0x008d0, 0x000bc),
> +	A6XX_PROTECT_NORDWR(0x00900, 0x0004d),
> +	A6XX_PROTECT_NORDWR(0x0098d, 0x00272),
> +	A6XX_PROTECT_NORDWR(0x00e00, 0x00001),
> +	A6XX_PROTECT_NORDWR(0x00e03, 0x0000c),
> +	A6XX_PROTECT_NORDWR(0x03c00, 0x000c3),
> +	A6XX_PROTECT_RDONLY(0x03cc4, 0x01fff),
> +	A6XX_PROTECT_NORDWR(0x08630, 0x001cf),
> +	A6XX_PROTECT_NORDWR(0x08e00, 0x00000),
> +	A6XX_PROTECT_NORDWR(0x08e08, 0x00008),
> +	A6XX_PROTECT_NORDWR(0x08e50, 0x0001f),
> +	A6XX_PROTECT_NORDWR(0x08e80, 0x0027f),
> +	A6XX_PROTECT_NORDWR(0x09624, 0x001db),
> +	A6XX_PROTECT_NORDWR(0x09e60, 0x00011),
> +	A6XX_PROTECT_NORDWR(0x09e78, 0x00187),
> +	A6XX_PROTECT_NORDWR(0x0a630, 0x001cf),
> +	A6XX_PROTECT_NORDWR(0x0ae02, 0x00000),
> +	A6XX_PROTECT_NORDWR(0x0ae50, 0x0012f),
> +	A6XX_PROTECT_NORDWR(0x0b604, 0x00000),
> +	A6XX_PROTECT_NORDWR(0x0b608, 0x00006),
> +	A6XX_PROTECT_NORDWR(0x0be02, 0x00001),
> +	A6XX_PROTECT_NORDWR(0x0be20, 0x0015f),
> +	A6XX_PROTECT_NORDWR(0x0d000, 0x005ff),
> +	A6XX_PROTECT_NORDWR(0x0f000, 0x00bff),
> +	A6XX_PROTECT_RDONLY(0x0fc00, 0x01fff),
> +	A6XX_PROTECT_NORDWR(0x11c00, 0x00000), /*note: infiite range */
> +};
> +
>   static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>   {
>   	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> @@ -758,6 +854,11 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>   		count = ARRAY_SIZE(a650_protect);
>   		count_max = 48;
>   		BUILD_BUG_ON(ARRAY_SIZE(a650_protect) > 48);
> +	} else if (adreno_is_a690(adreno_gpu)) {
> +		regs = a690_protect;
> +		count = ARRAY_SIZE(a690_protect);
> +		count_max = 48;
> +		BUILD_BUG_ON(ARRAY_SIZE(a690_protect) > 48);
>   	} else if (adreno_is_a660_family(adreno_gpu)) {
>   		regs = a660_protect;
>   		count = ARRAY_SIZE(a660_protect);
> @@ -806,6 +907,13 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>   		uavflagprd_inv = 2;
>   	}
>   
> +	if (adreno_is_a690(adreno_gpu)) {
> +		lower_bit = 2;
> +		amsbc = 1;
> +		rgb565_predicator = 1;
> +		uavflagprd_inv = 2;
> +	}
> +
>   	if (adreno_is_7c3(adreno_gpu)) {
>   		lower_bit = 1;
>   		amsbc = 1;
> @@ -1065,13 +1173,18 @@ static int hw_init(struct msm_gpu *gpu)
>   	if (adreno_is_a660_family(adreno_gpu))
>   		gpu_write(gpu, REG_A6XX_CP_LPAC_PROG_FIFO_SIZE, 0x00000020);
>   
> +	if (adreno_is_a690(adreno_gpu)) {
> +		gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x0);

I might sound like a purist here, but a660 has this down, after setting 
cp_protect

> +		gpu_write(gpu, REG_A6XX_CP_LPAC_PROG_FIFO_SIZE, 0x00000020);
> +	}
> +
>   	/* Setting the mem pool size */
>   	gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, 128);
>   
>   	/* Setting the primFifo thresholds default values,
>   	 * and vccCacheSkipDis=1 bit (0x200) for A640 and newer
>   	*/
> -	if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
> +	if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu) || adreno_is_a690(adreno_gpu))
>   		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
>   	else if (adreno_is_a640_family(adreno_gpu) || adreno_is_7c3(adreno_gpu))
>   		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
> @@ -1579,7 +1692,7 @@ static void a6xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
>   		/* On A660, the SCID programming for UCHE traffic is done in
>   		 * A6XX_GBIF_SCACHE_CNTL0[14:10]
>   		 */
> -		if (adreno_is_a660_family(adreno_gpu))
> +		if (adreno_is_a660_family(adreno_gpu) || adreno_is_a690(adreno_gpu))
>   			gpu_rmw(gpu, REG_A6XX_GBIF_SCACHE_CNTL0, (0x1f << 10) |
>   				(1 << 8), (gpu_scid << 10) | (1 << 8));
>   	}
> @@ -2006,7 +2119,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>   	info = adreno_info(config->rev);
>   
>   	if (info && (info->revn == 650 || info->revn == 660 ||
> -			adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), info->rev)))
> +		     info->revn == 690 ||
> +		     adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), info->rev)))
>   		adreno_gpu->base.hw_apriv = true;
>   
>   	a6xx_llc_slices_init(pdev, a6xx_gpu);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index 2cc83e049613..4d6d68a25931 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -4,6 +4,7 @@
>   #include <linux/completion.h>
>   #include <linux/circ_buf.h>
>   #include <linux/list.h>
> +#include <soc/qcom/cmd-db.h>
>   
>   #include "a6xx_gmu.h"
>   #include "a6xx_gmu.xml.h"
> @@ -414,6 +415,37 @@ static void a650_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>   	msg->cnoc_cmds_data[1][0] =  0x60000001;
>   }
>   
> +static void a690_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> +{
> +	/*
> +	 * Send a single "off" entry just to get things running
> +	 * TODO: bus scaling
> +	 */
> +	msg->bw_level_num = 1;
> +
> +	msg->ddr_cmds_num = 3;
> +	msg->ddr_wait_bitmask = 0x01;
> +
> +	msg->ddr_cmds_addrs[0] = cmd_db_read_addr("SH0");
> +	msg->ddr_cmds_addrs[1] = cmd_db_read_addr("MC0");
> +	msg->ddr_cmds_addrs[2] = cmd_db_read_addr("ACV");

As we are calling into cmd db. we should make sure that cmd_db_ready() 
in adreno_bind().

> +
> +	msg->ddr_cmds_data[0][0] =  0x40000000;
> +	msg->ddr_cmds_data[0][1] =  0x40000000;
> +	msg->ddr_cmds_data[0][2] =  0x40000000;
> +
> +	/*
> +	 * These are the CX (CNOC) votes - these are used by the GMU but the
> +	 * votes are known and fixed for the target
> +	 */
> +	msg->cnoc_cmds_num = 1;
> +	msg->cnoc_wait_bitmask = 0x01;
> +
> +	msg->cnoc_cmds_addrs[0] = cmd_db_read_addr("CN0");
> +	msg->cnoc_cmds_data[0][0] =  0x40000000;
> +	msg->cnoc_cmds_data[1][0] =  0x60000001;
> +}
> +
>   static void a660_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>   {
>   	/*
> @@ -531,6 +563,8 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>   		adreno_7c3_build_bw_table(&msg);
>   	else if (adreno_is_a660(adreno_gpu))
>   		a660_build_bw_table(&msg);
> +	else if (adreno_is_a690(adreno_gpu))
> +		a690_build_bw_table(&msg);
>   	else
>   		a6xx_build_bw_table(&msg);
>   
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index ca38b837dedb..437515e46e5a 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -355,6 +355,20 @@ static const struct adreno_info gpulist[] = {
>   		.init = a6xx_gpu_init,
>   		.zapfw = "a640_zap.mdt",
>   		.hwcg = a640_hwcg,
> +	}, {
> +		.rev = ADRENO_REV(6, 9, 0, ANY_ID),
> +		.revn = 690,
> +		.name = "A690",
> +		.fw = {
> +			[ADRENO_FW_SQE] = "a660_sqe.fw",

If it uses a660 sqe, should it also belong to a660 family? Or is it 
significantly different?

> +			[ADRENO_FW_GMU] = "a690_gmu.bin",
> +		},
> +		.gmem = SZ_4M,
> +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.init = a6xx_gpu_init,
> +		.zapfw = "a690_zap.mdt",
> +		.hwcg = a690_hwcg,
> +		.address_space_size = SZ_16G,
>   	},
>   };
>   
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index b4f9b1343d63..da29bd392388 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -55,7 +55,7 @@ struct adreno_reglist {
>   	u32 value;
>   };
>   
> -extern const struct adreno_reglist a615_hwcg[], a630_hwcg[], a640_hwcg[], a650_hwcg[], a660_hwcg[];
> +extern const struct adreno_reglist a615_hwcg[], a630_hwcg[], a640_hwcg[], a650_hwcg[], a660_hwcg[], a690_hwcg[];
>   
>   struct adreno_info {
>   	struct adreno_rev rev;
> @@ -272,6 +272,11 @@ static inline int adreno_is_a660(struct adreno_gpu *gpu)
>   	return gpu->revn == 660;
>   }
>   
> +static inline int adreno_is_a690(struct adreno_gpu *gpu)
> +{
> +	return gpu->revn == 690;
> +};
> +
>   /* check for a615, a616, a618, a619 or any derivatives */
>   static inline int adreno_is_a615_family(struct adreno_gpu *gpu)
>   {
> @@ -286,7 +291,8 @@ static inline int adreno_is_a660_family(struct adreno_gpu *gpu)
>   /* check for a650, a660, or any derivatives */
>   static inline int adreno_is_a650_family(struct adreno_gpu *gpu)
>   {
> -	return gpu->revn == 650 || gpu->revn == 620 || adreno_is_a660_family(gpu);
> +	return gpu->revn == 650 || gpu->revn == 620  || gpu->revn == 690 ||
> +	       adreno_is_a660_family(gpu);
>   }
>   
>   u64 adreno_private_address_space_size(struct msm_gpu *gpu);

-- 
With best wishes
Dmitry

