Return-Path: <linux-arm-msm+bounces-111128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v94sN+0NIWri+gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 07:32:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F05863D034
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 07:32:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DYd4OCEF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TeX8F6PN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111128-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111128-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9D7C530A1366
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 05:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FAA73C3444;
	Thu,  4 Jun 2026 05:27:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAD03BFADD
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 05:27:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550855; cv=none; b=RiNPT1tGvgku9ic7eJC2DFu/ITYQT55v7Wj2GeXcobOpdnVMGzeCGqYptNDwDtHYCGbfvinNpOy2HwsdwlbAXB3pz+iQa3LR9K70xoohbiWShipb89lf1zZo+Ca7tZD5x6/ZvYshvvS0U+hRJziAZTaQr9T2X4b3KCtP8CcZPdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550855; c=relaxed/simple;
	bh=pXAawpVYsMfvV2O3InerqWXimxMOKRET1MkhuMfO/uA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s7ZyutZ91dAnC3s7Na7Ue1T3Rlq8OHEemIjRKfuc3VMEQgZgDfSYF9FLuT5keKWc52VglxMrb/Mljv+sQNqKNBp2ATGx6JYTZw0kx5MS5IPIOGekMEivd11mmG2YolB+gqgnJ6L4JNemUWQrlSwzc48McHlNZ/r8hlcFCwo+U6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DYd4OCEF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TeX8F6PN; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6543guMu1993518
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 05:27:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GfY+l5ENa+nZkYY0yw7MYu7dswdpetfEmFu3VTlOPEg=; b=DYd4OCEF49gHOjc0
	AcnmcFzA2grMFqsKhfC1db9MP3fWXTTXs9rdGSIyakuXI862UFjl9SGXF145Un2z
	EsGxXn848GEBBodc+FyZsYbtq+KI10kHmooqGtqGqmvJUV1Znnilv6UIlxXL/lp0
	JfHE5YuBnkvplr+p8Qb9sNOUmGLMIc+kQEKJmK5x8bHy56IJZVnjgTnkTweaMmYR
	Y2BYwtpU95iMqf50akWLGvAe56x26jIBXiMbaRjSpmgqgrKrRBq+Tfw2P5B5QseG
	Z/ISfP4ibsleNU7uaK9k0paLgWNF6shpkp6Dt1S4FGAb2YmzkgiOV5wW/7749A2E
	jQB54Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs8pt3a7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 05:27:31 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85a298cd62so255996a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 22:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780550851; x=1781155651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GfY+l5ENa+nZkYY0yw7MYu7dswdpetfEmFu3VTlOPEg=;
        b=TeX8F6PNWZ7AOMq8aqDHztHiusiQ+R1dxTLoCzX0oMN76IerItgnhFQgIUifj5KgHV
         6GhXbcKRwEdz2+rscbD6U/oE9GrBlsF0APIrv1UYt39w/tP4h5P8uGxJs3aEDiXM9/Id
         Z5w12i4LSnN5zWl8O+9EnI0amdl0E8gM1epitOju4YIR8/0geF8ebx8Ikk1MWTLOvNhB
         qvNPZHdv9dNixNinautlwbv2WWaFkIcvgbpzqTRSHsug1VglMzUgTfSHAsE4mb9JPd0T
         cDUXGsP1GWN3G4rwz04u5OFE6oMCUetiL5XEreHIA5FlLiBPXOHnCZTTm3WWAElYQzOn
         6kCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550851; x=1781155651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GfY+l5ENa+nZkYY0yw7MYu7dswdpetfEmFu3VTlOPEg=;
        b=saygOTpN4AbXyhdbRWyjq5MKUBkOFRSDelcYBi2y5LlyaByyBAIYBlku3xUrxVrU5X
         Ll913BdrjHPgPYKbFKQUB7rPJIdKEx1fgbZ3Pv7kR+wDNXRUSP1BcHvYO3BNUyi//w+B
         cFhxNWz0r/8OP7DnUb1AJcTLI6idHgb7HuVQbY6FR7LGrgxr/a2SYD1QP7EHRv4AwhaW
         UeQf15/8BpBY1jbx/Ptl1k9/4bdrS9OntJqdQBSfTps4TlryObaV/0+o/v+boiibEQXu
         sz8uf74MCwY3GITQBPWpDb8DfQmS9XxAUet7aSJVWs/C2dcxdWnH2mo3tb34yGTTIxPG
         tb+w==
X-Forwarded-Encrypted: i=1; AFNElJ9tBq9RC8yIRvhGdu/XfvbESPKXPrBDMIuOBGrRnN4m70W8hUkNZlUwLYtABsfR1A/ZxbKxY0qS7uv6chrF@vger.kernel.org
X-Gm-Message-State: AOJu0YwfKLdXxgduaMfZmUfZ27k3EwOxydkw5XAVEohIO7w4uwDUonwU
	MYcD5Ldp+geZoaIVglYTNL6FULs5OBzvkSWrsKGCvK7OgHxMANx31YCtgR7r6MKQDMGmy9+2VoT
	yAe/Z45NP8PCk0o/tieVTNT8HqMYDT8oHTeFu3bsLr4IHhE+DiXYE6csrZU3TjYOVjqWF
X-Gm-Gg: Acq92OEGsLDldb1ndjya6Z5ToDcs+Kl4Qa8Pa2Eefk8fBfW/4MsRgaTRcgLV0ZscUaj
	5o9eQweR2vOOHAhxBEg50mVbtydyI08VJgkFulxuqjQnBhOKHcHz6NIJqeZJGIwKZm7Sw89GbVU
	cAQnFnOu+z3LXrPRwbErGrm1Br4mpPXPPpza59vPdlz4zU5CLEYDX8eQoGOpTlHXdLwjlzbKOD5
	/BcTSR493zEwaPtDHPqL1sO4XDb8Bsd0XFhc/c9+XtDuGSlWjTj/gGqeP2Ph5FSnztv0P+LvYMs
	0St3v8itmQc/5Ywum8Ucv+LWNOhM40K07QiY+M5kPR34Ox0tUh3qKzVdB3zgH0UcnWyug4Xwfzg
	rZke1MLFYP8S2hUJxJt+Vhwzmc1+k0iZn70MLujXFVlrJAxJDGdmww9VQDPiiHr8=
X-Received: by 2002:a05:6a00:951b:b0:842:2419:6bfe with SMTP id d2e1a72fcca58-84284e36473mr6826984b3a.7.1780550850621;
        Wed, 03 Jun 2026 22:27:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:951b:b0:842:2419:6bfe with SMTP id d2e1a72fcca58-84284e36473mr6826962b3a.7.1780550850189;
        Wed, 03 Jun 2026 22:27:30 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842820e8e6asm4493678b3a.0.2026.06.03.22.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:27:29 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:56:18 +0530
Subject: [PATCH v4 12/13] arm64: dts: qcom: agatti: Add DSI1 PHY and sleep
 clocks to DISPCC node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-dispcc-gpucc-v4-12-8204f1029311@oss.qualcomm.com>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: PizCpYg6ntBn2MarzP3Qef7HcvgiEMLb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1MCBTYWx0ZWRfX4teKzwsg/dqk
 FSEuvox5/9djGuqJsByayHl2jkj78RU7RH7RT1gTwXoKfAC0jFSnUoIQksaxgQX4Zf7h8P4Rkk3
 iw2Hf38LrTynvTq+gKndVRuLZVuu+XCEslKGGakT2ogcxurMCzHtNKdpe/H1Wu6+KXh34VEH5gc
 66StKN2Yufowld4TneLYOE/mAXrDxoMKXyFawpmTUjqRMPL2vkur/t6kJHv5Tm5TaDQKCMbtLin
 zW2b7VqRiYszgTroFtjlXY1AkbiBKeIgFhWntWCUQjj35hC0OVVlflef6lCBRjodNr6A0xIQmFJ
 P1+qZd4BVsCNPlVJLPqzW1CurHo9jmqBwmhg6bTTFFWooWhyb3j/yz0V6Hza/1IlccHCvEQutlU
 8Yaa1TUPuVAcoOX5G4d8StSQAgOP9EutqpMQjOLgOS3hL9cHo0Ng9inoEospw97jxvvGzKhS0Uo
 BSFgm6eJxf1dze96UAg==
X-Authority-Analysis: v=2.4 cv=E779Y6dl c=1 sm=1 tr=0 ts=6a210cc3 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Gd0QNvzNEKi-DX6Kg7cA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: PizCpYg6ntBn2MarzP3Qef7HcvgiEMLb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040050
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111128-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F05863D034

Update the DISPCC node on QCM2290 (Agatti) to align with the latest DT
bindings changes, which adds support for the DSI1 PHY and sleep clocks.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index f0b6ae9b81528a848a75f6884f1b27137d780f07..f1d93f86d0a62a813f76580362e850ab847e51eb 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -2190,13 +2190,19 @@ dispcc: clock-controller@5f00000 {
 				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
 				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
 				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
-				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <0>,
+				 <0>,
+				 <&sleep_clk>;
 			clock-names = "bi_tcxo",
 				      "bi_tcxo_ao",
 				      "gcc_disp_gpll0_clk_src",
 				      "gcc_disp_gpll0_div_clk_src",
 				      "dsi0_phy_pll_out_byteclk",
-				      "dsi0_phy_pll_out_dsiclk";
+				      "dsi0_phy_pll_out_dsiclk",
+				      "dsi1_phy_pll_out_byteclk",
+				      "dsi1_phy_pll_out_dsiclk",
+				      "sleep_clk";
 			#power-domain-cells = <1>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;

-- 
2.34.1


