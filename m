Return-Path: <linux-arm-msm+bounces-83425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 03427C890BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 10:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 894B43534A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 09:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AEFB323406;
	Wed, 26 Nov 2025 09:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="irfa7EDE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TyKnFnZp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADA2320A38
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150152; cv=none; b=YthsLOpNjXq3ElsEOrrsuSCOGPVi5pxdQeRmT15Gh9C50GHdy9EVlJnQ4ipYNzgc+GWpJrcSr3+dhI1JxPlTE+VpESFUbOYjlTlCjQUuwN+BJT4HZxXuCqBskxtLCIyo0rfMSvMyC1FbH4WZNwU0oKXk3u6FuezwgYvVFLOYQ9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150152; c=relaxed/simple;
	bh=YaOagR45wJEvzlU29fW0E8OsFsmOfRK5RTpmwuu7CRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PyQvaMY1/9xSN5oHJ+vsGOASVVx6mAuAVSCSjzvnjLcIA4eTg4ErU5BJNCu5mgw8LFHVBOE9K6i8FPkTHgAN1nPWTXeb4fujkjtdiT0+U3+9EG+c//W4B27X+xg2d5mZ/qpZqrQ2NCIERNoHC1pupqCvu8e6TCAfHH4Qo22Wo3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=irfa7EDE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TyKnFnZp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ2XdqS3706875
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A+vmaDrJ8wMl9VN3U7D8mZ8OuOHVZwepwJLL1teAkn4=; b=irfa7EDEGiRCiGud
	5Vm5ucWvpTDGwUrARV+0YuhEhd/bXObwUtacPPvvZBJjsaJEo0MGutzKmv2OMvu8
	HvWUjScfa8k+pJhfHzkp5eBTL353gpXLW6KOupp45QsC4d7OpFlAWS56Ru1vAeyH
	tgnahxlTZQleS/CLXPX7aCjMsC2QfQEIQ4ipSMdrgLTJIJLXBsLUHMoC+3FS3Uk2
	SOBJUanpyAXaiZ1tZiVk3gNp70GR0E+itx7blnex2xVOBf6oZQTHm+WP79IJNfpj
	O9AtMfLUruAwg214PbOFGO/PBM7RNDs5VEphLXlWjlglcQAcCX+gHReG7XhYTVa0
	NSv94g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anduftxf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:42:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b952a966d7so13336947b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 01:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764150147; x=1764754947; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A+vmaDrJ8wMl9VN3U7D8mZ8OuOHVZwepwJLL1teAkn4=;
        b=TyKnFnZpRQjB57M7X/5b8lv5QHk6LUKyo5+pVF0E0/GFlSvM/wKTS7Q/o+G62/SYvW
         16LjNeYburpv2p7gUuQ9i3bMA90BfdJAKKOI+2e5QihAsoyvsqG1am0G5sbEkoXlfOW/
         WPQTLeKg2FNo/OZuCYKlafcNxiPVBJ9B0F4GvFQXj77W+jF74jNKJo3Qowqg9NrrMsn1
         4DI2MZDnmnqCGNUefCU7tQfrWfZ0T83TvkzKNmmpwH6pvd4CGiV+JcCL9wXyoYZXFiAP
         ppyLjKXiHnjBj3dAqMxX2uu5AmpLo4uCBy5G2NRpLBKFKsxnECQ5j1Zz0MpURE2MevCA
         pUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764150147; x=1764754947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A+vmaDrJ8wMl9VN3U7D8mZ8OuOHVZwepwJLL1teAkn4=;
        b=Y2K6bYtB+kEw6Rct04G9D3BSYV4p0r5645AR1Us32gAQkQi9VUFsAIfkrTpO4YWK2h
         iqrvw0Ue2sf9ekXl2rfni7Es3CG2uxzLviHTsm51DsGZV7vTc992anHq7IydbNwNaz6r
         mVo5+NxFock3D8xGczilB2IKkWWqELGMToHqsztz9Ifd0jPu4iieqMEh6sMHGJBkCd8i
         RWSOtdjP/qbSp9/VnSqqZrbJqpkHsy3GqgYgHGIoQ91xAYZlMzQWBwXoHvYRbfb6wD+c
         PusomqOptjsdSihrgdny1pNdMeOB5BA2CTZf4EWJsKPZK/cr/rnIfVf0UewqYTvAWBqP
         KHGA==
X-Forwarded-Encrypted: i=1; AJvYcCVze1oC0FZ2da5MItJZhnPpCXPehBz3rCcSGcrk7DSVqK8tmdsd7xX9U0sMaYE7yYhrR8H7zOtnXN1XlAw8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw714ahV+rMlBKR97Sscadt605MIep63dLpkLwuC4vJwgi70QKm
	jSm2V2gRy2niJo9IkZfZqgNLh5BgOzyXG/mHDXmMVs3HxsjPZVexzcbYX7pGjezGU/u+bntlp0V
	+TaDxWMTRNVzZmr9gdIUAcwSghH8xu9Hr/YVS+b0p2FD8+SO1uGIWyaRtwU5nEHb/KCv+
X-Gm-Gg: ASbGncvN2wcV6k4jhPwbPdRRFzM2unFbdyfy/t7ZBBN7of2b7Az/A3SAqt6i8uolgwB
	UpH1GgxNCo3ubOlOftPmmeh3ZQ8fVgeUCrJPVhePcEuSuC05WCDLh9xNhlxjvsOwL9FpdzuNL+C
	cs7GnavuYJErmd5Sbb+xbeEYI/8nfIKpzUD/Uk9kkRDo8S2uiCSd5F6cIao6kMHGXCy3FucUy74
	m51Sb5KZtIDwUwfy4d/P9lTBVx/+jyp1nmwfAdhcNZq5MH3T+5jcqtHetK8U+vZSwSfjr8ctx/C
	n1zJrj96y4w/1EN0CO4U/KfUV6a+oi1+xp4BbAI6aYvkYCODkSl7N11C5ZUT9LCKtho5PwycDlR
	HqrsGDcoRDqSLijQt1NpOo1QRV/1v5cVe/b1pAA==
X-Received: by 2002:a05:6a00:2e82:b0:7aa:9723:3217 with SMTP id d2e1a72fcca58-7c58e40f6dcmr17360443b3a.25.1764150147488;
        Wed, 26 Nov 2025 01:42:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGr5zUDSSGpqPXRi6ejp/L1iEUkIdgvCyK4NLiuUnUALMP9mDPHoJdhB8kUj1RkbTTmBrVpAA==
X-Received: by 2002:a05:6a00:2e82:b0:7aa:9723:3217 with SMTP id d2e1a72fcca58-7c58e40f6dcmr17360420b3a.25.1764150146969;
        Wed, 26 Nov 2025 01:42:26 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed37ab3fsm21135122b3a.22.2025.11.26.01.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 01:42:26 -0800 (PST)
Message-ID: <ebef3ac5-6c7f-473b-b830-be37d376d8b3@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 15:12:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] clk: qcom: gcc-sm8450: Update the SDCC RCGs to use
 shared_floor_ops
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera
 <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
 <20251126-sdcc_shared_floor_ops-v1-1-9038430dfed4@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20251126-sdcc_shared_floor_ops-v1-1-9038430dfed4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C53kCAP+ c=1 sm=1 tr=0 ts=6926cb85 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7HKD0IT6kqf3lY0ElOQA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3OSBTYWx0ZWRfX0y+iZRhjrBAI
 EKwncGn51RC1+yTerrHPqkAFqxPq+5VRhpCEyhiqkvP0ONjTRETmC/6CzdJspYWtNTtqj7K+SVv
 34GMqaDivMyiNXOwdQHE9YvSNSarxzv5IfUmBjsXPXXeMmFzs8trNVOTBO1CJwMW2UVCjEcYC3h
 5ZJf6VdmVA230N3qI89EF299whCcQhvBdzuQ0/XKZACCAhhoe92afISprCMDG8FPUou0gOqLuc2
 2bOntTYH2SykWb4giQSEI4PM7R4b5QSi2bK51la1/OUJIjwEoCiTn5NR4p0duRwxXG/aXBEyjuL
 MiDTgJpu2XUfLmBPCAhvkqPORvZLei7BdkCF2VoeSEmre4u9+2D5qV7vtlEL5db48Zozx+DVlus
 lnKd2wAeIbt5UasBK2gYY34wA/Hkyw==
X-Proofpoint-ORIG-GUID: _dc-8B_UrjOSUUDcZNHxF4L13bQO2qXa
X-Proofpoint-GUID: _dc-8B_UrjOSUUDcZNHxF4L13bQO2qXa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260079



On 11/26/2025 9:45 AM, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
> during disable and the new parent configuration is programmed in
> hardware only when the new parent is enabled, avoiding cases where
> the RCG configuration fails to update.
> 
> Fixes: a27ac3806b0a ("clk: qcom: gcc-sm8450: Use floor ops for SDCC RCGs")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-sm8450.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
> index 65d7d52bce034335707014797fe9002429212a14..b18bb34889ab28fba13cbf2ca8cf83101e4e0484 100644
> --- a/drivers/clk/qcom/gcc-sm8450.c
> +++ b/drivers/clk/qcom/gcc-sm8450.c
> @@ -1034,7 +1034,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
>  		.parent_data = gcc_parent_data_7,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_7),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_floor_ops,
> +		.ops = &clk_rcg2_shared_floor_ops,
>  	},
>  };
>  
> @@ -1057,7 +1057,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
>  		.parent_data = gcc_parent_data_0,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_floor_ops,
> +		.ops = &clk_rcg2_shared_floor_ops,
>  	},
>  };
>  
> 

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


