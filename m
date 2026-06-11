Return-Path: <linux-arm-msm+bounces-112671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aJ0rE6Z8KmqQqwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:15:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A05DB6704EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:15:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WtMIXxt+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KyuAGIrY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112671-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112671-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E604E3254E06
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF12285CB9;
	Thu, 11 Jun 2026 09:10:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832C1351C06
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:10:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169058; cv=none; b=MRkdh/rgP7aEMXYO4+eiEgVnGol757lAabf5mxPKHIOxvoPwY3eHE604lAfU+TXS7Oi5H6m08A5ufL2RGYfqsEzHBmd1RTC+Soa3shmJAxDvQncrvE+SmqwSHUdA4JKE3GD04ktKRutO/5dsJI4O7gA5dlvR2IH9Cr/gY699qcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169058; c=relaxed/simple;
	bh=8m+5CG+b+WzYz8jVeXydTQJ4q8uUlvtHDf9bNzjklvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hkyCU+4h4a9AW4//rJgTfbxhRGlLAmaQfYGAXhpcOLdStCqn/sX1AQ7BWSz0S+RVgO5Rl9szH4atadAFhi/zRXMbyZD7FsCekh+jrFUuzV/Yi6B9iZmOJ/W1OYLDQPDsGHWcZSlmeVMF1Lcdmf+hPZneI5reejgR+I+o/JwOOtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WtMIXxt+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KyuAGIrY; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GfvS3712951
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SWDsntKAlbRqYQFJ9sixUy5ufYt7jtVIUopuYaPGvWA=; b=WtMIXxt+KVKYeuBx
	IwH/e9wuNi8f86Mk/3Ci6KG9gc/s2GV/WIMwMzMODlt6ZbHSd++JA7UL9THIan7H
	z9PKbCn1ysEorvYQbSI0ecyC0IjslICvDg95GIXB9JG9IuEzaBsfHS4+c3KNUgUF
	vMoO3zbgA0xfluKYTVphRU223hib41aVWo7PZgE9yjmTOYZIxgrOVzFWI6fJlO9p
	LRYUNZssvmMFSgsc9aPoadFMwqQ07vv6/1idryGZpZ8LxxNzqEFAkL2Qw4/X8OGw
	J7n0MqRHoDmUhyEENQwBxVt2V4BrP4b4ab4cR6VtC2CserEuZoMaaA9KkzWBDph9
	wwmzdw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6uamvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:10:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915ccc2d4d2so110968985a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 02:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781169055; x=1781773855; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SWDsntKAlbRqYQFJ9sixUy5ufYt7jtVIUopuYaPGvWA=;
        b=KyuAGIrYPq5ENcVb373Zte5M2diQGkpT0vW9jQ/QwCotNBq9649ZjhNKlUGgiSAibL
         gKnZgiFZdGqLp0fhXQbekQpEQFcaURDMuImrnhZcEHE2e19eFXHMpd9HXf53lJAjyCUc
         YC3kIMyAj30EnNlCqJg53lmVQvuznsxX7qQAPVgPS1Kh29ZqFDq81zxyiY05abDKyhlq
         cxaPrS8w2jsgRDDwnL31bO+ryaIvj/Kh4Di0lw9xA6k3SxDjydKqZGaYIuFyC0DDQa5M
         vZiH6QlMi2MPl7zA2q1xqCZGRaFfO0m3GZSPPCcXrtQqGaCV8b/DcJBRVFs0kr9/NWzm
         JJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781169055; x=1781773855;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SWDsntKAlbRqYQFJ9sixUy5ufYt7jtVIUopuYaPGvWA=;
        b=ITcZ7NNDpSIKaNJiXEZl0Wvbd+fZn7VedVeVjRIA+DpkvIsjiBW+tizry/K9HoklqW
         TmUk0UjAGti1HSXZVqYx+JUAwzN+0PXeWt6316TeP/V4kWfNY6M1JTgipnfHnLVUbVdY
         A3NIeZvFLD5bBzkEoAOP+nXqd5AzAAo4X9e2LMgTzZYw2asoXfhFxfogeD+Q2jzqZg5h
         ct16XuD1ECMX5jiMpkPPIDNk1cJZytOy01rgzdOWBV8EvUjdymPPX3NNx3T38D20iAbo
         u93/kRmJoDUuhDQ3iB1hpYb6cxMIHZk8dD8H42mqUd4zBvonTqKBgmEhc5ZsA1a+eeGV
         ZAHQ==
X-Forwarded-Encrypted: i=1; AFNElJ8E4b51FS6tyouzMPB53rEXvCdx95w6LBUk/n01YiUwNN9xGGmmbSIp6Z70OxaDOOnw1z3Z5MN5EVw4pQzx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5DKG48o++U3Vbdbk5N7BZ/uB6OU4bGrwuBIt3KOhYZ9K/rv1Y
	Iqq0eeOi8POOrTrWfDiC4snn2CETToJbn0TlJfR23N0hKoAd95srpXHhgPmGhL059gO82rnDX4P
	kqXzy1svnLYShGyVawq8eHXay19Wy6eQcUqBDFgtQrgprrSWhI1g/yM2tnO3nB032sZ2L
X-Gm-Gg: Acq92OEV6VrNJtl6fEXnpFu2QGyBbtOldRnzr6f8ASxtkodSL/B2gKS7Z3lJ14TIGfj
	DvaQKlken7FVa4FY/BU85gARZobYTI0PHe43FGq7lMEphu23wwD1TuBj28e4N/46RZO8BFHrcuX
	nnY3qd/aNExsPZjZQ/H+NSgOqGBFAfZEYgE7f0+0gFibxWb0T34EqU4VqpUi1QrgCCBd+jaLvP3
	gwJ9v3uNHu2bWufDwIP+t1s8Da1bDov3O25I+EvxoyNH3LA3p5SJN4TOwKbEe/tLfpbnt5m2nsU
	pN3BvnuGKrcZR3gPCssVsOY/1frZJxGyvTzpAH+5Ay2vRZaSWgqq9qE9TIDTTIDM4RCyXaKQetH
	jkOMbf73XugR3wvXAK4dRX3XnpNRnbxbzZrvATOmUzZ8YlcaAdDpk/Vrg
X-Received: by 2002:a05:620a:4553:b0:8f1:9e59:2208 with SMTP id af79cd13be357-9160acc6f24mr149935085a.4.1781169054945;
        Thu, 11 Jun 2026 02:10:54 -0700 (PDT)
X-Received: by 2002:a05:620a:4553:b0:8f1:9e59:2208 with SMTP id af79cd13be357-9160acc6f24mr149931985a.4.1781169054368;
        Thu, 11 Jun 2026 02:10:54 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb668ddb4sm37364666b.57.2026.06.11.02.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 02:10:53 -0700 (PDT)
Message-ID: <61fea0fa-d7af-47f4-a3c7-21d881090008@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 11:10:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add BAM-DMUX support
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, chris.lew@oss.qualcomm.com
References: <20260611-qcom-shikra-dts-bam-dmux-v1-1-43d0b43d41ef@oss.qualcomm.com>
 <aip3_fyE8tMtJZIW@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aip3_fyE8tMtJZIW@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA5MCBTYWx0ZWRfX8gE0EsmwvvVv
 50MwndrMr+D5fJmYaMEKP5d01B7vbiPWb86/A9lGEwXWHP6RWymmLkilKwife6emGdCQjh4U+/X
 kyNOM8ZNmffIinN8gclNrs4dbir6E+s=
X-Authority-Analysis: v=2.4 cv=atOCzyZV c=1 sm=1 tr=0 ts=6a2a7b9f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=PsAYBRyc5tNDhGAdKQEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA5MCBTYWx0ZWRfX+aDGmkc1VEDW
 CuP4/N5+O2VALyJ6rwU9bvXQwpwCRXTRJYbE6tRphyNYtBuyVqZ2rZpodfcAMBPTabw2hQEWDgc
 iyvgfYkA4IPvCIOkvsL+n8YVZd9ofZSruRXJf+9obbtWjhdsVq6ZVwzijdwOU2p5IehUkQ/06KZ
 ytA2RrSTJk3shDq/azYyEWTLFPTv0Ns9HIwDvH7FynCSx/Ih7v2QR6GADSEkq202n930nr4Y33h
 +N2UyLTsmkfBmCz0pcjNzIbJH5UWIE4JCX8qfATzLihXYiu/S/Ltf/j3rmcetNm1twrOdDuR/lz
 Wkb522/NbsK4o5eLPI53g/meEPcoeTFTXTiY1QTDzrgloiPE3V++/Nqu3xsiWTYIwQcO3roO5gf
 2aowijFxYNSnu1R1fm8AMObi4u73YgefoA7Nbq2vQEZYMvgPnwQZDbMs9brvIuwDe298mBynJNh
 xis2HBLbKzXoXQvFCTw==
X-Proofpoint-GUID: _ZgnJJhPvaKyupexo4x5ojYHX180v-7A
X-Proofpoint-ORIG-GUID: _ZgnJJhPvaKyupexo4x5ojYHX180v-7A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112671-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:vishnu.santhosh@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:chris.lew@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: A05DB6704EE

On 6/11/26 10:55 AM, Stephan Gerhold wrote:
> On Thu, Jun 11, 2026 at 02:11:59PM +0530, Vishnu Santhosh wrote:
>> Add required nodes to enable the upstream BAM-DMUX WWAN driver on
>> Qualcomm Shikra SoC.
>>
>> The SMSM (Shared Memory State Machine) node provides the power
>> control signaling between the AP and modem for BAM-DMUX. The
>> BAM DMA controller node describes the A2 modem BAM hardware as a
>> standard DMA controller. The BAM-DMUX node references the DMA
>> channels and the pc/pc-ack interrupt lines from the modem SMSM
>> entry for power control signaling.
>>
>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> 
> I'm quite surprised to see this 15+ years(?) old hardware block being
> brought back to a new SoC. Is Shikra not using IPA?

That's correct.

Konrad

