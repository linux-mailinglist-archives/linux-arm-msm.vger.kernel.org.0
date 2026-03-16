Return-Path: <linux-arm-msm+bounces-97884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNY1CG/Qt2k3VwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:42:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0A5297396
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:42:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4E26304565C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 09:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD4F43845A2;
	Mon, 16 Mar 2026 09:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIKTkxUd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NysbOBfa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCE738A2BF
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773653955; cv=none; b=WxxqPRv9MOmbWJJvQvRTuYLFPPwFD1kjyvDqxFds7JbIjaPkYpm+q9Y9ORQVpenajHi6FTuTKKUfYOw9fGRAvYmgehcrYqhIEySfKZFzVIpqh0oiwkiNdQsZ7Fsz9q+0OggL2ys4guTDBa99plXHF8Kf3cv7GvEAb9VWm3aQ6Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773653955; c=relaxed/simple;
	bh=B3OU56y38JhZLA9jQM1FfR0bPEJ4Iw/MDlK/lajt/gk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MXZYsu3DN3kHSTry3VResu9gFF8ZQUgVIkGKtmfyrQte+/LCUkeJCUmVSweLxHKrk4fNaNYROQOdHCfIlVlTm3l0PZrDhEI/MORTdAshn2NbDrxfZXqUnMxOVMyjJp6SQHf4sMhzRvCPQkpSbGTTB/COOilnxXvs42IG60kuFY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZIKTkxUd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NysbOBfa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64d6x538831
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1OLd1BUVc4e9AOajpXP8LC0jhT/oCscnk1JKQjEkAfk=; b=ZIKTkxUdBdd+OP5o
	RdvMar9RYFLh4pwe8RHW/Z4L7D/JJM1Nm9QrpYwRecKfkIgYB3vsTOuUtLf7ZyaL
	C+QlpcjVVeBZRF5O9ixgVrY44Pe+fcUblMYol/aokFGbdlhqcs66S9g2aO0/AHWY
	mx6unKpjZQ0ynRRXih6dwWdvhMUvjVyMFsOjV5AtQONzyK4izbqGMTHeIjL0CSkz
	ItT/eZfgwziAbU+dPxiirw57GtzpCPCjtRIz5kBMXQ/RpfMh4ioR5MyO+fJF8ERL
	iyr/FakdMVAS8pCAzeosqOZuClnVAhgtnj4+I3h9cS+o1zncLlsPP1T3b518DD6b
	bccplQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyy5n26r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:39:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd8198fe16so343880285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 02:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773653953; x=1774258753; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1OLd1BUVc4e9AOajpXP8LC0jhT/oCscnk1JKQjEkAfk=;
        b=NysbOBfaGpegOPUNNQU6hDEqPy/mAXE9cM7ApQC8elm7oDGbqU91vn6slNDpmeXTw2
         B35JCvggzDZn1uxwYwxwqX/WrNlVBim7wxQs5ZVlic3DPlISTHYso1Uycr1fCGMaNq37
         PDfx8MuTOkFn3V6S/9WSNP09SKMRs3gwVffJGZKjplz8TBDUYUksfzABKR971LiQhuEa
         MZ1Q83laSnYUMGwg99nSSaMuF//XwCiP/i+p8JhbzbA9GbAOIazkduNlfXKvDQhhmba7
         vOJahRmt+vEVjHXjHS0lUhWaCx1oi/K5wtNaioccSQEvkkYHZLxxnYjYqnekEaYMz5MY
         9hwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653953; x=1774258753;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1OLd1BUVc4e9AOajpXP8LC0jhT/oCscnk1JKQjEkAfk=;
        b=Hux/jCzTDSLFHndHyJ16UZwNt8uvLJZlKUTt8SZyhhRwGmJLUgJMhVyDEjS5J32pgI
         gaxbbYMFe66ezJuJliJsFMKc14n6kLfB6lSedlQQqektK0+dXCWoY6jkgCHBjY05XqfU
         4fqSwvVnMn0s7HSqGcyO+1Yab65n8zs2iE4yslio3gQ8iLdShNj1RMD2SVoL97Syh6Tr
         efo+k0YPD6hyzi+pz/5ocrS8JWNPM4jtki2QG2fgHGcHykiBfsZHtqLhXRVpOd/z1azO
         4qRfyAJAFPO7SsF35j1QivXDV4WSBO4D8OeYfDUQ94VfTstXRrxRr1Q2iQBB+k3f76zu
         i6tA==
X-Forwarded-Encrypted: i=1; AJvYcCVsD9GYlsMPHptTjiDFSyIEGdOgjxZvZg0hr0fswi/NPxUX0HrSgll1T2fI3/ehOaGr5RoL4mCEBVExrLNc@vger.kernel.org
X-Gm-Message-State: AOJu0YwuZ7iFox49+BN3lRhrvFKI3WatdFgfdZ3zg2njBaYryel8fnsT
	jRrjRxuiYHQSV+lNnPPAZhKEOGAQK5V7oG9N11oJ+0OeXV4OLWz+zV3dbiPuW1SNZvxIU59WYY7
	BG8hi4dRBLeWrtfDSTLWncV2v8M+jAGmR/0UAFn3KRtYikXKZUAagv/n2xVG+7+y0TtaW
X-Gm-Gg: ATEYQzxyTy9goi5OAx1vIsueEl6FcESRcfU99VOxzFdOjYIGrfLr182ZVjWs+MVkeQ8
	Skxzms31nkmi1M9hw9AT0TfwSkPAyeSd7QHZc4gpKpttmduzXWQdasXZF38KPdwKPBacNDPt/XB
	3IjL/q4IjiqrEdbOx2Zz1DwSRowOQhfIrzjO8S9vQW9QHTkKQM9l+B0pfmlG0af1WWxxTV4NXgb
	r3P8SBsCx2tfgGTLuVhdVV++gab2k38P9/GBn3ZjuQ8lXZCRZVgMvHKoR2t7tNPl85Lvef3qNZ+
	Wg0lLA9mgJ32UUQy9i8SibpyyIYVxJkSPWp5kCGZvtOkbCXCMW0nglshqR6jQn6YaaMg5/dyn3y
	+Hn8FQd7nEXAt7c87u396/srGQ95HnDTnbsuC3LCYNUYUy/K1AyqNnw5lndnvjTwoC0UMYuElBl
	JbqrM=
X-Received: by 2002:a05:620a:44d3:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8cdb5bb356dmr1363742385a.8.1773653952600;
        Mon, 16 Mar 2026 02:39:12 -0700 (PDT)
X-Received: by 2002:a05:620a:44d3:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8cdb5bb356dmr1363739885a.8.1773653952142;
        Mon, 16 Mar 2026 02:39:12 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cf49fa6sm529902066b.58.2026.03.16.02.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 02:39:11 -0700 (PDT)
Message-ID: <822cc610-7984-4684-99d3-8abd679eb06d@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:39:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: qcom: x1e80100: Remove interconnect from
 SCM device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
 <20260312-hamoa_pdc-v1-1-760c8593ce50@oss.qualcomm.com>
 <bnaxwhrfeer3n62xp5rka4pq4mz6y5xxwsin2vavc5zcj3ymxj@splrj22ki445>
 <198ccf60-a4b9-438b-ad92-bc4d2cc84b83@oss.qualcomm.com>
 <90b3a7df-cd02-4878-b614-1499589f0906@oss.qualcomm.com>
 <uukjr4c2uymzj2pe544hn2w5ecpmqle56mir642zieip4ixwor@3uuhplnfo5qt>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <uukjr4c2uymzj2pe544hn2w5ecpmqle56mir642zieip4ixwor@3uuhplnfo5qt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ATr9MwljXSBdpqA6bafrH7pl1k4VomkB
X-Authority-Analysis: v=2.4 cv=QOxlhwLL c=1 sm=1 tr=0 ts=69b7cfc1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=GTjZm-GAFzhKDQlTXa8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: ATr9MwljXSBdpqA6bafrH7pl1k4VomkB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3MyBTYWx0ZWRfX1pVkj6b0UZn3
 KpEFSCyg0j+pvn2b1T4D27AO5koc9CeirwPLqyI8m6Mg04JR9AkKnC9j496gKFPFlNC0uBoxL/Z
 ByA5dMK8wnNvvqTR4g9LB/sVEEtiSHlKxrSL8NPTgWH8GQsnXmup1+FFjMgSFFzgM6d7VPSj2m4
 UKAwQZotCRn1rmOuXSjmjKJRICfiNzoWVpg5apxztc3ee3LG9PMLE9/k9TxDvTmyJhcKIhWQyHX
 pedS19POGTdxosbQ/0fIYt17pgQnJ4Pe/8GOtk0DG1rOR/oad5E6CEbqEUQMonGLMtRKpc4PixT
 r2zYGAiPVZQvFzMgAb04pGOYCy9JZly6b/tBM6Uoikb+3rdcHB/YT3S2MRiivyUq1lLTb/EfKEk
 ZkiGld9lIYDBLIWEIh4gxhNaH3Vh3ELeP1yXdK+jlo3ihQ8KxdvJcAaYRbMWLiD+ZZzwE+kwFFJ
 SCRSUQWocLrlVFoX3Vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160073
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-97884-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BE0A5297396
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/13/26 3:48 PM, Dmitry Baryshkov wrote:
> On Fri, Mar 13, 2026 at 12:59:46PM +0100, Konrad Dybcio wrote:
>> On 3/13/26 11:12 AM, Maulik Shah (mkshah) wrote:
>>> On 3/13/2026 7:41 AM, Dmitry Baryshkov wrote:
>>>> On Thu, Mar 12, 2026 at 09:26:35PM +0530, Maulik Shah wrote:
>>
>>> d) Add separate SCM child device (with interconnects) under SoC.
>>
>> We'd then have to probe it as an aux device or something, which would
>> either delay the probing of SCM, or introduce the need to ping-pong for
>> PAS availability between the API provider and consumer, since some calls
>> work perfectly fine without the ICC path, while others could really use
>> it
> 
> qcom_scm_pas_is_available() ?

This comes back to either having to wait for the interconnect provider
anyway, or allowing the ICC-enhanced calls to take place before they that
happens, stripping us of the benefits.

Konrad

