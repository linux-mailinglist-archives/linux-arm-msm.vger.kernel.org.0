Return-Path: <linux-arm-msm+bounces-88917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E56D1CD1F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 08:27:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E918B301D0ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 07:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 611C53612ED;
	Wed, 14 Jan 2026 07:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JvpIPEWP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qqq6j84p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D3D3612EE
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 07:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768375626; cv=none; b=dXVZm+8YE3gq0wfqbb0AQL9t2fh3JNx7pPCBm7H6pHRL+u72+HuupP54O30C04Z0RnH1DeN3NCXssiyzEYha9Ya9yfPwzJ6ytKi32FSZ0sbXzNOKbSj7wocFwwItiWFqO3ZpFz9gNeae7yqRHJ18gPTcRtpx3y2KWTbZsrtEpQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768375626; c=relaxed/simple;
	bh=u7xY3BtTj1nz8GHWAGlaymOYg+v++z7ZwIPBzcGw3c8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QdBPYUQNB/2O3kv/tct0zt/DgZP+MpSaKJ98iW3tyljgIRANCfQqGXSgqe4ByAstdTG6sM2mCY6wWpphMS1tugxU206cOPfj23wllAAWLw6h1JtFag8c+DCsy1qjL85ka/bY8y+O872d2i7JkK+6rd2qt0i/WGGlm6gsY1NZGmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JvpIPEWP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qqq6j84p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E665Q22766138
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 07:26:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dBtKhiSX+0Upq4Tgz55RdSfcY3zlhvYInSL7xhV1iQ4=; b=JvpIPEWPmKIbbjYP
	dMCqvPHtQxPB5m+DnH6d47iHnP7rXqa3S+0H8aF3sgJSArdc4BMR78dIVHwMvv0G
	j8CFPX4ylKHv+fucr32NkfgSw//a9ciHgPSVCD2bbcE17TCab8+yGDh+G9pmZ35p
	+oN6RrQbjtzJu1lecBzc2S4Zk9cxt74hBV3dRrf8bR5gwSHYp1n1QJF8IayAgQPw
	U3CM0JiS1Y3xRR6OkAFh+cxme84ddfRnk0YhU25fR1PtOtqm43yvG9aDCNt7QvXC
	rPCbtCBKzFk9yVPSjxRf/EhnQy6a8S2rDdO1pU6v1imGpk/BbCXAAdVhq5AMp6CC
	G+AZDQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnt63tk7f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 07:26:57 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81f3f3af760so6377660b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 23:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768375617; x=1768980417; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dBtKhiSX+0Upq4Tgz55RdSfcY3zlhvYInSL7xhV1iQ4=;
        b=Qqq6j84pk3Zw9K4tX/O0mRoA3ApXvOk2/1Z+XlySsLlM2QVZyQVNeiH5tIgjq0uVoI
         gF/naPkoP0MiyI5WfjsH3rNdouPGrzL6y5zjS3gSLDuk+H4QFkDszeDr0hV2Xy6Az076
         t5G8X8QLp9sRyUREce8ID3O8vxIsuNJTGaZX9O3y3D4IGcYuzfN73Yc0pINmt9glpaNt
         7yEoYAfsUrsRF//rl+B2NNJ3TzGHARpHn6SxGNcbH7ew3NSGqkrpc9SVuW9Oi/9gywkv
         9Qt1LA+7sxoFErZdETpSi8izSzfFer9KytgKxr9Cn3SQHZj4ljTihox5wtgl/+GfgauN
         Lfyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768375617; x=1768980417;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dBtKhiSX+0Upq4Tgz55RdSfcY3zlhvYInSL7xhV1iQ4=;
        b=byXVerSf0nYXyYWk7nfQRTcv6zGCrYqA8U46o+Q2dObl3Nl6e6jnsdXWRLlkrx800H
         ik5Ms4SWlK/z9P1WMxPYN4zHPzRvMzKnowWOmUwefaJBAl3bXHj3xrwpmbNNZti2LHdV
         M5cJOlDApPxU95KVUEIPkKyGigcr/UoebK5BBcSROOGeq86eoLjm40+ag/MkDqdPH0MX
         AZ9+tkzctJfdrs2nYnTrmz2L3RHbo4xy8B4xUf0oOvIlssc/9pkYFtbMO5a4rHAJ16Ss
         qnJ4oIcvmWqJTH1dKHMyjiMwkggUytT4NgOZghmCtF3/yn7KCNdTBl3NlPKJFtliYwhF
         rGow==
X-Forwarded-Encrypted: i=1; AJvYcCWGn6or6wzSpQ2b76KuTKKVWwi3SRu2N4N9yMb2rKZ6ktbOvplg66QLxCfgF3qLHWjHcLe/L3iOxtFNyAm9@vger.kernel.org
X-Gm-Message-State: AOJu0YxrWqJNQqmnHnFwq59Zw5DTFFWh5Oza1xXQesz0I/lt1hj0Nt+i
	nZyBfQFQEooSo0jDK2dB0935a/P6Je5H3ivBdh1XRo/BtKvaZYY61SscTIdBrJ2K6U1rW5VrjVg
	l6MK99Mw/cvAWgYP0/xSW4Q2AfwfrcLK85xoCYzbRLwknxny/r2ya8m+n9IooHPt62SJ1
X-Gm-Gg: AY/fxX7xvnf1DD3uUXOvLoX9bVnYHIrXCJWNdIMVQUDV4B7dFWi7wEwb5MarIoyLAV4
	6mv9zXQ2d+Kdrm1BAQveev/Gdp9ubdqQVjfbXXkslimBHEW8tMT1D+V7YJty7rG/Nh070nPnVik
	bA5qtkcC5PlslLEqp/o27XHRsbJb2V65Z0vbVOTwxZzucjnKsrhbqmCZ/NMCTxli1PPFOJnfeQN
	lGa4B9EIOP4HN+M1ncPDaamvtLtmwzfOCahshKBlS1t3UIdDp34eN9M8BJvDaj3/NH8RMqu+Y9g
	cXB5GVCt5eEe2Z4+FiJ27qOFwGGL0nA/OaDQz1NNov4OR65UnKZWePtVrnnAMPUhRMKFJNOCXgI
	Ge1VBdImV3WV2ujpbxQ512aN4MjuW/SG073EQqascHI2Y
X-Received: by 2002:a05:6a00:909d:b0:7e8:4433:8fb0 with SMTP id d2e1a72fcca58-81f83d5e569mr1170872b3a.56.1768375616697;
        Tue, 13 Jan 2026 23:26:56 -0800 (PST)
X-Received: by 2002:a05:6a00:909d:b0:7e8:4433:8fb0 with SMTP id d2e1a72fcca58-81f83d5e569mr1170836b3a.56.1768375616238;
        Tue, 13 Jan 2026 23:26:56 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f87aa4f97sm250194b3a.69.2026.01.13.23.26.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 23:26:55 -0800 (PST)
Message-ID: <57f3bfed-61e2-3e6e-c7f1-8f1ad69fea94@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 12:56:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 05/11] media: iris: don't specify highest_bank_bit in
 the source code
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
 <20260113-iris-ubwc-v2-5-4346a6ef07a9@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-5-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA1NyBTYWx0ZWRfXwLRzUc4ZUyVs
 KPufGnEXwVMTF9Pd3q+L1Z0Q91P3X6jdtQhM5/Uwf857rAaHyqJx+wDdguSH5Vmq0XaTAlCZLVI
 b9NNm5oLBjqVC9uEJKJW2R3Eo04jAahyh6XnippS6CCGUKCsh6yGlpbIkxzq+YzqOxyBi2JZEoe
 6S2XDR/1uid+D28g0dieEDh7xzzrT31/cJHAMezo83s83ieH+Xt18OTi1DxDgWZU/Mq6pij93uy
 vuXuwV1rraHwpn7jphBmB9BpSovSfy7Z9NveuFDcJJlIWkuTfT1brzEAkHu7CA8eiAFZQEaFWBR
 kY89TMESLa4K9u7wtEvXan50d2QeleAS6NEz48R9G3AlgYpUYPjP0pgsAmHrhHPHsmgjk+7/sB3
 ksMJfiM/eTP2GhFhTZJ7RkYzu6u7UF4HHvm1fQblsWAiFPC1OAegfsKKYDh3wejviThPnNV6LiW
 yYz6b2p6vFB5jfZgqCA==
X-Proofpoint-ORIG-GUID: gWw03647aqcJ1VQIZMymGjKeexCeCJGf
X-Proofpoint-GUID: gWw03647aqcJ1VQIZMymGjKeexCeCJGf
X-Authority-Analysis: v=2.4 cv=EujfbCcA c=1 sm=1 tr=0 ts=69674541 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=yL4243FK61EKG2Nsi2QA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
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
> The highest_bank_bit param is specified both in the Iris driver and in
> the platform UBWC config. Use the platform UBWC configuration instead of
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
> index 878e61aa77c3..a4e60e9d32a4 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> @@ -159,7 +159,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>  				    &payload,
>  				    sizeof(u32));
>  
> -	payload = core->iris_platform_data->ubwc_config->highest_bank_bit;
> +	payload = ubwc->highest_bank_bit;
>  	iris_hfi_gen2_create_packet(hdr,
>  				    HFI_PROP_UBWC_HBB,
>  				    HFI_HOST_FLAGS_NONE,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 3c5f3f68b722..8421711dbe60 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -73,7 +73,6 @@ struct tz_cp_config {
>  
>  struct ubwc_config_data {
>  	u32	max_channels;
> -	u32	highest_bank_bit;
>  	u32	bank_swzl_level;
>  	u32	bank_swz2_level;
>  	u32	bank_swz3_level;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index c70cfc2fc553..5ae996d19ffd 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -633,7 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
>  
>  static struct ubwc_config_data ubwc_config_sm8550 = {
>  	.max_channels = 8,
> -	.highest_bank_bit = 16,
>  	.bank_swzl_level = 0,
>  	.bank_swz2_level = 1,
>  	.bank_swz3_level = 1,
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

