Return-Path: <linux-arm-msm+bounces-115367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EAAzN5qcQ2pmdQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:38:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D866E2FCB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:38:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="H/VrF+R4";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JAtNup8D;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115367-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115367-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ECE5530533B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 10:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DAF73F0AA8;
	Tue, 30 Jun 2026 10:34:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269F93EFFDD
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:34:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815655; cv=none; b=B2Yh5Bju/wLSDf9tj29AR8hr+yAdayCGR8MlBmMCRArY4DL8AeFlh0+OcnqNGbK66I+a0xEwUVto9HMHHmqxIpzBP5bAW+76M2u49rc69c2CQ5xaw8CURrfdjamkyMvDr1pRQb8t74+TQimVQS9AJUTIPQJeeal3bZdgbG57aaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815655; c=relaxed/simple;
	bh=lyJ2DIsUIw9wDCzRlH3s/bM7OM6MKeM10elgahvX1t8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kXVtoyhYs0kebxk7b/Y4e1rEsZKN5eeu727yizfIovegU18++aiAGciyjpViXNbo5MAtaozsa+Eayt1BZblj0vkN3pAAkLwVIM0rfeHpfvxPgx2dOUw+oQ9Uweb3b0xnbiIRjjoXMcYUwcL2QtHauDwRD4nmr1UogjxJkje2Nf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H/VrF+R4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JAtNup8D; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9nCeV1590607
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YlRTDmRMbrBxZGJSqwOsmUuLWk+RPKY9ZbXelu3q4Gw=; b=H/VrF+R4jRq6dJMk
	WLACUDnkQtNgzFdTJRclHpuVU6Ztj7/r8mvRfk9Uz7YyOxg9hjMW0Vj+N/9O3aSy
	M19SsPwUor+mXwa6/6ny9wZgu+No+hC8UHE6okD/c7oIb0b2BJAdxkyW/WPuuu1B
	2t2ocEm/urWwwfojTEePomInnsJ7p0XhDYjI4qpEnO6sEM1vnyiO1CL1aqIguyV7
	A6vKnuq+zf6g0ZHZzRod8NkgEtqRs3mWLv27YluOQqHw8DoG9opJJi2bsfq8NcRz
	clrfgsx3HFZl7BNlXsInb0cxok2QXMovvmNfwH4sS4TpA+EBPXyvdprWNn9HHy5b
	PH0ETA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9k30r2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:34:12 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bdcef5085eso447e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 03:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782815651; x=1783420451; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YlRTDmRMbrBxZGJSqwOsmUuLWk+RPKY9ZbXelu3q4Gw=;
        b=JAtNup8DyuNOew0nc/Kj/MuBPP0tgSRgqJaw5V7Iopa1obVJLjm+vHmgkPYKy9Fp+S
         St2Lm9ZUU+gW1ZfbTRxpkqOzT7Xbtjl7lshKyefixsjhgWPj1ZOZErx2JGJA+jWF+NmZ
         e1EqKOKxl7tDcZb2GxEPA+0YFZv4PIxUvhDTbn8iioyrFdxphVEiR8HmXAbnKkGVsaDO
         WVO8Jsgnxs/M1qnaLtxrVz5QDNVDtKsYzLdyd93FIvCgbJVZ9pMNCy52SCh2c+ploMyQ
         XYrSOMADPhhz4GjbmdLXSIWGvZ9SMH3EkXdosdcnbsOCIIoulSKJYmNu8hSVABPEP4Y2
         DVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815651; x=1783420451;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YlRTDmRMbrBxZGJSqwOsmUuLWk+RPKY9ZbXelu3q4Gw=;
        b=PPKg1m/bMEbkNkEvpnynGZSCgiL9tvl4I1dyfiUXjnzyJS1i3SOK2ZRpfRvJFJqKus
         Bwh7uD/DZu/WTR6nKZIgu/oPQAPQBXtTsBp4hIXb0GqpP/ih32CPxORU0vOjIPT37Rh2
         aXukkP8K87oNIFpVedwTovL1xLIfLqEumHy2diiZL/DQaXLJpF2kFn2qQRms+UQ0LRv7
         dAhsvs4jqX7Z/AJbDLYV2zmAj9EBZOb7VmPHeLy9l8IcW54d4C76voZ+sE2SK4Kx/FRZ
         CaDBu/H08azzM6kaqbN+Xzfz1E/Yq+8BfQOAVSqWGatRUOU1oum9axVeJtl/LCoJdZOO
         DdVg==
X-Forwarded-Encrypted: i=1; AHgh+RqBaoxEOfb7nHI6gQZXoV8IEMd9R8OXBJ3J19bqb6vgKrhSmG6Td/PvRNGH3g/Qm/5NylYL53vUrpmJcBc2@vger.kernel.org
X-Gm-Message-State: AOJu0Yxki6vBccql15dNj9YFpH4uP3AgXgK9Gln4hi0NKrd09DPBLwNU
	VLopMtlQwAjV3hg3ykJBQm4NpYI9UbPJetvdpfaJf2ppVovWlBnMKVLQi8c4+BrTLc5FAualSip
	h2TF+Ey55FJ05a7i4i39cXxLUWbCYUuDmoQbzuDnw3AMzVqG6oqC8p9ZwKCrci3K15S4r
X-Gm-Gg: AfdE7clc67Tm4nfOL8MDXXcnPiNh1A8Flf2Z5E4tzG66/dVFc3XUNbTc2aVSxYNacdJ
	yaIHEYJyllU9B5kQWqDvKsrv7IPwk1u4ZkQ5+NscswjRIP0F+C/ouuHNAS5eojk62YkUxZWRXqZ
	mEnok+M7xOoK603qJF91duC4Yw+eNx04V//Rx9RxEbFwz2FQnbLvFfYYLbGi3M5LNg6Xve+Pjbr
	ThTdvFbteMf6i7moT7hjB7fTPy6cGkCmvCt7XbFudoE2WDh9taaIYLOkDRaF45UvNAuqZq0YKY/
	mhVe5xI5clM9QNmoQ1ZJBTHxSRZfZKibBoqqPR5o3zSyi6ZTXUfU9nHyVW4jCnTObK3IqftJU0B
	0Vbhx2cxiZDWoaM4tn1qQInxAstXsOCkg/O4=
X-Received: by 2002:a05:6102:6886:b0:738:8d0f:72a3 with SMTP id ada2fe7eead31-73a3853a35fmr523880137.4.1782815651540;
        Tue, 30 Jun 2026 03:34:11 -0700 (PDT)
X-Received: by 2002:a05:6102:6886:b0:738:8d0f:72a3 with SMTP id ada2fe7eead31-73a3853a35fmr523877137.4.1782815650930;
        Tue, 30 Jun 2026 03:34:10 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c968201sm917585a12.24.2026.06.30.03.34.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 03:34:10 -0700 (PDT)
Message-ID: <250311af-0860-4a76-9799-c01608b87293@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 12:34:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-huawei-gaokun3: Add dsi panel
 DT node
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260630042229.277799-1-mitltlatltl@gmail.com>
 <35f13ab2-cdba-426f-bf4b-36f53ce1d4bb@oss.qualcomm.com>
 <CAH2e8h7p-i3epbxD6Ks-ru2OP+qY6nYXA+Fm+Luexo3cZ2Eucw@mail.gmail.com>
 <cbfb770e-0e27-4254-a3c0-6011e8eb37ec@oss.qualcomm.com>
 <CAH2e8h4ABRuOTe8Qu-iPEk-i6r-Le3bzmwFSEG_c7YmBu1LjCw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAH2e8h4ABRuOTe8Qu-iPEk-i6r-Le3bzmwFSEG_c7YmBu1LjCw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfXwI/8ZzJjrYuT
 9mFOeHlps5JjtBDLdfAd/MaIuY0mnYnZZ47EP5PSsZxvgjZsNFofiKvt1XeBXtlLlBJ6xJHw9Su
 Cl4tafS3kGaP/cfGhi0WvbfKSbpTL9Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX4X9UL3meVg+3
 4bs0jRcASTvdZ0Mx6vUo6Q/enxFSpFec5gy53KgyXtGUapv29f2raB3S3pO2RVMlehgGzgAoah0
 Lu5CxNCp0/A0QutlUOzZRBC+50bB6MdEyuTZH2QUuLe7eNTMHzUmtsFQ6nzyopg4TPq3rgAquxF
 4H63kZGrdaZMJMTd1c54wFGkc9CkyfIcPrxY9Fe2ieARpIGLaEmxuVEl5yiDZFJHx+td2pLozxZ
 PvxkeTxbrqyfmKKVhZ5HfJEqDTNdjy6wD5ZHY2zeJDjL+TKcu+ee6YaWQU0wxqOb1jE+RBND42W
 bjx2NJiPAd9JBOzoOCMm9iBoGvUj5ai/rvS2WGsU2pSEyRDTXEGjxsBqBYSdmvveiI4Elqso72V
 I3StuSd4HqLjjubIKJW8mTITmlQ1pIHFHlwQiGvPCPM+EHjqBlHzbyaglwsEZjdE6pBlvjlxLyH
 WN67cTLXrIVHS4AzM7A==
X-Proofpoint-ORIG-GUID: 2hyXgv1gZz0EJV49pkbRONnEWVSs-Hii
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a439ba4 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=AfCMliE2q1qzQo8TwlgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: 2hyXgv1gZz0EJV49pkbRONnEWVSs-Hii
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300095
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115367-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 74D866E2FCB

On 6/30/26 12:30 PM, Pengyu Luo wrote:
> On Tue, Jun 30, 2026 at 6:29 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 6/30/26 11:28 AM, Pengyu Luo wrote:
>>> On Tue, Jun 30, 2026 at 5:18 PM Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 6/30/26 6:22 AM, Pengyu Luo wrote:
>>>>> DSI panel driver have been added for a while, so add the DT node to
>>>>> enable it. vdd{a,s}-supply for dsi, dsi_phy are blank since the DSDT
>>>>> describes the wrong, no impact after manual disabling these wrong
>>>>> supplies.
>>>>>
>>>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> +&mdss0_dsi0 {
>>>>> +     /* real vdda is unknown */
>>>>> +
>>>>
>>>> L3B: DSI core 1.2 V (both?)
>>>> L6B: DSI0/1 PLL and core 0.9 V
>>>>
>>>
>>> Yes, that is what I saw in the DSDT, however, I can disable them
>>> safely (hack the regulator driver to add a sysfs to handle these
>>> regulators), the panel works well.
>>
>> L3B additionally powers CSIPHY2/3, EDP0/1, REFGEN (probably why it
>> ends up being on), UFSPHY and USB1_PHY
>>
>> L6B additionally powers the same components, minus refgen and USB
>>
> 
> No, I confirmed they are totally disabled, since there is a way to check it now.
> https://lore.kernel.org/linux-arm-msm/20260420-read-rpmh-v3-v4-0-70c152e6c958@oss.qualcomm.com/

This presents you with the status of the votes casted by HLOS, not
the actual hardware state

To get the latter, you'd have to dump the SPMI registers

Konrad

