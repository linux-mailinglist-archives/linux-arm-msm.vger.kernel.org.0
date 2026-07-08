Return-Path: <linux-arm-msm+bounces-117749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id syRZBoBrTmprMQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:23:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFC1727F2A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:23:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SR4vaGtb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=d+bnk+lV;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117749-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117749-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA9943336806
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7AC439340;
	Wed,  8 Jul 2026 15:12:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3084439333
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 15:12:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523576; cv=none; b=UPusNC1V5huUg+kS0pp1454n0DCWicHyEyB2UI508SNVjNhpydyUfP8xjVbajVh0krILlO/yxlGTMYkYhcX4UGEj9iP1FMiyrU+3w+fj/FEmoQPhlBrw8wylahvj5fZon+rV9n3nSR8OnhB+7NBgNdyvZ9gsZHNjdLZ7Xu70o7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523576; c=relaxed/simple;
	bh=ml9OKoKuvQkNMDPzlm2vusWghZV3h8XcdIJnFruorv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pJ55Huj6WBOfaabhKsVMLxw1bAZUCdxVgv7Wu9uALKykXqh2DpVXo3afevhUK/CqPNAbbPzhhm54L5FAFy7VoOxDubr1mYHnJtcBB2XvbdngVTpCfkOHeNCzVvrlkqA0sV5vD7rtN5Ifx7Q93prdYZjCvr5vtZSkpJI/Hi7QCMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SR4vaGtb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d+bnk+lV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C43lu2752166
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 15:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ei9xdawI96PONiMmH3UZ2A8JF/Q0FwZz4uqQVshS5TE=; b=SR4vaGtbf3vX4rSq
	fn37ykWmBrNySEn06BWaqawzc0g+MyRrpMUz7J28BissuCYOAUZWBNngw6PfSS8n
	nw3wXw46n1XFMd6bbMyBMHU++iFo2e1MSxGd75pHlqJKIzMZmtYFI2gQHGGyxD0t
	EhOvxyqbVzpCf9Ahu1ntBzFmpfBCmpZeeU4EjpD0E7IVs4yJvYfQdG/mr4UctTN1
	tnyUlkdHE2dn6Xny08YtXIiCoA208d0Hv1QHoJM3RtJQ/DDjKf6h1DQ3PW+e+xxn
	KRElN0EU1UPqe8OT9KB/AKefy+WJXKQPuMG59CJaQbJKWZwzouCElRtpMNi+7L6t
	jvimzQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9cssu3h6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 15:12:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so1275328a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 08:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783523573; x=1784128373; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ei9xdawI96PONiMmH3UZ2A8JF/Q0FwZz4uqQVshS5TE=;
        b=d+bnk+lVqH68dvS1HfZIwbK7Gs/1GaogrgEXg6V5/2usyaHLTBEEopfvvpNxYpD72C
         u0QpImAvlUPrmGi+0F8mNE65q9J6QGAXE3cxnXDweXkxj5npPJcsX7xYXKmcAi9YD9qA
         cThAWD4n9L3UmJj/Re/Dk3Z0gCklRfmpo/SBicLA+b6LuneEjDeAj0uihRQ34XzGiC+G
         CtwNBKlVb3CFBFOD1R1O17UprOTOL+Ra4WVNwsC4rRYA/v8iaAo/p3HU1Bh45QQVBt5/
         tgLI/BJgA8P5J4A8iFPD8U/xXe1obO4lOLXY/x8AAGsTpaE81ifSJgFfBLJD443pxo7e
         B5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783523573; x=1784128373;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ei9xdawI96PONiMmH3UZ2A8JF/Q0FwZz4uqQVshS5TE=;
        b=c5u+36lYBcX9Zzh0rFLJxhA3tIFm5zCYrBKZ3tgCdA5phqCnpVao67AozBA4jABCAw
         I4RoCqkf5+UCTR2RlJ9CW5vR7G9A+efZxsm224mjdH1+ZCXmZKj6loUQq7EHSddDNfF+
         xM0JIFuDiALhZPzmFDRJLZPD+4vLAyruI9xRbHOdNASesnnCGHiBZFyJ03SAzkuuaZ28
         v53oob0/Zzu2AqbvSKhDaJX7+a+BDGd58OrbxRZk+xuA8Appb5YidKnB/eAg4PBNumh4
         JVa7CEusQjb1t41M2OfSiMfFP4AxrYH7ksxPtsmYknEQkjTnbXtFD7vESEJoC1Qi2LWX
         gM6Q==
X-Gm-Message-State: AOJu0YxR+6nNy0gRHrka0nBKF77b+vQAt1+WrKiDE1hgiNYfApLEZyLH
	0P/6RaiiazDsrhTRbXDA9LxCw4qDc7/raa24fYqcHSMqjqR0D7Nlb7G/htoTYj0tZeR7cD3/U4L
	s2/2gWNgbIy4mdP8m3Tsa4Mem5QOnpxkT5f/46O4gUbhy2hfPlSTk8qI0SB3/HqdXamhO
X-Gm-Gg: AfdE7cmP9Pjhz2qcXUxkrfHfGM4d1xDbXACpNHC04+ihUuSWXfvyroHOBuRW270pw0z
	J+U1Zc+lX3hDsERg2zEcMNKxVlStft+SNyP3XLZj/fBTuZkYqnnnmvBnCWd/KC6JHZEzsG0TrZz
	ZqBTbrDkVqyUzDskNPAtTpoUH8wvVH4XvhBHIdrCOfVHFaGpUSqIVcGLi5sgd1i9SHp+76YEBw2
	K6B07hRD3TNbAmZKBuyzYqckU3BMHPG1AshSHw3AzI4U2h/U7TcpsflFljiPdLf48BJMGMbH6Q7
	ae/lEoo825rZZcuqHI9wEFzVaiiGnQXUMym4FvS63Rx+/apv79q8Q/D6hSZLiofQnQEN2wr45C9
	S+ZlahdU3qfSXb3EeykMBFk8+Rr+UxnEjkAHuAe5yaln8x1aIl19f/NMSy6sgfyLX+zmo86RO6g
	28NA==
X-Received: by 2002:a17:90b:2709:b0:387:e0db:3d88 with SMTP id 98e67ed59e1d1-389434634ebmr2919963a91.35.1783523573405;
        Wed, 08 Jul 2026 08:12:53 -0700 (PDT)
X-Received: by 2002:a17:90b:2709:b0:387:e0db:3d88 with SMTP id 98e67ed59e1d1-389434634ebmr2919927a91.35.1783523572957;
        Wed, 08 Jul 2026 08:12:52 -0700 (PDT)
Received: from ?IPV6:2409:4091:c00d:4a15:d9c4:b604:397e:f06e? ([2409:4091:c00d:4a15:d9c4:b604:397e:f06e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56848sm22125489eec.16.2026.07.08.08.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 08:12:52 -0700 (PDT)
Message-ID: <b0e727ff-a6a5-4474-a045-e946edb15276@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 20:42:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: shikra: Add LPM stats support for
 subsystems
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260703-shikra_stats-v1-0-0aa0ec1fa83e@oss.qualcomm.com>
 <20260703-shikra_stats-v1-3-0aa0ec1fa83e@oss.qualcomm.com>
 <0c6fde07-990a-4c0d-b1f4-34cc61d905a5@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <0c6fde07-990a-4c0d-b1f4-34cc61d905a5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4e68f6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=y0HZvo5VsPpfka8ii9AA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0OSBTYWx0ZWRfXyH+e3SYzFUos
 rysuR9eQavautKitizn1Ld3iTFGEUqjAVIxYeich2i6sC/t0Ai/gItbNnlWIQVAI2chBYHHOZHV
 NllnI6KkDBWbLRhiPXl/Fl0NbAna3/sx0MGDFkBDex8rvxn0bnnlqjULB4dQEHtohVuf6KZc3Gb
 1V8nHOhRhHF+MaAusBiINLFkEIFaP2yqDgZAwJCXon7iSIL8Ze2GSKdqK8KZl5kIAEXlKyBNO87
 lnH1X4OWf843wgxfllS2hKFKVzU0Y35WaHCCpkM0Li6DftInYwJfyydV7In2OCtHhF56cco7/lO
 R+ehq98oHuVmqmXL/KSf5u/5zPmWGp4A7q9WwytHZmjlhbuc8TtQy5YQz4o5tFqGVualKDSwOyA
 3Qjq+J8vRTh6LMe4QMIny03G4M/XWnzMzSIGR7t+jJGyE3i9T3niy7zTj/L5NQynYtJg+CFx/iL
 fbUIcCm53lqkX7dygXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0OSBTYWx0ZWRfXwr73qCl9ccT0
 3yMcavE2/9q713vRrekQdZ6pZBrriNyDd0EqtFvhtUP57zN9aXI38sdTtzCfhSj1Lex+c+D1Zbx
 Z/F6nFCoC+yFkhsmnANQ96mb/pP68r8=
X-Proofpoint-GUID: r1iaoUgdzujJNWLErQkVHV0E0IWRPs3Q
X-Proofpoint-ORIG-GUID: r1iaoUgdzujJNWLErQkVHV0E0IWRPs3Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080149
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117749-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkshah@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7FFC1727F2A



On 06-Jul-26 3:19 PM, Konrad Dybcio wrote:
> On 7/3/26 1:13 PM, Sneh Mankad wrote:
>> Add support to display subsystem level LPM stats for shikra.
> 
> Explain the problem and why you're changing the compatible.
> 
> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

Understood Konrad, will add the explanation in v2.

Thanks,
Sneh


