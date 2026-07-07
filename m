Return-Path: <linux-arm-msm+bounces-117155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oV4dABujTGrMnQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 08:56:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2B57182EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 08:56:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kBOTGI3c;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QN2vYRLI;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117155-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117155-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 237A2303A92E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 06:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3763B19BF;
	Tue,  7 Jul 2026 06:51:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E1C3B42E2
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 06:51:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783407114; cv=none; b=OQDfdIThxmvmXb9k1z3nKd+0Ve7fbh78826sUkweyy/z+OGFs+sLvkt7K8wZyFoYeIHAsergQ7joGrVECwkP3u6fYk/m+CzkCigau9PjGxSlU19B8IaDERrPkRHW7iCCLxopjx8FfM43BRO0VD3XWNjFbuSpwcLa9nkFskpGODc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783407114; c=relaxed/simple;
	bh=g+2xhVag6spj4YNFX8Jx/a9MXzwc1CEg6FaBobY3B9k=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SnOjgeXfAOcHpQt2l1jLmxzdrLZYwlBr0YWWK2KYwvZF7E1Y4TEKio3sZ9AiQM70A7NzqavNIQoP57LTMuXk3ILO3QKCv0jnRhGMuXlQszXFe2FgsRInQBqZRg/87jPCnaQya4NpaAFVHOSshkyZxIZh00+i+RhQLSptdC7Dry4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kBOTGI3c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QN2vYRLI; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748X1v2514295
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 06:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	equppupYDjoOTcocYFBmflcXCUpXZFOTfBlCyBfEzs0=; b=kBOTGI3cGY5uuBJw
	nbmu4qxX2yCl8l0D7j0EX+FXMdVNRxRYznEUbjsuwK9ntDEd9dEpPT3arFbD2xcj
	QBDX5h+3EqNpcimdxYVjZtPicedOsQ6/qFtSe9dzPbcqEigB9+3bs9dHLLg8wkVQ
	Irnx23chKPAh8JnvA6BL0CRuGeBfCkEIEDVspYhZ8WaeEFOQ3ae1Q+V+Z7CYKnec
	SH7d80taHVlneKgwVKYcQ+oTKV4xum56FWHWgQX6ix0WaOF8z11kbEErcm9nTIGP
	q8X5xuRStivlW0N6x/qBLyNBL1ByfzMvPhn3/kZqApVFJwAtb+j+8AqIfSv/OmpL
	6ex9Vw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8gmj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 06:51:44 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7390c789e4cso3211506137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 23:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783407103; x=1784011903; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=equppupYDjoOTcocYFBmflcXCUpXZFOTfBlCyBfEzs0=;
        b=QN2vYRLI7NmUr03T98a9ddMXpkMSDW/N94WffALzoV1DGPHFRfGOBgA+yiTYy9tupN
         8Ug1AxgU4T1gB7dRKoSkS60vf9Smx3GKAPgysGePv1ZDByd3oFZmQzv1S1O/HWnZcBJ8
         5UJtGR0aszhDzcpOCWWD/0ahNP2UGTwfgEmeVqX6OINZ/2ZaO5C/XSPhKWvX4e9xJw01
         0A62vZZ6sRIc6CAh8wpNMiSAntSf0QRqJzfGDxtFJ2tor3KorHWDzUhIvYnKR+R24jIC
         8o5hc0z/WuK2xW0Lc+wMvBFGxpv+yKrKtAXKRtrBsqXhN5hgAPhBmrDX354O062yLNnx
         PXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783407103; x=1784011903;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=equppupYDjoOTcocYFBmflcXCUpXZFOTfBlCyBfEzs0=;
        b=PyAHouJlx9ExjwrJQkJboVqFSoaLIcbe4OhBZtRKGUfSs5QHBxh46LwUo1H1t+1e2J
         QT+DKvSr+x3vAc0l1TLqhThD4Zjoecu5HbTM1BjfrUnEdnVNSBWwojbpFzFMtQ1iJ8Mn
         Hq3bhbG5V672TQKenJ8uFwI9NacPrJxHEg6yg3yLWgBGFGMX3a0ZtruUBOJe+vZ+zpkI
         +Vmn5QQ8p+CI+LGfOlPCl4gXoy453XMqAOIZWH3IbownlIn9/TC75PT11syCDADeIxgK
         WJ0BOgCVA/z70cwNoBGv7JSJoJWK2oAMy9/+MUKsYQRyBwGT4Sx+E2ZcqUcKhfvy6eWz
         wOPQ==
X-Gm-Message-State: AOJu0Ywaedk13m80y5p9Lzktcg/X6C59LtVmzkNbmqD0C9IT3lyvh3Ty
	aQ1Z/HLgGFyVdVPWxkpc44BQz0F5/RgjRmeZwq5MyUOCN/TfKnVl65+/p6QD3NjzYwKlAiBKx/N
	AOsCGA7hevAa2DHRQMtFt8Gf58YaVgxhEimEcXuF8o86sPW89g2oR2x0lpTy7RFTuU2lU2aYyDU
	Hu
X-Gm-Gg: AfdE7clV2aPaGwoB97OKHB0todkUkCOYgwSbLtsfOiyc3fS8nRBi4rZjVz98jB30GGU
	9qIUoFwrreOkL/xxGRQwPtATyDjsRCo1CLYbUf6FxUdXtAoWXf4A7gCJIzN7kefVikOmk+6nPCj
	0Q4A1eW9oZXbWnu8fU2Xh9ziwR+fT8BFN+1QZWEcAmFKUmxm87ItSstt+EFUBvixTIfG+Gwe+np
	tS08BlbJ9c4UfX+b/a9Ux/s2xsu+Tcc/yibDDaFHdRAOtKR+9SpXESNzmf6BqLFCSF2NvwfzwTg
	6RG2fbi1Lh7nUvaGCAfL9JO2iql47G5CxtHfkWNX0LGe1FpZ0qLPT/6UjQ+xr6TeMohRgXHB+Ay
	iMuBX5azcigsCqkNtDhL9nNCdl9950NjfUhT1+bGl
X-Received: by 2002:a05:6102:290f:b0:6c5:d55d:c093 with SMTP id ada2fe7eead31-744b7bbede8mr2152531137.8.1783407103081;
        Mon, 06 Jul 2026 23:51:43 -0700 (PDT)
X-Received: by 2002:a17:90b:45:b0:384:229e:1d1c with SMTP id 98e67ed59e1d1-38757b81a3amr3675113a91.31.1783406719846;
        Mon, 06 Jul 2026 23:45:19 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a32e3sm542564a91.14.2026.07.06.23.45.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 23:45:19 -0700 (PDT)
Message-ID: <3d12c33e-6aae-4396-bcee-f4159a741cc0@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 12:15:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v3 8/8] arm64: dts: qcom: x1e80100: Add deepest idle state
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-8-4d8e1504ea75@oss.qualcomm.com>
 <c039b31f-fc14-4a0a-bd77-dce00ae36eb2@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c039b31f-fc14-4a0a-bd77-dce00ae36eb2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2NCBTYWx0ZWRfXzWOzJAnGgwFg
 FIxFlRA1mNUqStTFEQLjujgkVhH8nZXd7ns4xVafjWw+eM0NYZ5z2tCDztpC6Z5Zaw52g9S0+i2
 t2nzRIcb3YLMyO/Ze0P7BRkbk78k90aCwzojMFeBZVT36HAAQ44CHHwhg7V3o/xbTn4I7SZXEmi
 MwJKR18MTyx0AOYYWsXn4jS7mzZqkcatnItRebPjGJozoeQZCaqKiBqACBBqiKssWcd3/gjbF5O
 mvDqpnMU2s1Z5tMS/deagHCpKhowB8mAhlSqx2zUrhMyATM6rTQNkAqO4LQMyaB7KTfX10wS9iu
 A4WESqe1aeX2LNki1DMWTNOEKsDmYQZXQ1Vd/RlEAm2q3uYtY8DEoktJTTUe/856ta2L22ssLX9
 xnJT2I+an20FYpOM8+RA41pEg9+ICQazlU1jTSteKcOnw5ZEfy9lUK7k+gDFPQykJhXkeBo7NyO
 V8raVztitZ7F0ja8SzQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2NCBTYWx0ZWRfX20fISkbzYICL
 3YP4FBb1cuEdtDlyCwg9rYC3BMLqD76W7sHxj19APqqgaosDdlpxrs+CLuz0464IuM4ujCBdeJq
 VemNjDF6QEAVxI/w6YP2pjUhOOHuoKQ=
X-Proofpoint-GUID: 9_Att5NtKKjdsg-s9fzQ6iqFE1RQAJQX
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4ca200 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=hcMOYrp8kfDHR0m5M2YA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: 9_Att5NtKKjdsg-s9fzQ6iqFE1RQAJQX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070064
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117155-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:sneh.mankad@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F2B57182EB



On 6/18/2026 1:55 PM, Konrad Dybcio wrote:
> On 6/16/26 11:25 AM, Maulik Shah wrote:
>> Add deepest idle state as GPIO IRQs can work as wakeup capable interrupts
>> in deepest idle state.
>>
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> index 4ba751a65142..47e425003028 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> @@ -302,6 +302,14 @@ cluster_cl5: cluster-sleep-1 {
>>  				exit-latency-us = <4000>;
>>  				min-residency-us = <7000>;
>>  			};
>> +
>> +			domain_ss3: domain-sleep-0 {
>> +				compatible = "domain-idle-state";
>> +				arm,psci-suspend-param = <0x0200c354>;
>> +				entry-latency-us = <2800>;
>> +				exit-latency-us = <4400>;
> 
> The DSDT has "wake_latency" (presumably the same as exit latency) set
> to 5000 us, should we follow?

DSDT wake_latency seems to be entry+exit latency. Will follow DSDT in v4.
This requires update in CL5 latency too, for now will follow 2500+2500 split,
which is closing matching with actual entry/exit latency too.

> 
> FWIW, the 2800/4400 numbers here are the exact same as for sm8650..
> which doesn't sound very reassuring> 
> 
>> +				min-residency-us = <9000>;
> 
> This number matches the DSDT
> > Should the entry latency then be 9000 - 5000 = 4000?

CPU idle states with arm,idle-states compatible allows "wakeup-latency-us",  which should match DSDT given "wake_latency".
Using this will avoid such confusion in future and will plan to use this but in a separate series.

This needs some more changes for Cluster idle states with domain-idle-state compatible.
(cluster states do not support the "wakeup-latency-us" and still needs entry/exit-latency-us)

Sneh is already working on this and will soon send out a series.

Thanks,
Maulik

> 
> 
> On a separate note, the DSDT also defines:
> 
> SS1 (0x02000154, total=7500, exit=500)
> SS2 (0x02000254, total=8000, exit=3000)
> 
> These are obviously shallower states, but perhaps they could still
> be useful?
> 

So far SS1/SS2 not proven to be helping much on power/performance for Linux.

Thanks,
Maulik

