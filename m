Return-Path: <linux-arm-msm+bounces-93286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Hw1KIK/lWkfUgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 14:32:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 335FD156B30
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 14:32:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9650B300748A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 13:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99AF831ED7C;
	Wed, 18 Feb 2026 13:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K9RUELf5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mlam3o4k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7E131282E
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 13:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771421567; cv=none; b=h0idRATJFYk8rFxhbSm2mx8NKAfMm4nW0xeQePkSaILAmVmVkmhlgWsNBujqEySoEdpYfnhaCnmEWhSyKXwtoSJ4X7KLD4i8O8Z5sz7oAGGaH9i9eCG3uJhjEexGyAd6LS1SbEMzQ6YRgnkmw5O/AmED4ARdE8QC/sljlf3e2Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771421567; c=relaxed/simple;
	bh=QedJur50/g6zcxoZnzhwRn25RyISmPBtgycbNB4XN0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mAZ2PBOBrTcTrhNMyzTOfQLK/Rct4LYm3V5J/PbxaJgSbRtd6ulTO2jXofQWXtnWZhDhYNoe4RikBdS6gsJfkzBtRBEI4VmlGtmJqiAzyaVxIbLoe5m8hNJ5Gu+XgcBTEv6otZtKYQu2O3nlnOBxU7R5574AyBW/b02eMDh4rJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K9RUELf5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mlam3o4k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I8XA983379848
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 13:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BiLp20Q3kkEwTZ8fNKmZyNSU4zyYxn1pttaJh2zFj0w=; b=K9RUELf5+j59icvH
	CCmI2iU1nfwDZIJnFK+IzPEpzotxDD4PbnH0kq0lfD4TY8Fol6HhHO2aTuKfWbIV
	vHK6Hg6JoX5mNqsv2D5BZQ5DzvtJ6w7mESqceeSo6gCBIuFUr7iiJNMl5rZ+jKN5
	/3uy05nIcvaqANZD+A0BUz67ZACdiv/+ormMmT/fgKtmW33Q6imRkUcF7dPsBFaZ
	uN+81kWFLkYs6jFyI6uWXylInqSaQIcLa1lOBRP692NX9PlHHE6MgtWfj6VvFonm
	YyCnX/YzjtS5ZSGNsgRMMc5ozbF7gRmsNkoFBPSafF0r854ypGER4Fra12vs2x2j
	1PZOZQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccxnyjfxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 13:32:45 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-895375da74bso37941356d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 05:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771421564; x=1772026364; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BiLp20Q3kkEwTZ8fNKmZyNSU4zyYxn1pttaJh2zFj0w=;
        b=Mlam3o4kozt8aCKuNjGR4GXAYZlhX3UWRxgAcEKhFQJ9nH6VVLrkLKoD/nw4Gh1+L2
         ESYy1xer4ng7RrlsR43bkvLBR/O+XvEH4IW7W2tv0HO2duLz377VCiTpIs4TUE0MPWEg
         hyNgZ3zrffjJ75L4KLsYrtK6LlpVARf3Qiu72TI5P6maivc25YmPmXkKJofkOY1vrN3Q
         cF+9qoT0dwDH19PLO8C7P3XCOwI45aquI2z1Njitf86E6fHIy+tlz9vKZYE1Fxt8pmSI
         R+QCKfvqi3uL97/+IOv+Ua8jlTjJkWETHu18gwyn0+rLFsJALNZc2XV6FH5tdFKj+Lgq
         uvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771421564; x=1772026364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BiLp20Q3kkEwTZ8fNKmZyNSU4zyYxn1pttaJh2zFj0w=;
        b=dUUtZTZPauUm5Fc1mrz2edo72n4MWOaIWQbr5YoLmAXDmPj6gZUebfilvfkxCvka6L
         xFKXPzUarzXeMsTEIFycyekNiX8Oqdo8w21+1NitMr3ZVTVfwC1yePyaVaSLyQaHmYh2
         tubem/jZo4AP9ps4uMxIonh4epWLiRK63y/eEB2PgaOrZkoj5FkNX0zUj2DDA4m7RnpQ
         pm4pFkxpeppTTB3MFQpZ/tw0DU0ut9qwxC95xQwkqJnG2R2zoyCF2KnjxOUTibYYHbEm
         m1vuyfQBV9uJ52462aeE56Xdsw5AmdyXVshSsEcbput5ZCckfR+PQtokie/MmXKVqTGO
         iZ+A==
X-Forwarded-Encrypted: i=1; AJvYcCX+v+J6xs2IEKrFE4ubAPsmnZCAD7MrHtk4OGgVhYa4jlL5RBj8SN23JDFLlEDlCaP8+M/eSxRETcfsVfC6@vger.kernel.org
X-Gm-Message-State: AOJu0YyNwsu95WC7Ikz5oF2ST5AReslKpQTGLMyfYzlLMNeUb0YcF9oF
	UTOFNxqyrmpwx6yyeY5j7Rj058HLAZ6M9hbefySEuGbZFTbwn08d999930INOLLnN11wK+n1F6U
	fgNv0l1Jw/VE8GVde1AhwXsiwF3nh0g8p7uA4sahajZEoLXOubpzdqIznjCLstOcAcNCD
X-Gm-Gg: AZuq6aLscRO3eyzIsrXe7XPtNbzwy1bTINd/11VQYokF58ddZ0TZcoWvMU7QiHJeIwh
	Xx3FKnAKNL/h+xVXuEmEc50U25sat8GX7tkvRSvMPo+0G4M3pkaX2c2QJ1RF9gcWAmZVDZkx41H
	on9ZpsoXHTFN1T/3BruYYkUxIRo+XCvdi5n/1FwbHHs9ZYhkyd4LqO1aYvjfxeJoE7lfH5uLEpi
	ogyPE65v5XskviZJZ9zKInPrY3KzljtZTfJNVhGjSWJGxg1OFlkWj1OaoZIgmpsYvc0fJyjCFow
	4V0aykJ8V+/UQR8nKhhYI6GeYqb4JmmOppgATq6khWL8PDLNu1Gqj2VEVw9cz9OSU0G4FOgXSpF
	8ZaxaJnXiTmO9Y3zYMAvkrY/L2kFEct3tAnRX3+61mgw2a4wnEZs/bWseujk4zDqXzxb96Uhbry
	3OCr33XiS0jSpirw==
X-Received: by 2002:a05:6214:4f05:b0:897:1d50:2336 with SMTP id 6a1803df08f44-897347ccd64mr191548816d6.6.1771421564478;
        Wed, 18 Feb 2026 05:32:44 -0800 (PST)
X-Received: by 2002:a05:6214:4f05:b0:897:1d50:2336 with SMTP id 6a1803df08f44-897347ccd64mr191548556d6.6.1771421564012;
        Wed, 18 Feb 2026 05:32:44 -0800 (PST)
Received: from [192.168.0.242] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc73f102dsm446535266b.26.2026.02.18.05.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 05:32:43 -0800 (PST)
Message-ID: <ac568d38-adae-4fb6-8f12-1d3593d9843b@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 14:32:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 1/3] dt-bindings: sram: qcom,imem: Allow
 modem-tables subnode
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>,
        Marijn Suijten
 <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260217-topic-ipa_imem-v3-0-d6d8ed1dfb67@oss.qualcomm.com>
 <20260217-topic-ipa_imem-v3-1-d6d8ed1dfb67@oss.qualcomm.com>
 <20260217-godlike-silent-owl-0a8487@quoll>
 <36f0a71c-a8b7-4aaa-81c3-1945b268c57f@oss.qualcomm.com>
 <0bfcb292-4e49-4047-b631-dd3029b43f1c@kernel.org>
 <193d236b-864b-45bd-b0a9-6efbdccf6db9@oss.qualcomm.com>
 <9bfb4ef0-49a1-4127-aad4-2ba1b9dd8e95@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9bfb4ef0-49a1-4127-aad4-2ba1b9dd8e95@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7qzpMNcOh5UO-j4uOiYiI3aCCdZ3GGDD
X-Authority-Analysis: v=2.4 cv=Do5bOW/+ c=1 sm=1 tr=0 ts=6995bf7d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=ZflIhQ0aK2eKklpQHNMA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 7qzpMNcOh5UO-j4uOiYiI3aCCdZ3GGDD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDExNSBTYWx0ZWRfXzLlNViqrf8Sz
 0WDnREL9/NE/oQ7+OirQR8naKdYwHY1zsdcCVFBVa27UFi89+LGf4t5JR9n/JohEaQ9sW8N7H2A
 D881fIYGui5FFe4IMEVQyql9eH4HWCkMCQDBJ1XdXMGKkOtSKKxK+QQ8z3Uez1Q67YoURTXsAuy
 1erobtpSzuoACYoQvEtqyqxF+DEybAUjXltQphQFY0S2LxfNNghZCIQdlHA1ucdG03WUg+16rVG
 UHusEYWQYkUFLXJtVhbE5W98vJjUQwCJsWYb3ux6USr/GGmzTpfB3s5IE4HzmrtFo66KaZrnBOn
 rsBGxCUr6TwUgqHkvYhaGF3ksmsa+LF6+6tYECqzLcWcCuepZ98T3wkXA/a2NACv5pYCRL9Mwyj
 Llp0KFvbDbTvNeJVteWVmooq/5OjbspXDSi7oIy9bbbNDzUGAysj+7eM06WD9ip/7zfTk1V8Slb
 vTlNvjLsE/pz7rhVXuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_02,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180115
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93286-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,foobar:email,0.0.4.210:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 335FD156B30
X-Rspamd-Action: no action



On 18-Feb-26 14:21, Krzysztof Kozlowski wrote:
> On 18/02/2026 13:26, Konrad Dybcio wrote:
>>
>>
>> On 18-Feb-26 12:56, Krzysztof Kozlowski wrote:
>>> On 18/02/2026 12:05, Konrad Dybcio wrote:
>>>> On 2/17/26 9:25 PM, Krzysztof Kozlowski wrote:
>>>>> On Tue, Feb 17, 2026 at 02:30:31PM +0100, Konrad Dybcio wrote:
>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>
>>>>>> The IP Accelerator hardware/firmware owns a sizeable region within the
>>>>>> IMEM, named 'modem-tables', containing various packet processing
>>>>>> configuration data.
>>>>>>
>>>>>> It's not actually accessed by the OS, although we have to IOMMU-map it
>>>>>> with the IPA device, so that presumably the firmware can act upon it.
>>>>>>
>>>>>> Allow it as a subnode of IMEM.
>>>>>
>>>>> You do not have compatible, so rely on the node name as ABI, which is
>>>>> fine in general but... I do not see usage of it in the driver. Why do
>>>>> you need to define modem-tables child then?
>>>>
>>>> I don't really *need* the node name to be an ABI. However, the current
>>>> binding for IMEM only allows a named "pil-reloc@.." subnode (which is
>>>> consumed via of_find_compatible_node() in the remoteproc subsystem) so I
>>>> figured the intention was to keep the list of allowed subnodes strictly
>>>> moderated
>>>>
>>>> If you'd prefer a blanket pattern declaration with say '^[a-z]@[0-9a-z]+$'
>>>> with just a reg requirement inside, I'm fine with that too
>>>
>>> No, the problem is that you do not use the ABI here at all. Neither
>>> would you use the blanket pattern, so my question stays: why adding ABI
>>> which is not used?
>>
>> The subnode I'm trying to introduce is going to be consumed (via a
>> phandle reference) from the IPA node, as done by the remaining 2
>> patches in this series.
> 
> And that's the problem - I do not see consuming child. I see
> of_parse_phandle to sram node, not the child.

Ah, I just realized this series has no DT examples..

The property I proposed to add into the IPA node&code is indeed
named 'sram', but my intention is to pass a phandle to the *child*
(similarly like we pass a phandle to the child of a nvmem provider
rather than to the provider device itself)

i.e. the design I envisioned is:

imem@foo {
	...

	ipa_modem_tables: modem-tables@1234 {
		reg = <0x1234 0x1234>;
	};
};

...

ipa@foobar {
	...

	sram = <&ipa_modem_tables>;
}

Konrad

