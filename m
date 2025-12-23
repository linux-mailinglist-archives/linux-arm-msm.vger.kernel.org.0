Return-Path: <linux-arm-msm+bounces-86307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C273CD89CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 10:39:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8BA5D300A2BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 09:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A753126CE;
	Tue, 23 Dec 2025 09:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SJvMdc5O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iWYd3CYw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0C2233D88
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766482779; cv=none; b=SQE+Uh3cJ0/0OevT+3QsImibGZ1aYKFzOuC/RNJq4ofAfmHWvKn4oqS560WPvYrjte7up18YGfUT8+jyA8Qqy2g/hKW1aqeSh6gpElUfdo+B3m81uRgnJHIfRWT57MPRpiWsRtqEFLJgkYjOGP2V61/pqrxiQ8X1slldEKmQtw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766482779; c=relaxed/simple;
	bh=JAL8vNizEoWGlH+m9evG9F0h5x4ut+t3y+PhmqrtkVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fvKsGj1WpAsDeA3D0jQlEtBadfw4csFgtMqYizDBVP0Cb34aRNCjjQIvPd/9f/dWkaWwBHtrrqpaLjeDFJvEqzGMLEd2WhmirvoVTyW633tykFjACbbewzD3O/EgC6RqZrUSmMnl4k/GsupGNNBVc5GuSlqvayVwEkH9rsGf5HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SJvMdc5O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iWYd3CYw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN4LvPi1356377
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ltnrrI+3PK4TiGwpuOk8vKM6xutJZYHE/BDVVm8V/uM=; b=SJvMdc5O5yKAyaL/
	r6uX6nZELqqvBZTep4RiyARo4MWFwFA9pT2ErUOPBTGibrs4QPbzjm99EPUPe5Jr
	JdTwGH3viVOciRPf5oiJlamPmrDUGfLirDO7H0t15sikcUVTwl5RlT0xaEBxvrE9
	1brGuyC1Dt64QRKQ7SWbPDnq7XgGPcJBjynENLZRl5xQi55DA7N4txv0BUqyJHYY
	9jjS+g351cYIwBk4VWfXwwpo/2DAQTrqkSqhF0cGBy7IpEBuaq6b3VaU7DASN9Te
	nSIXjswS1InWB8bS0NCNHsP4g12E6Z6nRwSiEYT0L7/c0B2oRGAatYwzUAHWnVtu
	YVjM4w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b78xc2q5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:39:37 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7d481452732so9499250b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 01:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766482776; x=1767087576; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ltnrrI+3PK4TiGwpuOk8vKM6xutJZYHE/BDVVm8V/uM=;
        b=iWYd3CYwXt8SamSCezB3634G/o0qDqTGB5c3t4bUkjAqYJdxFy5H6HX5qSaUA0DDdZ
         c7P2LkPAx0tYpXwQ+JDppfMV+609QCbgHglnq5V3ZskhB7jURATpnjSMnEJz5j79zw6V
         PrDmKlYpB2LLyOpz4vac3eDRX55mXzVaw2dLl5T8tYQAAQs5CSN8Pv4qvYpH63GW66Ic
         +5vLoI6Q/w6aSz7fCT/0/8sYPhNpZFnkClMy2PGpks+oI7f1sQQ23SW6AtFCGuUMbOJc
         8eyYDxDeHfFh1woYh/isv1sUF1VFucCjuZNMhpfQLx3ef0wxCYQiqNq9Kdw1b9zs6dXp
         A68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766482776; x=1767087576;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ltnrrI+3PK4TiGwpuOk8vKM6xutJZYHE/BDVVm8V/uM=;
        b=d4JYlRnIbkBwArRRBiN5YoX9P2ytUHl87V7FM8O6GwJ0g3/ju5s4raFAnwFpia1IAJ
         fT+b5kKnQoFpIEv/E/Hjujkv5/k92FU8XE20q9A666Osb4Oy1T1W1jXubVz/fudTcKIT
         BbvQ1O/r8wtDTLePLRdPsnKQAkSGeE+b94TQmPqEzhiamNyiHVG5NUOVW3lMxn1ncjV/
         jPfb63pbxKnFl2yAeIRuVWI2ZhMaK+MvK7o1IRdBDNkcfcDR+Szkb0xdKGmcPVDbyNAl
         sEYYoBWg1MWfsV/OSUeDYbP+PNoFU2pvbXMSBIJru175TtM+9hAiFSxCxGlDP63VaITV
         LorQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpNAVBRBpTdV9Ru8WfKB0d9t2FNRwjFmK6UxmsPrNOcH8PqU4jifFgY9ThvKJ1tvgr/Dc61rS2PWKg0leV@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk471/hUIREBmehzfSRhG2Q2uRGFk8x9+mqg4wvLUvRfWVS0e3
	4bvvC/B43u28V1TZQ763T7qlyev45Rblu/Z4v5/GeAFD54U4YzbMtnPnW+uY+SzVibXxym9npDV
	Jr3n5gwl0ucldEWKS3S2v5KJ6n/v+AOMCXxV9lNYSNwkVKjoZzG2OCCBF64zS/EB2lCO1
X-Gm-Gg: AY/fxX7+juOQpIpvfmwAyR/WOfunBUQWlsQCEiwxL6Ym6Wqc8YVqststIRf8SRcQF0e
	qJ+zPi0vQ9Dmh/hS/8TSW7Ypqftla4MsNpA1cr7jdt56ELsrFrxUEDIdX0AmRQHEmO3wMQCfHyM
	hBvquiRDEQgsKkWJPdCGCwsztXUsCUytKFD5bIjuUD2hEgaK4fsZ7pvG1O3KIa7/0yWRBZoJPxT
	buT7U4b3ETRdmlP5KXHsRA+X7D1CMdQx1HyLxKAUH6SKGzn1PPreoqvkywuQwdnkopRsYsfTclQ
	ePGqGY0qn4Byv4XyS10/00RyRG7t07GFaHqngSyN7ZlMZUQCBFrBwEzFWk+FlNAh84QOrMqPESI
	o0C/D0rXeb4rnFff8+ZZgu0E/bRQQsAaiQzA64l5o
X-Received: by 2002:a05:6a20:729e:b0:366:14ac:e202 with SMTP id adf61e73a8af0-376aa7f0d14mr12264281637.64.1766482776217;
        Tue, 23 Dec 2025 01:39:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVwlRdEP6DXgpjdadPBcZWyCly4guoBHOf0x/UtW9KheuofYH7G5h+sDzt46E0I5Q6mJCSWw==
X-Received: by 2002:a05:6a20:729e:b0:366:14ac:e202 with SMTP id adf61e73a8af0-376aa7f0d14mr12264262637.64.1766482775709;
        Tue, 23 Dec 2025 01:39:35 -0800 (PST)
Received: from [10.0.0.3] ([106.222.229.95])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7c627f3fsm11837818a12.31.2025.12.23.01.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 01:39:35 -0800 (PST)
Message-ID: <a90943c6-0e7f-51cb-05d6-41e131797196@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 15:09:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/2] media: iris: Fix fps calculation
Content-Language: en-US
To: Ricardo Ribalda <ribalda@chromium.org>, Keke Li <keke.li@amlogic.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251216-warnings-6-19-v2-0-12075e3dece7@chromium.org>
 <20251216-warnings-6-19-v2-2-12075e3dece7@chromium.org>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251216-warnings-6-19-v2-2-12075e3dece7@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HP9lU4FVSs6WZLGifYs_LBmFkJxHFWFD
X-Proofpoint-ORIG-GUID: HP9lU4FVSs6WZLGifYs_LBmFkJxHFWFD
X-Authority-Analysis: v=2.4 cv=cuKWUl4i c=1 sm=1 tr=0 ts=694a6359 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=oASd5UHybYt+Hs44tZ/i0A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=cm27Pg_UAAAA:8
 a=OC_TLObswgNljWciDgcA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA3NiBTYWx0ZWRfX0i3A97JfALcW
 z4+rTfdM1nEMl3i6Ig51aRBJMeSDGYPZAUaK7TDGoq0kDCvMRq9d9wt5SGsQc0WHWnOUId/ez6o
 m1c+twjBfiEaMy0OWdKqHaXAylhfMReglzlMbgDtp8lK/u3Fmog/xsaB/sOnBt9qMG9g43rFPjj
 /3VgcEhOdgHFhtUfB3auM5jTB2Nm593hrwhxG3ppJhkEk0aNNW8vjnBAxkJ2Ytap4ywrtQO5BGd
 grDLo3Hwq53lCEsUTykoax4Dii0rHniQWq1mlgyJrKhNjsogtdLLK944Ld7204KB/wSOSmBct9S
 hQl9N4/ODnPYFvJRpfWX/w2lYTGAx+ej2c3kzxaWvl+oSx2I7555MLaGAJa5IF9KS+QK4KbUk5W
 UpU7Gli+ndawf2V6Job7ypAaJu9nsLsOvhkRGkyfTLu4V+XUprRP7lMzS1M7Ni+Xv/oDQxtUM6n
 rbNVUtaNbD1+kt4XisA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230076



On 12/16/2025 9:12 PM, Ricardo Ribalda wrote:
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
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/qcom/iris/iris_venc.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index 5830eba93c68b27fa9db87bac63a691eaca338d2..3b941aeb55a2f498898a27a5f8cb58cdb26fdfed 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -382,8 +382,7 @@ int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
>  	struct v4l2_fract *timeperframe = NULL;
>  	u32 default_rate = DEFAULT_FPS;
>  	bool is_frame_rate = false;
> -	u64 us_per_frame, fps;
> -	u32 max_rate;
> +	u32 fps, max_rate;
>  
>  	int ret = 0;
>  
> @@ -405,23 +404,19 @@ int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
>  			timeperframe->denominator = default_rate;
>  	}
>  
> -	us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
> -	do_div(us_per_frame, timeperframe->denominator);
> -
> -	if (!us_per_frame)
> +	fps = timeperframe->numerator / timeperframe->denominator;

This is wrong, should be timeperframe->denominator/timeperframe->numerator
Also I think it would be better to clamp the fps?

Thanks,
Dikshita

> +	if (!fps)
>  		return -EINVAL;
>  
> -	fps = (u64)USEC_PER_SEC;
> -	do_div(fps, us_per_frame);
>  	if (fps > max_rate) {
>  		ret = -ENOMEM;
>  		goto reset_rate;
>  	}
>  
>  	if (is_frame_rate)
> -		inst->frame_rate = (u32)fps;
> +		inst->frame_rate = fps;
>  	else
> -		inst->operating_rate = (u32)fps;
> +		inst->operating_rate = fps;
>  
>  	if ((s_parm->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE && vb2_is_streaming(src_q)) ||
>  	    (s_parm->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE && vb2_is_streaming(dst_q))) {
> 

