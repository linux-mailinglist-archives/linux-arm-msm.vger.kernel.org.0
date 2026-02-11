Return-Path: <linux-arm-msm+bounces-92541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EF2oIenii2kVcgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 03:01:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCDE1209BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 03:01:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95D22301982A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 02:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C7AB29D270;
	Wed, 11 Feb 2026 02:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OwnsdMhk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LrejpSwk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25471A294
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 02:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770775271; cv=none; b=eEdSIdHcjOkE+1xQpDeZ5kZ8ei2ISmYXeQ8SMmxY0Nh6cXvjm6ejnrH5UldmdqOGqfsK647XYNXmM6hBYcFiLokdBUXf4HwAJcaKfVHOIHiVbxaCx1CBdTGKVSyzSoa6gCEkJG1M6HF4zYS2txQv3ibFBdyIZq49PI/BHtg7H84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770775271; c=relaxed/simple;
	bh=jlZbVom9Gec7MdaPSlEWB6jqqssx+eiCrYK6mbPslXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TyQ/BG5CvbHb+zByTgoAHZ/sOm6xp1Iy6+MXNiAORWc5BBmjJZBWFDLL1dR12gbIVirw48amBsn2hevevrsWeoBXRgbHNyMPZ5Y38Y9F+GYusewGWKDxrN+pB6h0icUWeAbt4GDmaKyPMft7cwG94nDgplK6H6ml0XFv5NTKMmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OwnsdMhk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LrejpSwk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B0ZiKP4007896
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 02:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5QOR/ksxaT2Cm95KFUQb+ag29iqIp197wO0Y/reGsqw=; b=OwnsdMhk1VcuO9D8
	j2Rxyr1Rqr3tI2bnzCkqopysCw/+59Eu9LaIOHXjN5rQ9Swq8SkeZwy7ILiZHYQP
	tcP6lG8iA8axW9oK7zbncI497OLE2cH928NUpgYNKUM7Tc4REP5w85D1eAhM1Ly7
	YHeIrWvIIzmvES9Hh+3pXASWUGYa48TE5bFL4fjl2oKTgkOUP90NyMCfarsPhgHJ
	tffRFlHI5Pn5GTiyuitIz27greIFkr0qUw6sRuZUfr7ajV6x2wNLVpxHnVKw8a5+
	j9HymBFtSe0QnMrECG0mi0luDULYFdMgOUJwioLuwTAcnOTmd+o5c/7N2iiwmFPC
	l+DazQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8fbwr609-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 02:01:08 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5f178054150so3638606137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 18:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770775268; x=1771380068; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5QOR/ksxaT2Cm95KFUQb+ag29iqIp197wO0Y/reGsqw=;
        b=LrejpSwkKNdkmKGf+wW6/8RDP2k8mfrZzMfggAzVQq9wFO+VTHqixUXO+9HrVRzlsx
         nUQP0LbCuuV/G8h5amHM8qk6TMuljtq4rnoSne7YEzp4DloIh22gni49mpAQF4zi0ux4
         M/tFheahjs2YEoUA69bsORglSK6b7R7j6pBJaMw5Mm8PIsi9LAGtXIf+9Wei39k7qRnh
         /6VoAzrGRP63Ul6tmfl059HHAxshJTxMEIWEhGMz5BXySBgB0PMPliNigHHVy3CNgOfI
         ANwJLLcCM7ktnV9ypywQocEAyPmWrXw23Cb6YazscCrHd8HIcVM9zDF9v1A2jtP0Wrvk
         wX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770775268; x=1771380068;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5QOR/ksxaT2Cm95KFUQb+ag29iqIp197wO0Y/reGsqw=;
        b=hehiTzUoFopmzSxdT7guml2dcUI2Dfo4M+2TlmQmiFXJbz/DwhIdH/X8w4zpETO6IO
         XuPgdqheowN4+a2tLSi7cP3RrdGQ/FXpbvcDirSJk2itsxxkW4cTf4HXBra+VeyjsoTi
         zrx3wpklOPc0oH4VFKZV9krw/Y0Sygj/ITElfxuZoeG8yVba2fX8j8ES25MS7tMORJfE
         U2Z/FAATXZfk9HVjFkY1f4W9yF2/XLVz3aufe6RIykfn0Ukb8eApafoRwhGQQwjPFlQS
         YT7ZRU31ocJDiNP8ZfILj4bcjvLPls6MWt1Lyp6lPPCzgWMOHbX3ch7xmneV6H89KH25
         vngg==
X-Forwarded-Encrypted: i=1; AJvYcCVOiBwYfQxDWmfFAeoEbnMhKa54mtMYhNQrNg3cfETeFq3DHALbxFEiqieRWfXLlFIrvvmwD83AxUd7qWOr@vger.kernel.org
X-Gm-Message-State: AOJu0YylBQIac19lVvFcicb1TtthFmuyxnlfz2SzxnR/Kedi0rXYSqBD
	rCgW2QYJr0snQMMSq/dIa/xBwlZIZGnlSVoN0GbWubBdWl1+jjR83JAvo06T91dm30tRhPMp+bF
	PvfeY+61d1NH6lLSldcc36EHJqacweL/LXEZmn+stbYJRdNOcRllUz+Fvt5PXwMXzehlZ
X-Gm-Gg: AZuq6aIa/TSoL7GygRAPULtOddnSFoGvgEzgXddieXMC67HPn2XCothno+rVCu/4Toc
	t3oWyQcZYLuBlhk1Vs+N09VHb1OBt99hDWNIrUp0v6X9Gb41lFHTzSpE7G9yE3ITy4PfL/KKgq0
	T1PAeGI6p13IF47geRBFsD+73JmibQfCfWmS4bxPynjiOBUPcfYTr20Vt5IH2FvwqN61yQc4c7d
	V83ghljRwlrHI+C2OTg00LXOwT6eoCsNIW4QIn7miS1n5jWxDoUrFqRaj3nBTNfcB3ths49tRV9
	zf6dbQ5Wa0FnDGK4A3tN8lUZzzFghycnbZDB/4uVLZO92+obXFdOkGMxZv+knyX1m7YyCRdufPA
	omJDHF27NOH9fj6WkasowP1qDbo4XbmMwiBKMj/L1LAf79y1iSiLQkQNaIGYwhzmEIGRxdoonNd
	siVflgVzJJqJiGr8tx6/HbgVTTcMnk5K6ZuPc=
X-Received: by 2002:a05:6102:a4a:b0:5f8:f6f3:84d7 with SMTP id ada2fe7eead31-5fde41eb0bbmr309826137.13.1770775268259;
        Tue, 10 Feb 2026 18:01:08 -0800 (PST)
X-Received: by 2002:a05:6102:a4a:b0:5f8:f6f3:84d7 with SMTP id ada2fe7eead31-5fde41eb0bbmr309813137.13.1770775267737;
        Tue, 10 Feb 2026 18:01:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f89a356sm18618e87.92.2026.02.10.18.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 18:01:07 -0800 (PST)
Date: Wed, 11 Feb 2026 04:01:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        robh@kernel.org, krzk+dt@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco-evk: Configure USB1 as
 peripheral and USB0 as host
Message-ID: <ycyxh56wr5vgtuj6pu764nmqkk6wllwcdqrg4azshlygqdsesy@xsunyu3zpfwr>
References: <20260210152548.769951-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260210152548.769951-1-loic.poulain@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GM4F0+NK c=1 sm=1 tr=0 ts=698be2e4 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=F2uzNt_Jvis__oCUEkcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: 8sVGpgBkR6WQ0BRzXKN8YdZtLOnPhvNi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDAxNSBTYWx0ZWRfX/iW1ViIHHuJ+
 rsDr5NU+5DrN0f7wXOCYT1FW4EpCo8Q06UqgnOEbcLl7lL1kiM4rN96nmY+hO4Pe1bK397bdS2x
 Djk2oazZLZRxi0suhf+I1G9KcGchsFVNN+4WO5ZOL07D3mvbyaPDnPcoaD2VoQ8KAE5ZJE6nKBh
 i5YjWeU0Q9Ra1FYppmMtFpn4X0sGZjluk7rr4und/2ndskqV/V5lpkT2vG8R6c+Z/w8G04ygxOj
 VU/vyXqxDEKy66tTQcIWMu2QXyPrAa0PJFxLV1c3XVIR2BXixZw7yc3Vq21S1ES5rDQ5IWiFQa/
 bUHmqNkbujGxDo8NPOQO+w00kaRus4hW1kAyNzKtVCpwjORjJT9anjLBTIPkp+QLJMgvvfBxs9M
 XFAr9RpV7AZhbWaV/GDVfvth08HGg6D1790Z7flHwo+U1STCuneTb7APMR4+TdB94lZgpJ38Iru
 YWkM1Cc2gyywZsQbrlQ==
X-Proofpoint-ORIG-GUID: 8sVGpgBkR6WQ0BRzXKN8YdZtLOnPhvNi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110015
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92541-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DCCDE1209BC
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 04:25:48PM +0100, Loic Poulain wrote:
> On the monaco‑evk, USB1/HS is routed to the micro‑USB connector labeled
> ADB/JUSB2. Enables that port and configures it in peripheral mode, as
> expected for ADB/debug usage.
> 
> USB0/SS+HS is also repurposed into Host mode so that external peripherals
> can be connected to the monaco‑evk, allowing it to function as a proper
> SBC (e.g with USB/HID devices connected).

How are they repurposed? Is there a DIP switch?

> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry

