Return-Path: <linux-arm-msm+bounces-114052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GmidHit2OWqUtgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 19:51:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7D96B19C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 19:51:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OO9HTXEO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=O6XXPEP3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114052-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114052-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B236C3028C14
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 17:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5ED342173;
	Mon, 22 Jun 2026 17:51:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5A83403E8
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 17:51:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782150694; cv=none; b=AY1JQUrRWyAUemWfm9ltdR7BvzXdIzpV9uDoAair0zW22C0HKAmo8NX1qNR2aEzI8IIRGZKMv6uqkPa5K/qJUqzlrJuEvOPtTxTl7Fm2pIRegyqp0AsaEnA0jWU5NWGVGO/UAp8fNM/hf3wE2UHXvlwfW6dN/574RNMfuIUQwqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782150694; c=relaxed/simple;
	bh=rU66pNh3eSQsYT3HOOaM/C4NT969liCxZxRQ7WDslT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=czCkfnmbMjtaNlXA9TBu7npXjVuZ37bEHF8NNP7+jHGa55c6ckgXkVf+l+RrNfrPsR+6G5m5A45IqLmpuIduiUaRhFzhkZ66NyoNMRiS0aJMD6JlVchBcrEn8zYXXc5EhOYdaFdUgEv4bgRxnZgVfaLZq/KRUKkbTYWWMA1DCeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OO9HTXEO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O6XXPEP3; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MFW47r1010832
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 17:51:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2dLP+TVO4tZ92+I0qsy0dTT+zkkqGwfMz4MJYSPYxO4=; b=OO9HTXEOxIEIIcYC
	kf514nYXGtehIG9U2CEeACRC2QsKKZfA1CwRVO+RSPzeFihmrbTnnuFx0URXowBa
	TW3tspECGsqsNkKoW+XkUO2hu/iiHusICluQpKqEuQoSInG+aGV8iTz9vabvaYUj
	lGfkil2VlDGS1EKwJd6cV05WZ+wBT+9rwRalKqwir9NSOYnXyy8BWUbiVRiHWJjA
	IvXd6uzCWbtyKTthHzn9zgjK4gpOaYRmLGLtFihfltSToI2mGzsK9MfCQzYqPq48
	nGlOKp5CxvUWHPtvTZ3UnMoYan4i8rs2QgKPy7KXaRuFERMt8gMGlPGCTGy8FDy2
	Dxp8rw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3a0smfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 17:51:32 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8454912a507so6435658b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 10:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782150692; x=1782755492; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2dLP+TVO4tZ92+I0qsy0dTT+zkkqGwfMz4MJYSPYxO4=;
        b=O6XXPEP3uX4e7eXteiV10Y+subYEonpYsTY2vzvkg9/lQtKnynhsljqb63y0lYfu6e
         kfZli2dAfGYw2iHW9DqHUQO4Pb3QtytpB15mt+RiWq45vVao3PTV1J7LdGQ2iZrldw0v
         k29qb4BA8cW+BXN0GG2CLWejLSPTJrFcQmbnGzQYaZxsaJIvWzHSI9ezZmPr4U8Yvy6P
         xUaKiiLou4ZqCXnwf8o6RjDZt0vXHBSVY//uQPvtwMBMVMwCHCuk0J7/BCWUi1LL0B1D
         wMDNxlXmt//ITEz6QHbjIpuEtXbLT67qHvbRs/9iGh7bpmV3H8hQG4eJTnK7iPWMSaRN
         Gi4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782150692; x=1782755492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2dLP+TVO4tZ92+I0qsy0dTT+zkkqGwfMz4MJYSPYxO4=;
        b=DNb3LKlh6n/NmVw+DP4bAouKC6mDkDSbkffgHBQqMmzAdb4BpTUOPqWXvWDHLxl6ZV
         j4lWfYyvs7j61iFqQXeT2KtUOJSKptXp3jiTlOrzZJKkcsY6TXyxfRJknNBMfDflGJav
         ev7fwRYSp+9x9t/GKYmVxFeEPvkdtXI/5xECTlun6LfAU/7FlVYwi+TNwiVUhVbCePZS
         RHSXGURICfv1AD4DF0I+lnJBu83IR73PYomI7vGVciCl2ka1Od9+bDP1PtvVovYQTSgH
         Eg7aAr4VX43pI1Os9iwJwsrK8t0A1TRDdb14sfxtqaZX7OewAEf8j0a16zvgCjBr0HXB
         zXgw==
X-Gm-Message-State: AOJu0Yxxjc6m9CxMGP43VwHk7Aevoc/R2/iPmO+CajZqMCUill3qIvJ3
	0Ix+x7EQzVLfwkUsWmmkXQ+LqAdUBFr3Zrcf51Q+BYqxnHlUpP0MXQOILAbYy5IlNSktOGBJUgf
	bTNwo9xujgU4hJLGhBHKqjCDJlP66jC6fbtUGZcr6n638ucETRwU3cukHQM6XMvA14y25
X-Gm-Gg: AfdE7cnPBgd27EDtwzBfKlcrLu3GAs1Mz2Mq2RyJLG1OmOlvn+N8s5Pc5sDr6d0r7ZL
	Xjh+FnPYWnJG2W+OV0Nr9ATYjlUKk6qMIyNOQ1b7T4cHue2yi5xWhl0ONbVxtTkGVcsHTEmhFU1
	Yp9EPEK7km55xIiCKlB7JnZiLhF69pDJylt6VltzEiPtvzigZzkLvG95J81CIYJXULypSoRG7uG
	l0g2ED4eLpztPwS1EH6XCXdNmmlNdlrxI9VmckJyrwB5xaBccsEbKr6OuBiBD3zWAfpuQG1Daa9
	ZNSF7VDk1P4X7O0qZVGfhEBNXhPSQQ8tC9DNR9QLfoP3wEjlaM4d032rO08c1hLVcksk1rovG6D
	PRz2DzYJEGyOKCBHn6AmGeQCgs9uFwXFz6nLJ40k=
X-Received: by 2002:a05:6a00:2789:b0:842:6fec:1297 with SMTP id d2e1a72fcca58-8455078a336mr15737995b3a.9.1782150692326;
        Mon, 22 Jun 2026 10:51:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:2789:b0:842:6fec:1297 with SMTP id d2e1a72fcca58-8455078a336mr15737963b3a.9.1782150691759;
        Mon, 22 Jun 2026 10:51:31 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.26.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d89dd8sm8300360b3a.15.2026.06.22.10.51.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 10:51:31 -0700 (PDT)
Message-ID: <23e910f0-f996-49b4-9ba8-5acc3bef2172@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 23:20:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] clk: qcom: camcc-glymur: Add camera clock
 controller driver
To: Bryan O'Donoghue <bod@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com>
 <20260517-glymur_camcc-v4-2-9d00acffdbf7@oss.qualcomm.com>
 <8bd4365e-0171-425c-9738-0b186047cb15@kernel.org>
 <upcLoSPzJejUNhFiNYlTVH4d8Sh_Pv2o9OZfXsY-CMCDKw19_ci2gL9B3ZwqL1hV1pQeQMLDL8tNLbPzs0JIIg==@protonmail.internalid>
 <2a496bdf-4728-47b9-84ba-063712a6e5b6@oss.qualcomm.com>
 <0a197b43-a672-4849-91c7-6e5bfe3175f7@kernel.org>
 <amL4e4IHe75_j1HTIsmqE_GyurvudlyHQCPW14zs7ivHz0UnalN-yoknJwzaVRgHTT6ftSRCqDyCodh6ABCLxw==@protonmail.internalid>
 <66335474-d600-45ab-9ac6-e946f24142c8@oss.qualcomm.com>
 <639c94f9-6f62-4502-ad7e-5ae60f5f6d02@kernel.org>
 <WdjOMNZ2o-UF6xXKW4LiVgNZB10ZaGze3YWNriL-f1jf7LgBzprN9bqqMYcvMJH8KUF5wtRpyOB0aL_7HEk-yA==@protonmail.internalid>
 <10c2e008-74fe-4dac-99bf-194a1767bc16@oss.qualcomm.com>
 <1de2f9bf-b48c-4acb-882c-9e35a8582d0b@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <1de2f9bf-b48c-4acb-882c-9e35a8582d0b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE3NCBTYWx0ZWRfX5P6Fp7oGzjNJ
 cUFYc59tKJK63KCW9/KE2KffUp4WH3c/kTG0nQDPuvhPKMzpJrAmhAm8TppBxCpnAf9ZslowD+M
 KDIRwN4yaZFfx/qT09eUAbBSYCqfIYs=
X-Proofpoint-GUID: tQtsWdjEpBnDZw7lEGGkh6CCFP-AOEXG
X-Authority-Analysis: v=2.4 cv=UJ7t2ify c=1 sm=1 tr=0 ts=6a397624 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=QCTWhj6wmzAtHfIuGYgeNA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=oDMe_2bG_2z3vvWk9CsA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE3NCBTYWx0ZWRfX79onvV2cMDqn
 smIXQzCPgLBuCB1QqV9vobmFIZ7jtjBUjNNeFDFsMgmNQYJs6P5iGko9xnFkk/bCcnES4VaBRCE
 ZnZikiBUIoS0drX+nOBJ3SvL8ssUWPbARh1OLHcZor/TMIj+0KpWGxo3WjZC9ZCnpA24TXCveAJ
 4L0ZiuYeJySQt7y/K5wMKeMtFbGF/CcR0DFSoIzVGIgkW1rBxFfSvdfCTuH/7/GPChC3P8k+0dL
 6+FqnJSyJo5XbLPsD5oK/kuf02TtwU/WZ542Idt+svfs/12lxZj7AuRalUuXSAq75wgB+EBRG/5
 VyhXkGBf+RojLkVVa6DmZVtJc1lx6oVVZ61K0hlF0BLDIwL5gwkSRm0t2jfL0s0hamxjbtJ1+bP
 kyQYr6alwWRwjLvTVf4YMz56MmEu46/Y8GXEhbTXtq7UCCa1QOUwjDF0ZxTvDHejFgfCeMvQayX
 dVK1ti0BSVebpJKTlmg==
X-Proofpoint-ORIG-GUID: tQtsWdjEpBnDZw7lEGGkh6CCFP-AOEXG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_03,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220174
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114052-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c04:e001:36c::12fc:5321:from];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[49.204.26.249:received,100.90.174.1:received,209.85.210.199:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC7D96B19C0



On 6/12/2026 4:44 PM, Bryan O'Donoghue wrote:
> That's an argument against changing the values, not naming the values.
> Hexwork in upstream code is a public black box and should be avoided
> where possible.
> 
> How about, take these fixed hex but someone on the clock-side in qcom
> agrees to update the script to write defined bitfields not hexwork in
> future deliveries. AFAIU its a script that mostly spits out these clock
> descriptors so, it should be possible to fix that script once @ source,
> without committing to fixing everything _currently_ in flight.


Thanks for the suggestion, Bryan. We should probably skip adding these
definitions because the approach just doesn't scale across our various
PLL architectures. The bitfields vary widely between different flavors
of alpha PLLs, and the SW driver doesn't interact with these fields
post-initialization anyway.

Even if we generate them through scripts, it provides no practical
benefit. The field names aren't meaningful to the end user, and the
software never decodes these bits at any stage beyond the core PLL bits
we already have defined.

I recommend leaving them as simple fixed hex values. This keeps the code
straightforward and perfectly aligns with the format our hardware team
uses to pass these values to us.

-- 
Thanks,
Taniya Das


