Return-Path: <linux-arm-msm+bounces-104046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLKYMumS6Gl9MgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:20:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC230443E11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:20:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 43980300D574
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 09:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3C23C1994;
	Wed, 22 Apr 2026 09:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y9OyY0gT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WSSlt8Ft"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AC53C1980
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776849591; cv=none; b=gwOkf9c2A+Gh1b5UHefH2+522hApjCV+5EUY4ma9rj58lFfGQ44mHfHGDRLDKefnWlziXStcFhTKtm4dsreddyGP21DAoRDNhzlabaLW4H+cHT5Z3/4pn+S1/e5lXVdvjXbv0pfLTG8K17XxlkiEYGW/TtLth188bDLJUjPY3Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776849591; c=relaxed/simple;
	bh=OU16C1HTkym3IfdB5lCI8qt7OkcoXSWAACgHpoU/kWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NA0HWYHYdilyQt41fC7/KyWPsgvjfl4G1IWUrvKbb/CVqef4hKwjuKgE3S9tZH7ZCni36JazUP0fcnhnsUrLigx5ky5kDIyqot3UtZFEkVEh7dNrNMnfR4j/EbpTYnzCEdy8I6ZkBmrjuwp37wOR9IrR3H2veW3lswm3Mx1T2PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y9OyY0gT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WSSlt8Ft; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5PhZP976184
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:19:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4E0FN1Yk5HSKpQZofTPLB9G3h9HECmMhC7Z9bAGYFWM=; b=Y9OyY0gT0qLZT926
	6Mq7+swrv0pW3UgK0IgYfWrKclYYHIC9DkmXzjWSYpo4fP+aIWMY75tB5ZXPQ8oK
	ESIOhmRaorj1ygbFhf6Xd5eHE5A/gdXAdfxwbAvsHjh2om9UHfPa810wc/n2Q/T0
	CQny4oxGtiMxflD16R2l9yxxISIKkgGK3atWlY3/ttr+uPfiMeA7Unzn3FlnjLe1
	zYxSsazuMJKA+LWJSLYcRa9TfZzmM/7R4dq+pTy5BPYF7BDB4qUjBYJmLxr6Lf9C
	C7761YjCMLlKd9cpsYE2bV8CRgG4uBZGixOhKuHTDpWmxP3GPipcid4pMo1CFt26
	m2ieGg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenearm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:19:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c6e24ee93a6so3393403a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 02:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776849589; x=1777454389; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4E0FN1Yk5HSKpQZofTPLB9G3h9HECmMhC7Z9bAGYFWM=;
        b=WSSlt8Ft6hQo/98wHyW7kHtMFtdAHTTX3ILUW9tYznMMk8wD+nf63ceV7jcMvw7p+K
         bch+0iZkWLS5tuE0q2Iq0P8F5OTy5tslVIW86YdYeIwQauLGEwuYgMoPdfVgOhoo5U8U
         B/+92/aOWnJdUZmGOkm1InHVWX1pi65Txc1Xg1gj1JlmqPJViwME8oiAmZpl3ynQUbXL
         SQU29T3TtE0Knl3P7N+LjhxkgF/0ZewstWEaPIZ+dOWFk11YlJBubSeRyc7SfYM94NyG
         fUI6e9O+AYZdUTak4nyteUMETaIivvmMJA9IteYrEcKz0ve14gXA9/shCVNlDvr1LXm2
         IevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776849589; x=1777454389;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4E0FN1Yk5HSKpQZofTPLB9G3h9HECmMhC7Z9bAGYFWM=;
        b=rKbjM6mUvE2/sFTAMUz9s+DkC46J1zchR428cSnuR4r9k6yTO8RkMlapOzqzwa8xjZ
         sDIPd1WmVQ0cZC/jq9p7X7kL3JhJCjfAj5CzOGB/rfGjIJf9cU0AlpG4nPzgFV4MYVQz
         45ieXbJxHfgZnQ/+964987N+YXsGv9oCAjY+f6fh33GdGbE2rcjUOFXwJXl7nOInfZyd
         glrAFCDE9DjCBil0vohhl99g2b6Ky05jmm7YmKFwR2LsGLaBg0XW0G/emqfXVT22SZzP
         +I6/RUxf3K0piRenfbNsF0221j9gKDTengcWI/rP2W7wi6HtUvVaobVBmqPmws2E25G+
         ht2Q==
X-Forwarded-Encrypted: i=1; AFNElJ/vg8j0WJL8AlmMPcanF91QWJoqv9fSto2K7zLU+aom1QdYT46I5R3uYrhI9yVbdjXD0vUtNKWXl37Y4Jas@vger.kernel.org
X-Gm-Message-State: AOJu0YyXqL8N8U7gmZ8as7a7Ih6W21+Rlp5zgsEOi8PGMDVnD+a40gx0
	NoL/sMqNnilrnbyI3eHT4OYQbOsqvvDW3HoAEEiFqMa6FZL5rsIbqw8uem2/WA1Gm9j93s16UJ4
	F2SM/vUwiPNu3tXO/Fs/sAwPoybI3l4D5X/B+QcG0ZY/kfq/Dy+l2jCefwcxzEjiaKFc1
X-Gm-Gg: AeBDiessvaCm8sdYaqgi9nERlcCplnGBBudwVLRh3G924OO8mgDeZmpFyCzrE32ngXS
	zMYY5mlVdcWMevqeMKi1xIfK90M/lXVfz0+Ryqfb/yGI2EYDX7AdGnyn6FXEa5FOU61UdKamVmW
	Oq98vwFnpBE05tz7Nw8G9fXEk/SNtn3I8Pieh2FeKo1Vj03lC4MfL3ybc0ffnHmr4KM69s/hhL7
	v91C7SxIA28IqkfNLc4fJPTQf+EpdUJ/VcMIjbB5Sxd5iC+xTXrF7l8iYejhrIpqpuajNsvWrP0
	aWAVsUjwhCCcltrcFB4bu8tN1Fwgv95aPj0z6+cvE3gtkoAzXf6ar2c94l+IJTOhtdalex66/6T
	29+mzTr9u/+jYG+3CI5swG28M08PhktFnqtBnsYfuFKDjBOHNfGj9JfMrFyvQCR1O
X-Received: by 2002:a05:6a00:230c:b0:81f:5acb:55fc with SMTP id d2e1a72fcca58-82f8b38a39bmr18780298b3a.10.1776849589250;
        Wed, 22 Apr 2026 02:19:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:230c:b0:81f:5acb:55fc with SMTP id d2e1a72fcca58-82f8b38a39bmr18780278b3a.10.1776849588754;
        Wed, 22 Apr 2026 02:19:48 -0700 (PDT)
Received: from [10.0.0.4] ([106.222.228.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9cbb1dsm17981983b3a.14.2026.04.22.02.19.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 02:19:48 -0700 (PDT)
Message-ID: <1c15d57c-d4b3-bf0e-0afe-17573eb41a1f@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 14:49:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 1/6] media: qcom: iris: add helpers for 8bit and 10bit
 formats
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260417-topic-sm8x50-iris-10bit-decoding-v2-0-c987b65a31d5@linaro.org>
 <20260417-topic-sm8x50-iris-10bit-decoding-v2-1-c987b65a31d5@linaro.org>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260417-topic-sm8x50-iris-10bit-decoding-v2-1-c987b65a31d5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA4NCBTYWx0ZWRfXzYIZDpB5VA/K
 659AQA06h2bQS2cQc1/O3URttqbW5MmY3POBZOLYhhT8AqX8TGTVmn6EBuIs6tW4n9xAJHoWpEu
 A8i9JcmKsYZ3kiJbs58RRLZwLGTSyGQmjeFvscmDPQWdTdFSkyV99IzDtiV9/4jmwLb6+50L7pc
 vp+rd/DW01Ve62/ShL0wgsLUHH9PHkXnPwp21Kg/k8FHeCdygsE8RUC9s2PBS/ls1HrB4BQyK63
 feGSJjg/QGQPp47UlTcR4FHhWoTBDWVcLMOwqctTKjKRrxAY70U227ArcUSN3NKFTKpIM2u0jkt
 RiCFgLP4WF7Q0XTZVdPrzMaOxTZixpB1BCP9wRPt7fWYVaGe4l0fBBb1xHenC7QXo4101IWUTIp
 iCu/HcGt0vCRN324Q4warcawDlyFsJbB2kwCQG7ek7qbtmjhVZoZyb8w/jgT5Na3ox8vpt+flaI
 1/MXEddW9IH+9Tv47Lg==
X-Proofpoint-GUID: -2cclCsxlbm4IYjsbWG8GeWNpDCvXbuQ
X-Proofpoint-ORIG-GUID: -2cclCsxlbm4IYjsbWG8GeWNpDCvXbuQ
X-Authority-Analysis: v=2.4 cv=RoT16imK c=1 sm=1 tr=0 ts=69e892b5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=rP2ZPG2H70Gfrv7XvIldxw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1v4LsqrUVehaW6lpU9YA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220084
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104046-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: BC230443E11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/17/2026 3:07 PM, Neil Armstrong wrote:
> To simplify code checking for pixel formats, add helpers to
> check for 8bit and 10bit formats.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/media/platform/qcom/iris/iris_utils.c | 12 ++++++++++++
>  drivers/media/platform/qcom/iris/iris_utils.h |  2 ++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
> index cfc5b576ec56..bdedd6bfa87a 100644
> --- a/drivers/media/platform/qcom/iris/iris_utils.c
> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
> @@ -38,6 +38,18 @@ bool iris_split_mode_enabled(struct iris_inst *inst)
>  		inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C;
>  }
>  
> +bool iris_fmt_is_8bit(__u32 pixelformat)
> +{
> +	return pixelformat == V4L2_PIX_FMT_NV12 ||
> +		pixelformat == V4L2_PIX_FMT_QC08C;
> +}
> +
> +bool iris_fmt_is_10bit(__u32 pixelformat)
> +{
> +	return pixelformat == V4L2_PIX_FMT_P010 ||
> +		pixelformat == V4L2_PIX_FMT_QC10C;
> +}
> +
>  void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
>  			      enum vb2_buffer_state state)
>  {
> diff --git a/drivers/media/platform/qcom/iris/iris_utils.h b/drivers/media/platform/qcom/iris/iris_utils.h
> index b5705d156431..35337c5da005 100644
> --- a/drivers/media/platform/qcom/iris/iris_utils.h
> +++ b/drivers/media/platform/qcom/iris/iris_utils.h
> @@ -45,6 +45,8 @@ bool iris_res_is_less_than(u32 width, u32 height,
>  			   u32 ref_width, u32 ref_height);
>  int iris_get_mbpf(struct iris_inst *inst);
>  bool iris_split_mode_enabled(struct iris_inst *inst);
> +bool iris_fmt_is_8bit(__u32 pixelformat);
> +bool iris_fmt_is_10bit(__u32 pixelformat);
>  struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id);
>  void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
>  			      enum vb2_buffer_state state);
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

