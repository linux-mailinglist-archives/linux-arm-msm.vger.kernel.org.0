Return-Path: <linux-arm-msm+bounces-44589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96631A0784D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 14:57:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 204C43A7ACF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 13:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08203219A73;
	Thu,  9 Jan 2025 13:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+Jrucou"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40973218AA8
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 13:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736431063; cv=none; b=qZzOno+ch3gz42n9iyaptzXFPwFh3CoqHdyBTZs4CHjnmlF4pad3G/d21reGnCXsNMpRCYpBWuPU6mDzO/gIKEkex+1NDoI8ti7zMSGsD8m9DxmklTK8HYX3SVqRtCSVqIohmGvxEyJea97ovVTrkPXTOOQEaw2ix+HtRG51LpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736431063; c=relaxed/simple;
	bh=bSf7dIZlDqFalGEhdvDUvV5XX/SbSYGVS+et2u2KpYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kzSRJzSK6Yv6gXKffGQznJ4R/QhXhc6l/TWZjnW/Lm4Y6DqTWNPuJc61EQCBs8CeoxQBaghuy/y7YrJI/ufCaCuH9tfk0+H8KRJHrR7GzhsbkRIchi5wKaRf7+yUr4Fk9gstecFEa0Jjap1RCyciIye9U9oqIOjr+HufDogltus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O+Jrucou; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509BdDnx001612
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jan 2025 13:57:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JF0AHoOXM/Omt1W9DsxEmuSnjvh5YmVttxjnDNqIHSw=; b=O+Jrucou7GQu6Gk8
	mvpM9O/P0I3Sbm5plAmC7W03BZ1Gauf7CMtg0qxbezqhR5tcGQCkpc+fMCcX3fVW
	4i8m+zkaJML/2nY4S6q0DS+QVzeEJowQ4gpWETycY3wpKmD6rYekopUif8T/cQY3
	Er6F9Tck6BoHpM8BCQ3EpJ6RgSGuOqmin3KezBzJ7T0dRwb3313khvtHcGBJd/Bn
	fofgLlZs86NQb3hjMr9rMHt4nY2BUycz5Df/KCfJdHCrFVVUIezdcGIYix3XZ2Je
	MFUxVyTBaQCPAZI+4420D3gDLh70kI41KJL6vU0Jc1ZZuiUSKMgTQeeoX+JUw0af
	mt+pvA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442drwraf3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 13:57:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b6ee03d7d9so17808885a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 05:57:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736431060; x=1737035860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JF0AHoOXM/Omt1W9DsxEmuSnjvh5YmVttxjnDNqIHSw=;
        b=RFUT6l40azTeJokUOSzANOm6uzbkXf3MsjpEj+WoZtDWH2dndmf8a3tHuoOzrddmDl
         D3K08yLPpA00eAoJksnVL4s1X41nla0PxSTaKoZ3Kz9bmpmEIBATVhufIBR2ylnamA/P
         JBqccydnBV+7dhRy9JInXQnTCYxbX+/OnsB0/RpObNAMO81meAYkuYWidGhjFza1ewb1
         Z22qQOH2r0xjMaQoAgvZRwIACXmyLDKbiImS6Xx0lfvp/mFc3mNqbezj6LjMCI2cSNjL
         bs3V4QHtKAw6ga+TPHzzBCJS+XPdimZ5cvYK1UbMCH+5Y7eZusjzFC+wLdZVu4HJyCu0
         YMPA==
X-Gm-Message-State: AOJu0YwQbmI/+q3SswxJ/Tl2DWf/lc9cNQMTUga3y1g+DWuuGT5A+MMb
	s6jvh4sjLbrQ7dxjw5+jX6/FyNrgdEp8Fd46gPlS3FBpKONdv0Er8zsIKehu8dC+BzNMWAW0e41
	Bkj9UrO7jZBmBpCdyyHys/B8pIKHoJqww7SzZn/EEW//BYSEJrSBr7tjOMIJVYIjl
X-Gm-Gg: ASbGncss5NP9yYiuNLFeg/y0Uw/bF6jI7Mw7M6X/T/j8rrWT/ilU631Y/IwvVJ5Ar0Z
	t5FltUoQHqdxhv3cFLLp+z7tu4T3DK0tuybfKkaTmaItatAnM1IH76hzHqVh1FcTYzeG5tx3wPE
	ACCclvt2GZv3aw30alYC5qLN/TM3xu6BrxLSWOzNjwTa+OSvHE/CrR/gIEhOOHK2/j1GxTr2Efy
	Vh7VJeWXkfq0rsmL+Mbp5OVQZdTJ+8gy+r94A5YtWm0yHi5oQK5uhpMD60cgIRzS54kYJmubngj
	5PIZhLbtj0jtmaaBXrmY7Fxxdpr8FPfAmiw=
X-Received: by 2002:a05:620a:40c1:b0:7b6:dc4e:44a5 with SMTP id af79cd13be357-7bcd973a062mr387280285a.5.1736431060061;
        Thu, 09 Jan 2025 05:57:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvEFQOSMjPEdcmaa6JUHa/5+PkuCwquAgHnceMKaOpZSDG8+5Zh8OYxiwJczUZrYpLlO5jQA==
X-Received: by 2002:a05:620a:40c1:b0:7b6:dc4e:44a5 with SMTP id af79cd13be357-7bcd973a062mr387278285a.5.1736431059674;
        Thu, 09 Jan 2025 05:57:39 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99008c3b5sm641951a12.12.2025.01.09.05.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 05:57:39 -0800 (PST)
Message-ID: <356986fa-e66c-4e78-ab92-2593b037ab9a@oss.qualcomm.com>
Date: Thu, 9 Jan 2025 14:57:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/4] drm/msm/adreno: Add speedbin support for X1-85
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250109-x1e-speedbin-b4-v1-0-009e812b7f2a@quicinc.com>
 <20250109-x1e-speedbin-b4-v1-1-009e812b7f2a@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250109-x1e-speedbin-b4-v1-1-009e812b7f2a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vUXxWJEgJYaOnwwaYGTeA4HvkYNudmJw
X-Proofpoint-GUID: vUXxWJEgJYaOnwwaYGTeA4HvkYNudmJw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 impostorscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090112

On 8.01.2025 11:42 PM, Akhil P Oommen wrote:
> Adreno X1-85 has an additional bit which is at a non-contiguous
> location in qfprom. Add support for this new "hi" bit along with
> the speedbin mappings.
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  5 +++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c   | 15 ++++++++++++++-
>  2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 0c560e84ad5a53bb4e8a49ba4e153ce9cf33f7ae..e2261f50aabc6a2f931d810f3637dfdba5695f43 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1412,6 +1412,11 @@ static const struct adreno_info a7xx_gpus[] = {
>  			.gmu_cgc_mode = 0x00020202,
>  		},
>  		.address_space_size = SZ_256G,
> +		.speedbins = ADRENO_SPEEDBINS(
> +			{ 0,   0 },
> +			{ 263, 1 },
> +			{ 315, 0 },
> +		),
>  		.preempt_record_size = 4192 * SZ_1K,
>  	}, {
>  		.chip_ids = ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 75f5367e73caace4648491b041f80b7c4d26bf89..7b31379eff444cf3f8ed0dcfd23c14920c13ee9d 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -1078,7 +1078,20 @@ void adreno_gpu_ocmem_cleanup(struct adreno_ocmem *adreno_ocmem)
>  
>  int adreno_read_speedbin(struct device *dev, u32 *speedbin)
>  {
> -	return nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
> +	u32 hi_bits = 0;
> +	int ret;
> +
> +	ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
> +	if (ret)
> +		return ret;
> +
> +	/* Some chipsets have MSB bits (BIT(8) and above) at a non-contiguous location */
> +	ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin_hi", &hi_bits);
> +	if (ret != -ENOENT)
> +		return ret;
> +
> +	*speedbin |= (hi_bits << 8);

Now that we're overwriting speedbin, we should probably have some checks in
order to make sure somebody passing a too-wide cell to one of these won't
result in cripplingly-untraceable value corruption

I guess we could just introduce nvmem_cell_read_variable_le_u8() and call it
a day?

Konrad

