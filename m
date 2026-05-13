Return-Path: <linux-arm-msm+bounces-107475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OdxKpfQBGr0PQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:27:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F41539EF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:27:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EBAC63026CB7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6847C3B3BF0;
	Wed, 13 May 2026 19:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lgdRRt6s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VKqCmsQZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE2B3B1034
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 19:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778700436; cv=none; b=Cf2T19XbhQXDgJ6VXkdVv4HQ4zwi6CwDd0flnOdgnDXnMOfQsHRb655U6GCLhcA8GxIP5ynqjSD9gDnVL2nMQkO94nVV5YYmWvegDJI6Oq2Hp4e4IlvIW3aSt9rTOaGkx2BaAhbM4jd+TiHUZCxcquDQsJvHufhkJjaSK27B0us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778700436; c=relaxed/simple;
	bh=tV3pv7xKKDP1+S0W7Yp+8gNmAXnCpGwI5fcu2TVBbGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NivT4fmw6HGc2P7tgiiiL4fndoaRTFZXO+29SUlzdRLknSpTtYbcfy6c5l5vIIsQm2EX4xGz77vcIgpoARou/ThJpqKMtz3KvSbI3ZFWSxqiY1wn9E/vX5Vh7MBOYj9DBvptaukEI5DMu9mr69uc2sG449x737Qx9w1oeeE1HP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lgdRRt6s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VKqCmsQZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEwiQn4159611
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 19:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XC1PMvPouH5s16VJkuyjTVmFB3EWh4Dc0i1OjLJSlro=; b=lgdRRt6sFBFm3XaY
	ys/pt33Wa5hjJqn7+akykyNrZozHF1viVZ26oPlIAcSrmALiqVta6EEs7qQfPzRr
	RHWwYDmE1HEtCkbJVsHiCJz5RN/Etf42i8G61UVkoOw1snUJk12ZfA5vvDkbSPqW
	GIHA44UgJ8BNtoa1Wpec7YmWvsTHkN0RKyTHkTdjGC/joYfMbT9isGiA74mmX6Qz
	w+OFopm6bYvmOoim17XhLtD+Eyp3pOOVDoJFy15/lTTVGWCv/NV6S0weQS4eA2iT
	uBiTpBpvFFVYZ1VrPb7rT4N2rP2SQgFCs9VawAtjRESEeEQkwPKJry9cv+GHAkWJ
	Szw+cw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91thfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 19:27:14 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-83eefe4867eso1390132b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778700433; x=1779305233; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XC1PMvPouH5s16VJkuyjTVmFB3EWh4Dc0i1OjLJSlro=;
        b=VKqCmsQZ6XpkHyJ7l8cEKPyBlapebStaIiZq/jLH99Tp5BaW41xCzgaVdUbi5KSim8
         9Dlv/OY+tHn5sWDJXKEvnfr99MAnZHkn35PrOHS2NHuNne6djJVIExl0F9Qb9DYeYAxL
         QxXuo92yj6FrFywMjMr7LOmgA7O8pYvkqtqo19omPpmUjLX9JMkrpqpsyrxOg1TQdYR3
         qri4XpN4Ngln7PN+Bm7bO6T1Eh8ZtoDeN1SALPU6WnwCuKW83xJW8V5VDFH1UTYsaQTp
         pOxWOB2XALM6TAAmsjE8G29VRg0MvS4fnzNOEqsv6AFPFYcuIKGG7s8YYCeAblgHmVRI
         QFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778700433; x=1779305233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XC1PMvPouH5s16VJkuyjTVmFB3EWh4Dc0i1OjLJSlro=;
        b=FoJuPmk0r038vUjyvCWhurKtHZEnk0QK1kb/SnFwoY6QVKw8k5UOdCOHSqtC1Bc2uj
         GK/HdILlOUnkOw7zKMpi4tNOgYogeLqKjUDjT738gmePdFE+g76/UL2pFIwtWSJQoa+7
         Tf+WfhO+9AzX6JbMswWXjZHByEO2vkxUWjQlUkWY+RXUUSPE0Aw2h0uf4+LkL2b+MEbw
         jGS1oKNw5gNAm3e4vCg5aDhHTOqOYcvzQIyoF+ws/5DVQCIh0UQ0hFFAFJLn7nlmzzXH
         Vy2vkAbkEvqtC21mxDCSbhQosmg6ZOLhcqjQywySpUuKyrRPRCrG5Bv4eop7qaPPp/B9
         HwJA==
X-Forwarded-Encrypted: i=1; AFNElJ8cDOkgz+fIlskbfnYG7qdBSsRFw1j+h2KIv7Huor2UqNby1LVLPIXcv9wZBDmwVOYYZpGnOkw2M97HB2bE@vger.kernel.org
X-Gm-Message-State: AOJu0YwY8xn5RWYJWuFkjHj8J9i690HYLdHU5o0vdMDtCViE880/SAso
	rJXHiEC8B31iLNAulBY/l8z4lm+s1PbCeH3u7XvnWemP9fKss35h+XKcicAm4FVhMu0A+caXLaQ
	9cCVPp45PQm5pNGJ8zf+M1fHTbz41m5BZ9wObboSA82Ez7OuOygohYWb39P5E9kSkR9kh
X-Gm-Gg: Acq92OHRhQ0YCtCxIut/vRWtoSEa2hy9+ZEhzSMtgZRhdTj2GUr1oKoxfO2psUABZrw
	j+3IrPHtLvQxXhDiuGyZ7wyUxXUFkZy2K3XLWsHKzB9hgsz6J0fjdaIGyGtGLISLL8AP0FrdAIF
	7/Q3zt2UxBVVCLDK8IfKOG+Cz9vVSkIh3zA5VQZQoxjkyJgRTE7rI4HhV+AsNqt82sBTq6vl+Eg
	+0LXfHQIpQLSU5O06OQtIZSp5PeYNmYFC5H05RPUw7yzwqV5A78HydIosWyAdzxYdgkU+Txpp97
	sH8oKOKSvEVojt390xbHkFIVCblxZUxvVJhyQIQbLLqrEagKz9vVmPBC5Jx8L2uVYmusCgGL7Rb
	cetlN5OB8tRjOHhgSoIkDCwLlcabQKOs+FfEreIhBUaQ2464nXa6CGTj+
X-Received: by 2002:a05:6a00:14c3:b0:838:af72:fb35 with SMTP id d2e1a72fcca58-83f03e949f1mr5153311b3a.10.1778700433446;
        Wed, 13 May 2026 12:27:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:14c3:b0:838:af72:fb35 with SMTP id d2e1a72fcca58-83f03e949f1mr5153290b3a.10.1778700432966;
        Wed, 13 May 2026 12:27:12 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.255.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664220sm289587b3a.4.2026.05.13.12.27.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 12:27:12 -0700 (PDT)
Message-ID: <5fc62574-fae1-4bf0-b6b9-fb6fb33041f8@oss.qualcomm.com>
Date: Thu, 14 May 2026 00:57:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] media: qcom: iris: vdec: update find_format to
 handle 8bit and 10bit formats
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-5-7fc049b93042@linaro.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260511-topic-sm8x50-iris-10bit-decoding-v3-5-7fc049b93042@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Q4UGEOGXqOs_9kUO6WWt86zVqHEMo8F9
X-Proofpoint-GUID: Q4UGEOGXqOs_9kUO6WWt86zVqHEMo8F9
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a04d092 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=6GFGFuPpdQFN+sW0UwB+2Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=vZN6g2wfPXE3sIqakpMA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE5MiBTYWx0ZWRfXzv016iGOAy9U
 MvkPn1dIowoagK9wKrWpbEDN+dOLuWdmD4Nca/Fp6PUxtO1d18VbEL43f9C0K7hl68XDNZLg9vk
 aQTExBSywC5ci5Zf83TGWE5bEc4FEdy2iQQEPQMEh5tIloVFEqbL89WzOt3Ey162oZQILlbR/M5
 s7QdOecLE18Ta46rhnDFdlzkUrhFuvRQ40uT9o7sxPy48xUvyz8VtE//+bXwzPiaRau6g7yXre7
 E2hQbF58oYy9dQIM9HLxB5MdDRcNcXbPL9vxeHfzxVbMH19tQJncQ22RsFMWP8QtCqCfFP9RIql
 6yTlz6HilLx2PTyJK01lJ/pBMR6gkWqXJnSm1Egl7gJr+sTbLcuG7TGMtx5vp6wOos/VZrYje2T
 UW/VhojQ/iVV2g7YDHWtEGoDG70pJ9LssAwKtzBaXfOjQYuxQzuzoS7PD4mDCFUEh+EhG6kF8VV
 UzWvc+C7Vf8+ZOfsYBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130192
X-Rspamd-Queue-Id: 20F41539EF2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107475-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
> The 10bit pixel format can be only used when the decoder identifies the
> stream as decoding into 10bit pixel format buffers, so update the
> find_format helper to filter the formats and only allow the proper
> formats when setting or trying a capture format.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/media/platform/qcom/iris/iris_platform_common.h |  1 +
>   drivers/media/platform/qcom/iris/iris_vdec.c            | 10 ++++++++++
>   2 files changed, 11 insertions(+)
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
> index eea69f937147..f4d9951ed04c 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -99,6 +99,16 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>   	if (i == size || fmt[i].type != type)
>   		return NULL;
>   
> +	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
> +		if (iris_fmt_is_8bit(fmt[i].pixfmt) &&
> +		    inst->fw_caps[BIT_DEPTH].value == BIT_DEPTH_10)
> +			return NULL;
> +
> +		if (iris_fmt_is_10bit(fmt[i].pixfmt) &&
> +		    inst->fw_caps[BIT_DEPTH].value != BIT_DEPTH_10)
> +			return NULL;
> +	}

similar logic would be now needed while enumerating fmt.

VIDIOC_ENUM_FMT will now enumerate all capture formats (NV12, QC08C, 
QC10C..) regardless of the stream's bit depth, while VIDIOC_S_FMT will 
reject the wrong-depth formats.

userspace will see formats via ENUM_FMT that it cannot successfully set 
with S_FMT.

> +
>   	return &fmt[i];
>   }
>   
> 

Regards,
Vikash


