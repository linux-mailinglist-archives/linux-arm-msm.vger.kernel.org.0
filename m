Return-Path: <linux-arm-msm+bounces-112185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zGrYK8EZKGrQ9wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 15:48:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 952B4660B8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 15:48:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SKtC9HCr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RJjb4FOj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112185-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112185-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 99A9F3016777
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 13:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6145429806;
	Tue,  9 Jun 2026 13:48:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA822135AD
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 13:48:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781012922; cv=none; b=aIfDyiwdegn3QIqJaL0T15SRWyiLYs7RjjwSUvvyxaKOpgYg5THIlPo0p2s8FxRxcSbA/5UVsIv3haAbRjRsu2LDbjT8vFFWRDvfEGtkrNHlQxJN9pFvRF+IOFnN8VHaouylKljGd7d/24jlKi7+tXsXIA+4aPPSisppDaHrXZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781012922; c=relaxed/simple;
	bh=QLTukfq8tB6NdhVZj38LzdPBdu9w7A6hXB64MHrlJIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OTQbeJ090woKCWb4wYjuJIy7ZAzN23uhoi3v7R0/I4y40sfQqu1hOM1+Eiph3YkEPBgHgz13y14RWi4wRslCCyYfGWz7g3IUeIgvk5SF9xrB35+koyLByaS6Jsu1wpknqGWmLyXz/vqHBrPy+xf+F5HregjyUW4nCx1ZbIdP+nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SKtC9HCr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RJjb4FOj; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClVUJ2706172
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 13:48:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	evslsdU9NHDAqMtO0VHfpNewdxcF2fUkpvL0SD3UiIA=; b=SKtC9HCrHe5jhBwZ
	hhPoP/3JWA8tEQFsCo/NXGxVcqr4eydavVpBR4p6TmF/p4b+7xIiZlJiOyYJsrDw
	bBTDGWNHWXrZOjFGfmV+O/CMkDZ+330gBPkIJ1WvaT9B+wGZaV/Ghj2qCMWJlupI
	ljKYPGU2eo0ytvIVJgjUw+nEJqABlghz/Y+QLZEw6CDTMLi5KjcOgXRbqrZcCvqC
	kcT85oh2GPVrk9C7n9ZgV3p23mvMyxnh3StmhtXVauA5GpqBMz5waeBLpuT7FDv2
	8wp9WE5G6smUSddkCoMT9qYr8ZnWpKXBE9OIK2+h7KIztrm4MWD2ghW56r5q51Uh
	F2M/ng==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epfdt1cjv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 13:48:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51759082206so16622551cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 06:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781012918; x=1781617718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=evslsdU9NHDAqMtO0VHfpNewdxcF2fUkpvL0SD3UiIA=;
        b=RJjb4FOj7RbGJc7pYtKynhftZmBpBJ4clqw7ws0soLE3iZ1xtOeBh7RxLA+l/F1Ui5
         BMiOvo3joYry0oIG50yu8Moz+L7cpNSwQEAGnAMM0TjvJq5cJNAarXv96MpwAD5mb1w2
         Gshgu1iorhsW037My1WgXiGjiSu1OFQV+RrRLQgfBflvaD/5+YLiolLIpISkNEr0V6fg
         WIiqktWlzYp6ec31xwD27W5n9fzlHhye5zPa2AnhhCItj9Z9qrh9lZoxt8oUXlCdToTi
         sR8Tn6ewoqyM1oZXx8LOF7/E+F8Cdwb1dmAfe9/fo8C0/9qCFB1Gq2hqt/A0sk0I2lHR
         4HMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781012918; x=1781617718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=evslsdU9NHDAqMtO0VHfpNewdxcF2fUkpvL0SD3UiIA=;
        b=nXYCoBR+FxuxzRamLEdqJxT9sSk0IcCRp/ORluWR3DadqigvT3BvzJBHdusjco9Bdw
         PB/3FS1udpW3psPsDDIEkWLzxUhXOrwTF61rLWqNQoXTtsAOddC3Vl2pU7XM56H6qUIH
         thoxf7Wuo6xs3ks0pFIFxHfeYZO28BqFlUBiLF6AC458dy4gC/LLIygZrHUADv6OnMFO
         SO/FdwmXx70V//2CB26k3t9Vcunvr7cuOHyV7P6FBSB9m2CxqBML93kBny98eYmemE8v
         2uXaci4rcN0jf83fdIhh3PG5aq4AGooCKpqfAwcRcoUdN/xAZPq02TMoeK5exUbmIQ9y
         JFVA==
X-Gm-Message-State: AOJu0Yyu3FXISUc4vVNeynnqfxh/I/MO2Vivt9N+3XaCvNKQW9EkN372
	EgkizQEG+rlKPcC5qhw6KMerAjxadkcT2Btc/Hc6i2AJmIT6DEEStqsNHrQY3/9Q33fwt7RDdvE
	RrOsgCUFNThLdSkoDJdEGVOmd31cGAkwNH6sDhbgI28/OlvdsglCBzWH1Rt1ckdAzNeLu
X-Gm-Gg: Acq92OE5ftbI5kzZB0pzYZnRbTQbkOI7lppPjWDoxIRT+hDU8sj8VpNaZAj3b4wF5e/
	F/HYMKViYU7dVaDfoancCnAZiw/kk4nxCJLxAt821cqxngducVDF+N9HaqDvisxULuTMA9sO8RI
	qMG8grQk+2scMwtgd5Ue2PYb0Zm5F6K+sCuRRUlJdgs3TvLlqKCtXSfz1oECMuSD24bI0d2BrjO
	g8Ip0+pMTygvKKReYPx8nKjNyTWx7Pml4Kq4ch26aj5zdRfcbi5wQ3i8tFcG3QyxvJlQTkdsbOS
	/t7La/V+dGIk+dUsNVsyut5CXTot9lpCcpOyQYW+pET2Oxso2TB8SvCEFJMKNNHLW9cig2ZNaQn
	1pql1QNTc37EFLghCFMLHggg4P34YHKeTgTufaGM6JCGYnTzSydymLmfa
X-Received: by 2002:a05:622a:4c06:b0:517:5af6:77f9 with SMTP id d75a77b69052e-51795b3af28mr176324011cf.3.1781012917977;
        Tue, 09 Jun 2026 06:48:37 -0700 (PDT)
X-Received: by 2002:a05:622a:4c06:b0:517:5af6:77f9 with SMTP id d75a77b69052e-51795b3af28mr176323611cf.3.1781012917342;
        Tue, 09 Jun 2026 06:48:37 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf05176fd07sm1058537566b.1.2026.06.09.06.48.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:48:36 -0700 (PDT)
Message-ID: <b7c5441c-de69-4a1b-9121-3d15bc24612e@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:48:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] regulator: qcom-refgen: add support for the IPQ9650
 SoC
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260602-ipq9650_refgen-v1-0-55e2afa5ff64@oss.qualcomm.com>
 <20260602-ipq9650_refgen-v1-2-55e2afa5ff64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260602-ipq9650_refgen-v1-2-55e2afa5ff64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ge6TIHhLsGSmwl6eX6FcwpXtSuO2uvnC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEzMSBTYWx0ZWRfX5vraowO8yo+L
 eQI1TlJisXNCrEvFX3ST7ETpU0CgL4cffIMxJ0JNJWSVGO+btx7olMDf0bRhCqmfsNv99GTomFm
 +GMIKhBSbumixEwxQD7sXhm+uMyFNLAdKnc5/tYI0/3N+SaezpUHhF209kW4ZukvFKgtX/QLQYc
 DENkEMcxP0sj+hP4wDA3p655VXXT/xGlzZ1FvvO9yfReaDy27y/7/HkcEFZHflOPBvIJe9n39vE
 nDAueecurCP2dNRZ+1wMM/zZAmUukvyNHnt9F5y9QLW78QIlKqZ6hTRxx1eRh1JN2ApETXIG2JG
 1YkVXVoZby93HH2o6GRk9jdIraIqRq0WMhgWOKF1LR0rfSnrek0+hx+2D95D+HWTNnt5s5B7XgK
 AKKSUYs1rox742wTWmTHfrObmfGceKb1E5k7xJ0eHp0cjck1oWjDgH4vDsQi3id66XVnt2Eek4r
 IhMzPLRn43CROFRAftQ==
X-Proofpoint-GUID: ge6TIHhLsGSmwl6eX6FcwpXtSuO2uvnC
X-Authority-Analysis: v=2.4 cv=doTrzVg4 c=1 sm=1 tr=0 ts=6a2819b6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=yEnem_Jrty2UgpzKiIgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112185-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:kathiravan.thirumoorthy@oss.qualcomm.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 952B4660B8E

On 6/2/26 11:22 AM, Kathiravan Thirumoorthy wrote:
> IPQ9650 SoC has 2 REFGEN blocks providing the reference current to the
> PCIe and USB, UNIPHY PHYs. For the other SoCs, clocks for this block is
> enabled on power up but that's not the case for IPQ9650 and we have to
> enable those clocks explicitly to bring up the PHYs properly.
> 
> As per the design team, REFGEN block provides the reference current.
> Hence marked the regulator type as REGULATOR_CURRENT.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

I'm slightly confused. Is there no register programming needed?
Can we at least retrieve the running state in .is_enabled() by reading
some value?

Konrad

