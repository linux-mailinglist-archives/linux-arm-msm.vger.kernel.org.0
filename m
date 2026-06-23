Return-Path: <linux-arm-msm+bounces-114175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id curnGoFpOmrR8QcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:09:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDE56B6914
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:09:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iZvUU46G;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=G0f8s6mE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114175-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114175-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A64C93092565
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C2B93D3482;
	Tue, 23 Jun 2026 11:02:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DFB3D1AAC
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:02:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782212574; cv=none; b=ALR4pOKtPxgBAxd6nFTU7iq2fDye3/68jihBJC/NxkhF61IZ5xlz0lFMc4FutcWyjTiFuhSaGs66UZc9URzOcQ/M1PXj+mq0iYClZhy6R/ebOwiZfShxR32PFqCoTZYJsyvhkFi6qp03rxZDn5NubxijY1bvRG6kJTffPokVsaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782212574; c=relaxed/simple;
	bh=ZoZVHIcb20ztaVZGDCK46IymHjRjY+Yi4pkPjRPyYng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HmzRI66MYGmOx1oq2Fz1nFYNNxeCSFY+Rusc98//wB9SEjlsz9O532RiM+izdqMZkzbVgaAfx+esAqV+V+26kW225kcDpgB3z0fJQcf8yXF5v0NUSSG0IQgl/qBD2tTDsciDKQkgsU7aqHgnz1md2IAz341D8oS+LFHF8fJ7RVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iZvUU46G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G0f8s6mE; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NAsMUs042146
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/3Bur5W8WIf69VnzHiI+arDhtZRA4HK1lbpmUhai2O4=; b=iZvUU46GibMAwNkz
	AoK7VQzXe+5QNe2NDKKB/mgDiLZOo5GlZXwA/ce67JAiyVLIDN4WwaqOHLLQYnab
	vBvCZ3Q57JQwnF3JshLMTYyR5HF5NGIzzMJR8TWC0N3NYhPMFUx2EqA7l1FU9dU/
	pE/LJoxOVj7x+BnGbz8TfH44/R/DMg7zLiyMOoQRA32bUDzWZk5OtUyWaNw3eKYU
	NgJRdeZH158uWFnqlLx8WmF415Gz2na1sFuj6vDNC8UOplKUTMJStLdbfZlvJDV/
	I5V3KoTsvE4S1ZFmAaijS5B02SRmfvlhsOw6zr0k2+KJfCEwCdUBW0vIlHeZVjAe
	fnjmFA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr3207ae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:02:51 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c6d4a825d5so354968137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 04:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782212570; x=1782817370; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/3Bur5W8WIf69VnzHiI+arDhtZRA4HK1lbpmUhai2O4=;
        b=G0f8s6mEbVMpSKoc61441HdIB1Bqpcvt3u+E1OTmh0pR2L0lr/V5KJZ1LcZ/TrOCZH
         RV4757WTUFA6SCrTqIbSIZSYZ5VdLeOgGPnA6BoRM8geM17YglNmrxIMJax4uuM9FrCN
         IgeexyjFBcBUK2Kb/vKrLbr0SlTD5yw9ipAcxP6keY3pQjLV9S/iGszJe5k+b84Zff3p
         0LNodXd39ggXTXg659uwuEWKKc+d40GBZdsgKoUBEqnkxa7iyKiN5m1QWxVTaYI+u7aE
         VX6yBhOfJp/cOgk1NniEWgjLvsc7Ug8A0yiskJutbs4rr4FAs7SadJjGgux4p7sZ2Iql
         /uUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782212570; x=1782817370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/3Bur5W8WIf69VnzHiI+arDhtZRA4HK1lbpmUhai2O4=;
        b=gm69PYHjK3SRPO/yoDeTC8SIJBp4aNtRnOTavFuSJ3GxrN6l3IWEs58nlJB5WRaYhz
         R31wNHg4k5Sk67LK0MEN/cJYqGm0zne/HUR6ABZr7zY5aLQ3MrfaB/lY610fnsrlsvNy
         BXsVaBIgDNO6Ev4k72TEgpppD16CPjku8enUtCwfwe58mebV8R1SQ/1zU1HV04EjI23v
         eESrWpspD6nQcREeCIX6TfrMAib8rVSxZgdkWc2g7aNo2cYpxNNlL4ejatqxMo32JoaB
         KZCSoPJey6v1G4VJRegb+Tx1s1KwWWfh2cdtiCMKaL7WMeoECfMHZTbjA2+skdS5pUVO
         mioA==
X-Gm-Message-State: AOJu0YxAvnk3SyaEY1AQ4EyhvQB6Ajxz8WS0N1/WvQHxkhb/J5xsTwJV
	5h5mVuwzc3tHWoDO8KKBRdbGpPrlg83vMk+5ukVxS0G8V01wC2TQ7BCwplymeY1w2O5M4T3lKBH
	VP5PN6E46G6vK5al2IfEDCZamjnjOzDi8uI3i24JjLpICPDXlcjD5JFefzzq+AbqTbis4
X-Gm-Gg: AfdE7cldN11393VeCtpmSAz2noxVN8Xu+TMT/KeVPnuTBN1WKVVq+5gTnZWWuVqBRix
	ccHfiesiY4LdJeQVmhCRbvbyKfPodihUz4Xx3vNZQa0qJvPLpJ2AOyP8W5lfA8Low8QHwjPvjrt
	/m+0K/WXSqTwep3iNz290iwjrDxcMbvfxgnMrYDghFdXFPkS29OSCT/ZNO+hQoBj7lmA3Xb1N7l
	FCPymkblemdawV3Pdslw28IfoZJyxpvxtEfsp7oVnfNKvduVwyXdTtWlTafftAMUYjAPAe3k0d8
	usl8T33EUbtbGatkOseH9BerFnvKKq6xC/LVPRzsteUUNlVM0Na9rJciIXBFv+Eb8QHhLpKZAk7
	5yYjXc1KHx13rGrBJrnbx3/lrqRWONplM85I=
X-Received: by 2002:a05:6102:3f14:b0:720:2ba:5299 with SMTP id ada2fe7eead31-72f3ac9650cmr1080762137.6.1782212570333;
        Tue, 23 Jun 2026 04:02:50 -0700 (PDT)
X-Received: by 2002:a05:6102:3f14:b0:720:2ba:5299 with SMTP id ada2fe7eead31-72f3ac9650cmr1080720137.6.1782212569762;
        Tue, 23 Jun 2026 04:02:49 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e498cedsm491816166b.4.2026.06.23.04.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:02:48 -0700 (PDT)
Message-ID: <e1e492ab-884e-442b-8410-cc100c54fd5f@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:02:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sm8450: Remove unneeded reserved
 memory nodes
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-2-37e2ee8df9da@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260622-sm8450-qol-v1-2-37e2ee8df9da@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HrxG3UTS c=1 sm=1 tr=0 ts=6a3a67db cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=dk325V_gTbMn8ZHce38A:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfXwzDKTzlPkNVl
 wdHMAmSLRSSnANjlROvQi34M3Tzz1Jof7K/5lSvUFUJUtWIuWYfqCA1hnD+eADLsIKiIUDHk+i6
 2EvsuMb6lGV/98TQBHx7pybMVpi6bqniT1L41JgF2Fz3zoSaf7gFbZ73+Tg0YBO7w9dygsBgvz4
 nv4Aywd0C+DruFqcIBWaVAoRRYXqgIittBEiE+AI5vulKq4vu0YBxlqLxtSJjbLMWVjfnVR2fgZ
 tFCSEOhZeubk2/1o7eUqH1Xh3V1a5aMbtcCxrPUpngQUWUBNi7MR8YVqPbJUKIM+b/t7wjSr1ez
 YkUdzKyBK1tQSzJxBklKcCXL+iYQ15272W394JApN3fRuYqIP+XjSOtBmCL8gI1qRlgzfxIAi1X
 FR8Gos6bpYOWrbXmoK22GvAWISYa3g==
X-Proofpoint-GUID: KC7jwfCpWeaq18Rc9F9YuTqON4DFzmr_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfX4TWA+ExmhdtA
 m6fZiBnLGexS9DExpG0EQZGSAHVGUarFNtXzHddp/6H6FmOWpUCGDkW8+SCK3A0piAZaGyYJy8X
 tG12rYHWRZqJy1NSaSPtnHjdzziPkY0=
X-Proofpoint-ORIG-GUID: KC7jwfCpWeaq18Rc9F9YuTqON4DFzmr_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606230089
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
	TAGGED_FROM(0.00)[bounces-114175-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,proton.me:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:esteuwu@proton.me,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-phy@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: CEDE56B6914

On 6/23/26 2:54 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> These nodes are not present on downstream device trees and only take
> memory away from the AP.
> No crashes occur without these nodes, so remove them.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 15 ---------------
>  1 file changed, 15 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 56cb6e959e4e..e34e3c05bf74 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -752,11 +752,6 @@ oem_vm_mem: memory@bb000000 {
>  			no-map;
>  		};
>  
> -		mte_mem: memory@c0000000 {
> -			reg = <0x0 0xc0000000 0x0 0x20000000>;
> -			no-map;
> -		};

This is mentioned in the memory map description, but is not part
of it.

I booted up a 8450 HDK and it doesn't even have MTE, so it's
probably valid

> -
>  		qheebsp_reserved_mem: memory@e0000000 {
>  			reg = <0x0 0xe0000000 0x0 0x600000>;
>  			no-map;
> @@ -806,16 +801,6 @@ qtee_mem: memory@e9b00000 {
>  			reg = <0x0 0xe9b00000 0x0 0x500000>;
>  			no-map;
>  		};
> -
> -		trusted_apps_mem: memory@ea000000 {
> -			reg = <0x0 0xea000000 0x0 0x3900000>;
> -			no-map;
> -		};
> -
> -		trusted_apps_ext_mem: memory@ed900000 {
> -			reg = <0x0 0xed900000 0x0 0x3b00000>;
> -			no-map;
> -		};

These exist in the memory map, but I'd guess they may be unused if
you don't load any trusted apps

Konrad

