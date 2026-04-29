Return-Path: <linux-arm-msm+bounces-105144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aE/oFLXJ8Wn+kQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:04:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC817491800
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:04:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E962C3056ED8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 08:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30BF23BC693;
	Wed, 29 Apr 2026 08:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WErclJ2U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lc0h5d3J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F5E3B0ADD
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777452811; cv=none; b=uXUksHwFUJ44d5mV+zk9DXn0/tI4hMir+nu0yHKI0ssCVVe33xJu5viKLagszOWOFBstaKiChcvrZoPI36WX6mpOqmPnUd9w3LGEmIgvUzl2y0nRz95YkTV1CMv1Kg/ulAnuMIsrfNMqp8/Fbc2NPkROxZWYrlklr8c936TaCmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777452811; c=relaxed/simple;
	bh=xX9zWyeGWNMM7GK+K88UijKblKtT1kBrY5FxPzbVWiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O3tXDbzWowIj4qnFBs37cunezIo854MSGBMG1pFpuDBd0smoCM5k+2Cpux/x98rZ+/iTHQrrSsoOEsKLTRtXzl0YDz17CIiC3uM9fftyA9whdA8b+z40lBjg5nB4HX59fEQCFm8Sq3uKutOjR+74mxZISEX22coRz3EkFQfcGM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WErclJ2U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lc0h5d3J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8ppng2094110
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AVAcOVExx0vErRkm4mqEh6MXnxWwVTvQfxrHffhpsfA=; b=WErclJ2Un8X1XDVF
	TWxoOWPT6SpmqndxnhCaUCOr4pR7PDMMMMpq2b0TUGnFYmD960v2Ul4UDTwq04hI
	kzF9l6OWR5GjhjBeDuR774uHTZoZjgXuRRCDlNjwy+NckAQBsM/RoLSGE9XCqU57
	2Q6Pl2zh6gOBvLSD1fD/gvw13kgV5PRLomsefllI/iud/0wX7C0ZKNBqtiI/gJMc
	HS92HBSZKzuHTXhgmflGw3YMAA9yEytLzpyoLXDpIpGyhmbEMgiybT3GMT0xIrRg
	N4T+BGySqkLwUfTMvnXeZ33jmTMc3x1yxbPzURXYw86zit12hHrmMAy/TQ2VU2+e
	KCiiaA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dudh3rer8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:53:28 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56f7d6e7a31so661367e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 01:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777452807; x=1778057607; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AVAcOVExx0vErRkm4mqEh6MXnxWwVTvQfxrHffhpsfA=;
        b=Lc0h5d3Jx8cM60ST7FB9x5bJ27qEsqVaonj36m1D3nFUV3VezZu2SXb0jFTlJdEc8I
         wAsAYmyaSQRjKTJnXaZKKpoxvZI7kc162TwsynMCol6iXsI9Gpzd/h+ish+IhMgwUjxv
         ClfYbob3Uj7fQ6LzU5vNUFwRktkFrAd7lx2g5M9XBGNo/mqicfBIx+b1jxwUskO+knI7
         FRb+yK2HJbhQam0qVDhwl66PJvDq+5tMWc1xqmRvTteBc8HqrimcGdmwgk+of0lXyCUv
         /sreM93bEjVON7jzAeypcGYzc6svRPKrJ0CNQkpQkMOFG6x3CTiaOXEeqCM3VI5y+ZFu
         47dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777452807; x=1778057607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AVAcOVExx0vErRkm4mqEh6MXnxWwVTvQfxrHffhpsfA=;
        b=NJdeLjgYoVcxgUIEBYmtmgVJ5MsrYXhI4Ay/cYH14ZYlfnfVfxLoVNTQ8/qvmyLw1x
         YJsdksqNy00hn6uhZuprRhfvY+apZdRP/ptGRpwIAFzyALSlr1nFuRKLzBTyZPEj9j97
         fSmmH6iSIGgqzte7NpnzS7pPPUR5s6w++yyU5u3xrBokPggeeaYoS1netWxY2l6TZGdJ
         E0dCNPenYSZY0XT7tpwC5aBGVZgel66Bzh5U1VglTDCI2ca5DybY5TXjfi5Wyk6CxbPn
         kkiM/KG7nRS730xciy5KVSGX5HaM7RHLZf+gp+zEkyI69A5jLbGWoghmSW31UNJza4KA
         kt2w==
X-Gm-Message-State: AOJu0YwL4slSNP9hqsKqC+k31N82kxN1+fwrvlJueIs958JD83Y9XgG/
	q+Sb284OSfOSZ1QvGZFKr/z+eQZ/c7f4xznFgsUngCKeV9DC2stCS/+mpwve+kod2BrgCtERVNB
	7XDeUIn7g/uWLtIB+3y4QG+NXC6kyvw8hDopV3p8sko4JKzv69XIepG8+J0YDk+/xINiq
X-Gm-Gg: AeBDieuDjlHQMj0T0lrMj1+cnfOZJcSn44eGCL6SJgrAaNOvaiPdl5qjGUrYY/Pl9KI
	n7FKvcbnL04bw5b5g07m3AT1tXw+2CS7Dta8op4iCk7FUeuuCJ3CK6XMyHfQkrq6xW41zurMFou
	2FKKUO+euTTJ5Km08RZyUvIMebDD9VdA3QwT0Zl78DMmRIh9PsRBCbNPo5G8DsMR+TxUIVZ9w6e
	sMTRaAHFnhdBZBSaRcXasPQ1MIPQPihIuBuqe7ABVHjL0HcOoDXLqDcbT86jO371fFLTqM1oXAY
	QRB/UEgn+Ye0SQcbL1l58Wder+bt5NhGjVfqKMPEE7ClJBCIB/B5sOlaIYb7mTpYRCve53CcugP
	QVr4n+teFOckRCE/KGUUulWX061I1zhxEQACzOUCBcliPjynA6wqSX6drS0TpfTyP5Zfv4rrOa0
	lT3qWVbYWtsove4w==
X-Received: by 2002:ac5:c894:0:b0:56f:6edd:77ae with SMTP id 71dfb90a1353d-573a293d531mr1225697e0c.0.1777452807505;
        Wed, 29 Apr 2026 01:53:27 -0700 (PDT)
X-Received: by 2002:ac5:c894:0:b0:56f:6edd:77ae with SMTP id 71dfb90a1353d-573a293d531mr1225691e0c.0.1777452807044;
        Wed, 29 Apr 2026 01:53:27 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb9854396dcsm60429466b.40.2026.04.29.01.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 01:53:26 -0700 (PDT)
Message-ID: <2aca441f-55cb-469e-a680-2ad3f322fd85@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 10:53:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: add IPQ9650 SoC and rdp488 board
 support
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
 <20260415-ipq9650_boot_to_shell-v1-4-b37eb4c3a1d1@oss.qualcomm.com>
 <10af8a5a-45b5-4a87-be4e-2501464ee827@oss.qualcomm.com>
 <6154cd65-1aaa-474c-8816-c48c1fb01b6b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6154cd65-1aaa-474c-8816-c48c1fb01b6b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WC70dafN-GTphMnN60Y4fyGoRbIJCA43
X-Authority-Analysis: v=2.4 cv=A4dc+aWG c=1 sm=1 tr=0 ts=69f1c708 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=HnUB0FDFPF86eyfwSe8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: WC70dafN-GTphMnN60Y4fyGoRbIJCA43
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA4OCBTYWx0ZWRfX4vEw8TrjF8fG
 6T66t7UQsioRqkgmuyk+zVyEQUa1Mduun5osDepoM75h2fMLw53JCiyFX5ifZr2saX0pt0Rx7yV
 AdW1nMqO6otUdp/1FuoP+zJjK/jryqMFSJ9c4pXJ/J6mtHQOMUhDbB2H7FUBR5uki3KgPKtUV98
 nqeUvh06mLpRCjHoqy9ijK+AXjJelS/+C4cPa/CjmLsVtxZO+lBjydtnw1D8VdDxSJerYGOh4a9
 mpf84YvvJFYczb0jRhhyoTaUvucU09d/9jV1RhaygsDvM96/HAsSNQxcJEjRTCg00PRYjc4w+Vs
 dsgWcEiAKgeAlvtMqMW0t4kNC4cz+BofWRb5hb0y8EFSFTm4uPntuxbwKI2r1fa5LuyctnyabGe
 7cu9Lpjv/nz8AToP2aNbNKYlEu9o5B4D6qPB2cvyqQGkm/TDE+TYwCqva4w8IsgS2d41rmGRdA3
 XGqqpwjBkE0Sxag4/tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290088
X-Rspamd-Queue-Id: BC817491800
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.0:email,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_FROM(0.00)[bounces-105144-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	RCPT_COUNT_TWELVE(0.00)[13];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_SPAM(0.00)[0.026];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/29/26 5:58 AM, Kathiravan Thirumoorthy wrote:
> 
> On 4/24/2026 4:51 PM, Konrad Dybcio wrote:
>> On 4/15/26 3:33 PM, Kathiravan Thirumoorthy wrote:
>>> Add initial device tree support for the Qualcomm IPQ9650 SoC and
>>> rdp488 board.
>>>
>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>> ---
>> Overall looks good, just a couple comments
>>
>> [...]
>>
>>> +        CPU0: cpu@0 {
>> Labels should be lowercase
> 
> Ack.
> 
>>
>>> +            device_type = "cpu";
>>> +            compatible = "arm,cortex-a55";
>>> +            reg = <0x0>;
>>> +            enable-method = "psci";
>>> +            next-level-cache = <&l2_0>;
>> You likely want to add #cooling-cells = <2>
> 
> I left it because to add it along with the TSENS support. Do you prefer to add it now? do let me know.

Up to you, it's not very useful without tsens

Konrad

