Return-Path: <linux-arm-msm+bounces-116748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /BnZB9uOS2r6VQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:17:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8295570FBD6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:17:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CQ8DxLlC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OmUumGr1;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116748-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116748-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C625E302A7BD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 10:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D4963BED0C;
	Mon,  6 Jul 2026 10:29:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0B4389E02
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 10:29:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333791; cv=none; b=Td9YfrCX0tCYf2fng7oBww9O+JVEkpVbETGNAjCk4A6mxJfMdIjAZqHqT6tHqAlBu7sPrew3K9cGtJSV1rkgt21OhmvPDYjl2Sugem7S26OXrWvGecsBxxVBbMYEQNUyggRv8A72ptBQzfuWSgG0gl9s+6iUa6dbWPW+ui+0QZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333791; c=relaxed/simple;
	bh=w41DJ4Ry6ZbMPP3IttDbLbgduHem4JSys+EOUqlMzhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kkX0UgODDf6QXWA8qepFdvrnFkpHQ50OY7VFqdpDLr8vhd4mgutrkfFRcV4yb9fZ5PFErBp9pDWYx+CK4izsdDTLk50SiTyfGtlqw9Xvw0OrWjEWIbWqfEyzcRUOERW8I1cepXgNivitbx5r5xQCJToqUf8+FOBu6+92EDSB0ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CQ8DxLlC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OmUumGr1; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666A3IUv121042
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 10:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0pc41nX7pRqFYy4VQDIaqHwirZrUl06nKO1Kp135PuQ=; b=CQ8DxLlC1ALFL0bg
	Iw6yid3E1I6+R0CgByXSVw5QVqbIw/oMVh7qiOlOEkFuGx3QpEqAO0SNa+Ky6Bto
	S9SzmKNQWG794T00OXtZEsjYUYnr9oala9fjspMTNn63lqFAppasLonfpBcCCtWd
	0//Pqou3zsTQc03sJjgOfuwRW9od18ohbhoR/6RsfrEIW+OtwLL5m/oSxLnVo4ev
	AorzrNj0RU3TzN4HuVwFyMSFbpFzH41IE6yEiUNBqTQiYUFrUGGhDFLUJ2sG63nf
	lGNjBW7UcdkdUPuiNgPjKQDsGvyRA/fZqkA8JNWRlCFGu3O9EklEsK6o+SfoiIJH
	/wQtEw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98g3cv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 10:29:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfd1772d8so6956151cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 03:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333787; x=1783938587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0pc41nX7pRqFYy4VQDIaqHwirZrUl06nKO1Kp135PuQ=;
        b=OmUumGr1t2oCn8+Zslg00AlU2kp3JFA6aQBtIMfN3oGzv0OngliAKFGDiJLfDNwCmM
         TYWOi8rGefY3HbGKaLcTDwrHfGcTMK0Vdt+faIAxeXFJZIpyrwL+dIc+UL4lSKVbgM6w
         UOf+cR4yI6SzyEqyfqMyHrMVur7n7gbWWGKwemo2MTxGD1F/E29hIf/Kb1VMsLks3KRE
         Zi1LHumQYiWCwFYtUt8GxikA9u2lvn88C1pSeKna7UlTuX9Dh3dLpBCqOYTpvOoMEDiL
         HC9h+8Q6XvK/ZrG2Jqb29PSqnDWeoy1/tA+L6bNhOJ4LFaYIpdk0bPK8eogOez1Puz8g
         4omw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333787; x=1783938587;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0pc41nX7pRqFYy4VQDIaqHwirZrUl06nKO1Kp135PuQ=;
        b=r9jl+Kp90zdO485xrVSerZ6Acn+ty36FsXbn7FX+a4eet04Fd5oDzcNkru1wFtUabY
         R3gJ5c+cWL40SEJHv9OTu16us3NS14GHEuO+4N8uf1GGHfMxiXncCg0DyCUQlcgsw4Mp
         iqNoHgfbFrxNqF7CIqMfkjV3r2HOZBxQ2o13u+no3zhmxxEob5qXq0nujfGX15J1ZlOq
         V56lC6SJ6Et3Cw4m8GFyLlbOj6zoMxu6vpahUgd5+GWMBPKLR7nmgOJFwBimCCa2aqD6
         GHVVRo9RwfjOSMr/jBIKBFD6aRW35CWcLlwQQg+kPdWic14cA5yWDFysaBrK8qQFpDJ+
         XQFQ==
X-Gm-Message-State: AOJu0YyS+w1iCg0sGWhuPerrdocqGYyRxBH7vxwEGULX0WCBX1WdAt5R
	YsO/aspTSrZPFFs8RT0Or0zwQmbHY9RojRvXM7Zk00UFy1hYXh/Q50iJhDrkmgQoghZySLk317F
	C+yDvb+1WvPZjXty017MADc5KqITiYYkbjDX4m6GaDoa9H28GQnyiz+UY7Xg8cS/aJIq1yLaAdA
	OW
X-Gm-Gg: AfdE7cmAxPic+fsdurt3BZV54Ic6I2RaMzqbgSvfCGEW1CMuqiSeCpeimhnifpqbcxX
	QguBeZRhz3kJZ7J02TcCorl1yuZPsTUXZ0HLnXlMDPuEU/VS3xreAKJdxLBe3Cdc+CQJqGva4mp
	Lpta5WuXr+tJ2x05w8Dylpy6yeZMLBp7qHKKyxQpBP9gzVgzCXp28YIoniZKws06KPfAvOFI4qr
	oH0npRLC11ABRPhGDrSqgT6uL0iM0uXy0Gt08Lw1YIcQHRSLFpkDzFX0BFhXaeoEppdETtG+7Jb
	pSrOw0/T1N+Ri9fA7LBmcZ1DOndANsdUzp3sGPhUpBcBE3ij0fjiVGmVEvrBc+vaOVTgzL6zXbO
	XsaxgLCtR6vsF+4b9+29PkgRKtxL98icYryA=
X-Received: by 2002:a05:622a:40d:b0:51c:9fa:bc2e with SMTP id d75a77b69052e-51c4bed6c6bmr90102331cf.10.1783333786504;
        Mon, 06 Jul 2026 03:29:46 -0700 (PDT)
X-Received: by 2002:a05:622a:40d:b0:51c:9fa:bc2e with SMTP id d75a77b69052e-51c4bed6c6bmr90102041cf.10.1783333785996;
        Mon, 06 Jul 2026 03:29:45 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6095b7dsm710039466b.19.2026.07.06.03.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 03:29:45 -0700 (PDT)
Message-ID: <5ec94740-c81f-4117-a067-0f10a462243b@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 12:29:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] pinctrl: qcom: milos-lpass-lpi: Add Eliza LPASS
 LPI TLMM
To: Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
References: <20260703073029.2588960-1-ravi.hothi@oss.qualcomm.com>
 <20260703073029.2588960-3-ravi.hothi@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703073029.2588960-3-ravi.hothi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4b839b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=-Wy0pycvYJKZ-mX1LBAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNSBTYWx0ZWRfX4G8anyd5UYox
 9XDBn1AusYiXQhCblBXBUvHVk86ZcfaZYxSQJzOyo34f7fC40JeOGYlmBoJDCxgnuSoDs4zN5lZ
 4HPLFoo0LKwM5lMknpIouj1bxuFhFnvDmU4mJfxjDtyrPCbW3hv1raBgRbV8vWShADZcIbu7amJ
 v5z3eHOvRfkIVpsru9m7dUKeedRaJKrznU8wOOoTpmoTN9ap+pg9PSi/1qw3Uv0Cm0BGkBv0925
 vW87B0TVHAVinsomZzhQc/lOKkghKI1Svea2aNpDeH3aLMFTqS3DIHRMgNstnxVJgLlovuLIc63
 4s02ETrv+kkDT4OqnIQNmBqoXHpzLq9ul/kBX3n6lTtUOfJdkMt31gDe8K9HgPcDA7gBH1fKrHe
 HVleLNxd4OLpVLoQ/PfvfWcfiY+4a1lto+lKCGUNE+5fhNEirNUZF5xlD4iLaBjZrr+5dvww80q
 wQPvkvZfPOEAJZhldGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNSBTYWx0ZWRfXz41DU8TrNESs
 mrA8qNIhEP+sTzJ5Wflaxd1yR+dCHMDreK5XZp56FezMXOIu/ul3qimNf6WyjMCL26a3t68G2b2
 vju6pQWR7vqy1VlJucv7WipYMbD2uRI=
X-Proofpoint-GUID: OGjRARuYBl1jXVU-r7V_ow8fjuPFLTht
X-Proofpoint-ORIG-GUID: OGjRARuYBl1jXVU-r7V_ow8fjuPFLTht
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116748-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ravi.hothi@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8295570FBD6

On 7/3/26 9:30 AM, Ravi Hothi wrote:
> Eliza SoC has the same LPASS LPI pin mux functions as Milos but the
> slew rate control is in the same GPIO config register rather than a
> separate register. Add a new variant data struct with updated slew
> offsets and LPI_FLAG_SLEW_RATE_SAME_REG flag, reusing the existing
> pin descriptors and function table from Milos.
> 
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Konrad

