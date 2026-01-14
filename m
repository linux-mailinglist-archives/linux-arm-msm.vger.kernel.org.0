Return-Path: <linux-arm-msm+bounces-88889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D86D1BC85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 01:12:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E9E493007677
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 00:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E992E401;
	Wed, 14 Jan 2026 00:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eRuoKDzP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="STjCilUB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27D3944F
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 00:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768349535; cv=none; b=OAUG4KGbLHhRFtaDiwSpKGZj5I6/TXOZOFjcF26xp/1uVud6J3vHnea1YxBHNHJVQrc37pkbyNGdYKGpR0POxJDFDb54ovj4nS71vZVSdN1qGc846fyx2ST7tX/+BTpHRnbAcb2e767S6wXCz23cEHYVYM4Gm7MAgCnEmLoC6x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768349535; c=relaxed/simple;
	bh=ZtRwXZlwQdStKHUmmOm1JOx4aH+a+l4Je/3DIbLIfsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZyCM6nRv87RCSy5v0knQ7FhXHF4S5/RMSWDcEuPyOZe1YCHL06vt+xzZN6/Mt4HFgC9Ta8muo8QAkPwIxF7exu8VxARhZBrEmRK86ocRK2PQbc8R0ii0LwSIdt1WEYHxZ4NYeQVKcQAh2RDURUAjKTjl8+iJX4puXUraeThozVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eRuoKDzP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=STjCilUB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DNHZfe1424695
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 00:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1nUlqdzcFzT6ITBXvbXgQQfm
	gOOsh7SnefCWs8uawLw=; b=eRuoKDzPab72vL4f5o6sRLQzcZJmKKbjf63STLmk
	I/d09R+chSIj8wuK9XvlUxSMS3QhTnemyhFm16KYQ1peeWzn6hlkjxW3yIfIzyHG
	0CAbRC+fknX+nS/bsGdqs5ueG4ZEyvaVdQy3KX3rw/hW7tvhmThdvIxwfQoLYhyU
	9DNxbZ0lp9uh24GEmdfmKDBsFkWOuslOY7MWour/P527cwYhQ3Vfuubu1agsYxRI
	vNtp7sRzhsmVE2wUz5resoAKv0eCLauxKEFSvjqDUb4sE5wAuuqt+2mjcIjRJO/+
	CbKRPS+aiyYWkU7pCzp8kArdplH+xvol0ZzGc0B2kXYyIA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bntet14sf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 00:12:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52fd47227so53340185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768349532; x=1768954332; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1nUlqdzcFzT6ITBXvbXgQQfmgOOsh7SnefCWs8uawLw=;
        b=STjCilUBd0OhaCagO/5OQqHOQolycMeV6zBn4EMPqcADOleW7z2Z2FYORQhyUoiadL
         g3nZVY8+Cp81aQeATfIHJb0zfmAJOSS8ruWT+gIW12rLycUvbdm+sjsZrFN1eDVPP/pA
         f1ZPqE4Yj2pJI8PKTDbTD8+sRN3T3OzhHDhXoHE9Ki/P/S9LCZzK6kN+CPKAqiIfT/8k
         Zu7rYk5JkWEYDsPevPan7UBjANU8PGN5fsmSaGN0WQdygMO/NhSyrLljOULUKQsC4Cyl
         r66uehDqp09iHJeDgOBJidqDJ1tzk619pBT8RA61672LcLsl1dhE+p44xcYH5G0swXl1
         ilQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768349532; x=1768954332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1nUlqdzcFzT6ITBXvbXgQQfmgOOsh7SnefCWs8uawLw=;
        b=Arph1vmioOFHnGLfXf/6X6ADlT/yCrqFvvVVJBTK53sLhPbW8L/PA82549miuuOU3I
         QmEt03dYz4lkdSqdOm49E5EwM2Qs5oXsoR9wXn9IHMLkRt8zPb8i7KiJBi0vv3UhL00X
         63OTbJQWQa2IpQOSgv/MMGBhMEnpXUMR1NrremIOPmaH14d/8Wcy5UiCanzmLzoE5Utx
         tCXvltQHVll0f42aor623PIwu7gtUm4nBy3BVHLl/18CiJm1z1wVHaWTf+73CD+fTfQU
         n1UmmfF12l2WHpxxVav2yoQHg0KLRpTH52JJrTDdjkyqWgFQf64b+Qi6KzHQGXT6W/W5
         Jgdg==
X-Forwarded-Encrypted: i=1; AJvYcCX8ZKLJUbSS5BBdtuwJwFg4NRR/hsPdZJw0pqxr5Q/1mRtuHobIWUcrRakT5dK/wRYGluG4/OQSSnerd1zL@vger.kernel.org
X-Gm-Message-State: AOJu0YxMQc9TdiOHFoxRcuKw2tqkIrxSemMCfqb+GgRBgFySF7uqWNG5
	gNf5RI6l4gWHLIj716OHDbaBCVdPEdmvbKDkpII9cFvMcTPGg9FdeEno1JcNOyULaARpVzcAYXu
	ratqjvIe+5NCBKnTL17tOXsPLbvYZvhf3SoI9JzPlnpVjTglP1xyfXmem7Za9HvsBjTff
X-Gm-Gg: AY/fxX5RwE/fJfyvEzO7ESEKjwh77FYJ5GoOVb8iPZR5YAaaDNoFBUrPri3Glojr/03
	2MPO7SddqpyxxS1ctRTGeOnccIXh8XpIDuHKgu4Rob+lFaEmXGoqY+VmuhTnvEBtlPsJVOsbtQ9
	G/WAGODIeDdOXK36AuW5NE8aB/k7xS2SfIdNNpKm+Ru5Ev7qS6yV5etodzetm99flDIRqVQCusX
	pZjSqbl0OE4V30bNWLnETEa0iC+NGnTAttlUn5yXwuUr0vrIi3pBrPGWhieSk46AC1e9/XuzUXL
	eTw545qUsDYuXYPz4w9c6kg+kAFG2/9fqe8q/IDoRGFRou1sCCC5BTwWtSRIATELmc4k3bAXFxs
	PsVsA4TYM2P5DQB8tkodGnW+NNZuemNGt+ViECArR4HWKO6+T2djCDjVnCQAlYC5K9FGKF63MKp
	EINlsOLX4FdQF/USSZAdWdlE4=
X-Received: by 2002:a05:620a:4492:b0:8be:6592:f7ff with SMTP id af79cd13be357-8c52fb1c9d2mr140593685a.25.1768349532094;
        Tue, 13 Jan 2026 16:12:12 -0800 (PST)
X-Received: by 2002:a05:620a:4492:b0:8be:6592:f7ff with SMTP id af79cd13be357-8c52fb1c9d2mr140589685a.25.1768349531523;
        Tue, 13 Jan 2026 16:12:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba102087esm157980e87.35.2026.01.13.16.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 16:12:10 -0800 (PST)
Date: Wed, 14 Jan 2026 02:12:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: add apq8096sg-db820c, AP8096SG
 variant of DB820c
Message-ID: <gwlwlqxo7xbsws2lpmb3pppevthtuxfy4m77hdpyvx2m23vbr4@6jujptqhdump>
References: <20251111-db820c-pro-v1-0-6eece16c5c23@oss.qualcomm.com>
 <20251111-db820c-pro-v1-2-6eece16c5c23@oss.qualcomm.com>
 <02a9d6eb-e480-431b-bd4c-a35cee170516@oss.qualcomm.com>
 <wf4h2lwyvgswtv4bgdfidj4vpvykwhu2gri4crvvtd644hf6nr@cnpqi5bmpvm5>
 <f4fbc949-415b-489e-b333-4c846d3ce8c7@oss.qualcomm.com>
 <CAO9ioeWpOArPm3M5hjR5PMbu4rkV1HHxQOZjOe5LwTKK7xMWJg@mail.gmail.com>
 <d5fc8900-e720-4f5c-b456-67c4ae03f711@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5fc8900-e720-4f5c-b456-67c4ae03f711@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: L_Gci6LDWfnC59wdfS9r5joVRYVsRJEB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE5NiBTYWx0ZWRfX+3/2cipAfbW2
 eMAjKqxZfAdgJHAtg2nIYPB6bHSGtJOXf4gK/WRhhcmSV/Kha9A1ESPNCXi1BKtKICsyRYT6Auq
 +KA3Y5sZVP5tyzCqqtm0rXH10ge9MZLShI88HT2+Y/W/bhnkNXc/TC23rTM0FHXi4yiAS883l9B
 mzirZvzfaAv8lQan8Js3x4LioQchh8WoQQ0+khxSPEnVnnsAdssY0m+GRTVtYpStVQxxLQ8SJ7J
 xvVSbxyRJW2Z4G3kMoI6NDfl+g+eM7TEyHqQQXT+RZ+jyw0AcbXPFv4ikiW2E6uv70/g+ilqaNJ
 5fbo3q7jcPB5KSI9riDWIgQ9xDwpM+HlRBggvON0W24qrOzQPlj1dIsy4kl0ua16qEUKlazDq4T
 wGqThtwiaSIPnJN2N+STwLnWQA6iwh5lZ/4ePh49qUmKlJ0u3UEAm553gu0ynESCgXOQyJq6Mpe
 5Xk3g81ibB5ycUI+qgw==
X-Authority-Analysis: v=2.4 cv=TMlIilla c=1 sm=1 tr=0 ts=6966df5d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=rN-2TZfAbqyzQVdIAIsA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: L_Gci6LDWfnC59wdfS9r5joVRYVsRJEB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130196

On Mon, Nov 17, 2025 at 12:54:22PM +0100, Konrad Dybcio wrote:
> On 11/15/25 1:09 AM, Dmitry Baryshkov wrote:
> > On Fri, 14 Nov 2025 at 23:31, Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 11/13/25 9:32 PM, Dmitry Baryshkov wrote:
> >>> On Wed, Nov 12, 2025 at 10:44:49AM +0100, Konrad Dybcio wrote:
> >>>> On 11/11/25 5:02 PM, Dmitry Baryshkov wrote:
> >>>>> There has been a (rare) varint of Dragonboard 820c, utilizing Pro
> >>>>> version of the SoC, with the major difference being CPU and GPU clock
> >>>>> tables. Add a DT file representing this version of the board.
> >>>>
> >>>> So is the conclusion that both flavors were used?
> >>>
> >>> Yes. I have had a production unit with a non-SG flavour. Bjorn's lab
> >>> has a standard one too. All units in Collabora lab are Pro ones.
> >>
> >> Pro doesn't necessarily have to == SG, this seems to be sort of
> > 
> > My understanding was that APQ8096SG is modem-less MSM8996Pro.
> > 
> >> a "MSM8996Pro" and "QCM8996Pro" situation.
> > 
> >> I'm hoping that speedbin
> >> fuse values don't have different meanings for mobilePro and SG
> > 
> > At least downstream doesn't have separate bins for APQ versions.
> 
> arch/arm64/boot/dts/qcom/msm8996pro.dtsi:       qcom,msm-id = <305 0x10000>;
> arch/arm64/boot/dts/qcom/msm8996pro-v1.1.dtsi:  qcom,msm-id = <305 0x10001>;
> 
> this is interesting, perhaps Pro==SG then

Yes. At least it matches what is written in the LK sources (or in
MSM8996 Device Revision Guide).

The JTAG ID matches APQ8096SG, the bootloader identifies it as 8996 Pro.

Any remaining issues?

> 
> I also found evidence that there exist allOf
> 
> (MSM/APQ)(Pro/not)(Auto/not)
> 
> in the form of:
> 
> msm-id | sku
> 246 mobile
> 291 apq
> 305 msm-pro
> 310 msm-auto
> 311 apq-auto
> 312 apq-pro
> 315 msm-pro-auto
> 316 apq-pro-auto
> 
> and apparently upstream dt-bindings also defines 302/MSM8996L(ite?)
> 
> Konrad

-- 
With best wishes
Dmitry

