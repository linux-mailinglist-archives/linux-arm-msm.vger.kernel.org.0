Return-Path: <linux-arm-msm+bounces-105177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SP4HL7LY8Wm3kgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 12:08:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3337D492979
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 12:08:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8908301301E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 10:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A30EB3CBE91;
	Wed, 29 Apr 2026 10:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P7onOf2h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VvNa0T41"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4DC3C6600
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 10:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777457325; cv=none; b=dPqrCNfsTAEPEHThqkL87GNUyqCuYMwT7wggngxw07qfMDK9Exn4v/QKaINmMZ7JTUUgnLS7zjKhY/UWAnLvUW1KSAu5RD4qRLBWdpoTXZYBvvc5JOGAKl5tQ0VpSDfa7G6eCay9jho2DwViz0PszDE3qZdeK534HcO3KnMtvp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777457325; c=relaxed/simple;
	bh=c0nVUO83BjMpsHyFNoCa8XQxjosX8sBB7LbafYTH3hQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qo11C0H/EHkIvXRjzIszrQx1gL8rXqNes9LQItK37fqM0Dc+dYTK9RZXM8/UyfqnadKrkew9cud6h3y/SFVTWQ84RSEkOAitvF6Yv7QTmN26TUUWgnY+hOY3HtlqsQlBkWodsS6lys0EcaMrpAIpbywbpsKfFK+pZT10bdC+jRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P7onOf2h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VvNa0T41; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qjJJ2016281
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 10:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5drjt+Zpuu43uDiqwq0/vUROwFSA15/U3OKxmtRl0Nc=; b=P7onOf2h1D13IpNH
	L34OlUz/bnLqTIshP9LSzgwxtl+hfiFWgFMu6s8HxPTCO7X50HSudleth8bWzvAv
	S/JEToTueIzRvsW2SPSmGQShu3ev5ZqXhxP+G/4NB36ViVrl4puFqeyOGGJQYFe+
	fHk3yOtSnjMpVNUug8TBUtQu08QfrQHm6Oo4NetpK/Xkv3QzanC9u1f8yZYiGOL+
	xYOn5UocEpfKdKQR4ALgXDnjJQ3d0D7BzsWm34Evc1J5zaMac3X5fg4CnA///KUo
	wZLko4w9Xn0nmUOSaNbg7dxS+o9xvLz79MkXCR99jIOTkeHuz53nqW59sBAOCdiH
	SGNjxA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du1eeb8ww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 10:08:42 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56f8a5c02b4so827107e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 03:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777457321; x=1778062121; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5drjt+Zpuu43uDiqwq0/vUROwFSA15/U3OKxmtRl0Nc=;
        b=VvNa0T41RbegCLtw7oQQg4jUf5oAKWw04Mk2+uOJ3pDQFAadLMKRJpt7gAJ2OOVOWb
         +JoupW3+XKWW8wCMPvNnZYR9YBM+6A5Z2j+T95nOZkOOUhinV8crI4EI/1Z9JbX7Yh/o
         fnuiHM3cEc42GLv2M66HDvRJXHTKSLnVuwg07XHPHPebwzHN13n2D3xsPC4rFuNLzNlC
         L8jbg6vUZDyy/BUqrvZFrILh00/mpOGIQiEtoEj4Mioy6ktYM9lAH2eHfNh1tOWtfEt0
         18JyzdFLXz0ASwr3b9qJdx4t9y9rWQGlZ1MrXKEwetS+mWK1gVW2+g67Eh0NwFUvhbhj
         208Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777457321; x=1778062121;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5drjt+Zpuu43uDiqwq0/vUROwFSA15/U3OKxmtRl0Nc=;
        b=J2DU6cc02/XaltK94Sw5kJ57g0W3gklsYP0OQzZ3RQ6qrnxUbjY9Ts6NyIRVrGn+4r
         XFsD+EL7qINiSDmj0LSyFGBEgVwwCGVEhQeQHKDJtUWd0eiCWhYpIYzDP9zn7izOVyFb
         /CfHnXtX6NttRtimigQu4HOYK28jiXSEpw7Mn34FAnMOUWuf4ObL353WwTGjKG1xMIE1
         9Kzc1JRQUwzwTXHmi4DsK8Z2UekgVUWF4FmrtiJdfci47dLFk9F/LU8B/bsXTSGonn6X
         +YwUPpHgSjVFduB/+yVtmerbUhXXDI//JVSaWREu7nw3f7giaIrJ1i4rrosEwyyYVBYs
         WWlQ==
X-Forwarded-Encrypted: i=1; AFNElJ+cVYSXI7nXYy0IykJu1y0WXskIOAgH0cwkATIBFkLjAybEVOLr9XyM6ctt+E/EcrExvOmxvg0SRTaXC3w5@vger.kernel.org
X-Gm-Message-State: AOJu0YxkaoN4gM+HFu4alNvCqwxkcMx1IXribSH3asC+0bE5olBrCUU1
	tM/sKrtVGSRmfcSnuzVt8lCd1lJ8Ej3pIOXQUFHVDzIvdrCOikpnIz6uT1FcwIZLrCR1P1gp5Y+
	CQj5XTjVCo5YSSIZp13QakcTMajeZ7G0umWkDfwW7BWANYETjypoDrrK9rwcm4RKfIwet
X-Gm-Gg: AeBDietD6AQGu6ni8pdRQxGdV62JudhPOwnhCTtGwgsnmXuR4sjPcANDglDeuVldlIL
	OY/SnOXi7rV4awjl/BHXSy4AdazoADb4LvloRnNJB6dWl8xm7AA2w7EfWCSUChzfzVSK9OzUGYk
	I+jADRSS2udmRHBHNa8xSyG67218cRpsEgvm6CvxNWbRIhmOxCsqSIRegfsLZ79jvaurOWa9LDC
	/4SuMePuuiSx3ZA4sb1fceov+FmrwEW88Nn4B176CHrlWviAC187lxc8CCZZvMGb3F/6YxxnZMl
	Iun0T64KFNnfIW24cLlC1140f0QsLsvVyKk4TmcG4Pk6lvwewLqO7DtztOtfRJ34NxGGjQf1ise
	a2Hts/k0kEUaDHHGDrH8sGlwQzw37pR81JaxpzAfhe1TEGFzi2R7fAEEiHyIKgw6bsJa23TrdEx
	mZdski2e9uP/LVLg==
X-Received: by 2002:ac5:ccd9:0:b0:56a:9e65:3e30 with SMTP id 71dfb90a1353d-573a2df9fd3mr1322771e0c.3.1777457321163;
        Wed, 29 Apr 2026 03:08:41 -0700 (PDT)
X-Received: by 2002:ac5:ccd9:0:b0:56a:9e65:3e30 with SMTP id 71dfb90a1353d-573a2df9fd3mr1322760e0c.3.1777457320324;
        Wed, 29 Apr 2026 03:08:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb98630e647sm72001466b.60.2026.04.29.03.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 03:08:39 -0700 (PDT)
Message-ID: <652bf474-a524-4391-b8d1-7c0bbdc28b4d@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 12:08:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc8280xp: gaokun3: add front camera
 sensor node
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Martin Kepplinger-Novakovic <martink@posteo.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260425105300.745044-1-mitltlatltl@gmail.com>
 <20260425105300.745044-4-mitltlatltl@gmail.com>
 <2134b8d1-70ca-4f97-afc4-bba0538f84cb@oss.qualcomm.com>
 <CAH2e8h6AvtaQjrwOu-QumeqYVoz6GyQPRR363JWfS8Wy-jNBkQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAH2e8h6AvtaQjrwOu-QumeqYVoz6GyQPRR363JWfS8Wy-jNBkQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C/7ZDwP+ c=1 sm=1 tr=0 ts=69f1d8aa cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=3JMqosQfyPtHKn0I9G0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEwMiBTYWx0ZWRfXwWseELv7SJlo
 U+/Rks+HZEpQCrRmpyEGPdKQzSMfdZic9ZX7gix10HH7nvzZeX91evnhZQOT/F7mqtLRblge/xs
 M1xwgvR3IZWYQFcYq98PrLtfjZd81fMaKT+BOmYj/AYZrk4juT2DBqC84xDiYsRUv1+wXgjs5pJ
 I2962VMO40RkjNMPfLzZQi6LJNCAZDWw5sM6vwJKIksBwtorT+lGtQh7YEq0N5ALMn891zPu7vf
 Lu6O6fIN9KZBlh95SU2qdOR/zRHlC60RRBrH5M7PkGyx8YahK4+w7wVZsidWbjx/mLZhAyJQ0E9
 AG2PPT89S3A1ouzvLdjkFHoIqg9xiUhgsF9WPBHFpB8tw1249bYh+69EyTLvlKBZyjw15pF4NBr
 TLAX7Ik/D9B+mheGO3TG74HfBmxJ3nMFWmmwacqOEA7e/qluLxbWJYFoCyNlxT1QXzcgk+wVoSU
 lVXeO/8vdANFoFZ5mpg==
X-Proofpoint-GUID: SYBsvFGl2OTXLPyaRxRvnRD-fm_Vs3Yi
X-Proofpoint-ORIG-GUID: SYBsvFGl2OTXLPyaRxRvnRD-fm_Vs3Yi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290102
X-Rspamd-Queue-Id: 3337D492979
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105177-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/29/26 8:36 AM, Pengyu Luo wrote:
> On Mon, Apr 27, 2026 at 9:00 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 4/25/26 12:52 PM, Pengyu Luo wrote:
>>> Hi846 is found on my Gaokun3, descripting it.
>>>
>>> Note that it seems that only Goakun3(3.0GHz) version is equipped with
>>> Hi846. Goakun3(2.69GHz) version is equipped with S5K4H7.
>>
>> Are there any other noticeable hw differences between the two variants,
>> that could warrant the DT to be split?
>>
> 
> Except for the cameras and cpu, I think no.(But I couldn't tell all
> 3.0 variants are equipped with hi846) Before camera support, this DT
> worked for both of them.

Do the ACPI tables perhaps have some sort of a hwid mechanism? Perhaps
two nodes defined for both cameras and the _STA method referencing some
object?

Konrad

