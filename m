Return-Path: <linux-arm-msm+bounces-92929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OcgHk7/kmlY0wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:28:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD09B142F2F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:28:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2CCA300AB3C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 11:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230CE2FFF80;
	Mon, 16 Feb 2026 11:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B+De7JcD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kvKtGDsO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5352C0299
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771241291; cv=none; b=dYhbjiC09LXgpG9wkXqBQd7ssDr50Gjtv2p3Uju9ALpyxbHMk/PoO47JIQQIgjGmoidav21+zyH7bRcnjsnBGx+6f4/8skt76rBqzdyVCYCWFneNrlRaokGRzzXTg3YmYtuJyrzssdYWC2wl0UyTTm+QlnmHY7Nj/GE/BR6I1Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771241291; c=relaxed/simple;
	bh=UxHWCRF+IQ0QVxfbffrrHZHEWimprbgw74KqfqUgIrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jD+CatTxMdDoExscaz1Oyqzijo32Z4PA9+a6qRndTvovneRfFHhu6ZyFjeRUzUJB9z4qo/SJe3O4FsKqQoW1kp85eRMFTXZcb1ibtXHTdc74kgMvF0BlK8YQNMi/EVBdpeTcS43IDJ2MKZTbpQGNm4oj8FZW7hAudFghxEZdmjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B+De7JcD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kvKtGDsO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GAoOO02903384
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bgw6B2btCaXJBjPE9YGzmamSA00IlFt8rgEc/CwJc2Q=; b=B+De7JcD+4d04Yy/
	/xyNguYetwTnZZhLelyMyfhs8eKgU+aIGhQ4o6MovJv/PiS5y4H6FWPI+FJa47nt
	VOjrRDph/diCSqLHzwOUhb91rM3EkwOfluLw2xmHLz5daxhgEo7PZ1NXVNK+hMeA
	D2xaYBEAJ4N8PGeYzigvYm03NAIdDDfCRT4c/ZmlbjNgBUeg1cHT1hiRQc8WjatO
	8mNwOdw5WDtC3W9GBTTGADprMHuHA/6y3mATg+uBMpdzhFNQ7vf2jLckKxmJvS+s
	iQjC8FuRyNagIj9PI6/lyFS4qdZtDhFRqq29byKAySIp69HB7Ab23zC3WXbCHzuX
	jYEPGQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cahtcm7ws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:28:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4025302aso234905585a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 03:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771241288; x=1771846088; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bgw6B2btCaXJBjPE9YGzmamSA00IlFt8rgEc/CwJc2Q=;
        b=kvKtGDsOowLXoA87xjHat1nZiPVqJVLZu7j4HzL1IKnFjskoX3Oag0beP7zeEQ7pbc
         uxB0IWWRR3VT93MY6UUoSzsa8vK/pUpsFTI4zgNgbz6mKS/+ZFwqnSbPw3ICY1l/L6rE
         oIFllu3AwYe19GOQHbp0+pNiAMzgXVnzyOxVysapOeL5zUSHM+8y3sF3HtnviTsi2YYs
         msRHTjFuOi5m80mA/yc5TwWNAfSrQKszfa70DK9kw4rSqWTn31AZr/ymEIVgf7r1es+6
         rUZ+cHhHMK79KP65HlFDyDqY6THFX+AgltoebbIhqdAjRy+o4f+JcymZP1i1gVF2Bv+p
         X9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771241288; x=1771846088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bgw6B2btCaXJBjPE9YGzmamSA00IlFt8rgEc/CwJc2Q=;
        b=tnrW2AuPBF+FSn3NnFqNkJK1fScm0DVUDeKCfdL9iC1B9Q4DFjmWRBtoCqr6Ynx47C
         MnTNtpBDcZ3lcA1MgE21rqQvkXkkhE0dO5SeyPsTR5Tpjz/UMo55hQGvQsdTBTM/Nr15
         LxPdrnsH8gn1SdfM80UW69AvB1ldcDuuFVGz5V3YzphUAz+Es3gScL77hmI0IynofkS3
         mqK8CgcG2fOVpNWQ4urEMt/v+fvs69FRwnXgqKHIJm2n1t3igIO0HXkoEfmOGgu+Ka7M
         YPGBFMObksXrzfb9dYp6SWsjHoJER0aRZCd8y2VMoJYQiOmjinbFX6NefvvGSyC+MFGq
         fwgQ==
X-Gm-Message-State: AOJu0YzEdhc7v7SjWjS5ezF7TT6gjN5oJNnSVj9TVcCh+p9XOfi7NHfM
	Xhhdd2efrlYZf7Ass9BimqFMdalYH7D6bx5ItroOdVqzomR3CUxsK5hsq3vgdDlfYDXnGO+cIRH
	s4Dkqev5Ej312POGiqC7OzBPiZ6TYrVciwL68wxtSo4oah5ck/fTRh8M2slOw6Q5KkMUN
X-Gm-Gg: AZuq6aLpt5OKbqAJ38YhuuncabwqSxwPreAGZfKPZnTlLvn7Tv3rDO8pSl/8xfcu6Dj
	kyhXqcRhBszHG3hWsIevbG9p02tKcdw7tiWa5sgAlsJQROMxy94cJpBYRsUDyw5zTeIOHfRLsVO
	mxafseiB7VMZuvWj9pW/EuHeMH9os2HZnvWC6JZnNYlhP7v0t8+t6mhJay7ycwB/TItjcGDrSOV
	TBmflVDTHu8HWylNCWnKQbbjgDD44bXUHIaOLE9DOqVXfMWAO4xybhNKCStbAxdtjaeYxtbrC7n
	z6h86hTB2HsoQ+pn/qbmUbcsWigs6/ygRlolvstM48mhjJswdkSMDNJSZUDZcOoeG6LEUcK+yFv
	jLy9KjDBRK7RR6ArqKXv6FJvQnhoO5h2VzR2EzD/AQK3Sa/PCCYDwxAkqJgBEz6Nx3W4xnsVfQ8
	2d2b4=
X-Received: by 2002:a05:620a:40c9:b0:8c9:eee0:dba6 with SMTP id af79cd13be357-8cb408caccamr1031103785a.7.1771241288073;
        Mon, 16 Feb 2026 03:28:08 -0800 (PST)
X-Received: by 2002:a05:620a:40c9:b0:8c9:eee0:dba6 with SMTP id af79cd13be357-8cb408caccamr1031101685a.7.1771241287623;
        Mon, 16 Feb 2026 03:28:07 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7665563sm248061266b.47.2026.02.16.03.28.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 03:28:07 -0800 (PST)
Message-ID: <5c17f64e-5125-4365-b986-8c058cee292f@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 12:28:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add second TC9563 PCIe switch node for
 PCIe1
To: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260212-industrial-mezzanine-pcie-v3-0-1e152937a76a@oss.qualcomm.com>
 <20260212-industrial-mezzanine-pcie-v3-2-1e152937a76a@oss.qualcomm.com>
 <97af21d5-7457-4dc1-bd47-2e34e6df094e@oss.qualcomm.com>
 <ee1a1fa2-89df-4d8b-898e-9a4a50e1df6f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ee1a1fa2-89df-4d8b-898e-9a4a50e1df6f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5NyBTYWx0ZWRfX6O2aX50+XVeL
 7L02OPhcbSx5TnQlOid7LYyU3buzlTE2hRcoitkqqVN6R4V4bnLBvoY3Ytx9qO3U5PgWI1Dl+Uc
 51zWznXFEr0s6Dn60pAK34dTvyxwTXk+yXXd7PFad47FuDif+nEh8VZRmt1Tqv4aL/KZXIj2QHB
 PF8Ey6mTzfqIdAYPlGj+bMkBPiZg/JtQoZaR5g4d4lvZHcvxg0iYboEZJPPTiCnIa0xSO1XIYzM
 bl17YftrDsNDdme2G6hSU5qNzjzesaoEvwtNJOGhu6Su9fwJcF5RlsCTFpJ09dFtww6XfIU42I1
 U3/RZ3LWSYTYnlvKxtxIgr0p05OH9BDVnKk3QBKR3HHFyzFVlJVACIQalbGCtxanSDVvnup4kcm
 QfESSmKyMlf/cYPxLRNh+YDoOOz2LVED0z6v9yxaBg8ah8qZMKnT7OkxUGVoLo6eupTBlW/OOF6
 4LuvAAKlAZeUgvxEo+g==
X-Proofpoint-ORIG-GUID: PgZHod7ADSpSltjqGXk9M97fVNFt-EAq
X-Authority-Analysis: v=2.4 cv=DJOCIiNb c=1 sm=1 tr=0 ts=6992ff49 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=qfHuR384cUd0W-MamsoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: PgZHod7ADSpSltjqGXk9M97fVNFt-EAq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92929-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CD09B142F2F
X-Rspamd-Action: no action

On 2/15/26 3:19 PM, Sushrut Shree Trivedi wrote:
> 
> On 2/12/2026 5:16 PM, Konrad Dybcio wrote:
>> On 2/12/26 11:44 AM, Sushrut Shree Trivedi wrote:
>>> Add a node for the second TC9563 PCIe switch on PCIe1, which is connected
>>> in cascade to the first TC9563 switch via the former's downstream port.
>>>
>>> Two embedded Ethernet devices are present on one of the downstream
>>> ports of this second switch as well. All the ports present in the
>>> node represent the downstream ports and embedded endpoints.
>>>
>>> The second TC9563 is powered up via the same LDO regulators as the first
>>> one, and these can be controlled via two GPIOs, which are already present
>>> as fixed regulators. This TC9563 can also be configured through I2C.
>>>
>>> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
>>> ---
>>> +&pcie1 {
>>> +    iommu-map = <0x0 &apps_smmu 0x1c80 0x1>,
>>> +            <0x100 &apps_smmu 0x1c81 0x1>,
>>> +            <0x208 &apps_smmu 0x1c84 0x1>,
>>> +            <0x210 &apps_smmu 0x1c85 0x1>,
>>> +            <0x218 &apps_smmu 0x1c86 0x1>,
>>> +            <0x300 &apps_smmu 0x1c87 0x1>,
>>> +            <0x408 &apps_smmu 0x1c90 0x1>,
>>> +            <0x410 &apps_smmu 0x1c91 0x1>,
>>> +            <0x418 &apps_smmu 0x1c92 0x1>,
>>> +            <0x500 &apps_smmu 0x1c93 0x1>,
>>> +            <0x600 &apps_smmu 0x1c94 0x1>,
>>> +            <0x700 &apps_smmu 0x1c95 0x1>,
>>> +            <0x701 &apps_smmu 0x1c96 0x1>,
>>> +            <0x800 &apps_smmu 0x1c97 0x1>,
>>> +            <0x900 &apps_smmu 0x1c98 0x1>,
>>> +            <0x901 &apps_smmu 0x1c99 0x1>;
>> This map is not just an extension of the existing one - is that
>> intentional?
> Yeah, I created a new map just for readability. Should I instead just add new mappings
> and keep the older core-kit map intact ?

Quite frankly, I don't know. I that against the "base" it's missing:

0x400
0x501

so presumably the second DSP and an endpoint for the primary switch's
ethernet port?

Konrad

