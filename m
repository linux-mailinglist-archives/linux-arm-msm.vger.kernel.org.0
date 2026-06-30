Return-Path: <linux-arm-msm+bounces-115376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p9zLLXOfQ2p9dgoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:50:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B3B6E323F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:50:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LDVO8bDA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fdwf0RBt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115376-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115376-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E356B310E860
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 10:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A793F210B;
	Tue, 30 Jun 2026 10:41:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC37E35CB7F
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:41:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782816095; cv=none; b=rTOlE//0g8eHEZkzLGDR9s+ui/rIcRrPjT4JiqDrrlWkbcmGA1D5YAY5X5hu73+nfCLfejdd972iM3UoQZU23t43hrwcBV8S55qc4Opc1vMfr3Bf3SjssGA0vDgq9R0+VA7I8RMqj4R6San2KVdJB6KtUfrEj9k+EqxrrEI8E6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782816095; c=relaxed/simple;
	bh=iWaX6WVJMtJ7ws5WZItaEewccN2kytFmN/OJzKHIaDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cWwLI1YAt6lNDnf7oAT1zqrF6Z9s5947aLyWpOBNq6GaCJjG5GoDWgnC1hnQISaiaTqQKIeGJ9OQN/Hmwlk+R/cIo+R5Co7SiGqdYd+9u7dDLq2v8Je2MIjBNogRE4r/jT92/I2s8C+apwW3dnL7TLsIBtQ4U/6AUbAzHWyxCgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LDVO8bDA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fdwf0RBt; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n0to1613519
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:41:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vlnho1IdeTG1KLn7QJL1CBhFhZtKcEF/ADpgXwZC+rA=; b=LDVO8bDApak8l7hU
	fMlRTaHm4R3phtr5MmG9HVCNzXCrW8jm3wlzf+Gkew6L/S1pHL4nYkRdZYDj7xdN
	HXoBPHCTqCv0WTJ8t/MShp7I2hL0csuKcGtrZPQerDDn1/5ZKymkapEH4jDuhpsh
	lOJXLCK5+MqRu58n2C3Q134mhS/SGAFelwTYri7fYpj4DVPejqhhbGgcYQjQOOzA
	EJiWklXg5KIZSVPFXbzl6hYRe/V7aN52+4dUZYbsPQpvxsDWMg2ei49OKkUMMYI/
	pHcAIWuKZuZ7x78Ioim0rEHs8CVNjr99OYvQPiX+KBoarXuzZnP3O/Y97VvFMvNv
	kitwmg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3x1cucab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:41:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92b79cc1f21so112757785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 03:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782816093; x=1783420893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vlnho1IdeTG1KLn7QJL1CBhFhZtKcEF/ADpgXwZC+rA=;
        b=fdwf0RBthPC1Ad0nB5WeLWH1gziOWRpknYUHWEIwSQzPX4SGf4JIVRrVnm78gRhcXG
         8mbOfBvKkA3KJIAr9RsFTnfz7Ay18VsoiyQuZSBQiyb40dFK+8lJjOedJS6IfOXgfJSp
         CqmJdsbhOUHQSgJoWt6IIy/VVIsyzX5u6inMNtg3e9SUjvTbr7Ki+qTI3sQsvOt9oRr9
         cdKdMLKuO25P5jhKOXBqKAtjo3tD4dPWYVkXY5BcFcsXKRCwWYsFg+SQ+i1wODjBD64n
         ngAj329tv+gr4ThVAIiovUQTIAz5KyamzWGkzbSM7ciec6ozSJzCzVkdxaQrDyzgKisa
         T5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782816093; x=1783420893;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vlnho1IdeTG1KLn7QJL1CBhFhZtKcEF/ADpgXwZC+rA=;
        b=FCGEVESmKw0OAbj96Ee6NmcR8pHQR6RPCDR18CXsXib8gkbSED6WNdreMMOXEKDRiJ
         GhlzCZAGkeoTqgCdHwPiXmgsAIoq4wxR6KRkuz7KB/aHlrC9y4knatVueNEpOdMNr6GT
         /rcA6nUaEjT8ghkjB/batUkqWSyP78MzzgbzSdeAU074Y7XmYRrQUZNwzXL7VruVt4IY
         BiXzbQa/qW882HFsrRIU/qtwt8WfoI3esO6UfeKtT/IJyimfHAARehABjCFtEO8ofsz9
         MgRvp6gKa9XgXpSBrgcGeMCrjSsBCHeYcaZ59nFv3tY9naIKdTiXp+1ynr1wwDgnUL87
         A30w==
X-Gm-Message-State: AOJu0YyGdMbje4WDP982kCOJBIyOORmvh8KseIcFv0tGZvL+XlrC0ipG
	vT7E/FtX01f1NOp+JhLh1J1pZWV87OG2i8BCCnY959l8HSO3KW4BdGcwTTSwTcpo/8Ap7uiwLaH
	mz+lK55afLhLLcKtXBlmn48UycCaQDg43KtnXrLQZYE2f/byLSXcemfN9wZM5uFPun5yX
X-Gm-Gg: AfdE7cmVhZZwgUo9ZsUVTynjEqjv431kaUtj9NPzE+iLcwF2s83ohPK5/jQE1IYBICp
	Yp75MxVyq0XOpMFKZhG+ClVGlMKMw3NwWq68kH62/8ck0ObNlokQfSbpyq0GGWzw7P6KRKMj+Eg
	a+t+gSm4Ohoq2pGeLc1gtcjodeUOlu8ZL6nO3RZShr+0FH7tP+ZutVHLiWVlcclPAFy/uVIJ0S+
	jT4TIacleit8gu0BfVEwBy2Xii4+EICYRPtRRgoYc/RdiYfvmBoq8Opzbif8gKrkK3PhXeVmZ5b
	SK/t9vCdMhS671nPH3vMAkiJNDu6Y28R65HsLIx/e5tk+WWT9b0uYo+Wn9KAmrRS04SnlziecEG
	F0rNDM0YQS8HeE5Ka/2MbhR4cB6CQD0066Mo=
X-Received: by 2002:ac8:5e52:0:b0:51c:f3e:781e with SMTP id d75a77b69052e-51c108197a8mr23758791cf.6.1782816092908;
        Tue, 30 Jun 2026 03:41:32 -0700 (PDT)
X-Received: by 2002:ac8:5e52:0:b0:51c:f3e:781e with SMTP id d75a77b69052e-51c108197a8mr23758571cf.6.1782816092497;
        Tue, 30 Jun 2026 03:41:32 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d694dasm102858166b.17.2026.06.30.03.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 03:41:31 -0700 (PDT)
Message-ID: <75c83eb8-ec57-4ced-8733-94e88fc62902@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 12:41:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: gcc-qcs8300: Use retention for USB power
 domains
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260629-monza-suspend-v1-0-b601d8a2f2f8@oss.qualcomm.com>
 <20260629-monza-suspend-v1-2-b601d8a2f2f8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629-monza-suspend-v1-2-b601d8a2f2f8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5NiBTYWx0ZWRfX9CQuLhJ6otH4
 h4zwO+vd9YyEnn0OpEd1m7KH62RSSru09egjcnatIaYg7oATarqDkKffqaQ+UyOOHiGUNVm5Hwh
 zYZREtqTCIOpDtl4e1psYuwvwIeEUmgpZ5weaHB+DUIbyRqNDqGFgs6XTuxurFtQhE0xvdnZbgd
 rl1Us78Xcwm3q8b01V0Bet54KmwkKIz5zazsEtz6JBsSAkPc7FQOHa7KcFSlMO8nRbqxLXKnYqY
 7r3CUc24VaPOkOjlAcmoE3pQ2VPDn7OIA5MEb8IBBrt684x3dKiQ0ewBUjvP8aS2lTZYmu9ECbQ
 1LAqpYbAZgWjW6mQVD8MsK2vwkGO/+iqpnCOAd/nDHi2BuiQoh4Qj5vr35eNz1C0fJ3XtDU46QV
 YMQyaFxHswr7ko8Z3iYjqAzyZaGfDoxpACzeoDT9qYFW1OI1Gn0JTcvz4CNI2aRqJSfRXfmI6LW
 h1NodReCWWkYdNm4cLA==
X-Proofpoint-ORIG-GUID: v9e0ITobxSil_jHxF3GlF1Indno6LEVP
X-Proofpoint-GUID: v9e0ITobxSil_jHxF3GlF1Indno6LEVP
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a439d5d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=vtxEUVkT7waMBiOsAPUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5NiBTYWx0ZWRfX+cZi6Na27bxi
 LRpXNu6UO6APwVpHAnkBMYXgv8vMNe08NSXJz6uwIeTo0jTw/ixltQT9BHFEuV2/JjXrnN8Xq5D
 aW4XKPADPLZiNPYZ9FdpmM1Zt7J7EDk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115376-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:quic_imrashai@quicinc.com,m:quic_tdas@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 25B3B6E323F

On 6/29/26 9:22 PM, Loic Poulain wrote:
> The USB subsystem does not expect to lose its state on suspend:
> 
>   xhci-hcd xhci-hcd.1.auto: xHC error in resume, USBSTS 0x401, Reinit
>   usb usb1: root hub lost power or was reset
> 
> To maintain state during suspend, the relevant GDSCs need to stay in
> retention mode, like they do on other similar SoCs. Change the mode to
> PWRSTS_RET_ON to fix.
> 
> Fixes: 95eeb2ffce73 ("clk: qcom: Add support for Global Clock Controller on QCS8300")
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

