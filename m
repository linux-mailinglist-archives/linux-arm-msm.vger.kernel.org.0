Return-Path: <linux-arm-msm+bounces-99679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAj+FmyQwmkXfAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:23:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F6D309517
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:23:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5688B31EDE9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1841036657D;
	Tue, 24 Mar 2026 13:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JfDcLY2n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aaStUaRo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A729837A494
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774358042; cv=none; b=sbwxE1DqIKxWVlMoxI45J42y1aQ1tSO0ub2VCEI3PMBvvoK2+NWVKK0YicjDB/GDZDgmYpLfZI+aqLwSJ3kh67MxwyEO74R86J6r/IQkw69dGkCJzAhDI+XN9Vsgkq4gn8ldR9+9XJdieHaNiSTQSyhowNv9m4bsXFY+z/DdRt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774358042; c=relaxed/simple;
	bh=WXipHHaMSghZTjkBOpnJEI3bnyrHeBcaQLZJ/3xgUYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XjcvZbD4D1dxzDWtGWcUFgfeaOtNw0xqVsoDZPyu/c13Lhw+TAFin524Zj8B9eumGuG9dewwr/hDhNXpv10PgBDlQik55eZq33fAWX3caw+MX4F0eI5pv0sQpJX+thWobZqXhDQXEbTdV9SyyvU8SUA/8gc9KCm3IXoN7eBux4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JfDcLY2n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aaStUaRo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O8xlBQ2322963
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+09D4ZEojkjUPpZ3Pa0bm6VEOfzKxGqmEjdyH+dgNWw=; b=JfDcLY2ni8aL6QYu
	8u436Blw82gn4wj75myCYSZ4wBH/Uds87Fh4wZsrV5dN/N13ZoIQESCNEiyP5yWh
	6g7p1I6uQXGyh/PRvpyfx7gHStnfakRhiZbuvcHFJHJwbRXqBXYECp60+jtr9Q46
	D+yh5PnkRvVDGHnR5vTeLTfOT3j8ClCX7XredHOXgnJgZIq31ga7HQ+68ANnb4M1
	qsvSim+/HLTAbkCFJ51iXO2vFmLwCAlCSA1BP9GrTVqsQ7IlkyhMUxf2YJdabYv7
	ZNp0SOAZOcxCfWrv8EURJMyk2FjQO5pCZS1FEE/TR72xDynBFb9vy5H8VkVFD9sc
	70jFTQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3qkes0gr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:13:59 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c7381a9a932so2527420a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 06:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774358038; x=1774962838; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+09D4ZEojkjUPpZ3Pa0bm6VEOfzKxGqmEjdyH+dgNWw=;
        b=aaStUaRo3XtMKtWx4WgDDeUHijFl77qzmfc2PvotAN0jEd6hBskihPoTMS7Vf+vJlB
         GN0cuTmeCYcVUjOgk+nXBsgFTDNx2T3DBxUEiFGGU3WsRG76Vwp+BiMR/zogMsb6aSsJ
         wBRz2bGRkKx4mmgp4EShTFmwfeVMTWmna1c2BCaYbIdZ9zIsN108O+mOVF49WncMvdM1
         W/vnjT6+luEdacbjF6iNF5QU0Uq3Mf9Zf9roIk/TGH7ByhETj5zbG1EWkuku3JUzTCd/
         T5nt2PyPcJOGzyVBmaj7p3fV0JQB3zbGIIsCN216XaHZhKo8qRSUzKbb6xfgonde+Ll6
         dVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774358038; x=1774962838;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+09D4ZEojkjUPpZ3Pa0bm6VEOfzKxGqmEjdyH+dgNWw=;
        b=k/iV37jluRsJbpBHcE9ZwTwa4tsQwnRi9uvPazOiGETB5/54bxKLrEV3rQ/8AIf0YI
         f5PnK8a5jJw/uaBpNOuMVu9t4B2SlFjC51+zg93nA+kcLOrfzhYsFLr9p5iUbOAZellv
         87N5XmxOgmGs5742RxqxANL7+6Fuz6BjEGkeHw6E9LYBaZHF4GTtyqhZhSUOnJF8QUFS
         N2dgLqnW9WVV1RvKCOl1CZJb91XB9LWGRGMk6HOZDorU4pRTmg11lX69AIxB1HRX2Kkh
         2vJH0OozGmECmDPqM5CrtJJifizx6b6Zf2kxmwalVLZRypuVehYUsC5fwgapy37P4WMx
         F3Gw==
X-Gm-Message-State: AOJu0YxbdddaEZtfthhAzIZ3UCqH8grSF7Z4X/H2wFYooebFRmrwdGMO
	BeulCqXYTkumZbE85PFT5UQ5omeKVYk9/mUel0y4HGhr+uKWIRmlQJc7tFAHx28lQa1tfV4s+hT
	cB40xBF9UELh3+i5eHZuVccgTL5TfwVQrr3yIgDd2aGl94NtKvaC9HkrY0/66O9WB6sk5
X-Gm-Gg: ATEYQzzkoudbO/9CkN9k6qZotZu2SIpJwQ68BXTy/eNX7ohbb5Fc3l+kiS1s62mSgGt
	+enj8C5Zem7hEmz9o76ZVpCQdhMBXNPzLl/jcrVrQcElJGrULGD1uAlBg/Gc729M4cEs1Z3cVzy
	rW+Q0lArcY1BJkRBJ/usOP/wcekFlbzeBGfbUvlAjNT9qJX//YbkXOd0w7G44U3wbLmCj0o1+t/
	VQeosFOD7zd9UrAIpfgHkvzVBuDhMRfs0jOgPEKkgzxjgipEjEEvSYiPKV4B1wAREmPZK2Y+pHQ
	F3wbE0dJzyAJPwfxmfyjEBfpGMn3jdjwQ60/pSIhqmS9NCmEipjWqzb7+tWPrTOX3ivJFw2I4hT
	rDJZw+w9/FW4HkKza4vgdvL1gWqFzug6rJLAXx7AtT67k+YpO1teFJJDmrQ==
X-Received: by 2002:a05:6a20:a12b:b0:398:837a:7af0 with SMTP id adf61e73a8af0-39bcea60f64mr14340262637.30.1774358038225;
        Tue, 24 Mar 2026 06:13:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:a12b:b0:398:837a:7af0 with SMTP id adf61e73a8af0-39bcea60f64mr14340232637.30.1774358037614;
        Tue, 24 Mar 2026 06:13:57 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03be3396sm13517528b3a.27.2026.03.24.06.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:13:57 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 18:43:20 +0530
Subject: [PATCH v1 3/6] arm64: dts: qcom: talos: Add QSPI support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-spi-nor-v1-3-3efe59c1c119@oss.qualcomm.com>
References: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
In-Reply-To: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774358020; l=3110;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=WXipHHaMSghZTjkBOpnJEI3bnyrHeBcaQLZJ/3xgUYo=;
 b=2yysSkf3SS58hQVmvmZKweLn9qogFyPrp2HBItlnHKLGeVHRkadtm0lApPBfmum63eqvEsWYJ
 5p5MnmM4z1kABGt9EXo6MkjjfZCVpH3EjqOcUVAXsBggmBApjvIOtHm
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-GUID: _hfTBpZNjZkHNRY7n3dlrCPf-9S7XrLd
X-Proofpoint-ORIG-GUID: _hfTBpZNjZkHNRY7n3dlrCPf-9S7XrLd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwNCBTYWx0ZWRfXxcWIR3qknHrD
 pZgkI0fttBAGJpsxE7NjPEo0s0ytaqoaX22ycm9oJn/TtnNiPboi1XE3g0rp09rhqe3kQC6Log4
 +1EQ/rxEcsPbwIqImyo4CIg2xNBxG/H9+KBvNSbAAJvTcBWUn6rJma9+CaFg8HGddTjt+2ewxXP
 26qHwyl+HIBhTYHpcI/l1ihK17/hR8cm1K4ughCs/rAjH9147DT1qOHWNKDW2qIHYsB6YYyYRSi
 09gGqwFjuv3tMAqkuiQYLNSNbyfJ5yiWQBAul0Lr9HNLd3aLYVqO6ZxFAgxi++stZnBWZahI3lM
 mGkXIrBehN20H4/GmdXIv5Mdc379jdRO/ljHM+aQCxXz7N0EUWVSGUMLTcToh4vk3gD4YUMgg53
 QydbnnVIic8uPWFYs0iTlxr5GEzhEBrULNpPx6q5EMDP7kMLizY3b6Wx1aR+5tapdPiX7np5oi+
 00FLLQKAQzr2pUhI75Q==
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=69c28e17 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=CbYcEB_S6CoEFAquLCsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240104
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
	TAGGED_FROM(0.00)[bounces-99679-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,0.47.77.96:email,0.139.197.64:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,88df000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: B6F6D309517
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
index 75716b4a58d6..fd727924b8ca 100644
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
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_QSPI QCOM_ICC_TAG_ALWAYS>,
+					<&aggre1_noc MASTER_QSPI QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
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


