Return-Path: <linux-arm-msm+bounces-81333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D2DC5094F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 06:09:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 238E51895952
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 05:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53DAE2D73B9;
	Wed, 12 Nov 2025 05:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MHxs/Pnj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZWs/Tl02"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC252641FC
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 05:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762924167; cv=none; b=d/ePSJPdOYEEuUhPOxuc8mzECiRzBplvxBfvtXS/YSVGfKmZKvlooNSiUMsjMZPbsl/k11R6oPlOHmChyjStw/l6ACEDDA8S489BRXBCCUdqqoi4Vlq8qE9gE444GV09s77Q6sLSmkCBzYBpVYj/1AsNnHdfuRAIm//w1mh533E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762924167; c=relaxed/simple;
	bh=yrQ4Wi+m86n4GhW05kI8lLRE5vTc1Qhg8tJHHH1/g9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oHTHf0iq8MPJB1wghzoI8aRiuid+gS1sYsAl97L41gJigb5uAworFSvUtGhS6+cIbznQdWrymAdCONU98ToWnGIgM1v0qYjEpCDYrG7DcHm1C3UAFAgxBvC6D382FZu8eRkXjO0ZIR87Kwn7ivIQTVyY0vU4J/coCONDlY0XQLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MHxs/Pnj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZWs/Tl02; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC1iC8B4076902
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 05:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/kLpbA2BRvdnyHSbd+/l6+opzXnsjWoDr4jnoi0JXlQ=; b=MHxs/Pnj1KmtNL6q
	0I45zBhV3sldHLuzrqzDUWAqt03f8SRWVFfMbx003SJKYQoCk8ataORPwG1B/wSn
	dwhC8I4bZGAMnIFG3y1rQRYkrV6hhWfmvOs0DvFPell/ntdYewTech5hgGR4uibd
	J6+QrvZvrGweK9t3GQCrABAUtG1Qh7xO/tFXJNmHEoGMnPBLzfmJo9WKr3P0J8VI
	Kux8ooLxd6qIbcAu8vqVD92qjaUSwuP8+4XWbTLtx7rOVufYwDRKFEQWCOA842+C
	7VEI43DHS/khobbcgn6jd03nlnZK0VFfqmY1yRe7zVpj8DMfR4WjdXw2MQ+qa9ts
	QP7rMQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acguagfqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 05:09:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-bb27b422cf2so792077a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 21:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762924163; x=1763528963; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/kLpbA2BRvdnyHSbd+/l6+opzXnsjWoDr4jnoi0JXlQ=;
        b=ZWs/Tl02+NSC9Nmcuufn2qwdEU+1DTD9PM4mWzsT5MH4Lse8K1Q4ERgP956UxnkacG
         /6vayHyjaNsgxzSjT8K1Y9hDBwFM87QORENIwh4FQEh0g2DrVX2m7zJZA1HfNmKralzW
         9QnwMoRwJyz5y/rGKlfcpL0OwlBjQrO6dNi4sOvDq29VaRgN+9CjfwE5+LBnuZ2IMfjl
         swNP515J8TDN/DAZ//ASQ2bVGJ+TII6tUAyhhQmj7Cu2RRK2KthZzNP00MSL7o3X7+mf
         KooQ/nJmlDEX9pHe3OFozLLwVfn3aiLhhMZkGWO/sdCPK7OcaUuCK0Vqi+r/2neRTf+A
         tG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762924163; x=1763528963;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/kLpbA2BRvdnyHSbd+/l6+opzXnsjWoDr4jnoi0JXlQ=;
        b=YTsckh79RczbyN2aS0lgamkSt/LcA9VTphAwUOk+IhBblsj81LU46ch5P8+ZJxiFHv
         ek30+xb+n6NrpXbl3msGDjtbIRa2vKOK3pWd1KA8ZZArk0ou4stPgQ2MbY2y7Ux1jHC4
         TaPKzAw+QH5LsWlexXDcuFKgXAhFn1kSYQKry51RHT7IbvnwvMJC6otCxI4KV3yOhQJa
         4+FqRH8X05dolu7nTQigIEDXBAWGhFON7vFp+xYiBMfsbq7Sv/iqx7aDIehnQKirehSY
         afLpZm7N15C/XzJann9ZwUAFO8nAwub8qse1F8u5DV2+UfB2n3pDCanoRFAzzL6MoDHd
         h2PQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdrJT9FFL8oOW+a1mQ4q36JE9XYbjCuwJFUk1r73Rny+3HfZz13aEdTdX1QiMqTRfM4FT9y0Ly4qilEG7f@vger.kernel.org
X-Gm-Message-State: AOJu0YyuMOtBEeqLsCo5hdiLGFXk4OLjU9veAv8ne/t61tto/7KOobJb
	hm3jNSNn18e2eIueahAszIXDP5+Awsqu9bQpUrc22T4yfW/uTji103TRqWoueoIVNpoT4TufQO7
	hIR/w0Xr2tFvTuh37LTnZKQpctcEcVfgnI2Zxoq2tCnuHI0ac8e4DXyVeiHgBl+/9IXSh
X-Gm-Gg: ASbGncszIAA7sZP2waJTMpsBKIHIOzuPm8bLHjTsUZooJI2l5Jn3BUe7/TOkAtjsB+l
	xldmBRu3fQtlxwy3oUvRGKhsYOgr6qMapMkIUfxBwfCCX6Lbp2DJKEqSL4st1IgZG8wf1ar+oZD
	8A6FLGs1S48IwbbmDSzIFdy6HC3CDEnJ2DabRlLoCWm0wUhjuqcGdYmJTC55BWPC7wchFqyXZvr
	fQrzJJiDGay2gA26IVNz06m8Kw8dF7dWOwSw80ByGUhuY6WjGy8bjkF4qfLKiWncVDaGi90TQe+
	T/5uQHxE4H9q/DaTDXHJYmFoz00inPT28H/GlPZqm0Kez2KBZrrqCf9S4gPK04Jz9jVEaC7qWtv
	8jcliNyiSpj4kArRRsewIDPc9DiPmum0fYA==
X-Received: by 2002:a17:903:988:b0:295:5a15:63db with SMTP id d9443c01a7336-2984ee03ba9mr22655645ad.61.1762924163369;
        Tue, 11 Nov 2025 21:09:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVrETxA1vmrXf2MXYfmlxs+jaaYYLcLll5MpiNC3cXmOxs4E0ag4D9YXDDr51YU14GMIQCXA==
X-Received: by 2002:a17:903:988:b0:295:5a15:63db with SMTP id d9443c01a7336-2984ee03ba9mr22655245ad.61.1762924162841;
        Tue, 11 Nov 2025 21:09:22 -0800 (PST)
Received: from [192.168.0.171] ([49.205.253.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dbd8d63sm15569345ad.13.2025.11.11.21.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 21:09:22 -0800 (PST)
Message-ID: <be157faa-b062-4726-83e2-ffdeaf792b50@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 10:39:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] media: iris: prepare support for video codecs on
 Qcom vpu4 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20251107-knp_video-v3-0-50c86cbb0eb8@oss.qualcomm.com>
 <3vbq76dpjnadfrnufojq4zqiv7p5p555rhxfx6yoncc354p3lk@ohcs3ldhuoao>
 <2d56fc4b-6e3c-4f83-aab1-c48db3b8bb2d@oss.qualcomm.com>
 <CAO9ioeXSXwm03e_j8TuXz2Sqr1J2n3uEFH6dJoKVyE+hJx+woQ@mail.gmail.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <CAO9ioeXSXwm03e_j8TuXz2Sqr1J2n3uEFH6dJoKVyE+hJx+woQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PtKOwPjkktROfY_yu5DLrU6DrspfozOT
X-Authority-Analysis: v=2.4 cv=ao2/yCZV c=1 sm=1 tr=0 ts=69141684 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=qKS+5dAnvCMTy05vH4hvkg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=uVA2hW3R18wvXXpizEIA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: PtKOwPjkktROfY_yu5DLrU6DrspfozOT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDAzOCBTYWx0ZWRfX5bmFr/Y2xwzI
 bNr5SRRav3m+QuKytD5lKWQLZavbScHEEG7nAMAycsX2qH3G7r+HGhIxe+MS4oNay2vLUxkqdK/
 LyJbYFctmVPIkK//xnhYIWkuwhryeak6dY64nOO3mPqFfUY2+8KEErkZXkPiWO9+6vrUDEgPJUS
 PDOM6QW/wun8Ijbs7P46rEMTNYEaHorLGg1N8zSM1m7qny/It9/QgwAoxd92w8bctsuc5kRU4UZ
 EjaitN3dcCKbcbP1Hp+QyFSTA1M4yt/BAGzkEOzrX97S3NY7q1ezVmqF6s2agicz0Q+5MZAiC0P
 vocr+uj5L3A9vVjLdCOwAiBBBGJShXXPLSEfylrQ1979iUBkxyDVpPYg/6N/MrehxxQT+an4Aza
 1/L02cWkRU+GiBpkS8itGppLWohKZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_01,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120038


On 11/11/2025 7:09 PM, Dmitry Baryshkov wrote:
> On Tue, 11 Nov 2025 at 14:43, Vikash Garodia
> <vikash.garodia@oss.qualcomm.com> wrote:
>>
>>
>> On 11/11/2025 4:08 PM, Dmitry Baryshkov wrote:
>>> On Fri, Nov 07, 2025 at 03:19:35PM +0530, Vikash Garodia wrote:
>>>> Upcoming Qualcomm kaanapali platform have a newer generation of video
>>>> IP, iris4 or vpu4. The hardware have evolved mostly w.r.t higher number
>>>> of power domains as well as multiple clock sources. It has support for
>>>> new codec(apv), when compared to prior generation.
>>>>
>>>>   From previous version of this series, the kaanapali binding patch(#1/8)
>>>> and the compatible patch(#8/8) have been dropped. The discussion for
>>>> this is captured here [1].
>>>> The series introducs buffer calculation and power sequence for vpu4. It
>>>> prepares for vpu4 when kaanapali is enabled after the binding discussion
>>>> is concluded.
>>>>
>>>>
>>>> gstreamer test:
>>>> Decoders validated with below commands, codec specific:
>>> Why not just run the fluster testsuite?
>>>
>>
>> yeah, fluster can also be executed. Individual codec commands were
>> explicitly called out incase someone wants to run standalone gst pipeline.
> 
> Please switch to fluster (in addition to Gst), ideally running all
> test cases for a codec. While enabling SC7280 support I found that
> there are enough corner cases which are being ignored by the driver.
> One additional bonus is that fluster runs several process in parallel
> by default, catching issues caused by several decode threads running
> in parallel.
> 

multi process issue is due to below [1] (tried it on lemans). Due to 
higher concurrency, we can see that the DMA buffer is mapped into 
un-addressable range (0-0x25800000) i.e 0x24b00000, and leading to 
global fault. This was the reason i was keeping 2 memory-region in 
kaanapali binding, to restrict certain ranges of IOVA.

Below solutions are being tried, again this is not limited to kaanapali 
and applies to existing enabled SOCs as well.

1. introduce dynamic device for output buffers which are big size 
comparatively, via iommu-map
2. introduce the restrictions to the addressable range.

[1]
157.511807:   SMMU_ERR_FATAL_NSEC_FAULT_NAME_REG : SMMU:>> 0x0x15000000 
NonSec Global Fault: NSGFSR=0x80000002, NSGFAR1=0x00000000, 
NSGFAR0=0x24b00000,  NSGFSYNR0=0x00000004,  NSGFSYNR1=0x08840884, 
NSGFSYNR2=0x00000000,  NSCR0=0x00280406

>>
>>>> gst-launch-1.0 multifilesrc location=<input_file.h264> stop-index=0 !
>>>> parsebin ! v4l2h264dec ! video/x-raw ! videoconvert dither=none !
>>>> video/x-raw,format=I420 ! filesink location=<output_file.yuv>
>>>>
>>>> gst-launch-1.0 multifilesrc location=<input_file.hevc> stop-index=0 !
>>>> parsebin ! v4l2h265dec ! video/x-raw ! videoconvert dither=none !
>>>> video/x-raw,format=I420 ! filesink location=<output_file.yuv>
>>>>
>>>> gst-launch-1.0 filesrc location=<input_file.webm> stop-index=0 !
>>>> parsebin ! vp9dec ! video/x-raw ! videoconvert dither=none !
>>>> video/x-raw,format=I420 ! filesink location=<output_file.yuv>
>>>>
>>>> Encoders validated with below commands:
>>>> gst-launch-1.0 -v filesrc location=<input_file.yuv> ! rawvideoparse
>>>> format=nv12 width=<width> height=<height> framerate=30/1 ! v4l2h264enc
>>>> capture-io-mode=4 output-io-mode=4 ! filesink sync=true
>>>> location=<output_file.h264>
>>>>
>>>> gst-launch-1.0 -v filesrc location=<input_file.yuv> ! rawvideoparse
>>>> format=nv12 width=<width> height=<height> framerate=30/1 ! v4l2h265enc
>>>> capture-io-mode=4 output-io-mode=4 ! filesink sync=true
>>>> location=<output_file.hevc>
>>
>> Regards,
>> Vikash
> 
> 
> 


