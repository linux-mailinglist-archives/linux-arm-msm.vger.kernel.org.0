Return-Path: <linux-arm-msm+bounces-112095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 44B1BCXjJ2pJ4AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:55:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CED365E978
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:55:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WagcQjIx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="W/7QGWBE";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112095-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112095-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EE0F305A882
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F113DFC8C;
	Tue,  9 Jun 2026 09:43:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACCB3DFC7F
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:43:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780998207; cv=none; b=cUn1Kmef0hcDqr+lr5KYioszc7ksIVS9aquqGOlOZimY6R7DUxECjuN9QeRa/lLI18cp3eTs+URx4jTIgmUepDuN5mWfNvgXUVaefs3Mb1mFG7WFZHMm52KaEmd1+dbRhvhniiksn3zIfOWLgvcR60khbHTuA6aHdKJfc+M7w5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780998207; c=relaxed/simple;
	bh=TvfIy379vvosIbtFVABd6KZoCjWl1ycLVvMkhEHVkXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cFq0Oz4UCVcI6g54T/MyC42tTBOlNUeF8oBnicbYnvbo5VF4N93Ht4joKt0g6tngSpCzq39a7clzp4OeEhAms36QCNcD/TfV60sr73ld54upmsp+ClvQrg9Aj/0ErKtH6Zp59ooGRc7YqAEVuHAR/K+c87dEgWJpIEAWsoumCCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WagcQjIx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W/7QGWBE; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599JkkI2223133
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:43:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rUl8Sy5GMTXVRM2Bgsp87utS1pWmPxlAyMGccJDOZ5w=; b=WagcQjIx0QvVxsyu
	f0Y3jnVqGW0Qa0D8NdNr0HTk77L1e0cjAlNx9i4to7lq6VSddeA4P2lACS8SzVc+
	Y0W9oEFwoLjk965Gquwj3y2zcMIiSK2GIn/RR0Gx0rCdrXtt4S+pZkUDOPa19lin
	KpOGuBQ+yFoXZq34SLBz9gMb8QvntiuuIEOQxJuRsHWgD2PoKnzpRMgFHMUkL+10
	iJKjc5oNRyx1UDEHT0Ii6hp4ESmbZa7mUymk24wB2+0Gu6xKd6NcgnbcOq89iVrR
	A4mrH4uL62npxOG9onJRoDPGAFLcR9qVq4/8B5Kcp2Fsl/9g07SnO+wYGpdqbas4
	qxH+eg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3v033t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:43:23 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8428384f31fso3748394b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780998203; x=1781603003; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rUl8Sy5GMTXVRM2Bgsp87utS1pWmPxlAyMGccJDOZ5w=;
        b=W/7QGWBEfD/JBEPhIrcFl0bPMlumwZqi3QKTwt1K4dGjYTtBvNrUXnILqv/WeuTO5X
         w+8INYeBjhryYYm81jVsgxAFTo7L+4aIBgooMpbCgHGGKbUvgEztQrYeqwLKTPpXUs/9
         Fok/2kk5N3INCyTWlHyLye4oOf8qOgzy6+ZvTsfbN7GZmPBFFxbY/lWdP8lye2ek78y6
         gEkpIMhMgdrsYji9Bx5uADxCM4mw3kMEtQc+y0Cc1TtLWtvxFxkm+vPSdm4nIYgqGAdQ
         ubX6dnIOqn90CVbIb8+1Oq5l2PYzhAooIw7YnQVUY5T2Qk6WM6WAG1moWaNdWLmKtsb7
         BSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998203; x=1781603003;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUl8Sy5GMTXVRM2Bgsp87utS1pWmPxlAyMGccJDOZ5w=;
        b=Z9Ye2XdR6762ocVpyK8u1uX+aCmqDVunxKsWUItHdSs5jfnvd5/wakfw7qgjKMKMOL
         KJIIUUxeA3CIQg4b/HKfW2TSQP2ekuBRnEhth5I02ng3OMiiLz+UDq1l+uzPDfefqac1
         l7/GbkVQ1ltEyAEDpO1+cdrw//6aWRcUVessZivOnPhYkxtpT9mndRe60lgcJqfzQJqo
         ix0CQbWCTOVynxShH6lcU5aace+uYnT29wGAVXmSZkDZCM3Ok+VXLqG3urKtVEw2hUnx
         Ex0iAm/to4aIwGc9DZz1aE7sKl5yP1Hx4d3Rysh4rBKW5zOWJv3oPyQkAuN09EPRCN0R
         SVIw==
X-Forwarded-Encrypted: i=1; AFNElJ9geSNR0VfwvtKFjzrK2qYoq3tEiO4ILtqDzKu0x8GDOrtk17jJEQO/q8lEo6falobsFTIXU+vCgmjE7llZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa+cDtwFpSLTDORWHftI+T1LfRbWloXEaclLOkwpahR5c6uyJm
	TsBVqZBUoXunveQHUJn5TLDNHBvqQ28q9mYdKC+11J11qzeslF/EFr860D+/ZeTDN0xVjKFU7k9
	fDit6YR32DZ/jMC5Co2xtVy5dxct8LgSMLacSoD4jO1VTPUVEGcVWYuDGAq9XQUn3a7Ld
X-Gm-Gg: Acq92OHA4o/6Ja1Gv7QEv7a2cww1FtLVv70MXxTi8BqNu9wOHfbDqVmLZqhd1SG0cyF
	svBIacD8tn1UMTI653cYO2gKuyKL45i/eGTk44XvtS41miFRXjzqR3PZRbBTpk04+8Y/U0NfyHM
	qiRvyFlx9bGdVyqaxBACHMAUdMmaubCXuCwhgHCgK4BqmnCY737OXkmOzfzaMyo9s2qL0XtTTrW
	Urzk59VPLWt9Mbtxcpu98Vojh7ZfFTY1tegK92Sy05rwq7cjusAWTeQ3P8pKZXEPeAzbSptzh2o
	rtC1MyKZTDnRcRqKyaLaEhYWYY1k67LVGfWKJ9XByT/G1g1k2IjafbiDLIH3MJlaSbYNnwc/4mL
	OrPJZeH+8WnNdqemV66KeS4PkZUkG+wcGHtGgOgEi8jMo6trPKFc2mq7j7isBqyvz0hlilJz6xQ
	3B
X-Received: by 2002:a05:6a00:2d07:b0:842:4bf8:cfdb with SMTP id d2e1a72fcca58-842b0f83825mr20435906b3a.32.1780998202853;
        Tue, 09 Jun 2026 02:43:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d07:b0:842:4bf8:cfdb with SMTP id d2e1a72fcca58-842b0f83825mr20435867b3a.32.1780998202391;
        Tue, 09 Jun 2026 02:43:22 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282374300sm24783245b3a.20.2026.06.09.02.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 02:43:21 -0700 (PDT)
Message-ID: <585db96d-0c65-46ac-93b3-67107a6159e1@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:13:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: PCI: qcom,pcie-ipq9574: Add IPQ9650
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260602-ipq9650_pcie_binding-v1-1-486a535da8c5@oss.qualcomm.com>
 <20260608-wonderful-controversial-toucan-daab4f@quoll>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260608-wonderful-controversial-toucan-daab4f@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=St6gLvO0 c=1 sm=1 tr=0 ts=6a27e03b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=4EjJ1Zh6womSNn8TGqsA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: uv9286jEajHLiPgnqTm-AQNc-8-PBch2
X-Proofpoint-GUID: uv9286jEajHLiPgnqTm-AQNc-8-PBch2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5MCBTYWx0ZWRfX8n0kxsYInkpO
 gQPpg8cKUcO0BC561sMECOPOglMxMeSA7srbQ9gc9Xwn+9FXiSeFclXrcgD5Zvkdpn6x9OfSpaA
 OULCXwKY1JshaiiVzibZRPUWRKOrF1EYncZz8HOcqcwMDQj/YBNMAXvIVSuEH3cyoFpZgRWEoR4
 eQpM2bEbOo/lQpklIhQ8Ovwhn2i9b2dr8YF3d6MTIDIMYKKx4VPPaoegr/u+YxXKWoxhHsBV5gC
 VeD+w1bvBR9jtspdXXHd94yAVvUuvGsuLS1jNU5I6W8MN+gQ5l1FKnDbhBRtp+Ru3FfIlBoH7dp
 gScD6V8ck6H6+OjZOL8+wNnDhuGfwf4iVaXCeXdoUAQ1qQ5KYSL9q0n18V+sx0A+YkFgWuqN1Fn
 UdXe/R/GvBVELtf3TGWiR6g5c2L5bQk8BYq59kqCerVwHyj5L0mw/yH6PFMY0xlFYd2Ehnh+gCo
 8b3UIrdgiAmwcmkZU5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112095-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9CED365E978


On 6/8/2026 3:48 PM, Krzysztof Kozlowski wrote:
> On Tue, Jun 02, 2026 at 03:06:18PM +0530, Kathiravan Thirumoorthy wrote:
>> Add the IPQ9650 PCIe compatible to the IPQ9574 binding, as the IPQ9650
>> controller is compatible with IPQ9574 and uses it as the fallback.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml | 1 +
>>   1 file changed, 1 insertion(+)
> Any reason why global interrupt is optional? Older devices were
> incomplete, but new ones should come fully described.

Sure. Let me add constraints for the same.

>
> Best regards,
> Krzysztof
>

