Return-Path: <linux-arm-msm+bounces-102279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAa8OpMa1mkxBAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:06:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5544F3B9975
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:06:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27912302D94D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 09:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E3733AE1A0;
	Wed,  8 Apr 2026 09:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gKrzuphq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YwrXricD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BE73AF64F
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 09:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775638993; cv=none; b=QO5vTwB39cOZHOJeP9X9bSNvuFqrjLl/9f8078cjJ8NT+GqbQWmbAHeqAvBPduz/j2UcOAHGbNC7tLEh6VNUfNqJOxA8yHiLpD9QUea7UdGLSCbUFVViaJC7Np25wBxJaiu4p1DRzyqjpGubjfwn2MfFarD/vTvZ8KbP1uOCrAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775638993; c=relaxed/simple;
	bh=gULgy08GuVtnEX/1U1nxlxTorejaJpMVHnRBzDCCTnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MXcWt4V9VtXzDchPMkQJOEQ1TDhdTp4dy4r4L1Ts6bmxCtUn51RWEiw8sah83uCGl7WgewguMfdTVnYx1kXk5QmPTt9Zg/NPQfhjteVvEpUJdXbk79eXxpjtzSnLcvdKlxjZhiEWCzYuuXM3Dsxck7d6JptVhXNb0VZSpcIoLBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gKrzuphq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YwrXricD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6387Ge602860429
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 09:03:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ZqgvHTBiN038+jPEjFDSBUg5iZOFIWHNcBMTW5PupA=; b=gKrzuphqrivrFHbD
	MMCUNTHPt1bzefM7F6O3lWNeosWaUGrPjdpxkNLxjDyrpvsicm1GWQrcPhCMKarV
	LpvVClLgyQ9ykI4U3qahO845VrUTKXAS9v/mL/a/W0kU3JwSeJyrEsTPjNz+mmf4
	TZevS78ZTJLmCO6wuXdgrcx/TxTw+Og9KPuBqN4Fa8fZfFwu78Ld7Pz9NGl3aH51
	he4ogq6ZUZz8SVYfnIinZJ6JKPcrLprDC6upzAuAUQsQ6F1FQf2KHuVDfMUja+3q
	/RVWY3QB588stWn7b9RXBV0GijrrceTAJYephP0wlRbVZTRhE6AngqwW1JGoVqwS
	o7qbdQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddad8sxu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 09:03:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8e4c29caso78979711cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 02:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775638982; x=1776243782; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ZqgvHTBiN038+jPEjFDSBUg5iZOFIWHNcBMTW5PupA=;
        b=YwrXricDaite5U+NKqKrhE/r7WPwFQRLgPRNlGvdiHysfICfyL+LPF6VYNNDDlXosf
         c05Dz2MU3alnfiwccUykcjYE73EacX55uzORBplcZcNuJV8JFv/ODqKv/4Kp4goP1YKv
         VbA+9m1rApxdE39buvfbOylW3DP5p8uCgAyAWvfHeWYZQW3Z5cGqlfBFgDAbmNjVW77c
         FxdvuWISlzxWlNPeOZDpP1CN3FobJ+6zHbhYpSIgPzeaQV6POZkYIv6glOQrgkBpTH4a
         o85WRHcov+ZD5kdIgADMCkRzfnti7g9INC6cas9stftyydL8yXu6WsyNmLesJDiGHM3b
         Pt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775638982; x=1776243782;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ZqgvHTBiN038+jPEjFDSBUg5iZOFIWHNcBMTW5PupA=;
        b=L6nJPJPfPh3gy1GdkAntQ0RxFZGk7ZUGELffVnmpD3f7quXK0HfClbDCx03NpUenQR
         UILZBsFQEL+fWoUCzzteXNFCwQV4YiDONJGknu+iD8KTaanX7WurrvIgTvJOfAU5uLn/
         OAiQ8K6AoS4Gc4bD38hPRje6RER7K74fSEU50Zr4diP5sM0j6VdTFX7VEn+6S82yqjVV
         +0FqEqUJwK8LbYIL9CSJtO+2N+gjLkKPpZIydPvszSfl0mYX4bJeUZeC9ytfD00oD+TD
         8aYOslb+6XKFkTw6hu8ox4WstrjkKwCry24K8TEoDnuNCQOgg3LQ/l3FWHAs7V9zArv6
         nBsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5CgpWfc1+UF/OMXH7Hgh/52+PVoxCBCLd622EVJNIvCfpOm5OD0FxNaLwNJMDZcsaehESJTsmskcirLVJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzHM3AujZxOLu6utuheRwpTRMidszvUUtGiaK/oIjMqao9+PJa0
	BbqsKGt8uQzakV7eI8s/1WMOynv1GKBZ6ow+4rGQaw6Oe3IMlqXJhqKn0fs9cvQMsDcIsNo49IS
	SQGvS4PWXydcWzB2F55om6l4jQtnwMcbFEhPgdMyKK9/kkMwxRwtCyBarSXGkLAcf/St7
X-Gm-Gg: AeBDietVoZ/a9WVJrckZRsVeSqKQ8p/XKSJQ6Qp4D7Zi+V6HdaIwOwMuaIUiX8ZWwVZ
	122S6PMJihUc1WowAg5ZrS2zJ2NTiTmiXw92Z7KAbTGPeHnBtqSTABRyjrAfJrg3A3WZk5+HkYd
	VUGHD2Y7SJF8sL6n/7v0GVV6Zzmr3RBXpwT2QAb4cQfa7QkHcybn/AN/k3jhcLdqKgUiIk12891
	cYrTZwfiuqN9KcvK5p+J3ORAOsmo9nS9Jeq0pMNDRCDV1NK61LHtN4jdK2Xw9YNiq9/636KTcPB
	qBJGRZ7XMuqIkof7J8UspFXoxjByNbKQzqwSUuZrJ7cMPv8RvCemLGmRYs/+Qo7r2Ndh6BN72T2
	r3py1q9Rub3gKeR3/dx09JbzbgpVK5oB5UpeKye3T1LYVoQ8w
X-Received: by 2002:ac8:5894:0:b0:50d:5a11:1a8 with SMTP id d75a77b69052e-50d62b4fd4dmr298322351cf.25.1775638982218;
        Wed, 08 Apr 2026 02:03:02 -0700 (PDT)
X-Received: by 2002:ac8:5894:0:b0:50d:5a11:1a8 with SMTP id d75a77b69052e-50d62b4fd4dmr298321971cf.25.1775638981725;
        Wed, 08 Apr 2026 02:03:01 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488b64f03afsm185416715e9.0.2026.04.08.02.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:03:00 -0700 (PDT)
Message-ID: <8b51e84b-e922-4c88-a5ec-b8c416efe607@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 11:02:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco: Add default GIC address cells
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260407201518.24949-2-krzysztof.kozlowski@oss.qualcomm.com>
 <4de63324-2f66-48ca-be1d-e8f20e8727e0@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <4de63324-2f66-48ca-be1d-e8f20e8727e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ye8LRdUpJIgbS-uv4m6jzyWvoAw2uGJZ
X-Proofpoint-GUID: ye8LRdUpJIgbS-uv4m6jzyWvoAw2uGJZ
X-Authority-Analysis: v=2.4 cv=EoDiaycA c=1 sm=1 tr=0 ts=69d619c6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=uyoRorU-4dmQEGRNGjAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4MSBTYWx0ZWRfXwmu4xoeALTA9
 yxx/JM8hI9Mw7PGvUQC6eOjepAqkSOTG5hWzk+QcdQBrBuSow2EMVelUq81oohmYMYzRM897C8d
 djmmbdNNPXGr+M5nhrqBJa9FTiTP0VcA7j535SPAzgoO270CeRSXxL7xOj2fKYROczZMLfbPZT/
 LCAXIjQDASbZpOWvMWEfp3oG7Wrj7KTZlezlsCblEtBlOBW9JKHS/7oegJPXr1f/XP23g4jOnni
 03EMkOccNZTud7w5gL7szy+WXE1eBXEFFQsAVGtLODiIwrtfps5MQGewD5cGhAar/QIOvcn4o70
 s5eaimGPMffYlB9Me0SOyOJB/Rm4AX+MAGWBu4XpGAbauyCQgG2PqA4j07+QFdcnGx+eEcaY3w9
 Fw6kVC7uClmhAwcI+34iSEx2kkX8ytg5a2CtnePuliMwJRdM755YL26O5R8llecwU6/3oBDMln9
 ptk56wNdGjx4osf24tg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080081
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,1c00000:email,qualcomm.com:dkim,qualcomm.com:email,17a00000:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102279-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5544F3B9975
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08/04/2026 10:56, Konrad Dybcio wrote:
> On 4/7/26 10:15 PM, Krzysztof Kozlowski wrote:
>> Add missing address-cells 0 to GIC interrupt node to silence W=1
>> warning:
>>
>>   monaco.dtsi:2326.4-2329.30: Warning (interrupt_map): /soc@0/pci@1c00000:interrupt-map:
>>     Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>>
>> Value '0' is correct because:
>> 1. GIC interrupt controller does not have children,
>> 2. interrupt-map property (in PCI node) consists of five components and
>>    the fourth component 'parent unit address', which size is defined by
>>    '#address-cells' of the node pointed to by the interrupt-parent
>>    component, is not used (=0).
>>
>> Fixes: 46a7c01e7e9d ("arm64: dts: qcom: qcs8300: enable pcie0")
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> ---
>>
>> Fix for v7.0-rcX.
>> ---
> 
> An alternative change would be to describe the GIC_ITS

Yes, but that's pretty different goal and requires testing.

My goal is that code people sent is without warnings :/. I wish there
were some tools helping in that, like you run a command and it tells you
if there is a warning or not.

> 
> but for this warning fix:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


Best regards,
Krzysztof

