Return-Path: <linux-arm-msm+bounces-103880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKEfMzMK52ly3AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 07:25:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AEF4367B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 07:25:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD40B3018082
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 05:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EC4F32D7FA;
	Tue, 21 Apr 2026 05:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l59brESl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cmyl2XRd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B931D416C
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 05:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776749090; cv=none; b=MR7FrRtkcxG/1P3UbKmbPzuRCrSdNO7kcIHSYJkksEJ9+nFJ6pqMdE/3M/NSWNs8EOOoqpkoDdIhzDKZ3iiJuwvcb6RXHDXSVgpixOv9DjdJR2iPedijJzzTh9mreso9x9R2rlOuGXTRx4Me2uZX8VTJQCDl+cJqW1mSWERvXvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776749090; c=relaxed/simple;
	bh=MgQT4N+Mqb1evwM8+fhvVokUy2mUmmNhfCNY6bbnGs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EluBgJWP/plf89wzngAtzSe8PMvsknr4b6DLrFvCjTNsKQWKED/VnHauWypgolW+/5v4OOtt1xTKrVHw44nqnGJpIDqD+SMQbG07Jg6T7GWiecRQcSzj/P7vye2MdDfKkZDv1FxtX/K1kvtRiFK7IeMYaMFq0CdAjTUAkew1dcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l59brESl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cmyl2XRd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L3PYO74167771
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 05:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WCL++qfBVqJug1AN+YapQM/WiamenNZBA74qYFRRIrE=; b=l59brESl9AI9VY4j
	7a9DL4M0sMcQDrKE7oE/VLb5yNRBpFRD1O1u6d8GD7GCUZDcbUelzr60tm/gj14Z
	DoNGIhESHVL9BGbJ8oNOgoo4vwaNutiQTEf8hRpSGokjf2K5ntKzwxwIwlM08UBj
	r8/eqGKbHcC7Qnm9CljDdH1m/VEub6T5SUezKKTfGw4Hxijueki7Hs+fnOV3IJ6k
	3MXTNnlDV9qaphzbImQdnt/KcSDfqzLOr1hNbhs6qm46TmTALnFWmQAzNyaqzTaG
	EBx1Pz6Eyf50OQCekl5MCqeTwmU3T/v2qmzXH5Xm2zHNmDxJLvwwgAEcbPlwNZZw
	6V1/vg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp1au0c01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 05:24:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35e59791605so3814082a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 22:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776749086; x=1777353886; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WCL++qfBVqJug1AN+YapQM/WiamenNZBA74qYFRRIrE=;
        b=Cmyl2XRdOPxWNKOUe50n051t5BifawnCYFcPNk6oeMlJEtnCFhbtJ2glJwJ+SIeq3N
         t074t/tUok12ONwkH7OnTwYLheEJfh1o7We21WCTfwTcdIgDZz5gZlcMRbe/5F7RylXo
         Bz6U+ytrBvkGbwBvsBq9YFQjulOeVtE7r6B0lzX/uHKkE9xlbn5x1ZOcixzreVM1X9vL
         QnyBOTBAoZ3h9Tv567Es6EhrZdngUhBCiyHARrm6HOw8Z1yUcWY1DTHhtymd7L1quUwn
         UH38ZpkiJkWHagl6/Y3f8B+EKjKN/YA3z+5QvR87pBeWG1NGtxhhuB8paat+4gEeCCUw
         HU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776749086; x=1777353886;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WCL++qfBVqJug1AN+YapQM/WiamenNZBA74qYFRRIrE=;
        b=ah6tja+rgHQ3lOMAW6FV83ijqw6mlHIbNj25VS6xFwYCwanP7IqJYrn6rjqOD9/ee4
         +7agtlOoLyh6EBGb/XSkR1xHA5VDD8QsS8KLsdMdtx8EyoWll/DxOu+Z0zCyVdXnSJu6
         36HGx4O5P1BJFmttLiF4E/GFgDhgIjk81BEJwtbUZadsuH9FEGhaZT/BgdpevNqD3fX1
         6H4miZ9DMfJfshze8ezR88OCDavjKFlhVrWMhNKsm+9w1ZrpJPlEpsw0bHzuPCxUPxu3
         yCEw261v94z+qkTEs5azavdCibtOWqKlGBx7OLm6CMGM0vTiB5jbXpgQT82tbvYOmlc0
         OjfQ==
X-Forwarded-Encrypted: i=1; AFNElJ+FRQAsgS3/dYlHr/teQmq5XfWvVepvDHrqX6Rt7HCez0rKw1WaLTEmB7QuokkazEU15Pq0h93etBEwool4@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqk1qeci2N2r8ncvSBWRYvf4LIXHcR/kXXWL8ZTg6Pk1s9syvH
	csAwzJmacyoId9pKLxssd5bquLEdlwAY+zV9HWGf/aD5/lTKJHAm6SEI+i7csQEjzevb1mh7zie
	O8FTEXK23iG6htzdqloLNYzBCkw1DsMnL84J8krL9vq1umQMO2hD4Ca4TFTykcMJjOCso076mkv
	KG
X-Gm-Gg: AeBDieuxuGMq6zkgpvd1RKsQGJPRgx057saID6B4ivwGrUuJsSV35VEY4P0NLdjQ7lh
	+9bcc+S4C9kqte5dnUtBtIEwAbWo8t83BJYRs31Yg5k1Q7gjoXOCdYoH4JjWkKKQcwqaccgPfvh
	aaZVv0+5xG2ap1o9BA4VdRh/HmINRm4DMUSdvJMGBBs7+O46UKGQbopCiPjOJK7gt57gkH+pdNC
	jSh7IGrY9A+kPej1Qwmcyfj7C4OjOtuN5igIOnc5J0adBXoxgUpQoy16HZZizta8DMwzuRZMGfD
	vX56P6kJSgtaBjRO+/5HQLpfQR9WoB53woQ0aBdkuEV2T1HovsL7F2UhHn2WN7uCcZpfXB10Lbk
	0g39tPz11/1GoXcE47z6KVijtR8xIBxVJUWth/piFOlrGJu1ePxqpaDhHX3OEkt3D
X-Received: by 2002:a17:90b:3d01:b0:35a:cf:64a6 with SMTP id 98e67ed59e1d1-361404af0a4mr17842727a91.23.1776749086435;
        Mon, 20 Apr 2026 22:24:46 -0700 (PDT)
X-Received: by 2002:a17:90b:3d01:b0:35a:cf:64a6 with SMTP id 98e67ed59e1d1-361404af0a4mr17842699a91.23.1776749085953;
        Mon, 20 Apr 2026 22:24:45 -0700 (PDT)
Received: from [10.0.0.4] ([106.222.228.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614195a92asm11957276a91.10.2026.04.20.22.24.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 22:24:45 -0700 (PDT)
Message-ID: <f336e049-eb6c-5784-b831-fffcc162ffe0@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 10:54:40 +0530
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
 <d27e1500-ac4a-01ac-084e-bb53aa1f63b0@oss.qualcomm.com>
 <dbc98f63-b851-4470-be38-aeb83c719759@linaro.org>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <dbc98f63-b851-4470-be38-aeb83c719759@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA1MCBTYWx0ZWRfX1JPFrBjij62s
 mnjQy27DhoWUvHZYp8LAsRoN0sdU8TrjoBLuoLsSO3h1T20VFVdlBlTIp9Yh+2zQJSVsmilT7mC
 KIDtOujpyOJEX4o3kVQ24qCeYUkesY64nMtjT+GPpDxkEwSuBTsb72bXX8kdOuJhaTZw1yJrZwb
 aD01n2Pw9PZUb9V3mnh7RjLUfBb5T6lqENdq2Xf2o069ZesWSUxXgMyWGhTmiqYlruiBugct3Ce
 LgLB3KCutyBATJASb2jBN2ARSEDM+GGs9FI0acoImzWxc/3vqOm6iNt6c0wK1TqXuFKfGmElkp6
 9dUSADlJIFBykma6uLiGEjRXfk2K9C6rGan2cRJy9EiNDxY0bahQFWSfed/IPQg38p5doFrO1T0
 ksK/ta4qKv+qudukB26lRITLoY3ZldSZKLsUr+DPVTxx/OPvjUx93vnizxrmYmgzHNX1WAOrmce
 tyHMyeeKcWsUvMMsv9w==
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=69e70a1f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=rP2ZPG2H70Gfrv7XvIldxw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=9ymPTIKn-T6a8pg3zFsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 7izCcq7cfmTM5MakBpzTPA2wXsHhmQjF
X-Proofpoint-ORIG-GUID: 7izCcq7cfmTM5MakBpzTPA2wXsHhmQjF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210050
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103880-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 79AEF4367B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/17/2026 1:33 PM, Neil Armstrong wrote:
> On 4/17/26 09:22, Dikshita Agarwal wrote:
>>
>>
>> On 4/8/2026 10:13 PM, Neil Armstrong wrote:
>>> Add the necessary plumbing into the HFi Gen2 to signal the decoder
>>> the right 10bit pixel format and stride when in compressed mode.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 71
>>> +++++++++++++++++++++-
>>>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>>>   drivers/media/platform/qcom/iris/iris_utils.c      |  4 +-
>>>   3 files changed, 72 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>> index 30bfd90d423b..8e547e390fa3 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>> @@ -481,8 +481,20 @@ static int iris_hfi_gen2_set_colorformat(struct
>>> iris_inst *inst, u32 plane)
>>>         if (inst->domain == DECODER) {
>>>           pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
>>> -        hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
>>> -            HFI_COLOR_FMT_NV12 : HFI_COLOR_FMT_NV12_UBWC;
>>> +        switch (pixelformat) {
>>> +        case V4L2_PIX_FMT_NV12:
>>> +            hfi_colorformat = HFI_COLOR_FMT_NV12;
>>> +            break;
>>> +        case V4L2_PIX_FMT_QC08C:
>>> +            hfi_colorformat = HFI_COLOR_FMT_NV12_UBWC;
>>> +            break;
>>> +        case V4L2_PIX_FMT_P010:
>>> +            hfi_colorformat = HFI_COLOR_FMT_P010;
>>> +            break;
>>> +        case V4L2_PIX_FMT_QC10C:
>>> +            hfi_colorformat = HFI_COLOR_FMT_TP10_UBWC;
>>> +            break;
>>> +        };
>>>       } else {
>>>           pixelformat = inst->fmt_src->fmt.pix_mp.pixelformat;
>>>           hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
>>> @@ -517,7 +529,8 @@ static int
>>> iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
>>>       stride_uv = stride_y;
>>>       scanline_uv = scanline_y / 2;
>>>   -    if (pixelformat != V4L2_PIX_FMT_NV12)
>>> +    if (pixelformat != V4L2_PIX_FMT_NV12 &&
>>> +        pixelformat != V4L2_PIX_FMT_P010)
>>>           return 0;
>>>         payload[0] = stride_y << 16 | scanline_y;
>>> @@ -532,6 +545,57 @@ static int
>>> iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
>>>                             sizeof(u64));
>>>   }
>>>   +static int iris_hfi_gen2_set_ubwc_stride_scanline(struct iris_inst
>>> *inst, u32 plane)
>>> +{
>>> +    u32 meta_stride_y, meta_scanline_y, meta_stride_uv, meta_scanline_uv;
>>> +    u32 stride_y, scanline_y, stride_uv, scanline_uv;
>>> +    u32 port = iris_hfi_gen2_get_port(inst, plane);
>>> +    u32 pixelformat, width, height;
>>> +    u32 payload[4];
>>> +
>>> +    pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
>>> +    width = inst->fmt_dst->fmt.pix_mp.width;
>>> +    height = inst->fmt_dst->fmt.pix_mp.height;
>>
>> This HFI is only applicable to AV1, you might see some corruption due to
>> this. Please check.
> 
> This is what I saw looking at donwstream, but I had not implemented this
> initially
> but I got some corruption with some different width/height, which was
> solved adding
> this command.

Even with your implementation, this API would only ever be triggered for
QC08C and QC10C formats, which I don’t believe are currently being tested
with your series. Since HFI defines this as AV1D‑specific, invoking it for
other codecs is unlikely to help and would be incorrect.

Pls re-check.

Thanks,
Dikshita
> I guess this in-firmware calculations are not exactly the same the DRM
> driver expects.
> 
> Honestly I think it's preferable to sync the stride/scanlines calculations
> between the
> driver and the firmware.
> For example I used the same "ALIGN(width, 192)" for the v2 iris patchset
> which was wrong
> because ALIGN only works on Power Of Two number but it still worked because
> this HFI
> HFI_PROP_UBWC_STRIDE_SCANLINE command was called with the wrong aligned width.
> 
> Neil
> 
>>
>> Thanks,
>> Dikshita
> 

