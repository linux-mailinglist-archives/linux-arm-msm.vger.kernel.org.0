Return-Path: <linux-arm-msm+bounces-88546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B199D12332
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 12:14:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C10630F8CF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 11:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1BC4A32;
	Mon, 12 Jan 2026 11:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lq6vwzjc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IWcEpgwA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE1521D00A
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768216199; cv=none; b=DuJEIwSryc8sT8Iw0kdZ5Kw15Qr3jvkzJK1GzsYLWzbdTAnVoCj7sykSBZhWpakCaQhDsX3sTnFf1dtZWTiX0cj7Dn6UqRrvAuMNL5NhxG5cEY9HK6N0IRmxYYua2A+dF0jM+dSr3NKC3I2l8pUH3ORGAu3fFDrCQRjkOf1v8gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768216199; c=relaxed/simple;
	bh=ZtPbgqz7BJQtQmo/NQXXac9kWs26vpASRvb6TMW6ziY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tq/OnkVSXjrFmBXGzS229skkQWSd3BSRmb7uLDOqfLv5LKkOe4+mM30MoYfZRZG7QVFvf6uM2Pbo6xvEz6ZOueLBC92NVMNKDdOBh23wmVmgDMnafSGx9iJzocvNIbPlkSL+tmn/xpakLTaYizaRMn57kwRUP2+n9lQcjLocddM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lq6vwzjc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IWcEpgwA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C846U9165707
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	015MT2ydsbb65/BcmwavatLyyBIiF0F1nAMSpF1TgcM=; b=lq6vwzjclFv6c8L/
	vWi4NYqOA9JFlEzAXqtC6SFerAkgwE2C2SFp/w4l0ZyPx99N19Nm7i/Q0MbUWmYu
	3BdqT879HyXd2x5PAmRKIV8AsjwjN/fyZLVtYPXngLJ2ZY1lBa7qB1K87vtj73ys
	Q73k4j7d3UgVaGkZTLmSf9HR4TIW92ZCyy8S79ypy3DLKihC9otgr3uog+CKTs2E
	ronr6A9vuj4fvIZeyqVfhVLiibV9yg5SENrLt6Rx7foBH/cNHrzmdr5ofP5tis5N
	1O+0jTJt6Vv4KMKj+/YbwSvQCiH0Qe3YWSI6AGM780n9l55FFCRzR/AJQV182kN8
	BM5f3A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bm8kytqr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:09:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a13cd9a784so55150175ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768216196; x=1768820996; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=015MT2ydsbb65/BcmwavatLyyBIiF0F1nAMSpF1TgcM=;
        b=IWcEpgwAU4ckMyQ6qUKL/kYs9ROc6ftsZxdz/2p+Nba0RzMxQ49QPkmzap+8Ynv6oO
         H6MA1HS4HEIoR6XFwrQitHgAX8nl6sWuZ6A9CUNP1rNMgblAeCPfv9b3fGJYYFehAqxU
         t83VcEBjQoWKDYDP8eR7AwFrtdzq2Ewt4ZbQDqquJxdVj7+e1pjtwrJOthcrfkACzD7b
         0LTvzucEPxf1NN/pdaGPWBji92VcxqQbIZc8kyeBiV4HGCLE8iDZyppzEvHk47jlm0jJ
         8wa6xzs0brlizzRnZHw1QJ1H5NIHYLriEPsKiEN5qrikJXGxLhi9bcsAoWg3ofFPK2Xd
         OUpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768216196; x=1768820996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=015MT2ydsbb65/BcmwavatLyyBIiF0F1nAMSpF1TgcM=;
        b=XPVFUkMa116aVm1+Ozyxy0q9Fjj3pw5YOwyTwzt8ax8OrjYGOqkKLSTVv1IcLoJbj/
         GmSPtxQIOrwfAxLOWULdYEWk4qflNIkf+q3vsxTfhRyeiiV/hY0HLCkVU3vxjjPmySLL
         j8rqEaWGez1WHJ2MLX2DHGRRqDYWCyVsoqzFFIhCnfUnvQl7WTySe/Jlvm5sb6fELQtx
         tKsAr3B26M/clcY8LjP3553FfN62ahYbcWpw/bFQXywUGgHriL3YU/r9wv71GXJbLIq7
         jhIp/q7VHhpvSG1zH3CU35XkRayOrZcfQB1K54mQbCygoj7kW+A0LgxYa0fMpQCQqZ/I
         +MuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdRxJ3DIEwMNoFvGitUyuAVr2FKmA1opiGCzmyZU0WSkypa4iGQlpQqwzu4saiE1kcG5kjBPRCpGDys06o@vger.kernel.org
X-Gm-Message-State: AOJu0YxZuB5NJ9g8OpEmFMts2QSNixEm3VMKGjl1jvhSFXz3RqbqybMb
	WY6jbcpONMpulDi5PKiVExoJwUxA0K/XH+xidnMOrmFyc61h78uilKk3MY7l46WtT4wivIyUtak
	7OMM+5Xdr7X3Z5arEC67Ev1I5tWPPqB+BsIGHYEhfWm3hO2sOynGa9Wbb1ewnm3fZfTn8
X-Gm-Gg: AY/fxX4cm4wvGzotfQZZEe2ij0B7vPybzTfShUZxuMkp+VZ+bUxx+Z8Y1ud7jES1+A0
	SwSkTeMuQ4Mk/nnZbo9GETreS2nVjzlGGIsfb1mQuSbbKjIQdbTdxz8QrkYKt/Nu73IujH7AMAG
	vyEuO/FoJjYkJCjT2o8lrfHsV0pnXS723/06amXJSOBrA+TBbcSGRLOoNdcylX/dCjkDccqrwU9
	/6Fv6d1TwOEmmZqXx+naq2t5GDqh2/0MzynkyO1wdVi1mSn5zjPr6Wp0leam3NGoOo2vJnNKO0i
	L4lFEQvPguzAWbmC84g0CeUi+UttB91bWRGkDpQm/B5GX+dvQPMVsuX5tQl5viVzMGaNG+EG1U1
	BuBku4+WI9kvt6FBWQCG+i/Xc9N9fISzmPi3gb3jNVzY=
X-Received: by 2002:a17:903:1585:b0:295:ceaf:8d76 with SMTP id d9443c01a7336-2a3ee4aae0cmr169650705ad.47.1768216196342;
        Mon, 12 Jan 2026 03:09:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYc30TnIeP2dYkT6BhxScbMNpGpox1e5JPKeXjC5ZrQm8QkZyBqhdkrzoFxFEzQvExNTPw+A==
X-Received: by 2002:a17:903:1585:b0:295:ceaf:8d76 with SMTP id d9443c01a7336-2a3ee4aae0cmr169650425ad.47.1768216195892;
        Mon, 12 Jan 2026 03:09:55 -0800 (PST)
Received: from [192.168.0.171] ([49.205.249.58])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd3284sm174523235ad.91.2026.01.12.03.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 03:09:55 -0800 (PST)
Message-ID: <44e3dabf-fd08-49fc-b679-d496d125e788@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 16:39:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] media: iris: Prevent output buffer queuing before
 stream-on completes
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
 <20251229-iris-fixes-v2-6-6dce2063d782@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251229-iris-fixes-v2-6-6dce2063d782@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MlixTYJGAf1F2iTpv0AXaqBmCK35edW1
X-Authority-Analysis: v=2.4 cv=ZuDg6t7G c=1 sm=1 tr=0 ts=6964d685 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ntuG9qRpOVxPRPblRsQ5Fw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-cBt4YmGFOJx8w6EWXAA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: MlixTYJGAf1F2iTpv0AXaqBmCK35edW1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4OCBTYWx0ZWRfX1p7LIWCkEL9j
 rFsIw6MVZ+05K5bkhsVaMe3yIkMnqAo5YdtZYVOq8vAeKLxQCOUNEp0Rn1hQEfzAs0qBa5EVxTJ
 wghSMnyXazUlgHUUU7nReFpAfkf0EAlFqoJ8RRs8HkR/ZgHrvUODxa3Ebod3IwrGUsNn175faLg
 3rHUl/qLxDpJ8iMvDIvfJfd51t2j3sF1W86ceMtNdy5bsPw8+FGNS6x2TDvamUVoVxJiGcIZ6tI
 WgcEdy2ljq3T1KZucWrCYQFMqijgk/zqXvk9mN/RqVzIuSbrliVoz42MqG6WZmqaXRFDHsZ7l4l
 SmTWsgAze/hy7aFUA0uBgWVQm4fTE+VQt6s3b9JaPvtHHTROCUKAtwav+bd/PhgZJXP0yd1ZZvd
 XJcMWVuAbZY9vGurKo9WipuX3/PblRuTE3x449m7lRQgJ58pOMF2K0x6TdhcVFOpkZufT1g0Qjv
 ek3jyBNqdLz0lvYTNhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120088


On 12/29/2025 12:01 PM, Dikshita Agarwal wrote:
> From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> 
> During normal playback, stream-on for input is followed by output, and
> only after input stream-on does actual streaming begin. However, when
> gst-play performs a seek, both input and output streams are stopped,
> and on restart, output stream-on occurs first. At this point, firmware
> has not yet started streaming. Queuing output buffers before the firmware
> begins streaming causes it to process buffers in an invalid state, leading
> to an error response. These buffers are returned to the driver as errors,
> forcing the driver into an error state and stopping playback.
> 
> Fix this by deferring output buffer queuing until stream-on completes.
> Input buffers can still be queued before stream-on as required.
> 
> Fixes: 92e007ca5ab6 ("media: iris: Add V4L2 streaming support for encoder video device")
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vb2.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
> index 139b821f7952feb33b21a7045aef9e8a4782aa3c..bf0b8400996ece5c9d449b99609a302da726bf9a 100644
> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
> @@ -193,10 +193,14 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
>   	buf_type = iris_v4l2_type_to_driver(q->type);
>   
>   	if (inst->domain == DECODER) {
> -		if (inst->state == IRIS_INST_STREAMING)
> +		if (buf_type == BUF_INPUT)
> +			ret = iris_queue_deferred_buffers(inst, BUF_INPUT);
> +
> +		if (!ret && inst->state == IRIS_INST_STREAMING) {
>   			ret = iris_queue_internal_deferred_buffers(inst, BUF_DPB);
> -		if (!ret)
> -			ret = iris_queue_deferred_buffers(inst, buf_type);
> +			if (!ret)
> +				ret = iris_queue_deferred_buffers(inst, BUF_OUTPUT);
> +		}
>   	} else {
>   		if (inst->state == IRIS_INST_STREAMING) {
>   			ret = iris_queue_deferred_buffers(inst, BUF_INPUT);
> 

Reviewed-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>

