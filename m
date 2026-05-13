Return-Path: <linux-arm-msm+bounces-107476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJjwOb3UBGqMPgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:45:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C6053A2A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:45:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70ECD300EF56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9633AD53B;
	Wed, 13 May 2026 19:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bGuU2Lcu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KRPSnLYk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1372E0B58
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 19:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778701155; cv=none; b=j08Gun4jTjYMFLCWB0wogVCj1A7hnzOpcBEynN8hlKlQMLCMBPWioc4GFbJZTU9M9FMcdGKRkYwdKTvMedaAMe0aULWRgmqBEh80WJmbpwaIkk8BqtzNSHMN/sWSeq4GNkk+BljG1wYxW45fd0q4oSZ4fGwYURaNw/xKMJ1w3+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778701155; c=relaxed/simple;
	bh=li5ZoxFSxOcfVSbefU6LKLYa+hd/AJ0ctoeEVHgh7y8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nxcyu9jlVZhZDrfaNbErOT220TbWcFdOtNswSu8vlNLrPoA89oQnfPNiJG5HJeqYgdPvK8H8pfd3eHDMPOQ0x5QGI6c7hTGuDc/ySUWR6Ypff1ct2cINMxvNAdmMDoXAnE6+xz7VSTZvB9+bV61M5Bnb+6cVoXU3G9g9/80d7DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bGuU2Lcu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KRPSnLYk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGwUkL3430147
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 19:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jgjv+Fgtfz6BzxxEdOYmhd2HoilXkZ21ctD6Nn7ajo0=; b=bGuU2Lcui5eGkW+T
	n4HtoY2+Mj1Ocl039fDfV+HFiR43b7pXVt/GmROypELtpeR9rReWta/2dusbAZMZ
	+0o7UVy7uLlyG4zZ1NQ8CiX5IKDC71U10UUkvFFPEnro3hL34h4Er5gqScJCovST
	ABvBT+cpU8UYHQU6qSq7Zv8rqmUJFp7gRXUiBSup2uoW0MzscALgIYNwEbZouzjw
	NA/n3eBl4rsI9zsXPuMbbcD/CiOHS0Rq5eCSZm1EkNJFmdfBCFMCFZnhG474pvGR
	vvkocrwDb/SclhqSRUx+iGvweDktiS/JWxPitWfyj32QOgHiCy92tbB5jVUM+RtE
	Pnux2Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmcj6ms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 19:39:13 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c828659ecd4so2274672a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778701152; x=1779305952; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jgjv+Fgtfz6BzxxEdOYmhd2HoilXkZ21ctD6Nn7ajo0=;
        b=KRPSnLYkJKrw8YMsUGYmSpP9pT9LM1+bP0JEJOk0QbsWrztNAtbnJ6Nihot0m4vjw7
         7HpnXHpeIPRf2GmC2iVZN7WitlsXmnCrC2LSURE8ZztJGQfR8rK/nXeMc06MMcALjxiR
         ofPrWMgKgvrH7Ex6sifvsSVtuDmGCboGA3pCTGhmjrJXBT7AZwx8EamNR7tXU7uZ3ZhU
         9Nq0+fS8A1PaX6MGXFTzte9RaNrhfkO0xogAgrtGR5dTZ4kzPDTeR9a32eXDFy5HFSil
         yzx+SrLpi+Ss0q9g2VTLzHS+SA4KZyeioadH7WyXqehVBI2uZ1qTsHO1XcmcSHo34n4f
         7szA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778701152; x=1779305952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jgjv+Fgtfz6BzxxEdOYmhd2HoilXkZ21ctD6Nn7ajo0=;
        b=ARpjtGXDoieL3HaZ4Bxy6bZf2MVc6QvPZiIHiRegINVwQAf7MnhOeTUY45RIgW2xEV
         g4a5tIvnmZ/5d4UYzEo/Kjwb+iVZ+V9ssy11iMqmnarHPPm2vJQ4cL0Q1Vg2iWBlVsvC
         r5gL68xtyiMI6Dw7xvmnUAwPJ2e0GdLsN+3itAApa9ExTI/3VgthnT1fkIYMGskF4hVI
         qYVAkl8ySdRKgXObc3/3eff3WK8MASYNn738sgpdVVapgUjOTmqq+3CCq2W5wW4ps1gC
         iTfyJ0RDs3Ab6Miw5DkWCaEkfonGx9uvEVPy7Lk8v8yKPVgPPo84kORkAjor/Cy8NPMU
         RW7A==
X-Forwarded-Encrypted: i=1; AFNElJ9e7elq1wumYEYr9c5xEWTw8ZBEMan2wMragNOjw6zHWFXrClrpI2/6bF3CNvQIayGgse8G8eBWhpCFAyqN@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr3F2jTKUDB+pIt7IV/YR8BKVdm7sZS1Azdq7kOl+V3v3wS/Oz
	vWSg0zfdCB3PD/eanBf9OS6ApJcqrOzhFiKhuz7NCfKVi8eKsuAwoZP8K2UEj05fp4DWlxOyHZx
	ZaiNpfk/6DADePkxRQXIdDyi0GA9CvkM/tSsYk4NXIFB6YXj70JcpP6TZOSJXrSbu7Q+O
X-Gm-Gg: Acq92OE2IdhjziTICkfLxAfstZENEus0vFyGCXFzvIJjajup79e34RpKBLP8KaTdYzL
	ZtmhqiHZ/pgsO+UGvjoR2Qh0g/anspMBs6EZ/umWJa6DCIeIXN4lEBUWhJLAxuGBNHLHw7tCtwh
	O/Ex3jGuxEMC6bKmn/1O9waNDqvFinMTv4DRTzZYmv7t1h8RDy4tGdtJcIfbQGFmAKPx9hWZOm1
	7RUVhwxoUQIKF6lsul8MxMJgAZZoM30+aMjE8hScb3e7TRGw81q4Tmfs+d9OkN4PRozjePmtG41
	XInR321/5XuMdNB7Ll38uq+4u7aY+lvqYcZrppQ5IKtKAS6enZMlssk+VpwtlPd/ZbpcdXH9RfD
	PubtV+zMsQGinx9IpgKiCYhV54I71tkVUPN30H8lUEKOx50/mceJ6212A
X-Received: by 2002:a05:6a00:2e83:b0:837:80a:5abe with SMTP id d2e1a72fcca58-83f058eb5aemr4513468b3a.37.1778701152302;
        Wed, 13 May 2026 12:39:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e83:b0:837:80a:5abe with SMTP id d2e1a72fcca58-83f058eb5aemr4513443b3a.37.1778701151811;
        Wed, 13 May 2026 12:39:11 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.255.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5b4bfsm304825b3a.28.2026.05.13.12.39.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 12:39:11 -0700 (PDT)
Message-ID: <c6789e1e-db42-4546-8a98-d75a2443747a@oss.qualcomm.com>
Date: Thu, 14 May 2026 01:09:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] media: qcom: iris: vdec: allow GEN2 decoding into
 10bit format
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-6-7fc049b93042@linaro.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260511-topic-sm8x50-iris-10bit-decoding-v3-6-7fc049b93042@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: T92lItRN4pflOctgJdr4amec4LzXFDvh
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a04d361 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=6GFGFuPpdQFN+sW0UwB+2Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=Z2vZjvcEZgQmuG7N6MQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE5MyBTYWx0ZWRfX29o6bJJ5z4zE
 QLhGoBFdSKg4vKGKOooFHASeGuC20+32WLJX14qm9T/YIwqWwC3O6cDTkEM9UxcdbiDz3a+guDn
 muY27uyJEp3Gha5fi4t0yC4iN4SSC3Lbk21mJYbH0sM/Fgol2IC3ijSxhdhtAEo3mtbKp7OfpJr
 8gSKB7iTXrPwSjSzaAunGQCkHvkT1AYJW8Ndfbt+eA/pRxDK1v+s3+lVTPkmyON0/XNfQip8MG7
 bq8jGHmWkOW8GrMIuQC7SkeXjYX7AxvUs98BUrTmZapYj2TIY4RO1smX10IPfafWUBfHUxnjtFY
 0LWa2d4EBN0ajkK5P7vwzasFX2SlJH3AykxXXmy354tDAUiUTzx03BEQP1l7XsJpdehXK7dIFBu
 Yp0EDFZI0hZFN3n/c44XS8/vsfT4Acy6UTCSQuJ9zAPt1gaxNaP300elxzwkdxtRYTMPa0cMBMc
 QLLO6ywYZq1w1IOhqCQ==
X-Proofpoint-ORIG-GUID: T92lItRN4pflOctgJdr4amec4LzXFDvh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130193
X-Rspamd-Queue-Id: 48C6053A2A9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107476-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/11/2026 2:50 PM, Neil Armstrong wrote:
> Add the necessary bits into the gen2 platforms tables and handlers
> to allow decoding streams into 10bit pixel formats.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   .../media/platform/qcom/iris/iris_hfi_gen2_response.c    | 16 +++++++++++++++-
>   drivers/media/platform/qcom/iris/iris_instance.h         |  2 ++
>   drivers/media/platform/qcom/iris/iris_platform_gen2.c    |  8 +++++---
>   drivers/media/platform/qcom/iris/iris_vdec.c             |  8 ++++++++
>   4 files changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 0541e02d7507..b6d815c01f1d 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -542,6 +542,15 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>   	pixmp_ip->width = width;
>   	pixmp_ip->height = height;
>   
> +	if (subsc_params.bit_depth == BIT_DEPTH_8 &&
> +	    pixmp_op->pixelformat != V4L2_PIX_FMT_NV12 &&
> +	    pixmp_op->pixelformat != V4L2_PIX_FMT_QC08C)
> +		pixmp_op->pixelformat = V4L2_PIX_FMT_NV12;
> +	else if (subsc_params.bit_depth == BIT_DEPTH_10 &&
> +		 pixmp_op->pixelformat != V4L2_PIX_FMT_P010 &&
> +		 pixmp_op->pixelformat != V4L2_PIX_FMT_QC10C)
> +		pixmp_op->pixelformat = V4L2_PIX_FMT_P010;
> +
>   	switch (pixmp_op->pixelformat) {
>   	case V4L2_PIX_FMT_P010:
>   		pixmp_op->width = ALIGN(width, 128);
> @@ -625,7 +634,12 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>   	inst->fw_caps[POC].value = subsc_params.pic_order_cnt;
>   	inst->fw_caps[TIER].value = subsc_params.tier;
>   
> -	if (subsc_params.bit_depth != BIT_DEPTH_8 ||
> +	if (subsc_params.bit_depth == BIT_DEPTH_8)
> +		inst->fw_caps[BIT_DEPTH].value = BIT_DEPTH_8;
> +	else
> +		inst->fw_caps[BIT_DEPTH].value = BIT_DEPTH_10;
> +
> +	if ((subsc_params.bit_depth != BIT_DEPTH_8 && subsc_params.bit_depth != BIT_DEPTH_10) ||
>   	    !(subsc_params.coded_frames & HFI_BITMASK_FRAME_MBS_ONLY_FLAG)) {
>   		dev_err(core->dev, "unsupported content, bit depth: %x, pic_struct = %x\n",
>   			subsc_params.bit_depth, subsc_params.coded_frames);
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index 16965150f427..16424d1e94a6 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -25,6 +25,8 @@ enum iris_fmt_type_out {
>   enum iris_fmt_type_cap {
>   	IRIS_FMT_NV12,
>   	IRIS_FMT_QC08C,
> +	IRIS_FMT_TP10,
> +	IRIS_FMT_QC10C,
>   };
>   
>   struct iris_fmt {
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 5da90d47f9c6..ceed4b5d96ca 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -56,9 +56,10 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>   	{
>   		.cap_id = PROFILE_HEVC,
>   		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> -		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> +		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,

what about gen1 platforms ?

>   		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
> -				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
> +				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10),
>   		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
>   		.hfi_id = HFI_PROP_PROFILE,
>   		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> @@ -287,7 +288,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>   	{
>   		.cap_id = BIT_DEPTH,
>   		.min = BIT_DEPTH_8,
> -		.max = BIT_DEPTH_8,
> +		.max = BIT_DEPTH_10,
>   		.step_or_mask = 1,
>   		.value = BIT_DEPTH_8,
>   		.hfi_id = HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
> @@ -866,6 +867,7 @@ static const u32 sm8550_vdec_output_config_params[] = {
>   	HFI_PROP_OPB_ENABLE,
>   	HFI_PROP_COLOR_FORMAT,
>   	HFI_PROP_LINEAR_STRIDE_SCANLINE,
> +	HFI_PROP_UBWC_STRIDE_SCANLINE,
>   };
>   
>   static const u32 sm8550_venc_output_config_params[] = {
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index f4d9951ed04c..65cf509e4aef 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -70,6 +70,14 @@ static const struct iris_fmt iris_vdec_formats_cap[] = {
>   		.pixfmt = V4L2_PIX_FMT_QC08C,
>   		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
>   	},
> +	[IRIS_FMT_TP10] = {
> +		.pixfmt = V4L2_PIX_FMT_P010,
> +		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
> +	},
> +	[IRIS_FMT_QC10C] = {
> +		.pixfmt = V4L2_PIX_FMT_QC10C,
> +		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
> +	},
>   };
>   
>   static const struct iris_fmt *
> 

Regards,
Vikash


