Return-Path: <linux-arm-msm+bounces-86066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAF7CD4218
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Dec 2025 16:23:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68F833004195
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Dec 2025 15:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2DE219F115;
	Sun, 21 Dec 2025 15:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FmACywAm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XifIwAHD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6797262F
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 15:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766330613; cv=none; b=VypGMYKXHQyLSXgw/hBzmV6JMlk4gabCWkax8VFmPy5PuV+qvQcuSSI0yT5vm3SV0cz7EQbQYQFGX4Vw/ejT0srxAw1spIKlDnVNsXk4oytfKNcOq8RC5uNhj8N3TwhGP0poBqx0u7cI9yxgaR+ROTo8xZhwKNGh00CycH9IQbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766330613; c=relaxed/simple;
	bh=i4AFtSEKJdbLslP3ulPTUgfsayjRk83qr1qXeSZU7H8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SMqPDQkXjYkp1MwElRwq8xxsA79xfM/FPODfJoKyRZlydIK70pUtuDQdeOhW/T6DpWiJNIBF20facLm/2wrIFtHwpHgEbsRHTaz8vdjfHNqooXO0BtTWgxhaITbZvyq2qWwHqf2sx51n8kYeU5Msm958xw9HJEF1mtnEEYYsSZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FmACywAm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XifIwAHD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BL0k7WL2967384
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 15:23:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nJZSmR38Ha0urscJo8AEYRGi
	/caa+ENiAzm3qVa6500=; b=FmACywAm5gW4GURU9u5Jg/+0pgD+DnUjoaI+U6Ml
	OUh6V2BPRolMVoC4v1+I5SCx2rpoWvOHgQnCuh0qbCCfMdjiGt9IbkVIDJ/jXlqm
	HudnGlCvK2gnqFqGZ3qEAyOGdtwWOpkd1jEVoAO2NKXwxhZ8LivoqhcC/oqcSk0C
	EqrIBx0NEiTmD8TmVaMKGuTTbVSinPcC1CFSCk7wEnBvsog+vXj3HhjgywIMQ2XU
	2XEn9yBp4j/J0npPKjKw1Ytkw9wfPKbYgRhaz6Y63DKQFWQyySlyuqUOAH74qvSD
	HF1e5+i+FCBkAk+r+EGD2FrgwO+84vER0fKYdpUv5KbB/A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mydtgp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 15:23:31 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a2d8b7ea5so39532866d6.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 07:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766330610; x=1766935410; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nJZSmR38Ha0urscJo8AEYRGi/caa+ENiAzm3qVa6500=;
        b=XifIwAHDqdj7w+6Tn0aGeg3lbboZ990SU7XYguAXovCJFv9U+1Asw07VR+OO3FWxjI
         AMcs+k4BMGTOba+5TS6ROmB7Gb988nVIJJECUKiXNNdarlmI/lLYNCdBTfXZmg+UNgGT
         nrFW6o7OTdvjvUWCQYF71NqnLn7NEwE0Zx/fQFTXGHFZNi60cd20AwCqCNL7JPpw3Mzm
         n/8u2fB4Uxgd1KqJZEr/zRxJNMZvoS/eDOKnc/lnLTkq2LL0uam6UTw/QUOHR7WIBvnX
         9fIsoPIm+zOi6AscOYFEN2Ee++JfrFrfdGLa5m4y+Wfq76t6zd34w/LKwYPRxev9uP06
         ss2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766330610; x=1766935410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJZSmR38Ha0urscJo8AEYRGi/caa+ENiAzm3qVa6500=;
        b=PMBHRiURTMnDvYzFJxefsgrTK5JiECl4sA5/9gD92YpFh9zjtb0vrp1E6upAbLIuIN
         Yzd21j0Aht+wo7RcG4NFV9pUMbZpNzYFrofkahhrS8jZxLOnVS0kcY2X9Tap/EdNekmQ
         0qCKFzSCeWBrD/NNfr5oP44X5X95JzPS2efZoYiVS4lK85VfWDt1K9J4DBMoRNzq+VuS
         PpCTKeklMsU3fuPWPFQyVTc9llFKo9oRAIHUjh5k6f9zTFqaADg/p7rCrExY+CqIW6dH
         GLqIsB/irFypyzAvtGTWXKAVFbOnHf6Tx4/puoDzbdEgTZgmHAJ2elCFcEEQ1idLMmoO
         YJ2A==
X-Forwarded-Encrypted: i=1; AJvYcCVgyB+Jw6/+jOc2K23xf+LV6Ue1LvHIOt3FhuLmGUAehji/hBmnMizfXeclvcvPaan049Pvqa0Fit4WhmPD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9sNJygtOKN2VR8+JRDsfYUZR87twfEc0Q9E+LYSk7tXNCgyBb
	eK9FmYQH1GDrLVLo5E5bPTyq+2YupAM/C1VHOaMrYfYk8Cc+RK4B7waE0Q6tUUdijHuSIStr5UT
	sqglUm71S4eDaDoKzOxnlvW0TsEK+GDNx5GTgXZgAvfZZKWDrjrss3ITlp2UXKz2jkwcN
X-Gm-Gg: AY/fxX7XrHHIziXLLAmUuKVBULuRzPC9BjdiGq9AP5ia4AIQ6ZB8ce/r2iyXUkhad2/
	lFhgR40EfnYLLJswn5DZg2dwcOsALZXNY9RP08ONTJa9IWgxUUVMNlNA03sjIc043fsDVtqD2XW
	OyHw4LmAOtqXBoJhDKTxuSslme5NTvEsKv1Enihhty+9NgwrxZEy8UuGrBJ28rCPvPYf1BbUyT5
	txCjf8o4FYXvjHUYcGyDSqor2xkMaVDBNPB90HFiTPZHBifJR1+Zzep47f13csSo8Z8GkP/YbTo
	jIAoD1axzLOepuTo8VNyuojYaWJCvqBLL8BuspR7TTDqcJBBI3KQovbJSJroh9kdrKMstt3uTuZ
	2d4gnC3g4az00hIt9R22xu3JLzowYl8ndC3QOl1JPqPLuIcsHoFxDAs4IRmk8qaFyh3K8H8jpPX
	d6lFkRSiqFMTHgTUWg2qQ3OZs=
X-Received: by 2002:a05:6214:414:b0:888:4930:ff23 with SMTP id 6a1803df08f44-88d8491cfdemr154171996d6.70.1766330610354;
        Sun, 21 Dec 2025 07:23:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHy+QndMsd2wX0l1sKVhANBd/gOpXvm3BKHOYnHh7lCl+fKs15EAhDRfK54u2r0iy9t24xhPA==
X-Received: by 2002:a05:6214:414:b0:888:4930:ff23 with SMTP id 6a1803df08f44-88d8491cfdemr154171536d6.70.1766330609878;
        Sun, 21 Dec 2025 07:23:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18618b7dsm2426258e87.53.2025.12.21.07.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 07:23:29 -0800 (PST)
Date: Sun, 21 Dec 2025 17:23:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Val Packett <val@packett.cool>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1p42100-lenovo-thinkbook-16: add
 hdmi bridge with enable pin
Message-ID: <yfddvt44btci7hxv35hskoxliahml24mmcc4qre7s6ypc6bg5m@7v3pc5wmn7zw>
References: <20251220-tb16-hdmi-v1-0-18b1e20b396e@oldschoolsolutions.biz>
 <20251220-tb16-hdmi-v1-2-18b1e20b396e@oldschoolsolutions.biz>
 <72bq7sblm7iprtxg6oo65mit7vsheux2xatqlk3csf6sp7ersg@77p5hloqf555>
 <8b562354-1c6f-4b13-be55-b23a6a93d9be@oldschoolsolutions.biz>
 <x2zwsjk4vv73a4i4pj2aphvajtjgkw6mkzs5brg6adlm4gnxpu@r7pbypzvcsi6>
 <124d3c41-1826-4927-b4de-1d2d1ccaf5d4@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <124d3c41-1826-4927-b4de-1d2d1ccaf5d4@oldschoolsolutions.biz>
X-Proofpoint-GUID: EcNHhn9JPk-VtpvTgxVbzkCMLIWyUKVc
X-Proofpoint-ORIG-GUID: EcNHhn9JPk-VtpvTgxVbzkCMLIWyUKVc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIxMDE0NCBTYWx0ZWRfX0r7bVNSaPNI9
 z1JNxorgsSj3ubT0nUQ3EuF4MwugBQlf0wbolmqO5AD1P8m37kO7Km6vEBFn5+KqZHf+vGPi7Di
 xcRk4XCoiQTHtb1Oj2t9nVaCKqxs9UbFJNWSDVxqDNaarttQobPoSx/zqi+gueiP7MaHQKXQzEi
 36b3MJzqcScenYZXlrdD4KvZEhfzksjaKuw+cuQj7L1rTCsEppQmE8K08s/WAa17oGmR+0JEUgD
 tVCDoJQYqf2sX3F/5wCOw8DvCW5sRVhZYwFVf6Ec8h9P3m4b0f8qKSnXLIvgLOaRXlOfXaFPDwN
 jRX7fL/X2ZixaFc+txzNtRR6IFmdhcynRdXzXgTjZcqOBIuDmwn/KzxR3+Y3pf+WEYH4SSbd4IK
 8vkGxBAhLSQULkDxcw7NvmMfQVuAO2UC2ubHshmWENtF7XpScpva3KzwKW7/hOQg7NE5G1VEdYJ
 dPUkcRgRRXMS/5Tj3xw==
X-Authority-Analysis: v=2.4 cv=N6wk1m9B c=1 sm=1 tr=0 ts=694810f3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=5QRXN2AvfunpynGSHSQA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_04,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512210144

On Sun, Dec 21, 2025 at 09:03:30AM +0100, Jens Glathe wrote:
> On 21.12.25 03:49, Dmitry Baryshkov wrote:
> > Photos / scans of the mainboard?
> Haven't found good ones where you could even see a chip (let alone markings)
> in the vicinity of the hdmi connector.
> > Okay, I might be misunderstanding something. What do you mean here by
> > "gpio119 being used twice"?
> 
> /me trying to explain something and confusing people :) Sorry for that. The
> whole dts has actually one place where the TLMM 119 is explicitly specified,
> on the hdmi-bridge. It is defined again on the tlmm node for pinctrl as
> hdmi_bridge_en (function gpio), so far so normal. gpio 119 (on the TLMM) is
> also defined and used as edp_hpd_default on the mdss_dp3 node, there with
> function edp0_hot.
> 
> You need the hdmi_bridge_en and the edp_hpd definition in the dts for both
> to work. And both use gpio 119, on the TLMM, which might be a bit confusing.

This can't work, the pin can only be used for a single function.

> 
> with best regards
> 
> Jens
> 

-- 
With best wishes
Dmitry

