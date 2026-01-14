Return-Path: <linux-arm-msm+bounces-88918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B98D1CD5B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 08:29:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33C9E303CF4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 07:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB4835FF66;
	Wed, 14 Jan 2026 07:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DlXtE8ES";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OKF375gf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09ED435FF5C
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 07:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768375684; cv=none; b=EhzjsbBpj3SOkLoZhPOcHu5SHxoZDlR8MOHt5gMUFDXQDYZcgUGejFwCTu0dYTRrlq50sAmGDQ7M6C0kAloozOAt5gkD1j1lyv8JlooJqrsx65FFyoRd5ddNRcaTZH2eAn2mzyz9xrHomhqQv6XZRuhFjJz/gsf6D75Vciu/Wvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768375684; c=relaxed/simple;
	bh=uR3IxCQuplSv7IFD1Fkh1tgHCbiSi/hk2qiPItRTYBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YrSY9CJSOPh5ZSb+Ua7PeWsJnQI+Lw/kKOb2Zuae9C+YUm/hdeCmBujDjzkZQ8lG9GFivbgVU8Yj88140aJC+6Gh7VbGM25O3REfBQz6E7yDuHKPUDNVUeyhP+SBjuDfvxRklx3MInF+pyLoG0N6DW2SeJHcTtmZLSZXfXW2TFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DlXtE8ES; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OKF375gf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E665QE2766138
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 07:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y7k2tgjAg8hmeGu+ou2mei9nPjqC+aosoSBIaKA5fY8=; b=DlXtE8EStOut9Tqq
	c6QVOvtjFtFDyKD4kg3CVxU6TGHu49ALAFtucCUicRJBunj3hpxh40abnfwalanS
	7ChVNHvpU+oZ9l+Ap2MfqeGrKttPrH9UN0UZs254Oi0YwZ4Ux5rOGltUKkFbG1Zl
	P5yAQJXUz2roItr5ZHuI97jv0fiX+4UL/ekYYZUGhyp8tT/LH5DEdqyv2ZrOXgfC
	ywAIkbnIYRqdt5QUHdLOOhh8EvQfpVy/v0/A55cgXVD6trFsmSqCUXFwPtCQl2iB
	z51RlXlXoiiydUhAsBSGyerhJ6kQlWQHB2Yc9y8tCU2YiJBRAIe1rL8y9qXykVmT
	BpJDWg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnt63tkad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 07:27:55 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81f5381d17dso2779278b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 23:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768375674; x=1768980474; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y7k2tgjAg8hmeGu+ou2mei9nPjqC+aosoSBIaKA5fY8=;
        b=OKF375gf74016HOIILvUdaEmi2wcFOi5ZZHJFWG0b1vy9Z+uTGx2hyS30nWCgGDH1U
         SoVlECzOc/w8HFxMuxMwhfhOmzQe2gbeZurWs3WlsOHNcOdamRrlaYPUr3g9QLZfCl71
         zepVh6SbTVB3QFEjsLa/A6QAAwqBQE4c7UKa4B09hpUm3XP17xWmBbFOfAxjmni4AxcF
         ElOuKhay5aH7Dg2pLxLQT3oK8FKW/dgppxeuVSCi1g6FTy93SvdnLrmNhKlUlgS0o28F
         9dEzDike8k7tLDV3HzoMKHLWSnnIdcNtWSnuvtZukSB/NrF7IVe1TewrWgmZ1nty0L/H
         Lo8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768375674; x=1768980474;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y7k2tgjAg8hmeGu+ou2mei9nPjqC+aosoSBIaKA5fY8=;
        b=neKjBGcAa/Nd72wktAzg59WlnmCJI1e5c2onDfVuDVWgePzpTUbHjdTKt3VbGNt2Gb
         E/SIjtKn20uBl7HiCHkiE86sar7FoXhg4hZlmUasV30c5EkscckBBm9aJnL8l8UVwe30
         r1Hp0SVZ/r89XLxtskOiOh6JU+PB9T7VRNObq+BUS6GWmqFZW5fOa8XKoY/eKLi+UAQj
         DeUR8NA3qRCkMLfMwhpbj2lzIPi2wFMz+O2w3tJrtiwmD9UN/OuQ2ghNyu4q8+yXrazU
         IgNJgylvE5VOLPmTXzkD1odrURPmWoCgnCQ9Yftpesny+O0tl/IKEhhV459omU/mPwpV
         Na/w==
X-Forwarded-Encrypted: i=1; AJvYcCUFsm3CHm+j0ZUGMbtFX4A6Umun7PdOK6vVakkldiFGQ607BiMMvQXCezwZHkXEwKAMP3deehjR8BMGxAOU@vger.kernel.org
X-Gm-Message-State: AOJu0YxgpawyHGje/Z3UX/mfsU3cRkHJKLkNw4WMGMeejEtgX1TJJy1S
	x0fbCY3mXS7Xj9IJ+69dRx2ZIYFmz7aCTJjpaKFr/YGCfYCIXdWkpqKuszzuRzaCHP/tgm5uqa4
	851+4MQpWRlAUj8M92JE7roonmuBSHdaW7ptgK1JMg61/MM+f0Ii0LF2JRDQGHN0h6esa
X-Gm-Gg: AY/fxX7Us2dP/KzX9MgN38pbjBxjozWwRzB7D3bXWIf8YLlJPXiCmKnja54Fd149gU8
	kJ1lbzvlt0OXxm2pBFxeRUw2efKbGiiP/GS6QhYW5RBQU3vtse4ZpZBlppPlB8181gKLt+xRpM9
	44bWj3YvxuIM6KRREU7KxwLarKAfiP3rZEqMHR0arFdapuTbWfPv0ERui4AFQZkuTgHNfDmWd6g
	ViemYeJ0U+g4kt5TD1d2DTazSb2daZqD5ZCSWR21rHLyXlFjwsQhilEy5/CLnFT6kE1ptvprb2/
	lM412LY+ZtlGkYIilj2YWlHTO4y6Pro9D0Xb4YYhdxSHKqUp3Kvd66sFtQvL5mUlCTZCUecXLc1
	jRVVIpbQSftNcJin7KndjylZIxmDHfJQUU5Xys63XsEGT
X-Received: by 2002:a05:6a00:1f12:b0:81f:52d9:5fe with SMTP id d2e1a72fcca58-81f81fa1bd9mr1478038b3a.33.1768375674450;
        Tue, 13 Jan 2026 23:27:54 -0800 (PST)
X-Received: by 2002:a05:6a00:1f12:b0:81f:52d9:5fe with SMTP id d2e1a72fcca58-81f81fa1bd9mr1478023b3a.33.1768375673926;
        Tue, 13 Jan 2026 23:27:53 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbfe1ca24sm2855229a12.12.2026.01.13.23.27.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 23:27:53 -0800 (PST)
Message-ID: <a6e15ff8-d674-de9b-3892-5db3748f3bef@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 12:57:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 06/11] media: iris: don't specify ubwc_swizzle in the
 source code
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
 <20260113-iris-ubwc-v2-6-4346a6ef07a9@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-6-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA1NyBTYWx0ZWRfXzrxBfguvG+Lz
 /ZSANi8iW62y980psqRaD0kO8ZhIeRkQ+YNqseScn6tV3aSUHi5NdsZjeBngYnlwQYKTM+sj/QW
 jXh7qN3jDpdg01/TcprUz5qlMtpNUsIVviZWBODNit/3ht8BLXpMCjDjoCREWNH4lnI3QkvGLRe
 2KJc9pJlpMGDKz5xnpGzbpHNvOkiWao5HX6tuRQEsYHo0cXZS854IBUzFnY+Rx9EAZrt/qHdRJM
 JZAToBNZwLdef3rEVw+qQVVacu1tE6+kMjKeLDSunC03nTzLl99IHlb/OT255JgYgjuAHTMKAJJ
 BhT9h1GlDXFoH1+Ihc6IFVUuo1DnqCr7ZfOzjvVgaWuECY8eDGPzjo6FSLz2mIRahBc39O4a0Pf
 3pW54Wk47rnHvU4GKvv27Acy2fS8/MjLsQJ44HR5Gms3YcmLpf+wO+t84hv+325aEOXKUI9Ttcx
 yXn46WJVGEHoFcR+isg==
X-Proofpoint-ORIG-GUID: Mfy_Sk4bThLRfIPWtViiZA_wzcmbs_9u
X-Proofpoint-GUID: Mfy_Sk4bThLRfIPWtViiZA_wzcmbs_9u
X-Authority-Analysis: v=2.4 cv=EujfbCcA c=1 sm=1 tr=0 ts=6967457b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=rBqFcrSGyHFvDjdq3-MA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140057



On 1/13/2026 10:27 PM, Dmitry Baryshkov wrote:
> The UBWC swizzle is specified both in the Iris driver and in the
> platform UBWC config. Use the platform UBWC configuration instead of
> specifying it directly in the source.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 6 +++---
>  drivers/media/platform/qcom/iris/iris_platform_common.h | 3 ---
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 3 ---
>  3 files changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> index a4e60e9d32a4..a880751107c7 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> @@ -169,7 +169,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>  				    &payload,
>  				    sizeof(u32));
>  
> -	payload = core->iris_platform_data->ubwc_config->bank_swzl_level;
> +	payload = !!(ubwc->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL1);
>  	iris_hfi_gen2_create_packet(hdr,
>  				    HFI_PROP_UBWC_BANK_SWZL_LEVEL1,
>  				    HFI_HOST_FLAGS_NONE,
> @@ -179,7 +179,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>  				    &payload,
>  				    sizeof(u32));
>  
> -	payload = core->iris_platform_data->ubwc_config->bank_swz2_level;
> +	payload = !!(ubwc->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
>  	iris_hfi_gen2_create_packet(hdr,
>  				    HFI_PROP_UBWC_BANK_SWZL_LEVEL2,
>  				    HFI_HOST_FLAGS_NONE,
> @@ -189,7 +189,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>  				    &payload,
>  				    sizeof(u32));
>  
> -	payload = core->iris_platform_data->ubwc_config->bank_swz3_level;
> +	payload = !!(ubwc->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL3);
>  	iris_hfi_gen2_create_packet(hdr,
>  				    HFI_PROP_UBWC_BANK_SWZL_LEVEL3,
>  				    HFI_HOST_FLAGS_NONE,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 8421711dbe60..9f9ee67e4732 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -73,9 +73,6 @@ struct tz_cp_config {
>  
>  struct ubwc_config_data {
>  	u32	max_channels;
> -	u32	bank_swzl_level;
> -	u32	bank_swz2_level;
> -	u32	bank_swz3_level;
>  	u32	bank_spreading;
>  };
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 5ae996d19ffd..0f06066d814a 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -633,9 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
>  
>  static struct ubwc_config_data ubwc_config_sm8550 = {
>  	.max_channels = 8,
> -	.bank_swzl_level = 0,
> -	.bank_swz2_level = 1,
> -	.bank_swz3_level = 1,
>  	.bank_spreading = 1,
>  };
>  
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

