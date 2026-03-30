Return-Path: <linux-arm-msm+bounces-100815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPvMBk2Lymn09gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:40:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A4E35D06C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:40:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AE07330AAD07
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 14:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B113DA5B3;
	Mon, 30 Mar 2026 14:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m5EMU2Zz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gbNa491k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771F93D9DD8
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 14:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774880844; cv=none; b=C9HdUvHgKJ5Siv+TpoJUCRD+pLvQsjJIIwqGngYbQ2VjaNiMelkK8js9BWwNWppuf6JWZBbIQCGzPuX3s1Kr/RJzkpYjLkYhYXrI4HDIEK6CQDhAHnQlGvLBUi3KxNQ6GtRNGprWU6VwmB2AAmv8+J7HRYmr3YTGA+lY4+uQ8s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774880844; c=relaxed/simple;
	bh=9Y+yFJJexfP19jMN/Su+gP3NHoI3tkPOa2xag5BKfL4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QhEBE7+GJr/iNKfdOX29wxvlumKRmMCWf5Qm5R5JZ16h1venZpux3h4GRgw0+X1hgL++rpLvr/XInjedCwkUEcmH+mjz0EXCVZaByFTD+GH63Fl7Rq4gBORogkUAvosmB4ohCVP6iUGTXU83TNNPoYAUc5RUL/KN+zIaLmH3BAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m5EMU2Zz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gbNa491k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UCmDQE350298
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 14:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rds9SJnq9SG6ycLbiiJRTFHpUactXCCMN4gZ0ERDYj8=; b=m5EMU2Zz+XeFpE7d
	P/6trP/hHs2jGhkVuRJ8Q7vW/NjI/1+0WA51UxXI7uRIyqmSK/8YYkL9N/SDVOMF
	EEuT7b9CK6yneZ0+ezCAYQW25rKxyU0h1RsTiPfYQuvcZZmS4Hyl6l7oRmyheimf
	JoOxRs+rDPB4JSWKqOOQLVdr5eDHm5mntk7hqsQEP4sfKzYA4FwJMrGM6aHgeqNm
	yT+0LmTFCw81Ji0P8IhX5WCW1orILnrupyB6WUsXyn11OHrVbvjo+5+zNF50It7M
	HtG8G5tGmJWhUXAA5QlWFyPvRFLLqM4527Tbe2YGX6kz8gtFkNVqZODq8Ogm8qhU
	XPhOSQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6wqemgx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 14:27:22 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ffcb2bef48so1312501137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 07:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774880841; x=1775485641; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rds9SJnq9SG6ycLbiiJRTFHpUactXCCMN4gZ0ERDYj8=;
        b=gbNa491kubeR2Jab1UnQvcKmrlm8JbXGVLjDqxHZZygMiJjicEi3+5mQBm5Y8FpRo7
         c7lykjB5e5nTE0kRn4BQLf7cW7Xe3k4Fd2vJHgtlihVBnoAlTPHPzGCoxAymF2otyIOc
         joB5QmMlJtsn8w0HYNl3gW8sj/7j5GfHzTKVip9LhT7BfV0yzYa1wNEG+G7vhaPMBJyD
         YAz0SBTngu2Wj47yyP03t+R7QkFsripZvxo1wDL2CqojySgNkXZa2vxJG8b1bHvhDe5O
         frkGK+Hw80J4CL4gs1S5UKcREL6tqHKWJ7WZq4mcNDS0lX5bDMSv20+BvUlPwhnixRjB
         Pk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774880842; x=1775485642;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rds9SJnq9SG6ycLbiiJRTFHpUactXCCMN4gZ0ERDYj8=;
        b=WMG+2bHc2nbAfmNzo9T6ETRW5dPUYVoUjcEByVYBf0ZpHUcv+iit0xMYtwYGpl+c1n
         6lMDkOPb1vrxI+zvug9RWl5gZeG+9LtR7t+U/LAJb5xKXDfqnwaPkeUdW2Rvwc5rEN9R
         7YsUFkvE1coPYEkDbm2xHo0tYJkxej5A82bqbCYhjH7LMSq1/RiO3dAAOg6W/rWXFwES
         d/eBveg98Xdo9+dGAWV8WB+fvzxTvSDWTAypmyeRHOgibwx+/bkVZkPgyj07GWp5gxx5
         m4c4Yt3vFuxyEvDvYJ5iVRN+No0zAbtN3e5cYUSANyVBNC5nNL2F31c5Tw+T5jYKTOgA
         9b4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUh3neFVLaX+oHuSRVNEhiX7OlpJcS0Nk9OJVYAFp2fSDL3JtLF+qHMOwPLSgsZe26Kc5Sf7+fYIlwwG9g+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7pF8E57tMM1y4HyvDyrFVxIO+a467l1OJrmH3SCBbJuagHxUd
	NcDhZe51WkFC0r4YUo/ohFx2IoFCAxEp41fDIu8vbc/vjUwoonLEeS8dFrHOXNijZOhLObq+9SX
	mxrUfe0CWR8LGXBWljzivIbDK0+oS4mah9ahKOvv2Z4MfBWTA+l3R5x6Nah4RGFk8PH5ytxFn4B
	bD
X-Gm-Gg: ATEYQzzVhp2QvOWaogwYI0fdHjEBxACu8GFNFU2bGpMRkHo1hk77T8Thev7bQGdEfkD
	F+m+l99k5tfJlYTueRuhPxczjRZRFbjDgq8KGoYiVc0JJDVlvlg9cERP1pUcJaW8idASKtAi9mH
	98/Me+ZqJv0uNlS8E7+JFWJGyd/lHm1M2/hzhIyzmacWkvdmkBB0VS/COnVfqRGfbmSr2oeO++N
	d344Xn7YHIW9V2Ls2TjFZKcUti5V0rzreNJRFuHck+9/M22VO+dk2CCe79xkmphgRra1zQI8xwT
	Ss3sMtN+OT5y/Nn1DVDTh82826CeM7T7mazJDSCJDC22C8kHmsR9rRwOqqunY9UBHWQgTi0zBkl
	MN4WbavjgYHNKNWBoaLdawRAI9T0GuVkS/tavwBeTig/Nyb4KWH7FENgygmoXC8YF4PNOWV2zUA
	UvdXeE1A2UQlDhaTIOpNwaBf7vCx/WoVDIOMVmnEXUJKXfXCXFWjtU3B7kQ86Uhs9hT3SOd4XWG
	JLL5vSOYYXcvWQ2
X-Received: by 2002:a05:6102:560b:b0:5ff:d1c8:a85e with SMTP id ada2fe7eead31-604f930a02dmr4165005137.32.1774880841496;
        Mon, 30 Mar 2026 07:27:21 -0700 (PDT)
X-Received: by 2002:a05:6102:560b:b0:5ff:d1c8:a85e with SMTP id ada2fe7eead31-604f930a02dmr4164980137.32.1774880840968;
        Mon, 30 Mar 2026 07:27:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b7275ff3esm2667651a12.3.2026.03.30.07.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 07:27:19 -0700 (PDT)
Message-ID: <2e4c4641-f631-48fa-b5dd-6efd70110dd6@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 16:27:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
To: Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mchehab@kernel.org
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <m61yNNvSrw6AIq7_-g2h7VQLmGJ_5iCLg5JTlfQDcL5LlBq37ifAeXw-K3AlRBck5Mb4uVQq0pzeBNAybQNk4w==@protonmail.internalid>
 <20260323125824.211615-3-loic.poulain@oss.qualcomm.com>
 <1ba54ec0-be51-4694-a79b-f272e76303d2@kernel.org>
 <X-Lw_zi1o015-V1Cv4dY_ik6SfTB8TTcLmn1l-Ta7UviYTJ6gwMBn4B4ulYwjd_Aetul5xUt0T6ln9E-Hl5h4g==@protonmail.internalid>
 <CAFEp6-3ziXJTYADOFj--rZL5TumroXuW+=SnUQ9XakRxHT-ypg@mail.gmail.com>
 <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
 <rj2vb725he4yzfvjifzyxqpbqk5oztfaafp7sg2qes4qz3mlaz@z5dyoqod56d7>
 <7fc31426-3157-49c7-a30d-dcd7b181fcc6@oss.qualcomm.com>
 <qq43xl3lsv2nq4ngn2hojleddxjmkgwclb2ajek5gvdtgyjltl@3tqg5ydhsxia>
 <8DTHyPLaUjGKd83PvBsisjn_SnpUnvkateTtwz9P6CChP9VGfDyQmJa4Rfd5KwOBOLhtGFJPDzfHrXC4zvV-Fg==@protonmail.internalid>
 <0330f63f-7137-4484-954a-fc0776a9b052@oss.qualcomm.com>
 <0879e4c1-5381-4a70-9fb3-4af9b3bf6e48@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <0879e4c1-5381-4a70-9fb3-4af9b3bf6e48@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Jo78bc4C c=1 sm=1 tr=0 ts=69ca884a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=0fAIJR1rb9fCs4FPyLUA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: Scf4eCQ1m4aUWkcoq_PmMMu9xO_r3crC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDExMyBTYWx0ZWRfX5AdlmOkA/ARn
 Y0Bph5Br6HxmncSWqRhR7zx0ss6McRquxXOXXmIxmg0jwtNJ7T7ngA/LD+uNNXOZxJsN0h95Hw+
 vl08BiZt1X0lW7+ogEMcZDMN0eGCx/x2884Yk4kCwDD1k7I7tsWsqyNxjMH/1FLyCykyXL7YReq
 xYQps0l9coFROMw1F653KREEL36H5e5xfiFCJEG31XfXJa1gx4pMLchyOJrRys8SVghuRuQAR0E
 R/3JPf3CvmBr6b7CII/5YnI501E55Tl98VJFmbugN4OE0Y5KgOOKLeyGpGjOu+qICzvABj/GWZb
 bFWV53HtQgykQeMqHQvbqfpJLDKPAngYVwuPuYylzJy/NMY2uKl+4Ye/WYMeCTFthz8I57T85Co
 aXqSwZNsjofKSIrH3ZUioV3v/PAakX4EP92cn+SJuNffV1/ElOgrHNa78399MZ39AqBziYi8OiD
 aO/a8gqudba2CYPLO8w==
X-Proofpoint-ORIG-GUID: Scf4eCQ1m4aUWkcoq_PmMMu9xO_r3crC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300113
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100815-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 81A4E35D06C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 30-Mar-26 16:11, Bryan O'Donoghue wrote:
> On 30/03/2026 14:46, johannes.goede@oss.qualcomm.com wrote:
>>>> And then your CCMv1 or CCMv2 helper will get called with
>>>> the matching parameter-data.
>>> This leads to userspace having to know exact format for each hardware
>>> version, which is not nice. At the very least it should be possible to
>>> accept CCMv1 buffers and covert them to CCMv2 when required.
>> Yes, but a new ISP may also have a different pipeline altogether
>> with e.g. more then one preview/viewfinder output vs one viewfinder
>> output for current hw, etc.
> 
> My scoping on HFI shows that the IQ structures between Kona and later versions have pretty stable data-structures.
> 
> It might be worthwhile for the non-HFI version to implement those structures.

Maybe, it depends on if they are really 100% the same
various IQ parameters are in various different fixed-point
formats. I don't think we want to be converting from
one precision fixed-point to another precision fixed-point
in the kernel.

> I keep mentioning CDM. Its also possible to construct the buffer in the format the CDM would require and hand that from user-space into the kernel.

I believe the CDM take register addresses + values to setup
the OPE for the next stripe to process ?

Directly exporting a format which takes register addresses
+ values to userspace does not sound like a good idea.

If you look at the current structure of the OPE driver
it already keeps tracks if per stripe settings, only atm
it programs those directly on the stripe completion IRQ
rather then setting up the CDM. Generating the CDM settings
from that data should be straight forward.

I really do not believe that such low-level details belong
in the userspace API in any way.

If anything whether we are using the CDM or directly doing
the next stripe programming from the IRQ handler should
be completely transparent to userspace.

> 
> That would save alot of overhead translating from one format to another.
> 
> That's another reason I bring up CDM again and again. We probably don't want to fix to the wrong format for OPE, introduce the CDM and then find we have to map from one format to another for large and complex data over and over again for each frame or every N frames.

CDM is a much lower-level API then what is expected from
a media-controller centric V4L2 driver. Basically the OPE
driver will export:

* media-controller node
* bunch of subdevs + routing between them
* /dev/video# videobuffer queue for raw input frames
* /dev/video# parameter queue for extensible generic v4l2 ISP parameters buffers (with qcom specific contents)
* /dev/video# videobuffer "video" output queue for processed frames
* /dev/video# videobuffer "viewfinder" output queue for "extra" downscaled processed frames

No statistics since these come from the CSI2 bits (VFE PIX)
on Agetti.

This is is basically the current consensus what a modern
hardware camera ISP driver should look like to userspace.
Anything lower level then this should be abstracted by
the kernel.

Note both output nodes can probably downscale, but
the viewfinder one can do an extra downscaling step
on top in case userspace wants 2 streams one higher res
to record and a lower-res to show on screen.

Regards,

Hans



