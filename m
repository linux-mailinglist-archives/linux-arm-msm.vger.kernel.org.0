Return-Path: <linux-arm-msm+bounces-55942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88910A9F843
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 20:16:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D978F17FDCE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 18:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39FD727B51B;
	Mon, 28 Apr 2025 18:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U+dlezha"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB697082F
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 18:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745864191; cv=none; b=BXdLhuJ6NWDmyQ0uU41JCFvX5xVjsgD5cSiWXcUofdREK8CCgkcJIGROH01yH9D+8PVW9iZpdOZxwInXiwD8iuRQeexXhaXmSYHQKN45u38weS9CiL+h4l3YKWKgDsQcPg5+L704ZeOeql9eowDyhRl5LMSUj8+7oj0RR1OsJHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745864191; c=relaxed/simple;
	bh=J2NjDwqxbCREVF7cYbxWhVeVD5IjGCL+8llBMNF4IB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=obi+ThJrzTmQscZi3SoTLWdlI/CrX1fXuWrgCUVbnagMthnz0beb3N2iR5ZhuWROJ0Lcon7tFsXlYKNhgfyku5sulx/XBZ7z8WYXCyp4pyQQvn0drdNz/X/cKLQKZvthf+Ai5K62fKpTmUY94F1Z/X57UC5veV86B+yiHUu04KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U+dlezha; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SACsP4019747
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 18:16:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pyzYPzNdKJ5hQ6D4PSTvT03qdPB40WqZn1pcHvBuv1I=; b=U+dlezhaBSxpQQJ1
	hbS01xOAyQrW/KVOqtyup9H//GPuLtniOmmFvSGngRTTUkDSFpxwTO8AuErYjhKf
	PatmdMrXCAfq796TA7HUFXXGDw1FRpFyJnIkyf6WZ50dSNWk6c5mOxB1tCKbSfw0
	KHVquU6LRrvwJ9BRZUeUQh/ZM/ps0Pu1VpORuRMYtAhi0bq3vOJ8tC6yOHINJ0RW
	DOUFNBypgdE0aMT1+ZvpE6czD2SvcPQxRgWIe0l/fL5/1EzHVWXT7ZLNQjkeWCwA
	sCqeIc2J45eoPa/6wx9incf5JhFD4HuqI710wfbDZkqaSMzy8hZ+tlmF/5xgIQR3
	HrEJRA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pg9a2pw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 18:16:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4775bdbcdc3so11275081cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 11:16:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745864186; x=1746468986;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pyzYPzNdKJ5hQ6D4PSTvT03qdPB40WqZn1pcHvBuv1I=;
        b=r2MWe2q4HUUAobLqQq+TMWfvQsHEwt1zGv7u8eRDvIP7fgcsllDNvk0s+lS5GCB0vt
         85jRPtoW3gBBYd1i5TW/SkghysxsVEWTYeD6vyXSSxy8DG3hYzqnxvNJA5w0sfye4x+X
         qjlWyFydhyp3AbSqdFiFp1/Z6sNXGtfkeLaZtgWQ3Ji3rc/toZTckzj6mkWqya93VKCd
         yJxW+cfXACT5RPG3QLhT5KO/SNTPF5i04yg+7yDmjy6aUi8yxVLNZet9w1J5vALM3qw4
         1iKDj17AgG7aeCHZ3mCNfte3BLbObeY0s2g3uk1vV+YxUXe7y2Z1uHVjTDHXGWzFgHX+
         wi9g==
X-Forwarded-Encrypted: i=1; AJvYcCVXlsvVKhyezkwuisko4isLNdi7sc7qgXq+kHvnNLt7VBwTRFcn3hNBkJ7FXJxaMm0d6JFWjNqijRABYsHb@vger.kernel.org
X-Gm-Message-State: AOJu0YxOHCNEj9lClNKybe2gUtP0wE+bjUMdxDFdmQYUh2xoIzMUuImy
	4PTzMruIx8jBrK5x2kX9QDNGBHAgoLeYFh5T5uFBmp2DK4WDEiO/YMdNHvjdhYkb+r9ADA3FUlO
	q0b/rg+0KZgkxK24Y6al1qkdlBeikkZdPJND790EeCJ8jfTy7XgPYv3pC80aH63xE59EMMam5
X-Gm-Gg: ASbGnctygvN1ZclPC3ch8lWFagQ+5GRakMD5LjpcEv20rL4/r6+rVkytfJQW6IHjUQ6
	gMj/BczUB7oBzTp1DhI4xa54GtwCilG4y1jMGu/SJRY2cDMwZD/3zNQjzGEne4M1zFx6MPd90HF
	/rxb3mo7murjqXPvUIBu/sA8OLvl6MlhnfUpgE4hp1rDJI5Wdh5hxX/TKnCSITy+Y7p8Vhagu2o
	Z65IWUSZMDAPPs3p044ubq9vyWYJUXS56gn1vywdCheWQzxjJ6+DW4mlSahF+4J+d2DxiMvHvD8
	EmHHYSxIYlS7SfPWrsi3uspzW29v6rt0hzN92fK5tzSPYNegdjdGiJtZFnRij1DvFA==
X-Received: by 2002:ac8:5709:0:b0:476:add4:d2b5 with SMTP id d75a77b69052e-48864dc24aemr677491cf.2.1745864186511;
        Mon, 28 Apr 2025 11:16:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiBHTGPzXdz71tkCZQWognqMTsRKpmoKTruiCpJpeGT+JHe1UiZNWbwkpyFf9Bf70YBU8p6w==
X-Received: by 2002:ac8:5709:0:b0:476:add4:d2b5 with SMTP id d75a77b69052e-48864dc24aemr677331cf.2.1745864186191;
        Mon, 28 Apr 2025 11:16:26 -0700 (PDT)
Received: from [192.168.65.47] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecfb339sm658100166b.115.2025.04.28.11.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 11:16:25 -0700 (PDT)
Message-ID: <4b467493-5ea1-48d9-b4c0-56f05b7edb46@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 20:16:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: msm8998-lenovo-miix-630: add Venus
 node
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250425-miix-630-venus-v2-1-cdfca385a0c8@oss.qualcomm.com>
 <CAOCk7NrcpwAnUKcVsc5D03Aazt=qWLZB034xa2FH2PF9LuL6ZA@mail.gmail.com>
 <vxwbzzds4lkixt2zsvjwnmfk22u3mmvp3cqk36aak2thomyagu@znr6b7gcue6w>
 <CAOCk7NqLQdpbvdknEHEB0NNU7OPhmmHkH3Q4PCYiOzf2fBQBkw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAOCk7NqLQdpbvdknEHEB0NNU7OPhmmHkH3Q4PCYiOzf2fBQBkw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZpvtK87G c=1 sm=1 tr=0 ts=680fc5fb cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=VeHn5rkiVmJbRrHcbRoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: YvbuEGaUEI-THdSbeSenFPycqJeDtR1b
X-Proofpoint-GUID: YvbuEGaUEI-THdSbeSenFPycqJeDtR1b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE0NyBTYWx0ZWRfX/PD/Y5d+tFsU emkvbjBetX0hbhUTjkIneO8Q21PwLD1/xQALYLngxV8CBQKuMshqCoj3VbGp6p5HYxpX3obsU9l gpfnCNseGfuUO5lUic6/2UPWzIvkm57jUXWnXaG5UTiQPVNPpaziygsLPRT1uo2eToa4Ap+UQ84
 7Lu8XkLze8xm75M0MW8Fp6tPm1wTGq0qcIlnyBPTdnz3cLQNXP8GFvdSaCN1bu0JfPYPsHMbdsG aiOXIFzLLYNi7jlFOo+jnKc0ZOb51Fn8UBsdwkWPLYpuXXGr9Vag4KKwlXPDgeUY5JnzuOBMaff HK0OmiB8mcmpFbL8wWCasH1t4e5N83mPywEI0odokMQ8AiFfj73dvbXUmyOTwEqmGJAT6lpR5T0
 LL8BZZqsgpe9d9pGUcsy8Mv72M4Opn8hp0sdNPCbaYBeZQy2/LPsrRC88m00weZQzDYON+4G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280147

On 4/28/25 7:48 PM, Jeffrey Hugo wrote:
> On Mon, Apr 28, 2025 at 10:21 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Mon, Apr 28, 2025 at 09:40:52AM -0600, Jeffrey Hugo wrote:
>>> On Fri, Apr 25, 2025 at 12:28 PM Dmitry Baryshkov
>>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>>
>>>> Enable Venus on Lenovo Miix 630 and specify corresponding firmware file.
>>>
>>> I'm curious, how did this get validated?  I didn't think there was
>>> enough infrastructure enabled on this platform to check that the
>>> lights were even on on in Venus.
>>
>> I must admit, I basically checked that the firmware starts up. Marc
>> Gonzalez worked on enablement of Venus on MSM8998 (on the freebox), so I
>> didn't perform a thorough check.
> 
> If you got the FW starting up, that is farther than I expected.  I
> must be wrong about the capabilities then.
> The DT node looks right to me.

If PIL accepts it, it's basically good to go

Konrad

