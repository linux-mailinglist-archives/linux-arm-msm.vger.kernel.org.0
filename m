Return-Path: <linux-arm-msm+bounces-116143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Mfp8DktAR2pCUwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 06:53:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D22E86FE7FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 06:53:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Wq+tKiU4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HKj7ZRYS;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116143-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116143-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50D7C302A2F0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 04:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11826330652;
	Fri,  3 Jul 2026 04:53:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4538532D7F1
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 04:53:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783054404; cv=none; b=dUgPGqm9XtKmMBHVsXtGANEDox/EOSA/fU7Qjoe4GpnMv2E2+HeBjERFvxxX9l61HildvTEkxENZ3z3uY0/nyRGbwA5TVr1a0WOrsL052XhLgBCl4Jdoc21S25a/uUsAqYM2R5hpwhlLVMnDCQoTgKW3KzpXZQg5YOj+dGbfF+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783054404; c=relaxed/simple;
	bh=NknhmZvh0kvHIBS3PtJIHQtzHj3i8LUsDKPzHhL8/dQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AAjVsLQhGBNgI2t8rDR9vgKXRWeOr8+teeW2NtkZeJBYMvH0mND63HR5SI4H4uc/HsGWda2dC4msMwBtwwHpt3UiGStq73lF9jojJXM+VAkLOpa0Y0nn1TbF1rGxIOQlOKOOy4y2Fs8vtss1D7LiE/c6+PhgWsPcE+b+lK1Sb9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wq+tKiU4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HKj7ZRYS; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342XfO2800949
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 04:53:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8SMAhbfVSKwdD38G3f7xC/eXU4B+FvV86kCi6fke9xM=; b=Wq+tKiU48g3TImZY
	BVsG5SrMsXC0FkeoeAWd+nMsmVUlh9Q4f6sz2ooetk/bhZC4sIXjYhi2sfiQ9tNQ
	IOOb4PjFvr2kKN9Ikp9X63OqkwNnxdLcmCWknABhkOl16yyTmAreN/+yUNSVoTQh
	mVkVHCa2kCJfvPEm4S4xOIX16M1oVpVKKsAdiLRsCOazxuGNOmeyuXly1ow+23wU
	gR7xl8JJLFA4WibAOC9cpumJ3W5At3wHZgIa6eXO2AVv7c5QHL0U38NBzHVRUjTE
	liPvOYMjZwQwfyrUAh+TGaaQAPxJenzGRjHYBv4gg29gwnaunU4Zf3f8X2ROOo60
	UiTIVg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60ey951k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 04:53:14 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-847ac21582cso232807b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 21:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783054393; x=1783659193; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8SMAhbfVSKwdD38G3f7xC/eXU4B+FvV86kCi6fke9xM=;
        b=HKj7ZRYSt7bZS5cOkoc9PpE5U8Pf/11PZTOyMVuVTzJrQ+36T89NTqjh2aFooInbzu
         oIiTmj24V2oB2FwTVFS0eyXDJj5FoZAnyjVRqACSObhj/ThMWMaPXIptRGgmMkTUILnX
         c9zEjxjlUbIuvi/85wOCPMSEM73anYgXcoyz1JEc7QMCVFPlc0d7qRlwnPAPQekzU6bV
         NvfWEYAUuW+pgM/TetQwdJNAmdGScXXv5n4r88JDaa7VhHSH4pgk5FR6gdFlDwxxSQDy
         GLswleobnWvxtoeCOw20J5BQozY0wBcYNzGnd+y+EQsBHm+fjl7l2gldzL/KMetxxeqd
         jTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783054393; x=1783659193;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8SMAhbfVSKwdD38G3f7xC/eXU4B+FvV86kCi6fke9xM=;
        b=msHI1QYAgYtdEljGbBUp2JbOcTM2hjnRzpInnWJ1tBAFARivHuW0iUJ4EakVRHRolF
         aViCWidKxt23t2Pc+O4YFvxrEUuiZ0xbhuiHib76Pyf8rbZtgQEQnXxDyQQRiF9UinlC
         G8+t+qksuacGEco/rfDZ49ZQW5sUtpd9apAVmAu+XtcO1vsC6pvP8S4Kf/wxfxcs2wic
         HT+psd9HWMJCnde/tZQmED+A4QGLi/axkfq6/bvjjiLOdTSywAmc4nwbPt24ny3v7Ckg
         ifBlRfHod54rsp6uLL52eTqyGsAn16tenMEMNN5755tfojLj38qwSDwRdpYw0+lVwZrw
         q09g==
X-Forwarded-Encrypted: i=1; AFNElJ8ZmxHL9Y5+Be4AcDibTpX/3XoOnz3arEQG0ICUHt9kPdprIvqA7QYsBFurfZqCZGPgVvv2fgjFnpVOzLMB@vger.kernel.org
X-Gm-Message-State: AOJu0YyInC0cK5gO7nZfQGbORqj7g4rTF7gFJoLtgh+gXl6CB3nOTwUg
	2bBstbyzaCu8MbWbP21x4eAwryHKQwONHlV7VYFRt82MxQOUjaSYWqqepUgflRuV1L0Aa/U4M2+
	O55XLuDFRFiPMyoRbm2na7vZ2kqYVGaGiXJinkMobb7Xu9hn/W75HjB3LDcLAnIYrHUWH
X-Gm-Gg: AfdE7cnOeCtaNkRukDZVXVh7muyL+tV1ZyMrpEYc25jv5AUC1eEYLJWEZEC7OvU8xXX
	6F4767do68ZWUAsZMFTTkJJX1944LruTCTI6u/g7Kq9/EG8SFA55j7BcCLi4khWaE7GVIDgtZ+J
	AgQaTJUEpOwq/cYOknATNOrhQyUly88roZKWNS+lrgzS1pDicCAVMfkzZazX4X7jgS9/UELmS3V
	mClYb3C/Z7Zlj3TUPDqj3SY1ZWryMs8SgWMr9YBhh3gmpq8ZwrGDQH27R1TyOx2aYXp0eb6S/1r
	nw4/c61LkCWZYFo1X43Ad5t+MyrPzi6w2Ux5q2nT9+DruAf/1Mv+Nk2SDQiThPXMWFnFuDE9QvU
	OpiIchOKmQpJ+7zg9f3g8CuZTb7z+cuxLOmrAPEeaXI0=
X-Received: by 2002:a05:6a21:697:b0:3bf:e94e:e38d with SMTP id adf61e73a8af0-3bfed472a5cmr10107095637.43.1783054393109;
        Thu, 02 Jul 2026 21:53:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:697:b0:3bf:e94e:e38d with SMTP id adf61e73a8af0-3bfed472a5cmr10107058637.43.1783054392522;
        Thu, 02 Jul 2026 21:53:12 -0700 (PDT)
Received: from [10.217.222.146] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb843fasm15565027eec.18.2026.07.02.21.53.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 21:53:11 -0700 (PDT)
Message-ID: <66b34158-56cf-402d-9364-2522dfc45d80@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 10:23:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: shikra: Add ICE, TRNG and QCE nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com>
 <20260521-shikra_crypto_changse-v1-5-0154cc9cc0de@oss.qualcomm.com>
 <enovafjkiuzr4bciu6bu6hh7h56wvnaq5fh7f46m4h7browyrd@7huwa5egaqaq>
 <55039d7e-34df-4f89-8188-fcb45fdea538@oss.qualcomm.com>
 <46005937-c1a9-409b-89cf-4b8f592dc5d1@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <46005937-c1a9-409b-89cf-4b8f592dc5d1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0MyBTYWx0ZWRfX8F9pUcVq4jI7
 3gACwfN2dEHwCXIgaG67wHgjVvzgRF7AcRiSe4L/cUUUgV1mwZqGqnGP4Ipd9EBLGA2zqw4JYeQ
 ndlguAjKT6YBjwqkCFBDXYf+YKWHT3HoAfQ2FLcLzMNs06hxdxcAdUkS0y4V47xFAtWbaB27DqC
 HlVgQQ0wIiGwD2DP/2L4oYNaW67OmuetJMUfkMBHwaIAk9daNz4dSh8a7DfKUs6BDjL9bExg+Pa
 q+QVTrsoVt9vA1K+A1xagfYiu7qTCJvQ5x3kc1BC6iUMoeGjdr2WriOl47DCI7LMWZoUsxPW3xi
 5gJj7YNCrjBhlRPCubOpKY1hbQW54X0x1+2OoDoWSl/7ac+UDu3RS1hRD6/Ml7ZbMqpplmBPAn5
 6ILwuYTarw15ET9NMtcUsNTGmQ9QOibQrSeCge2T582XvbNTz5rGhj4x+Mne6NjabucjTepiVYA
 wImsiXgt0G+Wut+rcUg==
X-Proofpoint-GUID: Cgm3KTdPchrusijMIhgM8EkJCsip5P6J
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0MyBTYWx0ZWRfX03Ir5ET9UcD1
 ODoMCOH9gy/saP6bUI/XJ/2kwuamYQRsQojW7ewq0wSH6DaR/h56Y9Iw7njG0SzRcvu8ht9zL1j
 4FeGxELI2u1p7DAaPgiUMIQBAag2Uec=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a47403a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pHORTPgO1eFKx7QcuTIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: Cgm3KTdPchrusijMIhgM8EkJCsip5P6J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030043
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-116143-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konradybcio@kernel.org,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:vkoul@kernel.org,m:thara.gopinath@gmail.com,m:Frank.Li@kernel.org,m:agross@kernel.org,m:harshal.dev@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmaengine@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,gmail.com,oss.qualcomm.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D22E86FE7FC

On 29-06-2026 17:10, Konrad Dybcio wrote:
> On 6/8/26 12:09 PM, Kuldeep Singh wrote:
>>>> +		cryptobam: dma-controller@1b04000 {
>>>> +			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
>>>> +			reg = <0x0 0x01b04000 0x0 0x24000>;
>>>> +			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH 0>;
>>>> +			#dma-cells = <1>;
>>>> +			iommus = <&apps_smmu 0x84 0x0011>,
>>>> +				 <&apps_smmu 0x86 0x0011>,
>>>> +				 <&apps_smmu 0x92 0x0>,
>>>> +				 <&apps_smmu 0x94 0x0011>,
>>>
>>> 0x84 / 0x0011 is exactly the same as 0x94 / 0x0011. Likewise 0x96
>>> duplicates 0x86. Drop the duplicate IOMMU specifiers or explain in the
>>> commit message why they are required.
>>
>> +Konrad too as there was same discussion in past too.
>>
>> 0x84/0x94 and 0x86/0x96 pairs are actually different even though
>> resulting sid is same.
>> Let me explain more.
>>
>> From sid sheet,
>> Description	   SID (hex)	MASK	RESULT_SID	S1 CB
>> CE descriptors     0x84, 0x85	0x11	0x0084		S1_CRYPTO_KERNEL
>> (for data pipe 4/5)
>> CE descriptors	   0x86, 0x87	0x11	0x0086		S1_CRYPTO_USER
>> (for data pipe 6/7)
>> CE data pipe 4/5   0x94, 0x95	0x11	0x84(same)	S1_CRYPTO_KERNEL
>> CE data pipe 6/7   0x96, 0x97	0x11	0x86(same)	S1_CRYPTO_USER
>>
>> Qualcomm BAM DMA engine driving QCE has 2 major components here:
>> * Descriptor pipe (0x84/0x86): This carries BAM command descriptors i,e
>> key, algorithm, length etc. which tell crypto engine what to do.
>> * Data pipe (0x94/0x96): This carries the actual data payload — the
>> plaintext/ciphertext buffers being read/written.
>>
>> The descriptor(SID 0x84) basically contain IOVA address that points to
>> the data buffer. That same IOVA address is then used by the data pipe
>> (SID 0x94) to actually DMA the data.
>>
>> Since, Crypto engine descriptor and crypto engine data are part of same
>> crypto operation and with the limited number of context banks, smmu
>> provides an optimization to logically group and resolve them to same
>> context bank/page tables.
>>
>> Pipe 4/5 contain 2 SID(0x84/0x94) for kernel and pipe 6/7 contain
>> sid(0x86/0x96) for user. Pipe 4/5 doesn't touch pipe6/7 buffers so both
>> are safe.
> 
> I understand they are different from the hardware perspective. Are they
> different as far as the OS is concerned? Will we ever need to separate
> their data flows? (I guess that would require iommu-maps anyway since
> currently they are bound to the same domain anyway)
> 
> Alternatively, if you'd like to keep this level of description, it would
> be good to describe the iommus:items: in dt-bindings, so that one can
> make sense out of it

Ok sure, I'll update iommus:bindings in that case.
Please note, I sent v2 and will incorporate in v3.
https://lore.kernel.org/lkml/20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com/

-- 
Regards
Kuldeep


