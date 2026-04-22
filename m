Return-Path: <linux-arm-msm+bounces-104045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FbFCnmS6Gl9MgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:18:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 774D5443D84
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:18:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9AB6B3059FE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 09:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 393A93C1969;
	Wed, 22 Apr 2026 09:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WmUC8Ag7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CmK6bnLy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08383C13FD
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776849223; cv=none; b=LLGlu4YWIB1MUAbbI4LI1HRn3KW8XuGJExz6hrBeWnY2f5P82vWicvjuNK7DkTFmdexhpcDRDgOwKuIgIBcPxy37v79SOIGYQdAFFljDiLl8BtYTLZzYLpgM+IhHAb6VJrfBXtBHFHp2HUd9tlKFX52/9Ux8BuN9qUHeXzks+Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776849223; c=relaxed/simple;
	bh=D+5UgMgWMIDxvfMIXAumusVZuoLTVm/qXDr92m0TzTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YoC3ZeL1pIEQNaIj9bLOMsPd4r9tBVwbX1rb8dDW8LTh1Jcl9qrX3AjgdKJVQGmbHtWU+6Xea/lVfq6Y5EfBSrtEoTRlVn3LwIVhPycpsUokchXu3ij1NDZxR950KjkpNs+l/kzz6rWJFLzGPHDpP+D2fXWI7Bzkbe/I1nYFxCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WmUC8Ag7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CmK6bnLy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5HXPt2123749
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rU/aIrnL5E4EEtWlfuu817RS3wEfk8XZfHo7ZxYzUhY=; b=WmUC8Ag7cg4P/r0A
	j6Quh4st8wCiWU1sZ5eHhs3n4SpmexAYphydoYIKgyNtrdNB22aQWHJYG+zQW+f9
	hnAECXkkXy0Tj4ryaKeERe28qkXuMh+OH8zo4do44ov/VwPzD2jIQ85puPlHtW7j
	XTKiE4TXvwUvToFF1GQOusR0qSc0yW8z3mWMWHr9221HvxO/0jQjLwhvE91XVQ5M
	Ve4fgi/UKbdHogWIOaVQCKfX2/fIyHUyIhN0tIogfqa4OpbfXbsgt6bO5TtX74WC
	BMQZICDbDalops2zbVlmnoD9oglx1P21HhksjFKDjsn9Qd8HetaWgXq2lh5MhjbG
	zIw4Jg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenftnp7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:13:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24cd2e2b3so49291425ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 02:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776849221; x=1777454021; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rU/aIrnL5E4EEtWlfuu817RS3wEfk8XZfHo7ZxYzUhY=;
        b=CmK6bnLyiQp3COcR7UY/e+xjbNU4yRsht4FP++HqzPLi6YVvzQ3Y2nD19k9+fIsNCC
         QYk8eaDP/NfeEt+PbWG2D3TDVbFW7m7utg6mg98W9Eba+6VfmL4geM86I915cvLJznxc
         bcpeLpXJ7ON70nEu958sBVT2i/l+PcnWXwxx+zxSoHRlFd1KwyEBXImLX5lbu4No/Wpb
         W17E1A3LoS8SoILJDchcIeED9Wjq5WBc4nRUdQ7z7dDUf/Xu2WWmraEuC0gvpfsybQPV
         b1abea/RxENw50GIuLLBMEkcIR5RoyG2+Hm6uuOddVNjAdtY3PiUbeU3GUT4SfEW88Pg
         fguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776849221; x=1777454021;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rU/aIrnL5E4EEtWlfuu817RS3wEfk8XZfHo7ZxYzUhY=;
        b=Xg/I5Bi1Wd7iLGBCZdbWRmsd9pqCZVL2vLarsn3NKptIVK8Kw4Sk2BuPzuyhwwyjra
         pPn1VSP4jbpj2GY28Lm4cerUEEQk2gzvYqxUcaD57oJZWgDIRtvNQ/kr65Y1DUjeZ+UU
         k1K5h+QOyr+BG94n841BxJDAern/UbhqkF8n2ij/GP5UQPozN40Hxj0nEtL7zdoCBlnI
         vEBVcFeLG/bL5bWU3cYm4MfcfIQXQiYdYrUfdq6xzUW2Vu17/s+VH7skVdSE3FCoYosG
         cOUm15ibS7XKNMdMbmSi50YMwL9Ef4k565CM44GJ614muq1W0XlnwEO2FRK/OWDzgL8+
         Lp6A==
X-Forwarded-Encrypted: i=1; AFNElJ9Am/R9PkxQ0Q1ulIPEi7jnOOJ1AkQOL+aq9EJdlTN7LwHBNylTCYmsrgNuYjg+Axtsa6uUedkbakSvzety@vger.kernel.org
X-Gm-Message-State: AOJu0YzAbhvXXDC8jS3mQm3ABG0qc3dgpDhG9F8gmz9Fa57wd933Nu6z
	vkFIlo6HFNTjRqLI9mVZnzxE9NGKr20foJWWM3TD5H9XdnL7+cYwI0OMVL6qjkHRubGteaKcMsy
	e93C7zCmnmyM3bkMsF5EsMxeM6Sd4ej1DQc4bmXe4w7VQ5PKrqqfr1KPywgTadxQbn73T
X-Gm-Gg: AeBDievYZrrqutT5937v4Us/XAFpH++/jDzHEtUOyFp0lLQH8D2MUyCkE+dqaz9nsun
	KkWobR7dJnRzmSqSr5OAbY5mI44Sdt9jZr1H+big8KZrXZlZGc7heka5zO0IrPHwQtv2iHj/z5N
	OGuOkXQUeBvySCGdqAfBDt4i53/fSI1LkPgdHt/ylAdx1rTy8/Z2P7BcZWqe1wsPsBWERs8xwaJ
	t7OGRa5CviecSLqK+GYDgKUSPUndmfVzoG8LJ8vzHXHlEf+rcLQ/IaBkdPXZQsy7PNWX8x52cwA
	Ea2t94EdTrTdQxXq/0Q1OpSLTEYROC8xG7Tt4z/ooWeRSq/tsbJYkGGEkSxVQMgbBR7dhqPnuRA
	BV9t+05weo2TZ62jjqnkyTI9GZyyQNrG0Q6vjdsYn8mWH2hcl6Nb+aPxEIPDoBiiA
X-Received: by 2002:a17:902:bf41:b0:2ae:4a4e:1e25 with SMTP id d9443c01a7336-2b5f9f5c1c5mr163764755ad.25.1776849220086;
        Wed, 22 Apr 2026 02:13:40 -0700 (PDT)
X-Received: by 2002:a17:902:bf41:b0:2ae:4a4e:1e25 with SMTP id d9443c01a7336-2b5f9f5c1c5mr163764495ad.25.1776849219564;
        Wed, 22 Apr 2026 02:13:39 -0700 (PDT)
Received: from [10.0.0.4] ([106.222.228.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa507cbsm164034525ad.37.2026.04.22.02.13.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 02:13:39 -0700 (PDT)
Message-ID: <568c51fd-a229-0cd9-815d-7461606beb60@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 14:43:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 3/6] media: qcom: iris: gen2: add support for 10bit
 decoding
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260417-topic-sm8x50-iris-10bit-decoding-v2-0-c987b65a31d5@linaro.org>
 <20260417-topic-sm8x50-iris-10bit-decoding-v2-3-c987b65a31d5@linaro.org>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260417-topic-sm8x50-iris-10bit-decoding-v2-3-c987b65a31d5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OdioyBTY c=1 sm=1 tr=0 ts=69e89145 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=rP2ZPG2H70Gfrv7XvIldxw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=hsJvx-B6qgcxRBDfHDcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: gPRn1vKfi2cyBq-5zf5lCmC3oN4cALgT
X-Proofpoint-GUID: gPRn1vKfi2cyBq-5zf5lCmC3oN4cALgT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA4MyBTYWx0ZWRfX4A0+4LlwcAHP
 rAMzE+ORzqbCbGXLBk2bsEY2QRkWlwwkE64Pid9zEbXK0K49zIrA7HCfAqRsj93ZHJUPj+Aq12N
 ufeo9/r4PfpwL3SwUxk0s+ye063G7rqWDMBLNSpI/2i4Szlt4lRM+77C6XaY4mQq4TmdAbYtoaF
 gjnY+1GK0MwkaBNSnec1Y6HNTGCAsgw1rxfoVhibiboCc9LrRixnduDJ72iI1Mw0PJpVEflvNtq
 tLFXq7i116BRW0qpbCiimdsCPaHkmOwgLvPjH4DWAKEjjg4aXLq8T7U1BSUZwYKEuHxELJWeBRl
 oZ1YvzVLo//JsZntKtq73xpnrE1XoUMLRc9u+wbCD3CrGa3uEk3us9OsTX4YFP2jmvD5B7AVPVd
 zQCeBj7tEAou0qL1WSyn+JpqZda7mxZjdn4HaV5ZH6/fWO+HoxVfOX8YfuLf79k8TbNVwZak6+o
 kbH4b63er8EjgkwuexQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220083
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104045-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 774D5443D84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/17/2026 3:07 PM, Neil Armstrong wrote:
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
> index 30bfd90d423b..d664e606e886 100644
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
> +
> +	switch (pixelformat) {
> +	case V4L2_PIX_FMT_QC08C:
> +		stride_y = ALIGN(width, 128);
> +		scanline_y = ALIGN(height, 32);
> +		stride_uv = ALIGN(width, 128);
> +		scanline_uv = ALIGN((height + 1) >> 1, 32);
> +		meta_stride_y = ALIGN(DIV_ROUND_UP(width, 32), 64);
> +		meta_scanline_y = ALIGN(DIV_ROUND_UP(height, 8), 16);
> +		meta_stride_uv = ALIGN(DIV_ROUND_UP((width + 1) >> 1, 16), 64);
> +		meta_scanline_uv = ALIGN(DIV_ROUND_UP((height + 1) >> 1, 8), 16);
> +		break;
> +	case V4L2_PIX_FMT_QC10C:
> +		stride_y = ALIGN(width * 4 / 3, 256);
> +		scanline_y = ALIGN(height, 16);
> +		stride_uv = ALIGN(width * 4 / 3, 256);
> +		scanline_uv = ALIGN((height + 1) >> 1, 16);
> +		meta_stride_y = ALIGN(DIV_ROUND_UP(width, 48), 64);
> +		meta_scanline_y = ALIGN(DIV_ROUND_UP(height, 4), 16);
> +		meta_stride_uv = ALIGN(DIV_ROUND_UP((width + 1) >> 1, 24), 64);
> +		meta_scanline_uv = ALIGN(DIV_ROUND_UP((height + 1) >> 1, 4), 16);
> +		break;
> +	default:
> +		return 0;
> +	}
> +
> +	payload[0] = stride_y << 16 | scanline_y;
> +	payload[1] = stride_uv << 16 | scanline_uv;
> +	payload[2] = meta_stride_y << 16 | meta_scanline_y;
> +	payload[3] = meta_stride_uv << 16 | meta_scanline_uv;
> +
> +	return iris_hfi_gen2_session_set_property(inst,
> +						  HFI_PROP_UBWC_STRIDE_SCANLINE,
> +						  HFI_HOST_FLAGS_NONE,
> +						  port,
> +						  HFI_PAYLOAD_U32_ARRAY,
> +						  &payload[0],
> +						  sizeof(u32) * 4);
> +}

I’m still not convinced this change is needed for non‑AV1 codecs.
I’m concerned this may be masking an underlying alignment issue, since this
property is not intended to be used for non‑AV1 codecs. Even FW team
doesn't recommend setting this property for other codecs as it can lead to
wasted memory due to over‑allocation and padding.

Thanks,
Dikshita

