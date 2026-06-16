Return-Path: <linux-arm-msm+bounces-113439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kcvhJcRbMWr5hwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 16:20:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F31690697
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 16:20:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aR8e4pR9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eUgaf8K1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113439-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113439-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 811D0306C8BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01BC343D4F6;
	Tue, 16 Jun 2026 14:12:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC6343D4F7
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 14:12:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781619132; cv=none; b=qyyvizaLIULFCKd5VL7g8e/7JsYkD0hbCDD9xBTOHraS/YkG9Znn3XSc7av0qOsr5GMb/rlSyCaKwonO8ZpgsPx8PRE5wb08v7UMr4lKIrig8a6939kDkAn4BpT8Zj1MVbAQy06hOAEht2aq8xtm3s16mGb0ki6/3Bazzedxo+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781619132; c=relaxed/simple;
	bh=x8yUfoFxAhFDRRTit9rI8yq1i0xp7HebowNy8+VsCYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UF4djso9AIfFhOdMhUr9aq7BMPAujKsmVVjIHgHC5ZKr4czygjpJxKZTLt3oqk9NYqd3vjZluyNQw7G8Wzdf/GSHU5I4cLwjecIrKsddAsiEA4DHBITRw71scHTwSs1wwxLFHLowGKnTB2/4F3xMDymSeUImEiIcU7IK0Ei2KwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aR8e4pR9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eUgaf8K1; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GDxmj33985563
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 14:12:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZNKddDCUUUEc5ctuxhNZJ1Zf0qD7W5gI4Bn6S7GosKM=; b=aR8e4pR9e2/VkYxN
	4kR47l7J4EwdQ25zsKydqm2Sf32Qa1+lzPsRyA76Qaya007y8eUI58+9AFn8Qk8K
	yj1Mh3xo0nP8LLnmgpKFIa2AMam800PN2VeOobtlh5LmRGdfDWMIQ1IyD26WJR9Q
	pt5M3qGVQiTxTmBQX3lXTAns1yf2ulBDiZJ4K4GR+uU164ZqFdQhaIe82rjo3715
	p9P4XhDqGfh3ymsIY7NtQ54V5+78POHI4oaUM8QTvvP7o0KvpIN5SUk/nmajRpR/
	4EPSqxpd25YnjfuEeBNnrDDkFVQwYV9W3OXM/b1sstcLQVMt5K8w6OF5ettMDXEA
	xXlpXQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ety52th9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 14:12:10 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-966d1aa6688so20083241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 07:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781619130; x=1782223930; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZNKddDCUUUEc5ctuxhNZJ1Zf0qD7W5gI4Bn6S7GosKM=;
        b=eUgaf8K1uDckH63M9yi6YPpVLNNAWGGLRWXhj3/pjoI7nz1714Z/aYMlMi+VCtKN7L
         zTabLasRESRdOWufiu3/bOCeYUNBlzjGwQVKGhjm7bu+jagyUWQ58uVQcEJt3rw66md9
         xK00xPrfVNKI8rNZYhrGxktHcFpdZWdyc3wwdKBvE2MVB0FeFcGE1k9m1LUDB1j9HdBw
         b0ppg4b4weKhRtlH2t+c0dG8WgFZ10Au+9gz7zBre4aJ7wawQsTeertUxoeCMcGeIsBk
         ICJEuNq/+258Eq+Hi9W/oqzhUInF6WJsgiVvdNg1EEjKvvytSzWSzddZL1akQM7dxUXc
         zM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781619130; x=1782223930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZNKddDCUUUEc5ctuxhNZJ1Zf0qD7W5gI4Bn6S7GosKM=;
        b=ev5zPrRwp/J16LxY8AMSlogOkZSqQkxatRAd7dGRIQK8YHu5DZPlNIEZI91q8D7ii1
         ZYqZcKQQYqfEpZSc70CTEgogTo4cXqOQ8ruUp3xwmtlW4CBXp8+Kk5zxzb7PHP1++R8f
         Kjay+kPEEk8IMFyhzxgmwQDwbpXnXBUKVPUGWMmxLujW+gEzcjKSxGNvWJjYguaNi5B6
         ra+OXja5TcoiYIbRiCO/c/YcQ4BgbsQr91u/TMyPpJZOLP2T0qwWyHU60qQaCibxdcsC
         SAF/rWCg1yCoss9NVXFKcr552/Dpmw2HOmytfHHz2IozTL/eF6EtENEq5qARKtZu09vM
         woqA==
X-Forwarded-Encrypted: i=1; AFNElJ/glQeCjrhnvk6GMx8LJWdJjJ46YPRXZwj+BSMKfGHhttvviDQYdnUlWiqi4OfNLTtpdzO9vYlGNFbYX4cO@vger.kernel.org
X-Gm-Message-State: AOJu0YyldRKGNuU6L8MLtsvRbnLk/gWwMZvyGAcW7z/tWYAnBgWd8U4J
	6l/MSpWBX+B7rPIV97ireW0AW6xtJaWRAIUMkhqfzXzfrLoEMydVOe0wjSA7UNqTdJdFSAsdbuk
	ibAIUo7NDG5n6JCkswT3vn3RwdCUODZGBAgwc4qLL5ev4PQsypp/oc2dwSQCpiMC/Xo/J
X-Gm-Gg: Acq92OFMZVzT70odJ/o5HC1K6tTKUvw14O0/+4BkwW/2gEH1a6YWsy/SOUNOxw8+UzJ
	f2gcIbdRfVahijDZAHpqNTyzmXojX4M/nfqCvClpFF1E7vUj6nlP9ULzlbz5ZvPZ27meD1NbRys
	uL9GMODCx4mEZS4tQe+aXjbo37nPRrs38qaNcBa2xDsc/bvjEvDjEObcvfsSuOt8NqWF0Fc7U+r
	42o1kPEa/dEvLC2JBCmuPK+H6ptmgvpyVY+OJvQcTrweRLUl0xPTqWnt9JXZcmjpT3/qC7SnNp1
	WF7E0G3EyhN86uOrjVmWa34Rr/xdvHTpC70W94mKuT8J2A+P7RzBO4q79ich4MEWxfEVHDLaxyv
	cAeStx9v9MYMl8XcYyIyv4+iv8KnW9vMAi0U3Y5v+HvQN3g==
X-Received: by 2002:a05:6102:3913:b0:634:11ac:12ca with SMTP id ada2fe7eead31-71e88f90c91mr3142968137.5.1781619130011;
        Tue, 16 Jun 2026 07:12:10 -0700 (PDT)
X-Received: by 2002:a05:6102:3913:b0:634:11ac:12ca with SMTP id ada2fe7eead31-71e88f90c91mr3142950137.5.1781619129480;
        Tue, 16 Jun 2026 07:12:09 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb5103710sm656788966b.22.2026.06.16.07.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 07:12:08 -0700 (PDT)
Message-ID: <9b66d6f8-7eda-4eca-ac3d-e1dc8306c677@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 16:12:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: regmap-phy-mux: Rework the implementation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, usb4-upstream@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260409-topic-phy_fastclk-v1-1-6b4aaee56b90@oss.qualcomm.com>
 <178093139446.244194.9422100472802070367.b4-ty@kernel.org>
 <c675lcfptr4xgg4hcjp66unmuozgsvgwvtymh7on6jcipjrdw7@jy4h7fkwqwjg>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c675lcfptr4xgg4hcjp66unmuozgsvgwvtymh7on6jcipjrdw7@jy4h7fkwqwjg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE0NCBTYWx0ZWRfX/ghtJsk8UCR4
 OIKrZsAi1DFEvCunk9DjvhqEb6NIvwk9SODXBVbX4uK+saJYp7e3gnXFJhgzSiEgFyYTE1mpeak
 Mzlyo5mH0GWF8nIdQeNBwk4BpV/s0dc=
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a3159ba cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=jjNbzz9fy_0zEZUIXogA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE0NCBTYWx0ZWRfX3QIUwI3hafoo
 tatxkARkNbMGSYKlYayvCEw7tGHG4DhI5aWCPEi3RYShXadu/bG7/xBqTk4yTfv1nHDuFcmMJjC
 RoDDiJjcj7LXet8l6S6miikqVI8t0nSzn4kHEjL8PZPXNB5AbVtU3LB8/iX7MGbS9o/ei4n+lSd
 ch5/jtyGKbN5p1y7lR3+qoRQaJnW6LcBaC2I9+XlkwCaAXvYByhn9fFIUbedPBCiJ6/qa8kQYFe
 BaN9PAj7o2KBf2PzcGCxfScq89Cm7KEI3tM5H+wF+qnryeOkF92F0P0hmE9NLkrhPcddjGCRggu
 twTZnozWlBqJxYjYdm2ZndgKyU+KtKm/ibl5ZXGZU1TTDVH3A/WQ0CgicAqY9ThrzqRnwb9nmvw
 F4qLrhwN/UivfrwZnXu6tiOwplBNdWoEK8OesEKnatEjVM6ja7rGJOYBZSKXwpEMN2tmLoaGCB9
 h0OAikXl2Ui7/Jroicw==
X-Proofpoint-ORIG-GUID: uxDN7aCtB1R1KZhyhuNMLYNd_-Rar7CU
X-Proofpoint-GUID: uxDN7aCtB1R1KZhyhuNMLYNd_-Rar7CU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160144
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
	TAGGED_FROM(0.00)[bounces-113439-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:konradybcio@kernel.org,m:usb4-upstream@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim];
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
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 32F31690697

On 6/11/26 9:38 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 08, 2026 at 10:09:55AM -0500, Bjorn Andersson wrote:
>>
>> On Thu, 09 Apr 2026 13:57:45 +0200, Konrad Dybcio wrote:
>>> The sole reason this hw exists is to let the branch clock downstream of
>>> it keep running, with the PHY disengaged. This is not possible with the
>>> current implementation, as the enabled status is hijacked to mean
>>> "enabled" = "use fast/PHY source" and "disabled" = "use XO source".
>>>
>>> This is an issue, since the mux enable state follows that of the child
>>> branch, making the desired "child enabled, MUX @ XO" combination
>>> impossible.
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [1/1] clk: qcom: regmap-phy-mux: Rework the implementation
>>       commit: e108373c54fbc844b7f541c6fd7ecb31772afd3c
> 
> This breaks at PCIe at least on SM8350. The attached WiFi card is
> not detected anymore. Rewerting the patch makes it work again.

Hm, that's anticlimactic. Can you please dump:

gcc_pcie_0_pipe_clk_src: gcc+0x6b054
gcc_pcie_0_pipe_clk: gcc+0x52008

gcc_pcie_1_pipe_clk_src: gcc+0x8d054
gcc_pcie_1_pipe_clk: gcc+0x52000

Konrad

