Return-Path: <linux-arm-msm+bounces-113379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FEikOMAtMWp9dQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:04:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4176568E9DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:04:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=meewnPli;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SWijp4di;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113379-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113379-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F51931B727C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 10:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38EC5439010;
	Tue, 16 Jun 2026 10:58:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00E7438FFE
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:58:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781607525; cv=none; b=NQPnnvp00z2i0ddAdJusv32PXuD0S030BieVCqkoH3P6Ol6gdGp9eU7eHymK0AbeVvprWNdqlm6OKuJ1DIlMtcIny+u9PcoTytE6z4RlnpgA/peGZ1N85AV9mXxs+zJmLf4mfRPMefDxJZnJDR7Ho3yLgI1A84hwv0Cod/QTDow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781607525; c=relaxed/simple;
	bh=nugoOaKRMf3oQekIT0sln2ma5j1p4Jqh1igav76elVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nv+geOaXz1nw108+/geWjTHL+CaeXNeNYvyVJFrVMktrAzQR0/Hfw7p//ZIxcjMWC9uDXA6JyuDE1ta+YIWNKNSak7bzoTCZIEqeZc5sG5W+GTdVmM9AiSYEfWt9+GxR0a+jFpuR2j+3CJLgbVc176J7FeE7NjZQ5to9giwRxC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=meewnPli; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SWijp4di; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GAC4X03257104
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jfRLqZaclhFZbXOO8KCGC2IAxQG+WoSSMc2gbRu+h0c=; b=meewnPlixwAao2d2
	y0l1ye7Dgu8I1Bmw5BPsGn4F3vjyXNcc0c5gTaakROO+GTlBvDIVHZgfUMkrV5H3
	d8Sk5hAtIqP3UKqMZVlfBoXhsDHOahtAl9UILfozXYgBpGkMYhOzX5/BfKSmoSjY
	KWQmXlwMR5nim934dIoNnUnuiF7ZTcB+269/p1ybg+1VqWIx3rslh1i64EzdC9uP
	btShQlsxCImJqmkVfrpiszZmjuh8wS7P+icv9q15a4sk5xz/9tcDrjAnIbpOQQdU
	LFLUAJkk9LvY+turIbiDR/XdqtgdPBeywNhIMdT52YnxU+EPAqSrpEnz6Tra0exC
	zt4n7w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09k9au3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:58:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915ccc2d4d2so98136785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 03:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781607522; x=1782212322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jfRLqZaclhFZbXOO8KCGC2IAxQG+WoSSMc2gbRu+h0c=;
        b=SWijp4dieRS6xUqF03kl/OfNENNqQGFBgPxIe/MV5Mptx2f/ojFdJr+lC9H4+VbmwD
         9j/3C8WWfrWSSPrQEV4SFwlWRfJId+GNtIuNiU0hEA9DDQyGjmyqKK0iyPFuVimA0x7B
         0ChQoO+uAmk2MOcuLmRhdrE/4JHsqwd98dhASumy7JSV1Ofrcbv0MN3hqat5FitqmgwJ
         WIs3n94WubADAfVd/s+J/bVwlRJCPLUY5k9to5cCV4hB7Ir6NkB4WZHxIywoVrCUXadH
         dPyfnFJa31pGaRLxF4jisDCGkF/i9Ptw0dN26aT3hCTDpKcsME2kDWY39CE9vhGhTmjz
         We7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607522; x=1782212322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jfRLqZaclhFZbXOO8KCGC2IAxQG+WoSSMc2gbRu+h0c=;
        b=Zvb7Cd2FIxdlCHxhs2NAvhRrWZqsQhA21dxkvljqUrpPOgNBfMc9BPIvCiEAJYV1/d
         +FqDqb5VlTrhS0iKNUYJmcF6nPVKhjsOG4IHGa6sBtGWA1VG1pQfIy2YNOr/aCf2QED9
         rj9dCPfoL6AQEerHNj9EgUXiNYmziu0IvWnGrrdPax4R0Zjbj/DCkbU5dVA2qledphXI
         lj5fn2QQIXk5Fks8INxnVpEpNMnp+zQ0l1odMv+y1RpIhXp/+/RbgTGOD4s0FMpwj97E
         ep25NsmTqKsKhleRRPo9tdrORGf8Z8+jEu8p6dEeysF4/hce4Y0cpp1Su5ZfyonSI2rE
         P0KQ==
X-Forwarded-Encrypted: i=1; AFNElJ9kKSxKUpIhPKZCGcLXqRIzOdRgTYQYHGRt0RNzh+Zz9jgC8Se/XmwkkNk+mBZV/ggA+9Sa2wbJLb8lT74U@vger.kernel.org
X-Gm-Message-State: AOJu0YzPy5tLEJhiWEPqiACxhVvAY6SRlbYcFuRb2sC6a/4VASrFiqiH
	asl3edaPNVddcwmdkFgbzDtJ0rNM1fEY2az9Z009KQGcrIe8dWQNx8Xk10KVlqL5sUS2Sjsr05f
	496TkH/IEUBnJpRNaKECNWfTPxn7R3dNNN44/HS9OdicYu8z4Jzt06/MM8HcOUcy+TOlh
X-Gm-Gg: Acq92OFbvKHES7oHNaU/BzHpqPsGKRAmLwDn2byQFm6bQHwd6n5Ie/59oK5MRyw08PP
	l6PNRlIr+bvSejJpI8Z6ZhZZcdDiw1V1k5yLL5U1v7l/VxLgqGW0plttOzLU8UReDdF2zVfgZl9
	xlD6eSsUr8wIAmwkTaPZFrd0hTNSo0OlcarK/RXFbUUM/GaFJ0tbjE7+bxRJykAvhrMhqSqcz/e
	YjAuKkVCAkO3bPiuYuxzwvj5o/rVPynutXRBN96PXI+kwovJ/dBAjR1B+8YbrotoKjjpe0oa6I3
	0KRdsXZTxvjYE9YnjerHOsozV4xny22qnHJYpxDzTzKr6vvKf9xNZBtM2+NLUDt7veW84mQGdPr
	YmhGc9L9yXL632ZDeeQq8LVr82K4kzS/y232MEdDuH+bKhw==
X-Received: by 2002:a05:620a:7085:b0:8cf:d953:b4ec with SMTP id af79cd13be357-9161bc91d3emr1562468585a.3.1781607522248;
        Tue, 16 Jun 2026 03:58:42 -0700 (PDT)
X-Received: by 2002:a05:620a:7085:b0:8cf:d953:b4ec with SMTP id af79cd13be357-9161bc91d3emr1562465885a.3.1781607521732;
        Tue, 16 Jun 2026 03:58:41 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb44208c9sm640321866b.13.2026.06.16.03.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 03:58:40 -0700 (PDT)
Message-ID: <1ca9b0e9-3eaf-4d1b-bc63-410f4ec7b14e@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 12:58:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND 2/5] arm64: dts: qcom: Add device tree for Nord
 SoC series
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
 <20260526051300.1669201-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526051300.1669201-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDExMSBTYWx0ZWRfX1qTjWbOdtPxG
 StL5hfRog5jpEbrAxwDuiIsrfAga0bfGgbOtPzrvVBawzv1byncWSFvLvddjuuc3PIMSSOx2h/+
 K36a2iNplsntkUADFL+wuxIkORecrnU=
X-Proofpoint-GUID: 4azU96RakXnsROOQ0WnvZn3G06AqANJx
X-Authority-Analysis: v=2.4 cv=DoZmPm/+ c=1 sm=1 tr=0 ts=6a312c62 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=tDYwhEyV-ROJ_5m0-t4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 4azU96RakXnsROOQ0WnvZn3G06AqANJx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDExMSBTYWx0ZWRfX1U4Q7R61LSxN
 e6PDDKwjjg0rEqHH3uInaK2NL/Yxo1O2B4OCkrgJMQT3YAf7BVWkKis1+edEXwgh/A602G+qAXs
 dtqyB0tdQGWJgL3dm3W2xETrp62cIEqwa1qamjB8cyz10Xj8DWwm78qTx1vjCvMmaVGoThuo8S1
 f5NJnjAmLjT40Hh7spDS+12JPY8KdQZA0Sk5uh00XWUyyp7JmOlaERJIKFmUaZOQjnlKneZFWk1
 wFMS3bNvqEbpg18+KiFSz7DRIpGNvi1hOyljqx0sozevoibWSh6ZiK6ZmzbzgbaMklIav26zYvS
 2gW9ifhDDNprytaunz3/AUJIm1RpR0h3H/cJK/e7GuHJunf67VA9qszA0JQITxQ+Yf4AzUphp0v
 JUFaBYBaiPHiBUciRaEuau8ifoQqeMSZ0b7I5PvVcI2ImCMrq9N0r7/B0fZi+a/6oLtzN0RPm6K
 GjRniwN1d4c9SLH8a9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113379-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:shengchao.guo@oss.qualcomm.com,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:deepti.jaggi@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:herbert@gondor.apana.org.au,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4176568E9DB

On 5/26/26 7:12 AM, Shawn Guo wrote:
> Add base device tree include (nord.dtsi) for the Nord SoC series
> describing the core hardware components:
> 
>  - 18 Oryon (qcom,oryon-1-5) cores in three clusters, with PSCI-based
>    power management and CPU/cluster idle states
>  - ARM GICv3 interrupt controller with ITS
>  - TLMM GPIO/pinctrl controller
>  - 8 TSENS thermal sensors with thermal zones
>  - 3 APPS SMMU-500 instances
>  - 3 QUPv3 GENI SE QUP blocks
>  - PDP SCMI channel and mailbox
>  - Watchdog, TRNG and TCSR
>  - Reserved memory, CMD-DB and firmware SCM
>  - PSCI and architected timers
> 
> Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

[...]

> +		pdc: interrupt-controller@b220000 {
> +			compatible = "qcom,nord-pdc",
> +				     "qcom,pdc";
> +			reg = <0x0 0x0b220000 0x0 0x10000>;
> +			qcom,pdc-ranges = <0 745 43>, <67 543 31>,
> +					 <98 609 32>, <130 717 12>,
> +					 <142 251 5>, <147 796 16>;

One triple per line would be neat

Konrad

