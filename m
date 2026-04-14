Return-Path: <linux-arm-msm+bounces-103186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMU/A1J23mkqEgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 19:16:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A43663FCF1B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 19:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF2B530D8E4D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 17:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742E82DA75C;
	Tue, 14 Apr 2026 17:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q/X/wV6w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZoFkPwlb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DF830ACE3
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776186540; cv=none; b=JjiUJh8TSLdOLExHlRACr84XQVUY40aD9VYwMJzRWqBOAhNrrcxmQ53w+arSDJV/++taQvXgwwPWTMZu0wQ9kol9606P0kA2f/xitjOdvPScb+8MgtIIEqzfYgtMQDmkLhQY+eoiKuzF5Vwx7kQuNl0qD1IU/q4UHhIX5W+WBlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776186540; c=relaxed/simple;
	bh=IgTiK3VQikktQ3bhdHhNthcHJWHKgEMDAuE4IYnpRCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j7uFs50wlJL0d0a/KAofSA+p7s+DR0SEcIi9bM239dJ8TWAY0G11XczUbGvW1tDjBPmWNkynL9R+6Phy7evAaJV+g1PyLMCSEdtBADtQh68flCSeIReJjQR7fUqYoL4MtxTml+BbCr64cdpgtWhK5JrnQLc4jEgBPR+nC60rN/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/X/wV6w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZoFkPwlb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63ECKxAG967321
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XNGQMl1wIgawne13RW19Nmh2+8Kel64Nl6KOL9zWOc8=; b=Q/X/wV6wzqC2pt7y
	2q9v/Gd2EUo2kKA+8K/GQ5/D5NaET+0kGVrmMwAOFjo5bUrR0AaNI8N9TYdbL0eW
	c6e8DsD9YtZDNUP8zwqvKMR7snKX5ii1tQReElIHByHyUDgLfuVn87rqHYOe37vF
	iKiBntod1+/TrQQI9Pqi4Ye1i0TyIDMA5URKTpSOwZ6DUODupoJ2SKKrsazqSQAH
	nGYPpm3IhQWD1QMnQeETXCG218l+kz4Si8UmHHlN3gWqE22xkCrjZmGlALiKstj2
	gp+SNzwxFaINSteY9jnzbbgSb3YrHzfxnvIMVEW02Q3F/1UGV02eUU0DE2w0e35N
	k0lKjQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86v3nsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:08:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2e6ee9444so32363365ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776186534; x=1776791334; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNGQMl1wIgawne13RW19Nmh2+8Kel64Nl6KOL9zWOc8=;
        b=ZoFkPwlb9NS5UwHc//UB+tpyJt2Lc2elvzDGZaV3q8Uaz1eW8Fo2KPa8nbMJr/ZPij
         dd4Ewa7wu8/nV+lUsFgzQgEVQeprO0f4KKBidIkhS2DAljSH6PSFutbFLbHIDbRrfPD3
         /UzzW8FSKSCigm2J5mFdCbM+CC/0Tyey34bMQPyadQpdrglNihbWy3mHtwMxk8vuHMay
         uVmSDbtIjmV5qc63kj3xrVT07dfzqNYCJqscHlBM47SqiETXVRYdfrenBtOVkRoM5ZOr
         2uwM1WsEkhnw5G4FQ7DJGeav3EKvmSJNygZwLSlOqocdKLehXLQBiSQMsQtzXfWhuUk9
         a5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776186534; x=1776791334;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XNGQMl1wIgawne13RW19Nmh2+8Kel64Nl6KOL9zWOc8=;
        b=fRozdl7OeYqDPZ7gIPJI66GXPuhZGxNa2hoYbFkQEer9DVM0AbjN/rR+eOgs8+4O/J
         pXV3q50rDomVf36sRbMjC5/S/sTyEAubVSaD9BoqBDmUSgmGT8fmbk5PgYxYlShEn6YE
         xsshwMT/h1+7sgXJm9q2vecTSNW0zVBP3zIt4Kc/aVYbCzBsFpdqbi4JNuVeij3kkgKJ
         cd77oxBAAkHa9o+ARlTuw+g6TlWABaP6enTx0kl+ytOKD5+74y7h/e/rgAhTMyrhK9Ay
         6uZrEhxEbVFfe/tJ7SzUfyGfAkgAuoJK0ImS55zSmp3NknmORSmkopX4N+rO/6UzlSyG
         gkEw==
X-Gm-Message-State: AOJu0YyJu//EiJ1261A1bI1hfYzoInSPw4sVqh83VScibhkQ85UcVhSr
	8xyAS1oq1lkYfQNLtqJvwAQMWa/MKZlKVmFkVCVDpQBfWQ7bgLt60bDHuGKE71e3XBr5UvVvj08
	j0vPJ0afqd2QdGII/vb5fMK+jGd5/4l1jPMJ7uUXP/lG+XNeFbaSwrCAfAiaoLDi+WR9X
X-Gm-Gg: AeBDiesbD4AYlIp41I6KNI4d0nlgS0wDqu+DNGNEE7ldigDRNfgS5FUjn4GFP5pBGiT
	b5ORHk/dYsXEjAjGpSSsQQNMD7ji+77eETrZd2prI2IfiPJ6juAnDhAaSknFZL69oeyN9mmi+sg
	X3fTNOpqbMjjB/jhBPERzjT8LkRK/OHhKmw83iY6MG4s2xsOW3O6iLLJi9+zPi05bUykAv1wLJZ
	S5uTqfsLjssoyFABxVo5zlNqkwK5btmh/Q2+F21AWVC93O9JmD7cgn214KTchSOGhvNvHpU8cry
	zq2Mb66HZopSDBgYqTWqTLP7jD9sHThflkfk1CQQQazs8dFESzPVm5CGngMCkSMuMtZeqzhc3FQ
	lgSkquFSpVrJEYmU/0wKWovr1M8FwwQ8B37lPC9qoQAEPj2+3lgyoxfhPtSDj5xLKwwqC
X-Received: by 2002:a17:903:1d2:b0:2b4:5e85:efc with SMTP id d9443c01a7336-2b45e851a64mr83014465ad.18.1776186534079;
        Tue, 14 Apr 2026 10:08:54 -0700 (PDT)
X-Received: by 2002:a17:903:1d2:b0:2b4:5e85:efc with SMTP id d9443c01a7336-2b45e851a64mr83014055ad.18.1776186533512;
        Tue, 14 Apr 2026 10:08:53 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b45d1ab540sm97535225ad.40.2026.04.14.10.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 10:08:53 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 22:38:22 +0530
Subject: [PATCH v2 4/7] arm64: dts: qcom: talos: Add QSPI support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-spi-nor-v2-4-bcca40de4b5f@oss.qualcomm.com>
References: <20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com>
In-Reply-To: <20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776186510; l=3130;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=IgTiK3VQikktQ3bhdHhNthcHJWHKgEMDAuE4IYnpRCg=;
 b=Hn3jBnJEy35TwQL8GD4jT82pIKQljdG4waTae8kMtW6LSnqDWiFJGPYp2dGHEFR5z4Y2RTi9B
 XkHSGhd3U6fD/pBWDgB2xaHWxKjA8IE1L/Jr23jfj3l1DmQ5ei7AXlq
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2MCBTYWx0ZWRfX665jlNtJCs7M
 EB6rURF6WkLsAaya7phFZdJs6/29f/Lir3IcDfczkw4Q+hLTgZq4t+sTqbbuc5eaZOa5xPjGz6z
 Ud7QVBbX6ehc3MRaoIrYHd24CjR8RE89aOItTARxRkgjFdH7N/Bk784BRC5gVutW1c6OS1CKwGP
 eRsc//1FZVfqLYlbas829TOdNWmu6/zogwPZooUsTl7aAkE5Bf32+HxTJPjMiJ+l2BuDo1Ru3qF
 rxvIzsLotxLcy91T9LaJqTqba/0Ggy4Gw4Y0U77RPLzNefYxcFZnE99gIbpuJS6yvDkCDPaanna
 cLKwXuGtIIfJkog3HX924x2D9o4knqC6C/CeMTaV9dcfUtgwk7Hyy8UzRf/UHz6lZ3vNN+PMNZ0
 gW+rFwElxoxt8o4sLcZzhhOzNwyxDW4BwEuvewYejl1V65dtj9xbpPNPW7E9awWedtabSNl6VNi
 TXD9yTFqJLGWqE+v88Q==
X-Proofpoint-ORIG-GUID: OTqDnFH65_XFWHGNQpjS2_Pspv9XlO4c
X-Authority-Analysis: v=2.4 cv=Iowutr/g c=1 sm=1 tr=0 ts=69de74a7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=NWNfpJqe0LLSB_FnjTEA:9 a=pZLAQvCjzIbhQfNp:21
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: OTqDnFH65_XFWHGNQpjS2_Pspv9XlO4c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140160
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103186-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.139.197.64:email,qualcomm.com:dkim,qualcomm.com:email,0.47.77.96:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,88df000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A43663FCF1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Talos (QCS615) platform includes a QSPI controller used for accessing
external flash storage. Add the QSPI OPP table, TLMM pinmux entries, and
the QSPI controller node to enable support for this hardware.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 80 +++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 75716b4a58d6..9aaf69ba333e 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -530,6 +530,25 @@ cdsp_smp2p_in: slave-kernel {
 
 	};
 
+	qspi_opp_table: opp-table-qspi {
+		compatible = "operating-points-v2";
+
+		opp-60000000 {
+			opp-hz = /bits/ 64 <60000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-133250000 {
+			opp-hz = /bits/ 64 <133250000>;
+			required-opps = <&rpmhpd_opp_svs>;
+		};
+
+		opp-266500000 {
+			opp-hz = /bits/ 64 <266500000>;
+			required-opps = <&rpmhpd_opp_nom>;
+		};
+	};
+
 	qup_opp_table: opp-table-qup {
 		compatible = "operating-points-v2";
 
@@ -1553,6 +1572,34 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			qspi_cs0: qspi-cs0-state {
+				pins = "gpio44";
+				function = "qspi";
+				bias-disable;
+				drive-strength = <6>;
+			};
+
+			qspi_data0123: qspi-data0123-state {
+				pins = "gpio45", "gpio46", "gpio47", "gpio49";
+				function = "qspi";
+				bias-pull-down;
+				drive-strength = <6>;
+			};
+
+			qspi_clk: qspi-clk-state {
+				pins = "gpio48";
+				function = "qspi";
+				bias-pull-down;
+				drive-strength = <6>;
+			};
+
+			qspi_cs1: qspi-cs1-state {
+				pins = "gpio50";
+				function = "qspi";
+				bias-pull-down;
+				drive-strength = <6>;
+			};
+
 			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
 				pins = "gpio4", "gpio5";
 				function = "qup0";
@@ -3682,6 +3729,39 @@ opp-202000000 {
 			};
 		};
 
+		qspi: spi@88df000 {
+			compatible = "qcom,qcs615-qspi",
+				     "qcom,qspi-v1";
+			reg = <0x0 0x088df000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
+				 <&gcc GCC_QSPI_CORE_CLK>;
+			clock-names = "iface",
+				      "core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_QSPI QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&aggre1_noc MASTER_QSPI QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "qspi-config",
+					     "qspi-memory";
+
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			operating-points-v2 = <&qspi_opp_table>;
+
+			iommus = <&apps_smmu 0x160 0x0>;
+
+			pinctrl-0 = <&qspi_clk>, <&qspi_cs0>, <&qspi_data0123>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
 		dc_noc: interconnect@9160000 {
 			reg = <0x0 0x09160000 0x0 0x3200>;
 			compatible = "qcom,qcs615-dc-noc";

-- 
2.34.1


