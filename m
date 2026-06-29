Return-Path: <linux-arm-msm+bounces-114938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pNS/EqlDQmo73AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:06:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 494E26D8A6C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:06:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FLfEOkqD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="KFvRns/v";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114938-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114938-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2B7CE306143F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B791C3F8EA1;
	Mon, 29 Jun 2026 09:48:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBAA3B7777
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:47:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782726480; cv=none; b=DZyIn1T2UeIiVx48XK68jbvX7XdxKrkQXxxgAO9wyDPwZeJLDY4hnPH5x272uT55+UFDKCEmNYhuEtwCxnO3Mas+ROse4TgDnNxLyr7Ad277Q9+ZUwxi0FZHxaTsuIngK7lCTNpB1RvRzpfYq0wYHWyILyR+7wL3IuODvNtyE3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782726480; c=relaxed/simple;
	bh=3sKb5hAqpbFIkaMDbntJpobi8ZtCNLD9OHyefQBz9zM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A/Z5gU9ak9jx8Aw4OfvM/liC2TqvfiQeKSS+6wsAjBEwhxrtlNv0x8FCZ9xK9rrCcx8j/wAkXW11Umv5UPTDbHnQSDciZFeYOYVniQfx/ZNJT7pqf66M9ZVsYf/5bpoXajL7XuVV9/d621jxxACmYj3aDPG4wCgvG32Cnqq4X70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FLfEOkqD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KFvRns/v; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6sMPS2143147
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	udELQge8o8Cc8LFf2Bfb3cre20OMyZXNF1FUTy/8J6o=; b=FLfEOkqDf4Odkdjg
	5T+TlfeToR8U9JrvZO6jjRMpbVu7+/QbFg2DzctUQsIm1TrsPwL2BF+gqmgpxw69
	HFc9W7zlPD+ksC1fZ0AM9KjV5Y0zSWRUSmvNDE20c0CvXPTMwbtVu01bUQYJTIwG
	qsiVXnS6RrkHJJX/smUceHKdtm6roS6H2BI01GoCVxIpwZUWN8wpRV4XF2kIC8dy
	7ihW/DkO/Xkj30WmIKYG4Cx/cGEQX3U6r/WCaYpiN7ijcP08qbhpqNVUgurAwb0j
	JGV1AHqpzrDuH4oM9Jp/uMzmJk2rCsIH+szIENyRNu149Tx9dm/ze6/3FYiHpitc
	h/DfsA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8nvpw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:47:57 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7376ea4bcccso46402137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 02:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782726477; x=1783331277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=udELQge8o8Cc8LFf2Bfb3cre20OMyZXNF1FUTy/8J6o=;
        b=KFvRns/vF6rvgpQTs+LYDuvCzGU7NTC81joVcyUu11muAhbv/iKhX8k6edFETFQ8YX
         DjdJpwlE+d1F0ApsolRSO722UHe6QumqQt497QygQHDzA4UIxCPwsKosx3Ie+dAOkstC
         GUdAoesWQBnooASnv8a/y12rCVjZLtcvBMTrCgK7ne7CHAzWQCBN2JdpUmOlrXl8EU1v
         HTLr73e5g0oIn7kxYOaiEnTeVlBUMwxXlDD33TtskQie+pG5ImzY/g6o5yTqjACXApq/
         TuWRDoB2oJiPmiZTdPBMf+qKy8CKzDhL/Y1NT8BUzCZa1+xMPNNU3jzGzQOJd+wB8aH3
         NGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782726477; x=1783331277;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=udELQge8o8Cc8LFf2Bfb3cre20OMyZXNF1FUTy/8J6o=;
        b=bVLbeKWBct9MfY1po4yz4qyRS88Mpt5t23WOqGzA+OHKlkcAfgzliq/ETjjqC8t1UP
         a8dfVMm9XpK5QBVB/B0Pe/o8ojSyeDYy7L8ssSNw1dtPg0aCurL5tJfXogQiy7ToEkUo
         LN0/02qGh5vz8a9I77uHH7OODuwn5b/mUxyS697XbCanO67/3BnyuuqOiAKhmmLMV+uL
         M9aTmywGsnw1QAwS0/Xv9e9d/IH8HhRsEvxYd+/OoOv7fAL4V98pN03iRJA5PHGdeJl0
         VMH9g8TP7PkDvp81kg1KwxlBoFShWDjlQz5KJ/2fEkktcU5cb8TvnoAN2OzYPdyBXqfc
         kI7A==
X-Forwarded-Encrypted: i=1; AHgh+RoOOFP8sZR4RP1xqP452VDqO2wtvHS1wplwZzlufD3s17575GRco717jFg21oooA13kkg6JxLXFb6sIT/du@vger.kernel.org
X-Gm-Message-State: AOJu0YyvtcmAVBcvnGeGqnqWh+ioz+NkR+Q9j6W7jvbf718eOvGqDYFe
	rwBlfeOg5DOZqoykewQ7oKwWX6YfiaCXNG4b+g/m1IARYcLIsFvwt169I0b7B4302pLKc8ol52C
	zjak5cTovRfogB40nNro07kVYj52kcsSV9cydwnhG7t4XoYMfnaii7b2knLac3tLMjhx7
X-Gm-Gg: AfdE7ckqcwOPpexLr4YmdAbJWTvSIa525n8EIDAyJhH2FrBD02quFhtQvtFltDZ/DjT
	6Nik1Oj7FGiPixrWLW4eG8LIMmcRvjIZK2RuCNQYg+qwYaQJh+8jheTpRdgfOQ+11RXeXgn9zBp
	PQsSJ9UHJH/GIKGb+xRjIFCU90wK4Vbx54pV14mTvkTJOCF3rU0/Cg5dSVHJQLeggA0LbohhW+h
	mz17QOVO7dZ3PmhTWGtCR/efHlZmw6TGnDEJk6hqF1f2VbkGzmNMZ/y8TngosJjDGw16HnrYv/Y
	7Y3hX7QJ9Bm0qDb7SUGlZx3zzRz5YXr68gJDGwVf6vWdp4QqOQEZOpwa5Fe4mWnXs9mH907ulkU
	sceArHtFmFLGYdpc+8QZm6HHllhqOHSOTX6Q=
X-Received: by 2002:a05:6102:3748:b0:727:1311:19b7 with SMTP id ada2fe7eead31-734366c149fmr2247562137.6.1782726476764;
        Mon, 29 Jun 2026 02:47:56 -0700 (PDT)
X-Received: by 2002:a05:6102:3748:b0:727:1311:19b7 with SMTP id ada2fe7eead31-734366c149fmr2247554137.6.1782726476317;
        Mon, 29 Jun 2026 02:47:56 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f4bd36adsm6876708a12.27.2026.06.29.02.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:47:55 -0700 (PDT)
Message-ID: <159cefa7-63a3-4b94-8d09-6b652002bcea@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:47:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
To: Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
References: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com>
 <20260625-glymur-send-v2-2-00905324ffbf@oss.qualcomm.com>
 <c6966f05-b1bb-4b71-8373-c90995ab4cc3@oss.qualcomm.com>
 <20260627190612.27271-1-jason.pettit@oss.qualcomm.com>
 <e7bal26fyufjh2f4j6rh57bcdvubp3qqydk4pjagq3qjdz3ywz@wtfsiff726zx>
 <20260628162913.66306-1-jason.pettit@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260628162913.66306-1-jason.pettit@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3OSBTYWx0ZWRfX6nkmmUcWxlT0
 hp6fe65P1QFMlU8lAomK8ixQGXypPb1ve57+IIlgIkhS1nXppvcEkZNTiz4plGiK3UaSkGp2GD5
 T+ZB2hMg+Y+RKnAi5Zss4EK06ElQowg=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a423f4d cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=4GzbeD6DXjQ7u4-lyF4A:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: GUwbxx1blv4y5RtezasOlW1aaB7QhJE4
X-Proofpoint-ORIG-GUID: GUwbxx1blv4y5RtezasOlW1aaB7QhJE4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3OSBTYWx0ZWRfX3xopGz8H8SRK
 iMSFRaU/f4Pfhgcxj0fZ+mxpe3/q7TbQMrKndu/9c5Zdgjv4HV8rpkf/DmHq+WKVjN4F9Haq09f
 MrgYXIbKxBoL+qjfltxyop3RnbCMz9smXRunCYS9+QIJBEEbwQXzYbo0aw/NOVrA7z0Nv9sO0lp
 PwLuxBgmKRVEcbvhqvP+lk0UpWla6lBGHQSaL1KQbkwljaiDJp72rzwhDhNMiLgE2yzX4TW1Vfp
 YM+b88ihaJcQ7EMmDu+kwUwjwHKtRFNiNDJITOj5z2cjddoBk3Mx3B9sv1REQUw8YJMXjr8iTcD
 GO1jCqn8wMkad9LmLWu8ytTAOTRm+dLUiVPipG87mRCYMxvsYfU7z3mB7jrlGoFTLf56M1em6mW
 X8o/AdEQKazXT7WIjhFlxF0yCEahlJL5PTDBop3MIGj1H4zGN5WQFOhAEdhx+2VW/nD1AMsbjpk
 5/S7yEiE/zOoqZQ/UZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290079
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114938-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jason.pettit@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:mahadevan.p@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:ananthu.cv@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 494E26D8A6C

On 6/28/26 6:29 PM, Jason Pettit wrote:
> On Sun, 28 Jun 2026 16:02:24 +0300, Dmitry Baryshkov wrote:
>> This is very surprising. Can you check, is it actually the DWC3 or is it
>> some power supply that is being toggled by the USB controller? In the
>> former case it would mean that we miss some bits of PHY programming and
>> still depend on the USB host / USB part of the PHY.
> 
> I tried to check this. I am fairly new to this, so I mostly poked at it on
> the hardware. Here is what I did and what I saw, and you can probably read
> more into it than I can.
> 
> 1. First, with &usb_2 (the dwc3, HS-only) and &usb_2_hsphy enabled, HDMI
>    works. I looked at the power state on that boot to see if the dwc3 turns
>    on anything the DP side might also need. As far as I can tell they are
>    separate. The combo PHY, the dwc3, and the DP controller are each in a
>    different power domain, and the PHY's regulators show up under the PHY,
>    not the dwc3:
> 
>      gcc_usb_2_phy_gdsc    on
>          88e1000.phy                       active   (the combo PHY)
>      gcc_usb30_tert_gdsc   on
>          a000000.usb                       active   (the dwc3)
>      mmcx                  on
>          af64000.displayport-controller    active   (mdss_dp2)
> 
>      vreg_l2f_e0_0p94 -> 88e1000.phy-refgen
>      vreg_l3f_e0_0p91 -> 88e1000.phy-vdda-pll
>      vreg_l4h_e0_1p2  -> 88e1000.phy-vdda-phy
> 
>    So I did not find a rail or GDSC that the dwc3 owns and the PHY needs.
> 
> 2. Then I removed &usb_2 and &usb_2_hsphy, rebuilt, and rebooted. mdss_dp2
>    still binds:
> 
>      msm_dpu ae01000.display-controller: bound af64000.displayport-controller
> 
>    and HDMI-A-1 still reads connected, so the PHY seems powered and the AUX
>    side is working, but there is no picture on the monitor.

We had this odd symptom on the Yoga Slim 7x - but the USB controllers
were enabled.. although we had some issues with USB/UCSI itself..

Bjorn recently discovered that the eDP PHY support for Glymur was
incomplete. Maybe we have some holes in the combophy driver too..

At a glance, this seems to be different vs the reference data, could
you give it a spin?

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index cdcfad2e86b1..cbb685299d73 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1675,7 +1675,7 @@ static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_hbr3[] = {
        QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYS_CLK_CTRL, 0x02),
        QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_BUF_ENABLE, 0x06),
        QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_IVCO, 0x07),
-       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_EN_SEL, 0x04),
+       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_EN_SEL, 0x3b),
        QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE_CTRL, 0x00),
        QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE_MAP, 0x00),
        QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_SELECT, 0x30),

Konrad

