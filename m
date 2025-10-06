Return-Path: <linux-arm-msm+bounces-76034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7985CBBDA21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 12:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 317C41896C66
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 10:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E470C225785;
	Mon,  6 Oct 2025 10:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NAtN7DHy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664CB2248B0
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 10:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759745420; cv=none; b=dLQAp7SAZ3wskdPdi9EhIQUQfAUAc6Rq2KBRr5utgGgwo8xuEx+9EQdY/8c7eIoNNKNnEtoEknMN2TshTJ2ndyCEQl/X9lrUL7+3/RNVEbHw8XKq8pi46itOLcuJZt7CCQFc99WBufJEJNBsgnXBAMIqanRQSvCii9j/U3PNQuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759745420; c=relaxed/simple;
	bh=U2IfsPJIglZbNLha2D9xYquVHVAKAm7qePp4wABBM4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YXAzqSg/lEsaTq8t+gUvpMzj5PxqO01cSrUlF0Ij5FbBqbi1cbSx25d7ldSXcOSAbkhs7ipz2SaUffSCJnW/KqFgLSuUisVGXna0+THRYAbZ/SifhAxn9psGUciCbhzSdfcqFu/ePAg1MKDx8vA5SR9di/K5vGw+RTCbj2MlWI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NAtN7DHy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595MXRKe024547
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 10:10:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YQ9JTnhy7/VFugNTC6R+z9mSCDzzqwGBYOtYIqduWzQ=; b=NAtN7DHyq3ZwfClP
	4BcHB4FvWVWkddyQhEj1JSJQ1NI4EV/Xg5kV44rS7aNrWzfVxun8QvSl3tATi84o
	nTeNbr4AXqu7YGel83kYMryezB3tUzENWb7p7o9Z1KRJ8LbE1UDKMI+5U4iFYLtz
	nm5OELZyVYoQDuHh23ao29jFFhX048LzURZ6GEnuW/U2c0hiDL+KkIGqVhCed+aH
	5Wuq20ccJqcby2ltn4U1YLD+j6tLYWjngzqxXZpCKHvIM2J5g8KCGfzHvL/YT17H
	WWDVY/oKXA4cbVVNTGzEa0Sy8FC5xCZk/ClEUyGyEnE7sruPkDqgEyZWBoZAbyKO
	vEWGmA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49k6bfjp8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 10:10:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ddf2a2d95fso17367741cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 03:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759745410; x=1760350210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YQ9JTnhy7/VFugNTC6R+z9mSCDzzqwGBYOtYIqduWzQ=;
        b=tuEnhmHtXQPu8O4g/a3i4MURoV49rViqp4qS+0MyWvFhoTosNA4MWZGuM9fe5NO/YY
         Ip2JHygjcdOHNHQK8sAmRUfYkfJIojAbW/MLe4PTIAYwOF8mBuNmyi4+SB7mWzLrYGhr
         zpMS9KbAPXMgWRr/Rlu8yzcl/6fGuwcB3VYrfq4xs/Cn7tlg3lwttSR6KxPczWYvxncQ
         AEP4WhPoYxZZ399Isp7+sTJdwXn7VoMeUcasYI/xCVYAw3qNJseYPgDgsKamELRaT/hE
         Pg9UENeRAmsb8LNadL2FQGNxTZ5RCuu5zKSmQhXtn8uAwathq2GeBp6lJygqacS+xG3q
         S30w==
X-Forwarded-Encrypted: i=1; AJvYcCUDOxZXcYAuj363rjL6pGohkOAfp30nMDEcthPLWhRVPbeY48oREFtJRP4u16T+dmQhQy70ZhNeoBw8m6na@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/eAoN2flzspCrwssUecJKMsf39id6pYfdzcQo8+Q8pZrSaGoj
	jOuAC2sbwC6H4NI83APXe9WNYNyMwN0VN1veVcGgST+c3NOltB26cNfkL56TrpfcZ4b+AGqF2YU
	Irnipn0qD4mkQca7iL1lpH6NnRohdW2k7LW61BAZz+twmouwO2MHiLC/ToeriVf9ui1b/
X-Gm-Gg: ASbGncsplF5Wtwgz/Z2SCHHR6L77g7GwjAXDPL7Ex1w1RPkX097IKbC23VN7bHVNJn7
	xyqzTcfg0JtAs9k/q8dxm0gf/oHw/WAp3X3YX04Ibbv6Px0lkoASz08CJ1jzBSkklv9yXfEbgqR
	DzNQd+rCzET4NKyXO8CKfDOTPEAFS7CcTUH72T4RYRGbEOk71bxzrl0/CKFNIuJgzKtdusY803K
	Fwi27vfr8KPzqWTFLHhlkGh2guQuesHGlcZJJlvKGc97TFWGsk7zSVBdcrxFd9EQNhmhW2A2Bmj
	2Q3mYun9qSwDm416zZtIm1uxC9BxODuqvxuxO1IavaPQ0IZkZRmbbMRHc1+UPr0P6cgl+bh+YIm
	Hm2r9S1kiPVmPoc4wdHEeRjMqjJk=
X-Received: by 2002:a05:622a:60e:b0:4d8:8b29:228a with SMTP id d75a77b69052e-4e58cca7939mr46373661cf.3.1759745410328;
        Mon, 06 Oct 2025 03:10:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkIaT5uOBugms5gwERrur4Q5H8ZrUny5IMG2QAlBQl/ctjJPOfhlmFXcEGWS3cXzuKqN18GA==
X-Received: by 2002:a05:622a:60e:b0:4d8:8b29:228a with SMTP id d75a77b69052e-4e58cca7939mr46373061cf.3.1759745409696;
        Mon, 06 Oct 2025 03:10:09 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a174a6dsm1115628966b.90.2025.10.06.03.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 03:10:09 -0700 (PDT)
Message-ID: <53aafa84-6d6a-4963-827e-c1600270662f@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 12:10:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/panel: Add Novatek NT36532 panel driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Junjie Cao <caojunjie650@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark
 <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Jonathan Marek <jonathan@marek.ca>, Eugene Lepshy <fekz115@gmail.com>,
        Jun Nie <jun.nie@linaro.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20251001135914.13754-1-caojunjie650@gmail.com>
 <20251001135914.13754-4-caojunjie650@gmail.com>
 <lfdhib6a7ct36nmj3of2setjft7ydrf6sfgtx7qued7qd56nhc@2xol3grm5re7>
 <e36572bf-4fb4-425e-8d10-c5efa5af97f3@oss.qualcomm.com>
 <rxm67cbwkp2qyxdlgqb3fz7fhiskmnhidhjvl4mhqn67iq2x4n@wfueruiiq7kp>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <rxm67cbwkp2qyxdlgqb3fz7fhiskmnhidhjvl4mhqn67iq2x4n@wfueruiiq7kp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tgWB0At1XWL7BIzfy6Vmcug1h-0CX752
X-Proofpoint-ORIG-GUID: tgWB0At1XWL7BIzfy6Vmcug1h-0CX752
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDEzNSBTYWx0ZWRfX+zW+P3TzohiM
 EVkVFnzvb0DwwlqH17uDzg+PaRnZ/WoBq3UQ35O31DoW4ECRS80qfGmQJ0nJxsgep+FDCwVawi5
 oM++4yHCh6OXSV5GDgbhZzlqKpcW5zAiMZdPq6U/Ei9Ch6n6xjP6ZxUHkfyC621Sg/Ithe3+6Xb
 4q2Hc7IyIT2vx5ANZPk1Ty/9/oL1s5Y3mx5/eaV1F3OeCkqNmhlVh0a2c2VHg599DSUdjX/aqZm
 FTOeqzYWpO23qLFpuAGzmOcDUtaXCQFGMssmnT3vUgcI7dS/ZCa0X1YsajnscLMccnw5vg7FJQf
 JZkG4wgY6iy18Uooqevv5rEP2eWpZA69afN7jbUdfOCbcad3h2JwpPeW2hadE39rGeiBIeRgo5t
 UgfByb2RpyDL+kyX5Thb8TMMGNYELA==
X-Authority-Analysis: v=2.4 cv=Hr572kTS c=1 sm=1 tr=0 ts=68e3958a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=0RrB5Ro-Ny3bBzvrWzsA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040135

On 10/6/25 12:02 PM, Dmitry Baryshkov wrote:
> On Mon, Oct 06, 2025 at 11:24:35AM +0200, Konrad Dybcio wrote:
>> On 10/2/25 4:04 AM, Dmitry Baryshkov wrote:
>>> On Wed, Oct 01, 2025 at 09:59:14PM +0800, Junjie Cao wrote:
>>>> Add a driver for panels using the Novatek NT36532 Display Driver IC,
>>>> including support for the CSOT PPC100HB1-1, found in the OnePlus Pad 2
>>>> tablets.
>>>>
>>>> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
>>>> ---
>>>>  MAINTAINERS                                   |   7 +
>>>>  drivers/gpu/drm/panel/Kconfig                 |  10 +
>>>>  drivers/gpu/drm/panel/Makefile                |   1 +
>>>>  drivers/gpu/drm/panel/panel-novatek-nt36532.c | 437 ++++++++++++++++++
>>>>  4 files changed, 455 insertions(+)
>>>>  create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36532.c
>>>>
>>>> +
>>>> +static const struct panel_info csot_panel_info = {
>>>> +	.width_mm = 250,
>>>> +	.height_mm = 177,
>>>> +	.lanes = 4,
>>>> +	.format = MIPI_DSI_FMT_RGB888,
>>>> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS |
>>>> +		      MIPI_DSI_MODE_LPM,
>>>> +	.display_mode = csot_display_mode,
>>>> +	.dsc_slice_per_pkt = 2,
>>>
>>> As this is not a part of the standard, what if the DSI host doesn't
>>> support this feature?
>>
>> Shouldn't the core gracefully throw something like an -EINVAL?
> 
> There is no 'core' here. Each DSI DRM host manages DSC on their own.

drm_dsc_helper?

Konrad

