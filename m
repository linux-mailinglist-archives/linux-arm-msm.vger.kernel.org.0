Return-Path: <linux-arm-msm+bounces-105955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Nv33JJnj+WnMEwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 14:33:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C454CD91B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 14:33:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F43830EB95F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 12:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA9142E01A;
	Tue,  5 May 2026 12:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="allamCO0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ac6iDUM5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE12443CEDE
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 12:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777983941; cv=none; b=YXSN3KHi3h3Y7h0r4SJJmYdONd2276SNHPP2SzQuldfYJAZTI2a9lA37xGUu5eAbh2eWVibyksdBI82qR5uJDqFXxBjvn5180qdqkqT47ubY8lWYizdIoAwX18KFdzWBh+ECDsKG52BdX49LKrQFH8uP10W27jdeLEeRIP7RjiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777983941; c=relaxed/simple;
	bh=NLhQZWVqdvbCGj18sMVaKtq4ki84eZ97ltTwhZ8fSS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oFH8F68c4z14Si6u8/Vnt/aRu7wkK/X/Nk0r6TfHZLjN9yYA0kWPfhrzvc7k0BtRuC+FPLJmqwpTgz0Yk7fu+UMwkkHjhQVwvUq24nFjWibrtHQh95fF8mFCB71uqTIrKfkLRCpMWwx1lIvvB5+QvCDxaOSWegxqY3/txtwNuqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=allamCO0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ac6iDUM5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6457EPRI366314
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 12:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kU1DrGXqJJxxsOVL+vVCEIae7MafQG/QodTodrFEZms=; b=allamCO0vI7TADws
	VkmsVg/dDPUk5xTLfNNwGzjUMCPs99tz4e3s53RYkw7dTDwYAMhyNUD7wtfbrLkO
	+iyUD8p5NH9a6mLXqj8ibDCujaUSEvlLeX9CR5E+mfMLAXeCHSiL0WlA4hdCZhpW
	UkuJyayOxkbCeIZYNlpQKqkPA3WLBrJMNrjndH30ISHwuaTY8gmpT3GJF7225Zsr
	GyoCeZUTW5fLDtXNB9t3yk3P3aGYoqoxD//HckYLNbGzhwpje4SE7n8I7Tr+Iu99
	8YbvSCt2oIEXPgPMhYzhwMzM5gdkICUGILNHEMf2Dbkngce4wLrRBiv5tNyooZko
	M3a+LQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvn6vdd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 12:25:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3652861f61dso935800a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 05:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777983938; x=1778588738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kU1DrGXqJJxxsOVL+vVCEIae7MafQG/QodTodrFEZms=;
        b=ac6iDUM5YGRyTDUf3D9xrybPUHDLpva9Y3L3VMspTgWFbs7NMtP3dUMX5nlMnyuyyn
         XJGg3MAPOa8KDFO9WFyO/yRBkQbePX/SiCWrbZZTWl8djSuLEM2GtAzhs/e14zAvRA+G
         V1G5BKJDTRoQdV++oDdlh1T/mH8LhjGy35cOT+c5KzGhGhD4zWMFxryUA/1C14+laBk2
         bnhNv0H7+tSaIt88toTzQtNHmL7zjZX2VmleQ3pjpKX7Zermue4f21Qzwv5EQJIzfN8q
         5jgVviiJD7d4jVc6InwBO7iZ+H9P8YBkuBhzSaWipoZi+7EPHDmycRF6fcfvkeY5EUib
         xDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983938; x=1778588738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kU1DrGXqJJxxsOVL+vVCEIae7MafQG/QodTodrFEZms=;
        b=BmvkkAjGRr8A9ol2iv9JZzIPEE70DubJFvQD6fnHr50eYjgarQowNTr197spTxA4LB
         pA7r7Zv7eSKaItJQkq2uKRc18ScAuTWivXH+hQrXg01PccZFgIasbdCwYoOY+jUQcxSV
         7BnSLghpya0RP3OR7IWpCoafqGL2uCa0or8zR8E64v2F0EDCFg+OwxbEJUE7gxD7qXzV
         rGduY1fuCYHV/qvhSuNBvpfoyrO3g575CgPBrOgZ3C3W15ovsmLGKDcj7lG537CgzQ7A
         w+dTziALb76eGccwiC/8Xoi2UBKvt+ghz7NT+I57QnHhUj7WzkvKiquphwGATKbnTf6P
         5/Qw==
X-Gm-Message-State: AOJu0YyFuJj3uc9XO4tB7RF17RQOheaAM96RG0mXeL9FOMk+hxr0WgUW
	JAfcbpsIRpYb2qt1+GbRytqULz6guEfAWLqtBvDvfRFOUBghsPLc4aGY8dNa/kDmLYjfk96+Zh+
	N+1pN9mnyIjVMecCGL/VIBj4KVjvgnNXSJ3hya2xklTOG4YVObQ4HCGzmMlroltzYYb7z
X-Gm-Gg: AeBDievtlgQ2/3S67MDXJM/P98yzVk2+x8Y7B72axeq7WvYTOJ8gtJruoIDNrqP6Keo
	yKxNI7HtVhF61KvDwsRkuTUkR1XIj7c1nNyTu8B8ciF7MjJQaqnRfRJXKVwYWvly80oI5ievIX8
	joyO8EQ7b6O8IG72DUysjHx5PMUXzZ3Fx7F0KWEb+rXDl572al9TK8P6XDVK3dnIXO86tFJQAYq
	ofXKyA66Qeo4ewixyOGtTiVLdpCuLCyIVjSbpZz1QvoI6Ysx88rex8h09Fc339GsobBoFGPIAfx
	wTfZ3D4F6RzCzLs1gklySByCm3nJtj9T79dgOvdXQCHsIN3GUOBZclOG64+NUgpGfQG6YcTZq7a
	2SmhghVyi+v5jx7uB5ou5BHprJd7NIw8HqZsv0uTM4FCVzKkv42z3y5Lw/esoWIs=
X-Received: by 2002:a17:90b:4b11:b0:364:b4e7:6705 with SMTP id 98e67ed59e1d1-3650cd4b1cbmr8148868a91.1.1777983937600;
        Tue, 05 May 2026 05:25:37 -0700 (PDT)
X-Received: by 2002:a17:90b:4b11:b0:364:b4e7:6705 with SMTP id 98e67ed59e1d1-3650cd4b1cbmr8148832a91.1.1777983937065;
        Tue, 05 May 2026 05:25:37 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbbaac5bsm12597998a12.6.2026.05.05.05.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:25:36 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Date: Tue, 05 May 2026 17:53:51 +0530
Subject: [PATCH 7/8] arm64: dts: qcom: lemans: add AEST error nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-aest-devicetree-support-v1-7-d5d6ffacf0a5@oss.qualcomm.com>
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
In-Reply-To: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
To: Ruidong Tian <tianruidond@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
        mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-edac@vger.kernel.org,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777983885; l=2483;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=NLhQZWVqdvbCGj18sMVaKtq4ki84eZ97ltTwhZ8fSS8=;
 b=AxeiR1PoOYSoH7YgiXOYSRmTYri6J2MZYpG/MV/d06jya9y2h7Kbv5MveGf0exaihAYq4bCo8
 76Uu1Oj72luDypcGDUDV8xei29hbuhNCmXFO8hpt2yop7HOiOOdTRqC
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Proofpoint-ORIG-GUID: -QMpQHKOGCnhH48DK2No9kEP5MTL5anZ
X-Authority-Analysis: v=2.4 cv=Z+vc2nRA c=1 sm=1 tr=0 ts=69f9e1c2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FY89ualHrA3BDT43sc0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: -QMpQHKOGCnhH48DK2No9kEP5MTL5anZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDExNyBTYWx0ZWRfX1DfHme8q688J
 z3wifecQ6AvGOCEE/5fLlt8+8zqwzG/SjQ8hFV4SReLBnN2FTPk6Ie70CWJrkJ8C3W/g2tq4tSN
 gELjQroPN4zIT9y7hMS9eBSeq6CSNcMsSn0+2dS+80jlLMqgIJq1QsXZXUNVI/DuR1H8HI09VnF
 fBv9sl4NAnUw9anZPfFvR56MGXcv6DhfSIWUgvD0sjk8UnBcZz4c1xtdqX6S7ZTu64dYzJpALmt
 F1qdzIDSRfjTH/EkFUHqk+CScaztHcBS+UfpCpCV1UMzS3mE8gRwhF/mtF/UiemMSKHP+OSHfP6
 AqjI9GrpbfeeOsDNgQursnxVw5NKLtIYaxVqPMgVsc2KP3b04DuAzVlPYbXcu/3hA7th2+M9YUH
 YRxcL1I2Oi4RqM0XmIm5SEghkP7ePqTCYpwkM+so7x8fGJ4CsXGw1ah/kCQ9M+QBB9iR9dJSKVU
 pMIOe6dvL/gWLMUia5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050117
X-Rspamd-Queue-Id: 33C454CD91B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105955-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add AEST RAS error source nodes for the Lemans SoC.

The DT describes a processor error source covering all CPU cores and a
shared L3 cache error source for the cluster. These nodes model the
hardware error reporting blocks and associated interrupts as required
by the Arm AEST specification.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 41 ++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index fe6e76351823..199ea1f9a8d5 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4,6 +4,7 @@
  * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <dt-bindings/arm/aest.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
@@ -29,6 +30,46 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aest {
+		compatible = "arm,aest";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		aest-processor-0 {
+			compatible = "arm,aest-processor";
+			arm,num-records = <1>;
+			arm,record-impl = /bits/ 64 <0x0>;
+			arm,status-reporting = /bits/ 64 <0x0>;
+			arm,addressing-mode = /bits/ 64 <0x0>;
+			arm,processor-flags = <AEST_PROC_GLOBAL>;
+			interrupts = <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
+			interrupt-names = "fhi";
+		};
+
+		aest-l3-cluster0 {
+			compatible = "arm,aest-processor";
+			arm,num-records = <2>;
+			arm,record-impl = /bits/ 64 <0x1>;
+			arm,status-reporting = /bits/ 64 <0x0>;
+			arm,addressing-mode = /bits/ 64 <0x0>;
+			arm,processor-flags = <AEST_PROC_SHARED>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "fhi";
+		};
+
+		aest-l3-cluster1 {
+			compatible = "arm,aest-processor";
+			arm,num-records = <2>;
+			arm,record-impl = /bits/ 64 <0x1>;
+			arm,status-reporting = /bits/ 64 <0x0>;
+			arm,addressing-mode = /bits/ 64 <0x0>;
+			arm,processor-flags = <AEST_PROC_SHARED>;
+			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "fhi";
+		};
+	};
+
 	clocks {
 		xo_board_clk: xo-board-clk {
 			compatible = "fixed-clock";

-- 
2.34.1


