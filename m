Return-Path: <linux-arm-msm+bounces-83229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77630C84909
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 11:51:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30B003A2A97
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 10:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A9B031282E;
	Tue, 25 Nov 2025 10:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MzD0IIJO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cSfS4u+u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C591A2EB845
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 10:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764067859; cv=none; b=MAlM9sZZk9XXlm4PUMmCwJsvSyvrFeMoBgKlW/BUKNJl8M9pfNoez/e/GzBYudLQBGyW085l7f4TeNnMdxq3DGv5C+4Iw/PwdvwjNh884EZJKIN8i+73SyLwT0GIuH4LKw7QiuMUcOuX4D92VcGhMn7ESGB/QOMEZHIw4+ARE1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764067859; c=relaxed/simple;
	bh=Y8rY+5Au5ZK+QNjSY+KOYQX2N/OPbL1L8+7cdTxyqxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NMK3uCeM9Bdj85YqJ1Q+iGcUdtU5l9To1z5RhMreJlHcG2sdv4aFdss6H3nHKjjffDV2vcuctc0d0aHgSZQLkBHDXewtYY34rTs2k7HK0gDlqDCSQoW64Rjil5EEwhP7u1EK1X/GKPx03RnJ2ZJLxZjFyjT8yY13sYtMz1aFsTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MzD0IIJO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cSfS4u+u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP9x2XH2149776
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 10:50:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yspArwOnLqv223fRoL1R+QUt+mUG8lJU6eNibL7HInw=; b=MzD0IIJO7JBko07m
	O3pfvDWmH5uJ1mtZa58lO++7IxB0wSLT5tcrugPUDjwO5EmxDSkNVoh/jNdcy1Co
	pZwLduB6RHC3gAmDCPZRtH3OE9w4+sQStOb/o6Tx2yuEDhirdguByd5FVd9iPpd3
	uWte/S5Yc8+AsLfPcdJNx3pVaG/2JUxa9DZOxU9TMOregDKLiXuQ8lTvsUMDeV2v
	gApXcwcOB3sHAwACtiEWJEIPjl3LnKbICv6aRI48v+N2GzU16Oam29JGTF3t2UXE
	E0PXxpwTUL5sOtmsMSRUQgG9mufb+xDJStpfa0M5GdW02tigNyU7UqKBWf6HPxjj
	EY+U2w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amr8sbeb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 10:50:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed83a05863so20481891cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 02:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764067856; x=1764672656; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yspArwOnLqv223fRoL1R+QUt+mUG8lJU6eNibL7HInw=;
        b=cSfS4u+uXf4LSNQZUeu0/Yh9iFRnyxgj95QcmBZdB8mCaDobUSh5koLn+QduG17Rpa
         E8wp6XIs5VW+2CqXIkM8kpz+e8Riyny0KdgugAJjpSbZEoz+9PmTihAnKpf5vh8Lr0H7
         BGA9IZVcbr7GH0iHW5M6W9xTVPLacMWtymiJyh3wwqUna5BkUjeiaNV+Yb8YUSDZ6l3t
         XBzwSmJQQ9jKLKDZdsIu5SvHTLBCaKVG35A6OdKkGvOUfe8juzBOh+q3wXdNKeE0BM9d
         ZkELjgBmJg4t6DtxXF/VT9F8VgYtVB8iLqPzbDN2BfZGggQO/DndZIWhL0Ckhf4qWq9B
         ilng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764067856; x=1764672656;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yspArwOnLqv223fRoL1R+QUt+mUG8lJU6eNibL7HInw=;
        b=EOR5e5vaA0q3YtYc9u3VkAxC92BWm184RRUoXXbTohGXuH3g19gE0b0pa4Q2vY8z3O
         5moqeTVcCGCWr96U5IvVAdopoWTlHrpfnk3ZwE78XnUdBTYfKOPy3YUS5rqE9fMoZvnV
         RMM6M3y1Km6u2aHqjY0SqbwqR4npAEdzkJi05kUGek4GNu9TkyXzQIkQLTDOa80msZ68
         c/VvqUhDHnEZE5SgDV0k3ztY19p5gbUIfhvMyyPrQCAKNX9vNJ/vjFYoHE95ZZnM7Smn
         z5x4W/VbTt+n44v3FIY6vT8P2DGtGxMmjCh12sptwvLr0FUSDphbQyOslL6H47NOxa+1
         peOg==
X-Forwarded-Encrypted: i=1; AJvYcCVJkVGEF572gr3PeyIDh+sZSGwkeUVqUDWkpYgSIEJBzEyVLfPgQb1vAiOGB4M1Hl4P0SOle88j0V9aKyJD@vger.kernel.org
X-Gm-Message-State: AOJu0YzSaOVN/6tMfssYCN95SQngQO5duINhDpv1t6n5UvAKYpCdzWFK
	KuwQL4wPMOEK1KZuJ7UulCs3oBT8lJ3jYthouVR9V+LVOSPfVcPBy/DgydR8BBklbliF3sn4yMA
	oiNso8AJ2BCDBT+m+FAbrEm5uYcri6e7QKtxufKL4UCZ6RjIurt5inhP6O+x9yqc2bCg+
X-Gm-Gg: ASbGncvBS7Oz26uMO6qazkU0jwoc9S3+1t+h3X9CpLXaiNSye1xe+xX7aGK6JFF1uh5
	s33GO6M7crL4joPFhJdHf2jRzGFfjjLlA5EdhdNTnTPQPX6P4fJ1XaYbVqPKFYyUbpTG+THQK5R
	y1Alw3MPVKFYal3YWMNkzz5/lTvVOjTtC6kSe7niQe/EgeOrzrWST3yke6oXgJwtLtEyqsEQQgU
	q+ed2qLbFlRDNy7wW9j94GRFRLQ+uS8YtGOwIchEusvA7hwSiNrzBMRgp1L4TTKAJAvLxtRqy04
	UgNVDFWdW93lbB8BiFB+lAqsLLZt3Y6hVJJoGw0bDAlAxOdTjEZ2oDdUP1fmE5kJItGM30fpkIa
	q+qH7BWTo6IngyQ1kHLID2RmU5pMj7CsWC9o2sfB6O4f04RiflxZh2Gq5L5FnxCxJvo0=
X-Received: by 2002:a05:622a:508:b0:4ed:67c4:b7b9 with SMTP id d75a77b69052e-4ee5883b027mr157643821cf.1.1764067855950;
        Tue, 25 Nov 2025 02:50:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHeRxosmjSzwYIGSlvLWY4dKR1IuLfRK2KLhya3HT9NervKn0yCKlZEa9BiEdQlq+PPGCZpnw==
X-Received: by 2002:a05:622a:508:b0:4ed:67c4:b7b9 with SMTP id d75a77b69052e-4ee5883b027mr157643611cf.1.1764067855315;
        Tue, 25 Nov 2025 02:50:55 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-645363ac9a2sm14733927a12.6.2025.11.25.02.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 02:50:54 -0800 (PST)
Message-ID: <7a3e2e3a-1a6d-460c-846c-209474c2311c@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 11:50:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Add TUXEDO Elite 14 Gen1 (X1E78100)
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Georg Gottleuber <g.gottleuber@tuxedocomputers.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Georg Gottleuber <ggo@tuxedocomputers.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>, stefan.schmidt@linaro.org,
        wse@tuxedocomputers.com, cs@tuxedo.de
References: <20251121142623.251118-1-ggo@tuxedocomputers.com>
 <af3d3295-1340-417f-8682-7d7e2bc6c812@kernel.org>
 <aSGXu7IhPDNSkYhi@linaro.org>
 <280982b8-ce86-45aa-812b-ef1bf6e57e3d@kernel.org>
 <f8ebe524-1f0a-4f54-96ce-aa36f8659adc@tuxedocomputers.com>
 <7716b83f-409c-4fa8-8232-89d3d1be5dd6@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7716b83f-409c-4fa8-8232-89d3d1be5dd6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2ApUGRiWUSJ7ZlzlpNEPgGluf_GZajEz
X-Authority-Analysis: v=2.4 cv=KP5XzVFo c=1 sm=1 tr=0 ts=69258a10 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jOz9I0nGxiDzdx2m7CwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA4OCBTYWx0ZWRfX9yVO5bwVndcf
 +GmhEEK9h+WpMfyImWysL6rn7/efqPZMI4O0aXD0jxJCX06zaP4v8RKAjgnuQtHZ5kJM6zekVjh
 Glt7WTOM4WAqceKYlc6HqSMRrPPYiVdlX8p8d0aQlkwj5nxANrz0I1Yj3GVjxwVGcNHyShVPQUm
 i+iZixz9VEf0f/m8AsFOBqcf8D/Kwwx6P5IyhoTk0kX8bDuQs0xHXCI+VTDEQ/usK8lJYaNOYa9
 qV05cBJtZhJ0BWepQjqxdRG0HIt9Gae9ot/8u1C2C71758r+lfHiuojpXKZ4JAgLevtt9b2Ee0c
 Pzk9zOQ1gpq4sZPPrGfSKpvG4nMO7zXbG5D2efs/+XpfLoqNiKAgHlr32fC4pdW/vuYnYHF/fvL
 7hchj2W0wfPnGWFEESnBduo+OqLGMg==
X-Proofpoint-GUID: 2ApUGRiWUSJ7ZlzlpNEPgGluf_GZajEz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250088

On 11/25/25 11:37 AM, Neil Armstrong wrote:
> On 11/24/25 15:09, Georg Gottleuber wrote:
>> Hello Krzysztof.
>>
>> Am 22.11.25 um 12:15 schrieb Krzysztof Kozlowski:
>>> On 22/11/2025 12:00, Stephan Gerhold wrote:
>>>> On Sat, Nov 22, 2025 at 11:16:25AM +0100, Krzysztof Kozlowski wrote:
>>>>> On 21/11/2025 15:26, Georg Gottleuber wrote:
>>>>>> [...]
>>>>>> Initial support for TUXEDO Elite 14 Gen1 laptop. It is based on Qualcomm
>>>>>> Snapdragon X Elite SoC (X1E78100).

[...]

>> I understand your frustration, but I'm still learning how to contribute
>> to the Linux kernel. However, we may be able to find a constructive
>> solution. Here at TUXEDO, we have the necessary Medion device and have
>> already adapted the device tree.
>>
>> Would you review a patch set for Medion SPRCHRGD 14 S1 Elite?
> 
> I think it's worth re-spining this patchset for the Medion SPRCHRGD 14 S1 Elite
> with a comment in the DT mentioning the device tree is compatible with
> the defunct Tuxedo Elite 14 Gen 1, since the Medion is an actual product
> people can buy it's worth it.

+1, especially since you mentioned you have an actual Medion at hand

Konrad

