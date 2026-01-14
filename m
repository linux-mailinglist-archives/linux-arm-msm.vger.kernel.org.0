Return-Path: <linux-arm-msm+bounces-88921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE0ED1CDD0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 08:35:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9A601300092B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 07:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 664AC342C8E;
	Wed, 14 Jan 2026 07:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mOUvy5u8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hlF55g/l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BBA37A48D
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 07:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768376124; cv=none; b=pawFIMHANXU9Ctlp+CeXMdVn/ZFjxCkroNIA5TRWKL+kG3KD/DGhzCNahzBBQvJe5YzN0S9A99wFq/NMEO0ROSht5L/4EYRTFzvmx8+7OFiOlkgnXBCbzQfmsC3Uq6EGhxdjWKIZKrKe3bMHznOFqRNVR3I3YHDGa7ENAJhXvlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768376124; c=relaxed/simple;
	bh=yAuabqmFq7pOIxAYeRLZ6jzDcEaGEYutHfOcs1I2snc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VNaYCNK+iTT16vlCtLFQHumhMVgwcFbrb6hUAF/YnRgL3UGjGGkJ5CxjXdBf9k/fV3cI6Dz4m0PnfZ4S2lqsxACp+j9AbIHanZMEAhEbGBnDeomQLfQoRPFXCGZvIqnttKMJ62tnBhbN7l1DsjBHaPo3bt1kFVVTeTWfr7ENuUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mOUvy5u8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hlF55g/l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E660aE3059383
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 07:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AGfARA3z8BONDY/2WKAVdBuRhb+NP2USjZMkAP5TPRI=; b=mOUvy5u8heDw6tUK
	WaCC5X1PgxI1b21NvrdkW+7V87Yabu9iN3s7zGRj9imEPhrZ/V3TAEBXe1tIls3J
	YOv4GzrAlv7a3PcaCcTINM1O2PqxEiM1pxlk6JfkQS1bmkT8cCbPfkZKMjKf5WJO
	JGcagbhXal0yS14ltDvbraqmpslE/MpaDtdCqlrY6Il6kM6LGQJK3pRNPS9YKyuA
	6P9z8VPor9F2KtCY8Iy6yHGQPlFj+OK8cx4Ez1WGfzPKY5vDsSuzehx/pQ37Q16g
	fCs7S3tQVEnq0m1kazfHpM7WrumT2jcASEMc9sdxkniofVJObsZaHNbvsi6Ggye3
	F+hS6A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bns8v2s5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 07:35:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a09845b7faso62764875ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 23:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768376114; x=1768980914; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AGfARA3z8BONDY/2WKAVdBuRhb+NP2USjZMkAP5TPRI=;
        b=hlF55g/lZoos8b4u8lxJtKjti5nBIcVpSGv2Ld5zP0Qrt+rmhq6kCCXIUkrcvK+eUc
         SJLF4OzAYPOn5okaypVXUydyTo0EyUW3UefmitsXQ14Ht5jRqgKHATWKfDv4Nl1qu/cM
         HyqUlmvkML95vZqQvSQKEojbjCq/RB55YAx56lW+FjNFkKlN5GLFm1h67sPwk6Vqim8U
         +s/riWNZA0wKie9dhr+vYIXfbWSs6tYEouUpJjGc5XdGXeMcAIbUKYwyXVqAwfDVfwTO
         dFImJsHi7E5mD4CNDLei99y6igm7XZw19/lKSTn2SYArf7gchdp4zQMLf5y4K5b8y9G2
         zFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768376114; x=1768980914;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AGfARA3z8BONDY/2WKAVdBuRhb+NP2USjZMkAP5TPRI=;
        b=qUTd4CMN7jVmddMn4gioxH+gOgBPv98lsakGdtq9/RgreswzD4XNU39qSElZNlJMDl
         qAPbcS6EEe+V7mqvQVd4EpjcbXRk8NJ07SIh8xSY1uf107JBfc2XCdJuqxJaBfF4rkhq
         kb8Mx9ZjKEDIjKsazDlUXnI0Fa8fEd+tCPtl6TMJsOQX2fzBWwZxjmN6ktxvO0uU6YBx
         OjPvCufRyeFKHZhA1px4YImIWNBdqMbwjdRpjMPWsQDxjZ8Lm5FFa+30gYpK/5VsMAjb
         47FtWBR5RRSk+s5b6LDcq1+vwgnZgW9/N45Un3NqI+VK5Juv1+Z65NXKCRjBLdheAOWa
         LdMQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+tgG4EdXMn1Axgs1fzQpW7LH5xhiEIjMx+1bA98LBm+YlZZTmkJVsvuMPRbwMG5Mt2wCyvYHeiPxnC80I@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4d5XujEI5j620gezzK0LCGwtughbVHtFBLxtc16wZ1LYXJ3r8
	y7Y9Y0H9k22RY9VKGlbfqhs5iJhForQQjif2N+qzZmtuFygkNrKi0Ojq4kl+tVZMTsufNcp2ioS
	x/rWIDxrfUdDprvKzaYbUCg/4dzmDPWlGO/Ha1OGnbwDPfBpie7M3O26BZrn7hEr5cBDY
X-Gm-Gg: AY/fxX5WVlLylfZw5UTGzxE5TLxCg9byZ1a2x3EdfRxDwYxhDUbsBue38LjkjFC+mEF
	yZlezi6eNvUAgqcCCl1YVlnxWfk59gGniE28cALmbgZKsPXvRAKoxglkUwNA6GrL8t/kszW20Vk
	25tXkI3FiwmuQ9BkTsklaU7f1pduw4V0WniOFxUwGL/5rUDv/R2MFAYkEn7FX9ccIlQ2zYW5uu5
	FrwVAwBNMMwUWBk4NXs+OPnJgR7aQkuplTX5dWelKsqq1OdlXGCjgH+dwHJs3F2Jt22OmHP9acp
	kgSQxVtJZS0jZLEh2jk3ACbk1er0WT7wDcPBiYW5a9/4emc9mcIAHVTZYcn60KClaotyQjTdVIF
	QygpkAzx8uyNXKvmpKVg5AcCkv9LK/xVT+cANbNr392lX
X-Received: by 2002:a17:903:1510:b0:2a1:3ee3:c6ae with SMTP id d9443c01a7336-2a599e697e0mr21455305ad.59.1768376114014;
        Tue, 13 Jan 2026 23:35:14 -0800 (PST)
X-Received: by 2002:a17:903:1510:b0:2a1:3ee3:c6ae with SMTP id d9443c01a7336-2a599e697e0mr21454945ad.59.1768376113468;
        Tue, 13 Jan 2026 23:35:13 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd2b3asm216764535ad.88.2026.01.13.23.35.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 23:35:13 -0800 (PST)
Message-ID: <66f99363-046c-85fa-0cf2-05f45755532b@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 13:05:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 09/11] media: iris: drop remnants of UBWC configuration
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
 <20260113-iris-ubwc-v2-9-4346a6ef07a9@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-9-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aY5sXBot c=1 sm=1 tr=0 ts=69674733 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=mgZWc8mK_52uscwXSFwA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 6ZNK4rZGAFcPe79NB1cILsGwOBFRvJx5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA1OSBTYWx0ZWRfX2M3zdB4hz047
 Nrtv9Hthe3piH0NcCvUgE3uX3S5lrE8WXCE7PbStNuYyfjFb66i3EdsgE6AR9F0ANU4s/3cyQIN
 /EFTwu8wMf9+frzwkNbupHxxSeXr3wKQf9waVhtcQxoB6/tbCO6KepDt86gZXwdMWXiWXrTTgzX
 3Y7ekrIGMSoPqUm6QYRkUX6jlZgYL/DCHg4NWAHtkQNBFp3C43F2KL60fRL3XE3NqNiwximI8Io
 SjICtV63i42hhBziHS5fRmeeyhQZ6JkW4VdDu1aoEXWbT4tkuVdW1+NPHiIWCfxsyYrBWZeL4Oy
 ztychn9k1AdQNC+nQQDgZmKBdvfdF4ebAkvQMkAOQdGdaHkDM4GWTY/7W9LaC1Ed7B34Wpe02uw
 EwopsXsoH01rsB7LyGDx5K8aL5SnTGmWWV+wMyc+rRFU9sfUnREfuZ9eJqE4rD1/S27WwchMsUR
 Sqajr0nX9AZ1oHJia2w==
X-Proofpoint-GUID: 6ZNK4rZGAFcPe79NB1cILsGwOBFRvJx5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140059



On 1/13/2026 10:27 PM, Dmitry Baryshkov wrote:
> Now as all UBWC configuration bits were migrated to be used or derived
> from the global UBWC platform-specific data, drop the unused struct and
> field definitions.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_platform_common.h | 4 ----
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 7 -------
>  2 files changed, 11 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 4abaf4615cea..3b0e9e3cfecb 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -71,9 +71,6 @@ struct tz_cp_config {
>  	u32 cp_nonpixel_size;
>  };
>  
> -struct ubwc_config_data {
> -};
> -
>  struct platform_inst_caps {
>  	u32 min_frame_width;
>  	u32 max_frame_width;
> @@ -218,7 +215,6 @@ struct iris_platform_data {
>  	struct tz_cp_config *tz_cp_config_data;
>  	u32 core_arch;
>  	u32 hw_response_timeout;
> -	struct ubwc_config_data *ubwc_config;
>  	u32 num_vpp_pipe;
>  	bool no_aon;
>  	u32 max_session_count;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index e78cda7e307d..5c4f108c14a2 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -631,9 +631,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
>  	{IRIS_HW_CLK,   "vcodec0_core" },
>  };
>  
> -static struct ubwc_config_data ubwc_config_sm8550 = {
> -};
> -
>  static struct tz_cp_config tz_cp_config_sm8550 = {
>  	.cp_start = 0,
>  	.cp_size = 0x25800000,
> @@ -760,7 +757,6 @@ const struct iris_platform_data sm8550_data = {
>  	.tz_cp_config_data = &tz_cp_config_sm8550,
>  	.core_arch = VIDEO_ARCH_LX,
>  	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> -	.ubwc_config = &ubwc_config_sm8550,
>  	.num_vpp_pipe = 4,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K * 2,
> @@ -852,7 +848,6 @@ const struct iris_platform_data sm8650_data = {
>  	.tz_cp_config_data = &tz_cp_config_sm8550,
>  	.core_arch = VIDEO_ARCH_LX,
>  	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> -	.ubwc_config = &ubwc_config_sm8550,
>  	.num_vpp_pipe = 4,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K * 2,
> @@ -934,7 +929,6 @@ const struct iris_platform_data sm8750_data = {
>  	.tz_cp_config_data = &tz_cp_config_sm8550,
>  	.core_arch = VIDEO_ARCH_LX,
>  	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> -	.ubwc_config = &ubwc_config_sm8550,
>  	.num_vpp_pipe = 4,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K * 2,
> @@ -1020,7 +1014,6 @@ const struct iris_platform_data qcs8300_data = {
>  	.tz_cp_config_data = &tz_cp_config_sm8550,
>  	.core_arch = VIDEO_ARCH_LX,
>  	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> -	.ubwc_config = &ubwc_config_sm8550,
>  	.num_vpp_pipe = 2,
>  	.max_session_count = 16,
>  	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

