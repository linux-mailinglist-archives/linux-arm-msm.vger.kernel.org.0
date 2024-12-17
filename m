Return-Path: <linux-arm-msm+bounces-42588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E619F556A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 19:03:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 487B81726A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 17:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F441F6661;
	Tue, 17 Dec 2024 17:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Lk+mI58y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9305A442F;
	Tue, 17 Dec 2024 17:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734457968; cv=none; b=kKZa2PHr6JvGznNd0/6oWbLEEpcwK3nAEZ2CCOfLe0f7JgPa8ylX2K3LH4Lc0F8zaxVMBTx+yzKD690z2c0Wya3oREp6D2H0aHAfm6a2vJCytQkQmQ/34X+O9Q9srUTdfKMmxl6Uo3hB26e5Jz6akSU9ZdeDUmaO/mUzlK/YtB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734457968; c=relaxed/simple;
	bh=rxNmGYj0cm7vKEkNLss+ezOoW5pNuuLmVUQeMHt4HNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=W1EI3Rncn6FV8p1/B/QR2uxMxWq89blHb9jqyHeikG/XHMflUsZ75BIyzeTIqh9Wolx3Yhtk710ykPR2IGE+b9Hrz+7s6U85KzTtEpTTZaPNv0hJsACcjt4Iwn+KWZQVorJJ4mDAqiQJw5YRdr/Sk64SLhqAthyjjkR2el7Kdfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Lk+mI58y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHFlfp1002919;
	Tue, 17 Dec 2024 17:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X7hlMd/FaZ0PUinVQ7uhLnPJtp3fAZlrCPqFWnHaizs=; b=Lk+mI58yDwLy+t7l
	u7gmMzXVXCCPuTblH+fCg0iWfBfiA1qCek3IT5mAAxx+OO5qc8oTggOIsNKZi8AM
	fo0npBnXmp7ba0OULhYXtmjpds9k4trnHTBA0fGu4WaGy85awicX+oWfm79qNds9
	S9AsxQQXv5KLNA0bzgqBsJkxJFwa45Jn6nqPaJvxzpmOweauzHZdBWDQuhAYGvSX
	1eg3gAP5zwdtv2CdyQfxnJ1/n1TGFhPA1RWhheeuET+hOooGMjG9HWMuPpE27ZsC
	ttOtmOz069I2gHaZk0ICQ3pyi2KXhAXpXUPuShxtQU8X5+Qx6Vz3hSEkejgiZqTf
	mSIAkA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kc8m8bgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 17:52:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BHHqaNN028967
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 17:52:36 GMT
Received: from [10.216.20.10] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Dec
 2024 09:52:30 -0800
Message-ID: <44f0bdee-5d85-4544-a91f-23804073237f@quicinc.com>
Date: Tue, 17 Dec 2024 23:22:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/7] drm/msm: adreno: dynamically generate GMU bw table
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20241217-topic-sm8x50-gpu-bw-vote-v6-0-1adaf97e7310@linaro.org>
 <20241217-topic-sm8x50-gpu-bw-vote-v6-3-1adaf97e7310@linaro.org>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20241217-topic-sm8x50-gpu-bw-vote-v6-3-1adaf97e7310@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Hf9Xvo-hgUZr1ATiwos_YVRuf9ofXIvW
X-Proofpoint-GUID: Hf9Xvo-hgUZr1ATiwos_YVRuf9ofXIvW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170137

On 12/17/2024 8:21 PM, Neil Armstrong wrote:
> The Adreno GPU Management Unit (GMU) can also scale the ddr
> bandwidth along the frequency and power domain level, but for
> now we statically fill the bw_table with values from the
> downstream driver.
> 
> Only the first entry is used, which is a disable vote, so we
> currently rely on scaling via the linux interconnect paths.
> 
> Let's dynamically generate the bw_table with the vote values
> previously calculated from the OPPs.
> 
> Those entries will then be used by the GMU when passing the
> appropriate bandwidth level while voting for a gpu frequency.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 48 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 47 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index cb8844ed46b29c4569d05eb7a24f7b27e173190f..995526620d678cd05020315f771213e4a6943bec 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -6,6 +6,7 @@
>  #include <linux/list.h>
>  
>  #include <soc/qcom/cmd-db.h>
> +#include <soc/qcom/tcs.h>
>  
>  #include "a6xx_gmu.h"
>  #include "a6xx_gmu.xml.h"
> @@ -259,6 +260,48 @@ static int a6xx_hfi_send_perf_table(struct a6xx_gmu *gmu)
>  		NULL, 0);
>  }
>  
> +static void a6xx_generate_bw_table(const struct a6xx_info *info, struct a6xx_gmu *gmu,
> +				   struct a6xx_hfi_msg_bw_table *msg)
> +{
> +	unsigned int i, j;
> +
> +	for (i = 0; i < GMU_MAX_BCMS; i++) {
> +		if (!info->bcms[i].name)
> +			break;
> +		msg->ddr_cmds_addrs[i] = cmd_db_read_addr(info->bcms[i].name);
> +	}
> +	msg->ddr_cmds_num = i;
> +
> +	for (i = 0; i < gmu->nr_gpu_bws; ++i)
> +		for (j = 0; j < msg->ddr_cmds_num; j++)
> +			msg->ddr_cmds_data[i][j] = gmu->gpu_ib_votes[i][j];
> +	msg->bw_level_num = gmu->nr_gpu_bws;
> +
> +	/* Compute the wait bitmask with each BCM having the commit bit */
> +	msg->ddr_wait_bitmask = 0;
> +	for (j = 0; j < msg->ddr_cmds_num; j++)
> +		if (msg->ddr_cmds_data[0][j] & BCM_TCS_CMD_COMMIT_MASK)
> +			msg->ddr_wait_bitmask |= BIT(j);
> +
> +	/*
> +	 * These are the CX (CNOC) votes - these are used by the GMU
> +	 * The 'CN0' BCM is used on all targets, and votes are basically
> +	 * 'off' and 'on' states with first bit to enable the path.
> +	 */
> +
> +	msg->cnoc_cmds_addrs[0] = cmd_db_read_addr("CN0");
> +	msg->cnoc_cmds_num = 1;
> +
> +	msg->cnoc_cmds_data[0][0] = BCM_TCS_CMD(true, false, 0, 0);
> +	msg->cnoc_cmds_data[1][0] = BCM_TCS_CMD(true, true, 0, BIT(0));
> +
> +	/* Compute the wait bitmask with each BCM having the commit bit */
> +	msg->cnoc_wait_bitmask = 0;
> +	for (j = 0; j < msg->cnoc_cmds_num; j++)
> +		if (msg->cnoc_cmds_data[0][j] & BCM_TCS_CMD_COMMIT_MASK)
> +			msg->cnoc_wait_bitmask |= BIT(j);
> +}
> +
>  static void a618_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  {
>  	/* Send a single "off" entry since the 618 GMU doesn't do bus scaling */
> @@ -664,6 +707,7 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>  	struct a6xx_hfi_msg_bw_table *msg;
>  	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>  	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> +	const struct a6xx_info *info = adreno_gpu->info->a6xx;
>  
>  	if (gmu->bw_table)
>  		goto send;
> @@ -672,7 +716,9 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>  	if (!msg)
>  		return -ENOMEM;
>  
> -	if (adreno_is_a618(adreno_gpu))
> +	if (info->bcms && gmu->nr_gpu_bws > 1)
> +		a6xx_generate_bw_table(info, gmu, msg);
> +	else if (adreno_is_a618(adreno_gpu))
>  		a618_build_bw_table(msg);
>  	else if (adreno_is_a619(adreno_gpu))
>  		a619_build_bw_table(msg);
> 


