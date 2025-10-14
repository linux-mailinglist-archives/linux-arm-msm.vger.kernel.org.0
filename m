Return-Path: <linux-arm-msm+bounces-77098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4163BBD79AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 08:45:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6379C3B2CF0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 06:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 599502D24AE;
	Tue, 14 Oct 2025 06:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FqDQmER0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C648321257A
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 06:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760424318; cv=none; b=PJ60mVmxN0I2aP3n+ZxIHAEOXfHgiqQZeVrwmwZD9SLIGy1ZLqCzzgleSIcMhz4oAKWjs8pl1y6h7RoLDafAZNZkwhCKh2jmIOuynTo5kp8/ynzGIVHvQFTmLDuoWF3ba1krl/zLA3Nrxf5t1DBx3vywAx/5AiJq+2GR4L8EBwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760424318; c=relaxed/simple;
	bh=J9jGOA7RxXG/uDKGkODr0T46+dPJuuy6/5vlmJdrTTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T48BW4zu29oIbTf7z8kKXfBf/ZGu6DIWLoZ3DOW7patS7gpLmwkP7HHdtNgrfNKEeFKu/Oul/x2OfiqTiu/PipdgCBiXDLGMKbEl86PRRloEcCrkoPilHJKZWtLT6TzaH+i7KUYpqvs65bXCK316Ly7l/FSz7iNQCKApc6F5fmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FqDQmER0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DLh8uq013448
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 06:45:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	35L3kgBLgmTkcE9OZQQ81NyuPk6b0VIT/Ot8MyZGSBg=; b=FqDQmER04wRRQzlI
	5z+82KgMZuLRXUPZPE6+Q1LSa6XVoLkc543U1Pd5LHyOtWPnvRn95Nh/51JKZIPs
	Pp7xl4uqo29ZItFDPZ78XIHcQwrf94aZEsn1DeLTQLg1DYpRMAOp1dqYdya32rx2
	mJmKb0QnR9U/2bMdE5Is7CFYleA0XCQHLYocZ34yiUE9mbzphNw57Ok+5EUojSnR
	KodEiqmTh0lKK0hwPCHiYlQshuWDCr+xL5a31hx/+r75Vj0syYiL5X6K+Mk0+krX
	zfVcm/9ZVytOgpzobTFo4MCBtKUqnXnxGHfHcHqgPSNFgYmXzGjUzg8x89CqPxdI
	7dtPNg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdfya8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 06:45:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32ee157b9c9so8568635a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 23:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760424310; x=1761029110;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=35L3kgBLgmTkcE9OZQQ81NyuPk6b0VIT/Ot8MyZGSBg=;
        b=VdtkVR4xwfvpcSqLmgS0C/a3nhfMOCMwSBSnoCB54cez3MLdsIUx6z1P2f8p8e6MMJ
         cec+jpL7FpcIa7kpfsUcIlCxBorvvbwTRerdDPZRnEIl+xWSFOTIjtUWqxDxqmAXtR+A
         ZjV7sy8Amsmt4sBREtbLA0RlnHVXupBjrWGT95Qu79S/RnhANX3bLqA+LplLzJOrMNVK
         VK6zLeTAU2KlHxxI9Z8Bsu1hVcXQTxncZSKGmMrC2lvq3VbuwQcDSkGJZ/ThUqJRyvNR
         zgXYKyoVbM/tySGsAzvzBAeKk2Zq8IsFSDBvmt3l9RM5ThfHv0TCk4t+E1OajiLy1UcN
         O08Q==
X-Forwarded-Encrypted: i=1; AJvYcCXEHtR3E/y31FaOmmhpRgQPOQhuTXE568KDTCkHqwkC4DtVigSQHxb5ClNVsl8WLjUewUgDliFy68j6B6mJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxPiuqHEzhjwNJGGziJy04MwHA+Hcb6mZc96ERYtMjS0qTuRjoA
	GHRfdNdYP0kVGdXJTpPuveSP4+64QJNrbyq+bglwE7QhWBSR2CfUyzI5yiD/JLBbjc9sHABviyh
	cvemnsQ4TPcHM0FnXFwz9CUcqOZM+hWx1HI4JZ/ZhAkiS+r8R6E158b06gaDsEo21HE1j
X-Gm-Gg: ASbGncsxBKdMT0+9EWl523jGa0GqgE0+QUkaviBeLrT0oyU+gpUNNA+LZm8/VNy8wNU
	wWTqNWYXL0QXCNKWlnyJ02TaKafhU+mCidrPP7i19bwrvVLQdxG0PRMKyOVfZBjpZZhztvuICkY
	T0nEuQK53yF3xsznRlYLWm7DBmlXyzfTVsGqjEtf+/Tlub/MA+bJ+q/tLdiY6jFZ/qx24AhT6aF
	BuKmsmOaZC8cFzutElLXoIo//xb1PES9vMhGA9c69Gjfp/QlqmY2etdvbFvYn0CBYLCIfxB+qnU
	Ez+oKfc/0HlSJwnPZXmApfmlfFnc3B80orSAteP48WPi6kDJEuHhNBx+xmfFSdwanOwgPCHy
X-Received: by 2002:a17:90b:3a92:b0:32b:dbf1:31b7 with SMTP id 98e67ed59e1d1-33b5114d4d5mr30890132a91.2.1760424310520;
        Mon, 13 Oct 2025 23:45:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvPCHkGaaKprkCCPU+pf+oJXyvbWCEPlFJfzmcC8Py5PD4JFWz4/0XSGO3LAjsjOsgGY96rQ==
X-Received: by 2002:a17:90b:3a92:b0:32b:dbf1:31b7 with SMTP id 98e67ed59e1d1-33b5114d4d5mr30890101a91.2.1760424310077;
        Mon, 13 Oct 2025 23:45:10 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61a392cdsm15060370a91.7.2025.10.13.23.45.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 23:45:09 -0700 (PDT)
Message-ID: <fcb402a8-f0d1-d268-5bcb-0806433e5356@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 12:15:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: iris: Fix fps calculation
To: Ricardo Ribalda <ribalda@chromium.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251013-iris-v1-1-6242a8c82ff7@chromium.org>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251013-iris-v1-1-6242a8c82ff7@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX/krNbly5D3dR
 o0wJrU0CMykcptthyZMle1wIkDRks2NaDIFZPG1zHNg+jxKIVPbNDrAb+9M2EEsdTFMHyOsIkFi
 JED1tDimoWCWgN3yCUkEmCybbbgDLueJh4TNbItx8vW4YgSsdmAXrOjUUxSCPG65p8uU8wKncdP
 bC3mhJNaT1qNdHo5f89Nno552RM67gR0mQa5vrd4SQT1toFKmBqYXwleLFDY3+w5qPrI3NiV+9q
 omxIz1byL7Nl+eu/ElOSEQ/ya8q08pfs0Lf5P/Jz52p1wDDIjVAFeX/NaIHe+Cc2Cqbuf2RIM4V
 CSgsH58zPMQTsyChPRrGtIPuPTIKfid2+yOpQfPwc5X8Q1CyxV9auwR3Qdr1GjB1pg3yOTSj6uc
 CZcffyHZopzkXPNFssqRJN4WnFTnPA==
X-Proofpoint-GUID: f4_9uG7bnDcBljacBAeaW6YVObRa8IVO
X-Proofpoint-ORIG-GUID: f4_9uG7bnDcBljacBAeaW6YVObRa8IVO
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68edf17b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=0qo9UwXc1eKLUzRIyuAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025



On 10/13/2025 7:43 PM, Ricardo Ribalda wrote:
> iris_venc_s_param() uses do_div to divide two 64 bits operators, this is
> wrong. Luckily for us, both of the operators fit in 32 bits, so we can use
> a normal division.
> 
> Now that we are at it, mark the fps smaller than 1 as invalid, the code
> does not seem to handle them properly.
> 
> The following cocci warning is fixed with this patch:
> ./platform/qcom/iris/iris_venc.c:378:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead
> 
> Fixes: 4ff586ff28e3 ("media: iris: Add support for G/S_PARM for encoder video device")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/qcom/iris/iris_venc.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index 099bd5ed4ae0294725860305254c4cad1ec88d7e..1234c61d9e44c632b065a5c44d3290f6e1491892 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -371,11 +371,10 @@ int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
>  	us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
>  	do_div(us_per_frame, timeperframe->denominator);
>  
> -	if (!us_per_frame)
> +	if (!us_per_frame || us_per_frame > USEC_PER_SEC)
>  		return -EINVAL;
>  
> -	fps = (u64)USEC_PER_SEC;
> -	do_div(fps, us_per_frame);
> +	fps = USEC_PER_SEC / (u32)us_per_frame;
>  	if (fps > max_rate) {
>  		ret = -ENOMEM;
>  		goto reset_rate;
> 
> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20251013-iris-9addbd27ef76
> 
> Best regards,

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

