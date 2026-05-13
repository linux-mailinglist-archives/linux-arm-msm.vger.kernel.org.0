Return-Path: <linux-arm-msm+bounces-107452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJPSCI/PBGr0PQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:22:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1DD539DF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:22:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25ADF30970DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A46D3B19DB;
	Wed, 13 May 2026 19:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cwHgAQEa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KrRjvr3d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24707386568
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 19:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699117; cv=none; b=Gca175AlkRIgNDddTwtv5+zvk/en7oWCEXeDIPOiH+0tA7xJXuBkUjKbgFj4ippZPdxjcyJcT/DLPT/mdGYPkWH8M/G1e6t+cXOC0Func61R67TMidoPeZcIlflNaiLPkhGGf7QVRIZWsfzSwm9Qx3lSeJuMq3mtiO7nj/FNjg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699117; c=relaxed/simple;
	bh=SsMEpYID1WZuHEUR4hkzsm614xCESsi60+Qk0Myfzhw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VwXGLb9fnkyrN779QGenD58OuxCivR4sYnbOLJrLtvu2fWSKXrb/d73UvqKfrQybWzAecVZaJuODwB/lz4kewQW9ePDCFC7hxTtNwt+u497o+qwLCHq4Yb/dpXAXdqDpOroiGrunYsZiK8nCMceM+DAGhwQTzm0z5UXeGZSJqXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cwHgAQEa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KrRjvr3d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DH4CbI3430137
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 19:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Or8akwE4D0NRx487mlVzo9RIPU7uXy7D4zODRsalfzM=; b=cwHgAQEa5TXbPXse
	493kbAU2TlCNbddXH/HeDEvnnQWPnBWKoq7kFK+E96ujTjG1BokgmTSeSD7PnsnT
	PDhE80JYk/2lLUKo/6kLwWceVUTXLciYOa9quMc4Aa8q+CPwQuzszWiXvQhgPo8x
	gqPFzimCUZQsby619rE1oa4/AJvq+8wMOB98JEj5D7/C3iMbdAqciJ6PuWTTpsb6
	NZsvWbe3JAs/S0BHST7pFACBlH4Eymlno7brpkE39vcFgVeuXcgKshoWCWgEddZq
	ING3Rixvj+HrthkNSONQ0YNDL5LXyx97vJJIvcyn5sAJ4T6/HMv2GcEKBG2gZEkd
	TRee2A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmcj2nk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 19:05:14 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82fa1c94b37so7815485b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778699113; x=1779303913; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Or8akwE4D0NRx487mlVzo9RIPU7uXy7D4zODRsalfzM=;
        b=KrRjvr3dnLhqk/nFw0+yX77CvL4lDZ11VhJ40ACpMGYMmsOq6kJNfSZxYibFqEAHo/
         cXskE3Usi1eialnCEhdF9AmM1jJQA3fCEbwmg9g8yG90P6frmSQPoLlL4Ihibu2NKKkS
         eOHqK5U2P/1ozyl1NRYvDwbs+qmlF0JRzhal588AgNE2M5h1yZVXBpPz8JEgcb3/OLKe
         KHwMrH32reqnM9gUec0gS6CkJynh1Gj2e2JU457Fq9wHX6t2s9YLpgI96DnINgEqyf3s
         wSc97rqwZRFw6QR/41HKgEawU9MOYTJAWCQ8Fm/PTsy8FXjhaFmloXSaUlmcjQSaobAz
         VeHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778699113; x=1779303913;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Or8akwE4D0NRx487mlVzo9RIPU7uXy7D4zODRsalfzM=;
        b=m4kjEnoGayijmESBAK/3dyBFjmvmSKCwAnHWRg22hmmG1GobqUVw53WCaJkeo0FJOT
         aiSDo2Pqw6L7cHYWh+Z33f3qrOA6wrAjxv7JFgczJSKuIdo9FKQM9l2zQHe5Fu3UnrkR
         0bYVcLgwwQ7A58cjKVfUyBIkCHCKG42J+1uJhgn5C4X77ReQ8Kw1RYpergtOzgYpJCB5
         pMGMoIxcizsDWUy9wmkWt5WTQh/lMdqntWE8dT5aExTV+/S74R0vMfNG55mUYAjC7Pga
         YGotorQkaIqq1OLjqNHRgSG/tYDiS21fXoC/UOf1y4VWIos2JTg4mEhNNb2C/7fO+DPV
         0D+w==
X-Forwarded-Encrypted: i=1; AFNElJ8mTAVIyvblylpymEUqV77h0J9H/B1mH4hHMxB3QB30gVFMgsz11MeQIWtGqHd0SQkllJUBNpcOg7ULTrlx@vger.kernel.org
X-Gm-Message-State: AOJu0YylVipjwL8/LWVhjNfZvGTB2FV6E1P6HEjpI+dotgIWDA5pxMe5
	C+qAGYeDOyTlDLQO7R4+IbHU6jfUPk0hN+/L98+Ih17jHg2OaoOtaVNqZILk+wjvuL7tB0hyMgd
	Cw43eWRJXwsclLYsRD2MKg3OmVv0WIOrKIRTPGB85uLGZ9L3gwd9Fm/OzQr6lW8tGRLvxYyX8Oj
	jj
X-Gm-Gg: Acq92OGtHWcrsgRk3Yjpb59mInOxCqX5ojYkq7L3346k5ImDcsBsqNoWyp/5h5VtRxL
	te2XIgGYbjpmE5s7auhnOvO/5CCegG0otBLlWrrpR0I2TyH159cjhWuC5dZ+vpleFT1iv72NnbY
	bN52Fq6Cg5FhF+69qfBxePWy8TP7dqb6Gv3Bp5WfPpBUiFxSihhRJpar5mNVzR9sQrTEB/w1txK
	SqQhs7vc1oGsV4MPHKyd1g5VW2pLOcJEHMis889VlCeXPcsI/O2xC9h9WoEb6P3BIOtwcP8yDU4
	1I+MJMu35nx1//6jWLGDYobW47EI87tA1cE6bBchXr8xRNcayU4SIbHYsu3WUiE4oY8MNaWC249
	hYR/uuZQgue/RwX98l7i1xGhfl1Dskne2Q6+rSvHGNvMKYEHFBTwoyX/+
X-Received: by 2002:a05:6300:210d:b0:3a2:f05a:795e with SMTP id adf61e73a8af0-3b0bddf8f0dmr731606637.3.1778699113188;
        Wed, 13 May 2026 12:05:13 -0700 (PDT)
X-Received: by 2002:a05:6300:210d:b0:3a2:f05a:795e with SMTP id adf61e73a8af0-3b0bddf8f0dmr731567637.3.1778699112673;
        Wed, 13 May 2026 12:05:12 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.255.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb0ff4easm5121a12.18.2026.05.13.12.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 12:05:12 -0700 (PDT)
Message-ID: <8ee8e01e-fc55-4786-9c28-48fb17bf2a44@oss.qualcomm.com>
Date: Thu, 14 May 2026 00:35:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] media: qcom: iris: vdec: update size and stride
 calculations for 10bit formats
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-4-7fc049b93042@linaro.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260511-topic-sm8x50-iris-10bit-decoding-v3-4-7fc049b93042@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YyKbkH99JfBGHJ4MzhpwqL784_LLNFy9
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a04cb6a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=6GFGFuPpdQFN+sW0UwB+2Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=ry5-__lr15mXsCcL3A4A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NyBTYWx0ZWRfX6xhwOC2FUQGS
 6gsmihQu2tXlMDNYwhaOMf1T+FFL7m4+t0OwYPntxXmr088Luk/8NPuBQieu8fXBlHulFy0OT6q
 f5pZ+R+rolWvy3YKTVMj+tG/k+jSSaVGq3Dod/nU+kXWClCTQjiyunfJ2n+5Q/A1WCK7ypF19J4
 /ohRMwmbHKs8Tn+BokNM6BMXnxH7sMMUAmrrC0yQPwroCTRPj1OxABnzxRWBoLjNn15IAYmmJbh
 s5jLqZYt2y7zPf6MVrcV5tYMbF4eOT3iXacdpooYWg/F2VUrgP+htlbKC1KOBQ1U1fnJ9NDbWxm
 aJdUhYOb0YNRDaYjdkVWIed8qpBSvhr+GJbOSPlPPfpqGSqn74sDt+vHtj4KQDdq/p9C5FjaRWK
 qcsWoMDC3G3DzJnT0UIqGZAeKcrOzCRTRb0djkIjQ5DqhSlTTArZVW9guu6ks2CNPRPcT/ACYKT
 ca9V1424AThLWEfAJKA==
X-Proofpoint-ORIG-GUID: YyKbkH99JfBGHJ4MzhpwqL784_LLNFy9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130187
X-Rspamd-Queue-Id: 8F1DD539DF7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,linaro.org:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107452-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
> Update the gen2 response and vdec s_fmt code to take in account
> the P010 and QC010 when calculating the width, height and stride.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   .../platform/qcom/iris/iris_hfi_gen2_response.c    | 21 ++++++++++++++++---
>   drivers/media/platform/qcom/iris/iris_vdec.c       | 24 +++++++++++++++++++---
>   2 files changed, 39 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 8e19f61bbbf9..0541e02d7507 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -542,9 +542,24 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>   	pixmp_ip->width = width;
>   	pixmp_ip->height = height;
>   
> -	pixmp_op->width = ALIGN(width, 128);
> -	pixmp_op->height = ALIGN(height, 32);
> -	pixmp_op->plane_fmt[0].bytesperline = ALIGN(width, 128);
> +	switch (pixmp_op->pixelformat) {
> +	case V4L2_PIX_FMT_P010:
> +		pixmp_op->width = ALIGN(width, 128);
> +		pixmp_op->height = ALIGN(height, 32);
> +		pixmp_op->plane_fmt[0].bytesperline = ALIGN(width * 2, 256);
> +		break;
> +	case V4L2_PIX_FMT_QC10C:
> +		pixmp_op->width = roundup(width, 192);
> +		pixmp_op->height = ALIGN(height, 16);
> +		pixmp_op->plane_fmt[0].bytesperline = ALIGN(pixmp_op->width * 4 / 3, 256);
> +		break;
> +	case V4L2_PIX_FMT_NV12:
> +	case V4L2_PIX_FMT_QC08C:
> +		pixmp_op->width = ALIGN(width, 128);
> +		pixmp_op->height = ALIGN(height, 32);
> +		pixmp_op->plane_fmt[0].bytesperline = pixmp_op->width;
> +		break;

client facing api, good to have a default here

> +	}
>   	pixmp_op->plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
>   
>   	matrix_coeff = subsc_params.color_info & 0xFF;
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 99d544e2af4f..eea69f937147 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -266,10 +266,28 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
>   		fmt = inst->fmt_dst;
>   		fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>   		fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
> -		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
> -		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
>   		fmt->fmt.pix_mp.num_planes = 1;
> -		fmt->fmt.pix_mp.plane_fmt[0].bytesperline = ALIGN(f->fmt.pix_mp.width, 128);
> +		switch (f->fmt.pix_mp.pixelformat) {
> +		case V4L2_PIX_FMT_P010:
> +			fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
> +			fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
> +			fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
> +				ALIGN(f->fmt.pix_mp.width * 2, 256);
> +			break;
> +		case V4L2_PIX_FMT_QC10C:
> +			fmt->fmt.pix_mp.width = roundup(f->fmt.pix_mp.width, 192);

ALIGN ?

> +			fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 16);
> +			fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
> +				ALIGN(f->fmt.pix_mp.width * 4 / 3, 256);
> +			break;
> +		case V4L2_PIX_FMT_NV12:
> +		case V4L2_PIX_FMT_QC08C:
> +			fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
> +			fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
> +			fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
> +				ALIGN(f->fmt.pix_mp.width, 128);
> +			break;
> +		}
>   		fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
>   		inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
>   		inst->buffers[BUF_OUTPUT].size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
> 


