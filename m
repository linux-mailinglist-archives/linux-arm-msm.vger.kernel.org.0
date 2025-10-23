Return-Path: <linux-arm-msm+bounces-78652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDBFC03BAB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 00:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0DBBC4E9CCE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 22:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4606B28852B;
	Thu, 23 Oct 2025 22:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VLbPC+fp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78425286417
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 22:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761260275; cv=none; b=M9gNsg9U+WM+Rh10DZhrTKZfDpABk4lJ+1KEPssi+tMZdcDXrgu9DkmDvx1DvfzjOW6/+kWyN1+sIZUJEg8uN9HWpF0ZOtpnm1y3u2grK3PTY27o1oNG9hPw/2bqnArCB8PLYNdmohSl3ak6DaHz/qQEpTmZ26pITYDVjDE4AhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761260275; c=relaxed/simple;
	bh=nDrTXByi3KUlvQDrC/NFPSo4998sq2FjECpmsFmWPIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pq/mXh15MP8OmIy18kpJdfVxxbvZlGp5O7VWocriG32oSWW/QNjHQ5Syj0gC+11xmLXzBvdRO/2O0GdvffcDnIz4Ss8e6PNxWU+EN9EzgnA6buVJKseRey2cgsP+a0l9gqDugk8iR2ZTCb7U4XyHyzdZkXUq85X5TdfiOiADZ7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VLbPC+fp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NEih5I020322
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 22:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yqaz483n1KlNxsCkKCJ5vTgJQhaR4GIj6IStln/zk3U=; b=VLbPC+fpwkd+9Fkh
	+TB12p1c6fUHnVViku03JJypYW6sJS2Cn/JO9EBfHCt+RuOIozk/wV/M29BDrX3g
	4SaUjT7jwFc53hi0AdTevzdTtpgWy7W+2OBUP04TexnxRTlM5NP4FWIbK+Dr/54i
	MAGNIl/WsBpVGV5jjpGGy1mLDHXiBmXsDcNWcXcNb5ygYS2FEoxxQ+AIoXBTnqGY
	6QbjatJVoh3eLICt9B4WooFVi4r9uVvUzmFYDf5lsHm+CU7a/ox+/qLly6BXOG7S
	A3JZWhyaB9/0KV8hUMtsju9zoU5YswolLoK7JgjOtda7WoHySaDaloraKKPAQuWs
	yEtH7Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08ptceh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 22:57:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-290c9724deeso12480215ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 15:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761260271; x=1761865071;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yqaz483n1KlNxsCkKCJ5vTgJQhaR4GIj6IStln/zk3U=;
        b=tGhtsr6t7MdG+AiKTe5710Yt8RsVdydeCLV7QJM7tRLv7eClRPGyjh+7fL9n6d9roW
         WnVl17KQ/+1+UzHj/wETzDEFsUWpkrz2JU38Inu+/2ztynP5fdymBYtB9/chSY90rKU5
         uDu4FKsLtCdKv3arzw6++AjZ4+cNVGb4baZdr/fgBKNPz8b1lJ/PAuEJnojxuBv4uk1F
         5Ktk0snMPA74FxOGwPcThApe4hdQHV6KOFhxfQXVmAHmEGJ8bRWAN1U+lqTudjRy79rC
         6O59d84DuEvG+d8gFYCtkX8LNpWpud1JFV2GIwWOhvo5pjSC1y0TiuZSlkV3cf/Bj6In
         99Gw==
X-Gm-Message-State: AOJu0YytC2WvTDqQm+o2yV0/zVgO/dEi6ZGqbzpSRS0BzputsD3QaQEq
	0GgB/nuzzH3LmcQM8epb0DKLlpPB544j9zckyJmdxhQge+TRbta0SO1QpLxxn+MtfCr7xQFVomZ
	u6+kO4CIVhLyn9vFIHiZfS/VhQ9Xg6yIpZsxjDk0jNGAlurLD76AcSD/HUnB34cWVRBLL
X-Gm-Gg: ASbGncuk0xZb2rjipEa+5wKDvemIUiql81SsOp1/l/CXXHKNU2Y/Na0OXbogmvyMy3W
	SHznmBvlgtix2r1HtjLKx7fn9oxzcyoCXks5OFAF3cpl8omF0kC3BKjRX19rYqRlnMItWcHAcl8
	txOvQe332VWgYYnuxT3bTTGeIcRy8kEEu8ubMalMeVLaJlc2/QlFdNZ+0DNWSqORAZpf2tYMn84
	8ZVaaypg+uw/hT6J/rjXcgbgTbF7V1pTEA3G95tVeRoVuIPdnOyJiwQTlBtuCLIsWfjCsQL1XNe
	zGmKNMDDkF/gXqd6EAAN3DU6IyEhlcMZalqo39ofFHiWmH3/frjG+XeYSj3Esl3S5nMfpFtoHjS
	HcaJs1v5rro9WdXIwE4Z/drA=
X-Received: by 2002:a17:903:138a:b0:28e:c9f6:867b with SMTP id d9443c01a7336-290c9cd4adbmr305413305ad.23.1761260271037;
        Thu, 23 Oct 2025 15:57:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHh6V4ZfvJsZGGaazZtGFR+31ad7iDZirAZP401lR3dDyWD/UCXocgWwsTkcU7pnidQWx55TQ==
X-Received: by 2002:a17:903:138a:b0:28e:c9f6:867b with SMTP id d9443c01a7336-290c9cd4adbmr305413105ad.23.1761260270488;
        Thu, 23 Oct 2025 15:57:50 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.232.102])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946ded7c8bsm34844225ad.22.2025.10.23.15.57.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 15:57:50 -0700 (PDT)
Message-ID: <97aeb6a1-fda2-440f-b14b-2f3dbc2d7e8e@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 04:27:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/msm/a6xx: Add support for Adreno 612
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
 <20251017-qcs615-spin-2-v1-1-0baa44f80905@oss.qualcomm.com>
 <44ff81bf-8970-475c-a4f5-c03220bc8c3f@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <44ff81bf-8970-475c-a4f5-c03220bc8c3f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX6poYDL8m+22u
 fi9SQNVF95cqvuQRJ5z6QcMtIlFR4g8L6rb3bc4n6hQgLNsBeEeDbU6Z1hwT3XPezo1tprfi3R8
 UU6aZ6YRXp27aT4AnuGOBvNS7l/5Svyoug79hpSD06twe7zHFYyZNdd16DXxLLTmCzGoXbvbIjZ
 ABfQ/gkxTwlIdYt5AlNxOMzfgioH4yW7lII3c/ETisNZEkvHxzwxaZPMGURHdsAzDYROxt89WGi
 o40uQ/fe4L7wkHFSO0xIVFxU547aEAExprrF0qlnDkN/ceyVPb137I5UXvEferQAsiNXOXahEpl
 Hv+GnAwRj2kuxUJjKCuEmk0BsPw/XhQ5uHYRTXEA+3I4rpeYWStN3dJ05pAoVbjMx+hKMLRpaqy
 WuLuI6EuWPAVpJzU0HdgxArz/kFmcw==
X-Proofpoint-GUID: fSh-oo-xdMNlbSCTAayapGoyEfN9RE1Q
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68fab2f0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=OORdEvYNKPdDRPFHMUl15A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=QKnce7zJJDl700h9doIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: fSh-oo-xdMNlbSCTAayapGoyEfN9RE1Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000

On 10/22/2025 8:43 PM, Konrad Dybcio wrote:
> On 10/17/25 7:08 PM, Akhil P Oommen wrote:
>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>
>> Add support for Adreno 612 GPU found in SM6150/QCS615 chipsets.
>> A612 falls under ADRENO_6XX_GEN1 family and is a cut down version
>> of A615 GPU.
>>
>> A612 has a new IP called Reduced Graphics Management Unit or RGMU
>> which is a small state machine which helps to toggle GX GDSC
>> (connected to CX rail) to implement IFPC feature. It doesn't support
>> any other features of a full fledged GMU like clock control, resource
>> voting to rpmh etc. So we need linux clock driver support like other
>> gmu-wrapper implementations to control gpu core clock and gpu GX gdsc.
>> This patch skips RGMU core initialization and act more like a
>> gmu-wrapper case.
>>
>> Co-developed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> @@ -350,12 +350,18 @@ static const struct a6xx_gmu_oob_bits a6xx_gmu_oob_bits[] = {
>>  /* Trigger a OOB (out of band) request to the GMU */
>>  int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
>>  {
>> +	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>> +	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>>  	int ret;
>>  	u32 val;
>>  	int request, ack;
>>  
>>  	WARN_ON_ONCE(!mutex_is_locked(&gmu->lock));
>>  
>> +	/* Skip OOB calls since RGMU is not enabled */
> 
> "RGMU doesn't handle OOB calls"

Technically RGMU can handle OOB calls. But we are not initializing rgmu.

> 
> [...]
> 
>> +int a6xx_rgmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>> +{
>> +	struct platform_device *pdev = of_find_device_by_node(node);
>> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>> +	int ret;
>> +
>> +	if (!pdev)
>> +		return -ENODEV;
>> +
>> +	gmu->dev = &pdev->dev;
>> +
>> +	ret = of_dma_configure(gmu->dev, node, true);
>> +	if (ret)
>> +		return ret;
>> +
>> +	pm_runtime_enable(gmu->dev);
>> +
>> +	/* Mark legacy for manual SPTPRAC control */
>> +	gmu->legacy = true;
>> +
>> +	/* RGMU requires clocks */
>> +	ret = devm_clk_bulk_get_all(gmu->dev, &gmu->clocks);
>> +	if (ret < 1)
>> +		return ret;
> 
> Simply add this clock detail to a6xx_gmu_wrapper_init and use _optional

Hmm. It looks like devm_clk_bulk_get_all() returns 0 if there are no
clocks. Will squash.

> 
> [...]
> 
>>  	/* Enable fault detection */
>>  	if (adreno_is_a730(adreno_gpu) ||
>> -	    adreno_is_a740_family(adreno_gpu))
>> +	    adreno_is_a740_family(adreno_gpu) || adreno_is_a612(adreno_gpu))
> 
> Sorting this would be neat

Ack

> 
> [...]
> 
>> +static int a6xx_rgmu_pm_resume(struct msm_gpu *gpu)
>> +{
>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>> +	unsigned long freq = gpu->fast_rate;
>> +	struct dev_pm_opp *opp;
>> +	int ret;
>> +
>> +	gpu->needs_hw_init = true;
>> +
>> +	trace_msm_gpu_resume(0);
>> +
>> +	opp = dev_pm_opp_find_freq_ceil(&gpu->pdev->dev, &freq);
>> +	if (IS_ERR(opp))
>> +		return PTR_ERR(opp);
>> +
>> +	dev_pm_opp_put(opp);
>> +
>> +	/* Set the core clock and bus bw, having VDD scaling in mind */
>> +	dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
>> +
>> +	pm_runtime_resume_and_get(gmu->dev);
>> +	pm_runtime_resume_and_get(gmu->gxpd);
>> +
>> +	ret = clk_bulk_prepare_enable(gmu->nr_clocks, gmu->clocks);
>> +	if (ret)
>> +		goto err_rpm_put;
>> +
>> +	ret = clk_bulk_prepare_enable(gpu->nr_clocks, gpu->grp_clks);
>> +	if (ret)
>> +		goto err_bulk_clk;
> 
> Add this as-is to a6xx_pm_resume(), nr_clocks==0 is valid, similarly
> for _suspend

The other difference is a6xx_llc_activate/deactivate(). Looks to me that
we can unconditionally add that too to a6xx_pm_resume().

-Akhil

> 
> Konrad


