Return-Path: <linux-arm-msm+bounces-106838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAO2LOpqAWrRYQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 07:36:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69ECD508405
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 07:36:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1ABB30138BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 05:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F0F1375AB2;
	Mon, 11 May 2026 05:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dy9mG3XN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U8JbwEgh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54CE37418C
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 05:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778477777; cv=none; b=Iv2BFz2I7KmLDX7G/qo34WLtTn0pp/KXwtbcyb0s7g05FS+yx43NIy3oQPVt/RExekF9uAfj/EkZertGt6uneVY+An2Q0okbC/sga4n7lPA9MVUS20fX4sfB5KXqvcHx2ICJbEZnpcjCwcM+4qIoPYXgyLlRgFpaMN1Mir8GN0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778477777; c=relaxed/simple;
	bh=5dpMoIDo8QFJZI7yckDZQOv9pwPa7xc38aibL5K6lfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rZda9AAhIhLVzhKJjVfB8fNizOgO0X35mSK4CJyQcSTE2AHoHfuRCENNik2MDD7Ykq5bexMdQGTeIYK8sJiDHb/Luk8SbIvQQQplD10ul/NQHFIPnqNUnhSPwPdvvR0V/JH69IVatYhrTFKcCHVMSI3RtRf+vPYHxrOA3Of0LNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dy9mG3XN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U8JbwEgh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ANuZ3S2369594
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 05:36:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zn3q2tB3nrSjUhvYSb/f7baTDkPRRFRJ7mu22VCIqMA=; b=dy9mG3XNSCXhW11w
	8CGPXQoJKAbhbSfiAuIO1KaSh6vLKbWZhrViBJFaF3ae/kPif/ZQk766bPI4bpI2
	1JSV4ed9VW3YRrG4jFQMxKiiL3iqhvruom9lLONRuOo0YKJduhYFc2lVGyvWDjKq
	y7MxjA1mBWyyU3YVVBad5mnn//rXsn4TaBhbHNC4/Pl8ZlrkkwZbhReu+ClgUxRg
	QOOxifWqsUUKb21OZ/aFx1bTmtOnxkHOlpi4tFEkN7HYpCfE7jetQi8DWB3DcdnH
	ifCI+4ta0LcxZ8SUt7/HkqdyUslNLCCXZPd8LvBhGsNFG31155ms2OKqy1Z49ybe
	nvaveA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1ux6vpy6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 05:36:13 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-837d0d71c61so2341954b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 22:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778477773; x=1779082573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zn3q2tB3nrSjUhvYSb/f7baTDkPRRFRJ7mu22VCIqMA=;
        b=U8JbwEghb/W+P/OqPYQ30zZhE92PTBaDCAYU6FoTbTT5o6SVDr9WOQKwq+hjZW0CuE
         CNDRKPl5fpCteNqP39ztlhYfuT1BGMqlJVS3U5HnYYELcEaYIbcLMEDnMQ/36o6axVAz
         2no8q/5IaiSrOINW8qh2sTPRI/VqAwfnYZycu9kIFgPc2pKV9Kq6AH+8+QeCzSVl+WRL
         Ir05ACltFjUsL9mP3x51bwIUbJ6iuu5qYIQyKVRAnbVpNGzh8d7NPNVh2Y6on5RlPMDR
         FYzcYrFzgsYk3/KAxmqNvZ7kmNOWqNgc09acwP7hkkaYg7lMvJIInmjwd4RfFLpAO+DL
         ZLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778477773; x=1779082573;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zn3q2tB3nrSjUhvYSb/f7baTDkPRRFRJ7mu22VCIqMA=;
        b=PdtAc5Q4qAmfPwrp634LDuXiZ/TA67h4hYvO6kvJXpScAwzekpJC4HZWOQk/SiscZw
         idrvGQTFDqd/8x6cX4hnF8cm185cdQYFamPUtp3VuRWoFh+0yUNJMGcWMiseRqAXGrDT
         Bd4tExrhnHAaN7/bElbB7g3Jie/fyIm0LCe/0Ve7VuZoJbB57biQ5of7h0OBgYlVnlbv
         j1B0xYlrOuEvemAsjmC2JLKEB2oWjN8DrG0eTH8N+6hfC8F6Xvk/NOa417E3/FfHBCdL
         ufxTjKUBVhsj2Wk9QjiT0r0Q/cBunyAuCfpmtBf3BftH8paskswu5WToXB4oGqDe7+8z
         Rb0g==
X-Forwarded-Encrypted: i=1; AFNElJ8AGTVdiwI9Zornd9QwwVTadFj4QdwJfbZQYWcfF2vLNKvmhAx4talHPvH3sTEUvIAkd39cXdpREtXQiAwp@vger.kernel.org
X-Gm-Message-State: AOJu0YxMaYpEHQ8mza9HNfjE8Wd17GFodmRizys/l/PnVZIsMIinWYJJ
	CBNd8ntcPtmcnAFAUviA4NIEZqegNYpIY3ElJMXOqYzI07g5MiloJRQASCBAXpJF7XpvtZm0Umh
	R+banYZOU4Dhu/OnV4Ef50i0EOmfhnPJbzVSHgnfVMYMHUqAY6DepArwEJAb+F8MY06AI
X-Gm-Gg: Acq92OHGrEE0bX4GyytkCnMUgzCoyQUg8S+mxTOvCwqUthwfRmdpHalLIqKxBb22FC4
	F/l0IGU0USauFhpX8Zf0c10IqodM3yOLnI7cVbTkE8wrtKOgy5D+SfS5V7kIMstj/ZuisXdfm1S
	FynLlRed2PcCIh9IMlV5su1g5LVgHLswa9Ky+ECAAE+xJqkR03t7+qzcs4j2/snG+O6KVsQyXWz
	U0sgI8aYxbzh1YkPT0rejbTSjl3rWkyeONpcYnsccRrZgJNRk8WP4PpNynP00EXbDvVsyge2Dcl
	AQVGFfE1D2AiZfJRVeNmJZXwjlac4SRa5xWIVzmfD6eTIQ7iU8/Tt+tgmE4kcE2hjs0kKB7HOr2
	JSNw0m6hdQwgBl1ALitJ8X7EoG9RwNBu5v4C+wTfK1PhsKaUccp7PeQ==
X-Received: by 2002:a05:6a00:4c8c:b0:82f:5c3f:94c6 with SMTP id d2e1a72fcca58-83e3b2d95bcmr7811192b3a.28.1778477772825;
        Sun, 10 May 2026 22:36:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c8c:b0:82f:5c3f:94c6 with SMTP id d2e1a72fcca58-83e3b2d95bcmr7811159b3a.28.1778477772349;
        Sun, 10 May 2026 22:36:12 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbcf16sm21971929b3a.40.2026.05.10.22.36.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 22:36:11 -0700 (PDT)
Message-ID: <20dce5d6-bcb6-e844-8bb0-257598c62e90@oss.qualcomm.com>
Date: Mon, 11 May 2026 11:06:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 02/16] media: iris: Filter UBWC raw formats based on
 hardware capabilities
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-2-d22cccedc3e2@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-2-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA1NyBTYWx0ZWRfX5mMFGDe6sMAP
 t51MkuLP8gR4X8F2HNChFnubVVdSFrTMavr/4P24Nw4B3/EdSdEfiOxjXwLVQ5BnTAl7mMMHOge
 Mq0aMPnDdtP4098kqtbq5Spe+xA9088jtZYKYxpfanY9rcFeAjD/GqjmWNYVafTyXIgVvuG+Cer
 b9cpKIN2TgnJ18evwfDZTHwkmDcBRhr1i466Mfye4e2wPQbXU965SwXKt2bQ/WgA5h6RHBxhDxq
 Dw8sGtyLDd60pK0ZcQq1bOBxySHb7d+Rw2pRBnNUC9SSxwitaXMuZTl5DklkeimT2xqsU21UEMH
 gm8UR8FcuNMFsR+7aZt1LWU6b2zM15U24pArEEj/zhp17EMxvl3LvYOJHXagxtqUR+pX63D9r4A
 9YmNBgY93UkF2HzPd4ny4ltCG+7DS06tRrxKMYzusRiLIh7cYVkb+1lF4vbkBiBgvI0MnQoCCNt
 3ZiwxADlmhbIx1/8/Ow==
X-Authority-Analysis: v=2.4 cv=QJZYgALL c=1 sm=1 tr=0 ts=6a016acd cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Y1NcAbc3FcPegVIdFrsA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 6vmUBgxWU8xC1mjU1DOMT4vXoUGYkQzr
X-Proofpoint-GUID: 6vmUBgxWU8xC1mjU1DOMT4vXoUGYkQzr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110057
X-Rspamd-Queue-Id: 69ECD508405
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-106838-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> @@ -100,6 +105,7 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>  
>  static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>  {
> +	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
>  	unsigned int size;
>  	const u32 *fmt;
>  
> @@ -111,6 +117,9 @@ static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>  		fmt = iris_vdec_formats_cap;
>  		size = ARRAY_SIZE(iris_vdec_formats_cap);
> +		/* Last format is UBWC; drop it if UBWC is unsupported */
> +		if (!ubwc->ubwc_enc_version)
> +			size--;
>  		break;
>  	default:
>  		return 0;
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index 2398992d0596..c41f4103ccc3 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
> +#include <linux/soc/qcom/ubwc.h>
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-mem2mem.h>
>  
> @@ -97,6 +98,7 @@ static const u32 iris_venc_formats_out[] = {
>  
>  static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>  {
> +	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
>  	unsigned int size, i;
>  	const u32 *fmt;
>  
> @@ -104,6 +106,9 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>  		fmt = iris_venc_formats_out;
>  		size = ARRAY_SIZE(iris_venc_formats_out);
> +		/* Last format is UBWC; drop it if UBWC is unsupported */
> +		if (!ubwc->ubwc_enc_version)
> +			size--;
>  		break;
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>  		fmt = iris_venc_formats_cap;
> @@ -123,6 +128,7 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>  
>  static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>  {
> +	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
>  	unsigned int size;
>  	const u32 *fmt;
>  
> @@ -130,6 +136,9 @@ static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>  		fmt = iris_venc_formats_out;
>  		size = ARRAY_SIZE(iris_venc_formats_out);
> +		/* Last format is UBWC; drop it if UBWC is unsupported */
> +		if (!ubwc->ubwc_enc_version)
> +			size--;
>  		break;
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>  		fmt = iris_venc_formats_cap;

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


