Return-Path: <linux-arm-msm+bounces-66593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D12B10DBC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 16:36:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C60A188A7A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 14:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC1042E543E;
	Thu, 24 Jul 2025 14:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nKqqmxhd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312552BD58A
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 14:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753367762; cv=none; b=NdOLE519UjrDXd7q3SPBaLchK8P3et7LS0yuY9Ha+NrsO/dIOUFSJ5WI6acMh4xEw0Bep1+W9Zj5yjIrNiMdfBWC9b20247QkZigOjdIA5PNmj4D+9D+a89LEf5VkfLARj522FRVrYQlQ5Krj2eoRzPrYLk7i/9l8SHLRQT1T2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753367762; c=relaxed/simple;
	bh=dfJiQYzRwSlcnWAUOhPPgJKtd/pmTmlGFzYmp6BeV/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oZdogVYb/EhhBWLWUcjNSzih7cRu95JoIpJdPrq1LfC/jumkkh1571ZWZoYaFBOsCnrtezw7CnZJY+Q7O1JohzdAZqh9gL3AL/UkpVLpRLfwgRZBEFJ9FGNHNGrqeXZOBHgMWtw63EY8B5vZALuFUcILe16n/KVm2v6mShR2ok0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nKqqmxhd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9gK5p012566
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 14:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GJP5OrXYtaNIwr5c3QE7nQS8J5flRoXRt0htwVVshBo=; b=nKqqmxhdhfF6hIJl
	JlHtcuALY42H9cVgkN6/8wF1vLCv07fNq1T9kyur2pJBO1u+51WxEHVhzwD5Sy6s
	aeN7gXGM1t+h+ZEy4BoiLJMyWWdP3XEfUiUZrZXTBImWC7M62ZigRDh7bVq/fCkT
	CZlk/h8ggAd3NXqsY8kxC7Ceg/Ab7ZNtqzKXOTnNt4dn3NVSEFbSP/DO41BZnvEy
	2TET/tNm7pCgwYn1hqYYyNO8RXYoVpOMPJylEsQhrkUe2Wb5Z+zxL3urkZ8VSQfL
	HOhq3Gtegu4wXHwZ+hFdmEUaOQWh6LjCJfrJIlXL0Tf1ThQ9Qm6oG6z+BePA4bXh
	7Yphqg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3hy2jh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 14:35:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-75494e5417bso1208166b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 07:35:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753367759; x=1753972559;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GJP5OrXYtaNIwr5c3QE7nQS8J5flRoXRt0htwVVshBo=;
        b=pxrU+xgbSQCgraIe0GDWlvdic4MNTzMIVJwt8XOXPHesLbArGVn8X4kpOzIL4ciB5F
         JJAstMN2VaNByCWFWVx+sZpnPNHQD0VBlvWDR+oghBuD0pnW4kdA5vMXk5I+XwRvc/k8
         HU63z9Na6nKOig/hSNeFC8ggTyLs6cnrm+avry95Wsvaq0jiTHW+lfSegbVFAYXNsIQK
         JI4msJVFcRuhcFjKFnHR36YaLsZ4K4/x+OfO/B89iqImQlWz8pJSgqQr4SFkNFTKb6+3
         SJ0QGTqOieSN7smxP6kRhdpYCCymqZikN88j+UXIINZwgvvPceNTf2h6EvAHGsEee88d
         WeNg==
X-Gm-Message-State: AOJu0Yxaf7prmXDmFakPkYqTE3fk80wN4mf6HJ2Q138oQsmFplIjyTTr
	V3Z51lkeUULqYJ6iUsOzJcqck/ZKFbIy8Jiu85VxYavvw/s21VKlf0c1sT8szegFh7j22BylhUm
	kcMCeotWp9ZrY8fYOPrRSFcjurtTjXClg8/ydJQqEl+1vcRQNncOY2dQTsbQA5F1am/5o
X-Gm-Gg: ASbGnctP9XSg0xK7nZyfMlPAFXkLSNGARXvKaYH2WY3SU+HqDanIdrHt9YIb23v60qe
	3YYeG3UPfmnVAavSn5OesJoY8kp1+wWwajTyUx22DeWIS96PeK2V/EttlBzec2skQm2KcZe5x0c
	/FczEgwZU/D9vqKkXooa9dYVd3kQ92g98qrKzR6EpjExq5KvqCvEI7TX4xyPgdYM+ChURSHx6IU
	c1LWmMGANpprsGqqk8ud7SzPi0HQ3kZv9rxvnPrC/wnT3wO14vKp0c4I3FWvYQCYCEthRL+5mt4
	UYBVatSjf1NwjMERqVjNFdWvUOu2k4WSAoM/PCUnHx0oqG1M2wB6TQK/tJmeng==
X-Received: by 2002:a05:6a00:8b8c:b0:736:4c3d:2cba with SMTP id d2e1a72fcca58-761f0aae747mr2193782b3a.9.1753367758723;
        Thu, 24 Jul 2025 07:35:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErsxD0US8xYnn5Y59yyRl45GxrphsiOAnuwC/zARlLpy5inA5mS3Yzry3LPCBjaE+Q2UR4zA==
X-Received: by 2002:a05:6a00:8b8c:b0:736:4c3d:2cba with SMTP id d2e1a72fcca58-761f0aae747mr2193469b3a.9.1753367752353;
        Thu, 24 Jul 2025 07:35:52 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761ab41dfe0sm1775131b3a.0.2025.07.24.07.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 07:35:52 -0700 (PDT)
Message-ID: <ac476949-d0e7-4058-ad76-c3cc45691092@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 20:05:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250721-topic-x1e80100-gpu-bwvote-v1-1-946619b0f73a@linaro.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250721-topic-x1e80100-gpu-bwvote-v1-1-946619b0f73a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=688244cf cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=pSIa2sKh8ADkebnh61Ypzg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=1B6o04Z4kyHWbw-D5gsA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDExMCBTYWx0ZWRfX0faxZ/wbngAO
 wNQOp6MC5b7Q5dho5r7OXSva/JTph5HtVhpSwfHyH/iWBTPzEwVEJQzzD34x+PrauvMKF0SMvFo
 zmMTmk44d+/jzibsedctr2kDsoVgUl28Mpey5AnW5zCCp8Q5yFrFOdpNsdtumb2hI0nG0Z6y5kb
 gl52l+0InD9MBE1QiAZVANzj/cYiSDS+jI4HjvHQPmyoI8K4ds0gE7ufUTht+fpzuUxIrHBUjnb
 oonRePkgBGGRtwt9dgLu6o5gDa/2kxAMqhOCXhclGpj+iqfcUkAyn9LIwIr9zkPdBsNoMrcenFM
 aVTvzeiOLPAyShnS6zkNV2QN8yq0rE2M8dVKqQFuC6hSmRFCnR+rPUpmLfmuOh4LDKHRHxNWhgb
 iN0S2H7XQdzDfbsOLjYZRSQkGMZt3in6vNYlIPOGKdP0WllZG7pYqXIj1LwFO49WSq9mNIM4
X-Proofpoint-GUID: my1nSXoDRaN8ZMTLqFPJg9x7LSJyE03C
X-Proofpoint-ORIG-GUID: my1nSXoDRaN8ZMTLqFPJg9x7LSJyE03C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240110

On 7/21/2025 6:05 PM, Neil Armstrong wrote:
> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
> the Frequency and Power Domain level, but by default we leave the
> OPP core scale the interconnect ddr path.
> 
> Declare the Bus Control Modules (BCMs) and the corresponding parameters
> in the GPU info struct to allow the GMU to vote for the bandwidth.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..b313505e665ba50e46f2c2b7c34925b929a94c31 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
>  			.pwrup_reglist = &a7xx_pwrup_reglist,
>  			.gmu_chipid = 0x7050001,
>  			.gmu_cgc_mode = 0x00020202,
> +			.bcms = (const struct a6xx_bcm[]) {
> +				{ .name = "SH0", .buswidth = 16 },
> +				{ .name = "MC0", .buswidth = 4 },
> +				{
> +					.name = "ACV",
> +					.fixed = true,
> +					.perfmode = BIT(2),
> +					.perfmode_bw = 10687500,

This configurations should be similar to X1-45.

-Akhil

> +				},
> +				{ /* sentinel */ },
> +			},
>  		},
>  		.preempt_record_size = 4192 * SZ_1K,
>  		.speedbins = ADRENO_SPEEDBINS(
> 
> ---
> base-commit: 97987520025658f30bb787a99ffbd9bbff9ffc9d
> change-id: 20250721-topic-x1e80100-gpu-bwvote-9fc4690fe5e3
> 
> Best regards,


