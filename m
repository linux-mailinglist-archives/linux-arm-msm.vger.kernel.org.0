Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EDE6561E8D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 16:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234766AbiF3O7C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 10:59:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234755AbiF3O7B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 10:59:01 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DFC81E3E3;
        Thu, 30 Jun 2022 07:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1656601139; x=1688137139;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dl0T0/ZqHNImad3GS8CWBbWkVe6ZyWn8E2ecnN+CA2Q=;
  b=VzOe1EIW2B4zaHGLfyhzxTG4o7Adp3wSV1+CH/tWfAEoQVDMFxZ6+QA/
   FB+4Hy8r9woyZ6iriRYSrnpAMfOacA2BZxn4D/u+Eoz2SfYFW/KjoljUt
   LkdP7ZwebWFS3L34fUukVp6PcvxHC2QS5KX416V1XSRAIcVYSoqSrE3jr
   8=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 30 Jun 2022 07:58:58 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2022 07:58:57 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 30 Jun 2022 07:58:57 -0700
Received: from [10.216.41.7] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 30 Jun
 2022 07:58:49 -0700
Message-ID: <6bb3d055-6c28-db00-a550-2bdf396aeaf4@quicinc.com>
Date:   Thu, 30 Jun 2022 20:28:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v3 2/4] drm/msm/adreno: Add A619 support
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        <~postmarketos/upstreaming@lists.sr.ht>
CC:     <martin.botka@somainline.org>,
        <angelogioacchino.delregno@somainline.org>,
        <marijn.suijten@somainline.org>, <jamipkettunen@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Jonathan Marek" <jonathan@marek.ca>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        "Emma Anholt" <emma@anholt.net>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20220528160353.157870-1-konrad.dybcio@somainline.org>
 <20220528160353.157870-2-konrad.dybcio@somainline.org>
From:   Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20220528160353.157870-2-konrad.dybcio@somainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/28/2022 9:33 PM, Konrad Dybcio wrote:
> Add support for the Adreno 619 GPU, as found in Snapdragon 690 (SM6350),
> 480 (SM4350) and 750G (SM7225).
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> Changes since v2:
> - Fix some values in a619_build_bw_table (I think I miscopied things last
> time around..)
> - Add a comment about icache/dcache allocation for future porters
> - Resolve Dmitry's comment about BUG_ON (check patch 1/4)
>
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 13 +++-
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 70 +++++++++++++++++++++-
>   drivers/gpu/drm/msm/adreno/a6xx_hfi.c      | 65 +++++++++++++++++++-
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 14 +++++
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 13 +++-
>   5 files changed, 169 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index b1c876c339d0..0a7c3514e51b 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -527,6 +527,8 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>   		pdc_in_aop = true;
>   	else if (adreno_is_a618(adreno_gpu) || adreno_is_a640_family(adreno_gpu))
>   		pdc_address_offset = 0x30090;
> +	else if (adreno_is_a619(adreno_gpu))
> +		pdc_address_offset = 0x300a0;
>   	else
>   		pdc_address_offset = 0x30080;
>   
> @@ -601,7 +603,8 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>   
>   	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_MSGID + 4, 0x10108);
>   	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_ADDR + 4, 0x30000);
> -	if (adreno_is_a618(adreno_gpu) || adreno_is_a650_family(adreno_gpu))
> +	if (adreno_is_a618(adreno_gpu) || adreno_is_a619(adreno_gpu) ||
> +			adreno_is_a650_family(adreno_gpu))
>   		pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_DATA + 4, 0x2);
>   	else
>   		pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_DATA + 4, 0x3);
> @@ -1537,6 +1540,12 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>   			SZ_16M - SZ_16K, 0x04000, "icache");
>   		if (ret)
>   			goto err_memory;
> +	/*
> +	 * NOTE: when porting legacy ("pre-650-family") GPUs you may be tempted to add a condition
> +	 * to allocate icache/dcache here, as per downstream code flow, but it may not actually be
> +	 * necessary. If you omit this step and you don't get random pagefaults, you are likely
> +	 * good to go without this!
> +	 */
IOW, legacy gmu fw fits entirely within TCMs. So no need for 
icache/dcache backing allocations.
>   	} else if (adreno_is_a640_family(adreno_gpu)) {
>   		ret = a6xx_gmu_memory_alloc(gmu, &gmu->icache,
>   			SZ_256K - SZ_16K, 0x04000, "icache");
> @@ -1547,7 +1556,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>   			SZ_256K - SZ_16K, 0x44000, "dcache");
>   		if (ret)
>   			goto err_memory;
> -	} else {
> +	} else if (adreno_is_a630(adreno_gpu) || adreno_is_a615_family(adreno_gpu)) {
>   		/* HFI v1, has sptprac */
>   		gmu->legacy = true;
>   
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index ccc4fcf7a630..331cd2f6b9e3 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -252,6 +252,74 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>   	a6xx_flush(gpu, ring);
>   }
>   
> +/* For a615 family (a615, a616, a618 and a619) */
> +const struct adreno_reglist a615_hwcg[] = {
> +	{REG_A6XX_RBBM_CLOCK_CNTL_SP0,  0x02222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080},
> +	{REG_A6XX_RBBM_CLOCK_HYST_SP0,  0x0000F3CF},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_TP0,  0x02222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_TP1,  0x02222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL2_TP1, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL3_TP1, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00022222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL4_TP1, 0x00022222},
> +	{REG_A6XX_RBBM_CLOCK_HYST_TP0,  0x77777777},
> +	{REG_A6XX_RBBM_CLOCK_HYST_TP1,  0x77777777},
> +	{REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777},
> +	{REG_A6XX_RBBM_CLOCK_HYST2_TP1, 0x77777777},
> +	{REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777},
> +	{REG_A6XX_RBBM_CLOCK_HYST3_TP1, 0x77777777},
> +	{REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777},
> +	{REG_A6XX_RBBM_CLOCK_HYST4_TP1, 0x00077777},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_TP1, 0x11111111},
> +	{REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111},
> +	{REG_A6XX_RBBM_CLOCK_DELAY2_TP1, 0x11111111},
> +	{REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111},
> +	{REG_A6XX_RBBM_CLOCK_DELAY3_TP1, 0x11111111},
> +	{REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111},
> +	{REG_A6XX_RBBM_CLOCK_DELAY4_TP1, 0x00011111},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_UCHE,  0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL2_UCHE, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL3_UCHE, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL4_UCHE, 0x00222222},
> +	{REG_A6XX_RBBM_CLOCK_HYST_UCHE,  0x00000004},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x00002222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002020},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_CCU1, 0x00002220},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_CCU2, 0x00002220},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_CCU3, 0x00002220},
> +	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040F00},
> +	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU1, 0x00040F00},
> +	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU2, 0x00040F00},
> +	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU3, 0x00040F00},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x05022022},
> +	{REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00005555},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011},
> +	{REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00445044},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222},
> +	{REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x00222222},
> +	{REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00002222},
> +	{REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004},
> +	{REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00002222},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ_2, 0x00000002},
> +	{REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
> +	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555},
> +	{},
> +};
> +
>   const struct adreno_reglist a630_hwcg[] = {
>   	{REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
>   	{REG_A6XX_RBBM_CLOCK_CNTL_SP1, 0x22222222},
> @@ -555,7 +623,7 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>   	gpu_write(gpu, REG_A6XX_RBBM_CLOCK_CNTL, state ? clock_cntl_on : 0);
>   }
>   
> -/* For a615, a616, a618, A619, a630, a640 and a680 */
> +/* For a615, a616, a618, a619, a630, a640 and a680 */
>   static const u32 a6xx_protect[] = {
>   	A6XX_PROTECT_RDONLY(0x00000, 0x04ff),
>   	A6XX_PROTECT_RDONLY(0x00501, 0x0005),
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index d73fce5fdf1f..2cc83e049613 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -205,8 +205,8 @@ static int a6xx_hfi_get_fw_version(struct a6xx_gmu *gmu, u32 *version)
>   {
>   	struct a6xx_hfi_msg_fw_version msg = { 0 };
>   
> -	/* Currently supporting version 1.1 */
> -	msg.supported_version = (1 << 28) | (1 << 16);
> +	/* Currently supporting version 1.10 */
> +	msg.supported_version = (1 << 28) | (1 << 19) | (1 << 17);

why not the more readable "msg.supported_version = (1 << 28) | (10 << 16);" ?

>   
>   	return a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_FW_VERSION, &msg, sizeof(msg),
>   		version, sizeof(*version));
> @@ -285,6 +285,65 @@ static void a618_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>   	msg->cnoc_cmds_data[1][0] =  0x60000001;
>   }
>   
> +static void a619_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> +{
> +	msg->bw_level_num = 13;
> +
> +	msg->ddr_cmds_num = 3;
> +	msg->ddr_wait_bitmask = 0x0;
> +
> +	msg->ddr_cmds_addrs[0] = 0x50000;
> +	msg->ddr_cmds_addrs[1] = 0x50004;
> +	msg->ddr_cmds_addrs[2] = 0x50080;
> +
> +	msg->ddr_cmds_data[0][0]  = 0x40000000;
> +	msg->ddr_cmds_data[0][1]  = 0x40000000;
> +	msg->ddr_cmds_data[0][2]  = 0x40000000;
> +	msg->ddr_cmds_data[1][0]  = 0x6000030c;
> +	msg->ddr_cmds_data[1][1]  = 0x600000db;
> +	msg->ddr_cmds_data[1][2]  = 0x60000008;
> +	msg->ddr_cmds_data[2][0]  = 0x60000618;
> +	msg->ddr_cmds_data[2][1]  = 0x600001b6;
> +	msg->ddr_cmds_data[2][2]  = 0x60000008;
> +	msg->ddr_cmds_data[3][0]  = 0x60000925;
> +	msg->ddr_cmds_data[3][1]  = 0x60000291;
> +	msg->ddr_cmds_data[3][2]  = 0x60000008;
> +	msg->ddr_cmds_data[4][0]  = 0x60000dc1;
> +	msg->ddr_cmds_data[4][1]  = 0x600003dc;
> +	msg->ddr_cmds_data[4][2]  = 0x60000008;
> +	msg->ddr_cmds_data[5][0]  = 0x600010ad;
> +	msg->ddr_cmds_data[5][1]  = 0x600004ae;
> +	msg->ddr_cmds_data[5][2]  = 0x60000008;
> +	msg->ddr_cmds_data[6][0]  = 0x600014c3;
> +	msg->ddr_cmds_data[6][1]  = 0x600005d4;
> +	msg->ddr_cmds_data[6][2]  = 0x60000008;
> +	msg->ddr_cmds_data[7][0]  = 0x6000176a;
> +	msg->ddr_cmds_data[7][1]  = 0x60000693;
> +	msg->ddr_cmds_data[7][2]  = 0x60000008;
> +	msg->ddr_cmds_data[8][0]  = 0x60001f01;
> +	msg->ddr_cmds_data[8][1]  = 0x600008b5;
> +	msg->ddr_cmds_data[8][2]  = 0x60000008;
> +	msg->ddr_cmds_data[9][0]  = 0x60002940;
> +	msg->ddr_cmds_data[9][1]  = 0x60000b95;
> +	msg->ddr_cmds_data[9][2]  = 0x60000008;
> +	msg->ddr_cmds_data[10][0] = 0x60002f68;
> +	msg->ddr_cmds_data[10][1] = 0x60000d50;
> +	msg->ddr_cmds_data[10][2] = 0x60000008;
> +	msg->ddr_cmds_data[11][0] = 0x60003700;
> +	msg->ddr_cmds_data[11][1] = 0x60000f71;
> +	msg->ddr_cmds_data[11][2] = 0x60000008;
> +	msg->ddr_cmds_data[12][0] = 0x60003fce;
> +	msg->ddr_cmds_data[12][1] = 0x600011ea;
> +	msg->ddr_cmds_data[12][2] = 0x60000008;
except msg->ddr_cmds_data[0] we don't need the rest, because we vote for 
bw using icc driver not gmu.
> +
> +	msg->cnoc_cmds_num = 1;
> +	msg->cnoc_wait_bitmask = 0x0;
> +
> +	msg->cnoc_cmds_addrs[0] = 0x50054;
> +
> +	msg->cnoc_cmds_data[0][0] = 0x40000000;
> +}
> +
>   static void a640_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>   {
>   	/*
> @@ -462,6 +521,8 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>   
>   	if (adreno_is_a618(adreno_gpu))
>   		a618_build_bw_table(&msg);
> +	else if (adreno_is_a619(adreno_gpu))
> +		a619_build_bw_table(&msg);
>   	else if (adreno_is_a640_family(adreno_gpu))
>   		a640_build_bw_table(&msg);
>   	else if (adreno_is_a650(adreno_gpu))
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 8706bcdd1472..87be25aec540 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -264,6 +264,19 @@ static const struct adreno_info gpulist[] = {
>   		.gmem = SZ_512K,
>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>   		.init = a6xx_gpu_init,
> +	}, {
> +		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
> +		.revn = 619,
> +		.name = "A619",
> +		.fw = {
> +			[ADRENO_FW_SQE] = "a630_sqe.fw",
> +			[ADRENO_FW_GMU] = "a619_gmu.bin",
> +		},
> +		.gmem = SZ_512K,
> +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.init = a6xx_gpu_init,
> +		.zapfw = "a615_zap.mdt",
> +		.hwcg = a615_hwcg,
>   	}, {
>   		.rev = ADRENO_REV(6, 3, 0, ANY_ID),
>   		.revn = 630,
> @@ -355,6 +368,7 @@ MODULE_FIRMWARE("qcom/a530_zap.mdt");
>   MODULE_FIRMWARE("qcom/a530_zap.b00");
>   MODULE_FIRMWARE("qcom/a530_zap.b01");
>   MODULE_FIRMWARE("qcom/a530_zap.b02");
> +MODULE_FIRMWARE("qcom/a619_gmu.bin");
>   MODULE_FIRMWARE("qcom/a630_sqe.fw");
>   MODULE_FIRMWARE("qcom/a630_gmu.bin");
>   MODULE_FIRMWARE("qcom/a630_zap.mbn");
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 0490c5fbb780..a13a3e5a294b 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -57,7 +57,7 @@ struct adreno_reglist {
>   	u32 value;
>   };
>   
> -extern const struct adreno_reglist a630_hwcg[], a640_hwcg[], a650_hwcg[], a660_hwcg[];
> +extern const struct adreno_reglist a615_hwcg[], a630_hwcg[], a640_hwcg[], a650_hwcg[], a660_hwcg[];
>   
>   struct adreno_info {
>   	struct adreno_rev rev;
> @@ -242,6 +242,11 @@ static inline int adreno_is_a618(struct adreno_gpu *gpu)
>          return gpu->revn == 618;
>   }
>   
> +static inline int adreno_is_a619(struct adreno_gpu *gpu)
> +{
> +	return gpu->revn == 619;
> +}
> +
>   static inline int adreno_is_a630(struct adreno_gpu *gpu)
>   {
>          return gpu->revn == 630;
> @@ -268,6 +273,12 @@ static inline int adreno_is_a660(struct adreno_gpu *gpu)
>          return gpu->revn == 660;
>   }
>   
> +/* check for a615, a616, a618, a619 or any derivatives */
> +static inline int adreno_is_a615_family(struct adreno_gpu *gpu)
> +{
> +	return gpu->revn == 615 || gpu->revn == 616 || gpu->revn == 618 || gpu->revn == 619;
> +}
> +
>   static inline int adreno_is_a660_family(struct adreno_gpu *gpu)
>   {
>          return adreno_is_a660(gpu) || adreno_is_7c3(gpu);

Minor nits, but any way  "Reviewed-by: Akhil P Oommen 
<quic_akhilpo@quicinc.com>"

-Akhil


