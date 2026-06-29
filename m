Return-Path: <linux-arm-msm+bounces-114858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yW9CJZ8ZQmq50AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:07:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 816B96D6BA1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:07:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jOqmZC08;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LTEQgiHd;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114858-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114858-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 05577300BCA5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 06:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 292BC3A873C;
	Mon, 29 Jun 2026 06:53:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8BE39A800
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:53:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716024; cv=none; b=HrsJZw30wpGtSjlH4Fvn73ztI+tYlt1nUx52nQnumhN4t163JSMxsUoC8GesO+vIMKU1wBiPcrrKUHMC50AdvO42s2eIiCSfWR9pGSUNtPFNDdMZxn19JN5KRm+9baHuc/USWoQQBd+YQRMJXRFdB6mVIcI1zC1mOS8olTRRfPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716024; c=relaxed/simple;
	bh=wlpu55swFFLrLRJnzJ1mOe+yJSMYqu88AQxY+bCp1jc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SLCcw7E3KiAKfmjqpjqHHWcX4J08Ah9L9sTbhna2RZTtAlzGffJzUTUNbii5925edqukA7EB06hfLGa0avBsB3j4hgee1mpnxos0GCjzZwZnKMpgVJW4MuWmy3HJMVUY4D6XcHBhHEyMMuGQ1g6dgXh6DD8m/ZlbkWXviAgzFdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jOqmZC08; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LTEQgiHd; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rIQE2139407
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LzI35U/vzeICZsBKQayEqxYqEosNZYnabHdvb9OWgbo=; b=jOqmZC083JuuYp0/
	78SA2PFS3jmYR3P7qJndaG8OFV2oMIK7qRyH8g2yIto0656klRoM+hghIaoOaVla
	tHtLQn5N0fIGUpeDyyalWyKOM/Ttu52NUS78Cntf3HNL1XVuSzm/uuh7AMPhAgxH
	lRSqkoL7IrDhvs0PjNSaLZ7PmTBigLDL3UFno2OzFKWs8QHM8CiYNIAeGY9MCKP+
	n6BA/AGQTjjwNJu2vZ5MbLP0k00EGa2wyZK8A51SGLgF67IXIOT46344H6rdAj9V
	YMgJ6SM2w5lgE9YI8Nr9ytFEXkPZXjtwfZ+UsTuL3opVCXg0UEJ/taK/DP92He+h
	jdIi1g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f2708524x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:53:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37e1f96b248so1910a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 23:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782716021; x=1783320821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LzI35U/vzeICZsBKQayEqxYqEosNZYnabHdvb9OWgbo=;
        b=LTEQgiHdnpZjnVe8k1NpsffWOzUHE4yI/T87giKtkOzKdJglDXBfU1ij3xI3O1O/hU
         8dTXwtPAJegNHBh0KC67MiN7UnsJ++sMW6jXfUcq939LmSv5NfMO4HFdU+fXTo11xXgf
         A2jeKeovvCdKqPhmBNfdCnmzzb2AgKfPwl/W1ojgTzE7dry1HcF2+2QjJ9dfehs9Puom
         P7Mw5E5/K2Gbu6X96mP944yIH7MFzakCLbwShpj3kZ7fLEvrctxA8m0s8aQLR+ThLUeu
         yb7rncmP1xUa2m1gCbfaLy+rLGqZe7oV3WyGpczedehB+cATrkN4k6I70Xe9TnCWwZc9
         rtmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782716021; x=1783320821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzI35U/vzeICZsBKQayEqxYqEosNZYnabHdvb9OWgbo=;
        b=dpkPIcZC0fqSirN2ALY6pWd3uumF6/c3+mqIvPTtK8eG9LINrAg+1BLe11mSsGh+MI
         oSqJXx0N+5k4kR/2sJ+NUF3qhkwXYySqb7g60dNv6OP2vizl5r3LLWbOuCabwD8gWBuM
         MQ9y++C2Gv5eFJj5u48mOfuaTSOQ7AA3Ys24WJdIQyHz1JTmDl2xzEnKNe1Grn4fZJP2
         zU9K1V7eaG6P+8lsNBL9hhaEiJdbxA6k6L6b7XfcZ4DcKbqvj2FBlEgPl1JI9w3iCFuX
         XOOLPN0vtRCHCyMA6HraVbqZp1enS75mYSiraZPdPLKeLZXKfG5XFHO3aDWEvVt96vSh
         c0kQ==
X-Forwarded-Encrypted: i=1; AHgh+RpSKhXMl7CqQKH8UGoddaFAnUPHepoHKL1ddSqoph8+uMazqikyt4R0uRfuLhP8XTVj3A6Ze5mHFfxM1bRZ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc/cTfsB3YsXbtfhDzE/4gMOt54YlZGIHvpEIn2fuZMNGClwMi
	4oFPOF0cdI4RQ1dEpv14E+os4KTPlp7lEZZ83bu4mGkxMB8umg9iwIELcfGUIFGs+/kknc+IOXA
	EUmTxaGChO8emJru2ObOTA+dvt0YX2qKwQztewcuc8nxxlHEtsfuHjUhTmQbxUkxQlt8x
X-Gm-Gg: AfdE7cmSaHxPZxnG/rVtN5m9espUu7ohAXewZd6VxWOq5RfbMnnK8QKA+tKKP9lVd/F
	RehqDUB2rNeqDkrGnxn4xsAWPVJernS5+C4UYMsa40mh3VCF3dBODjWbfJJjswdBDd1y+aF1TNU
	uiEuM4tAqymi5BEN9hvZld5VXbtvVVmJtYwFC3cWX618GntN8H7+gGbHq9gmbH6gsCeYLl22XA/
	U131Bf9P1BxlhJShhWRawIyYKH8xYZVdJalMZfoERzx/TBE9qAj/Us+5G+rtxkYrx9y4SXT0Alf
	5B87/YcQgoqDI/so1/z32pvt1kCLIazQq9q+a3X+J6yp0xRL19UycDrRtAp60PTpdAuzt9Qn9P0
	n+cN3OOd6p2jZ/PuroVcpaXgXyqRhqCyX2ub6KA==
X-Received: by 2002:a17:90b:558f:b0:37f:be6c:f3f2 with SMTP id 98e67ed59e1d1-37fbe6cf68emr5802857a91.2.1782716021484;
        Sun, 28 Jun 2026 23:53:41 -0700 (PDT)
X-Received: by 2002:a17:90b:558f:b0:37f:be6c:f3f2 with SMTP id 98e67ed59e1d1-37fbe6cf68emr5802847a91.2.1782716021018;
        Sun, 28 Jun 2026 23:53:41 -0700 (PDT)
Received: from [10.204.78.62] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3801dcf2196sm289571a91.1.2026.06.28.23.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 23:53:40 -0700 (PDT)
Message-ID: <0f3a199a-d9b7-4d8b-a17a-85146c618977@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:23:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: kodiak: Set up 4-lane DP
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahap@qti.qualcomm.com>
References: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
 <20260429-kodiak_v2-v2-3-c3a703cc30eb@oss.qualcomm.com>
 <akCGiJU2pIlLEi-D@baldur>
 <s7gon4o57b3fe2kuz5lell7yb4iw6tdmmg7l3emapbqkwx3ml7@irg2myydcmyb>
Content-Language: en-US
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
In-Reply-To: <s7gon4o57b3fe2kuz5lell7yb4iw6tdmmg7l3emapbqkwx3ml7@irg2myydcmyb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ObKoyBTY c=1 sm=1 tr=0 ts=6a421676 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=4MOLs5CX9ZFlVaH_dukA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1NyBTYWx0ZWRfX1q9F07q0rLHn
 U9P6zQtYhF1BEjn9gYplO2S1lzqXERnyxs2wH58S/2PknUsVGE4KzmUFMos/s7aKgwQKo0tIMPX
 G7eDB40FO7vA9QAGqgoJc+Z1HbaB42OgfOOzNE4z7iEjL8W5Gtvy5HVcnVEQDhWHJEryAiYaeeK
 sEAof12k2y9KGwwpK3X61zQp5GtD3eOAZlipYmf2sWVr+xHxpnFwHrKBDahI0E1tUGPuaSUMtsP
 d3NveAvCflwbSIxiDLx3+NjjnlCxyVT018NcQrF7AWl21mbG040WghCAw8tbX38CtaAYbSit/8F
 eGzkMKCeATtUHhi6vMSQaf2r85ay9TVDAUnEbBQB7H7kWjnSCcBsrN6F6o2/c4NFNm4sMHCwUPD
 o6qTnk7xbi3O2NjdxgoWPsghl/E9vbMpNnbmGKBJ7zvV/84HKZLHzE02mn19/er9BEuun9sUQoS
 bhr2sUxbEAKB98FisPg==
X-Proofpoint-ORIG-GUID: WMsJIvcAsBcDduwkIM0Jazg5n59Ctn5u
X-Proofpoint-GUID: WMsJIvcAsBcDduwkIM0Jazg5n59Ctn5u
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1NyBTYWx0ZWRfX3mJClIjg833Q
 0upr/5PynRP6vZohCdFJMBQtYfHG0eLStn36DOXpm9WlSRpo/wjix49n/cVzRFJn0YHh8priNyZ
 V+gL6Pqi1rgCSG+vRZPAAS3tPze9D3E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290057
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114858-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mahap@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mahadevan.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mahadevan.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 816B96D6BA1



On 6/28/2026 5:51 PM, Dmitry Baryshkov wrote:
> On Sat, Jun 27, 2026 at 09:28:47PM -0500, Bjorn Andersson wrote:
>> On Wed, Apr 29, 2026 at 12:10:42PM +0530, Mahadevan P wrote:
>>> From: Mahadevan P <mahap@qti.qualcomm.com>
>>>
>>> Allow up to 4 lanes for the DisplayPort link from the PHY to the
>>
>> It's hard to follow your thought process here, as you didn't document
>> why this change should be made. Start your commit message by describing
>> the problem that your change is solving.
>>
>>> controller now the mode-switch events can reach the QMP Combo PHY.
>>>
>>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>> index 0acc6917d7aa..204513a6bd89 100644
>>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>> @@ -5704,7 +5704,7 @@ dp_in: endpoint {
>>>   					port@1 {
>>>   						reg = <1>;
>>>   						mdss_dp_out: endpoint {
>>> -							data-lanes = <0 1>;
>>> +							data-lanes = <0 1 2 3>;
>>
>> And as Dmitry pointed out, not all Kodiak-based boards have 4 DP-lanes
>> wired up.
> 
> As a bit of explanation and context for Mahadevan. The link between DP
> controller and PHY is 4 lanes. Historically we have been declaring two
> lanes here because the DP / USB <-> PHY interaction wasn't finalzied,
> so it was not possible to use 4 lanes for DP. The issue was solved and
> now most of the platforms should be able to have all 4 lanes here.
> However in some cases, platforms like Herobrine use this as a quirk,
> because it was impossible to describe various quirks that they have
> implemented (in case of Herobrine it is a fancy 2 lane split / mux).
> 
> I'd recommend the following approach: enable 4 lanes in the kodiak.dtsi,
> while, at the same time, leaving 2 lanes for the following boards (which
> should keep the board-specific override for now):
> - sc7280-herobrine.dtsi, it requires special handling for 2-lanes
>    topology
> - qcm6490-particle-tachyon.dts, it might be missing a redriver
> - qcs6490-thundercomm-rubikpi3.dts, it might be missing a redriver
> 
> The Tachyon and Rubik Pi 3 boards might be missing a redriver, which
> would need a reprogramming to support proper 4 lanes DP (or they don't).
> Anyway, that needs to be confirmed by somebody having the schematics.
> 

Thanks, for  conclusion on this, i will update the changes validate and 
repost.

Thanks,
Mahadevan


