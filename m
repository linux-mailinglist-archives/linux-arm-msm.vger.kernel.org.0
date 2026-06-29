Return-Path: <linux-arm-msm+bounces-115033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MTm9JORkQmrd6AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:28:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DE66DA2C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:28:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IpJE+GBl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XepedFN1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115033-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115033-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABC1E30C09BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFAC515A86D;
	Mon, 29 Jun 2026 12:23:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A263C3FF884
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:23:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782735797; cv=none; b=djPUTzOdDPu6Prssbac5XxIY1v2QZozHEHLAUTZOoOoIJmEVv9aZIhPdu5HQgD52Tgry2/Q5XeFjDSer7VOvSakS8wkPsiXFOFMR+SA1eDm8yV1cNvIfP3zi9UPrAfOTzGoOAiWGS/bBWLCT2Qnw2RORlOGGYgQPEZ8hcIHw8NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782735797; c=relaxed/simple;
	bh=P0YY8NDT3Os8syC0XVSuw44PAHlOaYunR8ZRStks+Cw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QRB1LzjoW4kyvmsTh+OmJGhvqqhU0Hy+8+dDzfHwsn48az25ex393L+b014PBpAGphuQ/2+ptldox+koU7Z99g4FEONGIA+E30V682vvxcpvAhWBeQaS+a6EkqAYmbNbQEmzgyH0Psb/0ifnlnQJhKIFbA4tSH0nMClt0EbUGAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IpJE+GBl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XepedFN1; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TB5IKi2728794
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9nsNylN8z5JWVNL1IlFXlPQs
	WEx/6QZBCwRBdmXQ16U=; b=IpJE+GBluFJVHwDOePp8ZUW1FUkjVTAGYnKHjIpv
	gVAYg80NSIwukR+JOrIW8COcf8CwVMDPTiSrXbAISlIM5qjdoFZ0GxZ2lG8qIbB3
	D4YiITO2UQHGW5hHoA+h7UIhdKwQJBbkpvCu5jTiBQ/kE0GSNhuRxyV0mrbVPw0w
	kjetJK5pw/pfquod8j+lQAK7kFHe6uMUod10kjliQ4GRu0TaK2ABJV7D9PYLvkbo
	vd2l6ZiAkpG2I0rsbdVq0RLXN1ZLpQiRjlewJ+7/S0BSjk1HkzmNJYRkWWxvMDEV
	jPJm8KFpOmpT4DCpGvKrTD6NkeWTf8y5oNVAKWVGxvxJGw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3qha88pg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:23:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c8018f11fbso26593875ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782735794; x=1783340594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9nsNylN8z5JWVNL1IlFXlPQsWEx/6QZBCwRBdmXQ16U=;
        b=XepedFN1XTzk/w9vdy5Z79ro9LF+tHzzhpqrgHcfuJSNWBmzALqWLW6SXjhZYH+qXi
         HdC9KB/WGbsJTo8efvyWWk/6jzrSEpUMt7EB3CQbZbgvRAtFbD8oZbfaQli11IdinDaP
         0Pp3Dyd7Q5PpCfkqOOL23p3+dBNvHA2tHWgp3bOmw2mds13WGxQAZnMmOtmmgTBMH6jQ
         IoHPBqA6oBO2GkllmLJHlR1jpyyG9Lhg/CrhNRZTbO5c9tvKJI3Ua4Xkh2jTK/NleInF
         tDyUs0ASxC2jEOEDP+DE1DL7WHjWoCN/ruuqbB1cdGXO8r+oZDP22PKHLxFo4GSlar9f
         1Mlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782735794; x=1783340594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9nsNylN8z5JWVNL1IlFXlPQsWEx/6QZBCwRBdmXQ16U=;
        b=V1PFbm0gGfz0uLt8CkEQL2wOLsC1Yd4oxRM2NQabn4PvcpEyzqOHpFgAKUPzyFDgKZ
         5A0ym41a9h+4CvIxag22SiwHd2CG2eLCkdGruTAmGl9Gm2/ih8MIPOO3SA2+OO8rUd63
         3BfRWu7d/xjfyoKX/AxKHrbiSYpH5/47fTfHWd927a1gJ8vMx2FcgScQVqUyHs3PIsQp
         Z9EmTmr5sssKkMQcC0GDaNc3dtLKGli89+4NjPxudPHBFjo9f7nvQwB/JNyPzeuCnBxz
         n6BgWVVCYOGegwxdqU6jIepqyZNl7PdBpBqYhqBFOnl8ypSKyutrspjf+ngqSud3E7UZ
         xRPw==
X-Forwarded-Encrypted: i=1; AHgh+RrHK2WUn3J4ioW6Qljb+KzdmYJ0BXhLo3SZX4RIo5HBO69NK8uisCXluwhur+GXD28NR7kJMeYd/rF8pGSQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3Xb9gIyzIZ+pRPJtDvmYtedC6nF3DfRZG330e35AdjskvJklm
	5BH1dxGgry7hrx7900iJ+KxDf09YxoKfog803ZYcwczQefr7JdpJkGidYmUCfLRIR0xZpvPTzZK
	BoTDMzV122KoMmcz54AK4I5tNayDtlrtOTpKOw+cJV2wH3lhFtiKsRypLcrWj7zyE2kID
X-Gm-Gg: AfdE7ckngJekRdBelLEZxNES49zvU3w8PMUcZc76FLwrUOFXBE4VATg9UmQsrSCKpgK
	qFbb2vIWYiONfv0/b9m7KpG5PFzC1PsRV/PU4ZDLvTHPzJiPDslZIJZeLRTmIOCS9bdIY9Ta3B/
	S8TtZLpSWhtCTauNqjloCTecXyiqWM2rmtm8vFv/lV36RnlZha9ADyV0oRnmcl8rGUPvLjeR0WM
	H5wjO51Cbzf5xgG7fi8drlMzXp7uL5tDWP7ost41A5LOeTqk6u9yhDt2I0T5f6Q0lDv/0DBCClZ
	fUcrCAzi+NMRJzUSx8OtFecwSsO/JPH9+GVHAr8UD/chg2POKTYYPnMvPMgu7gyjLpi6b7EWHWl
	7e0Fke09yLdp1aBat0MN/AriCazdcaCn3z30j/bz+zZw5SL07FIpvlVVJbg==
X-Received: by 2002:a17:902:c40d:b0:2c0:e2ea:6b0c with SMTP id d9443c01a7336-2c7fca15745mr154651015ad.21.1782735794330;
        Mon, 29 Jun 2026 05:23:14 -0700 (PDT)
X-Received: by 2002:a17:902:c40d:b0:2c0:e2ea:6b0c with SMTP id d9443c01a7336-2c7fca15745mr154650725ad.21.1782735793839;
        Mon, 29 Jun 2026 05:23:13 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9a93d5ebdsm46981245ad.74.2026.06.29.05.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:23:12 -0700 (PDT)
Date: Mon, 29 Jun 2026 05:23:10 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v6 7/8] arm64: dts: qcom: mahua: Add QREF regulator
 supplies to TCSR
Message-ID: <akJjrh5z+IVvdRVp@hu-qianyu-lv.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-7-c939c22ded0c@oss.qualcomm.com>
 <e6c0971b-ec41-4914-aa34-6caef51d2327@oss.qualcomm.com>
 <ajk5KE/fEDDU9W3V@hu-qianyu-lv.qualcomm.com>
 <8e4ea76e-f1c0-4dfd-8477-35e01ac0ba0d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e4ea76e-f1c0-4dfd-8477-35e01ac0ba0d@oss.qualcomm.com>
X-Proofpoint-GUID: smYjh5mlGDizDdNDs3hHf32xEnJIRNJE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwMiBTYWx0ZWRfXylkijooKXWcz
 YqUp2B26/ir3vZqaxmob0+l+3oYpRuoq/X/+gJFjSL1OVuhFI7wDCgXBoQsOWEBHIwmiPUJL38Q
 U1A/9cDjzj9YsOo9FcvkDDF8gnwO75N1MkxQ0ftyyvY0XukFrcdXgu+8aJyXYeC0B5KjI8xdlp+
 tSUk8EKPByA1q5sjUr/6iMvoS1uzeNr8OM2lkAC6yzqjm2rZ1UY2eR0ast2xSEie/Lg+zwDM8PK
 qoMNjcrdipTjZ3gUPNaYEFCvxvlMgvLuaFPlIMNsZhkmCO9I0Ox2Ds3vK/uICdjAnMKQsC1gYb5
 KSgbOiEoK0jtFjMxgy7WumlqXt2hoAnWfigg4PKdUz/dhlN6eOucmJrw+AYWvIfArger505qsdT
 3XTEdgTScRwLPziQuMEvEEPAvYClSZY9n58jUD2kFLrme46tl/VNIjCeUChPlUN/9Y0LPl7CELh
 HSBOivLF56KMCV88bog==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwMiBTYWx0ZWRfX7GML0LSJ9ios
 2QCoov7xfk+6cfy8Y7NML04/Hbwt6qaL9hDvNFtd1UyTTHIcCxqXUaXpaEHrxPJFV037wIhfQOP
 ByqHh1vp+zYL4ZYXyz2c8tgr0VvcbOE=
X-Authority-Analysis: v=2.4 cv=O9UJeh9W c=1 sm=1 tr=0 ts=6a4263b3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=FJmAmWhdmJsi9ACvDYgA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: smYjh5mlGDizDdNDs3hHf32xEnJIRNJE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290102
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115033-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-qianyu-lv.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 38DE66DA2C3

On Mon, Jun 29, 2026 at 12:34:10PM +0200, Konrad Dybcio wrote:
> On 6/22/26 3:31 PM, Qiang Yu wrote:
> > On Mon, Jun 22, 2026 at 02:18:54PM +0200, Konrad Dybcio wrote:
> >> On 6/22/26 7:11 AM, Qiang Yu wrote:
> >>> Mahua has a different PCIe QREF topology from glymur. Override the TCSR
> >>> compatible to qcom,mahua-tcsr in mahua.dtsi, and wire up the required
> >>> LDO supplies for the PCIe clkref paths on the CRD board.
> >>>
> >>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/mahua-crd.dts | 15 +++++++++++++++
> >>>  arch/arm64/boot/dts/qcom/mahua.dtsi    |  4 ++++
> >>>  2 files changed, 19 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
> >>> index 9c8244e892dd..8b42f5174b31 100644
> >>> --- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
> >>> +++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
> >>> @@ -19,3 +19,18 @@ / {
> >>>  	model = "Qualcomm Technologies, Inc. Mahua CRD";
> >>>  	compatible = "qcom,mahua-crd", "qcom,mahua";
> >>>  };
> >>> +
> >>> +&tcsr {
> >>> +	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
> >>> +	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
> >>> +	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
> >>> +	vdda-qrefrpt3-0p9-supply = <&vreg_l1f_e1_0p82>;
> >>> +	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
> >>> +	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p72>;
> >>> +	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
> >>> +	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
> >>> +	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
> >>> +	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
> >>> +	vdda-refgen3-0p9-supply = <&vreg_l1f_e1_0p82>;
> >>> +	vdda-refgen3-1p2-supply = <&vreg_l4f_e1_1p08>;
> >>
> >> The supplies are correct, but QREF uses refgen4 on Mahua
> >>
> > 
> > The instance is REFGEN4, but its regulator name is refgen3_xxx. Do you
> > think rename the supplies as vdda-refgen4-0p9-supply is better?
> 
> Ah, I overlooked this. Maybe 4 could be better here, since the supplies
> that end up being assigned there match what we call refgen4 on Glymur.
> 
> But there's no good answer, both options are terrible. Let's add a
> comment somewhere (in bindings?) describing this mess, perhaps like:
> 
> # On Mahua, the REFGEN4 block is supplied through pads named REFGEN3

Okay, it's better to metion this in commit msg.

- Qiang Yu

