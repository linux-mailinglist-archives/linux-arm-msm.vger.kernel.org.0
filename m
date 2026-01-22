Return-Path: <linux-arm-msm+bounces-90116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBGgN+zKcWleMQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 07:59:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A37D625D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 07:59:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 476534E2226
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 06:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3CF046AF11;
	Thu, 22 Jan 2026 06:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iZyv43Id";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qcw/5kvb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E678425CC7
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 06:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769065183; cv=none; b=jY60IDpRVW/P74Q1RFaT4KCLQk6iUySKwVTQ/cU9Day7Fw/0ui74JWPHfaGbfQXAYJ5IcuT4SxVA/0pOzkrot4uW9xBEvuTkiEJ+LZWLkzZLSMhPvwEtDRkgBXoGL9OlMShUiC0bROM30W+vQfOYhoBhQ/M7o61enwrFcJoBYTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769065183; c=relaxed/simple;
	bh=bh0u1bpVbwToworSpszb8hcjz+Pr25WbvlfBAL3qr5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Q4fwkX4nvloL/HSYwVmOl1rHdzSmIO6lj3xrQCWUCq12J1VcsxpuMpC0Tm4KCPLhoZr3KRhgUdLqIcqfVTyHNl+65ZzAKT50HUdsipot+NvP7rm/UQmnpMSBdY1Wj9PFXEgrax7p4pPs2dDtc7inkz2ZXsk2w3pUpcL06lcNR80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iZyv43Id; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qcw/5kvb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LKn24x816384
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 06:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7pz7tYxOgVsNKayD/oohR3
	0r0S1TD/X1DQ+lgYpNCcg=; b=iZyv43IdyQGe+JAT+5tpDvurEzt9jqWCuxHdfW
	vqkKFY1hxpSkQ0HHoK7D5wgW1Mc9jzWEPq0luIWdSX/9JBTn0UXYjsS1gjN0OnNa
	6WY16hx085OVPxwXdetqy15wwju58VFA0B800665ZZRzWTw46oCrnDkv/e1ADX3F
	x+sPotQkTwANKu4wBhNNlFILOX+dIFnfbKc3uRcxkHwuWMblcVJjWsnilYVQKoIl
	sSHtgElMKjW47RAGcvK7tJh5FUy9B5WQtZ6QOBWgojJY8gp/pOhhXhxKRW7wTTXQ
	5vstM6V9ewN5cpMWZCcNaZ9wY2RZF6IDYPEAvfBUrhdoIldA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu65v1f3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 06:59:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f1f69eec6so5987065ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 22:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769065179; x=1769669979; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7pz7tYxOgVsNKayD/oohR30r0S1TD/X1DQ+lgYpNCcg=;
        b=Qcw/5kvb2ycXYG2b3gMMxz8gK86g79ctggkxTB5AwNviL3gzRP3T+/LmPX/i8I58ke
         IPdlwvgRhYRq8GLf8XpLkt5Yg0tbbkBeWxaSiOOcw9mhx8BXOXdmFPOMimllC2D854oM
         DQKwT9jelM4XyIWwEhUauent6s/pfmWxzoDjONs8LbdCJwNrhjqvpOtTa0rzTMGvJwtZ
         HORWbp0rDszcblbwCF6zWBBnuRWkUcjVpNf/J7okb2I/hcyO3MHSw4gTzI8LbmlicqPD
         DNsS5O8h/9Ot2torxufDhPt10pn7aCoie1M3kJH/Vn9cHENXodq/0BlPlN8IvNPjjBXh
         ggBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769065179; x=1769669979;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pz7tYxOgVsNKayD/oohR30r0S1TD/X1DQ+lgYpNCcg=;
        b=jfLGktexyY/eTHpNHjmihFohdwyD6BoD7fwbe4+AlUtHuIERp0yL8ZWtLoiD1Gq1Cs
         sEhKcNTUBKw2+86HRbxeaGhKM+9xSDDd8qs52PlvbR2p7Mf0Hdx2AfpcS1A8AO+d6mZI
         qvULKaQ7+DmSprlTpPndGQ90geaMlIvda3xsebl34Dlg6YuntHWkLMses96k6+W9+eTM
         mtwd4fa8z8miaOuvMZw/ms4Ow2iYwtDVm8/Zz6KZP6sTzhvuJXUAEkKJYJtjQGtTsNcS
         A17vy+YGdsze3Hyrf93sDJ6yCPf175wc17JZQoYb0PETIb/7sp3MjTDgfv2yowbkpmA0
         SaLA==
X-Gm-Message-State: AOJu0YyTL9Wq36NVvDvmdZX/NloKQv3/ffO83oXT8edVMCoTlBY9un1Y
	8p19mjrvzKHdeCM+a7jtAvMDzHBqUYn/A6ywuERw/BoCTUQCdoLrs2VMKcJI2/tvHmB8cZOPHNj
	ghFWQIS7IUVuijKFFF+JzrCW0IelvOhOxc6nG9gSNo0YIjHM+GAvs6xJAV3izqyK/dNg=
X-Gm-Gg: AZuq6aLsgULqRgWuofY6zyWWcyu5ruNP5s7ZgQ3kqyPsGZCWx85FUW0C+cPKKLQPinj
	kKlSGWHpU/tu16MulXSXuDsZV96QkplKrLTXK3895V/D84xBsoO0oVQ461LX3sjjzeoq9VFgh9u
	+EA47wGLNNliJ/nr5cCVrjsLEtugz4YVvbLHHDHLSRwxcmkXdOQ1ipDcIndG5idZ1YKh4QQGBQ2
	5YPSwexA+MUV+unbeb7EtCMYCiFA4hFQ/PInxRZiBybArJRxNMwFVus25LjKfmm30WQPyWhCAgp
	V96MZFPvfclpfLL+qYYQhNRK8NR7RX0MLwlHMeRotpyIb6kt83LhmF70AUy5HpGawFHK58jyLy4
	zoL4oSRufudCM9zzHvMN9asqnrxdMV2uU9HpbRZw=
X-Received: by 2002:a17:903:238e:b0:2a0:9402:2175 with SMTP id d9443c01a7336-2a76a389ca3mr67487325ad.27.1769065179000;
        Wed, 21 Jan 2026 22:59:39 -0800 (PST)
X-Received: by 2002:a17:903:238e:b0:2a0:9402:2175 with SMTP id d9443c01a7336-2a76a389ca3mr67487145ad.27.1769065178520;
        Wed, 21 Jan 2026 22:59:38 -0800 (PST)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190abcf0sm174960975ad.12.2026.01.21.22.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 22:59:38 -0800 (PST)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 12:29:21 +0530
Subject: [PATCH] arm64: dts: qcom: monaco-pmics: Add PON power key and
 reset inputs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-add_pwrkey_and_resin-v1-1-a9fe87537816@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMjKcWkC/x3MQQqDMBBG4avIrBswWUjjVaSE6PxpByHKBFpL8
 O4Gl9/ivUoFKig0dpUUXymy5Qb76Gj5xPyGEW4m17uht86ayBz2n674h5g5KIpk4+E4WT8n8JN
 auiuSHPd2ep3nBR/L/aJmAAAA
X-Change-ID: 20260121-add_pwrkey_and_resin-9e2df19bfed8
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kamal.wadhwa@oss.qualcomm.com,
        rakesh.kota@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769065175; l=1558;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=bh0u1bpVbwToworSpszb8hcjz+Pr25WbvlfBAL3qr5o=;
 b=iMNfaTUtOPU4KZCmDyN84roxvdiwXU3ngCqDgGFLF+ez/1QayWaeHdtqP0G2QXAdvONSBKI9U
 Ad5BqSh0qNZCZGhSRibcF/ObVvjJcLE7rJuC8PIYke5YSeINsTBu+J2
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-GUID: atJ5N6Pm-_H6aJtt3p56-7mQG0svzyOT
X-Proofpoint-ORIG-GUID: atJ5N6Pm-_H6aJtt3p56-7mQG0svzyOT
X-Authority-Analysis: v=2.4 cv=J8qnLQnS c=1 sm=1 tr=0 ts=6971cadb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=waYKtz62x7MdsOGo3IQA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA0MyBTYWx0ZWRfX/3xYqQaKDwft
 kvNHU3bAReK0aYxzSxDvO6Qqm8mFKFu8eP8yRcFyx63KMH4pSm4IxmS1t6v6gSEwLilA4YNGkqA
 LGzwAg/tT3Vu6BreQGOfrdSI1w/6Ma/adZW2/F37zmdRIWGZRIfOUvP7QPqlE6xLkqF0D9uDdhP
 AHo/et3WJAEdP+c6HOG2i7la5f5ZkY2RTLkVa4PacMAtMRjlLeOcD5hMMIYv3BR9gYzJhC0Gway
 3AeyG7pUmUfZDIfDijc9rET9elc1iNi3uH6mOmkwYKy7Dcomp5SpioyXHpnKg7kCCKdhOpd3RZe
 50ioVBmDSbxUU5UG+g0n5CAEVKOETQY8su2hnTdEN6arvzQUIE9L7cAkRG9jcWnVMWwSONRR+zq
 yWgo2iI5Ny8d0EPTT9TkPGXmXTdrt+tWDNxzo5gr9w/pU+IRESQSsYE/FycxbJG/lYPO8ebrkdl
 s83YmAJoxAmAVt7pDFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1011
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220043
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.4.176:email,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.0:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90116-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.23.212:email];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9A37D625D5
X-Rspamd-Action: no action

Add the Power On (PON) peripheral with power key and reset input
support for the PMM8654AU PMIC on Monaco platforms.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
index e990d7367719beaa9e0cea87d9c183ae18c3ebc8..051407cd83eef8eace8521084b1ad012a5192ace 100644
--- a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
@@ -13,6 +13,26 @@ pmm8620au_0: pmic@0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pmm8654au_0_pon: pon@1200 {
+			compatible = "qcom,pmk8350-pon";
+			reg = <0x1200>, <0x800>;
+			reg-names = "hlos", "pbs";
+
+			pmm8654au_0_pon_pwrkey: pwrkey {
+				compatible = "qcom,pmk8350-pwrkey";
+				interrupts-extended = <&spmi_bus 0x0 0x12 0x7 IRQ_TYPE_EDGE_BOTH>;
+				linux,code = <KEY_POWER>;
+				debounce = <15625>;
+			};
+
+			pmm8654au_0_pon_resin: resin {
+				compatible = "qcom,pmk8350-resin";
+				interrupts-extended = <&spmi_bus 0x0 0x12 0x6 IRQ_TYPE_EDGE_BOTH>;
+				linux,code = <KEY_VOLUMEDOWN>;
+				debounce = <15625>;
+			};
+		};
+
 		pmm8620au_0_rtc: rtc@6100 {
 			compatible = "qcom,pmk8350-rtc";
 			reg = <0x6100>, <0x6200>;

---
base-commit: 053966c344dbd346e71305f530e91ea77916189f
change-id: 20260121-add_pwrkey_and_resin-9e2df19bfed8

Best regards,
-- 
Rakesh Kota <rakesh.kota@oss.qualcomm.com>


