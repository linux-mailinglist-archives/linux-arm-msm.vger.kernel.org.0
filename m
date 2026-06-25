Return-Path: <linux-arm-msm+bounces-114524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UKPeEQMbPWpmxAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 14:11:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1846C56FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 14:11:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QtkG5Mfl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Rkf80nFQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114524-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114524-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8F533016EC7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 12:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57AB43DE44C;
	Thu, 25 Jun 2026 12:11:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127CA3DE441
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 12:11:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389477; cv=none; b=fIgpwUKO0W49kaocNkYBT3DZgtF6jScT42TgEBKApUpOjsQcBBJYr6qo7SNxGDvkVC20T5H17dDsZJGNgkmPk1+4PmrZnjIQpvb4C1OxJf2p/oMJENkq6K+KdLkT25uwgTlwBFvEQIb4S0MwtdLZI04e/30p3xSPcTtl/qZUcmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389477; c=relaxed/simple;
	bh=tV3yc7DTn62GD7Zm1wS88cLz53thT0It9thfy3TmK0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PEH+YcSEr6i8HoJcuyS5NRlXdCYwpkL9i9yrc4LQnSSW0UnPFnR2Fbjuuug5Bho+kr3QJ3QjOE4vjoH5nJf6cdStPjAAHLpog+yEFdCyzDu2E7vkTxERW78ZK20f8NXMpAWyTPqj/ihIKbBN15vo9djLjHQRahDXKkeVFnYQMbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QtkG5Mfl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rkf80nFQ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jujA1723164
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 12:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p2YllTtCfCoqMpmwdlY/pY89WhIfIh5ZfqB70kDmBSM=; b=QtkG5MflReWFGW4g
	MWP5NLSI0nnGmLp+PyixbSCxQsyQZ8FcSNONtvbRV3RPzbCajlyFHdWFBo1MMTFw
	Rw1ks4xFrGYI2mv7I+D1Qoo1oA+llaWGBodk18jcaAofVhd42Ogc4EkKisUbGyoU
	keo2Yn9m5HtfDF0+Kb50eGr7GpQSfEh84FN+q0OBM1fqmGi+wD/G+iw8xQG6ct76
	ZozlOT5hPoAayOuMrUv8iKioufSyiNrEMIFDxPNOYyLPy+60yPXTr6tzp0Bk4Nr0
	1UdeyjdI8d0Tklnpf3xmDH610UBdiIuZFf594XGmoqkIt2b9uNu3IaZG5NCHI8uZ
	R8AvAg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0j7dv6n3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 12:11:14 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9674f5a39baso22247241.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 05:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782389474; x=1782994274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p2YllTtCfCoqMpmwdlY/pY89WhIfIh5ZfqB70kDmBSM=;
        b=Rkf80nFQWxSGPLv3ZNKYjsVU1rUxbXviLAjMTUVB6WvnKzgKj9aPw2Q3OcuTwxiExl
         4R/uDLpeeRMH3Y/RQhZR17jhtJNYdScz1Te9fzAmmbdYJbl8qthKgPfbmUYTVTxnxI2m
         aSYjpu/XoHrWDrtv7OIvhhMIHwLJo7+s5E9mkgZ/Bn8Bmz2o4pb/tCqj6jX/hheCESTR
         wbHLhWG2hrO5hvy5Udro0rFn57GUlQLW0nei5gCPFhTWnGAYTknzSy2ccsYRKdEy8WiI
         aux0EoRo5uRKzzAk8AtMF9J7CP3jkrsUyYNhV8sDGxxxxIGyDY63BzlmUJEqVwxTTT08
         wkqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782389474; x=1782994274;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p2YllTtCfCoqMpmwdlY/pY89WhIfIh5ZfqB70kDmBSM=;
        b=bgzruCokD1GcG0LPfJsvPlH3Ai1ut+M+HC1mGk356tPq1eEtO9nvuOz0vQ7eL4YgKT
         n9qQOAqJOmnCqU5HXBBJkZAiA0/mjuXw6BXq1C++h6FVz9dEzNvByEXDkp2ktvCo/nI8
         IQ76R+2/5C4Gagg19RX/XGFPDQnsaAusR5e6KW/NRGWPiqn71vOxB72l5Y8QR5l65ySV
         hK4oMAuaQd2QjslVly1Ou8q0Hp0uiqyKK2470r/q5Dh5BDuVdUzhFNBbbHwAyh3+r0zi
         dThckl4Bp1sxJfWS2/LE9JgICAG6JOo4qVg++wmHALbcnyYhyizTec/WXuCUky8q47q2
         8tYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp/A5X26Q83siFL8cX8KXVqj0iMxky51ThKejEu7mjdzr3C1f/yRc1sLWHqVLqeW3VMZG37PGL60v8MYH/K@vger.kernel.org
X-Gm-Message-State: AOJu0YxEmu3z4EVem+4XRYZPIsBmAP+9Eqjv+GtGsDXEkFqWeKjaW6Z+
	k+8a08SBu5wXyiLQiwh5mR8FlpUpyqL6k4t4eTVgZ72Jyufaq2Vl972uTxTvrUwqEuHR5WEREgU
	rqnl0HGIJrvqTlyJTgR+VfGXXAW1TosyqOfwlso8BpS7lAKtfnKQUE01lorvpfCkyd6ve
X-Gm-Gg: AfdE7ck0stRiUwuE569Eet/8M3tPfNF+xznkfjHyL16vySMr/+O5WQ4NAcrvstp+cKr
	5RH7rXlHEUTpClaZYH1UomzGTIejDXZ7+aaK4Raeb9KFeUddJpx3kup02HxT8i/v+VJYG2M9+Bn
	70yPdkjy6YxkfmQQWXHRox6j+Ej2Oc/bg9cg240+PTt3ewNBd4DuI6eZg6yw4aTXXUV+146fYHx
	8UGachZmzudEtWJmddhOIWq82G1e4rFyU4mTU6GrLN3MPbolPwJbW/MAfwj3Dtx7pOnXq2YV06z
	KeVkBD5dziO6stGEIxqYOQ4tVmjdnLX2pr1B1UjCl0N/qn8xzpuDQI1RfXJURP4GmS/HWWqI6+I
	Vh39/jpMmt7Vt2dMM9y645HLATmlphd0lfj8=
X-Received: by 2002:a05:6102:4194:b0:602:b87a:3524 with SMTP id ada2fe7eead31-73437102852mr238087137.8.1782389473962;
        Thu, 25 Jun 2026 05:11:13 -0700 (PDT)
X-Received: by 2002:a05:6102:4194:b0:602:b87a:3524 with SMTP id ada2fe7eead31-73437102852mr238070137.8.1782389473446;
        Thu, 25 Jun 2026 05:11:13 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbbaa5desm174943466b.2.2026.06.25.05.11.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 05:11:12 -0700 (PDT)
Message-ID: <0f91b335-35b8-4b71-8601-0d2c4dc53950@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 14:11:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/13] dt-bindings: sound: Add Qualcomm QAIF binding
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
 <20260605103739.3557573-3-harendra.gautam@oss.qualcomm.com>
 <3da8b668-1504-450e-bde2-b383d63090a8@oss.qualcomm.com>
 <CAC-tS8CuhED2dvne=cuTBUcrL93WXPjNB-nDUYHWNtFF9oVVjQ@mail.gmail.com>
 <7948feb4-9eca-48f2-944e-ec982b6823dd@oss.qualcomm.com>
 <CAC-tS8Af8GNQ1rq2PN6Yr-wG8_D55ddU9t77H4CUEvWfaP=Gkw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAC-tS8Af8GNQ1rq2PN6Yr-wG8_D55ddU9t77H4CUEvWfaP=Gkw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: QtbXObPtqrInaI_O6g3iAfAGoDJOxiSW
X-Authority-Analysis: v=2.4 cv=NvHhtcdJ c=1 sm=1 tr=0 ts=6a3d1ae2 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=x89O3XCtICJXY1Mg0nMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwNCBTYWx0ZWRfX2oxB/lNrryEU
 ge67qHA5E7uZA+2BnjFwZZm/E9Cz95scG+R3FIkWB1rDO/WRDeca/9wXUqOtQPhkqDDuJHbkg9h
 8AO8hdf6/J8xBUfG9BkbSvNar7AfmyY=
X-Proofpoint-ORIG-GUID: QtbXObPtqrInaI_O6g3iAfAGoDJOxiSW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwNCBTYWx0ZWRfX58conxgkMos4
 66v9kAVV56Dx5VleXMQuZgRrSaOHFb012gdj9xkiunXoO0T6L/OC+jRiCxvmDt29d7nHG+45YcE
 001F6DCqW6nF+T0We4onXy3SnbCYQomAnRb3ux/KbHp8obf10qPNbpbxqFhFDTV50Dla/MOk1c6
 jAKCvvbwvabaXYCw4LWnbMQUOTwTxuGnNuEKjcm51ulPyt/fhbVhjdIlAiiXWbnZKUzpTlutiFv
 MwtNEIsNJ6IMYSarXKKb/rL/4dYmWi1ZwIVndwmaKifz3lItiPcCzrJ8BZlDXRSi5xqnHsdSovI
 xYpLle1IYi5Kw2WOpNJ2FmRBPfqSSQec0lXmMgNhDvnym2U+cTOwLP7kdFkJrUilXGrMxV7U2Bz
 PoFbpINEvqJ1zQpyjCp8O/Hz1YQdjsxCcSXp81T9f4hqq23iFfTceWujYyK82/L8Ef4Tklb9+6p
 jBSdCuC2fpZmImWyknQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250104
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-114524-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:harendra.gautam@oss.qualcomm.com,m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE1846C56FF

On 6/24/26 8:59 AM, Harendra Gautam wrote:
> On Tue, Jun 23, 2026 at 9:18 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 6/23/26 2:26 PM, Harendra Gautam wrote:
>>> On Tue, Jun 9, 2026 at 3:27 PM Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:

[...]

>>>>> +      qcom,qaif-aif-sync-mode:
>>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>>>> +        description:
>>>>> +          Sync mode. Use QAIF_AIF_SYNC_MODE_SHORT (0) for short (pulse)
>>>>> +          sync or QAIF_AIF_SYNC_MODE_LONG (1) for long (level) sync.
>>>>> +      qcom,qaif-aif-sync-src:
>>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>>>> +        description:
>>>>> +          Sync source. Use QAIF_AIF_SYNC_SRC_SLAVE (0) for slave mode
>>>>> +          or QAIF_AIF_SYNC_SRC_MASTER (1) for master mode.
>>>>
>>>> Should these be boolean flags then?
>>> It should not be, the intention is to define explicitly, for better
>>> readability I can rename these flags as EXTERNAL/INTERNAL, Please
>>> suggest.
>>
>> Are all 4 combinations of them being present/absent valid on shikra?
>>
>> Konrad
> Sorry if I did not put details properly, I will be correcting in the
> next patch. sync-src can be external clock or internal clock, where 0
> means external and 1 means internal.

What I meant to ask is whether all combinations of qcom,qaif-aif-sync-mode
and qcom,qaif-aif-sync-src being present/absent (set to 0/1) are actually
valid and should be supported

Konrad

