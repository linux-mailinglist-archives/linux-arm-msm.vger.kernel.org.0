Return-Path: <linux-arm-msm+bounces-81522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 03528C55D56
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 06:43:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7D8F634BA4D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 05:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D96A3054F7;
	Thu, 13 Nov 2025 05:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DAXUcinP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UaYcoqIn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE172C0F71
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 05:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763012571; cv=none; b=neBcP2XaLa1AdD3T/CgIGxJbwwOxlOgPlhnjyhf/sHzttL0p9q8e/wTcrdti86horL/Sv8YZmav0sipucxlY8i/ccIhwfAtJpcXL3Q4bRPNd27SKOqCZiZ1d7lHYUAJmWwLwOF2O7+AQ/X79CPZE+KAM42yMtWw1hN5+tVVHMjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763012571; c=relaxed/simple;
	bh=9f9xlKVZCbRqxlzVaK57ePi8HPm9U3/1ja+f+S2iVOc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=F8MNZ/JcPSJla0qQXFeeD9kIuuE3bXArZNiovWs2gBc09iBfEnSS39lmThzRdYGcyHRGxoMJGRT5ogW3DPRUu2rkNf/bPVQsE1XBuuJbiopIwIuQxopQt6Vu6XADqwbO88Tpeg9RcCjkV2m90H2RIcAbZ3Ej8RVbdLcPmWmTEtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DAXUcinP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UaYcoqIn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD4was73336811
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 05:42:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j35KoHy0NLm6BEo/3wH8JmtcrDtVvenYAA553qoWcfg=; b=DAXUcinPKBCllZ7r
	rmiLSTs5mgWNCZ4CzOEedk8G7rYQh4P7KDcMvDznErwYCjmvV9mq5Qf4opYzj+9v
	9WffbImPFNjN1nPI2hw6aQ2/wjLAQSzUoeZZDo8be17tsBJ0DBESyV0d4LNBV4GQ
	seLPYX1px+YWEdSLovbymhdMbjovgplOXYjlSVvqQlm297REPBCpM36+/ESdfdcS
	JESYCHemoQxqhqOcVW6XgJJhmbKcg0AzAQsLoepS3p6oDmAa6VB0zc5O2Dm3igpc
	XN2peSp2FpTTdMknD4bBLMl84S8wXmgpOzGyV5XXDRLdy/qM0HK08RNe9OyaVdBJ
	fajFlA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad8sa03yu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 05:42:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-342701608e2so607812a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 21:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763012566; x=1763617366; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j35KoHy0NLm6BEo/3wH8JmtcrDtVvenYAA553qoWcfg=;
        b=UaYcoqInFA3frgyt9TvfhW7M/5fwcbauVVWVxZZ29+RE9NRXuM7wBnKzsd5JUPpk0C
         TAqzrGSZl6qdDX8xoR9EuxRMpfk7UFALCzAq48Os0hgZaHj0iKyXvHY/CTkiweSj/ecT
         djrZuWA6YQXT6270NUsuydYzz5XZ4gn2hI7VALaNPfm6IP8OX0f+r8sKrglbxgwfl0e8
         M7uUp3no4zUB/89u/2BUKUR0rLRHDO9Hmm7ZwOrIRb6IuwnP0I/KdDUvk1whi4EvBBkp
         RsbuHhQpxZzV4gdEPF6+Lt4AyjRPIKwXiBIe7v+MHWdBXJ6nLl4dUCF3r9aVrmqafIT9
         BjIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763012566; x=1763617366;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j35KoHy0NLm6BEo/3wH8JmtcrDtVvenYAA553qoWcfg=;
        b=TMXVRgFqJ782iOhDZA+k2mpoCJdExNri9TjiIQaxrhGtiBKFaWO9lc4xaWqP/CqoXZ
         Z5S2EE77SkjXrUdzVk14fGZRODV1IpOn0XOWwUg6DQmoGHm/ZXHUmLO5pW9GmcMmzN07
         mPwXaMh46wiQphtrdkSsU3sFmdsPMotli3Wk3eSvOPWjBmjupjF/YUrTehg1Z9fwVZZ1
         hZ1QdzTID6W0sL4O86BHCapAD6k7zLfS9CmciFIA8jRKKcl3ki5boDYUe2157kxk6YKy
         g7YQBzMZ9lQyOZLaE31jRcrHo9BpEiGZ+6/RuoPUsFI4duQzi9U3YkeJeoB14y/P5tt+
         F/hg==
X-Forwarded-Encrypted: i=1; AJvYcCV2v5pMKL7Icmo4Tp6WD7kwYql4TK1Bj+I9e1lDkHHpn1G5wGhHeLpuZUnCMZ3Wle3CSDSHgGAqcS9Q6nOx@vger.kernel.org
X-Gm-Message-State: AOJu0YwICqdz4sOXr0JZGqPgJM0Sfb3mVCEWVuzpLrg0mD8VoJOFbg9W
	k2QU9bBVbSBZuOE1CpwtY1HRK6CcWKp+pO/DpzBSy8LLqd1R0V4DkVe/r/hCsr9o8z1a8WXW1nm
	9BOdIAapIWb9hcXp5YLUXP91oyY0/QxCoJxhWe0Dk1v3uV3VO4NK3PrXFUXqD3LIGZrm1
X-Gm-Gg: ASbGncu6I/FpxA3PuDCsZOs4qZOrbVHQt8EHy5wLi/Wmqny3wRpf2VsaJVDKVcNxXgP
	FNGX9CbEg1aM12nvP5JLFf9pqfqa9RMF0AZrnkO1auPo9dd0wIn0KdfcWGrUM1n4q+i1x7lUAWw
	yRtGBXhArnCBZ82AI9J5VW68qbqL5b/VSAIkt8WcPxMpUcUl6ykVyouBVqB8aghJkYwr0yZSMVo
	m0HL0/4Yv344jj57VUnQQFYoqphybkcIuJq/jnpDF+bqjHWLbFC8Fuqt6vlFrCKvj8lsnv/hg0C
	gDSLw0rjD9CunirSjHHD3GNUO53wYQctWGlWJ3gT4s7+LJLS6Nb83UXop89sbt/1I6tijEPaNo7
	OH960AdZo2nvJvswrThNOXqPRCiSx5Bg=
X-Received: by 2002:a17:90b:4a4d:b0:33e:30e8:81cb with SMTP id 98e67ed59e1d1-343dde14c3bmr7033663a91.13.1763012566518;
        Wed, 12 Nov 2025 21:42:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoM9MhsGjcXIqkVWSplmBV/oMf6YSS84+iAzFRhBT/s38HoF8LNn+xpaidqFEkl7wac5sn7Q==
X-Received: by 2002:a17:90b:4a4d:b0:33e:30e8:81cb with SMTP id 98e67ed59e1d1-343dde14c3bmr7033629a91.13.1763012565977;
        Wed, 12 Nov 2025 21:42:45 -0800 (PST)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343ed4adbc0sm1030525a91.3.2025.11.12.21.42.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 21:42:45 -0800 (PST)
Message-ID: <a9aadabe-6e69-b3d5-fddb-259c46620172@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 11:12:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: Re: [PATCH v5 2/6] media: qcom: iris: Improve crop_offset handling
 for encoder
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
References: <20251110-iris_encoder_enhancements-v5-0-1dbb19968bd5@oss.qualcomm.com>
 <20251110-iris_encoder_enhancements-v5-2-1dbb19968bd5@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251110-iris_encoder_enhancements-v5-2-1dbb19968bd5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QrjfSr2dTCYB8WB15kjfkPQeqDsR0ozq
X-Proofpoint-ORIG-GUID: QrjfSr2dTCYB8WB15kjfkPQeqDsR0ozq
X-Authority-Analysis: v=2.4 cv=dcGNHHXe c=1 sm=1 tr=0 ts=69156fd7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rhzUNvTo7kGCKO17w38A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDAzNyBTYWx0ZWRfXzhWMrMftml+t
 Rkz8/ckwi3aRRy6ymKWkiH1pK4/PcYIYZZSrZ+UpfdP5h+y8EEOxAhpuKxTQVoZFlO+sjJp38XG
 00n/BqNhCSBObCO2sj+kIhabyjaGA7uMWqHl9vM+YVhU+HFwjV0TafgLGShNRAH1YUuKguWxJAg
 yFjd1CSB+J4rcQ/GAgPsHJKE0/ht/ExIFyCa2n82ds8jet4wU6YoXNTLlh6g2HTmPZFR/snqkZI
 vMQacivQQ95nmQ9lRbyKtiOrwdyvPMbn/Yskc/qmH7xvu19XixxFlEBdRue8zmziwrniHu35nIX
 b3bCnfofJl5zR/n9awLXgBzu/NvxbRLxhzg0Y0nFuLJkaBxhYO+aAQZuA2hBOyd2PBa8cXkglHJ
 Z7O+Ma45A2DM597GsApmKcqO+x0K5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130037



On 11/10/2025 3:53 PM, Wangao Wang wrote:
> The setting of HFI_PROP_CROP_OFFSETS for the OUTPUT port is correct,
> but on the CAPTURE port it is used to inform the firmware about the
> ROI, so crop_offset needs to be handled accordingly.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  .../media/platform/qcom/iris/iris_hfi_gen2_command.c | 20 +++++++++++++++-----
>  drivers/media/platform/qcom/iris/iris_venc.c         |  4 ++--
>  2 files changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 48962d2e4962935bbc24244edfbbdcd42dab151f..30c0cbe22d1d34b5bbbc6bdbd3881dd43a6ff647 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -215,7 +215,7 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
>  	u32 port = iris_hfi_gen2_get_port(inst, plane);
>  	u32 bottom_offset, right_offset;
>  	u32 left_offset, top_offset;
> -	u32 payload[2];
> +	u32 payload[2], codec_align;
>  
>  	if (inst->domain == DECODER) {
>  		if (V4L2_TYPE_IS_OUTPUT(plane)) {
> @@ -230,10 +230,20 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
>  			top_offset = inst->compose.top;
>  		}
>  	} else {
> -		bottom_offset = (inst->fmt_src->fmt.pix_mp.height - inst->crop.height);
> -		right_offset = (inst->fmt_src->fmt.pix_mp.width - inst->crop.width);
> -		left_offset = inst->crop.left;
> -		top_offset = inst->crop.top;
> +		codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
> +		if (V4L2_TYPE_IS_OUTPUT(plane)) {
> +			bottom_offset = (inst->enc_raw_height - inst->crop.height);
> +			right_offset = (inst->enc_raw_width - inst->crop.width);
> +			left_offset = inst->crop.left;
> +			top_offset = inst->crop.top;
> +		} else {
> +			bottom_offset = (ALIGN(inst->fmt_dst->fmt.pix_mp.height, codec_align) -
> +					inst->fmt_dst->fmt.pix_mp.height);
> +			right_offset = (ALIGN(inst->fmt_dst->fmt.pix_mp.width, codec_align) -
> +					inst->fmt_dst->fmt.pix_mp.width);
> +			left_offset = 0;
> +			top_offset = 0;
> +		}
>  	}
>  
>  	payload[0] = FIELD_PREP(GENMASK(31, 16), left_offset) | top_offset;
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index 50a3eb975a2523abf1c2df128a66a762a1ed35c6..7ad747d2272f029e69a56572a188a032f898a3fb 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -62,8 +62,8 @@ int iris_venc_inst_init(struct iris_inst *inst)
>  
>  	inst->crop.left = 0;
>  	inst->crop.top = 0;
> -	inst->crop.width = f->fmt.pix_mp.width;
> -	inst->crop.height = f->fmt.pix_mp.height;
> +	inst->crop.width = DEFAULT_WIDTH;
> +	inst->crop.height = DEFAULT_HEIGHT;
>  
>  	inst->operating_rate = DEFAULT_FPS;
>  	inst->frame_rate = DEFAULT_FPS;
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

