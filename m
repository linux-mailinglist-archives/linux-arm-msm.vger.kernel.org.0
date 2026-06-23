Return-Path: <linux-arm-msm+bounces-114181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5c7VJsNsOmoG8wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:23:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E17616B6AC6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:23:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cbXilyVI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=L3hE0+LS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114181-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114181-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B9B8306A37C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B2473D3D18;
	Tue, 23 Jun 2026 11:23:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECC734B183
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:23:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782213810; cv=none; b=fWGVMQbsU6TETLQ3jX9eU8PDP/qR/7bsAkj5bYdSXoIADKqV3BJIqrxH9h6XSo6apEWxbRsbxqwAsV1t45Uk4lldOMXHCNbOBbAWEtGKd0emlntaunLA1Dau6isaPCupuuJgSrBiGJojB0dytB256X5W2nommI1tZbCuYot3UwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782213810; c=relaxed/simple;
	bh=RXUS0MiuMi7p51H4Qd9KyX1mXELw3gVjHZCesaH4yws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FDhi6r797Fiaab5xCVh3Hif/MYSp3mVVObHfjUzYh94OeiwLvCTakFqQyn9Bjdb1i4PYjQh6QqqqW4Bn7t03WUjA9MBooYlCRMA59QQDenAFnGIwJ1buxvYk+1bUorjoDPACkNayDXu8N+r48AX6vFxjSepLZTS0hy6u804Onyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cbXilyVI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L3hE0+LS; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NAsObL023186
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mAVIsyi0roMiNG+3y68083oAhmj4zDD/EfEM2kSD1qg=; b=cbXilyVI6wW8w1uJ
	sZXyG8GJmlYGOYwDI2JQHfWE9oF9tIeIQbhrCZjn0pvbKS7li7kBxH98HzdSka4y
	hFGhL+SDLgFikzzemVUbKThM20Xlmi4hoEl9jd/jv+nKs+Z2syIh0kPDS1LDNgf0
	zO1b3dSG+qfnTsNJ8yodH4frZdovKlS7FD6chm/9yp+dQxem+d78ngb3/OJwYiAE
	5uQbWjnerSM/+XhuM0y24R/kJCS2TUKgaigmEShJh3qp6xGxcy7NkB2TFpvgcnEG
	CEuHH+22bN0XUk1ePdfwwmZUlPpdf6ipYArWe/Vb+os/huSVJ6y1B4I67aRCdlEH
	mNNngA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvs7xk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:23:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-920f826bcb4so59413085a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 04:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782213806; x=1782818606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mAVIsyi0roMiNG+3y68083oAhmj4zDD/EfEM2kSD1qg=;
        b=L3hE0+LSrVJWk/WzV534gc3c1HOagMkk/GQpj97Wjy8DkF5GLrHPMSR7MjIW8O+yQV
         sXIkLTXqfgE8JKYd+WQUj0ciZTwL8VtLLIwenM3Sk/gvN7Oog4FDqyIXGwhcbceoW9RR
         DTNfFnmXQvtoc1rvTc4EABEuargOOXsJ+co5l4DfoJkR9eqy7TDb9MnYJRtP+VoFyGAk
         wCcXkM3v0CZC6JDPoUPyj6aw2N3IoxI3b7GiCIFY/6TTYOmSHr55avOdpzeoNjj+BxfH
         MXPtvyhvD0dZqJhwI4Jodm94Aic6mVRME8eF/VeTeofhF0hwPQamXi711Dow0yhayMLx
         3wNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782213806; x=1782818606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mAVIsyi0roMiNG+3y68083oAhmj4zDD/EfEM2kSD1qg=;
        b=Zc1NqIy6YR1fpK2ujxTQaNskQEzddius3VbNTkRA5cK9m1zXsbKsC6iKaVeyxLshEL
         l0gqDTv1PB8gqixEpZxUfQTvfe4jKY4nO4KDNrYh/MXZbdqurq1T0RJgiqj+hpmmqHk5
         qPKdXgJ5424NihkLPaPN2j1G1VS47092nMZu7ylRQ+3vbYHxOjoFjGqj6ZWWsOWiqw+l
         fEtJkJK8H4fbPmh02emC0eBqqPdo5cffvZcJKUyVECqYPJyoatBdilb+XH+K/+FCH3ZF
         6WOEAKH0W9jyctbLc4E4K097+SJu8s2otq4dXQlJ6lL0diiqCgdn0uWpaq9YG/kpWclV
         5tWA==
X-Gm-Message-State: AOJu0YwHfVhTdx/0WwPk5SYUtYrlQaA5O6zq+SXWGTS65uhRf3fvtEJD
	sZfoAMUy1e5DJj3icj/yxWGjDP521GtxBQ1u7oCX1sPatAy4Drpw2jxfHQNOugFXMHg6Je7ELWw
	hmf/4ofWRbC+H4+fEa1HAXJK3prBf0YLeBjPRfKYGckLpZV/dfvAI2KYLMGMLQ5bITrCl
X-Gm-Gg: AfdE7cnFquhd0/9bI+W50iAk3cplxrzOiLVykxNGZnqJt72vBac+XEWRgsNrkIZ4Xym
	2QMRQgNLlQZRabKFhj90R0q4S8S5Vihy/+HogalnxJ32H032r50dI65NVFwd2r1LeWvk4irHBs8
	9iGXdeClYwXH/6cRiU8d0oPuGN6Md0vBKtlViOo8r1bt7+nlyVvbre9g1IYSsxcFbCVjNy0yf4Q
	HNhH70CM6WfA1OOpRradTbpqwgnkvlhPrRBtLt4VKyuPz6vci5I4N3Rgbov1AZph6GXcRziKCJq
	y9ZbFp8tyOES4gJwAVZBG2elmuLxMoueRIrgDZcmKIVNkBgEnjn6UyC00FYAytcFqlfxJWTPGuq
	WQOoh/U29YWLpPO2zM7eSF0nAwXVrvi+SUms=
X-Received: by 2002:a05:620a:6cce:b0:920:6579:bee8 with SMTP id af79cd13be357-925c6f59e85mr504350985a.1.1782213806272;
        Tue, 23 Jun 2026 04:23:26 -0700 (PDT)
X-Received: by 2002:a05:620a:6cce:b0:920:6579:bee8 with SMTP id af79cd13be357-925c6f59e85mr504346985a.1.1782213805798;
        Tue, 23 Jun 2026 04:23:25 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e49a759sm503098866b.6.2026.06.23.04.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:23:24 -0700 (PDT)
Message-ID: <27db2e06-e3ea-4edf-a0b9-1baac1d5bb50@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:23:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] arm64: dts: qcom: sm8450: Modify GPU operating points
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
 <20260622-sm8450-qol-v1-3-37e2ee8df9da@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260622-sm8450-qol-v1-3-37e2ee8df9da@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3a6caf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=yh-zqMWk-TAmMPKcllkA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5MiBTYWx0ZWRfX+NoQRxOip+Hs
 Xhz6uo6bE8t4d9DqCOTCsMGFIog3T15RO1qLTLuPyUPmkvTo5TPP2b+Pc5M2KTRQZ3AFQrAMHVn
 pQwegz/GH/sLVONU7c1qGo1i/qhBzgI=
X-Proofpoint-ORIG-GUID: fhgTg9Ew8CL5NBioLPSJ7MTLkFMynrcj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5MiBTYWx0ZWRfXwk6dSbmJDG2a
 /lkuWCS/Sxv9bWILYMBIauiFvbhEqiRISCS5M2tyDVfoLX6gqo90BG9y5H18I1G+ScFduJwBHkL
 woBmnoGHWQzU0NudC1p4MzegDz5gjypKknUceTljnIJQcpo/Vw+781dj6H7YIOeu+Aa9kYEO1jz
 Eqzd3FrTAq/K905yuLw0VnvYijQymq4y5C6eNxfS8s5wCC65Tr+NPHgw9JZgcQykuV6idszOLvL
 okIGWKZxE5aBjrhVxRo3cxsDttMZZO2MJ+1O/wpeW4GBS5YfspvOGiOibtxRoYMlNv7TtKLL1YV
 deSC1ezBh8OAm2JkjBWOwZF9C4N5EEpNVI4rfPlF0oI+O8XWSA1uAVGw0EHtj/9gq2+NYP6tReN
 n3QzCKbTQ2cI+kbVPb74ui8rnYe8C4doqCNd9VnxQ1yzS7cYMqSDueJL8j9wul4XdLwcRNdNxmF
 ludbRS1pEdKoLz8O9cg==
X-Proofpoint-GUID: fhgTg9Ew8CL5NBioLPSJ7MTLkFMynrcj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230092
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114181-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,proton.me:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:esteuwu@proton.me,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-phy@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: E17616B6AC6

On 6/23/26 2:54 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> These frecuencies don't exist in downstream device trees.
> Both 220MHz and 285MHz belong to SM8475, and I'm not sure where 317MHz
> came from.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 15 ---------------
>  1 file changed, 15 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index e34e3c05bf74..5e331a25e22a 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -2495,21 +2495,6 @@ opp-350000000 {
>  					opp-hz = /bits/ 64 <350000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
>  				};
> -
> -				opp-317000000 {
> -					opp-hz = /bits/ 64 <317000000>;
> -					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> -				};
> -
> -				opp-285000000 {
> -					opp-hz = /bits/ 64 <285000000>;
> -					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
> -				};
> -
> -				opp-220000000 {
> -					opp-hz = /bits/ 64 <220000000>;
> -					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
> -				};

These are valid frequency points, although downstream didn't advertize
them.

Funnily enough, the frequency plan lists them as:

LOWSVS_D2 -> 317 MHz // in downstream, at LOW_SVS
LOWSVS_D1 -> 285 MHz // in downstream as-is
LOWSVS_D0 -> 220 MHz // in downstream, LOW_SVS_D1
(the above are what it says in the doc, yes, lower voltage for
higher frequencies.. certainly seems like a bug..)

LOW_SVS   -> 350 Mhz // this and the following are in downstream too
LOW_SVS_L1-> 421 MHz
SVS	  -> 492 MHz
SVS_L0 	  -> 545 MHz
SVS_L1    -> 599 MHz
SVS_L2    -> 640 MHz
NOM       -> 734 MHz
NOM_L1    -> 791 MHz
TURBO     -> 818 MHz

so in short, the existing map seems to be OK

Konrad

