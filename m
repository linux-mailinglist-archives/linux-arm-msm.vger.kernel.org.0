Return-Path: <linux-arm-msm+bounces-105246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOH0MQMj8mmOoQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 17:25:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5E1496CD9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 17:25:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8E085300FA3B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 15:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96B137E303;
	Wed, 29 Apr 2026 15:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Col6oXuT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kEuAlbz6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091FB37B417
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 15:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777476304; cv=none; b=u8zsrHSYp9uOCk5AtxAXQAwCstzJGm4QQ8l4xwwS7SqNpPI4nE0WXNUs+KRsgql+Bv30TLjEfU63e5o/atXu+G+AxgZKqS9xCU1Pq9RPuuTFzG/SGvHTpvCxTFWr8Wt4xJhzMLhQ+Ltok5NZiiJ4raPxmt7UygW6BLYBXfY2/XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777476304; c=relaxed/simple;
	bh=J5yfDWjRPOg45bYa1539C2lhtkSrcvJpcd7225W2npA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CjCnx5nyT4mZH3xk7SZwdZdKRq8wljgBRvgl9EzRCG+ixqgz2UaOHHSiHBzrHmaLgbz+8Ym4BGtELopiELzWZqOJHazuZHY0zD4FFTpOyNaEz9QqIm5DTPicaJfplFXySpCdGu6eyZ+t6bx8C1L3YGChucrT1Q7HfS2OMiVyAa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Col6oXuT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kEuAlbz6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TF9Sam1642983
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 15:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pBxrTnylXxKJx5MyZsEuxtXxFkSCDa7WzRS0TCgvkKI=; b=Col6oXuT70RWTMIr
	ukTIGP8Sz9i464t9hnzoYU88uubFi8tUAM5YUIo6L6TN7Tx8SM2gtyom8tpl+stb
	wmAQkIxaxGazkUsYkj4WPTbPUFMiZGk7NJYWH8HrYmkbcHdyk2PpNXxmuxfS3SkZ
	0EazD2NpaFbOSExczcGISOPeuSQDbCbUpFoHPL3ZVUdFaIPcOhSurpqJ/rigFD6A
	NnFAflNOD3jNFtRKetFGVFri7iGPwk2OLdYHPJlqwbgl5QZ6/xSFBJLSFyla/S0n
	J9Hw5KZlY2H88IJncJwfkp1ch1CqSVinY0IVQ+/yYDIgsJuBHlbf53Wp2J1aGorz
	Gpr8GQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ducj8261j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 15:25:01 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35fbc53b64bso14187457a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777476301; x=1778081101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pBxrTnylXxKJx5MyZsEuxtXxFkSCDa7WzRS0TCgvkKI=;
        b=kEuAlbz6o1y0PDPyLcXnL59z/M/HSlB5xZ1gkU9uO/UrceNo1m7wzncNlEORVGf2oM
         fBoQaj2kt4QoODU5rei/FGfGEVu3zcyI4aSHhmfjCWTbg/4Q9WsQmeK9K/2bnF+VsT/C
         +m05Hm6LJt2P3OCoY2awrD4Wsgw9XI73G5CbLGm7fAjKIiiEnywpmpEOf+9FGSpD4UgK
         2gcFPpJZMniuLe8oqJMN5GYozaQBLr2bZbdOrlXxMIm+qnXpFOTlieoPd/2STe/uOPMv
         iss/b6lrsA2tCeF1b2M0LEv86H/Az71ku+1FjonkWPNTCyDqgxsqZIKV7qO3qYqv38GV
         LUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777476301; x=1778081101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pBxrTnylXxKJx5MyZsEuxtXxFkSCDa7WzRS0TCgvkKI=;
        b=qI9cMm2P0Pbk7Tx/I/PZMXLKZJx85pyVeQSXIkAv7YVM59DvPQdBCDZwf+pyuTct7D
         0WLwWZL8cdIgxoOs8X+5czGHS+IiDsHcFg4yWwTG5IjXI7raQAAqslteGQzppsOg97jm
         VtxMg794igqevH45vyiOXwBTNMe+yqWNc2lHJ8gr/+6tabeTocCRBigM35CzuT41kT1d
         LtyrvSWHFHWKH4PbQI7v966PJAjgkcYWtDzZZCWukXsGkx9lOOw1Uyxg1V6LTINYgJC2
         ebDEojW+N2R2kKfV3ESo4hidT0joH5kV4/qTP1GHwiT9vFJDy4K3aSW86aBfalW8cAc8
         YOSg==
X-Gm-Message-State: AOJu0Yxw7mkfi2iJUMozkGrU66L50Y918OKHHZ2ecwTj3b2YjnAm3rnq
	y+p/17QiHlUQjlAva+vMJvMkjp+0mmhd4oBtnt9bUK9lHuKwFveWbB/ZLBzv8aPJxWxSu+JuX2C
	Js+aFUilv5iZ9pSXi0jLAt5PXTucEirjnJhdnqEciAjlecpQ+ZHWPBN6+muxU5fj7ohBW
X-Gm-Gg: AeBDievPzZUx5bABuz5cftIF4Ka33C9es1P9dVt+KCwix/VgDpNT59vdSiqWrAypRLf
	qaYFomFL/4y1E/qVpAwOl0UymfXQAHj6jmRffILDXDJ3WTQGRG3Nk3KIeJMWgqJS2CBypHUpR5R
	QidUsTtYvjwgX7/YPEvfyyd4Ns0CgFjjuOCHZFJBlfajb92hFtevn/6wxiJlqMVeItrxdwN61Qr
	cQaDqg17+G5Dqo8Zd6rQpIJC9ji7JXqc8G9g1I/N4bOEERlmIRQWZG2nncVuBFMbyfKxz6+GdoN
	I1E/WW2vMLtTxUwodE1GAylCN/1MR2bYEPPoVwy/lh/pBe8az+EuS/tdb1kC41w3I39vZXxF/i/
	Tr4KFXV9uYUc+uCDZGebkLvVTg/LNDuAMBUm43JV2948BbIUIMX+TutJPs4cMOICJ34OYJsbrfn
	rkStoaGDGZbVsRPxhYRgzbNaIgm/vRBnPaNBNoHd8AEgRO43TPDk0EIFvfl6lPY5XuTyU=
X-Received: by 2002:a17:90b:2f8f:b0:35f:bb33:d727 with SMTP id 98e67ed59e1d1-3649202dabcmr7725708a91.20.1777476300770;
        Wed, 29 Apr 2026 08:25:00 -0700 (PDT)
X-Received: by 2002:a17:90b:2f8f:b0:35f:bb33:d727 with SMTP id 98e67ed59e1d1-3649202dabcmr7725659a91.20.1777476300090;
        Wed, 29 Apr 2026 08:25:00 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364bd588ad5sm66732a91.3.2026.04.29.08.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:24:58 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 20:54:25 +0530
Subject: [PATCH v2 4/4] arm64: dts: qcom: add IPQ9650 SoC and rdp488 board
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-ipq9650_boot_to_shell-v2-4-9b0dc3d1f3a8@oss.qualcomm.com>
References: <20260429-ipq9650_boot_to_shell-v2-0-9b0dc3d1f3a8@oss.qualcomm.com>
In-Reply-To: <20260429-ipq9650_boot_to_shell-v2-0-9b0dc3d1f3a8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777476269; l=11163;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=J5yfDWjRPOg45bYa1539C2lhtkSrcvJpcd7225W2npA=;
 b=TuXyG5L6vZeoKTurozGdwlw5JuDEtvlWL0AV2sMrX482L87dixn2TAUTsiR5Xktz4bW3pkdht
 FaOobSe/EThDzv+9k3f0emVQM/qKpWCjJft0ZPbUG7lp2u9ZnZKtSio
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: GpCDXHjfbKXWCAYPL1Kk7jHojY0Q_npr
X-Authority-Analysis: v=2.4 cv=RI6D2Yi+ c=1 sm=1 tr=0 ts=69f222cd cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=fBkTXTPqfNaV2XDYC8MA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: GpCDXHjfbKXWCAYPL1Kk7jHojY0Q_npr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE1NSBTYWx0ZWRfX8Px81vPGi+Lx
 8uuCx96xUy17ww63uqfWt7EU8fTW88ZZPA/kJH1JopMa47eppUU11D6K8mSiHK2wRKGfXwqGhIM
 XdvH+KywH9+XLD/3jnl9np+7q3BSZnvFvLzy952/gUkwF+ldvXuUX9AuO1UcT/uS2UeUK4ZNF//
 +DaCWRc9aYYvVH6BGzTEu4RtC/Q4lTVojQ0fEzwOJn+D68Yd01dTwaT01ez2UOZPKgm4e00L+Kn
 SmfGiKT+LnquH5Jr7nCCLd5so3/s2XeO+/5ixsAKe/vJzLOFI3wvLJHDUlLfbKuZn7+8ZEBrKPw
 lOogV04At1yeIqI3n8quFvp8aci+D9+yL2qJ0Oisnoa3sM5nfzDC69+RlOmH/LfRMxPD7dukOP6
 KaQfkDT3sUplw1ukkKR5zBqGlozFTqgYO9ZWFAH+dFWEbPPYxTAJoiAXb0WUtIzpOlMnUJPWu4U
 D8Le4e78VMEHkszujDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290155
X-Rspamd-Queue-Id: 8F5E1496CD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105246-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add initial device tree support for the Qualcomm IPQ9650 SoC and
rdp488 board.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile           |   1 +
 arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts |  79 ++++++
 arch/arm64/boot/dts/qcom/ipq9650.dtsi       | 376 ++++++++++++++++++++++++++++
 3 files changed, 456 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4ba8e7306419..dba16311ca2b 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -39,6 +39,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp433.dtb ipq9574-rdp433-emmc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts b/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts
new file mode 100644
index 000000000000..6871f3dc4eaf
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "ipq9650.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ9650 RDP488";
+	compatible = "qcom,ipq9650-rdp488", "qcom,ipq9650";
+
+	aliases {
+		serial0 = &uart1;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+};
+
+&sdhc {
+	max-frequency = <192000000>;
+	bus-width = <4>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	pinctrl-0 = <&sdhc_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32000>;
+};
+
+&tlmm {
+	qup_uart1_default_state: qup-uart1-default-state {
+		pins = "gpio43", "gpio44";
+		function = "qup_se6";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
+
+	sdhc_default_state: sdhc-default-state {
+		clk-pins {
+			pins = "gpio5";
+			function = "sdc_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		cmd-pins {
+			pins = "gpio4";
+			function = "sdc_cmd";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		data-pins {
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+			function = "sdc_data";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+	};
+};
+
+&uart1 {
+	pinctrl-0 = <&qup_uart1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&xo_board {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq9650.dtsi b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
new file mode 100644
index 000000000000..4a383b53c3b5
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
@@ -0,0 +1,376 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,ipq9650-gcc.h>
+#include <dt-bindings/reset/qcom,ipq9650-gcc.h>
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	interrupt-parent = <&intc>;
+
+	clocks {
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
+
+		xo_board: xo-board-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0>;
+			enable-method = "psci";
+			next-level-cache = <&l2_0>;
+
+			l2_0: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+
+				l3_0: l3-cache {
+					compatible = "cache";
+					cache-level = <3>;
+					cache-unified;
+				};
+			};
+		};
+
+		cpu1: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x100>;
+			enable-method = "psci";
+			next-level-cache = <&l2_100>;
+
+			l2_100: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu2: cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x200>;
+			enable-method = "psci";
+
+			l2_200: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu3: cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x300>;
+			enable-method = "psci";
+
+			l2_300: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu4: cpu@400 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x400>;
+			enable-method = "psci";
+			next-level-cache = <&l2_400>;
+
+			l2_400: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+
+				core2 {
+					cpu = <&cpu2>;
+				};
+
+				core3 {
+					cpu = <&cpu3>;
+				};
+
+				core4 {
+					cpu = <&cpu4>;
+				};
+			};
+		};
+	};
+
+	firmware {
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+
+		scm {
+			compatible = "qcom,scm-ipq9650", "qcom,scm";
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the size */
+		reg = <0x0 0x80000000 0x0 0x0>;
+	};
+
+	pmu-a55 {
+		compatible = "arm,cortex-a55-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &ppi_cluster0>;
+	};
+
+	pmu-a78 {
+		compatible = "arm,cortex-a78-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &ppi_cluster1>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		bootloader@8a100000 {
+			reg = <0x0 0x8a100000 0x0 0x400000>;
+			no-map;
+		};
+
+		smem@8a500000 {
+			compatible = "qcom,smem";
+			reg = <0x0 0x8a500000 0x0 0x40000>;
+			no-map;
+
+			hwlocks = <&tcsr_mutex 3>;
+		};
+
+		tfa@8a600000 {
+			reg = <0x0 0x8a600000 0x0 0x80000>;
+			no-map;
+		};
+
+		optee@8a680000 {
+			reg = <0x0 0x8a680000 0x0 0x280000>;
+			no-map;
+		};
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		dma-ranges = <0 0 0 0 0x10 0>;
+		ranges = <0 0 0 0 0x10 0>;
+
+		tlmm: pinctrl@1000000 {
+			compatible = "qcom,ipq9650-tlmm";
+			reg = <0x0 0x01000000 0x0 0x300000>;
+			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH 0>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&tlmm 0 0 54>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gcc: clock-controller@1800000 {
+			compatible = "qcom,ipq9650-gcc";
+			reg = <0x0 0x01800000 0x0 0x40000>;
+			clocks = <&xo_board>,
+				 <&sleep_clk>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		tcsr_mutex: hwlock@1917000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0x0 0x01917000 0x0 0x57000>;
+			#hwlock-cells = <1>;
+		};
+
+		qupv3: geniqup@1ac0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0x01ac0000 0x0 0x2000>;
+			clocks = <&gcc GCC_QUPV3_AHB_MST_CLK>,
+				 <&gcc GCC_QUPV3_AHB_SLV_CLK>;
+			clock-names = "m-ahb", "s-ahb";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			uart1: serial@1a98000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0x0 0x01a98000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE6_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH 0>;
+				status = "disabled";
+			};
+		};
+
+		sdhc: mmc@7804000 {
+			compatible = "qcom,ipq9650-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0x0 0x07804000 0x0 0x1000>,
+			      <0x0 0x07805000 0x0 0x1000>;
+			reg-names = "hc",
+				    "cqhci";
+
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "hc_irq",
+					  "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&gcc GCC_SDCC1_APPS_CLK>,
+				 <&xo_board>;
+			clock-names = "iface",
+				      "core",
+				      "xo";
+			non-removable;
+
+			status = "disabled";
+		};
+
+		intc: interrupt-controller@f200000 {
+			compatible = "arm,gic-v3";
+			reg = <0x0 0x0f200000 0x0 0x10000>,
+			      <0x0 0x0f240000 0x0 0xa0000>;
+			#interrupt-cells = <0x4>;
+			interrupt-controller;
+			#redistributor-regions = <1>;
+			redistributor-stride = <0x0 0x20000>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
+			mbi-ranges = <800 160>;
+			msi-controller;
+
+			ppi-partitions {
+				ppi_cluster0: interrupt-partition-0 {
+					affinity = <&cpu0 &cpu1 &cpu2 &cpu3>;
+				};
+
+				ppi_cluster1: interrupt-partition-1 {
+					affinity = <&cpu4>;
+				};
+			};
+		};
+
+		timer@f420000 {
+			compatible = "arm,armv7-timer-mem";
+			reg = <0x0 0x0f420000 0x0 0x1000>;
+			ranges = <0 0 0 0x10000000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			frame@f421000 {
+				reg = <0x0f421000 0x1000>,
+				      <0x0f422000 0x1000>;
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH 0>;
+				frame-number = <0>;
+			};
+
+			frame@f423000 {
+				reg = <0x0f423000 0x1000>;
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
+				frame-number = <1>;
+
+				status = "disabled";
+			};
+
+			frame@f425000 {
+				reg = <0x0f425000 0x1000>,
+				      <0x0f426000 0x1000>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
+				frame-number = <2>;
+
+				status = "disabled";
+			};
+
+			frame@f427000 {
+				reg = <0x0f427000 0x1000>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH 0>;
+				frame-number = <3>;
+
+				status = "disabled";
+			};
+
+			frame@f429000 {
+				reg = <0x0f429000 0x1000>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH 0>;
+				frame-number = <4>;
+
+				status = "disabled";
+			};
+
+			frame@f42b000 {
+				reg = <0x0f42b000 0x1000>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH 0>;
+				frame-number = <5>;
+
+				status = "disabled";
+			};
+
+			frame@f42d000 {
+				reg = <0x0f42d000 0x1000>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH 0>;
+				frame-number = <6>;
+
+				status = "disabled";
+			};
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW 0>;
+	};
+};

-- 
2.34.1


