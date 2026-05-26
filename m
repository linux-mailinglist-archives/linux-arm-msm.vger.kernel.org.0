Return-Path: <linux-arm-msm+bounces-109810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDELEBeWFWp9WgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 14:46:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CC55D5BC6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 14:46:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 923703010DBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 12:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50E55155C82;
	Tue, 26 May 2026 12:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gwoMLsnP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kNcUypTY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74BA4315A
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 12:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779799531; cv=none; b=gM9QU4XpSERqN/DIAvEMllEtEO10IiawbjmT13Qf7Ua2iz9uu5fugi5BGyY4dIN60MCS08jrmVMCYvnx1E+b970PndKEL60n6YgGFbtOVH2fqzcIddTVGaRfN3AYV1Ih9hMLTSpaWanCBzxvyIlddgVXjNjWsAWLXkLQCC7nV18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779799531; c=relaxed/simple;
	bh=JO6q9eoc30NoSzl4pjHnMA4ymxhAVXNZEdRBd/Cn48U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sbIcfvMreBwixF74UR2DN0OUjFA6ioYbKmkJBQLxuxrmfErWXSJRMLXXHg00XSpI+Z5ZIQQORAgPMnHQ9X0M+P07GWLgd2a8+aGawMFx13PWtaYTWTgdIqcXtfkbk1CYZL5edkoatF5tEVNoRKMMpVrBDo3tXaP3zBuP5h5W9HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gwoMLsnP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kNcUypTY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QATfv7004499
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 12:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o7qburXdLogQXlPc8cleXsXcVe/PjiYelTmyym6qtSk=; b=gwoMLsnPxlLHwBV8
	WQr182rtxj0/J8RYM3TkoqyxXfBDVgTphGde+to3/LhQYQOUeocG0clXFRTXgyQy
	YBOXXSM1Vje1ZeULVNuBPAZOWV82HJ4VhYkmVluVoSaJCQXfKV2xrGFnNMM7hj35
	dukIBY8DtrWhBlDI/E3Nvdd9CK5j46xfeifb6XcCMbrxH1XW59O0cZNT9nW9lixF
	MMM0dIxMUb8bOO23ulCBIwEQDiBcv88ojgMtSENSxOZb+j30ubc7j7tRfdq1w1f+
	XNr8c/R5EwlAsHIIHsEAgSPQ5i9XsIaKXkRbM62P7Z1fWF3f9hCjcYRdrUFyHTzh
	bH0p2w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecsm03nxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 12:45:28 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdd327d970so6216909eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779799528; x=1780404328; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o7qburXdLogQXlPc8cleXsXcVe/PjiYelTmyym6qtSk=;
        b=kNcUypTYGFvaoE4QJ7oQYY9MCtIWXkulgtePxCo8McsF06+JMqjHjn83z9DptHY2po
         45SOA455cphovd/5vWtts0UBuXNPw6soLzKgHqtERrYxMZhmmRH0oxnV6KHrpQ2k0+bp
         LU+HpJNIa5yTfq2OgOezBphJfXuAYKDqY5Xt9sqVpvvIvWQmRgRBkmZOKYv2bR1+iAIS
         eednyiUvutC5CrZBIVIeTcFCoOuSJRV0Ttta8SgUaZyNj4k5LWz6xdGobNJDASEikNgp
         sqLe3ZcGiOZ5K+63r3WoPFUxSEH/tG82oyrIiwweKndyWsjmomoLJJOui40RgIpYVyMN
         nLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779799528; x=1780404328;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o7qburXdLogQXlPc8cleXsXcVe/PjiYelTmyym6qtSk=;
        b=q1Sx0oplmG1TMOwp2Y5+c8ETz+5AZOHJQPStiyHNZYZY/cqDtKs5tu3Irt0ChoDAVB
         KFfREuCF3gn9MD24oDUuKZuO0QDkPjvwAYNYiVt9iMP2uplVkhsgnYE09nvAzrEsB6in
         TWGcWeSihdhVp1lodZV6ItYF0J5ZpWdDg6tVmyLWa/9vp8FZNA9q5hrfX8gfPnpTqUGZ
         f+8iSUFkWIpMkeKKbfaZKvru8B9yUWs3bBd+eO3j++X1Oi1nDfka1zebTIT1ZFbo+pOB
         pDwe1+IeL1VQ7QT0HrHQDaBeSQTEKGJh6t/I5WpCx2dy+Wk1q31CyupbpA0v3mbrLSEw
         1N3A==
X-Forwarded-Encrypted: i=1; AFNElJ8TedvVf2yb2mBON09wo/UJMf8cELAf1hWmPaJik+fgzfZ99NRrbkUhF5CieyJMfbzLkI8Xm+pZwTw2GiCj@vger.kernel.org
X-Gm-Message-State: AOJu0Yytkal8o5evHg0tn2V5LvVbzf6xBpaFjG89feH4WZm3NFG/yG0G
	6KL9U/4zGRQFvhPmSJffrp7yi6TWEKAh9Q5b2Sge1RSWqAMHy1FVKCDTcU/IwOZWZoz8HgrBpCl
	VspByel1qgdSQbw/TwcDx3pmeMgnlQtdtwP5OwgnWs0lrvr0yoYotO5QEVcXUPN5/NK5s
X-Gm-Gg: Acq92OFKUdeI4uXDZ2kYzPHlsVXdDwR/hrvzMvEm3g6LdVW4zYoBhvLtybCuDl085gR
	jKtpqu/WMKtlXk9SrAqIR+UmswTJ9RAJ97fV3gnx2y5jVGuiqwSaTlGOjVn+rAMIVILo89lyBok
	80loMdVeSGN3XpCSqSkxF9FFKxKjdgg9zdkQfaBJz8Phl5lt6yBb6oJ0+3J+ytAPvBbi3Ddw7JQ
	fxzGulZVMNERngd598vz16Xur6R6RvqSWXRfU3vet4VY8OOLqR5sf2j1gn7uxdTtSKbofQS6o0d
	mFBem48zFgZfOxa7HOV3OlpSW/KNidzdGux09KTjoyIkY5i4KQeAwBoZ4pjUO+1ujB5BwTQfnIn
	LETZwmUW7NO3ZYEdoUuaXx7atA45GNp0qdKRhuSvOSCaQJ0yqe0lT
X-Received: by 2002:a05:693c:639a:10b0:304:ad0:e91 with SMTP id 5a478bee46e88-3044a3f9bd2mr4384941eec.4.1779799528207;
        Tue, 26 May 2026 05:45:28 -0700 (PDT)
X-Received: by 2002:a05:693c:639a:10b0:304:ad0:e91 with SMTP id 5a478bee46e88-3044a3f9bd2mr4384916eec.4.1779799527411;
        Tue, 26 May 2026 05:45:27 -0700 (PDT)
Received: from [10.68.117.51] ([146.0.28.136])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30458ab1a46sm10193303eec.24.2026.05.26.05.45.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 05:45:26 -0700 (PDT)
Message-ID: <feb42925-5704-4266-8c3f-aa944fdbed28@oss.qualcomm.com>
Date: Tue, 26 May 2026 18:15:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] media: qcom: iris: add support for decoding 10bit
 formats
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260521-topic-sm8x50-iris-10bit-decoding-v4-0-8ff8fce3f904@linaro.org>
 <fa26f61e-86b6-4612-afae-7726e3b35c4b@oss.qualcomm.com>
 <12102d68-da35-47ea-a972-28cb6d54ce1c@linaro.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <12102d68-da35-47ea-a972-28cb6d54ce1c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CLEamxrD c=1 sm=1 tr=0 ts=6a1595e8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=iVdU4/i4LgW7qdSeEk1S9w==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=bC-a23v3AAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=poQuPI4Y3rRwBnmNrTsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=Vxmtnl_E_bksehYqCbjh:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: MIl3gyFXs3_2jcFKzn2hXay2jaPpXBqh
X-Proofpoint-ORIG-GUID: MIl3gyFXs3_2jcFKzn2hXay2jaPpXBqh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExMCBTYWx0ZWRfXxpyncvpwP+93
 xaIZEwZCBpYvoojkUeDgRc2Dn8Jl8r3y3yxd9NqFEzxCNcDaZdUHbKSXDnxLo+JrqelZEhk4aVT
 br+ZXOtckB9//foSaPKzwrnThMIjvMTjdNlyolO5UQeZ7kSE1sd0pMNixOLGQtpzMlBkwmeu0ve
 x5+LPqdwsC9//k/FV81aFOxXqCmgn/k4vZrXP4g8lsDzs0HYNdBy6EpSQHEIWCWNPGftQYXFRp6
 Q896qYcYuLYUdscjNsH1yRBxy+Yx91QNEF2dYIm1hHt5ADoZ3NIcL1g+JxmeqS2ctFqc1+8FEj1
 ZTDLhSd8qfxT6o76k01DTf1pPFJEDeCUKi/Dbra43+1EzYuIvURjsR9+ebRN8y8q7YYBDwJ3Oz4
 6EGrDhJf6T+OBF+qcMBUjJTCXL5K4iTsQCBOY4MOE4wVzB2hnJAG4pfiz5FJZYjpG8BJYLML2JO
 XHAfvSLUhi1hYkFDcQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260110
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gitlab.freedesktop.org:url,msgid.link:url];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109810-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 24CC55D5BC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/26/2026 6:09 PM, Neil Armstrong wrote:
> On 5/26/26 09:53, Vikash Garodia wrote:
>>
>> On 5/21/2026 2:54 PM, Neil Armstrong wrote:
>>> This adds the plumbing to support decoding HEVC, VP9 and AV1
>>> streams into 10bit pixel formats, linear and compressed.
>>>
>>> This has only been tested on SM8550 & SM8650 with HEVC, and was
>>> inspired by Venus, DRM MSM and the downstream vidc driver for the
>>> buffer calculations and HFI messages.
>>>
>>> Gstreamer support for QC08 and QC10 need the MR at [1] to be applied,
>>> but NV12 and P010 works out of the box with mainline Gstreamer.
>>>
>>> Fluster HEVC results on SM8650 using Gstreamer:
>>>
>>> ./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2-Gst1.0 - 
>>> 141/147
>>> The failing test case:
>>> - Pixel Format mismatch
>>>   - TSUNEQBD_A_MAIN10_Technicolor_2 - Gstreamer waits NV12 but 
>>> decoder returns P010
>>> - Unsupported resolution
>>>   - PICSIZE_A_Bossen_1 - resolution is higher than max supported
>>>   - PICSIZE_B_Bossen_1 - resolution is higher than max supported
>>>   - WPP_D_ericsson_MAIN_2 - resolution is lower than min supported
>>>   - WPP_D_ericsson_MAIN10_2 - resolution is lower than min supported
>>> - CRC mismatch
>>>   - RAP_A_docomo_6
>>>
>>
>> <snip>
>>
>>
>>>
>>> Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 
>>> 0, Warnings: 0
>>>
>>> [1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/ 
>>> merge_requests/8195
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>> Changes in v4:
>>> - Picked review tags
>>> - Use u32 instead of __u32
>>> - Explicit DPB
>>> - Drop NULL and use >>1 in q10c buffer calc
>>> - Drop selicolon after switch statementr
>>> - Correctly align HFI_PROP_UBWC_STRIDE_SCANLINE entry
>>
>> Its not very clear. Does this fix the issue reported here [1] ?
>>
>> https://lore.kernel.org/linux-media/fb377b11-c54c-4bd9-bf12- 
>> cf19d6484c66@oss.qualcomm.com/
> 
> I wasn't able to reproduce the issue, and the reporter never answered my 
> questions so far.
> 
> Neil

It would be nice to add the reviewers directly as well.

adding Wangao now.

> 
>>
>>> - Rebase on media next tree after the file split
>>> - Link to v3: https://patch.msgid.link/20260511-topic-sm8x50- 
>>> iris-10bit-decoding-v3-0-7fc049b93042@linaro.org
>>>
>>> Changes in v3:
>>> - Added review tag on patch 1
>>> - Limited stride command to AV1 decoding only
>>> - Link to v2: https://patch.msgid.link/20260417-topic-sm8x50- 
>>> iris-10bit-decoding-v2-0-c987b65a31d5@linaro.org
>>>
>>> Changes in v2:
>>> - Fixed bug breaking 8bit decoding
>>> - Dropped filtering on G_FMT while waiting for soure change
>>> - Dropped format filtering on ENUMFMT
>>> - Switched ALIGN(x, 192) to roundup(x, 192) because ALIGN works only 
>>> with Power Of Two numbers
>>> - Cleaned and refactors the width/height/stride calculations
>>> - Cleaned and redesigned the buffer calculations functions with 
>>> proper comments and var names
>>> - Passed fluster and v4l2-compliance to check for non regression
>>> - Tested on SM8550
>>> - Added missing V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10 with made 
>>> gstreamer fail decoding
>>> - Link to v1: https://patch.msgid.link/20260408-topic-sm8x50- 
>>> iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org
>>>
>>> ---
>>> Neil Armstrong (6):
>>>        media: qcom: iris: add helpers for 8bit and 10bit formats
>>>        media: qcom: iris: add QC10C & P010 buffer size calculations
>>>        media: qcom: iris: gen2: add support for 10bit decoding
>>>        media: qcom: iris: vdec: update size and stride calculations 
>>> for 10bit formats
>>>        media: qcom: iris: vdec: update find_format to handle 8bit and 
>>> 10bit formats
>>>        media: qcom: iris: vdec: allow GEN2 decoding into 10bit format
>>>
>>>   drivers/media/platform/qcom/iris/iris_buffer.c     | 195 ++++++++++ 
>>> ++++++++++-
>>>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |   8 +-
>>>   .../platform/qcom/iris/iris_hfi_gen2_command.c     |  75 +++++++-
>>>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   1 +
>>>   .../platform/qcom/iris/iris_hfi_gen2_response.c    |  37 +++-
>>>   drivers/media/platform/qcom/iris/iris_instance.h   |   2 +
>>>   .../platform/qcom/iris/iris_platform_common.h      |   1 +
>>>   drivers/media/platform/qcom/iris/iris_utils.c      |  16 +-
>>>   drivers/media/platform/qcom/iris/iris_utils.h      |   2 +
>>>   drivers/media/platform/qcom/iris/iris_vdec.c       |  42 ++++-
>>>   10 files changed, 364 insertions(+), 15 deletions(-)
>>> ---
>>> base-commit: 86693e86019a7466be961fd4f45d407cc0b0ba0a
>>> change-id: 20260408-topic-sm8x50-iris-10bit-decoding-074c3ac7975c
>>>
>>> Best regards,
>>> -- 
>>> Neil Armstrong <neil.armstrong@linaro.org>
>>>
>>
>> Regards,
>> Vikash
> 


