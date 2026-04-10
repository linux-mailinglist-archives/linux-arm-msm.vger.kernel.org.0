Return-Path: <linux-arm-msm+bounces-102668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEq3ErPN2GngiQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 12:15:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E63F3D583F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 12:15:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBDCF30053E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513EE342510;
	Fri, 10 Apr 2026 10:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ix+X0e4r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LS6TnZd6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6BB344046
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 10:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775815819; cv=none; b=TwOecRcFNGJcfrlnIZXyWsiunnRAut7UMnVREDl/vvblbDj0JKilC2jAP+BRbKLaqXcrz4ghPDoJmG0G8D9qONSQe5nsNoV0eMTKVLo/ZRdol0MvQ5p6fDNe+AJjQs04w/H1SEeqKQsEkPeT3WXGt+31q43i/ISw/IhGzsETm/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775815819; c=relaxed/simple;
	bh=2OV7x9Lv/OakKlu335yqsl8m0c90dxHBGy/Fy/fnXyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aZAqocLbkaV1DM5OfP+8hVjsmkjDlAnlgZhG8fUvhkB27pQzmTYE5rKvr94I5RIoJHfVD3tml4537ZCzj/3uPA3AFnlq+Avpe8tUFb/2lCefzK/PbankK0j2sqvHzs5Pc0lTqS+NR3yg7GHxuHDeLIk2JQyesk+apJZV47pLqy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ix+X0e4r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LS6TnZd6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5o2j9707656
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 10:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	50pbHWz5L4Ep8xCFcd58OKxaduUzmduABDRD2HJ+f0E=; b=Ix+X0e4rkdPbgHYr
	zpWv3zUVcA28HCEeq6DsnoGa99IPyAyr1y9FuDaC7MzX5uIgSgEDf3GrQHCo5pTa
	DDIo5JycuxVzgp1CcnNjCCd33iJ4WVetTFEtHpGy7KPXf5xf47s1VB5JSipftHrD
	4ZKiv12DPbx5JybQuGr9m4QEB/RU4WNNarcatZHaWcBmc7DTWbd9Ul/aGlSEhn2e
	LpHWHm3yusK2+0FE+IB+zsOQQ3i7HYfWUr2d6Py0oTySF8dC8/Qi5OfKzrl2X+YD
	8Zf5VaiVmTnTO0q1azpwp0vybK4X/0mG4hNxRrmsCk+v8a+iB7+YtpiMUTBvjC7G
	nPLz9g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudj0y2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 10:10:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35da8eb0553so2098747a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775815816; x=1776420616; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=50pbHWz5L4Ep8xCFcd58OKxaduUzmduABDRD2HJ+f0E=;
        b=LS6TnZd6Qtb35KRNh8i8F/LVpRA8EIAqOlwZTEYZW0uDJ/shDJI2777MQHsQWLJO5S
         c6D1EDff999hQL1xKjAmBf3fYAigHOu/CL/UxZKZfmYIeit1u8pUMGGRBaQJO82vIGbN
         2ItfcFhJXHRcy0wkCWm10wuNoxrGp8YC2Pdd7IC/LhrrHBuafzlYNWeWOPLulOygfLh1
         T7y9ksOud/THbMPUZuMWnquVSkN+R6NF41/TbCO+tRFsOJb7Z8XLRxeD5yutaQuyOhBm
         vzKN0HyzdatwNTIBsxdpd00SYM1gsljWnae/pa0Q1C65ZMdOIx/3GENBrNNgHBoWEXme
         BKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775815816; x=1776420616;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=50pbHWz5L4Ep8xCFcd58OKxaduUzmduABDRD2HJ+f0E=;
        b=o7yykAiqMDK0yHNpAhmY+qbTPApN57jyYteHFuLjj2KWHZxC83QQ0Tm8wwEWcy4wIg
         Bf9OD3iUcr24Lcp68mv7p1ZNhVdYQTWuONq2cT7m/T5nMw6lyIgcXKnCWMsdUMWT9uGS
         6l8NiFxz4uUTBNo+AWK41cxfGZACS6njXnT1d7cITG63u6S4pDR9HnJiS9PRVUXookrm
         WT0YqXPY57jswRC6B3bNvJX0uNVHat/JIj312L6fltejlb3q9o8/dl5sR1cnR95TWtyE
         VP8VwIWkDjVmLjVtQ1AGqoM36w9OsFactLqbQk4BQsg52irV5pOEQvDHiY5D64DDs+ZU
         /adg==
X-Forwarded-Encrypted: i=1; AJvYcCW11iz0KB1dpVW6kqzuVlAmeSQHGrP1CjDPG1D2Y/mawxuSCyNe0ZI9iqX5AhvmFMOf0pR3S+nP+VbikXVx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2YJpN71Hy0KZdiPnMWTkxOtVGAwyqa7wXQVRWwlkWwfqnCv2I
	NxuUSyporGpzbbpS8tt1dseSvG3kmFLAgzOHqSEBrCN892Wvro7he94grVNIB0Fweji498RM+ur
	cRH/kCDHv3bBT+MXePjMsCNsc8kyissAiKuOUWjtkQEmWngiDuNQ54ATCt0xuhNa8agaK
X-Gm-Gg: AeBDiesu2n28KfSatIR2shTeR1wP5sW5+N7BTU9JIHNUIutTuKsZoNxfyPkyBNS9hJE
	Uk74VQSYfwevVmZYRMfBGV3DnZNnKsqb2SXUzYgLPoD5UsDdj+wPDxUt2W0Qpia9Tvjmlv0L5xN
	4/yHvcUeSiifakDEQrXd1eWj/FjexGzXFomhM4YOu40vwazx6kP9hFK+HAkMrmUp7Zu3pl7f74i
	z6OpTksH/DzdNk3kr2jzkXcLACnJoBF8uphUOV6bfC6EG1mN6WA/BvZ1uxxVcoEFisGft6hC8VA
	+w9nporL/iMgeFLWx++T8RoOaG7pL3NyRVVt8ESHmVsM9CoyjiaG9PBlYkXFuPZ/leJvpmg9RJ9
	pyM2SNfgJQ6pFvvrGNonyuF/leqybvZ8+coYCuWINoQjRNlcDhF1TuAs=
X-Received: by 2002:a17:90b:4ac2:b0:35d:a559:5c0a with SMTP id 98e67ed59e1d1-35e43022d4cmr2068889a91.6.1775815815743;
        Fri, 10 Apr 2026 03:10:15 -0700 (PDT)
X-Received: by 2002:a17:90b:4ac2:b0:35d:a559:5c0a with SMTP id 98e67ed59e1d1-35e43022d4cmr2068850a91.6.1775815815046;
        Fri, 10 Apr 2026 03:10:15 -0700 (PDT)
Received: from [192.168.202.18] ([106.192.36.31])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e34fd383dsm8291028a91.6.2026.04.10.03.10.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 03:10:14 -0700 (PDT)
Message-ID: <99eb55a8-6370-bf7b-f9de-e88231454b0e@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 15:40:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFC 4/7] media: qcom: iris: vdec: update size and stride
 calculations for 10bit formats
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
 <20260408-topic-sm8x50-iris-10bit-decoding-v1-4-428c1ec2e3f3@linaro.org>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260408-topic-sm8x50-iris-10bit-decoding-v1-4-428c1ec2e3f3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: p0SWbkvAqNwpJl5eAeQ9KR_nxTV-Bw2B
X-Proofpoint-GUID: p0SWbkvAqNwpJl5eAeQ9KR_nxTV-Bw2B
X-Authority-Analysis: v=2.4 cv=cKfQdFeN c=1 sm=1 tr=0 ts=69d8cc88 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=NP+XTJQPoO73HiJDCNFURg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=ry5-__lr15mXsCcL3A4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA5NCBTYWx0ZWRfX3CiJJ4NkjDKE
 0iEKuS31SqiRbACzF/IdKqw2SbuFDxRS6bZBNva5DISzEqAky547/NMncDhzO4EJf/t/JYhgb6L
 PqLaok61aq12+HlnjJ1Shun01sEv7BR93WIQWJdXC/mrCGUV5C305BlFXUp3LGd47Ny+ZoOba3a
 X69SQaNaGWo5FvjmWyhi7ByvOGW4d87JySKph4VBjZ1F920O8IpQ44zYC3cWAM3895PHaqr7e1W
 b9RgUrlD+pXxQyMbAzAsuMfZwd33D8YBJ4t1ecN0NwKKENZPHiG7h5ZNUYjPrGfkFYfYtQ1ZqmO
 wAI/2tC3zEZtEnC61XdDOyMzCKX2jyE6lSPPUyafSDmXn4gBvWpWaZQ19zcHmAXQvSK1q4pB98U
 339Vcm4AgWJogu0lFgpgEgyVlTuEhLYrerspaTJON7sAiRHEBAhaz5oZlUK5IYpfbizpWRZODSq
 Tb12czqVVg/GGoq56VQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100094
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102668-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9E63F3D583F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/8/2026 10:13 PM, Neil Armstrong wrote:
> Update the gen2 response and vdec s_fmt code to take in account
> the P010 and QC010 when calculating the width, height and stride.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   .../platform/qcom/iris/iris_hfi_gen2_response.c     | 19 ++++++++++++++++---
>   drivers/media/platform/qcom/iris/iris_vdec.c        | 21 ++++++++++++++++++---
>   2 files changed, 34 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 8e19f61bbbf9..d268149191ea 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -542,9 +542,22 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>   	pixmp_ip->width = width;
>   	pixmp_ip->height = height;
>   
> -	pixmp_op->width = ALIGN(width, 128);
> -	pixmp_op->height = ALIGN(height, 32);
> -	pixmp_op->plane_fmt[0].bytesperline = ALIGN(width, 128);
> +	pixmp_op->width = pixmp_op->pixelformat == V4L2_PIX_FMT_QC10C ?
> +		ALIGN(width, 192) : ALIGN(width, 128);
> +	pixmp_op->height = pixmp_op->pixelformat == V4L2_PIX_FMT_QC10C ?
> +		ALIGN(height, 16) : ALIGN(height, 32);
> +	switch (pixmp_op->pixelformat) {
> +	case V4L2_PIX_FMT_P010:
> +		pixmp_op->plane_fmt[0].bytesperline = ALIGN(width * 2, 256);
> +		break;
> +	case V4L2_PIX_FMT_QC10C:
> +		pixmp_op->plane_fmt[0].bytesperline = ALIGN(ALIGN(width, 192) * 4 / 3, 256);
> +		break;
> +	case V4L2_PIX_FMT_NV12:
> +	case V4L2_PIX_FMT_QC08C:
> +		pixmp_op->plane_fmt[0].bytesperline = ALIGN(width, 128);
> +		break;
> +	}
>   	pixmp_op->plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
>   
>   	matrix_coeff = subsc_params.color_info & 0xFF;
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 719217399a30..ca0518c27834 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -272,10 +272,25 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
>   		fmt = inst->fmt_dst;
>   		fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>   		fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
> -		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
> -		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
> +		codec_align = f->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC10C ? 192 : 128;
> +		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
> +		codec_align = f->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC10C ? 16 : 32;
> +		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, codec_align);
>   		fmt->fmt.pix_mp.num_planes = 1;
> -		fmt->fmt.pix_mp.plane_fmt[0].bytesperline = ALIGN(f->fmt.pix_mp.width, 128);
> +		switch (f->fmt.pix_mp.pixelformat) {
> +		case V4L2_PIX_FMT_P010:
> +			fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
> +				ALIGN(f->fmt.pix_mp.width * 2, 256);
> +			break;
> +		case V4L2_PIX_FMT_QC10C:
> +			fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
> +				ALIGN(f->fmt.pix_mp.width * 4 / 3, 256);
> +			break;
> +		case V4L2_PIX_FMT_NV12:
> +		case V4L2_PIX_FMT_QC08C:
> +			fmt->fmt.pix_mp.plane_fmt[0].bytesperline = f->fmt.pix_mp.width;
In the removed code, bytesperline for NV12 and QC08C was aligned to 128 
bytes.
In the new code, Is that alignment missed or not required?
> +			break;
> +		}
>   		fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
>   		inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
>   		inst->buffers[BUF_OUTPUT].size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
>

