Return-Path: <linux-arm-msm+bounces-80826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEC4C426DD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 08 Nov 2025 05:29:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A06384E4F8D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Nov 2025 04:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06022D8399;
	Sat,  8 Nov 2025 04:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oVZeidxv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fwnxejIu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF0D2C21F3
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Nov 2025 04:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762576186; cv=none; b=Z0e4ivApTYv5UzIkmz4LpLj3vLIMJYHUJGpQkl0M5yOQZZRL13Ts5ersy7z8FbfCOCzhLa+FsnWn+EoxrQQcFPJ3m1qTipz8cvip1Klp2kRhDzLqupIM88GzzyjSDd9VEuddA8InA8gPRRswMfqzQP4OMInNwg+A0sw45h86C+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762576186; c=relaxed/simple;
	bh=GrqF3Btt70TYVVkeKpPrI2n8V5I1xfOAi37SrsDWidA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K7BnCd+HzQc972QOYhv3In6GF9/mb3jcrelqSP8SvxXxjqmhWle3i+hC9o3tI+S7KMBAX9PvPTeBEYWvFEwx7hkbVB62CEAMLOjMzF9WQ5ObVBFjxYGP6o1+uY5+/0sXLMY7pqlcryqfC7jNEML1p1cA25T6HAzvQ0CCoBYFEVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oVZeidxv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fwnxejIu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A84QBMF989625
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Nov 2025 04:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MHKiEPMGJiDkpwGtmXYIoaq5aBgKnZRJk5urWtbVNhw=; b=oVZeidxvkX6GIxcg
	m88qoILeDD7B7WnGaTqh7W7Yu1ORb+kSCztbMeohV7AEUAJv87ilq98C7OmwgEQe
	fIEWUBMYrFw5jRiJXfDItJViZlIp9RXSFSwY1gjXpbWg/RCzDQ1Y0tpd9h3Z/Io5
	T3bT50euW5q79nQSdEqdEa0oqIQvIpyYg2jfXfv6hyna60qUbS6m43wI1w/QxfMC
	NyzKVlVSAaoYWvlnbjRTl1eHEMbOCIMKZQmywKrvNL/a2ZMGoaORhhLnICrJaRMg
	esUJHDn2OrtHj2XNIKTSCa2Ciey6GZz0bwr33eP2tu6+zCD/1J10V5p8TGzodckv
	1FTgJw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xu2r05j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Nov 2025 04:29:43 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b633babe5b9so348336a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 20:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762576183; x=1763180983; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MHKiEPMGJiDkpwGtmXYIoaq5aBgKnZRJk5urWtbVNhw=;
        b=fwnxejIuJJS2GIgB2ZrdGhP9iDU/hHjho/wjwyrTOEUxoCsj669ZRPt3qeV/ARAs8t
         o2af3471qKpRrYvvj/iJNVo+J66DA8GjgxplHq6RRFCTL/d3NixDiGkBr+1CVc4tJihf
         9Ap9mmFpyE7g7+g0f2CRJp+01iXVIy6gZRHgF92v2Rq+UGdbiBxu+P5dL5Ch8aIv64+u
         1QS1RKmsnza9GC9NyKjhosxXH9O8LeoMZRcDyB3kCYzb/yv2jqst4jeSVmkwZVn9Vmeg
         E06qFkXoE264qAu5MDhAHxuut3GBW3HFwZK60IUslONaG7kOUlwOlq8BXT1Vxo1fPL7z
         RzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762576183; x=1763180983;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MHKiEPMGJiDkpwGtmXYIoaq5aBgKnZRJk5urWtbVNhw=;
        b=Fxw/UUfZxhXg8302wxExsD7touswIc4V0GwIOooCvsSl/JqMCa19A5jJWhEgWOHYE8
         X67pYrK6Zy5KrcDlGlakIgV0salu+BmBm9My5aqX38oGlVlgxMChkGh8vxKcpBQHWXMN
         s7hSDQr0fVvdD7B+PT/QqxxuTyEQU9eBXX5oEVkI6Q48vT5D0p1vHjYiir99pZNLjPVB
         emVeeNl6OBm43Ti5w5IoXZERgEAQ9GFouekRVeEL7oG1UGu895IdHWRtYZISr4hWXD2h
         a6Uzt8sVyRpyikyaLwKdfIxgLtRxeEqtWipGjucAZ7nmeZGMH2Q+KYwJJJJ1SUvXzbaU
         DUNw==
X-Forwarded-Encrypted: i=1; AJvYcCVsvygHjZudhtwlnBdrKO7Z+7mlSXCri3knBOjzUVQvx67DCaZ5zlO3jHuz90m5eQGsXw1gXRL1OJ4D/TwF@vger.kernel.org
X-Gm-Message-State: AOJu0YyYVWRbqpAtKG0qK0nHkiHmT0a5cEqZ08hCP4akY4dhmBaVat/m
	iZ/9JkWAPQwPHmbeDCzfXHrAlelTmE8Ofk33U9j1cZRmBo/GmXxzDklhNp1OrHyYmzEBcsAscoG
	vE0ShjkzV7lrhvB9RwNZlNbRi2tlk9SavS93hPQsV1iaQTdOW/xxmsKUQXWUSqszhTba8
X-Gm-Gg: ASbGncsEVkeomCK1HehTPRVPnC8p3//1OT0Nfj6eDp9KN5Uz3QfMGEdPslSi2GhQQQF
	xD7J89upYeZrCRoDBhQR2A1Vxy5F0D3pMx1Ryt7OjBvr8eJu9PCaihKvj1TVpZU9pQDHix4altW
	ySNTX1U4NposUFoKUwdxW9BEaM3JTF/ZhOeRetsxEJ7Ta3DoC8erDYaMmXmYpcYSHKv2vnXD2Mz
	aL8y0Lw1RiqzCzN+Utd9tvdAu016fICElw8n4yRTlTP00RpF0anOE9JC2xb+vqm9eh4fFvRVDPy
	OAqJsQqZJ+IKWTG1pNHFhiuK/OVwNCXBH5e6lUqDQfd97ROATrebBhr3we8hRMbEziSxZ+Qfqea
	eh03CjfPiSLyHy4HCmVq3WrBc0VlQarO8ii04u/T/FUacWXYncPQwSO2I0AvFIQ==
X-Received: by 2002:a17:903:230f:b0:295:70b1:edd6 with SMTP id d9443c01a7336-297e5643e76mr8706715ad.3.1762576182872;
        Fri, 07 Nov 2025 20:29:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3sfbuDhDXySXPAVcfmEF/y2AIuNMy7+QjiPXwwDd2S9+fLZylcYi6yhb2l9ZzI+uh+oI6JQ==
X-Received: by 2002:a17:903:230f:b0:295:70b1:edd6 with SMTP id d9443c01a7336-297e5643e76mr8706485ad.3.1762576182355;
        Fri, 07 Nov 2025 20:29:42 -0800 (PST)
Received: from [10.110.21.199] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c73382sm75330285ad.69.2025.11.07.20.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 20:29:42 -0800 (PST)
Message-ID: <47a16514-9cc1-46c9-b0d8-029c5bc44638@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 20:29:34 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] media: uapi: videodev2: Add support for AV1
 stateful decoder
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251103-av1d_stateful_v3-v4-0-33cc1eaa83f2@oss.qualcomm.com>
 <20251103-av1d_stateful_v3-v4-1-33cc1eaa83f2@oss.qualcomm.com>
 <6198674a-2af0-4906-9ffe-bc10e68eb5c5@kernel.org>
 <19cdb1996557824554789dccc805014b0fa2deda.camel@collabora.com>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <19cdb1996557824554789dccc805014b0fa2deda.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dMWrWeZb c=1 sm=1 tr=0 ts=690ec737 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=apL-334RAAAA:8 a=KKAkSRfTAAAA:8
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=OyDfNFrtaf6QVTBVua8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=eWIHaOtA_ULHaMmHwLHW:22
 a=cvBusfyB2V15izCimMoJ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: gpUbOk4JkLtAvVYTuC6K8vxMNwzOtRYw
X-Proofpoint-ORIG-GUID: gpUbOk4JkLtAvVYTuC6K8vxMNwzOtRYw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDAzMyBTYWx0ZWRfX2jAhUJ1XQdU3
 tVWXxsCCXOIkw4vEY3cvhV5BMu2/2YlQBIOkUvStRGtsfKshPb8hDu/2obAukoUVgX89TLfRSQn
 CXzXAoxhmdr6UCbYtFKgXTrQoKmgNUNq+5U6WtGeWt2v0rcgTiQ8cWkVdMluMP/XtQAR0zhGpuJ
 FzGzY4LJmxE0ceSBmgj0gu2OGx/0wNoY4weV/KTMGk8t/1b9bkBHVGnr3H1JCbbhWDGq6a4P2Sy
 jvoODPepgTKoEa4nNCuXvngqu9BZJ+QmX6DRqkZCGv0AebAvadXf71up1WpRSvLHqy9dwjLgTeD
 zItfckKwfPXHvBbP4h5llUKlDOwNwuHVNTcHg2zBhwrPVVY8o19UOk+v8Ylw+ckZWutMnPXFFW3
 R2NKSd1vpBrsf3ROUEe/vAGyH2Tz5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511080033


On 11/7/2025 5:41 AM, Nicolas Dufresne wrote:
> Le vendredi 07 novembre 2025 à 10:25 +0100, Hans Verkuil a écrit :
>> On 03/11/2025 14:24, Deepa Guthyappa Madivalara wrote:
>>> Introduce a new pixel format, V4L2_PIX_FMT_AV1, to the
>>> Video4Linux2(V4L2) API. This format is intended for AV1
>>> bitstreams in stateful decoding/encoding workflows.
>>> The fourcc code 'AV10' is used to distinguish
>>> this format from the existing V4L2_PIX_FMT_AV1_FRAME,
>>> which is used for stateless AV1 decoder implementation.
>>>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>>> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
>>> ---
>>>   Documentation/userspace-api/media/v4l/pixfmt-compressed.rst | 8 ++++++++
>>>   include/uapi/linux/videodev2.h                              | 1 +
>>>   2 files changed, 9 insertions(+)
>>>
>>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
>>> index c7efb0465db6480fe35be8557728c196e0e530f4..0c70410ffd4d58e0719d3cf13ad336c97b454ae9 100644
>>> --- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
>>> +++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
>>> @@ -275,6 +275,14 @@ Compressed Formats
>>>           of macroblocks to decode a full corresponding frame to the matching
>>>           capture buffer.
>>>   
>>> +    * .. _V4L2-PIX-FMT-AV1:
>>> +
>>> +      - ``V4L2_PIX_FMT_AV1``
>>> +      - 'AV01'
>>> +      - AV1 compressed video frame. This format is adapted for implementing AV1
>>> +        pipeline. The decoder implements stateful video decoder and expects one
>>> +        Temporal Unit per buffer from OBU-stream or AnnexB.
>> OK, but the next patch says:
>>
>> 		case V4L2_PIX_FMT_AV1:		descr = "AV1 OBU stream"; break;
>>
>> And Nicolas said here:
> Hmm, good catch, we had quite a bit of back and forth actually on the subject.
> The discussion went toward that this is OBU Stream format, but it is conceivable
> to enable Annex B support in the future using a control. That mandates that OBU
> stream must always be supported for that format.

Thanks for the comments. I had a similar understanding as Nicolas.
To keep things clear updated v4 to just have OBU Stream.
Thanks,
Deepa

> I'd drop the "or AnnexB". Then I'd try and harmonize how we write OBU stream, I
> prefer without the -.
>
>> https://lore.kernel.org/linux-media/544147436308901fba85d6de48380c0c1eea7c67.camel@ndufresne.ca/
>>
>> "Perhaps "AV1 OBU stream", so its clear its no Annex B ?"
>>
>> So if this is just for OBU streams and not Annex B, then the description is wrong.
>>
>> Since I'm no AV1 expert and have no idea what the difference between OBU and Annex B streams is,
>> I can only comment on what looks like an inconsistency.
> Annex B is very unlike H.264 annex b. Its adds a wrapper around time units,
> making it faster to walk through displayable frames when you have the ability to
> skip bytes. I've only ever seen it in tests vectors so far. My impression is
> that we'll never have a hardware that requires that.
>
> Nicolas
>
>> Regards,
>>
>> 	Hans
>>
>>> +        The encoder generates one Temporal Unit per buffer.
>>>   .. raw:: latex
>>>   
>>>       \normalsize
>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>>> index becd08fdbddb857f8f2bf205d2164dc6e20e80b2..cf0b71bbe0f9d397e1e6c88433a0fc3ba11fb947 100644
>>> --- a/include/uapi/linux/videodev2.h
>>> +++ b/include/uapi/linux/videodev2.h
>>> @@ -775,6 +775,7 @@ struct v4l2_pix_format {
>>>   #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
>>>   #define V4L2_PIX_FMT_HEVC_SLICE v4l2_fourcc('S', '2', '6', '5') /* HEVC parsed slices */
>>>   #define V4L2_PIX_FMT_AV1_FRAME v4l2_fourcc('A', 'V', '1', 'F') /* AV1 parsed frame */
>>> +#define V4L2_PIX_FMT_AV1      v4l2_fourcc('A', 'V', '0', '1') /* AV1 */
>>>   #define V4L2_PIX_FMT_SPK      v4l2_fourcc('S', 'P', 'K', '0') /* Sorenson Spark */
>>>   #define V4L2_PIX_FMT_RV30     v4l2_fourcc('R', 'V', '3', '0') /* RealVideo 8 */
>>>   #define V4L2_PIX_FMT_RV40     v4l2_fourcc('R', 'V', '4', '0') /* RealVideo 9 & 10 */
>>>

