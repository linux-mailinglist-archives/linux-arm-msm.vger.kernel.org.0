Return-Path: <linux-arm-msm+bounces-111836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0YjFJ+OiJmoraQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 13:09:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CE8655835
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 13:09:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Xh/NHPl8";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HV5Tx1xU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111836-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111836-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C056D30FAE79
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 10:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE883B7B96;
	Mon,  8 Jun 2026 10:40:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B30A388E50
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 10:40:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780915229; cv=none; b=OfPjY9Fcwb8kOAcy7cjgsuNtsz3JQebM38qpsaeqK/3hHx/dEa0CKcIlFbM4t8Y9ShXAoMRMt9PMues7YVPO8yEn43RlhMQIhr1BCC5f7/QvKl8LVa+1Hbaxr2D756iezmB0IDs0AJBJng9CD4XXj04SQdVrbEHyIzIf6+xKn7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780915229; c=relaxed/simple;
	bh=mVvTmTFwOrEZPN7LSlVxRMK7dPOvMgDe6crr2ypA51s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KrKZsVy5E+IgMtQzgAPO8LNZwbIX+dDZHcdob8g6+tPwftBviJmjtLSGTrVaptQmKdvOPKwB/vadxptLs/9eein52D/Fjb8MnnUFwdKwQ3a1dtSRTZZeuAA6ExO9ocEaCqxczr9AMmcb1KKTOgp22Z21u+02Qa2VDDICZtVY8iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xh/NHPl8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HV5Tx1xU; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658A3PB63308933
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 10:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tveSNRQ+h6fN2eRH75FNEmJTO0yYAeUsEKQ0M1WDmbc=; b=Xh/NHPl8SuBYxP6X
	caNzrzGEU4RACsw9uhw+2TwPnuajGd9102JDEiZeiZ7bucvwXPV1rRBsQ3CzdHUf
	n5RFO7d3CvX3uTOIqyVgWNQEVCwDDkJ9JeGeI9Xc/oU0wr3eehmyRA+k5ssidZS9
	UmzCA5I1RCChgGLmbFMoXEbvWNmZKgHzVFlGCHaO3owwK+fTGK4Yaz8HqyXP6V9p
	KIpvWBLYn7cdfz5oeWOqlxuMLiqPO/ADJC17v1NE//qGiBWfIMjcmFue2G1+FMf6
	T+c2uMliiCR+aqePeDyJHfPJerRlUFyEWdd0rJNla5wX6P1IRU4XqpwOu6OTEs+C
	UoWB5Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun8g5f0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 10:40:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915a4ca0a4aso135477185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 03:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780915226; x=1781520026; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tveSNRQ+h6fN2eRH75FNEmJTO0yYAeUsEKQ0M1WDmbc=;
        b=HV5Tx1xUYzWg7SG3VpMih8AOqgUbJuqIymxWZl4omPPcH9w7+ys36mSKnnFypS4NZ+
         ujzZPtvwFf6B2o/WKrWiIhJdx6y69sBUzks9b4AtkBmYe//r1M6VHAzWjNMUx9xHXFgt
         qU6R6KpgWFcqf5db3ceihkBVNXsdsrLjMA9FmDgqBe342w58enNjdChGaZgI1cUOx47E
         mP0ZgxsdX2mURPcyDZUbRXhUPBNP6RcsTKXbz0HnyCAFLRPNbVwOaGrzk1t0OtbrCz5j
         o+8UuRidi/sZJcrrYAG75cI8D5pXY+dEm/6wbhIxbTQEszsELwoQvO06ct7F0qSBDXJY
         8RNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780915226; x=1781520026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tveSNRQ+h6fN2eRH75FNEmJTO0yYAeUsEKQ0M1WDmbc=;
        b=WeRU6UU0GsBkM9vTv6z9djoeccroYdjtXt9fyQf30ZaTR1VodXaUcUbTqwU1Oax1aA
         puWUbRRMGKSv9bhwzEs0hnyTmd90mv96tHG/DNhG8TfJ+W6XoEVXM/FbfGwARJAIsUfb
         8hi7DpFEgFjaIb5RSr7kivqLJkJJOmB8U/q2PH8gL+zN93OSDUTgXK7RrtJkAQIg+Hnc
         N/Ch6bgaVrupQ4QIOlAQOUZbJIyq0yC4gT182BokEivpeNkBrmfYFC63RfG0KHmohfGd
         ugVnKsi7Yz4YQ10rJzablOVrs2EA4/gRsVxtcPLbywWTPKxXPDIJJ1fnG79VwN44fUTp
         gRJw==
X-Forwarded-Encrypted: i=1; AFNElJ+6JHzxmK5ioh80AGZ8jq0G92EKdFLFR36VXs/D3RFraTfkvaaLN//+rwAP1hUwuXm2CSsf4faup3DXLkWo@vger.kernel.org
X-Gm-Message-State: AOJu0YxbHob/HFq6lYZNuHHbpLOIeLOm52Qln5OHEWrz27kUSIQdHquY
	1EyTNhcaAlEVp0rO2w470Dy7q5N7uuSzr7zr19FYMYitcl9rrDdjSZZ9U+8Fyor3DUYR0StISg6
	oU3pUGykAd8wm8HBQYOSABaLxvS+m2+E+qjlGGf3AbdRABbr8tKr+1OLUgZ9JLvBlcFAp
X-Gm-Gg: Acq92OGyW8JWnJanftCOrxz5R5LtY0HNgeDklZwXbxreb8fYZM6SbdS4/xdb1LNFkGK
	QXwJ8ebt3l/HqfbFkF5T5W201KrMM6Wq3aiTKE2qPIZ22yZBaWPC06+AkyUxgSLLwkkxbGRkhNr
	gmK1798lCFx90QEcAIct4W5zGzB0aku1Yx9DimhoBPPdt4cE6R0qWnZMesD4e/UoZTeDH1ln1V0
	W83Cz8bpIGQuKn7uIwol4syQb6xMKuKSqlEj8wLMURt9pX+8S33uAF6gUIckzAuTvqZ2BEG59KB
	pg0MCuEg4jE6fzPglJSHoP2se58d0pe5gOakAq5bCOlKuwmCG04crYAeiywCpImaiwJ3lGR1gCH
	+RGvLd8o0jQVW7O+RYcbIRRr1WAwQcuwEI14Op59wzfO4HSqUGGEIpdYG
X-Received: by 2002:a05:620a:28cc:b0:915:4ca0:1210 with SMTP id af79cd13be357-915a9d9a69emr1477145685a.3.1780915226532;
        Mon, 08 Jun 2026 03:40:26 -0700 (PDT)
X-Received: by 2002:a05:620a:28cc:b0:915:4ca0:1210 with SMTP id af79cd13be357-915a9d9a69emr1477142585a.3.1780915226033;
        Mon, 08 Jun 2026 03:40:26 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65868049sm6890844a12.24.2026.06.08.03.40.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 03:40:24 -0700 (PDT)
Message-ID: <cdd7d88c-224d-49cd-9a7e-6d4a2ae74d01@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 12:40:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] soc: qcom: rpmh-rsc: Skip TCS init when RSC is
 managed by firmware
To: Gekko <graham.oconnor@gmail.com>, linux-arm-msm@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robin.clark@oss.qualcomm.com,
        lumag@kernel.org, abhinav.kumar@linux.dev, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260522060645.4399-1-graham.oconnor@gmail.com>
 <20260522060645.4399-2-graham.oconnor@gmail.com>
 <934e6039-4639-49bd-8cf9-a1674f86b8c8@oss.qualcomm.com>
 <4b911ed0-64b1-48aa-a00f-e2ade66afa1c@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4b911ed0-64b1-48aa-a00f-e2ade66afa1c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEwMCBTYWx0ZWRfX6P2x3OXHc/zP
 iSYuSCYndEzmmP8yFat1sj2Kn4Go64kUeUI5e4cp48XPNHrb/Kls/jKNatc5zibICIdQajtXffp
 y0MjtqJ0gBbENRm2+Rgbp1i911Sicv7TXqDnj/gI7IkYgT7qbVyOL0E5YAtBpWF1CrjTTcSctnA
 CYVs9P4jn3OdyrZ+eMvqeBFl6j9Qu4X3WPHhmiWBrPZDevm+nzg0fAQxcT25g67Y2iSfFwCr+ZC
 CTfSscHNve6cc6Hb8noGILCh5yeiSKKhit/xbjPa1Lr8663KASHwrgFhbZFobf2O6E4gs/5l4Gb
 ixyk58LzxkXwVPugSI5NEUZhP9Omfn6Mn/JZ5I/99t+f8qehswutHtu9NTjbSRgRBEwOyjHRrqW
 lsJY8byU3h+AIN9KhiV6a7znJo+6wXzCQ3vVTw5IjS2bSitcpnTwkbeckWoH/lcVrGa8ELxttU2
 VH8PedvDpGCqtPeZGlw==
X-Proofpoint-ORIG-GUID: JdHwSoTWQ1dX0f7E7C5P9y1U61wUhkCp
X-Proofpoint-GUID: JdHwSoTWQ1dX0f7E7C5P9y1U61wUhkCp
X-Authority-Analysis: v=2.4 cv=Z7rc2nRA c=1 sm=1 tr=0 ts=6a269c1b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=dIxFNMqCpUz1sDLjZpAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080100
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111836-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:graham.oconnor@gmail.com,m:linux-arm-msm@vger.kernel.org,m:maulik.shah@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:grahamoconnor@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A6CE8655835

On 5/27/26 10:30 PM, Gekko wrote:
> Hi Konrad,
> 
> This one is confusing.
> 
> I started the bring-up on this board on gentoo-sources 6.18.18 but the board would not boot. After an almost subliminal flash of tux the board would lock every time.I found the solution from PostmarketOS who obviously faced the same issue which formed the genesis of this patch. With this patch applied the board booted fine so I've applied it ever since.
> 
> However, as a result of your response here I tried booting my current kernel (gentoo-sources 7.0.10) without the patch and to my surprise it booted just fine. This leaves a few options, including:
> 1) the kernel source has changed
> 2) this is a firmware issue and a firmware update fixed it
> 3) It's a timing issue.
> 
> To eliminate 2 I would have to test 6.18.18 with the current firmware, then regress the firmware and test again. The do the same with 7.0.10. I can't honestly recall whether the firmware upgrade was before or after this issue first appeared.
> 
> If it's a timing issue it's a bit more concerning. If the kernel is taking slightly longer to initialise before calling rpmh_probe_tcs_config() then it may just be missing the solver activation, everything appears to work and nobody is any the wiser. If the existing solver code doesn't deal with early firmware TCS initialisation then it could, under some circumstances, lead to the security reset that I was seeing. This patch specifically tests for that case.
> 
> Based on the AI review feedback I've also modified the patch to not simply return early but to just skip the sensitive parts of the code to allow any other setup to complete normally.
> 
> My current objective evidence is that the board boots without this patch and it's quite possible this patch is unnecessary if the above is incorrect.

I would skew towards this being a firmware issue. But I'm interested
in any findings you encounter.

Maybe +Maulik could know more

Konrad

