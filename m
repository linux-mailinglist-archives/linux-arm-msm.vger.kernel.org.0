Return-Path: <linux-arm-msm+bounces-105788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBMREs/l+Gkt2wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 20:30:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1B94C28F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 20:30:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1BCA93010BD3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 18:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C313E5ECB;
	Mon,  4 May 2026 18:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IDiEgmbo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aBx2miVR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986B23E5ED3
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 18:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777919331; cv=none; b=firuCTqn3o8Z5WmHklVALpiRM3Iy0G2YWuvIBZI4U9lb/9m4Q2PLvSBr3VIoMYRQMvE8I3uzUyCDndoBQ5S+vb/hSAE8n5M10mNc0yQC9tzOqxp0EOiIT9aa45mpGDyl7SBcbZCUVGBB7wo9ZYM5QJidkVQ1r+Kw/o8Uld0SOxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777919331; c=relaxed/simple;
	bh=ti5prjYp/HFYK3yYqNkUysgzZnIbDiQFG5MbvASSckU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L0GIHll63kSTiDjZkb4N7D3cp9H+P0gTeLLhAPwFjinY1lCb1u3kDV+dDi3+g8X1q7NYIbT11q5qrS3aJctZvzexzQm5ZVel2dHuYZ/9blSuKZOATP3uXcVy1+Is5wzHXJRW6cOOalfJM18RAnJ8S1cBkLWJJAz3Jv+fk9nXKbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IDiEgmbo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aBx2miVR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B4Flf1152047
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 18:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	99MBXW5JwIMxZwJVQqmfrVFJ2OTTR6MSlKAWKqmGmi4=; b=IDiEgmboU7OkKgw4
	SbteSLCTNsOmYCDr5jcQKPJcO8aULas5c54VLaKTis4OBHVt2r/H89qpds+tMtqg
	qqeUXEBvWruzxfncJ9aU0m+jYedQgGmMEQnEBaRDPAhVKndPoWudcLyCV8bLN6l1
	GvvEK+ljutjDSKB10ZhKk4ZIPKrzkIA3rrPC8/sO74z+mgZdC/KJq4qmnW0hyEI/
	rCaVrh9dEx4rz7HfbohX+TNuv+LUo9oEvv0MR8mhI2G3pnf3hu41c8Cjlw+6Hv7s
	VEL1DEvDCqLX0SZpSGmRKNl3UyG3vL/UQ6wKUvUn2QBZ6BctqmY+Sp1WCQfHgPPC
	CpssPg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxscy9r0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 18:28:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35fc7ce432bso1394264a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 11:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777919329; x=1778524129; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=99MBXW5JwIMxZwJVQqmfrVFJ2OTTR6MSlKAWKqmGmi4=;
        b=aBx2miVRNQMom0pfvsgxsL9uRSKQWhGPGZ3WCL1KxN3fTh2sutquRllmlQIRE9dVGI
         JG9GxCZ0WpTBb1269v8l5AmXyW4WO0NZT6zK4QUZerczCTWNpHlwLEPLcnzYcJWXt23F
         iyqOfrlgOvY9fE4UspRgZ3phpDpVrhotd4HspiYThCxjoZQg0AOk/6cygLyn6+k6VjaY
         hrJZV4elFN7cZQDTSd9GJnu/656uAY9IjtOTty7IrZIFewmkQT5GoJ88dOUEszPvK32T
         AawSyecnLsz3K+N+b3vR0SwUdrSpKoTdcbncUPDnbAz/OHth9cX9BrjDbszxdH+uAU6M
         scfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777919329; x=1778524129;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=99MBXW5JwIMxZwJVQqmfrVFJ2OTTR6MSlKAWKqmGmi4=;
        b=F5YUcW3x/5rYS5kzpuvzvxUsG5jwRgKLsBNivmZEO9slFcB5ZUkItFWbBdeOrbiZoF
         6pKgqPt7mke6kAIMkS1/idnqj4R7Fb2OX3upo86nTZ2SRjb0uJaPtclPKsynlnRG4/zc
         j8cYsflrlAWZZxgR7I8IA1Vmox/7T1gBTXEYPDVTGO6pyKp6dvm2iHIT1CJwqDGVddWW
         nBXeXusPC0aE0oXnEDglb/tIILZNia5k30BtcF/coI+dSDx2ESL6hJyDAZU3hibA9pL9
         pSIDrNS613RFsstScTHZbzGfUS9usQuW+s2GOfh2ik9v0S2QBfP7/ayAAhBWmJ6Zu1v8
         ttnA==
X-Gm-Message-State: AOJu0YwMjtxmW38jiSloB3PcEqLoPesi2SagFnxgyXWZDBxpkAH7fJyD
	sVb7F2BDtPEUn9BFc6b2LLN6fMLRCASXbqrkg3P9gE5d0gIzJ/dz3mz1fed+tKd3Kg05ZSG17k7
	iuGvoutJQ4oCBWVuqYvWJXS5ljDJJTqJs3afoSPdw1hdg7SkPkyqoNN4lPYKLaRGkuUbl
X-Gm-Gg: AeBDievV5xq0o3vLj9bXSkDvh5weHMxoN6keUlP9mycCraey6UDZEq5UQNcq6PZmyRP
	UTVCS1BwwAU6J6xnYdrFzySH+MSlGxa94N0yFHg9g+U8dC3c1pUDWfqmTzFFKGIY5G9XcCoiRg1
	H0Fuw+jYyR2fDvHeEG6s54+wWEF/f4kZri5rjwphaduUpz17D7aKO5wEIeLxqv2G6+FBCgqbL0l
	n7+VhwfshE0EhZDZeZuJ9PcI7l0cEncgkcJtILRsAiEYsdlFwJIOxiFaQ0rsUfwdL0kXp6p1Gsk
	+a5soWh9B8mTzb3HglG0U74tJmrxVPH2cwqtblov6aUsKDklN6NYjBNgHYWlQHHy3toUqi0x5gH
	pOzEbwZIypCxtzg941GdEg+Up26ywpDROKYY554HXxdCCcxOuW0Kn/VJgIDyz
X-Received: by 2002:a17:90b:3f8d:b0:35d:9d38:5363 with SMTP id 98e67ed59e1d1-3650ce7e59bmr5406237a91.5.1777919329071;
        Mon, 04 May 2026 11:28:49 -0700 (PDT)
X-Received: by 2002:a17:90b:3f8d:b0:35d:9d38:5363 with SMTP id 98e67ed59e1d1-3650ce7e59bmr5406220a91.5.1777919328626;
        Mon, 04 May 2026 11:28:48 -0700 (PDT)
Received: from [192.168.0.8] ([49.204.27.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ebf2affdsm15253718a91.8.2026.05.04.11.28.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 11:28:48 -0700 (PDT)
Message-ID: <aa0a4949-103f-469f-9086-782700be2a87@oss.qualcomm.com>
Date: Mon, 4 May 2026 23:58:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: monaco-evk: Extract common EVK
 hardware into shared dtsi
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
 <20260427170505.1494703-2-umang.chheda@oss.qualcomm.com>
 <9ece279f-2f57-466a-9af1-9fc8670c8ef9@oss.qualcomm.com>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <9ece279f-2f57-466a-9af1-9fc8670c8ef9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE2OCBTYWx0ZWRfX1g2vQUcyMW2p
 0WmG71U3cSHJ0mowpzHVvgGVtUhaoGrITs7lY8bhZjA7tdOv8R8Ap069mHNUNgsjyU3fFkhozUN
 qoIC2aCNmtlEYZLIBHy2UUwOJhrOX3asMzWzd2NRJJ4k6zAGBmsxthh2v/IswnESX1fv7Is4mz5
 hxqneu2zIuZEiTqEQPmCKCVXSpP/6B2w1+g4jGZ5EA30MD+RtSgTKkBAk38nsmPSwS0Y2LuvUla
 3L/uu/3tAEQVaqJI7qLtAVRieNUpXT9iXpfv0C+YZwQ0JxqxnBqjh7Qt0Jt4fw1TMZXdMpFEYdf
 9g8PL30RE0BYJykDkCyoJkx/rxVFA558q40x5dlet+sCPv+H4b3MWJuP6AZ/jP5v1sKVO8/yav6
 316XFqWAHtpdn/OLBW2ScnKJMZRQ+spbbJ9uIVDmtQ8N6LZbXQatteHCtmmmMUJszdiPJ9Xgvlr
 XaKwWMsB1565gji8z7A==
X-Proofpoint-ORIG-GUID: xWv2J7N-PHraaP0sbBWTDeSHl9-0gQhV
X-Proofpoint-GUID: xWv2J7N-PHraaP0sbBWTDeSHl9-0gQhV
X-Authority-Analysis: v=2.4 cv=C47ZDwP+ c=1 sm=1 tr=0 ts=69f8e561 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=U0tfe/lGaXrCh4Nw9m/t+A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=nlVMCo2lvqEUaAJ3400A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040168
X-Rspamd-Queue-Id: DC1B94C28F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105788-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Hello Konrad,

Thanks for reviewing the patch

On 5/4/2026 6:27 PM, Konrad Dybcio wrote:
> On 4/27/26 7:05 PM, Umang Chheda wrote:
>> The monaco-ac EVK is a new board variant which shares the majority of
>> its hardware description with the existing monaco-evk board.
>>
>> In preparation for adding this variant, extract the common hardware
>> nodes from monaco-evk.dts into a new shared monaco-evk-common.dtsi
>> include file, and update monaco-evk.dts to include it and keep only
>> board-specific overrides.
>>
>> No functional change intended.
>>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>> ---
> 
> The patch is a bit difficult to view as-is, but the gist of it is that
> the resulting monaco-evk.dts is:
> 
> // SPDX-License-Identifier: BSD-3-Clause
> /*
>  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>  */
> 
> /dts-v1/;
> 
> #include "monaco-evk-common.dtsi"
> 
> / {
> 	model = "Qualcomm Technologies, Inc. Monaco EVK";
> 	compatible = "qcom,monaco-evk", "qcom,qcs8300";
> 
> 	/* This comes from a PMIC handled within the SAIL domain */
> 	vreg_s2s: vreg-s2s {
> 		compatible = "regulator-fixed";
> 		regulator-name = "vreg_s2s";
> 
> 		regulator-min-microvolt = <1800000>;
> 		regulator-max-microvolt = <1800000>;
> 	};
> };
> 
> &sdhc_1 {
> 	vmmc-supply = <&vreg_l8a>;
> 	vqmmc-supply = <&vreg_s2s>;
> 
> 	no-sd;
> 	no-sdio;
> 	non-removable;
> 
> 	status = "okay";
> };
> 
> 
> which begs the question - is the eMMC only there on the non-AC SKU?

AC SKU as well has eMMC - though it uses another power rail. Currently
changes are not yet ready for the AC SKU hence haven't added the support
yet. will raise another patch - once it's ready.

> 
> Konrad

Thanks,
Umang



