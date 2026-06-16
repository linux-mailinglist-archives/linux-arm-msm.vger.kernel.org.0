Return-Path: <linux-arm-msm+bounces-113428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id au3COWFUMWqrgwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:49:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F30A690187
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:49:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gnraOnxa;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Q/g0NmK+";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113428-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113428-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F21163065EAB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 225FF34889F;
	Tue, 16 Jun 2026 13:45:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA176342C98
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:45:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781617520; cv=none; b=q0tDOHHyp0QOJ2bV4k9z4B8SMZFAM2/uZlN7ripfAZcZdiQGqsyyAF1jdOc/G9+TulH5zYxdGkgZSogOf3SiW/DsowebqV8Nx4d7C1YenyazFDeU6gAS9zaM+9CCRy4RkqOcA59tyKWrsdWfMkktjd51UTDF6Fg314juSzplqx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781617520; c=relaxed/simple;
	bh=LRIaBWeDz9XvpY2K2lqiFjzIrt3vcupGzjCDyTLA+Yc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rDhCU4KASwmOZVdBtwT2UqWytdjk/h8AUzy9HHjENzHgbELFIUlDXUWyhLOm4r91uZSub1hmXtwCp/0G/8QLq26FgiufCQZuEpeV6lby+oXa/khnX1iqM9ZpKjfjLx5b/TKkaiVtIsGNm+kWd50lwrrDv5+HE3MDrtS/g9FnlPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gnraOnxa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q/g0NmK+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GACIKt3411127
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5aQq+OBiFig4xLHyd388PD+FYEO2x2H2mwQ33Hqq+sY=; b=gnraOnxaePe0uwcW
	fMNONOWu2c8T4AgkeRo1zRe5TdLRDXTRSZdLr3jk8Cvk1lopmGQcy7u84GpSrmqC
	hqvenMoYYtBA7vkowH6OiNBH3gm56yayy/JJk/zy3/07pRnKEVphQJ0/ctm8Dj17
	+p2FvB3O1i8vCI32FgngExrvMhbAp5wyDXPyId/wnYco+ArDmwEHyab6HSDzmZSY
	bBJNwqZIMGLNDDJgHOjHhio5fz5pnd0BPPbW9l3elLq5NFYnxvPNPPB5Oh0k5HbZ
	vzJG6yudQphewCrWROzarE41HuRBoIMwJ9CjDnbsNQIAJxOi+g+vGPfWqYMBF5K6
	KNZtew==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09ga417-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:45:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ce9ddfa7ccso11044446d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 06:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781617517; x=1782222317; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5aQq+OBiFig4xLHyd388PD+FYEO2x2H2mwQ33Hqq+sY=;
        b=Q/g0NmK+pCWeiAu2CuzhteNDeEHvaihYXK3lnz0kXyHJv3l8EpXHSaSJBt/ggmhTsd
         HBil8OzTN/35UO2PbSVQbXEwyjXV2LW8ymGFCvvyrvIdhPPfUynZEXgL004zhYO3gVBi
         WNMzJnBeGQSkT04axQ+Ir9cp00qJhuvSkSnVtY+HvjhSF+cfRVut9nIVC0Kl6CAI5TiJ
         xCzHgFGujHC37knASJcVuj9dMhlFjZRDme6y933bBeuUCKicCtAV3kega/hi9vB1QhOn
         0u2SGuh4b1bBJIlpdoRYk9F61BG6THOzBvNnH+q2mlGLWUrrx/VAFNX6IPMhs5FeEV5R
         xX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781617517; x=1782222317;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5aQq+OBiFig4xLHyd388PD+FYEO2x2H2mwQ33Hqq+sY=;
        b=SzyLvuPBrOdU7F0DLwv1MIoeQfYKY4npKN7KEsdf0cdpJMF2xC2adsFl5x4SqJ9l6G
         39F/KYNeTFfFccRqqujCgday17ZuEDNDHjOKk4g1RcbacwntOq/0BBOe04rcucsNhQ8a
         TFp9TIJ3nfL2BCHGoQo0SwSWhpkmPfXve/3UYyuQrZftDHU1Ctk7+fzytz8Ls3J/o2Cc
         FW1OoQITTbRs8rEpdtcsSPhLllp7Gd8YejqJO6NSaURUoHC06UTZpAAfk1LDFBnx409Z
         RXvhuiwDhQS1hRBpvGmcFF/No/aZO8FWyhwXMH2NZW9xahhxgE/eB/Ax3q9oTgqyFLTJ
         wMcg==
X-Gm-Message-State: AOJu0YzsiRtHK62FdBIEI5ytqvHe9GGiGyYUdlZp8H7ZQiovVH2wUMKq
	bgg1g4Og+H79cZ3MqYpjVGdrGuCY2LwyqVsnA39wmVyUTqGXku44cTCTG2QmK5XG65vD4ljZLjo
	DmD1hd623NYw3D4xoRYGnDsTnH5xwRIFSQCFhynO4DVUyP8PVSnwbbwT6sjZVg6iSEhg8
X-Gm-Gg: Acq92OFu946EnQWI/g0j1+SGC8rHcxtepzWH/PZbf1qczXz84dKkFMqscuImQj8sHlR
	CcZR6Aso+u/8Wm6D2BNqV25fJEsasQy3RWGGHFcooaOHv0QxzEQa27PQN+TMvZgf+O6wFEwSpOC
	mX2W9eF13GHYx5YOgTh+YsVNUrmS6L2nu4gC0OmkDeWVHhX0D4nRpXLflWK1djrezwTQtW0/28N
	NH4BSvn1D22ZyFLNC9RwSp5mhTuEn6y4vplDdmLQzNuBdCIj9nib8/IFLHplP3vgYI8A+OosSZh
	7RMKO79JK4S+lN75BI7bEzZfFVEfXCHYdp1ka6qttJV7+hBsooQyIhY/alt+UtQEQJaHO61gRdo
	tglK03x/aK1W8Tq4fzic6Sls8AmefBz4HkstQ+lJO//NQkg==
X-Received: by 2002:a05:620a:2729:b0:911:dfb8:37c9 with SMTP id af79cd13be357-9161bc7409cmr393884585a.3.1781617517206;
        Tue, 16 Jun 2026 06:45:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2729:b0:911:dfb8:37c9 with SMTP id af79cd13be357-9161bc7409cmr393878585a.3.1781617516736;
        Tue, 16 Jun 2026 06:45:16 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb44208c9sm667680466b.13.2026.06.16.06.45.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 06:45:15 -0700 (PDT)
Message-ID: <46bc1a3d-37e0-4b8d-967a-950cb3a48200@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 15:45:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] ARM: dts: qcom: Add Samsung Galaxy S4
To: contact@alex-min.fr, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh
 <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260609-mainline-send-v1-sending-v4-0-83768fbf404d@alex-min.fr>
 <20260609-mainline-send-v1-sending-v4-6-83768fbf404d@alex-min.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-mainline-send-v1-sending-v4-6-83768fbf404d@alex-min.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE0MCBTYWx0ZWRfX3tbfLUoJOWxL
 EEtTxHYRoEaSxIg9SjbLRPX1wMJagGMS8Ixp4/89OlBnbQyfgOSWKxU5Hw8PBWbph7iG32MtCJK
 608kZHrRy3zla/VMjvkT0Uyu4Utr4sgdCwAjzQK38yK603xDjjN05z4eQVqvipYYR6eEqJulLn3
 MCkno+J9vmaBMA4OyIoLQDs0GpdrR1GFyZNWlavkWtp4mbsV68kiJAGLS9HLf/l1L4OK4n0xgZw
 IRX9jtmSlHY5pP9qOYGvxgCB9ezB3zFm0tR+esJ027P81r/SFP2pj5iQ/qdr946HuHSPGDFglvM
 Mu4II6h30fS+kcc50aoM0DQMIx56zr2oTETuIqvTchaO9/lV55g9lHsag0pgowxdY56/yhkYm92
 tCuftwSzbEWRKgmSSEewaV1HqreSH+6KLZ716UnndNhhQI49OM9TqFxzL8TrX0pfCfjqYjz0VpF
 uG2BhdfzrFJXa97euJg==
X-Proofpoint-ORIG-GUID: uvp7ktBX4C5chOaifP7_jrUrP6l7Urrc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE0MCBTYWx0ZWRfX5gNPJyz/F8Vh
 ZifrrvwbZluH+L2xfZZWCU+ZwkNpKM6bwcahSMdKyBx8/tKowNsi75HgkLaiy3JbAmbn7cI3zG1
 uDPqJ+HnuVTUg6+45PJrjbx6pQyeJxM=
X-Authority-Analysis: v=2.4 cv=DLa/JSNb c=1 sm=1 tr=0 ts=6a31536d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=tLzcpL6T6jtHObjfa64A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: uvp7ktBX4C5chOaifP7_jrUrP6l7Urrc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160140
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
	TAGGED_FROM(0.00)[bounces-113428-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alex-min.fr:email,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:contact@alex-min.fr,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:myungjoo.ham@samsung.com,m:cw00.choi@samsung.com,m:linux@gurudas.dev,m:linusw@kernel.org,m:robin.clark@oss.qualcomm.com,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5F30A690187

On 6/9/26 10:13 AM, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> Add a device tree for the Samsung Galaxy S4, codenamed jflte.
> 
> This has been tested on a Samsung Galaxy S4 GT-I9505. The initial support
> covers UART, USB peripheral mode with USB networking, the front LED and
> the physical buttons.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

