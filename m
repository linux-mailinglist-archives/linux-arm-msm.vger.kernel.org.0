Return-Path: <linux-arm-msm+bounces-103477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBvODDHg4WkKzgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 09:24:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D289A417DF6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 09:24:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B4F93030B11
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 07:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81DEF32E151;
	Fri, 17 Apr 2026 07:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K5+al1qC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f2+Ym+Bq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2755C331A46
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 07:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776410579; cv=none; b=rtvnd3MsrpWbKN7oyM75LWp0GS32BdLporZ6tyjuOh3wv1m8O+LFEtx/I4J3O9NHgLq2ZfrPy4akrJnNv+vMkNJMElzUEcW1R/hFPNgJkjl9Ak/y34mgBQyb6vRrlgqAZrfa1SDIp6ECYauMPVWKXU8ESV3wknqvCcyaRz8amXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776410579; c=relaxed/simple;
	bh=UJgzyvp8IsFYlpKz06IFX+wXpWmB7rGHydrnTHw/5Qc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A38sraHJA1C6PJzd7nRitVSCGzHqwA+J1VHGDcbuJKBnwrB5R9DtEVSSqiXuNrnxet+l4YgNODnExYIa34JcOkGLpSVSB7/OvoxEtK7geeMVM+JNKL8MXCuz/FbnCBnM1qUSktvG4DYRDubZwalA5SAg0mao/rh5rbJaRq63naI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K5+al1qC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f2+Ym+Bq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H7AWQv3438201
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 07:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wlzWYEhWl+ZJwHWIE9kkJeytw0Lnh1NUX+uLXgzgrds=; b=K5+al1qClvJTL8dT
	NiLyLOD1AdLebM+Acm/RJmPQ7T45RAbHlpAh/9zPdQYWviBeK3rBSnR3JnE2CcKg
	F9T0V8yqEW92Eq+S89nGpzqtJOKB43the83n1xZn13xASWs8Asj0EopqWBrh3GZO
	i9wbWgnxunUU+Naxs378my4TQbiHYI/0D+jwxlY2SW8c/mAClI4naZc3/Z8ba244
	nLOnvGgSkmCew/wpmgeVfmPIuf+ufk0iKSMgj3AC4ce6AZmN1lnqb90PNvGQyvgG
	Tssl8rl84aIGAW+8WjDtkrmhlT+wGo3eoiBeKDPkRJSTUhcU+4Sqsr4Hv214Htad
	H6Pgnw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkg88r19x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 07:22:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354c0234c1fso428310a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 00:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776410576; x=1777015376; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wlzWYEhWl+ZJwHWIE9kkJeytw0Lnh1NUX+uLXgzgrds=;
        b=f2+Ym+BqQjEGEGu0glkV0fWK0tDDr54UQb8aFbpNZjlDdc4aiTg+DBfPHR5122x97S
         HT/PwHisW7KXJoNFSoOxPR9nvgSy4Jy2WSHJzUJAlMLhqB864dlL4/ngYZ3F7o2jIxSV
         icubXsBQSsmYUiVzZiOnUkEJR4KlQC3tdDqXA7hMsic62UvK/7oTA/+k+oUZO62nUlnA
         o1Ocq8Y4FSG79StRqqvNEseQCOUj6DTKMwjmB1sPIAKfOaj0pX6lPNmZGVx+CoSB/MMj
         m7H7SRxwzt5enY83o5e+AV3nDTWTImlLGRbXW21HNLd7AGnXgxQKwZJv+jscaAx9Ze8n
         mx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776410576; x=1777015376;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wlzWYEhWl+ZJwHWIE9kkJeytw0Lnh1NUX+uLXgzgrds=;
        b=E6EZbmerPsFCRcOInFW9uKFkfYfK5fedElPW1+ZWV0d5gqZ8CjSpMOCs02w6K4bA0b
         OTKBt7wcuPfLzqd42nqm0DoCBTF2wQ/VnNW4DQTjN4FGA5jN1Xf9wtuu9lPx2zAMpcdU
         bFAtiLXH8IHfSlk2BzJWn9VNy4lD+MulsW10JqBN2g37XuIvgvAjJp3J309D2L/24vJt
         ksiswW10LZ6uHQfiPatnkDT93fdYM/2SO+a1eAyY0JGzwX0oEtEUn17P964+2oLLLv4T
         oMYEZlF6eU4d1yTc5R8iPuttPpptacpZVoEymkIofo0Fj/gbPo6c61yON5KZ2pshAwqA
         Eb7g==
X-Forwarded-Encrypted: i=1; AFNElJ84febHv69Gra4nfIXi4IL9nlk6jMfTVlvJ4kof1gqcR19lud8091thsXquWm0MIaGYiVHoLCCHPp8EwVYD@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3TJzdUx4osRTyisc4rJkynxofZabLKh0bjHKgtel7gQe29q4z
	uRrvTr2rjOe7nPtws56EVyYpFJv0HQc1nySw33ASWo7rXA0Lw/YxpjS6w5cUyIm2tHyDwuXokU3
	2lYVbvSrE28wotadhiw3Y2mntQr0THhKkLBFqkiCJATlhcVBCSL50W3efu47dOJtzTLmC
X-Gm-Gg: AeBDiesLUGLmBuPCemDgo8lFHw2Xm92bKC2+rwg3tIviapWGE+I1ejCorzYcdQI7ENL
	yZPeUJRL2APHFEn6Jj/fCd373LpcnD4xI8cCTLKIT+TWffVy84svqJTdROrJ5EJWm37moBbsiIH
	5Vyk2Z7IY1ebaWfNyuEOe5xLtYu1O36RC0w0Zyp3n5OpD3lXdsPklOyTDLJDs6JfyR27LUwsgQ4
	r+ijMZ6LSUnlU9K9UlE+9Zd6rDknGZ2XQxbBB985wc680fg310pbf9syfNE3DxEtVvC9gD+g5KC
	uv4TSmpWenYPjM5oNCznRyIGeBUujjjOOTVvAdju+4yM1tQtKc4CuuNLnb6UW7xYQ0s6yT0L8Iq
	tJ1T7CSz5GhRewySbN/EMXaIEhAmKQq8DbU/+xHyXoywzXr4iX7XiyyFu/dqST9nX
X-Received: by 2002:a17:90b:164a:b0:35f:b572:ece3 with SMTP id 98e67ed59e1d1-361403bd001mr1808889a91.6.1776410575890;
        Fri, 17 Apr 2026 00:22:55 -0700 (PDT)
X-Received: by 2002:a17:90b:164a:b0:35f:b572:ece3 with SMTP id 98e67ed59e1d1-361403bd001mr1808850a91.6.1776410575311;
        Fri, 17 Apr 2026 00:22:55 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.231.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3613f5766c4sm622269a91.0.2026.04.17.00.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 00:22:54 -0700 (PDT)
Message-ID: <d27e1500-ac4a-01ac-084e-bb53aa1f63b0@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 12:52:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH RFC 2/7] media: qcom: iris: gen2: add support for 10bit
 decoding
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
 <20260408-topic-sm8x50-iris-10bit-decoding-v1-2-428c1ec2e3f3@linaro.org>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260408-topic-sm8x50-iris-10bit-decoding-v1-2-428c1ec2e3f3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: e9netrHTPicgLruCUyAYYGxBLKTKco04
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA3MiBTYWx0ZWRfXxbHwg5CwKKaX
 ittla8lTbg9fexFzMo+NnzCid5ye3k4BmetouGkFgZaDNkWTh6aLBS7+Y8DUnZi2Hc0BdzlUGfd
 Se8iwo5JkvFjJ/ORkx89GLl0KBY2AxaAeucil2linjSzJ9uxx4x6ZkgscsUwbeWIIKwuEFavT+E
 ujbnMXSY7iJI6+wYYfXtzXf3wJXrixCSegfn28UqqnMSkjU/HruH9CRV8mVPelE7JC/d3AIJUqo
 VcX+pGLKuuNyW0XRuxu3kCiJwyRNc0CpyrnOtM1Irp5V9OjHl73yTCOe1ctl9XB0RReRmBKaTXh
 +hMjXU5K4QI5Mn0pE8hCy9SsiqrQWLOovTspMD5ZcsU1Ag7IA/s4/JYKCW4XA1HFVCdCBCNGtOC
 dCecVXubyCh7bl+6oy/WCQ+URgvo3p9Ll6lckeTAats5uhPvHVutLcsHjAERXnUOPBomF1BAw6X
 occ6yuQ+Q5bdvN7xfnw==
X-Authority-Analysis: v=2.4 cv=X+Fi7mTe c=1 sm=1 tr=0 ts=69e1dfd1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=llJV7PLoYzplBNayqe3woA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=VRqzhRILX_6Jt83UIxkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: e9netrHTPicgLruCUyAYYGxBLKTKco04
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170072
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103477-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D289A417DF6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/8/2026 10:13 PM, Neil Armstrong wrote:
> Add the necessary plumbing into the HFi Gen2 to signal the decoder
> the right 10bit pixel format and stride when in compressed mode.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 71 +++++++++++++++++++++-
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>  drivers/media/platform/qcom/iris/iris_utils.c      |  4 +-
>  3 files changed, 72 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 30bfd90d423b..8e547e390fa3 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -481,8 +481,20 @@ static int iris_hfi_gen2_set_colorformat(struct iris_inst *inst, u32 plane)
>  
>  	if (inst->domain == DECODER) {
>  		pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
> -		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
> -			HFI_COLOR_FMT_NV12 : HFI_COLOR_FMT_NV12_UBWC;
> +		switch (pixelformat) {
> +		case V4L2_PIX_FMT_NV12:
> +			hfi_colorformat = HFI_COLOR_FMT_NV12;
> +			break;
> +		case V4L2_PIX_FMT_QC08C:
> +			hfi_colorformat = HFI_COLOR_FMT_NV12_UBWC;
> +			break;
> +		case V4L2_PIX_FMT_P010:
> +			hfi_colorformat = HFI_COLOR_FMT_P010;
> +			break;
> +		case V4L2_PIX_FMT_QC10C:
> +			hfi_colorformat = HFI_COLOR_FMT_TP10_UBWC;
> +			break;
> +		};
>  	} else {
>  		pixelformat = inst->fmt_src->fmt.pix_mp.pixelformat;
>  		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
> @@ -517,7 +529,8 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
>  	stride_uv = stride_y;
>  	scanline_uv = scanline_y / 2;
>  
> -	if (pixelformat != V4L2_PIX_FMT_NV12)
> +	if (pixelformat != V4L2_PIX_FMT_NV12 &&
> +	    pixelformat != V4L2_PIX_FMT_P010)
>  		return 0;
>  
>  	payload[0] = stride_y << 16 | scanline_y;
> @@ -532,6 +545,57 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
>  						  sizeof(u64));
>  }
>  
> +static int iris_hfi_gen2_set_ubwc_stride_scanline(struct iris_inst *inst, u32 plane)
> +{
> +	u32 meta_stride_y, meta_scanline_y, meta_stride_uv, meta_scanline_uv;
> +	u32 stride_y, scanline_y, stride_uv, scanline_uv;
> +	u32 port = iris_hfi_gen2_get_port(inst, plane);
> +	u32 pixelformat, width, height;
> +	u32 payload[4];
> +
> +	pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
> +	width = inst->fmt_dst->fmt.pix_mp.width;
> +	height = inst->fmt_dst->fmt.pix_mp.height;

This HFI is only applicable to AV1, you might see some corruption due to
this. Please check.

Thanks,
Dikshita

