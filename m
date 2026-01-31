Return-Path: <linux-arm-msm+bounces-91339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FGgKxpJfWlZRQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 01:13:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D8FBF880
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 01:13:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34C7A302614B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 00:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE52726056E;
	Sat, 31 Jan 2026 00:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EkGISCbG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c1+3nHOt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0AA27F759
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 00:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769818305; cv=none; b=j09oGcVWOlq1AXDR9aVxRKNFbHrSL2JnGEvDP45W/xbhvZeZ6SiypH1J6dPSvoKyxP39CpzOkmijKbQgwj63V1EbBK767lJW553IBRRiY4zeiTZE52GEJj3ZSWVhtbLCYfqrJ4WxEhe7Gf2HxmdRHLOaXtIyKlILinWxKibnOn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769818305; c=relaxed/simple;
	bh=O2FS2/SE1xZMmlejiwUsVfZfG4Zef9kbrp51b2Slgvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h1LVmJbqCoJzqjWs2Euw65I66gRF5ckFEiBj5UtI2WsQB1W33XPaxxA1VQACnTn9BWzQ5eV05HLOGOcwh0kKCrEKWvdVhdyFuw/GR5maNVvjgfsw3qtnt+tci095qt2CdzA5SBQpv8M+SMvbA4tLC7KMj3GrrfDV4q6OIva0Qyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EkGISCbG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c1+3nHOt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UKMwnL3656056
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 00:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zx3nxUrMvDm6g9Eyi17UuQcuiUHVLZc76hNIu4wcwl8=; b=EkGISCbGFtXPB/nt
	r6G/UzlH7yniaf28q/0AMUNnHNGbLrZvVT8HBS7jB1PkoE9weLbD7WWMtXb+s65o
	ERGc1XgBy7VOT62RQ0VG8NZ07tnr0q1dOWL4xEFmKadA2SIZjLTqQLhr783t+KSV
	t1Z1j5oOoqcUdEM30jAUS5mbUEe+sAJxBa1qRPbKOJyspfWtQPK6JE9fuwKJdKOy
	TdMoHHr/mExYyWfV3JniJbW9sH3Nd36vO7bBl26kJm+oafrj5zWg1Df8Gzk93sDu
	k4QDjleCPuEq3A1HSXGgbyCRgr3qKIN+NQ04TkZz3ySbTEnBENDhkKnPB7w0Lr0P
	AIRb1g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c114c12hj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 00:11:37 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b70d8095daso720349eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 16:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769818296; x=1770423096; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zx3nxUrMvDm6g9Eyi17UuQcuiUHVLZc76hNIu4wcwl8=;
        b=c1+3nHOtDEwFrLLh5uR9wTH/EpiV7XWuhfxCDBoDewFIHuaC5IGWr9PolJImcKVlEV
         X61acSLHSXt+pTLKunG4fIShZHHB56twviAiqA/KpsPNdS7VcAMgxD7hL705f/kkDpbN
         lcizn5ahkyXmciI5vX/U646lgdJn0pv/n3pQ/BWPuDmmLcOJ7wMVO9jok7QHBlhP+9mN
         OmtpqTQNvMHQO/eFRh5aCjxtT3pSQ8Xh0Kn3TZf06P5MNj3B3ZT4fCCeqi26HPqY1Ns3
         d8r0WxeBT9CRuQRp0DXuKMHoJ1GS2HImTs64ZBItBPfmb9ApvwZ9aQyH+cZhMViB1JqL
         h/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769818296; x=1770423096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zx3nxUrMvDm6g9Eyi17UuQcuiUHVLZc76hNIu4wcwl8=;
        b=vzkRB9jP3vClkW/wGj0ZRVNuIfQbh/2bv4GOCGoDw3S5hEBslGCpGawUD+8GcJrvp9
         6z6iwQl/MQimI5hRGnByjvZYIqbHTX2rFaNDxQ6je8dKG2+kwoL9WKOCV0LQ6kL8bV/+
         X5/00TGlBHj31ySBnvRMwGeyh4KSevzV3b+6q1r5sKwq6Lm673tO8qgho+W0zCWsH8Ch
         1IqDdFxQgrjZdOGN5rQ5ge7LMAwJYmKbxpEyNdbpRs7KMpobrRvgXy4pWNeaXUbMuUTZ
         DWE1NMbxvdZ0lteIL+T40ocijMiXMDl90xBAiYJLyAY2ZP9dO2FyHqIHGow4PVUsby6M
         jlNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWJB7nEwu7XGfhcgT+ZgPO/PjlNAj0ffsideiZgpJ8Ki7dviN2U4dzrLg7EO8ChwUnsmiG6de6ViiA8FR3@vger.kernel.org
X-Gm-Message-State: AOJu0YyOWc+NyIVaS33OE9uvBuaRgt8lUNxL0HDRUuBjbToECRfMtATl
	kFt/nzoB4LnPyv/Ai8A6EGUVvXRTr/2Gbc8TmgZb3I/2fQG28FHMT4uK3DSdIXxCvAAYAjTaBD6
	aOS6DhviQo692pAt6SOnE6Lzm/n8hDEo8hT91T338nmNOjRH922M6QALrSGEzNSrXmpQ+
X-Gm-Gg: AZuq6aIh11oRI6s+CaTyKR/YLp6OG7d5J2evNJBIfXrY8XI13ZCmyg3FB4mynzOk0bC
	G/+GKPI+MlKlVZTjFdQYXXjKxLz7FKReC3QfiFKrUoNGrywNA83UNn/lUemUoxfBQsNJUE9KtQB
	P8jOw8sRbvF+ZMuujUcHi6LtCF8eFmMM84tLXduY43JIaGmVruDZA5LWjGI+W3DMWBEUuw5xCFY
	lpXXPA5RX6TYJ9SI5upTmJZN9iy1uYIFPpcopsZ201BoAPn3n9Z6tEg7u9a7KFdDUU7++nIYSUf
	Wg2K7ydOKYQ/VTaa6pTchAhB3bFzEKrLmJDELuHMXy6cs1axonyvVHX090H+E1JurRi3atgYhh9
	jUAb/wM/2RXW3442Q49aQpU+oYlSrtb0mJuo7xOXLm59VGMXclYWuEuRb
X-Received: by 2002:a05:7301:9f0b:b0:2b7:2bbd:95c0 with SMTP id 5a478bee46e88-2b7c89288d9mr2075077eec.35.1769818296405;
        Fri, 30 Jan 2026 16:11:36 -0800 (PST)
X-Received: by 2002:a05:7301:9f0b:b0:2b7:2bbd:95c0 with SMTP id 5a478bee46e88-2b7c89288d9mr2075068eec.35.1769818295858;
        Fri, 30 Jan 2026 16:11:35 -0800 (PST)
Received: from [10.73.54.120] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1add664sm13390257eec.26.2026.01.30.16.11.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 16:11:35 -0800 (PST)
Message-ID: <3b5685da-5178-46ec-b720-97e1ecd5310c@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 16:11:34 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 2/3] arm64: dts: qcom: glymur: Add USB related nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com>
 <20260113-dts-qcom-glymur-add-usb-support-v1-2-98d6d387df01@oss.qualcomm.com>
 <01de4054-eebf-4ef3-ad74-c806b208a848@oss.qualcomm.com>
 <6lieos5uudkgynizozrmzrj5ov57frzzl65b2fpanwbhbmehot@z5uhyv4ipyet>
 <4632ad3a-c893-449a-b0d1-48d9c93da7e9@oss.qualcomm.com>
 <86dade1c-3ac4-4352-8dc8-e7acaaf21321@oss.qualcomm.com>
 <5a773b89-f3f8-486b-af01-3387c99e53e5@oss.qualcomm.com>
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <5a773b89-f3f8-486b-af01-3387c99e53e5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDE5OCBTYWx0ZWRfX/ecen6v038jZ
 yYrdoQRudPrdoBX3EOP5qNIXhGgKV/iZk7T3ejYxSFsL0GKwBp+7ZuqeRffg2Q2zgPFJ9i6LP97
 iFhfcf/lIZgDiC2cfs9/P0JHGuDQjDIsEjAbpNsf34R/BxzF4uQjfoUsHe+JxvE/sY8CJj+/WhT
 1ngtCUZK9+8NDiRNM4nhlxKrMhsRJOPTV+gLLSHz5eKKj3y/3dqwDj0ddi1shciQqKetMNxyiBr
 2ZOrlWtgVMvV0asI+uRH61E6OJamthX+P9eJMMz1zCSd47vaWxRn6R9sPT6SLCyAgOfSEY5NgZm
 Tn92DRXh87Aenrp/o4mrHtHpVf4IRtMd8/dvLr51mti7B2QvxvxCa8/1uG+GHd9UWu72OykB+PP
 SzQO2F/zDmVj9xSwMxQ/tSzY5vSggn8V976dLlEdkHFvDPJjVzORDj2e8zjdTe/az/ZBFSH1vcO
 t6RWcAAi9KsC6aLa8jw==
X-Proofpoint-GUID: 67Ps4X6rt10DNP4mtNl5EsRZovVJjOD8
X-Proofpoint-ORIG-GUID: 67Ps4X6rt10DNP4mtNl5EsRZovVJjOD8
X-Authority-Analysis: v=2.4 cv=YZuwJgRf c=1 sm=1 tr=0 ts=697d48b9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QsawANE1_QW70S-DVw0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300198
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91339-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wesley.cheng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 10D8FBF880
X-Rspamd-Action: no action



On 1/28/2026 1:53 AM, Konrad Dybcio wrote:
> On 1/27/26 11:26 PM, Wesley Cheng wrote:
>>
>>
>> On 1/27/2026 3:46 AM, Konrad Dybcio wrote:
>>> On 1/27/26 12:41 PM, Abel Vesa wrote:
>>>> On 26-01-13 14:13:32, Konrad Dybcio wrote:
>>>>> On 1/13/26 1:33 PM, Abel Vesa wrote:
>>>>>> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>>>>>
>>>>>> The Glymur USB system contains 3 USB type C ports, 1 USB multiport
>>>>>> controller and a USB 2.0 only controller. This encompasses 5 SS USB QMP
>>>>>> PHYs (3 combo and 2 uni) and 6 M31 eUSB2 PHYs. All controllers are SNPS
>>>>>> DWC3 based, so describe them as flattened DWC3 QCOM nodes.
>>>>>>
>>>>>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>>>>> Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>>>> ---
>>>>>
>>>>> [...]
>>>>>
>>>>>> +            snps,dis_u2_susphy_quirk;
>>>>>> +            snps,dis_enblslpm_quirk;
>>>>>> +            snps,dis_u3_susphy_quirk;
>>>>>> +            snps,usb2-lpm-disable;
>>>>>
>>>>> Other SoCs have a list that's much longer, please consult Wesley if
>>>>> this list is enough
>>>>
>>>> Checked with Wesley. He confirmed that this trimmed list is fine.
>>>> He said he dropped the rest since they are related to the power saving
>>>> features like USB2/3 LPM (l1 or u1/u2) and we don't seem need those.
>>>
>>> Is that to say that those erratas were fixed in this hardware?
>>>
>>> Low-power states of the link are no less than desired is possible..
>>>
>>
>> I think it was misunderstood.  We should keep the same quirks as our previous targets to enable USB LPM support in certain cases.
>>
>> snps,hird-threshold = /bits/ 8 <0x0>;
>> snps,usb2-gadget-lpm-disable;
>> snps,dis-u1-entry-quirk;
>> snps,dis-u2-entry-quirk;
>> snps,is-utmi-l1-suspend;
>> snps,usb3_lpm_capable;
>> snps,has-lpm-erratum;
>> tx-fifo-resize;
>> snps,dis_u2_susphy_quirk;
>> snps,dis_enblslpm_quirk;
>> snps,usb2-lpm-disable;
>>
>> There are some questionable ones that I'm on the fence though, which we should consider removing:
>> snps,usb2-lpm-disable
>> snps,usb2-gadget-lpm-disable
>>
>> USB L1 support is routinely being verified on our devices (in host and device modes), so if its power over performance, we should consider removing the properties to disable USB L1.
> 
> Does the fact that we allow L1 entry impact performance itself, or is
> there some room for improvement in the drivers?
> 

Hi Konrad,

Its not exactly something USB drivers have control of, as USB L1 LPM is a 
feature handled within the controller.  The only reason why we might see 
some performance hit is if we have to frequently enter/exit L1 states, but 
if the link never make transitions into L1, then we obviously won't take a hit.

> 
>   (esp since we're defining the HIRD threshold as well...)
> 
> Wouldn't HIRD threshold be related to *U*1(/2) though?
> I see in the list above you decalred
> 

U1/U2 are USB3 LPM states, which utilize the BESL, not HIRD.

> snps,dis-u1-entry-quirk
> snps,dis-u2-entry-quirk
> 
> which forbid them
> 

These disable them for when we are in gadget/peripheral mode, but u1/u2 
while in host mode is still enabled.  I'm not sure we are confident enough 
yet at this point to enable them (U1/U2) for device mode use cases.

> and the threshold is set to 0, so IIUC that means entry is only allowed
> for devices that don't ""really"" suspend
> 

HIRD specifies the L1 exit latency that our device will require, and 
programming that to 0 will mean we'll require the minimum HIRD latency to 
exit L1.

Thanks
Wesley Cheng



