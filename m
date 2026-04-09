Return-Path: <linux-arm-msm+bounces-102455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KYEIXBz12maOAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 11:37:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D52C13C8967
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 11:37:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3224B308B583
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 09:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C846839525E;
	Thu,  9 Apr 2026 09:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+U1q0Gd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fD6Envdq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54CA3AA4FE
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 09:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775725911; cv=none; b=DJb105+3z4s2e1YfTLBfhuO3XsuczgP9f6rMlldFFPcD5CXn0kumwvSW0n+xCQJ0HbsbrO/jm3vwqfwT2JfuyEUe7XGwhWsx2KStZEwWjGrWLbB6H7f70ZnMCr4sQkphd4EPth49gMKSd8JEzZYM70hs6wB1u/sDSPUdpV84WvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775725911; c=relaxed/simple;
	bh=d5tVZ9x3AMkoihFUNRIRknlUL6tLTo91Q/Ds963Z48g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D2e7IYjKFVIFlPOUNxpOWtlurn8F1krKcUORbwSpgxSrl9Cr84D3CxDkDkp9eOf36eDwO7ivj6gxDyoy1PkSKSV35G8ZHVvZzzd5YNc5DdCXBcCu8nKZbMt/lEKjfv3TB98vd1hb0oNVCmk+MDbeTnh459PoQ1rleX7c7sOejp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k+U1q0Gd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fD6Envdq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6393WY1o3326252
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 09:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8FP1UTQobMx
	I5TbGF5uJY5LSXl0z0TdNDjU3Y36Lbtw=; b=k+U1q0GduFaYAy8AOKFVJqcuUaJ
	ylvDiBnnRlyhRF5jDEJvIQqar6LwicpVZ1XKUfDwoIQFW5JPSuToyoYwK9ShOwvK
	/r0biVO7k+0HX+E3G1NBACwdSG04G1grpwXo1ehX3rfTrg1wkiPbCnjDa9T/KGX7
	NDzvpru0cck9dsmMQBCSGrvwp1/jyjxbuUPVSPrRSJ/cKinH8Y93BBMmORxbzc/x
	MZ6qgvAeD3oFSxiBQ3NGrpQgO+bRybUDNBWHr79hu5d0KHZX+I7ivSDAUQAjQxyc
	37ObOqp6e83jIukXGykewF2u0zcJL13R+gSFBg02E/yRtnM7noF7PZF2Yww==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddw9mtek6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 09:11:48 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c68a134df8so458411eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 02:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775725908; x=1776330708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FP1UTQobMxI5TbGF5uJY5LSXl0z0TdNDjU3Y36Lbtw=;
        b=fD6Envdq1PJKSivjbwg0VUbbF7Or8XAy93ryqkfKkB8+mLEiblP1U3X4JJF39Ly3VZ
         ZTK234Tq6TxFvb5Eum5tAGf5swJqR+jXo9u/Mb7S7EaHgMHVLFPCzN5fywOE/qyHRbH3
         +z9rk4aZetgom5k5MGNgWIT6TvCgwC7nIW8KuFRzNJaJo1Dn+Z+sjjKTCF/2Ebbl808M
         EPLjuxnGbSmNJaYTmIi95VZRtZLMWMgpoH7ruTtpcD4ncQYNniNq9GEmCzEVQRzEucJO
         uDHIFoGcuagy16CM1YfyEzkN0SV2soWm1D2BXFHNBKlQTntvtKDxjBx9PAJdjLWrbw+s
         bOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775725908; x=1776330708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8FP1UTQobMxI5TbGF5uJY5LSXl0z0TdNDjU3Y36Lbtw=;
        b=OPqQKihFruVgLzliGd9UZ5mX/Wpqu4zR454MLhXlMUq3vs/nuebyAValQXrsazLO9T
         SMtEyakyKjQTFpE7j9YumopZLIiUnaMsS2RdhoW4ZIKJZpIYF3k6MI/xUg1w3HE4fQKN
         hmxum4vNQ6aSgknAtyb5VUZmx9u5JlE3VmFVBjQgLNdga+KHBgyaEbFAzmK52xG1hqBh
         tyA18Af5rzriwLVCHUUz9pABtBbI1dd+X0KTD9/O2z8AZus6/i5T/ACYh2++zQtTB+pb
         jfrV3LQg4ivhoUgJ3hpimOxjxzn4K9YXIo1IIehK6nHk86r4tpAbUUg/jn5ILup973So
         P7Kw==
X-Forwarded-Encrypted: i=1; AJvYcCW9JSgbVJzcvOp7mYdlIB3FV96xFlyB5kf3ZEGHCeeV60fVigvIujOA+/k22eJrfYF+fko5oAEFBzkVOJn1@vger.kernel.org
X-Gm-Message-State: AOJu0YwqGsIDr2pAr5HfDfTZNYhaMg4YnFB1TCrvNuKogkptoQEWRrkx
	lCD+8iSX9Lf0HAD0xMMIrn0asQneTWbEakcUijrTea4HXmX5siKS/tBIGjrK2H0f9BrIEgucE8Y
	g3BlGnevOa1wczzZkrwROfW/AbxFC5LHe3E91tbqHhEll98xDv/TTNKL9pXKXcy16lK3G
X-Gm-Gg: AeBDiessHHVPGcGSuiwPT2sUba4kC8dCINXXgmApTJ+aSmmd8CqDO5qEF7j1eBsbeRf
	Lbd6Wz0bxn4wDWnrgYMoafNZfGZL6Zgvk0p1bf1e0OnO3uLRowahrruCydRMhNMBKnJ4/cz2c/R
	zONmq0T/3LssrVVzKw1PWNxayGqt4LSDFbwizCHogeGDz5vuU2/LRB2w1yEhTX1gId0merghQEL
	7rQOYnC/lalaoUVIX0XtcSuXlkZMa/P13mffUUdymW2tpuW2TJzQUiXCVCenfF554cJ5+fkNAz1
	wT0qO+F2ssCDhfeE9qrKr/p/SMe/cYv6+Ac3oSJuAvi7nuBB66SWuK7GPomJsXk5MqkGQ81pI7t
	f9sRVNPjBRmK/uON5lIelWoR/RohJ9DNC0dO+j1Z/mTSqbMOSUELk0Dq1Hd5OzuoyxHa05yfhZS
	UyxnaWtg==
X-Received: by 2002:a05:7300:a2c5:b0:2c9:ee15:a0f1 with SMTP id 5a478bee46e88-2cbfc16ec52mr11893034eec.27.1775725908088;
        Thu, 09 Apr 2026 02:11:48 -0700 (PDT)
X-Received: by 2002:a05:7300:a2c5:b0:2c9:ee15:a0f1 with SMTP id 5a478bee46e88-2cbfc16ec52mr11893011eec.27.1775725907440;
        Thu, 09 Apr 2026 02:11:47 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df8942sm31265060eec.2.2026.04.09.02.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:11:47 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH 1/8] arm64: dts: qcom: lemans: Move PCIe devices into soc node
Date: Thu,  9 Apr 2026 17:10:53 +0800
Message-ID: <20260409091100.474358-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409091100.474358-1-shengchao.guo@oss.qualcomm.com>
References: <20260409091100.474358-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cfPiaHDM c=1 sm=1 tr=0 ts=69d76d54 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rs7BxoZ7CQHKALr8RUwA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: -qwVQO3P7sYelg5QJVDYvNNXXVLoMw1a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA4MSBTYWx0ZWRfX8CYGb5RauhyL
 G7lMvlCnK2bdiHx+AN7Dz57uK/BaIEgezRleUnVGToKRncbvmP2RiVCo5Iyw4Gxy8O85GK0sLz3
 dNdmwtZWFTXLs0MzDQ/dPWdQ7gF7VpHq5tIVnrM1DabrMVDAmmwvIxlt1TQGf03MnNxI+RgPZwW
 7zxPczKTtmMJuZGjjs69zHOCWHNSkoWXkG1P9HQ6gxAlsTuUKPeBtFsg+Gmf1XqEhLf6sBKFazS
 krbiEyt4aaHbE8saYCrYZdnfs6rGLpBfYihXxl6TE0iTJXXkRv4XRwELGc24dSc0HC7LqnWKTmk
 vPAzn3AY7Vb7Sd/scNSqURWA1YVAcSIH6puIegtkFFYrDGHPBsdHJyO1p/4EEd34aGAmlIfd7m4
 HIlPO69oosarGEDHGPN0+lOPtuhMZgZTLoq/er8yduAf9Z+M7e2fPBMnMNWmeYb4y19hpzorwy9
 Tl5EmwTNfkQ+Eym8Fww==
X-Proofpoint-GUID: -qwVQO3P7sYelg5QJVDYvNNXXVLoMw1a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090081
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-102455-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_SPAM(0.00)[0.837];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D52C13C8967
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These PCIe devices with MMIO address should be inside soc node rather
than outside.

Fixes: 489f14be0e0a ("arm64: dts: qcom: sa8775p: Add pcie0 and pcie1 nodes")
Reported-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 692 +++++++++++++--------------
 1 file changed, 346 insertions(+), 346 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index f565067bda31..03a712d82d78 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2694,6 +2694,352 @@ mmss_noc: interconnect@17a0000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		pcie0: pcie@1c00000 {
+			compatible = "qcom,pcie-sa8775p";
+			reg = <0x0 0x01c00000 0x0 0x3000>,
+			      <0x0 0x40000000 0x0 0xf20>,
+			      <0x0 0x40000f20 0x0 0xa8>,
+			      <0x0 0x40001000 0x0 0x4000>,
+			      <0x0 0x40100000 0x0 0x100000>,
+			      <0x0 0x01c03000 0x0 0x1000>;
+			reg-names = "parf", "dbi", "elbi", "atu", "config", "mhi";
+			device_type = "pci";
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
+			bus-range = <0x00 0xff>;
+
+			dma-coherent;
+
+			linux,pci-domain = <0>;
+			num-lanes = <2>;
+
+			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
+				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>;
+
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a";
+
+			assigned-clocks = <&gcc GCC_PCIE_0_AUX_CLK>;
+			assigned-clock-rates = <19200000>;
+
+			interconnects = <&pcie_anoc MASTER_PCIE_0 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_0 0>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+
+			iommu-map = <0x0 &pcie_smmu 0x0000 0x1>,
+				    <0x100 &pcie_smmu 0x0001 0x1>;
+
+			resets = <&gcc GCC_PCIE_0_BCR>,
+				 <&gcc GCC_PCIE_0_LINK_DOWN_BCR>;
+			reset-names = "pci",
+				      "link_down";
+
+			power-domains = <&gcc PCIE_0_GDSC>;
+
+			phys = <&pcie0_phy>;
+			phy-names = "pciephy";
+
+			eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;
+			eq-presets-16gts = /bits/ 8 <0x55 0x55>;
+
+			status = "disabled";
+
+			pcieport0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie0_ep: pcie-ep@1c00000 {
+			compatible = "qcom,sa8775p-pcie-ep";
+			reg = <0x0 0x01c00000 0x0 0x3000>,
+			      <0x0 0x40000000 0x0 0xf20>,
+			      <0x0 0x40000f20 0x0 0xa8>,
+			      <0x0 0x40001000 0x0 0x4000>,
+			      <0x0 0x40200000 0x0 0x1fe00000>,
+			      <0x0 0x01c03000 0x0 0x1000>,
+			      <0x0 0x40005000 0x0 0x2000>;
+			reg-names = "parf", "dbi", "elbi", "atu", "addr_space",
+				    "mmio", "dma";
+
+			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
+				<&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+				<&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
+				<&gcc GCC_PCIE_0_SLV_AXI_CLK>,
+				<&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>;
+
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a";
+
+			interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 630 IRQ_TYPE_LEVEL_HIGH>;
+
+			interrupt-names = "global", "doorbell", "dma";
+
+			interconnects = <&pcie_anoc MASTER_PCIE_0 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_0 0>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+
+			dma-coherent;
+			iommus = <&pcie_smmu 0x0000 0x7f>;
+			resets = <&gcc GCC_PCIE_0_BCR>;
+			reset-names = "core";
+			power-domains = <&gcc PCIE_0_GDSC>;
+			phys = <&pcie0_phy>;
+			phy-names = "pciephy";
+			num-lanes = <2>;
+			linux,pci-domain = <0>;
+
+			status = "disabled";
+		};
+
+		pcie0_phy: phy@1c04000 {
+			compatible = "qcom,sa8775p-qmp-gen4x2-pcie-phy";
+			reg = <0x0 0x1c04000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_PCIE_0_PHY_AUX_CLK>,
+				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_CLKREF_EN>,
+				 <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>,
+				 <&gcc GCC_PCIE_0_PIPE_CLK>,
+				 <&gcc GCC_PCIE_0_PIPEDIV2_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "rchng",
+				      "pipe",
+				      "pipediv2";
+
+			assigned-clocks = <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>;
+			assigned-clock-rates = <100000000>;
+
+			resets = <&gcc GCC_PCIE_0_PHY_BCR>;
+			reset-names = "phy";
+
+			#clock-cells = <0>;
+			clock-output-names = "pcie_0_pipe_clk";
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		pcie1: pcie@1c10000 {
+			compatible = "qcom,pcie-sa8775p";
+			reg = <0x0 0x01c10000 0x0 0x3000>,
+			      <0x0 0x60000000 0x0 0xf20>,
+			      <0x0 0x60000f20 0x0 0xa8>,
+			      <0x0 0x60001000 0x0 0x4000>,
+			      <0x0 0x60100000 0x0 0x100000>,
+			      <0x0 0x01c13000 0x0 0x1000>;
+			reg-names = "parf", "dbi", "elbi", "atu", "config", "mhi";
+			device_type = "pci";
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0x1fd00000>;
+			bus-range = <0x00 0xff>;
+
+			dma-coherent;
+
+			linux,pci-domain = <1>;
+			num-lanes = <4>;
+
+			interrupts = <GIC_SPI 519 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
+				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>;
+
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a";
+
+			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
+			assigned-clock-rates = <19200000>;
+
+			interconnects = <&pcie_anoc MASTER_PCIE_1 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_1 0>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+
+			iommu-map = <0x0 &pcie_smmu 0x0080 0x1>,
+				    <0x100 &pcie_smmu 0x0081 0x1>;
+
+			resets = <&gcc GCC_PCIE_1_BCR>,
+				 <&gcc GCC_PCIE_1_LINK_DOWN_BCR>;
+			reset-names = "pci",
+				      "link_down";
+
+			power-domains = <&gcc PCIE_1_GDSC>;
+
+			phys = <&pcie1_phy>;
+			phy-names = "pciephy";
+
+			eq-presets-8gts = /bits/ 16 <0x5555 0x5555 0x5555 0x5555>;
+			eq-presets-16gts = /bits/ 8 <0x55 0x55 0x55 0x55>;
+
+			status = "disabled";
+
+			pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie1_ep: pcie-ep@1c10000 {
+			compatible = "qcom,sa8775p-pcie-ep";
+			reg = <0x0 0x01c10000 0x0 0x3000>,
+			      <0x0 0x60000000 0x0 0xf20>,
+			      <0x0 0x60000f20 0x0 0xa8>,
+			      <0x0 0x60001000 0x0 0x4000>,
+			      <0x0 0x60200000 0x0 0x1fe00000>,
+			      <0x0 0x01c13000 0x0 0x1000>,
+			      <0x0 0x60005000 0x0 0x2000>;
+			reg-names = "parf", "dbi", "elbi", "atu", "addr_space",
+				    "mmio", "dma";
+
+			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
+				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>;
+
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a";
+
+			interrupts = <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>;
+
+			interrupt-names = "global", "doorbell", "dma";
+
+			interconnects = <&pcie_anoc MASTER_PCIE_1 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_1 0>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+
+			dma-coherent;
+			iommus = <&pcie_smmu 0x80 0x7f>;
+			resets = <&gcc GCC_PCIE_1_BCR>;
+			reset-names = "core";
+			power-domains = <&gcc PCIE_1_GDSC>;
+			phys = <&pcie1_phy>;
+			phy-names = "pciephy";
+			num-lanes = <4>;
+			linux,pci-domain = <1>;
+
+			status = "disabled";
+		};
+
+		pcie1_phy: phy@1c14000 {
+			compatible = "qcom,sa8775p-qmp-gen4x4-pcie-phy";
+			reg = <0x0 0x1c14000 0x0 0x4000>;
+
+			clocks = <&gcc GCC_PCIE_1_PHY_AUX_CLK>,
+				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_CLKREF_EN>,
+				 <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>,
+				 <&gcc GCC_PCIE_1_PIPE_CLK>,
+				 <&gcc GCC_PCIE_1_PIPEDIV2_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "rchng",
+				      "pipe",
+				      "pipediv2";
+
+			assigned-clocks = <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>;
+			assigned-clock-rates = <100000000>;
+
+			resets = <&gcc GCC_PCIE_1_PHY_BCR>;
+			reset-names = "phy";
+
+			#clock-cells = <0>;
+			clock-output-names = "pcie_1_pipe_clk";
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
 		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sa8775p-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
 			reg = <0x0 0x01d84000 0x0 0x3000>;
@@ -8601,350 +8947,4 @@ turing_llm_tpdm_out: endpoint {
 			};
 		};
 	};
-
-	pcie0: pcie@1c00000 {
-		compatible = "qcom,pcie-sa8775p";
-		reg = <0x0 0x01c00000 0x0 0x3000>,
-		      <0x0 0x40000000 0x0 0xf20>,
-		      <0x0 0x40000f20 0x0 0xa8>,
-		      <0x0 0x40001000 0x0 0x4000>,
-		      <0x0 0x40100000 0x0 0x100000>,
-		      <0x0 0x01c03000 0x0 0x1000>;
-		reg-names = "parf", "dbi", "elbi", "atu", "config", "mhi";
-		device_type = "pci";
-
-		#address-cells = <3>;
-		#size-cells = <2>;
-		ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
-			 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
-		bus-range = <0x00 0xff>;
-
-		dma-coherent;
-
-		linux,pci-domain = <0>;
-		num-lanes = <2>;
-
-		interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "msi0",
-				  "msi1",
-				  "msi2",
-				  "msi3",
-				  "msi4",
-				  "msi5",
-				  "msi6",
-				  "msi7",
-				  "global";
-		#interrupt-cells = <1>;
-		interrupt-map-mask = <0 0 0 0x7>;
-		interrupt-map = <0 0 0 1 &intc GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 0 2 &intc GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 0 3 &intc GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 0 4 &intc GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>;
-
-		clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
-			 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
-			 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
-			 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
-			 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>;
-
-		clock-names = "aux",
-			      "cfg",
-			      "bus_master",
-			      "bus_slave",
-			      "slave_q2a";
-
-		assigned-clocks = <&gcc GCC_PCIE_0_AUX_CLK>;
-		assigned-clock-rates = <19200000>;
-
-		interconnects = <&pcie_anoc MASTER_PCIE_0 0 &mc_virt SLAVE_EBI1 0>,
-				<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_0 0>;
-		interconnect-names = "pcie-mem", "cpu-pcie";
-
-		iommu-map = <0x0 &pcie_smmu 0x0000 0x1>,
-			    <0x100 &pcie_smmu 0x0001 0x1>;
-
-		resets = <&gcc GCC_PCIE_0_BCR>,
-			 <&gcc GCC_PCIE_0_LINK_DOWN_BCR>;
-		reset-names = "pci",
-			      "link_down";
-
-		power-domains = <&gcc PCIE_0_GDSC>;
-
-		phys = <&pcie0_phy>;
-		phy-names = "pciephy";
-
-		eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;
-		eq-presets-16gts = /bits/ 8 <0x55 0x55>;
-
-		status = "disabled";
-
-		pcieport0: pcie@0 {
-			device_type = "pci";
-			reg = <0x0 0x0 0x0 0x0 0x0>;
-			bus-range = <0x01 0xff>;
-
-			#address-cells = <3>;
-			#size-cells = <2>;
-			ranges;
-		};
-	};
-
-	pcie0_ep: pcie-ep@1c00000 {
-		compatible = "qcom,sa8775p-pcie-ep";
-		reg = <0x0 0x01c00000 0x0 0x3000>,
-		      <0x0 0x40000000 0x0 0xf20>,
-		      <0x0 0x40000f20 0x0 0xa8>,
-		      <0x0 0x40001000 0x0 0x4000>,
-		      <0x0 0x40200000 0x0 0x1fe00000>,
-		      <0x0 0x01c03000 0x0 0x1000>,
-		      <0x0 0x40005000 0x0 0x2000>;
-		reg-names = "parf", "dbi", "elbi", "atu", "addr_space",
-			    "mmio", "dma";
-
-		clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
-			<&gcc GCC_PCIE_0_CFG_AHB_CLK>,
-			<&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
-			<&gcc GCC_PCIE_0_SLV_AXI_CLK>,
-			<&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>;
-
-		clock-names = "aux",
-			      "cfg",
-			      "bus_master",
-			      "bus_slave",
-			      "slave_q2a";
-
-		interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 630 IRQ_TYPE_LEVEL_HIGH>;
-
-		interrupt-names = "global", "doorbell", "dma";
-
-		interconnects = <&pcie_anoc MASTER_PCIE_0 0 &mc_virt SLAVE_EBI1 0>,
-				<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_0 0>;
-		interconnect-names = "pcie-mem", "cpu-pcie";
-
-		dma-coherent;
-		iommus = <&pcie_smmu 0x0000 0x7f>;
-		resets = <&gcc GCC_PCIE_0_BCR>;
-		reset-names = "core";
-		power-domains = <&gcc PCIE_0_GDSC>;
-		phys = <&pcie0_phy>;
-		phy-names = "pciephy";
-		num-lanes = <2>;
-		linux,pci-domain = <0>;
-
-		status = "disabled";
-	};
-
-	pcie0_phy: phy@1c04000 {
-		compatible = "qcom,sa8775p-qmp-gen4x2-pcie-phy";
-		reg = <0x0 0x1c04000 0x0 0x2000>;
-
-		clocks = <&gcc GCC_PCIE_0_PHY_AUX_CLK>,
-			 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
-			 <&gcc GCC_PCIE_CLKREF_EN>,
-			 <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>,
-			 <&gcc GCC_PCIE_0_PIPE_CLK>,
-			 <&gcc GCC_PCIE_0_PIPEDIV2_CLK>;
-		clock-names = "aux",
-			      "cfg_ahb",
-			      "ref",
-			      "rchng",
-			      "pipe",
-			      "pipediv2";
-
-		assigned-clocks = <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>;
-		assigned-clock-rates = <100000000>;
-
-		resets = <&gcc GCC_PCIE_0_PHY_BCR>;
-		reset-names = "phy";
-
-		#clock-cells = <0>;
-		clock-output-names = "pcie_0_pipe_clk";
-
-		#phy-cells = <0>;
-
-		status = "disabled";
-	};
-
-	pcie1: pcie@1c10000 {
-		compatible = "qcom,pcie-sa8775p";
-		reg = <0x0 0x01c10000 0x0 0x3000>,
-		      <0x0 0x60000000 0x0 0xf20>,
-		      <0x0 0x60000f20 0x0 0xa8>,
-		      <0x0 0x60001000 0x0 0x4000>,
-		      <0x0 0x60100000 0x0 0x100000>,
-		      <0x0 0x01c13000 0x0 0x1000>;
-		reg-names = "parf", "dbi", "elbi", "atu", "config", "mhi";
-		device_type = "pci";
-
-		#address-cells = <3>;
-		#size-cells = <2>;
-		ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
-			 <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0x1fd00000>;
-		bus-range = <0x00 0xff>;
-
-		dma-coherent;
-
-		linux,pci-domain = <1>;
-		num-lanes = <4>;
-
-		interrupts = <GIC_SPI 519 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "msi0",
-				  "msi1",
-				  "msi2",
-				  "msi3",
-				  "msi4",
-				  "msi5",
-				  "msi6",
-				  "msi7",
-				  "global";
-		#interrupt-cells = <1>;
-		interrupt-map-mask = <0 0 0 0x7>;
-		interrupt-map = <0 0 0 1 &intc GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 0 2 &intc GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 0 3 &intc GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 0 4 &intc GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
-
-		clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
-			 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
-			 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
-			 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
-			 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>;
-
-		clock-names = "aux",
-			      "cfg",
-			      "bus_master",
-			      "bus_slave",
-			      "slave_q2a";
-
-		assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
-		assigned-clock-rates = <19200000>;
-
-		interconnects = <&pcie_anoc MASTER_PCIE_1 0 &mc_virt SLAVE_EBI1 0>,
-				<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_1 0>;
-		interconnect-names = "pcie-mem", "cpu-pcie";
-
-		iommu-map = <0x0 &pcie_smmu 0x0080 0x1>,
-			    <0x100 &pcie_smmu 0x0081 0x1>;
-
-		resets = <&gcc GCC_PCIE_1_BCR>,
-			 <&gcc GCC_PCIE_1_LINK_DOWN_BCR>;
-		reset-names = "pci",
-			      "link_down";
-
-		power-domains = <&gcc PCIE_1_GDSC>;
-
-		phys = <&pcie1_phy>;
-		phy-names = "pciephy";
-
-		eq-presets-8gts = /bits/ 16 <0x5555 0x5555 0x5555 0x5555>;
-		eq-presets-16gts = /bits/ 8 <0x55 0x55 0x55 0x55>;
-
-		status = "disabled";
-
-		pcie@0 {
-			device_type = "pci";
-			reg = <0x0 0x0 0x0 0x0 0x0>;
-			bus-range = <0x01 0xff>;
-
-			#address-cells = <3>;
-			#size-cells = <2>;
-			ranges;
-		};
-	};
-
-	pcie1_ep: pcie-ep@1c10000 {
-		compatible = "qcom,sa8775p-pcie-ep";
-		reg = <0x0 0x01c10000 0x0 0x3000>,
-		      <0x0 0x60000000 0x0 0xf20>,
-		      <0x0 0x60000f20 0x0 0xa8>,
-		      <0x0 0x60001000 0x0 0x4000>,
-		      <0x0 0x60200000 0x0 0x1fe00000>,
-		      <0x0 0x01c13000 0x0 0x1000>,
-		      <0x0 0x60005000 0x0 0x2000>;
-		reg-names = "parf", "dbi", "elbi", "atu", "addr_space",
-			    "mmio", "dma";
-
-		clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
-			 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
-			 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
-			 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
-			 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>;
-
-		clock-names = "aux",
-			      "cfg",
-			      "bus_master",
-			      "bus_slave",
-			      "slave_q2a";
-
-		interrupts = <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>;
-
-		interrupt-names = "global", "doorbell", "dma";
-
-		interconnects = <&pcie_anoc MASTER_PCIE_1 0 &mc_virt SLAVE_EBI1 0>,
-				<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_1 0>;
-		interconnect-names = "pcie-mem", "cpu-pcie";
-
-		dma-coherent;
-		iommus = <&pcie_smmu 0x80 0x7f>;
-		resets = <&gcc GCC_PCIE_1_BCR>;
-		reset-names = "core";
-		power-domains = <&gcc PCIE_1_GDSC>;
-		phys = <&pcie1_phy>;
-		phy-names = "pciephy";
-		num-lanes = <4>;
-		linux,pci-domain = <1>;
-
-		status = "disabled";
-	};
-
-	pcie1_phy: phy@1c14000 {
-		compatible = "qcom,sa8775p-qmp-gen4x4-pcie-phy";
-		reg = <0x0 0x1c14000 0x0 0x4000>;
-
-		clocks = <&gcc GCC_PCIE_1_PHY_AUX_CLK>,
-			 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
-			 <&gcc GCC_PCIE_CLKREF_EN>,
-			 <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>,
-			 <&gcc GCC_PCIE_1_PIPE_CLK>,
-			 <&gcc GCC_PCIE_1_PIPEDIV2_CLK>;
-		clock-names = "aux",
-			      "cfg_ahb",
-			      "ref",
-			      "rchng",
-			      "pipe",
-			      "pipediv2";
-
-		assigned-clocks = <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>;
-		assigned-clock-rates = <100000000>;
-
-		resets = <&gcc GCC_PCIE_1_PHY_BCR>;
-		reset-names = "phy";
-
-		#clock-cells = <0>;
-		clock-output-names = "pcie_1_pipe_clk";
-
-		#phy-cells = <0>;
-
-		status = "disabled";
-	};
 };
-- 
2.43.0


