Return-Path: <linux-arm-msm+bounces-93237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCthKSbplGmSIwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 23:18:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B96B151656
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 23:18:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D833301E3F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 22:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB76A30BF63;
	Tue, 17 Feb 2026 22:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mU0BSUwY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XngxxOjx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D84139D
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 22:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771366689; cv=none; b=okpEo5LEYTx7uoX21YPpsOjCIjtzJAxn0etUx7njLVjVxFYjjxbX6vmpvJrZVFy9bbGR9rYZ8bEpbruAufhI0+GicxoqEekVIy65JseFTOLQYfP1tRWcKFMpJpa4kwW0Fq58YE2IGudIIaBAxd0NSSbpqZVFMZxaY1937PjUoCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771366689; c=relaxed/simple;
	bh=SXpSx7WMHtVORUj1JyaFxGtu4f7dFLYpyqZ0r7psjnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lhVexYGB/8CdQ2L7uhzL7pw/f3hpKSK+3EGwTzA155h9C2V1y1CRCKCH1LZsnAmj6GixxWmoPD5ZudLgljG+dPFpUyJRkEaKzkQlz0+9jA1Hd5KynIjDhYo07G2r6NDT/tJs9a7EhAkXamRTlCNjXNxDS7mdOUdu4K8qJ88zZiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mU0BSUwY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XngxxOjx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HFUEhN2319813
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 22:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0zJ71lGN85nLguALAwGHbmGb7XD2DILMpKE2Y/7toqk=; b=mU0BSUwYV6csZlT9
	Phg/pYNy+yMBpy8t60tP/Cle4dGUtgSJsv+eivoeYj9d0qZF5BeXwwPbwGmoTv3r
	GDmqltCdSBiVBoHxIGWonm1Snxi2SUJvEYPgGWm0i1dLZnxRs6GDjtnlHbe6djr4
	Ni/GNUyv3rDQa979YxZgexxglatJQcAfCt5DQzeJvSGnck3XPKOI4VDFS7DUIZn5
	sTxOK3pnomqIGOLCmj3k2/336I3AuZHvoE4ZvAdUcMoDpbAhP+ONEtlG2j5Ba0DP
	oupAD2s9iH7kR+hnKtPUXsd8U+C+4ZkWngdft/TTtB4M1TlNksJ4yVgYzNCxzxhe
	iGvA6w==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccu1esaax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 22:18:07 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-124a95b6f61so11847399c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 14:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771366686; x=1771971486; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0zJ71lGN85nLguALAwGHbmGb7XD2DILMpKE2Y/7toqk=;
        b=XngxxOjxR9bQanTuo6o3MqoW8AFvW30FAuzWph4c/2KwegWaFYvU7nH7Io6u1RfDq9
         ytpmWxJXrO8X56zbsbKQD30sJCI/Ha3wj6S1wC595vJvXAGALn8QYzFK2SghnYGi7c3N
         48xm8OOVVS74KNenaR3Y6bYW+zM0VXLyQq1P+YRRpbZX5GG4yOXwns2n70O8trPF22nZ
         fZJw0tc1UKU88wCstQc1zEfT1s5RiER522ljS+6tfgWred7CKaci4vR2sV5yZ3DWVlCQ
         AXiWdTwiRGzvKErwcP57GO0OLy50aT+ylcg/4IvcsxyqBMRnR8HOlKCPv21TMKdGmzq9
         tOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771366686; x=1771971486;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0zJ71lGN85nLguALAwGHbmGb7XD2DILMpKE2Y/7toqk=;
        b=bw1ppt1XSt2NssmcsrI+HE1rOVr+RhbgY7eQrVoJFhogE6NrPOBnjPi7LIp0lwCXCY
         XgBUKcCcM9sGVLKpbgR1lSvSa6vOC2JDTLrrYz6/S4pbQfRqn+FoYdToOxIaFOyTpn8O
         +OYkKJkUKC4+uFYfapzInHm4dI7ysGOMtKtjWPwWy8gYELt4iPnXm1NVlVgj/6E/eCgT
         GqKHLYQ813R6MevJ/RfSHj+QGhc34pjqN2LCgJtB5PAKdsUTUpC9+Z8KJx2sA4TdNDG7
         sWrQVErF9NwVKvCeho2qnt3vwBZPBH9dQ55FsBMs1gaY9c0xx53GcF95pyITuZ+cZU60
         uYlA==
X-Forwarded-Encrypted: i=1; AJvYcCV2RnrXBDf9pywJLpcwW31joG1SB+YS3fVsSPnMAjfHUv7erJZnoOpynXLk+dG6ejOfRO0DHLfTQmEgmRHr@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp3uKRfAfOzBGysV0/pglN4My/Um1E/sKtTmA85fJtqUcivlxv
	7Zdkadq0XfAnCJacpetE/PBbUGz076s6RbwDy/atktjIkjmu/OOp0o7LFXuM61jqJo5T/R6Ce8r
	cu0q8GxpFPTV4krYQl7OG5Vvf/GEOL62bG8EQ5GZqJf+0MeeW31jnr2/K4/JleAAAolYt
X-Gm-Gg: AZuq6aIaoL8GEygqCHSr6Ilvi/mUmzVMzUBJGUkxtyod4pI1ZL1+mazvTOQRk7t20tZ
	AJHhT1ibVH10lT7EO69X5bZUbNGG1ggHU8QxtZnCCTfqR/2FUFhbg4N098KiKkJzA+Izi+8eIB1
	Ddu4vdqjDWz3jXVSTz8OeXutwP1uc300o+BNYE1LXKkyOwV54ecPfBP7edLL8uzaitcj/T3e4ly
	BsobTev2TyB5rLzWJiBzw8mey21QlfndEZPV39XEFE3wffN+r9pzhHb8vVPqTLlWJFO+yY6r3+V
	1DOiWurNMGGx5UEo36/HR6WGy77si8SBGLu755ydddSeVGgV2NYOZ3egq+gnk3nG1RabpWpsPdi
	VbTKKSJ+QPDEd777VGhgBG7aD68H3SjtjZbHcotmJ23tB4Isr6Sxb6HJ3/UFe+xngHpY1343Cyd
	k68w==
X-Received: by 2002:a05:7022:a91:b0:119:e56b:c75c with SMTP id a92af1059eb24-1273ae80e60mr8137336c88.33.1771366686311;
        Tue, 17 Feb 2026 14:18:06 -0800 (PST)
X-Received: by 2002:a05:7022:a91:b0:119:e56b:c75c with SMTP id a92af1059eb24-1273ae80e60mr8137311c88.33.1771366685754;
        Tue, 17 Feb 2026 14:18:05 -0800 (PST)
Received: from [10.62.37.112] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742c6430asm17279170c88.6.2026.02.17.14.18.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 14:18:05 -0800 (PST)
Message-ID: <b3e76e9f-a820-43ee-9089-7b7eaa876ebe@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 14:18:04 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: media: camss: Add qcom,sm6350-camss
To: Bryan O'Donoghue <bod@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260213-sm6350-camss-v3-0-30a845b0b7cc@fairphone.com>
 <20260213-sm6350-camss-v3-1-30a845b0b7cc@fairphone.com>
 <W3evhxwcLQLbkKftGpGmJ5LaEO_h3nxsWSSzrthlfatPfO60KrPpbyaq7yAu1vKbQc0RLqsaCQhTPzRruNTg_Q==@protonmail.internalid>
 <20260214-slick-ringtail-of-innovation-d8eecd@quoll>
 <f5869002-1b42-4164-9f14-2ee41f5b1496@kernel.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <f5869002-1b42-4164-9f14-2ee41f5b1496@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LfsxKzfi c=1 sm=1 tr=0 ts=6994e91f cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uS_WSclN8nCJ1qZK6-wA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: lP77EpFoZ1hWMU_odz6kyjcHViCjJve6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE4NCBTYWx0ZWRfX4w2Ubad4tv6q
 FuQIXUZYu8qjnUjocMtTTlAEDuQgnuboppZ50CBROXjE+JuoL2PdnG+tT6qm6d2lvUwPd0/DyYW
 zLmjnbN4eN6iijdDWi+W0cLVeqW0F6zgkwDMRAoNrsLUwkh6FlFvzEfDDJRVdtpwwshgmZv6jc8
 vdruMDoCI1AoL0urAyD8DuLywSZVBVXKUTNae7/4Livz8w38QSITRpJWwa3DM2B1bTbZQGpqj7P
 I5duUKrk+rabGH19Bmpz9ExEdhSx/37MTt8a3h+vazSMI6mKrRaepBSbbHY9KmwL4iNO0HGvDRw
 +b6eVEekawkr4E6aofgMarIWqBYpeNbb98OaEcdC6HS0BTKlmfV59fTWnzGdHdDN4e1gvX3vKfc
 6oF0TSwupWYr28XlXdTNDw7d83M9qLTQd/LE6U0VJtsS3hB7/gWR9rn0RKtFPKoNuU7l3v+F9OG
 4g83VKdEDmNKi1LEVGg==
X-Proofpoint-ORIG-GUID: lP77EpFoZ1hWMU_odz6kyjcHViCjJve6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170184
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
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-93237-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,lists.sr.ht,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijay.tumati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0B96B151656
X-Rspamd-Action: no action



On 2/14/2026 5:05 AM, Bryan O'Donoghue wrote:
> On 14/02/2026 08:37, Krzysztof Kozlowski wrote:
>> On Fri, Feb 13, 2026 at 02:15:01PM +0100, Luca Weiss wrote:
>>> +  power-domains:
>>> +    maxItems: 6
>>> +
>>> +  power-domain-names:
>>> +    items:
>>> +      - const: bps
>>> +      - const: ife0
>>> +      - const: ife1
>>
>> ife0, ife1, ife2, top, bps, ipe like in sm6150 or sm8650.
>>
>>> +      - const: ife2
>>> +      - const: ipe
>>> +      - const: top
>>> +
>>> +  vdd-csiphy0-0p9-supply:
>>> +    description:
>>> +      Phandle to a 0.9V regulator supply to CSIPHY0.
>>> +
>>> +  vdd-csiphy0-1p25-supply:
>>> +    description:
>>> +      Phandle to a 1.25V regulator supply to CSIPHY0.
>>> +
>>> +  vdd-csiphy1-0p9-supply:
>>> +    description:
>>> +      Phandle to a 0.9V regulator supply to CSIPHY1.
>>> +
>>> +  vdd-csiphy1-1p25-supply:
>>> +    description:
>>> +      Phandle to a 1.25V regulator supply to CSIPHY1.
>>> +
>>> +  vdd-csiphy2-0p9-supply:
>>> +    description:
>>> +      Phandle to a 0.9V regulator supply to CSIPHY2.
>>> +
>>> +  vdd-csiphy2-1p25-supply:
>>> +    description:
>>> +      Phandle to a 1.25V regulator supply to CSIPHY2.
>>> +
>>> +  vdd-csiphy3-0p9-supply:
>>> +    description:
>>> +      Phandle to a 0.9V regulator supply to CSIPHY3.
>>> +
>>> +  vdd-csiphy3-1p25-supply:
>>> +    description:
>>> +      Phandle to a 1.25V regulator supply to CSIPHY3.
>>
>> I assume that we abandon the idea of separate CSI PHY devices. It was
>> discssed way too long time ago.
> 
> No just waiting for 6.20/7.0 to drop however, I think its fine to add 
> new definitions until we merge that series.
>> With domains changed:
Please correct me if I misunderstood but if we are not blocking the new 
patches over PHY node separation anymore, can you re-review SM8750 
patches please, Krzysztof? Thank you.

https://lore.kernel.org/all/20260119-add-support-for-camss-on-sm8750-v2-0-3e06583a0a81@oss.qualcomm.com/
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> Best regards,
>> Krzysztof
>>
> 
> 
> 


