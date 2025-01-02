Return-Path: <linux-arm-msm+bounces-43779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F99E9FF826
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2025 11:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9D22161EEC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2025 10:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D2419E999;
	Thu,  2 Jan 2025 10:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DQOVbOUn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471B2195F0D;
	Thu,  2 Jan 2025 10:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735814027; cv=none; b=klQoIXsXSP/md1msNGHDKGN81pfXlDImLvnwbPFrbp0ZsYCWIMnMju8fYpBUmyVoWPOGCFIydtXY6Lq/mzmQLUQltB8GeneSl9zaRyMm2aR+2xU74BHR8XgrC1Jpdq9DA4lvO3zjc2KgUzBgYqxlu4goxqUyEKmW2GKEjRYnKg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735814027; c=relaxed/simple;
	bh=vluUGggdembw9wQfzUgsYsvGDW2QdndkxzoQBOcq1As=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DlzhOyzIDu4baZgA9YF4rECGb0D5CG6R5tM4YqNJPgjvcoXdOhUT4ibuVrYoh7vJbZnaBLbNY920CaOMlZlJWl+mGt2nykAZ/Nze/FiHFRfu8OcPwqtFIZpckUsK0KRRxvZQuGavPHlAcf5tTzrqbXTVkEJvlaebrU0u1nFbSZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DQOVbOUn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5020s38c021511;
	Thu, 2 Jan 2025 10:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LFmz1Z7EOJf7jUkRMX6oPUrW3zgPF/IHhG2c5RfNw+4=; b=DQOVbOUn3CQqK2pp
	zw0UUU1xSRtuQja2GvW8yMa6Y6GnXmwMONEHHXAm54qIoDWo0KLyWCmPNo1ib1IO
	1WiFKUZyGwgAa2jmKdhmb/v5zlhGl73O72toRs11gWkZIBqmwnZ48O0hCAkuy3pQ
	0z7OOXsu6x626eufQnKklLvm9lpyc3H7G5DrBZ2Obrd0Ve4htITaqplaAbs0KNex
	Lktl1hLSVh3WalaLC774//6+N2MSHVfZ7/80Wqifj+DaY3+fJJ9Lhp8nXpz34kkP
	2E89FFJt+jUyrGH8gP9xZuLq4D4IVaJv8pzeD98JcnCzRFi8BXtvCw4YAJZLAr3T
	xWxiyw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43wgnj10u3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jan 2025 10:33:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 502AXZJX012810
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 2 Jan 2025 10:33:35 GMT
Received: from [10.216.23.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 2 Jan 2025
 02:33:28 -0800
Message-ID: <82d06ce7-070c-4c86-9a56-62bcf2319478@quicinc.com>
Date: Thu, 2 Jan 2025 16:03:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] drm/msm/adreno: Add support for ACD
To: <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul
	<sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Viresh Kumar
	<vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20241231-gpu-acd-v3-0-3ba73660e9ca@quicinc.com>
 <20241231-gpu-acd-v3-1-3ba73660e9ca@quicinc.com>
 <ae360497-84d5-4153-8bc4-b3943fb30dc5@linaro.org>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <ae360497-84d5-4153-8bc4-b3943fb30dc5@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Zr2uUo9BNYSS-cuL7fQWhJXT4N62i2EX
X-Proofpoint-GUID: Zr2uUo9BNYSS-cuL7fQWhJXT4N62i2EX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501020091

On 12/31/2024 3:18 PM, neil.armstrong@linaro.org wrote:
> On 30/12/2024 22:11, Akhil P Oommen wrote:
>> ACD a.k.a Adaptive Clock Distribution is a feature which helps to reduce
>> the power consumption. In some chipsets, it is also a requirement to
>> support higher GPU frequencies. This patch adds support for GPU ACD by
>> sending necessary data to GMU and AOSS. The feature support for the
>> chipset is detected based on devicetree data.
>>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 84 +++++++++++++++++++++++++
>> +++++-----
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
>>   drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 36 +++++++++++++++
>>   drivers/gpu/drm/msm/adreno/a6xx_hfi.h | 21 +++++++++
>>   4 files changed, 132 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/
>> msm/adreno/a6xx_gmu.c
>> index 14db7376c712..2689e79aefa5 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -1021,14 +1021,6 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
>>         gmu->hung = false;
>>   -    /* Notify AOSS about the ACD state (unimplemented for now =>
>> disable it) */
>> -    if (!IS_ERR(gmu->qmp)) {
>> -        ret = qmp_send(gmu->qmp, "{class: gpu, res: acd, val: %d}",
>> -                   0 /* Hardcode ACD to be disabled for now */);
>> -        if (ret)
>> -            dev_err(gmu->dev, "failed to send GPU ACD state\n");
>> -    }
>> -
>>       /* Turn on the resources */
>>       pm_runtime_get_sync(gmu->dev);
>>   @@ -1476,6 +1468,68 @@ static int a6xx_gmu_pwrlevels_probe(struct
>> a6xx_gmu *gmu)
>>       return a6xx_gmu_rpmh_votes_init(gmu);
>>   }
>>   +static int a6xx_gmu_acd_probe(struct a6xx_gmu *gmu)
>> +{
>> +    struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>> +    struct a6xx_hfi_acd_table *cmd = &gmu->acd_table;
>> +    struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>> +    struct msm_gpu *gpu = &adreno_gpu->base;
>> +    int ret, i, cmd_idx = 0;
>> +
>> +    cmd->version = 1;
>> +    cmd->stride = 1;
>> +    cmd->enable_by_level = 0;
>> +
>> +    /* Skip freq = 0 and parse acd-level for rest of the OPPs */
>> +    for (i = 1; i < gmu->nr_gpu_freqs; i++) {
>> +        struct dev_pm_opp *opp;
>> +        struct device_node *np;
>> +        unsigned long freq;
>> +        u32 val;
>> +
>> +        freq = gmu->gpu_freqs[i];
>> +        opp = dev_pm_opp_find_freq_exact(&gpu->pdev->dev, freq, true);
>> +        np = dev_pm_opp_get_of_node(opp);
>> +
>> +        ret = of_property_read_u32(np, "qcom,opp-acd-level", &val);
>> +        of_node_put(np);
>> +        dev_pm_opp_put(opp);
>> +        if (ret == -EINVAL)
>> +            continue;
>> +        else if (ret) {
>> +            DRM_DEV_ERROR(gmu->dev, "Unable to read acd level for
>> freq %lu\n", freq);
>> +            return ret;
>> +        }
>> +
>> +        cmd->enable_by_level |= BIT(i);
>> +        cmd->data[cmd_idx++] = val;
>> +    }
>> +
>> +    cmd->num_levels = cmd_idx;
>> +
>> +    /* It is a problem if qmp node is unavailable when ACD is
>> required */
>> +    if (cmd->enable_by_level && IS_ERR_OR_NULL(gmu->qmp)) {
>> +        DRM_DEV_ERROR(gmu->dev, "Unable to send ACD state to AOSS\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    /* Otherwise, nothing to do if qmp is unavailable */
>> +    if (IS_ERR_OR_NULL(gmu->qmp))
>> +        return 0;
>> +
>> +    /*
>> +     * Notify AOSS about the ACD state. AOSS is supposed to assume
>> that ACD is disabled on
>> +     * system reset. So it is harmless if we couldn't notify 'OFF' state
>> +     */
>> +    ret = qmp_send(gmu->qmp, "{class: gpu, res: acd, val: %d}", !!
>> cmd->enable_by_level);
>> +    if (ret && cmd->enable_by_level) {
>> +        DRM_DEV_ERROR(gmu->dev, "Failed to send ACD state to AOSS\n");
>> +        return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static int a6xx_gmu_clocks_probe(struct a6xx_gmu *gmu)
>>   {
>>       int ret = devm_clk_bulk_get_all(gmu->dev, &gmu->clocks);
>> @@ -1793,7 +1847,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu,
>> struct device_node *node)
>>       gmu->qmp = qmp_get(gmu->dev);
>>       if (IS_ERR(gmu->qmp) && adreno_is_a7xx(adreno_gpu)) {
>>           ret = PTR_ERR(gmu->qmp);
>> -        goto remove_device_link;
>> +        goto detach_gxpd;
>>       }
>>         init_completion(&gmu->pd_gate);
>> @@ -1809,6 +1863,10 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu,
>> struct device_node *node)
>>       /* Get the power levels for the GMU and GPU */
>>       a6xx_gmu_pwrlevels_probe(gmu);
>>   +    ret = a6xx_gmu_acd_probe(gmu);
>> +    if (ret)
>> +        goto detach_gxpd;
>> +
>>       /* Set up the HFI queues */
>>       a6xx_hfi_init(gmu);
>>   @@ -1819,7 +1877,13 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu,
>> struct device_node *node)
>>         return 0;
>>   -remove_device_link:
>> +detach_gxpd:
>> +    if (!IS_ERR_OR_NULL(gmu->gxpd))
>> +        dev_pm_domain_detach(gmu->gxpd, false);
>> +
>> +    if (!IS_ERR_OR_NULL(gmu->qmp))
>> +        qmp_put(gmu->qmp);
>> +
>>       device_link_del(link);
>>     detach_cxpd:
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/
>> msm/adreno/a6xx_gmu.h
>> index b4a79f88ccf4..87d225b08e9b 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>> @@ -81,6 +81,7 @@ struct a6xx_gmu {
>>       int nr_gpu_freqs;
>>       unsigned long gpu_freqs[16];
>>       u32 gx_arc_votes[16];
>> +    struct a6xx_hfi_acd_table acd_table;
>>         int nr_gmu_freqs;
>>       unsigned long gmu_freqs[4];
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/
>> msm/adreno/a6xx_hfi.c
>> index cb8844ed46b2..3c183c1c6266 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> @@ -702,6 +702,38 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu
>> *gmu)
>>           NULL, 0);
>>   }
>>   +#define HFI_FEATURE_ACD 12
>> +
>> +static int a6xx_hfi_enable_acd(struct a6xx_gmu *gmu)
>> +{
>> +    struct a6xx_hfi_acd_table *acd_table = &gmu->acd_table;
>> +    struct a6xx_hfi_msg_feature_ctrl msg = {
>> +        .feature = HFI_FEATURE_ACD,
>> +        .enable = 1,
>> +        .data = 0,
>> +    };
>> +    int ret;
>> +
>> +    if (!acd_table->enable_by_level)
>> +        return 0;
>> +
>> +    /* Enable ACD feature at GMU */
>> +    ret = a6xx_hfi_send_msg(gmu, HFI_H2F_FEATURE_CTRL, &msg,
>> sizeof(msg), NULL, 0);
>> +    if (ret) {
>> +        DRM_DEV_ERROR(gmu->dev, "Unable to enable ACD (%d)\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    /* Send ACD table to GMU */
>> +    ret = a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_ACD, &msg, sizeof(msg),
>> NULL, 0);
> 
> 
> Seems you still don't send the proper acd_table

Aah! I forgot this one. Usually the end-to-end validation is done by HW
folks during Bringups. But I think I can do some additional validation
on the gmu fw side. Will check that and post Rev-4.

-Akhil.

> 
> Neil
> 
>> +    if (ret) {
>> +        DRM_DEV_ERROR(gmu->dev, "Unable to ACD table (%d)\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static int a6xx_hfi_send_test(struct a6xx_gmu *gmu)
>>   {
>>       struct a6xx_hfi_msg_test msg = { 0 };
>> @@ -799,6 +831,10 @@ int a6xx_hfi_start(struct a6xx_gmu *gmu, int
>> boot_state)
>>       if (ret)
>>           return ret;
>>   +    ret = a6xx_hfi_enable_acd(gmu);
>> +    if (ret)
>> +        return ret;
>> +
>>       ret = a6xx_hfi_send_core_fw_start(gmu);
>>       if (ret)
>>           return ret;
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h b/drivers/gpu/drm/
>> msm/adreno/a6xx_hfi.h
>> index 528110169398..51864c8ad0e6 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
>> @@ -151,12 +151,33 @@ struct a6xx_hfi_msg_test {
>>       u32 header;
>>   };
>>   +#define HFI_H2F_MSG_ACD 7
>> +#define MAX_ACD_STRIDE 2
>> +
>> +struct a6xx_hfi_acd_table {
>> +    u32 header;
>> +    u32 version;
>> +    u32 enable_by_level;
>> +    u32 stride;
>> +    u32 num_levels;
>> +    u32 data[16 * MAX_ACD_STRIDE];
>> +};
>> +
>>   #define HFI_H2F_MSG_START 10
>>     struct a6xx_hfi_msg_start {
>>       u32 header;
>>   };
>>   +#define HFI_H2F_FEATURE_CTRL 11
>> +
>> +struct a6xx_hfi_msg_feature_ctrl {
>> +    u32 header;
>> +    u32 feature;
>> +    u32 enable;
>> +    u32 data;
>> +};
>> +
>>   #define HFI_H2F_MSG_CORE_FW_START 14
>>     struct a6xx_hfi_msg_core_fw_start {
>>
> 


