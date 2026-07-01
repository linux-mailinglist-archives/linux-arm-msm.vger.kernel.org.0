Return-Path: <linux-arm-msm+bounces-115642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9k/6G5HtRGpv3QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:36:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 545B06EC325
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:36:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=P3KY1ZzW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=X7hh7D88;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115642-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115642-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C1F60300DEC8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 10:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44EDE421A00;
	Wed,  1 Jul 2026 10:35:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A93B41C30F
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 10:35:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902157; cv=none; b=Wt5Jobc3xRLYNaQJR+6L1wGx/hUf9mnPgiIWrqrMn5V/p1Nhs/vmGF7RPSPlHMtwimiA8yPx22JH2nV/FIfxQ690XSPeu5MiuDhY9u0slOQIvVlXglTTjpo6SI6QUc+pefIAx9j9feKhwhyNJ4UnYTP7W+J3JYmgR9srilEdMrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902157; c=relaxed/simple;
	bh=ibzGN0UnickCjHY9cF2/FSKFRK1vfLPRIBwk5Vf6y7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PLTDb/DpIXZmJNCfoc3+T5L5yqSriUzlgJ04lMkuepL33BxCjESbwMmqoL9jQgdrtzlf5fy/+7OhGQrxPbC7t2ZBq7kbDk4tZda0ETL4OFDVBI20W/zQGsdo8X+RuRoir+Kx2/RPjddq5Ct6imwdYbcJP3AjzCn30NFDRsWfBXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P3KY1ZzW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X7hh7D88; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A9hmQ723400
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 10:35:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sp1BW3QUmZcO7rug2uWKHnR0pXWl/4bf/P7UglPwEP4=; b=P3KY1ZzWVReNOhM/
	D6Ye3yqrlxmRkrCYf9SpQ7JO2ZvZR6oI023xwSHtmDaoMdPXlmlrFc/CxspbyGvj
	4gXnqgr0ul3Nru+fOHlI4Lj2jpZIRihUTMKD8jydjfhLLFgnQE4+9fCGk8nmvqDa
	7twj80oGQT72H+bAE3r2nV6HURaY5PzV3ggji37VrRWzEjGtuUILVKYUcanXlb3o
	DvRL8gbW/kMuNseiaKXelCW6j5yUvVpIG5q2HbQzQHWv2iJOmG89l9ClKA5AqZZ8
	LbkxutJaq92h/6dGQx17Uks/kR+hQqS9trB/kcn52rovEUw1whSpJ2+68otN+t9s
	/+lGgw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jvwbjkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 10:35:53 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f3951a6d76so1043766d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 03:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902152; x=1783506952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sp1BW3QUmZcO7rug2uWKHnR0pXWl/4bf/P7UglPwEP4=;
        b=X7hh7D88z1UNKL/7TV9QYDfRWvPCT1o7q6hfBtMXR7JpqbAZaWS83j7sitxYqSbKlH
         YGNPW8I8qdxh+o5uAi1nJma5WRSAMVHGQHA+vItDt/npi0aMFdTPYR1/axA38ROpEmnb
         Vu8JbVpIdIFomuTivPF4likoLZMEJOqdsNweWI1YapyKHvsXRkE6U+t8jwdVz31F5kBW
         1YSrNN6PO6eve5TvjRKppEitT/JIh6fNbhZnhTQxbgVBzJpx4AYi2d87G2Z/tyV6t3Nc
         gjVsTyvC/2Q1jF02l88349Wi0DOGAf9MrUg0GAUgJ2mdp7r7mFXUCSVxQ4pyBL56HHg0
         zjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902152; x=1783506952;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sp1BW3QUmZcO7rug2uWKHnR0pXWl/4bf/P7UglPwEP4=;
        b=fwVwcMBosEA+HX42yQ/qGXRsGhGrD639ifQhTjaxsSzuEYmWwYtVSPIG8now3hcDCS
         9KT5VW57xBK/GV3lCZBTtsDdAHlmD+bRz3Zy4uWTvDZKKScLXFZQCHEmfWSb8GqiptQD
         j2B6pvIZpS6naEt80RXH9sQirJVtsUaz9CfcnipxlHqRer1haZus6Q8Xav8/9yixMAVX
         TjYWkwFTwjCeK1GY2u3EuijkAWCVR1Nrx4ZSt+cwdypE/aoHzWFKut9rJ70ek1xdhl2U
         30vKKFfTs16gpbwHo4ERMmI+AFw55NUoiW2hQy3S8cJZSM7oPQ8OdI2ZgLj5Ox6sQ6d0
         Y4dA==
X-Gm-Message-State: AOJu0YzGOZetjvbscWueaOZZBtI6YlXEb3p8Ko9YplBSSq6iLdv7w0Dq
	7aGX7Ydk9dnGl/Qp3nAotJ0ap74CkGl5aDoMxj8tCiJTc05Qvjma5IuZoaKXATgPsF3bQ2eRuhy
	hPF/8VFKlV4a45zbGt5ry8NiINVWNuCMos++6vEsj2saA05F3n64+YofHRTweAMGPCBag
X-Gm-Gg: AfdE7cnFh1A0eR2R0KG/6DCkohxPemwwiOXBCPtOaOMqyKfUp+mpnUhlPKgkqY/rStm
	od3trpyaXmYs4II2hTYkuC9FuaeObOokKiq930++RnXkq6V6F+daSK70nihGbPF5z7AYwvdmkZ5
	Pb+09LO1kyFh7zvwuTjD2WVVS+A8DlCSdhWjPmaGsAUxCkX7NGCeI6nSHIVyMiLK4EP2Xvs+4rj
	QjU5jLQcy3cM2encDRH3olenIDboULHKi3Ii6Haf7F4RADGHRkcNLxfPaT+YdwkAA9lgeyHWlkK
	rOecBZN2ExgE0khK7pIUYlX81XA8sGyb9+J9hDrj+4xMh4EKLSKhQJXu3ToBMBScPbPHby/hKKN
	w2c36TYBOBR7OGZLabhqHPm9W9vBn1CDiInY=
X-Received: by 2002:a05:620a:4587:b0:920:798b:e290 with SMTP id af79cd13be357-92e7851d0ebmr89817685a.7.1782902152585;
        Wed, 01 Jul 2026 03:35:52 -0700 (PDT)
X-Received: by 2002:a05:620a:4587:b0:920:798b:e290 with SMTP id af79cd13be357-92e7851d0ebmr89814285a.7.1782902152181;
        Wed, 01 Jul 2026 03:35:52 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1289176eb0sm255472666b.63.2026.07.01.03.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 03:35:51 -0700 (PDT)
Message-ID: <2efcd4b6-0a99-4bb2-b428-4cb4805c20d1@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 12:35:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] arm64: dts: qcom: shikra-evk: Add TC9563 PCIe switch
 node for PCIe
To: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
 <20260701-shikra-upstream-v1-8-e1a721eb8943@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260701-shikra-upstream-v1-8-e1a721eb8943@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1K08ra1sdp2XmDp8jE8JNM5x2xd-M6-h
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfX6pfldlLnYmbP
 AgPErh7VotIHvnmmhz6z4krVt7uvnVtF3CSiCrcd+YOykEgXE37XOJadOHOyv+CmCKORLfRBV8V
 nbtmE4n54dYEvoGDsmcOPOO7qwzpMvU=
X-Authority-Analysis: v=2.4 cv=JKgLdcKb c=1 sm=1 tr=0 ts=6a44ed89 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=qSWERiRezZrDuvaUYp0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 1K08ra1sdp2XmDp8jE8JNM5x2xd-M6-h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfXy7q0ri0+Q7Ev
 UsJIC9YNns9DfgdoHZIVCXo3bXjQxWpClaxszNzi9hgqUBqFyCTT9biv50mLdfh26K5F+s2t0zD
 PC2EbhgVadnp22q6LhRgkn0Uo5x9oYc475coI98Tj+Xsi3z1qq9aVx6vqa1vIiSUb19y79ctT27
 /ETXdlYCyVxY/E3k9zgsE8DPWWfcSG3xigOVhx2CBIT3zX4OxjvWN6vz0Q2BigWsN3cB84kQ+/2
 MdxgrPnvdA8bMD45QVFJ3p/BsVMcFNqhL+zvXnFC8VaDz0el+cI68x5oZuO3z/RDZluUqPf60IC
 GyOIprhL+wyPRgLS8ONowyubto3z38yaOpQbwN/SSOrEAYcNYJc4nqZjcj6FrGiQhtxQU7xyJGq
 YjqzP4XBF85AUEO2MoORQusfNO1Hcfda0Wkf2Fh8jjDKk/gN/veWjosTMxTotPR3ZolYJI2rsnM
 N1W80/ayviDfCoA4OkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010110
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
	TAGGED_FROM(0.00)[bounces-115642-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:sushrut.trivedi@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:andersson@kernel.org,m:krishna.chundru@oss.qualcomm.com,m:brgl@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 545B06EC325

On 6/30/26 9:02 PM, Sushrut Shree Trivedi wrote:
> Add a node for the TC9563 PCIe switch connected to PCIe. The switch
> has three downstream ports.Two embedded Ethernet devices are present
> on one of the downstream ports. All the ports present in the
> node represent the downstream ports and embedded endpoints.
> 
> Power to the TC9563 is supplied through two LDO regulators, which
> are on by default and are added as fixed regulators. TC9563 can be
> configured through I2C.
> 
> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
> ---

[...]

> +&pcie {
> +	wake-gpios = <&tlmm 119 GPIO_ACTIVE_LOW>;

This property belongs to the port node

Please also mention in the commit message the reason for the
PERST# pin remaining undescribed

Konrad

