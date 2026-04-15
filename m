Return-Path: <linux-arm-msm+bounces-103229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEMBHXoz32lqQAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 08:43:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9067400F6F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 08:43:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B3CC30B4B73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 06:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEDC5390988;
	Wed, 15 Apr 2026 06:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gMRwnpvb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WHL3VjMJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FE9389E02
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 06:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776235149; cv=none; b=h9TmAAH9E7puEISlwMR+TMtuUWbXmcRd/B5zua0oFN0nDOOjPGKqw7iA4dIWPmt+3gfuMJHdTuD/CuzmjclgIkMkZhoQQn0jRD5q+YpOJJ8OgEf5KA8Dup/QqGVEwZ4jf9HE4upnCRV3VR/D6gCaoBfzfhlQFh/0vVz2YZsZWgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776235149; c=relaxed/simple;
	bh=vtQ7cauf2a30cH0wbYRSCeQJZjnkFBDa7ZqMd9jfows=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pyqBtY8ylOgDUMMxWkh/IzvWDkeS26AG8k5eJdF1uHSoVJZEuNg9rnciTadGvpvGBlGdvMPtUXgOGECKBjU6+HJ5796BBQhCNVNgx3YNm1jnRb4cW3lb/VVobFFrSWeQ9gO155sd6wTYk4cfOpQQSaLIo7+iPggpNlamt0vRpOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gMRwnpvb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WHL3VjMJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F4VvDb3059053
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 06:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tcqevKYcvLQFkBP6SAaO9TMJY403tMBt0fptayYFG1A=; b=gMRwnpvbAvZv9Sv8
	UKFJvLJri4y7j5qkpR6U/pbL8QC9ZqLNmnpo/gbiL+WUJ3W0HOFitWIByFTOC9EV
	+r/dzy6Iv3/VKhs1Rs2mC2vHsqjC/u0GtEZuvgnO10aM2rW1TewYp3pUmpKcWf04
	OwoqGEIrnP+hOKDYFn8l6HkYAFYC2gK11l2Y0/Dcva0tYqu1nkPH6Z4QaQM6ByjF
	TYLLSYVbCIgiyIu7ovQbej2UQ+8KrJNkc9VsTfnA9dUQmzVwmHTxEFkr5S6j2yF8
	GhRz/XwCM4U/n3+WqcFodqIvCKk7XX85u2aIbetrTyjtpeZz2XQAlfAH9HOrohsd
	vep20Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhtepsyk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 06:39:07 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b24611696eso47822695ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 23:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776235146; x=1776839946; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tcqevKYcvLQFkBP6SAaO9TMJY403tMBt0fptayYFG1A=;
        b=WHL3VjMJU60mjsa+OILj9u9l0GzsNXG+SZtfFJHIOeI/5d087CsdJXXyvbZt3dTzLM
         sQGMfSMPaP4KQ/NOGLVAJKPMOHPYO62h54G5ATLQyXkk297e7JWqL/SeqLs6dSijl1FA
         sxoysRCJ8LEX7ivfOrC9oRH2Cx8S24VzMslUzpMjNTtPXnWojBDHVlIULIuOhFVhhSXG
         1w/ozGboqK7H7Ocyo0L+klLkF/BrDZ9cEDP773hPskeYkp8/9PkVaCWdrHJ2xMeuO4O4
         K66+c+5pQOGyqLnr76q5m3UO0+pJwuNfuGcfNGYnP66kl1UxS6eTLVqRy3/qqsVx5fCd
         jjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776235146; x=1776839946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tcqevKYcvLQFkBP6SAaO9TMJY403tMBt0fptayYFG1A=;
        b=Xz+nXUATQc09k+l+37nLob5x85HNYg3ZNQWV/577yQs0Z5AZIG0Mhmkdc/X+AlIQ/l
         BeywlZPsu9fp6EqZulMFNPUNOXgOZxAmI9JJ3bsQpWVgPmcsKWzUL9BEDlqzcGIesaV1
         /QqYyaqVdi/Bks8TVYyCQLd1Q/xI+F02xRrZJESPRqO4zMxXo+59qvrYNjh5qHNuOhXZ
         /dQH1z0MCR4IILY8OlFG2hsP51wsY6QW6KoMSzPVasDq+jY3c0w4UW4HcUdohP8r8Xfe
         9PP+cQdTkjqR9ddfVgv1WEugPUKbIUUiBW/8m/Ngug6Jnillhxo/Hgo7S+HtHi7Vcnkm
         bj7A==
X-Forwarded-Encrypted: i=1; AFNElJ+7CGrXtkroyK7Szw0xx7uY8+j12d0xhz7KGJhwGe0l/7xi6iA99PHB2Fl9yZDWPUm94zuqxsBzk6hrjIBX@vger.kernel.org
X-Gm-Message-State: AOJu0YzTE0z78B5wMOriqlhoJ1FGa2EiG+6+YVSIZQbZT1HyXIjHBj+E
	eS/fn1V6NCQGcjQSQBBXK5783E00SXw8I/c2FgPjXX4tYzOUZzwl3H9xe0kdJmRSWdr6G01W8y9
	IN+8QG0iEVugJ3Nhkoi8m0MRqiaEoWniLvk0g8237t9tsNIKcyoe1TBmoFHShzcSFr/p3
X-Gm-Gg: AeBDietuohAbAwjsY9NshvjopVuRsGQwaBsEPU8HtdZ+1BF0qHYaGALWwEzBUK3abgm
	9QYZ2joU6ko3kgKmNHwv601zASbQqh5iOTY9VVJUBBOUE4zBR8zrMI6QNcTf3Il+lhw3P8/T4EH
	Ak6IAEk3fZbDzIZswMh2k4KJzadlb0D/zRoszp+X1d6aSZNpbWJxRhyNQ8ILOnkAOnksb3CWlct
	7Ae0HFQc9g8uOqqFPthBNU63aCx6sTtMwIK9ByBHkPmQRaj9I5LAnZYP/xKqdzvsMNOO2gEvcxa
	vvXhCdPEPyaAR19QBB79LejQHKSQTgetdvZFbKEuxMpEBQ4u4b5D1j61b5N6b4ucdDKES+IgpBI
	IFi7sMDX5a9USL+3dLgIYt+lwFx0haL/piWrGf5WnnQ3loKVuQWPbDg==
X-Received: by 2002:a17:903:3e29:b0:2b0:5ae9:ee4 with SMTP id d9443c01a7336-2b2d5975cfdmr143084125ad.5.1776235146367;
        Tue, 14 Apr 2026 23:39:06 -0700 (PDT)
X-Received: by 2002:a17:903:3e29:b0:2b0:5ae9:ee4 with SMTP id d9443c01a7336-2b2d5975cfdmr143083805ad.5.1776235145789;
        Tue, 14 Apr 2026 23:39:05 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b4782ace42sm12398615ad.68.2026.04.14.23.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 23:39:05 -0700 (PDT)
Message-ID: <faa04229-1070-3a2f-94e6-a7e238fb8121@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 12:09:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFC 6/7] media: qcom: iris: vdec: update find_format to
 handle 8bit and 10bit formats
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
 <20260408-topic-sm8x50-iris-10bit-decoding-v1-6-428c1ec2e3f3@linaro.org>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260408-topic-sm8x50-iris-10bit-decoding-v1-6-428c1ec2e3f3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rioWvHhTQYASM6gPNC0i1nhTZQySH1pN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA1OSBTYWx0ZWRfX9+A93oxGxDo3
 TZ42nKPdsuYw7zh9TjSn81njseynQsJAx/6hzRIG+9I2AETuhfwp2mHdnNtmVA8H5qFN9EPBwYd
 QrXHk7FzXbH9j/89Pvr47wEvezBq81by2IwujzymeEapefsZtmvFuY7yGay5DqQtozPAxcelilW
 DJpJ39p75HbbX09Sgb6oC+09y+L29vkkGdm7DIqK0ywZoVyHkS5FMUEn3NMbxF1ocuvJ9jGShS+
 P+yS3NT9+D/tGYJ3QTBPDzrl5Mgp+YsZSHRW9XrGJtD0x92g4aWwcRPiiEZRcbpgelYl44RNXev
 1jB8u5AF0GzdErbNfHcvG+HSuXMrQx5/saxzH+PqWZsFbtY7P5zBN8NYikKJw2gxpmTUJUpqpsq
 oIunlihkctxfP9atM7n1P5U2mn0fhMM+RyQZggMZSLOgTnV8kt+d3dZtUIfb5anFnK1wPW7BX7n
 VjC/Byq95AA7I3rHEWw==
X-Authority-Analysis: v=2.4 cv=CoGPtH4D c=1 sm=1 tr=0 ts=69df328b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=6ikEG6PPlcl_cW5we_EA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: rioWvHhTQYASM6gPNC0i1nhTZQySH1pN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150059
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103229-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: C9067400F6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/8/2026 10:13 PM, Neil Armstrong wrote:
> The 10bit pixel format can be only used when the decoder identifies the
> stream as decoding into 10bit pixel format buffers, so update the
> find_format helpers to filter the formats.

This series breaks the v4l2 compliance tests for the existing platforms.
Decoder failed for below:
VIDIOC_S_FMT: FAIL
Cropping: FAIL
Composing: FAIL
Encoder streaming tests failed.
Please check once.

Regards,
Vishnu Reddy.

>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>   drivers/media/platform/qcom/iris/iris_vdec.c       | 41 ++++++++++++++++++++--
>   2 files changed, 40 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 5a489917580e..cd3509da4b75 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -18,6 +18,7 @@ struct iris_inst;
>   
>   #define REGISTER_BIT_DEPTH(luma, chroma)	((luma) << 16 | (chroma))
>   #define BIT_DEPTH_8				REGISTER_BIT_DEPTH(8, 8)
> +#define BIT_DEPTH_10				REGISTER_BIT_DEPTH(10, 10)
>   #define CODED_FRAMES_PROGRESSIVE		0x0
>   #define DEFAULT_MAX_HOST_BUF_COUNT		64
>   #define DEFAULT_MAX_HOST_BURST_BUF_COUNT	256
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index ca0518c27834..bfc13c1044c7 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -105,6 +105,16 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>   	if (i == size || fmt[i].type != type)
>   		return NULL;
>   
> +	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
> +		if (iris_fmt_is_8bit(fmt[i].pixfmt) &&
> +		    inst->fw_caps[BIT_DEPTH].value == BIT_DEPTH_8)
> +			return NULL;
> +
> +		if (iris_fmt_is_10bit(fmt[i].pixfmt) &&
> +		    inst->fw_caps[BIT_DEPTH].value != BIT_DEPTH_10)
> +			return NULL;
> +	}
> +
>   	return &fmt[i];
>   }
>   
> @@ -113,6 +123,7 @@ find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>   {
>   	const struct iris_fmt *fmt = NULL;
>   	unsigned int size = 0;
> +	unsigned int i, k = 0;
>   
>   	switch (type) {
>   	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> @@ -127,10 +138,36 @@ find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>   		return NULL;
>   	}
>   
> -	if (index >= size || fmt[index].type != type)
> +	if (index >= size)
>   		return NULL;
>   
> -	return &fmt[index];
> +	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> +		if (fmt[index].type != type)
> +			return NULL;
> +
> +		return &fmt[index];
> +	}
> +
> +	/* Loop over the valid capture formats and return the index */
> +	for (i = 0; i < size; i++) {
> +		if (fmt[i].type != type)
> +			continue;
> +
> +		if (iris_fmt_is_8bit(fmt[i].pixfmt) &&
> +		    inst->fw_caps[BIT_DEPTH].value == BIT_DEPTH_10)
> +			continue;
> +
> +		if (iris_fmt_is_10bit(fmt[i].pixfmt) &&
> +		    inst->fw_caps[BIT_DEPTH].value != BIT_DEPTH_10)
> +			continue;
> +
> +		if (k == index)
> +			return &fmt[i];
> +
> +		k++;
> +	}
> +
> +	return NULL;
>   }
>   
>   int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
>

