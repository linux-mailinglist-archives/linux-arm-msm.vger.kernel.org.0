Return-Path: <linux-arm-msm+bounces-117611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xVBwCrY+TmpeJgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 14:12:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBD37262C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 14:12:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ja9AnmOD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bvwbrRo9;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117611-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117611-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7864C301B81C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 12:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8028943B6E1;
	Wed,  8 Jul 2026 12:12:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A2543B6EB
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 12:12:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783512743; cv=none; b=dlnkz77YkRcbmHollS5MuPft5geaDoBu9siB1l8tvjrIUIfQF0DPyy/v/6hzKL1ZbX0weSI6ms2jBfBvXhdSDTs4ZJASTT8EV6I6BEeiPAlFAdO0nsNaSbd0N02mO5eyBmPzKiA5W/DoShpndr1FqBRXxudLz5Esqa2SbgZQidw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783512743; c=relaxed/simple;
	bh=QDWu4O8I5KOVgg1UuqQFKZb6pS9L+NuXj96Vv9RNZaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mobDt3l6NLANP8+flhd6qU1wlGcSfFZpg6SyvpSD7IliPwY7xaBG/5zUFkL0A0MCEvEPvlLcSp6fuvH2ZlMyZ4X5JHAXywTVRZbwnOatAoflTqA5IxzhVJxElfS6XTJAlaWQK14wg9JFRaJ4Epi8A+PVmhKqRBqtTzqPwAs/ffs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ja9AnmOD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bvwbrRo9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3dI52537975
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 12:12:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x99srZ1k83NBw3X7LSFItZj86d9NxG5WKDanacpAupc=; b=ja9AnmODhXlEoMTF
	FNwz0QJU2GPyndpnLM5SOP90Nk3EdQtqJDdrafXJpQ7j9YWqpO6cdBHiMnWWJkku
	ppjEAKg3MCFnwrs9JTU5KgYfysEys/pj6JtdQS68qM2z8PI7szix+pzphtpajJqI
	sn6KOMFkKvAdzMWI2sx67/Qf8qzYR04+SYlPcwBd+SyJc/yPFe5U1O8ZsKLhbZX9
	mBpu1M+aj7jwNb7551K4q9RQxcCMDVOphoq6TbeWTa4C1LaPMkHVN5LpTr5Qv15G
	5Mhzv3VccFehIBZDmdLJvlxH/zQ3N4jCE25+aUDAMo0QagIt1pI4E6XKA//p/aDP
	f5upfw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f97u13ae9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 12:12:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c267931ebso3513521cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783512739; x=1784117539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x99srZ1k83NBw3X7LSFItZj86d9NxG5WKDanacpAupc=;
        b=bvwbrRo9nEBUJ8vWCQRFAxjRiSl5HPAvGncc8EqJY+sY20aSo2IKBApFl8+wM1kjZI
         kC0kw0+5Tl/XPt4G3U04DEYCQM6dWGvNIuRQARVhqw50qnCfteu7jWKaC0owTVqQRikZ
         1n+zDPechTYyLh36k6wBDH8Ovd6ZlcuerG4AEKt3ijY6WOcEsccqIfMUZwuKSlnVpVEU
         PjHtHQXNTc74qd70CXLuNJUX0b0fMOqbWJEkytSF578Fzd+ryB75Z+d23EHMyJhPpD1J
         iAM7pl/SraWLEvmzNn8AvJ1mTCHxbjpwtMwuC8CcXaGL0J9jeKNu8T9pPPaE3LVfOJap
         bnww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783512739; x=1784117539;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x99srZ1k83NBw3X7LSFItZj86d9NxG5WKDanacpAupc=;
        b=J8IYTIr/iLVYoutCMjlcLKgiCBWlVYW79VN40ScasyL77Nr0AvDQN4QAKPZkPIf6NY
         WAwDdNSreAMh1K0nHdBzseoUJ4ui53bAs7ue+bXlZBH7lt1e9JiebdUGTXs9AGB0YG9a
         hOPIiwp0bYCRK9P4OoxoIDJacOYiuxst45/P+TzptwHr4i+KejA1dbztgiXaVUZzmgpI
         7ygBgqaWWG340A1Yal54r8Y1B7Hzi7ulFuu3O6ULmPdTee2Z5xyMzJIp/cHBQA5F/rTt
         IhjHvzbv+MW42WTD4oPTzATLDvs+cWBDbpCDXXpHf5WQCIHtZPuUq2n33t3bD4sMzUzJ
         oesQ==
X-Gm-Message-State: AOJu0YzKro8lNXVlQR8L7aa4n+fH/Nid6qhGEyPKSkeppoCCvbV+ugwQ
	ulikVzSPfFz5UuBuuCZD8wLyQArF1IjPbN2kUvJN48ArGF+LwmIbV6X1PC6Qv4NYTZX8HXmTxSo
	iuw6zzBUXw78FWjlvKggwxanjK0Ff37FenmAfB40IYn5mO5ywE2oSfMeySyxhzt8bhTeY
X-Gm-Gg: AfdE7clnYjsmK+yubFn0T3hwAFgJDMcKnU++0U2WqbTI5EK6EFZdtsdqln/NVqOVZLh
	Os/jC2lLHQzH9jA/LyAFZGMLAr78trqkYwKlf26GB2PrBvj/UnxLI2dPp5teI3x8FLR+5o+3onD
	UqX5Im6mJLR1m4AupQX8D7Rce5SCRzUrYyUV/eoNnCt3tGiF4u6NcwyaZyrwrj+ZRsY0N1X5UMe
	0mFv1s40syZsjLD/VU6aHSb674NXuqmOpDQqKXRVWsL0EtuSFfasbZaB9xOaWUDzLNY2Sl6PdmH
	YB06njmKRhf46L0krVjz/C/HMv1jcwVZ7X85KDmaqhyJHLJZVjw5DHBxDmN4igazIpXPOVKD7E6
	vwxuueZ9IrcrqRRU+sXGYROjVE3lIishqB/s=
X-Received: by 2002:a05:622a:110d:b0:51a:8d32:f796 with SMTP id d75a77b69052e-51c8b2712camr17779171cf.0.1783512738982;
        Wed, 08 Jul 2026 05:12:18 -0700 (PDT)
X-Received: by 2002:a05:622a:110d:b0:51a:8d32:f796 with SMTP id d75a77b69052e-51c8b2712camr17778871cf.0.1783512738409;
        Wed, 08 Jul 2026 05:12:18 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69aa6dba523sm1965138a12.0.2026.07.08.05.12.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 05:12:17 -0700 (PDT)
Message-ID: <5d46c46b-1f58-487c-a883-bfb8ea356035@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 14:12:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: eliza-cqs-evk: Enable sound card
 support with WSA8845 and DMIC
To: Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20260703083421.2736184-1-ravi.hothi@oss.qualcomm.com>
 <20260703083421.2736184-3-ravi.hothi@oss.qualcomm.com>
 <bbd86b28-b6e7-4483-93a1-bac96c2dba43@oss.qualcomm.com>
 <059f8b92-6df0-4439-b3ff-1a270b5ee1b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <059f8b92-6df0-4439-b3ff-1a270b5ee1b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DK3hym-mb29KpoCJwrsNEAVsUvsPdBR5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExNyBTYWx0ZWRfXyv/voSh0IuuB
 NTheUgE7uzBi6kPJyf1hmB+zsShejqG1/CcyTDxqynL5x+u9xs5A8S0PEubnipZGiV6+eKzncrP
 pkotkrxaXBlR+/ih9gTOBWn0v2+h91Q=
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=6a4e3ea4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=QKulUWdV5NHAk1IIq1IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: DK3hym-mb29KpoCJwrsNEAVsUvsPdBR5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExNyBTYWx0ZWRfX1iOnp8qwrh5r
 U+aEbxgQC3TVKjk8UiFaFn8PRtht6cBS1dz7rx3zS04R5JkK43BZbWlkxe8AQ5CCMyBDHa4qYPF
 Cu7j2nQavtX+6LCt+OzzJt8qriBYuhXMXv75pGZLE9bQGFZkfoeDGtI8v+My6fS4YEzXIS+8H1v
 31QiVda6+NRzjkiAWu9RNQdgm1doH4CwkL+AdWbi+Fef/4NwIBnkymwbRmg7HnIST1QW2TVbhfz
 kntgTeWMuz+0T0tMkfpoyopUNw7sge+FjPEG3xKIPYmq88mZe8H/GW30kh/1dE8s6sPZJ3RTJq5
 /VMJao4cG3ukpPVOUGAmBStesNMov0ZaHbZj+oGAOQ4BVebJGFnjG39DqLaU+korUaqqYFRdE/d
 pSYdOLlIBhZz/7NlSRkO0pHZiRHYa6ip2D243PKpWxyxoaUrecaJ4phiHYX102hJnD9DnPD47o6
 bCthX8cojV+1Ao2UZWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080117
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117611-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:ravi.hothi@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CBBD37262C8

On 7/8/26 1:27 PM, Ravi Hothi wrote:
> 
> 
> On 7/7/2026 2:11 PM, Konrad Dybcio wrote:
>> On 7/1/26 7:43 PM, Ravi Hothi wrote:
>>> Enable the sound card on the Eliza CQS EVK platform, including the
>>> WSA8845 external speaker path and DMIC microphone capture via VA macro.
>>>
>>> Enable the required LPASS WSA macro, VA macro and SoundWire controller
>>> along with the necessary pinctrl configurations for DMIC and WSA
>>> SoundWire interfaces.
>>>
>>> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
>>> ---

[...]

>>> +&pm7550_gpios {
>>> +    dmic-eldo-en-hog {
>>> +        gpio-hog;
>>> +        gpios = <7 GPIO_ACTIVE_HIGH>;
>>> +        output-high;
>>> +        line-name = "dmic-eldo-en";
>>> +    };
>>
>> Why add a hog if you defined the regulator already?
>>
>> Konrad
>>
> 
> The gpio-hog is the mechanism that actually drives PM7550 GPIO8 high at boot to enable the ELDO hardware. This GPIO enable is required to enable the ELDO regulator which is powering the MIC BIAS supply.
> The regulator-fixed driver with empty fixed_voltage_ops has no .enable()/.disable() callbacks — it cannot toggle the GPIO. The dmic_eldo regulator node is needed to correctly describe the supply chain to the VA macro driver (vdd-micb-supply) and for power tracking, but it cannot control the GPIO itself. Both are needed for different purposes.

Well, why do you think the binding would accept the GPIO if it
couldn't be controlled? Of course it can power it on/off, check
regulator core code

Konrad

