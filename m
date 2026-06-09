Return-Path: <linux-arm-msm+bounces-112182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0x9RJnMWKGrp9gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 15:34:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2496609B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 15:34:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GMN71wpZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=I2PrNmoU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112182-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112182-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4694A303CD5B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 13:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ABCE41361D;
	Tue,  9 Jun 2026 13:33:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9663C416CE6
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 13:33:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781011995; cv=none; b=LDXAMbUsyDpPX+bGZvqjvNFXMXKvwBhXjpC49uqO8oSfcec1shSBen6pRXkuiiRS0iEYLSwalnmA4Nw2QgBa2jH1Xm2mwcHGBjLftLorbg5SRH8GAnElMHLx8ZxtV4n8F/0oumaMIYfW/o7x8mwr5oidd9Q2HH+rFxb/iRSMmlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781011995; c=relaxed/simple;
	bh=288anrzOO9rcBt1V1M5l8ZmKbaxYiWXZtCin4Usp3Ac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dJq/j+VB9t0oOkrLnSkSpQF4Soqhu0+BG0lxH2BJhImVGQKn+7cIssR7p9rfJIQMweXH6Zbb4SWdVDWKUbKq/jTHogzMvFk3iKKMbG7ytE3V4sdNy5UORU8j1amrjQ3SQlVU6u8WwaR4p92joGDndjzKFE0FK5+HvMs6pohH19g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GMN71wpZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I2PrNmoU; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659Cmnhc2700911
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 13:33:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sBxQ4GzhBRGOBHg0hs0l0twx3c3nO6bk1aAIhzyg3F0=; b=GMN71wpZR9byAdwR
	nucKCj3oO7n2bvEb4k3LeIrMVQ3Sg85idBWtpk++OpSIXEdjX0zcG7ILbOL1uycR
	XCuyJUfjU4uTv73q5pV09jmMSWsMa/A2+zceJ/UGKFK7A344P/uaD9QknlRZMcx3
	HM4KVGCg07cqPtO/2abMadx3xFGLfZwAnJgn1+e/40lSGSmjQhJ5i9v0EwwIxq3V
	8FhR3nw8ZZUoXdTog245AQjyXcxcbJsfNx4vpvV+wUhrbyAPcX394yWZz3bkzRxc
	73Yct+C+aOLeGjXsiLA2iBq8hREfo7fwNIW84HyB1GeK9mxpMvfvEaA8d72qIIip
	yDwrcA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeeasj5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 13:33:12 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-59eb436e77cso341115e0c.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 06:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781011992; x=1781616792; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sBxQ4GzhBRGOBHg0hs0l0twx3c3nO6bk1aAIhzyg3F0=;
        b=I2PrNmoUYu1q6cTJ3ra56/FMuPBAIKDWsAv/wfgaF3UD6FO6zeRZVv6Q6sdqMevk5D
         3ZztP833SznnYIbbmZpDoFcfs0xh0KwP/EFEyE345p1+SXq0EDGg4ho/D66v0JjV1qVg
         1h0vi78MIMx7/HwtrBlohzW7xzQgJCG6oN1qmzfPOlY1cNR7rqD2hgVSCkwD/MVVJCMu
         QMs4wJ0GXgPkF3rBADm/F7Xfi/19mQP3+ssaIeIWdnIUzk9rxitUsEAMfMsefUGS1f/C
         fOl8MQ6ClfZGQiwMasa+aXmuq0tsSr2DrUEjEnFGN0Hg+Sbr6G5PtEeHJujf9Lvcdfzj
         cWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781011992; x=1781616792;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sBxQ4GzhBRGOBHg0hs0l0twx3c3nO6bk1aAIhzyg3F0=;
        b=j4RP/0qkpEnIAwp4wVwGp69GzBgzNdWP2QpCW2RnbmJpYcsWew0kxTrgpalGP6aB97
         egfUfcCLU0LdupC/+5F7cwrbx3B2CTjVRRoudkhaDFG7G574M21aMuI5RC8ip2LyA/oA
         8eP0AQQUeAc7swd43tPjB6h7LwAsfMQE6LC/C7NvGdA/DpzrBr9HrsyqyYt1yotTCHx7
         xsgBCx0DozDMXEdKAL+21cu+8f2mDvONYhEKyo0fSMjvDOQjSR4O/04hi+pBySoVGZrb
         3U76ZXuc4lqvpSb3yrPoMiqCd1M0tCpBk/pkPtLFS8J/abNiShNYy/2Zw5D1VM/n+Rzj
         Wukw==
X-Forwarded-Encrypted: i=1; AFNElJ8wrKyeN/OQ394cmVyoUKvAMIAevZZQ9zlZ7+JTatheV0PtnmQg9tB/J0bXSJ4Ep53azbR35BlmYsIQl9oC@vger.kernel.org
X-Gm-Message-State: AOJu0YwpTTJrrCz9d3NkZd2qGPGoSTC61FelQDTY7Xyxq/OmdlbBToZu
	X56yiUZV0fz8ZVd6ZMyskUXbfLwdO9xviKvTNHY9jMFZSfYlX3TZ65eeXQtqo23MHMdc8CbxlyG
	CoiXUBfmnGcuUA7Mo/KkRy2HmEN8dd7wQHOlrrvANJ0QwfpvAgRCwAxZjednHemUl0bfU
X-Gm-Gg: Acq92OEAuAi0Luby+cCF6hCKLE0OjZCsKJrQBwNG88zL9WAI3EUjO4TIDRwcNQLwIOy
	Hj+NHHgYieFV6/u/2IzkrW637UhFjkhZTeW4kJfWnzAgzZOG5zgiNDw7SBVrUyW2ejvIQiA2ULD
	s46MMbGqsGaiglXiA5zSTq99mqu9oI4/PRfMpH/QBqOXSIbKBQEg8rEiIJ3tLK9x8/AA8jXBj3i
	0hqQThcMmbekO/CflYBdxv52yep8029cZJHATPWcrA8MDpX/W9WgFjbo9D7VfDCZ1BlePLtUioX
	diTmhv26HacSCyXl87n11/rlrwpy0yVN1jIAXlyRy5Y94qL2mKNN+Bcjx0EQ35n6ozvJLgyrmSm
	QolmnuDqYFf3r81LLnXtR13sYZOi4SnjMFGeg1oakKAcl9N1xufs98EBb
X-Received: by 2002:a05:6102:390f:b0:674:d57b:fcb4 with SMTP id ada2fe7eead31-6fefa607a15mr3062437137.4.1781011991647;
        Tue, 09 Jun 2026 06:33:11 -0700 (PDT)
X-Received: by 2002:a05:6102:390f:b0:674:d57b:fcb4 with SMTP id ada2fe7eead31-6fefa607a15mr3062399137.4.1781011991016;
        Tue, 09 Jun 2026 06:33:11 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559f1aaasm1037486766b.59.2026.06.09.06.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:33:10 -0700 (PDT)
Message-ID: <658358a6-45bb-424e-8d8c-5b0b09cf479d@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:33:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Drop fake PCIe phy 3B
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420133616.88740-2-krzysztof.kozlowski@oss.qualcomm.com>
 <bgcrs7ijonskkobvidzoldixqy5ctmvp3hdzntsvfpj4wvjfgq@inlchk3nhogy>
 <b0ec6352-164c-4492-a0c1-b29a07e5e7e5@oss.qualcomm.com>
 <dttcqv63qc6igab7zxlg27ckt3irmjnzhjgcvq6oz7ays4q2ld@be5kp4i433f4>
 <5c1f7955-883f-4fa8-a0e5-513a987bd3a9@oss.qualcomm.com>
 <0710caaf-ec73-4c4c-b6cb-7fe716724f4b@oss.qualcomm.com>
 <13349811-31e3-4658-911f-6f93d74efaaa@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <13349811-31e3-4658-911f-6f93d74efaaa@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5ul1FMyVxsfqhoKYEqNzFJtYXHnvbEAL
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a281618 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=dyzjOPN-2kheIc5eeAEA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyOCBTYWx0ZWRfX+nRUpVVQnXDB
 WCv01b8VbC6fk4vfpWB1bPWuGUC4AR7hy8fcBaINmBYdTgKK8g2RAFW5MoFGvCL8Thh8Aeu3bYH
 usS2rAYhliS/P/kBQLFd0UNQb2bb52Jilen/fGObPXNt2Wqy1w218RxU72+frwnRxmi6Onh++vB
 n6hVZhbaS8830CBaoMkeN35tzxY5/wgn46Iwtcg87rRAt0SWTV43i7LlomcFR4GQYQSxkm1xg/V
 Qt1B+HngZ5YH5opsmnEZrYxgHljHpb1InRge09JmWElGTScNm4FJOdP0mJcZqg/zJGITqhHWdrr
 CQ8pFmdTaqv2F6hq4HfmyeLWjcGXmkUVLr2uCSj3o+cH1S11fRhbMpwQHBnbXXpgwoA1PG6PqfX
 Dxe2fQVCizYQrGgdCs73HTZ9zJ8lmi0rViNGBfUPLFThyFE4gGiEOccejESL6oCN6KczgU0Mrxb
 F8ALE8Zzy2B7QCrzTpg==
X-Proofpoint-GUID: 5ul1FMyVxsfqhoKYEqNzFJtYXHnvbEAL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112182-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3E2496609B7

On 6/9/26 12:28 PM, Krzysztof Kozlowski wrote:
> On 24/04/2026 13:09, Konrad Dybcio wrote:
>> On 4/23/26 9:16 AM, Krzysztof Kozlowski wrote:
>>> On 22/04/2026 22:08, Dmitry Baryshkov wrote:
>>>> On Tue, Apr 21, 2026 at 08:41:14AM +0200, Krzysztof Kozlowski wrote:
>>>>> On 20/04/2026 20:02, Dmitry Baryshkov wrote:
>>>>>> On Mon, Apr 20, 2026 at 03:36:17PM +0200, Krzysztof Kozlowski wrote:
>>>>>>> According to user manual / programming guide there is no separate PCIe
>>>>>>> phy 3A and 3B, but one 8-lane QMP PCIe Gen5 PHY which consists of two
>>>>>>> 4-lane blocks.  This is also visible in memory map, where the 0xf00000
>>>>>>> is marked as the main block with additional sub blocks for each 4-lane
>>>>>>> phys.
>>>>>>>
>>>>>>> Describing the sub phys without the rest is not correct from hardware
>>>>>>> description, even if it works.
>>>>>>
>>>>>> Is this the case for the other bifurcated PHYs?
>>>>>>
>>>>>
>>>>> There's more? Oh damn...
>>>>
>>>> In the previous generations. I think Hamoa had one.
>>
>> Any PHY with a name ending in -A or -B. That means:
>>
>> $ rg 'PCIE_.[AB]_' drivers/clk/qcom/ -l
>> drivers/clk/qcom/gcc-x1e80100.c
>> drivers/clk/qcom/gcc-glymur.c
>> drivers/clk/qcom/gcc-sc8280xp.c
>>
>>
>> And, quite predictably, some PHYs may not only bifurcate, but also
>> tri- or quadfurcate (on Nord).
>>
>>> Ah, I did not check the others and there is little we can do there -
>>> it's released DTS. This cannot be easily changed while keeping DTS
>>> compatible with users, because probably two PHY nodes will be replaced
>>> by one with different compatible.
>>
>> I think no one utilized the non-reference configuration of those PHYs
>> in practice. Should a device like that come around though, we'll think
>> about what to do then..
>>
> 
> What is the resolution of this discussion? I have impression that no one
> objected to my patch, so maybe I should resend it?

Qiang is working on a proper solution to this. PCIe3B is nominally used
for a secondary NVMe, so on the occasion that someone has one inserted,
this isn't really a huge loss (the Yoga laptop and the CRD both have
a primary NVMe on PCIe5 IIRC)

Konrad

