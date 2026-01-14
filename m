Return-Path: <linux-arm-msm+bounces-88919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4543AD1CDA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 08:32:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BD12307675F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 07:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1989736166E;
	Wed, 14 Jan 2026 07:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hFw7N+yR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HTat/mun"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9834E35FF64
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 07:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768375713; cv=none; b=DICb/AOM08g586ZN/uzWjjhjfzdQ2yktoTf3EVYbvTLB4xRrMdVZla5O/0hHvCJM9daMh/1vIWPtdk6ztvzazijjOU/AJJs3Ncgu7+Df6qF7qE9mgS7S6JrPD8+8xnz8mK7PEXLAK+0mRvoSNoUBg7RWgAVz80m1abvLuluhb/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768375713; c=relaxed/simple;
	bh=aDxtKzNEsVHqByOidgY/CPR7Hh79+kO4ibmjZJQIYxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DZo7Pki5wtkdLW5LplJh0fOHySqjpWxWGNwZxQZXSX7Jkju+4UiawqWSkLCb+uTZX2Ax7SfjRRdtQt4iJN1emfotruJnQecR5wFr9V0pi61p2ODS8PLsBTr4i+m0EWGoW6wyktdKF7NeI9K/sBuxyf3S2Qk/HjXTiZJiXvLBpOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hFw7N+yR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HTat/mun; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E65xMI1872417
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 07:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KdMG9WA+kJ7VqYbxQxfdg6qolJCk+4/maOFlurAClgg=; b=hFw7N+yRkHjxu+g/
	3URn+CzxOvP3v0Q+MBUanCZVI9eKOBF1UazHmnnOtSQAaJODueuzlsnpmi8d1iT/
	3klzaZ1vYYM/DbS48JYPjxIbZfJfbt12JQuj0WCMS0+I1/CNEe/GEqR4StfcU02E
	2BKoe9eoLlKYP5GzxDGSmowClBun+5ASjJX9ZbD8Q5xZccC+LRo57cNG9SK2gubr
	zYwgaMeBvfmHxNpi5eWfDCTJVe0YKAqRiOX4tQT+C7HWjzpFpaYzKJ/bmO7rPrK9
	4TQnamMPUyqUd7ep+cqp+dnWTrwviAIz6XAma9XhKLSjk+q8OP3pCNfPbsMKCNIL
	3qdAog==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnu58t8da-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 07:28:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f27176aa7so123033135ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 23:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768375706; x=1768980506; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KdMG9WA+kJ7VqYbxQxfdg6qolJCk+4/maOFlurAClgg=;
        b=HTat/munJNYRrkmd5jDHTkbzRF+YVzcJh2VJNwjAcqOQK233YyimXNnLnR//sBkyYk
         taL2swAumaJyspFaBwHhF4ecPU/mcU0cyFQk9vOMrXcHTHyAbEq0qvs6dcFmDE3TGMES
         FogEGNIIqvEu4SNSR1NO1PEVvT9gtlY+CyqjVOpW5mnO1aaO0+O9QoYJxtLuo2Av6fwh
         W2qsOL3DJdUrw40erC2/fUlL1QgnFlA7DMJOeCpYOzfqUIm6dd90K3zuZu4VuoxgigyB
         6WIKmJHcFyk7U2L5WG0x2XxdqzxtVE4khcVMztEinRA2yLLIH2UIEdPVXZPn7VRYZ+KW
         DsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768375706; x=1768980506;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KdMG9WA+kJ7VqYbxQxfdg6qolJCk+4/maOFlurAClgg=;
        b=Qruu9v3TpiGgPINXdoO4NjHtSGmaJt7lpI1AtKLr8QO5ZWtgnI0hdSuRa75dXrTRX9
         7btUv0ZBFAqsuCiQU6xvPxyLMxDSDXMWKAVxftNPhci8it9L35xAVRqGsisTHGc1PVvk
         gtpAHjyShNYkoo7tw8amTiShh4o8CGQowYIvh0N5YsqDjO3eDXZ029z9k913MzxiRM5a
         I/WdMotS+cJ3AJY3vGWXp0s/wxaoAOPrLLNIwdUJS7NeK0ZGZA14LOza8ic8yzr3aDla
         l+7oTdO9Vvhs5cdTfzT5rYRojrAtoAOXScYD7KtmJkI7jBR8za5rNQJRoZ0O1S0cvk4m
         HIbA==
X-Forwarded-Encrypted: i=1; AJvYcCUlmZx+LFlCXAAJ9oZAaZ4wojtgWUNBA1ZVOBmS7TqdyLm//rGEyU3djQHrGvZ5Gn3Y8b/cC6QYa71h00me@vger.kernel.org
X-Gm-Message-State: AOJu0YwuukVHCVxT8Max6MWk6ZmV2NKnpsisj2l+AeYowAF29jT5LVyh
	8z1YgVuiXI6cI3oT5fu8qzysBELonaKzOtVQuh36zrB6jbiF4snqdHl+IRE9XKfuCPyZPRrAUiD
	qUC2XL8JM7Ot5RW/P8rFGnwcF+cgxa2e4yaapLbau19boqRiCpkylLdJP+djR3jwJU0dY
X-Gm-Gg: AY/fxX7p2fjraJLy2jWd+0nvZLDJI14odXXzHVgtaS26lEJmpouRQCJBa9lQjzQSaJ5
	kT6Yz/QLlS03+mGusFiqxeHy9lbhV6tq6MYNxuE+fCzvSc2T2m558uBePHAnvfLnFONHbikYvMQ
	mn7a4xj0bUaGfWhAGJlC7R0M4DPi0WItVjHsLPiDQBaVJqx6SQuEc1bJ/E+YkIup4Ss5Agln3jv
	FkFcK22Umdv6kaRBha346VR7E1dUlqvYkWv2Qeovz9tv5dkSuM3nN1AgKGe8EMSzUR4mgrojSnh
	ztFvUqNxJq4XD5DKvvCzx3CK23D0zFlQQxAdLhA7ZzxftMsf8vVXd8XVQLsDEAq0Bgirs1c1K3V
	3r8CNS7cILtyB4AC+kNqBLppp5UVMMnjEbkIJYDd4FYzm
X-Received: by 2002:a17:902:d4c5:b0:2a0:b02b:210c with SMTP id d9443c01a7336-2a599da501fmr16776675ad.1.1768375706085;
        Tue, 13 Jan 2026 23:28:26 -0800 (PST)
X-Received: by 2002:a17:902:d4c5:b0:2a0:b02b:210c with SMTP id d9443c01a7336-2a599da501fmr16776485ad.1.1768375705647;
        Tue, 13 Jan 2026 23:28:25 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a560sm216788535ad.21.2026.01.13.23.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 23:28:25 -0800 (PST)
Message-ID: <b16abe0d-da13-ff3c-ec29-4e26981568a2@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 12:58:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 07/11] media: iris: don't specify bank_spreading in the
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
 <20260113-iris-ubwc-v2-7-4346a6ef07a9@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-7-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA1NyBTYWx0ZWRfX9yPY0xOqg8aF
 xuNcOw3GjQEtm+VKsyAR8bfmCrR8FqX9BkM3fF6zjuTaVzmLWCSjV/7BfPmY6fTvptJXn1GQfCW
 XbEKhAE2FmfzgMNnAVIta0lNafdShfmRIrq26NFE21/YLzI1Yjweb4gWu8nprIMjWk5qhu0mnjb
 utqxmzeMFKaGo/e0vWnSjnYrjrcSoWXwpD3t1ospb2na82f+MI+8Hx1dEyM4ULUBVM3F+oPGGyw
 sNJLagIGfskBQApC+VZKi2nHosEHULpfyo8XqzB9JO6ESDR+82bR2itSRpbsstiBW2Boq+PzLqa
 VsembwCGDiToalBMAdTXBVPVLV3r5HvJJOiSenEbXbg/InhAIhaN6UHUEHXuVPgmxX65rZDO7Vj
 JzQxpwF6HHWJlKVT1/itce9+AswKOFSEAt10u9kvGaxk4+qdZEmx9lLq7loSKV4UudKfHQITWvj
 PfV6iFnUx5U7nvrb8UQ==
X-Authority-Analysis: v=2.4 cv=BZnVE7t2 c=1 sm=1 tr=0 ts=6967459a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=yL4243FK61EKG2Nsi2QA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: T1QyfhJ2RBCiQMkTEWTa9BMmnQw3Kkwl
X-Proofpoint-GUID: T1QyfhJ2RBCiQMkTEWTa9BMmnQw3Kkwl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140057



On 1/13/2026 10:27 PM, Dmitry Baryshkov wrote:
> The UBWC bank spreading is specified both in the Iris driver and in the
> platform UBWC config. Use the platform UBWC configuration instead of
> specifying it directly in the source.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
>  drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
>  3 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> index a880751107c7..9945c939cd29 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> @@ -199,7 +199,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>  				    &payload,
>  				    sizeof(u32));
>  
> -	payload = core->iris_platform_data->ubwc_config->bank_spreading;
> +	payload = ubwc->ubwc_bank_spread;
>  	iris_hfi_gen2_create_packet(hdr,
>  				    HFI_PROP_UBWC_BANK_SPREADING,
>  				    HFI_HOST_FLAGS_NONE,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 9f9ee67e4732..f99fcbb8fced 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -73,7 +73,6 @@ struct tz_cp_config {
>  
>  struct ubwc_config_data {
>  	u32	max_channels;
> -	u32	bank_spreading;
>  };
>  
>  struct platform_inst_caps {
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 0f06066d814a..c967db452dec 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -633,7 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
>  
>  static struct ubwc_config_data ubwc_config_sm8550 = {
>  	.max_channels = 8,
> -	.bank_spreading = 1,
>  };
>  
>  static struct tz_cp_config tz_cp_config_sm8550 = {
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

