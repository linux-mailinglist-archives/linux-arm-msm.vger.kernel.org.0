Return-Path: <linux-arm-msm+bounces-81276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CC7C4DFC6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 14:00:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8EEE18C4E2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 12:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 207EB33AD87;
	Tue, 11 Nov 2025 12:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l1dLlr/F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IBxUAlGM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9C12E8E06
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762865035; cv=none; b=AYwo4LtXsH8fP/qtWz7II0VRY4CX9r6Sr+efgS8aMJh9urdeElZ4dvmvnxfbT7B94QNSSaPxjeANzmb2ytNquYxy1Tt8aGG/vhHPrkZ/WclRiI5NDPhFKyLhVnMLuudH711wGdcES7RYAzycCokKBm1PT15V9ELIGryLmiQ3kIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762865035; c=relaxed/simple;
	bh=Kj9udI5+8LrV+ir4kfGot1dJx+xvrAlxiebPOyOAxpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KfoXK6Alo6GisNO1nyn9sTaImRGg2sAhQmH5DvICqyqLyzjp6IVEJYCuVkuyDeNJOnnFHIdvwaZCHWm1b974ChCTHugRDADW4W/+fdbz3To9O4MSXEmvwCGTAUxl4g4cVcBI0TwHzs8GqMXjDbdT8ANP57PdZUaA+cqjAu/Uoek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l1dLlr/F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IBxUAlGM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBGBVe2165207
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:43:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I27iL0xTukeBgsDvY2yAuEtDraoFnlxjI9IfkTZL9QE=; b=l1dLlr/F/G6JIrNd
	bT+d9arVh9SkBLjOAhujMu3H3USOSt8PgAfSKbJPohZRlhsZFHCSL0Ilb8XGRHVI
	eeXuGhbTggF07ZQ/P/PU2DBLPIGzMxwehq7e+3ul3eW2DvAytizxPAE2MaNptWNh
	suWGUs0z+ytVD4iqDSSr1HrAMSfRq4TrON/E9Vsj+jdgKfB+E2+WLjTbesUddGrv
	VrRShKq1WSw5e9N1raUQRNRUoxnyC50VmBKwt82H060StNZWVwboKMBJiOv8ceH8
	v7VCIwJcr6RWCK/JULr8f8q+4X54qxe3W1OOoS2WIP9pSm93VE54kWOYkq0KAL5J
	U3y8Aw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abxhhh9rf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:43:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34378c914b4so3480935a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 04:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762865032; x=1763469832; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I27iL0xTukeBgsDvY2yAuEtDraoFnlxjI9IfkTZL9QE=;
        b=IBxUAlGMHEHLy+5c0vcvt6KqjiT2FZ8mpdCakpnf5vtDMVkXElRez1QcojplAbFzT9
         MmPOQPLxFKMi6w/nmWJ842uqQj787shZrCspMcLHrTXyhTfaTR6iipSphnUX95TGi4Q9
         BI4tmExvDJvb0/rcfgGi8idcsppvkXm2c0YdsFHMZqX/FpNEX0nTex1rvzhgIpZXziei
         XNrQ0hNkik2m+OvoLH+GfzDJ3gDoHfG/JsAF6wBPND9bXBZ9xZiCDaaG8lJ504Fqimue
         ptPJ6MuuOBkpMEw6MgJhY96gfiJH7lCKGMP05zsdiONYI9+wza5Ut6Z3t/Qx+7OQzobh
         buTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762865032; x=1763469832;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I27iL0xTukeBgsDvY2yAuEtDraoFnlxjI9IfkTZL9QE=;
        b=veqFowVWnPa8YI0qGSgNUqyGCoxd2jVTVRao3wZqWFX5SAaSVy/M/oTjIwfCso8ux/
         17e62JB4lHY442diVF7UHeDxS7+dxfsIm97mt5ospqcNTo3j1S0JVTbyzV6xYeqabBKn
         1QodObWzbpJ3FWxiUwOVMrDD/mpSaY5FZmFg1XK/BqDxr5A4Wl/fUpTZi2NgVUqH71cv
         u5zfxL7pXTkavYsPFLUtYEBLYAaqKIYq+DYStSGDhCYpV1CykAWvrNfDhmVriiH0abkH
         fTBBMxOKtnTaSbJubmSMUV6QnYSr+0kW+bRiJhHFafm0fZsj4NlZEHwq4izU6P+pA85T
         X7lw==
X-Forwarded-Encrypted: i=1; AJvYcCXT/mbJ3Vd4ZOvS5D0ARkrBhqGXxZU5/pxfac800Wdtcb0qM/O3ZkOO9R4cdGboP5RICrODtAVZEDP5wyOE@vger.kernel.org
X-Gm-Message-State: AOJu0YxnTou1TG6wC0hm+Gvbc2ShSDwkDkgj4qGu2dBw6+ed2WwZGGsu
	ax+mEBQ0LYq11DhEXCUQEgpLy1aIce7NSplCUExhCKv5K4dFjnkdTrG7lU1p8/ALB1BkMc01BIr
	gWDGEec0C1+fQ9XzdYs6s3rkbge83nLqrga/18FxLf4hhfzNxH3Lh6M809VA9rxmHcc06
X-Gm-Gg: ASbGncvMMoSPyqHhtXsPnQY+Zocugvxo/leMGE9ikjInN/kTOoQcV9kcgck71i7YtLi
	Hdg24o6Fv+BKGziqMFii8QT7ocyaWnjaZgoXqV/8+nYeyBVJyjAjwV+uOTKc8XaaKyE4T47EFl3
	N7dPynjFC/z5DywG19dlZdg546aog9YjlIihtSbWxlYVa4pL7WFPaU+Mihm4Fr0DqvevnK2UTUg
	oAUPx7uQndzmzOwngsSSTETxy5k0jTZi+QEQZG2KeiSlcCnzdx+t/pNBQTLUqsxBSBmbzx5FRd6
	TE0ri4nAM4KnrEnNdi6k4QDbAIgUpAdlLqzvwZeHwdjdjKiSsSaes9xgVSi2gAnNEs+KZH1Yltn
	Bck2bJ1Sb55yMybYo/Wc6WbABdSCRKIaS0A==
X-Received: by 2002:a17:90b:3506:b0:33b:a906:e40 with SMTP id 98e67ed59e1d1-3436cb735e0mr14270808a91.2.1762865031667;
        Tue, 11 Nov 2025 04:43:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNsRrK1r+sGPayL7tZtRhHjpLvw+oRyJ5XgJB73fyN46t2ckrkv9C6hFrZnt1U5fCf/suKyA==
X-Received: by 2002:a17:90b:3506:b0:33b:a906:e40 with SMTP id 98e67ed59e1d1-3436cb735e0mr14270754a91.2.1762865031138;
        Tue, 11 Nov 2025 04:43:51 -0800 (PST)
Received: from [192.168.0.171] ([49.205.253.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68bf37bsm21198626a91.7.2025.11.11.04.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 04:43:50 -0800 (PST)
Message-ID: <2d56fc4b-6e3c-4f83-aab1-c48db3b8bb2d@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 18:13:44 +0530
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
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <3vbq76dpjnadfrnufojq4zqiv7p5p555rhxfx6yoncc354p3lk@ohcs3ldhuoao>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Pc3yRyhd c=1 sm=1 tr=0 ts=69132f88 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=qKS+5dAnvCMTy05vH4hvkg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=2OoCl90f4T1uiMieyDQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: RyO2NL9mzpWGYv6Oc6CMxgPPIZIHEqFc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDEwMSBTYWx0ZWRfXyWZoyBBEWKjF
 xaIB8wXWZcJrHgzgNXjuJnOiuJ9G3R6xqxu22yxIW5q78YPEt4gfeX0yfae9u93Rur86zgGNN/9
 Y4R3BHx41l8nuQI8JFyDRlux7yYlXIiQixuYCpl3iOPrAplc/JUfRKBKErRh0bm/gnrIho7ZVH0
 7/YqAlYFz+0tAkfAepK9PyMNLhJfbI0ePuv5ci1Ej5NT7uyd2U9OTcb5vyvuzf6Qq9VR822X6+d
 Qa038FCLngpTiNkChekhThRUnZR32TlZ6jBRInTJZ7lwZfvTPJR2j/fLl3i3JfnvTqo09VjLEh1
 paMiZ23rCJz3y2vkZ1NCfe6vYBG5rmR9iQkVkiv65KulW+rghzeJPVbKOnV2edWbb7p9ZjWrAfe
 4VvbOY7qOG4QekDwNlJ8kr71J19rqg==
X-Proofpoint-GUID: RyO2NL9mzpWGYv6Oc6CMxgPPIZIHEqFc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110101


On 11/11/2025 4:08 PM, Dmitry Baryshkov wrote:
> On Fri, Nov 07, 2025 at 03:19:35PM +0530, Vikash Garodia wrote:
>> Upcoming Qualcomm kaanapali platform have a newer generation of video
>> IP, iris4 or vpu4. The hardware have evolved mostly w.r.t higher number
>> of power domains as well as multiple clock sources. It has support for
>> new codec(apv), when compared to prior generation.
>>
>>  From previous version of this series, the kaanapali binding patch(#1/8)
>> and the compatible patch(#8/8) have been dropped. The discussion for
>> this is captured here [1].
>> The series introducs buffer calculation and power sequence for vpu4. It
>> prepares for vpu4 when kaanapali is enabled after the binding discussion
>> is concluded.
>>
>>
>> gstreamer test:
>> Decoders validated with below commands, codec specific:
> Why not just run the fluster testsuite?
> 

yeah, fluster can also be executed. Individual codec commands were 
explicitly called out incase someone wants to run standalone gst pipeline.

>> gst-launch-1.0 multifilesrc location=<input_file.h264> stop-index=0 !
>> parsebin ! v4l2h264dec ! video/x-raw ! videoconvert dither=none !
>> video/x-raw,format=I420 ! filesink location=<output_file.yuv>
>>
>> gst-launch-1.0 multifilesrc location=<input_file.hevc> stop-index=0 !
>> parsebin ! v4l2h265dec ! video/x-raw ! videoconvert dither=none !
>> video/x-raw,format=I420 ! filesink location=<output_file.yuv>
>>
>> gst-launch-1.0 filesrc location=<input_file.webm> stop-index=0 !
>> parsebin ! vp9dec ! video/x-raw ! videoconvert dither=none !
>> video/x-raw,format=I420 ! filesink location=<output_file.yuv>
>>
>> Encoders validated with below commands:
>> gst-launch-1.0 -v filesrc location=<input_file.yuv> ! rawvideoparse
>> format=nv12 width=<width> height=<height> framerate=30/1 ! v4l2h264enc
>> capture-io-mode=4 output-io-mode=4 ! filesink sync=true
>> location=<output_file.h264>
>>
>> gst-launch-1.0 -v filesrc location=<input_file.yuv> ! rawvideoparse
>> format=nv12 width=<width> height=<height> framerate=30/1 ! v4l2h265enc
>> capture-io-mode=4 output-io-mode=4 ! filesink sync=true
>> location=<output_file.hevc>

Regards,
Vikash

