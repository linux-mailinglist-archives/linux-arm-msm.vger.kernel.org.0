Return-Path: <linux-arm-msm+bounces-94405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGH4HHpGoWkirwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 08:23:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6AD1B3CE2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 08:23:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 61627301091A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 07:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5B53370EE;
	Fri, 27 Feb 2026 07:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X/DbZVoP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DKOdHlvD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352E8332625
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 07:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772177009; cv=none; b=j+zJ1BVE4QBzZ8jYgb+5IvZLvegTtNDuSGsbvvSMj42Qba1eiAF2B7TLgpYjp0jxR/1CnbsqV1gnZTiKKx4fCEUl6StMQiKHzJzrzSN4qGrijIY2s5NTsRnDx55G05ySpZuvJet0EJB2X+KjO45DUsEk52HSN0k/Eo4EzWkYgZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772177009; c=relaxed/simple;
	bh=Bx0gEwooeI4LIaJmeX99A21HQ7MvqceqPs2txbeKC2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GC6KI80BCGDRpnyk8Xh1z6jxsAr3sWItN3o5fqv5XuDRQxNgWvDAqGgzpP0iNp7JGoU37DW+m6Azm7X1XfDGeoo3JdtBlbmyAhjzw4zrv3/vbzWGLfOY45g4ccWaHH2AmT/MtmZgOQna3AbW0k9R8rt+qEnL7tDQo0nIRVuLN3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X/DbZVoP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DKOdHlvD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2K2Cw2353453
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 07:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JNdb3tht5lioNt1bh8nt4v5G1+3ZdmznQiRYvtcmHRU=; b=X/DbZVoPSWaFIP3p
	F9kbB+NYlnD4JgLBwnA3Z41Dy8d7zoKa5sEvrOD+thxvZjpaaEESCpmQeZs94Xnf
	uJZ4NFbxjgYKH37IW1TUwhTE+sn5Wa4bwWhkuT/22SJJXT+V9k22U/gHvyU4MWVK
	LX9vhdEQXhIdrBE492PHtq4K+Dqpkb/DOEKx/ceII/TSZrXZBxW8+wgUE7CHdczc
	4GW8gnmH8cfF+8CqEGQUfmjLYw75i+urh2PisQFR0/pv9x4PCLInwm6I1poeCFg8
	9oqdJtLw4MgqX0RcZAXVGEdFmQX7zK6LdmBsHZfNg3kPybsCWt4if+vlKRx0MHKe
	h1iGXA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjm8u3rk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 07:23:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-358f48d2a3bso732538a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 23:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772177006; x=1772781806; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JNdb3tht5lioNt1bh8nt4v5G1+3ZdmznQiRYvtcmHRU=;
        b=DKOdHlvD/2yYJt9Q3PspjMHhvXj86saj8R2dQl7LX9+bxkQriLTKrXLNt3VVmeht0T
         hfuRVjkjlSU2xcECEyWcmLRQVhULNcCUrZkHhyNHDIObPdsyuN42pi7379DcAVeflhvJ
         p27ge+ymvnYoFERg6geyka7uuHAAI/pDK0VDNOG5baq5ne3y21MgOaWiILL0NOeDq7E2
         kjTHNb9Af4roecMUL+Uj04BZna8yHTnn0rxajYGZNnjjg9INxYOsNCxJuTZl+vBEthWQ
         izmZ0DxT9VeapAAJ7bjedL04SRj6mQ/iah2to9NMMaBqnB1HG6ii0pgC/QMRZYR8VfRI
         8Ilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772177006; x=1772781806;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JNdb3tht5lioNt1bh8nt4v5G1+3ZdmznQiRYvtcmHRU=;
        b=GVuaEuLXST0xt2oPsSIaQ7IS7pQxqPQPN1XWoUJKRhBQR4PciNWyU58FEksvNzuZPF
         aAISknBUqSmOpkhg57B4BMQ8dTgeag6UtYusRJnJVZ1+JgZ/xuG/+a3eiOXtLtlIkWaJ
         k5vFGpai9OdxLUJxKsJ/9M859FEksjX/gtJzhtb/PhxPlEQ7mxqZHqMAlG2aIGupLiZX
         t+8s7upepRSmfvulGWD2jugpNeAH/2JYizXZazn/KHQhlMEBYi5xs5r4R3GlhLdCuTk8
         YPmWCmkThXUYiXubT/3P2PC2TYZbNX+DmMIijh7Qq/tHo5BIScRtuls9MQk3JSBCCQFm
         7SZg==
X-Forwarded-Encrypted: i=1; AJvYcCXVWjMhxw+UGbYc6q2Mwa2p8tymxtX5SWgNon02gOkiDK6W3ZNAuHkvCahUq/g0iZPgPvjYnwNi9imhVNbc@vger.kernel.org
X-Gm-Message-State: AOJu0YxuVbRGSpCYW3GeNLMLpVZ+8DlRjeSgvYLpWJkKIqcIkGolq7AI
	QSrLEXuSTJRP4Bsk+ty4fi6RFlH1us/7+zVTmk70MvWQ2HpC6+sr6HX8XpHOdPOPLGN6C0SsY+B
	d8+2Y7Qm1yE4QC+sZXT3tKnobnB5R6AIXX2FDN3LGwV9Jki6zFglLbpQuoPfzKMPM6Thw
X-Gm-Gg: ATEYQzyZpnVO0nueOiSxsjvyoW9+QlLVwf79uhUls8HiwdP60MpEo1VwSlMekAH01oc
	je/ZcxZNP3gcnlEpWyESqY8uG+znfE5/kv89qoxKrYFw1BkkKF/0uZ8yOgYcx9+WbiJ2SMdTy8K
	UivDTK9pgKi1VT1x/+LunaH5qoK8FDNXG+ZIkKvpIctYzkOLT1+RZez9M81LKCOeDO1JlzttB7u
	y91L3Nf8doHNAuCpKw5dYR6byjtTiV9P6GZ+IOnyw1qkWuLATG2UrkjY02gTRNvbeYc8cmPuHZ7
	nn1ee9s8QUzcb7i5D7kF95hZmiTLSXIteX+x62S0Dk97ctRptfzAA9tu8dm4FTONUqaXDm/HY0Z
	1HqmH68wg/tP6QtwodWl0sQZ1bUHejxDE+3JvmvIBNT+H4o+psw==
X-Received: by 2002:a17:90a:da88:b0:356:46ad:a161 with SMTP id 98e67ed59e1d1-35965ca1bd2mr1306069a91.4.1772177005991;
        Thu, 26 Feb 2026 23:23:25 -0800 (PST)
X-Received: by 2002:a17:90a:da88:b0:356:46ad:a161 with SMTP id 98e67ed59e1d1-35965ca1bd2mr1306054a91.4.1772177005508;
        Thu, 26 Feb 2026 23:23:25 -0800 (PST)
Received: from [10.218.41.33] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3591345b158sm4061973a91.1.2026.02.26.23.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 23:23:25 -0800 (PST)
Message-ID: <c291118c-7a95-42dd-9242-26bf21cf76f5@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 12:53:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: monaco-evk: Add Interface Plus
 Mezzanine
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
References: <20260222173545.3627478-1-umang.chheda@oss.qualcomm.com>
 <20260222173545.3627478-2-umang.chheda@oss.qualcomm.com>
 <at7j3kbdixd7aveiol37pwgudl2hcogtdrvdgcvgbbm3t5irfc@4nvv5ptoezyk>
 <4ae0dd46-5f5f-403b-bbc6-1094159be302@oss.qualcomm.com>
 <ffy7ufbwofipmctotg6l6mrtamakqc6xxrql7wqw3rslhd36uv@payikxla7pzk>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <ffy7ufbwofipmctotg6l6mrtamakqc6xxrql7wqw3rslhd36uv@payikxla7pzk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA2MSBTYWx0ZWRfX3vu696/bTmR6
 lk5lbWzDByJ2LYU4SmUpQJiAW/u/JJ+lUtkOzddxYtaQF1fSQMdgAm2JycKLlSpsW/e7u+arVEn
 g62sUlAPpPlCFHs1noqizV5i5pQs9iLIb56UXl9cyRxizC1l7e+YmMY7HXS0VgjXBQFxRINYcS1
 ax6Zvp+k9FV/rx2Gcu4Tu5kDUwI31dpZYLWxSRiUsvUDsFZM1SLadIoQjiYLlY9d98D9wXpODuN
 ewcDPdXER6EVHqQAmtz8v9bO6LYNQhHIlrpiwYcyxbGonxHve10/MXQtQoa/13V429GLMUD20xv
 LIEm1zFmfazk0L+8hGJn0D/Kv7KUYkeBVLjoqToQ5Xo9hXFwJzlXmuZ/l3SkObEvE8dcVI2LXxC
 QIZZGLAsvclngf1h+D3TYEFSiZW7D2yxFQk7azalBLmASTj2iaSMo6FuZTApmUOXc7QC3wrwkzI
 CY5IcXVYR6tZi0oLKSA==
X-Authority-Analysis: v=2.4 cv=O780fR9W c=1 sm=1 tr=0 ts=69a1466f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=kQJZIT5M89cdE685t2YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: -Mo-P1I3X8NYUAXXxcXBzCbNVMZhWTtB
X-Proofpoint-GUID: -Mo-P1I3X8NYUAXXxcXBzCbNVMZhWTtB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270061
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94405-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CE6AD1B3CE2
X-Rspamd-Action: no action


On 2/24/2026 12:26 AM, Dmitry Baryshkov wrote:
> On Mon, Feb 23, 2026 at 03:17:11PM +0530, Umang Chheda wrote:
>> Hello Dmitry,
>>
>> On 2/22/2026 11:57 PM, Dmitry Baryshkov wrote:
>>> On Sun, Feb 22, 2026 at 11:05:45PM +0530, Umang Chheda wrote:
>>>> The Interface Plus [IFP] Mezzanine is an hardware expansion add-on
>>>> board designed to be stacked on top of Monaco EVK.
>>>>
>>>> It has following peripherals :
>>>>
>>>> - 4x Type A USB ports in host mode.
>>>> - TC9563 PCIe switch, which has following three downstream ports (DSP) :
>>>>    - 1st DSP connects M.2 E-key connector for connecting WLAN endpoints.
>>> Nit: routed to? Is that M.2 only suitable for WLANs? What is "WLAN
>>> endpoints"?
>>> routed to?
>> If I understand correctly - you mean change string "connects M.2 E-Key connector" to 
>> "routed to M.2 E-Key connector" ?
>>  
>>
>>> Is that M.2 only suitable for WLANs?
>> Yes, this is suitable only for the WLAN module.
>>
>>> What is "WLAN endpoints"?
>> I Agree this is misleading - will change this to "WLAN module"
>>
>>>>    - 2nd DSP connects M.2 B-key connector for connecting cellular
>>>>      modems.
>>>>    - 3rd DSP with support for Dual Ethernet ports.
>>>> - EEPROM.
>>>> - LVDS Display.
>>>> - 2*mini DP.
>>>>
>>>> Add support for following peripherals :
>>>> - TC9563 PCIe Switch.
>>>> - EEPROM.
>>> If there is an onboard USB hub, please describe it here. Also, what is
>>> the story of mini DP ports? If they are to be enabled later, please
>>> mention, why.
>>>  If there is an onboard USB hub, please describe it here.
>> Ack, Since there are no DT changes required to enable USB Hub I did not mention.
>>
>> will mention it here in the next patch.
> That's not what I meant. Please describe the USB hub in DT.


The dependent changes for enabling USB hub on monaco-evk are In-progress and not yet upstreamed

will post the patch to enable USB hub for IFP-mezzanine once it is upstreamed for monaco-evk core-kit.

I will update the commit text of this patch to indicate the same.

>
>>>> +
>>>> +	vreg_0p9: regulator-vreg-0p9 {
>>> Are all these regulators a part of the mezzanine?
>> Yes, all these regulators are part of mezzanine board.
>>>> +		compatible = "regulator-fixed";
>>>> +		regulator-name = "VREG_0P9";
>>>> +
>>>> +		regulator-min-microvolt = <900000>;
>>>> +		regulator-max-microvolt = <900000>;
>>>> +		regulator-always-on;
>>>> +		regulator-boot-on;
>>>> +
>>>> +		vin-supply = <&vreg_3p3>;
>>>> +	};
>>>> +
>>>> +	vreg_1p8: regulator-vreg-1p8 {
>>>> +		compatible = "regulator-fixed";
>>>> +		regulator-name = "VREG_1P8";
>>>> +
>>>> +		regulator-min-microvolt = <1800000>;
>>>> +		regulator-max-microvolt = <1800000>;
>>>> +		regulator-always-on;
>>>> +		regulator-boot-on;
>>>> +
>>>> +		vin-supply = <&vreg_4p2>;
>>>> +	};
>>>> +
>>>> +	vreg_3p3: regulator-vreg-3p3 {
>>>> +		compatible = "regulator-fixed";
>>>> +		regulator-name = "VREG_3P3";
>>>> +
>>>> +		regulator-min-microvolt = <3300000>;
>>>> +		regulator-max-microvolt = <3300000>;
>>>> +		regulator-always-on;
>>>> +		regulator-boot-on;
>>>> +
>>>> +		vin-supply = <&vreg_4p2>;
>>>> +	};
>>>> +
>>>> +	vreg_4p2: regulator-vreg-4p2 {
>>>> +		compatible = "regulator-fixed";
>>>> +		regulator-name = "VREG_4P2";
>>>> +
>>>> +		regulator-min-microvolt = <4200000>;
>>>> +		regulator-max-microvolt = <4200000>;
>>>> +		regulator-always-on;
>>>> +		regulator-boot-on;
>>>> +
>>>> +		vin-supply = <&vreg_sys_pwr>;
>>>> +	};
>>>> +
>>>> +	vreg_sys_pwr: regulator-vreg-sys-pwr {
>>>> +		compatible = "regulator-fixed";
>>>> +		regulator-name = "VREG_SYS_PWR";
>>>> +
>>>> +		regulator-min-microvolt = <24000000>;
>>>> +		regulator-max-microvolt = <24000000>;
>>>> +		regulator-always-on;
>>>> +		regulator-boot-on;
>>> ... supplied from what?
>> This regulator is supplied directly from the DC Power adapter.
> Is there a physical regulator which outputs to VREG_SYS_PWR? Is it a
> part of the mezzanine?


Basically - we have added  VREG_SYS_PWR to describe the DC power input. This is nothing but

the direct 24V DC Power Input and have added this as parent for "vreg_4p2" power supply.

>
>>>> +
>>>> +&tlmm {
>>>> +	tc9563_resx_n: tc9563-resx-state {
>>>> +		pins = "gpio124";
>>>> +		function = "gpio";
>>>> +		bias-disable;
>>>> +		output-high;
> Please add a comment, why is it out high.


Ack

>
>>>> +	};
>>>> +};
>>>> --
>>>> 2.34.1
>> Thanks,
>> Umang


Thanks,
Umang


