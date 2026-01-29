Return-Path: <linux-arm-msm+bounces-91117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MP3DNkH+emmHAQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 07:29:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3F7AC38F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 07:29:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B0F33035253
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 06:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A7BE273D8D;
	Thu, 29 Jan 2026 06:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KsIqRtez";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F9Da+38B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D4E378D9D
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 06:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769668125; cv=none; b=OsYRUlzPtVDobTpx4EdLKkOwQ6UO0BrI5OPrD/n6i9Y37Ht5qV/AHsx5gaEodHq7o/C3N9CfbFwhof/QKdzZ+LXN0X+todf5phASupsVAIjYXMinO1t4dKj03DdweMRO4JAUQeEyFMQGhl+C60pTfUqaN1bZHtJdRSvh3YahaVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769668125; c=relaxed/simple;
	bh=FB0pcXKrhC3z9dMN2P77FM4kA/5QFgLxVYcPCVyi2Lc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZBZcAcSxkPWmNUdA+bQefNywiEn/NNh8ljh79V+BMYEoNuhU7Uq0oGZWh7kCRnI068Aiy0+X3+U+4BQewGN+F6NBCZxMvfaj0DHpzjWwpBrsKh6wmWmisSxnUpaZTjQpM/U1PBdH+UKPgmNDT/tzgzZYEKOi+q9bpidyW5JR8pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KsIqRtez; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F9Da+38B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T2ou392583505
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 06:28:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3NMW0FR1qhO
	cZDSBUwAeLpAcyB4W78vZQ8nf0I8VEso=; b=KsIqRtezEvbFDfjvIMKFCUTp+1V
	nVMCLxkKEKO0jh6LmXh/duKugT9ZBnD+jO9J8rZ1dojtr9b7+anlLyxocc4IYxNB
	VAhPC7g6PvKm+C1HPNTYoXhEhFSTjKW1eq4vygNlUYoyppA7tsxlU8UKhkMPL/6N
	3fmGLzbXCXaOLnavJZg6JfApo+2+vtVzPbiby6Ju1i8Fr73zpP9+4zxjJQHf9VKX
	c+eLQRVUOyV1LT5ls0LAJYmfI7UjHnA7YbmjIwiTLzaxX190B6FKJW1pa32ItuuF
	GqB3jLx/GOn+msGMlBb78UXhA3X4jCxdmXeSO3TUJkhuoe9IHt6dGuTYxzA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bype8t8cr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 06:28:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-352e1a8603bso625979a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 22:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769668122; x=1770272922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3NMW0FR1qhOcZDSBUwAeLpAcyB4W78vZQ8nf0I8VEso=;
        b=F9Da+38Bezm5YmQsPdND8CcosP3i0U9cSTFCJWO2Y/Jrbig8hk1s7gIpTezL3p5UHR
         gx7S7xGalmMkkdlI6uDVS5X5zM0pOnXM1ZPoIgVl8/0Iuo+9FfFbK58abviyP+S9wCMY
         YUPmNHI7crQ/+PhxK4xWPlOy3AC4jFDeU85PjxZHiGCWMP9gIa81xuRZWSmwgX9oDLjt
         vGbjVEF/BLDbQbBbXGlOlc2H9vU1wLvn1a6LGeQNM1RVlFZldQJs8wE6u8h4aMDT3+rK
         oUuHOTTpGvnIUSxc0KDrj/KBv3cq6zhUqIi0asXSh6nKaziCzwex4bP6VDKTddsfIYBa
         GFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769668122; x=1770272922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3NMW0FR1qhOcZDSBUwAeLpAcyB4W78vZQ8nf0I8VEso=;
        b=QlX+YiHP/UepYFaUjNfzQd8vikaK+IWQI93nZJR0dnSqCiiS+wRvXR/NzaR8UQOkXz
         cFK1OPUk6NF/lO/AUARPbpmfFAnh8XZxDqjOJetHrR4Zkfzh9k55yrUMawR60Q6Ek0C5
         4GWZXBzjS8szAEubcR18s+i8EIIYnexzoYv/h0OcwMYS+AFoGwzfB//kLmwHICayMeIe
         nnVtFocq9evIKZUgkkBuvV0sG44J+ESde0QG9JWdngKlBUehQlHVMt4XfbShtAAi/2an
         A3UBCO8qlDr6NVurBlitIB7QTfiMP+tOUwoWutRq8w49S0aJhgn9EBs4P83Q8AHe7pNh
         41cw==
X-Forwarded-Encrypted: i=1; AJvYcCV/L7eglXas6N6XcTYAOF06u/g2GTLbe5dINRaMuMftpMcnDgQ7+jf931g11l6sYfFW4iJmFTtaJBmUEdme@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqq3NdrbMmg6cpjXgFtNyvpOOMbpA3fIumjbFYfiD5lFXQHK1R
	unfcoUCp/Gf3EwbWQte/mlvuAfbBDQnJuUwC5dSLSLCAlXQda+rOtH4otSEWKzZRQn56M1FntCF
	4zGIFtkr6wzKOOlAiZyKBo5lXybS1/axLRmZDi9IItxXQMmYdT9GM2+YiMYE9kmfhozdGfnueRu
	F/
X-Gm-Gg: AZuq6aKw212Rkt5dpeYtD3gZoLXz9mmT1Oqe7c/tKcmDysU38nXJ1Cn1xXqoyMrkRBd
	zAOHxGRhadT8+7NodZm0yGZGHNwawkO6IAbtWTeIvD0GBbwFVdr8pVcn8Qi9bBoVesXxV16N5Z5
	IJFberRt3z/hFoyDnJ/VSgqS9YNfzkEe0BJ5YwZyBtD76cUXrpGDdl8kBDuL+KRfyUL/4mz/Mb5
	APKA8h0EGEWupCUJEBHNgX/8HSnxb5o/FtUZaUux2pHxjq//0Mhg4SHcuz95StZj+zrsbbTlgwT
	IWUuXvTxW7bRX3ZtrMXqVCLSBlUEEd1qDWj4zwrBpY/+zmR+Klrz1KjnXcElM8jH5D4PNiB7Gr/
	Ttrd9g7Ee27Wn8Yg2ltkndba+hd1A35WNqkoI0tsge/QtuyHumVEbmFVrSM8XF7Dp9FQCgc6OsJ
	YH6zo+WOGDvKKZHV1Qq7vGon/xiyCKMSobP71MXNw=
X-Received: by 2002:a17:90a:d2cf:b0:32e:5d87:8abc with SMTP id 98e67ed59e1d1-353feda6ee8mr6739328a91.36.1769668121561;
        Wed, 28 Jan 2026 22:28:41 -0800 (PST)
X-Received: by 2002:a17:90a:d2cf:b0:32e:5d87:8abc with SMTP id 98e67ed59e1d1-353feda6ee8mr6739304a91.36.1769668121114;
        Wed, 28 Jan 2026 22:28:41 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f612917csm7215943a91.8.2026.01.28.22.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 22:28:40 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc: sumit.garg@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 2/4] arm64: dts: qcom: ipq9574-rdp433: Reorganize DTS to introduce eMMC support
Date: Thu, 29 Jan 2026 11:58:23 +0530
Message-Id: <20260129062825.666457-3-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260129062825.666457-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260129062825.666457-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: J4D3R_8AkdRHipklsIRoFU7NNxopEdef
X-Authority-Analysis: v=2.4 cv=C5fkCAP+ c=1 sm=1 tr=0 ts=697afe1a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=__n9Gvk54GoArngz-awA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAzOCBTYWx0ZWRfX8MmZ0SDc8VLK
 hmQqiXoNMdGm++leY2iDvLZeXNHHxomlZVzqLFTU8mOmwOuXZnm+ja+GW4/aLjKeumObj2J9FSN
 LmJDdK9d2v9AgkiMi8yVX66/l9gxcRABRqsVvCjU2YPaqsiWbh7RsRF1hMMk5e92A7ZkVj4qEpW
 ApQpuYG7g8bZJRXTkKF+iBhPBKSslYr2fA36Z7RMsy9ls9i31fhkMMBnvj2wzdsX3CmplGzEFIO
 jjbi0QLEG54GH8yMkKnu5XakJQPgf84weUhehDHKdu5d+xlzFunyxIRENK2D56IikSBMAMgXaKf
 r0fNc4MnJOmrFv+ujvr80tbDQi72EEvp9QZDssbLWRkumZwOqFpnvwnot0hglu+EYLCYn1O2s1f
 P7u0UTQ7p0xjJMWrG5eN9iu60eknygreTCiYMX5ARW+G+eXbhRKkrQJVnwZRXWr843a1H+qiqAk
 3FH3q3x0PJYP+q0bseA==
X-Proofpoint-GUID: J4D3R_8AkdRHipklsIRoFU7NNxopEdef
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290038
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91117-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5B3F7AC38F
X-Rspamd-Action: no action

The RDP433 has NAND and eMMC variants. Presently, only NAND variant is
supported. To enable support for eMMC variant, move the common nodes from
ipq9574-rdp433.dts to ipq9574-rdp433-common.dtsi. ipq9574-rdp433-common.dtsi
will be included in rdp433 NAND and eMMC DT files.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v3: Since qpic_nand is disabled in ipq9574-rdp-common.dtsi, enable it here.
    Add 'Reviewed-by: Konrad Dybcio'

v2: Move common nodes into ipq9574-rdp433-common.dtsi
    Trim down ipq9574-rdp433.dts and #include rdp433-common.dtsi
---
 .../boot/dts/qcom/ipq9574-rdp433-common.dtsi  | 121 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts   | 113 +---------------
 2 files changed, 123 insertions(+), 111 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-rdp433-common.dtsi

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp433-common.dtsi
new file mode 100644
index 000000000000..49c1b83bed10
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433-common.dtsi
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * IPQ9574 RDP433 board device tree source
+ *
+ * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+&pcie1_phy {
+	status = "okay";
+};
+
+&pcie1 {
+	pinctrl-0 = <&pcie1_default>;
+	pinctrl-names = "default";
+
+	perst-gpios = <&tlmm 26 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 27 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&pcie2_phy {
+	status = "okay";
+};
+
+&pcie2 {
+	pinctrl-0 = <&pcie2_default>;
+	pinctrl-names = "default";
+
+	perst-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 30 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&pcie3_phy {
+	status = "okay";
+};
+
+&pcie3 {
+	pinctrl-0 = <&pcie3_default>;
+	pinctrl-names = "default";
+
+	perst-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&tlmm {
+
+	pcie1_default: pcie1-default-state {
+		clkreq-n-pins {
+			pins = "gpio25";
+			function = "pcie1_clk";
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio26";
+			function = "gpio";
+			drive-strength = <8>;
+			bias-pull-down;
+			output-low;
+		};
+
+		wake-n-pins {
+			pins = "gpio27";
+			function = "pcie1_wake";
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+	};
+
+	pcie2_default: pcie2-default-state {
+		clkreq-n-pins {
+			pins = "gpio28";
+			function = "pcie2_clk";
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio29";
+			function = "gpio";
+			drive-strength = <8>;
+			bias-pull-down;
+			output-low;
+		};
+
+		wake-n-pins {
+			pins = "gpio30";
+			function = "pcie2_wake";
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+	};
+
+	pcie3_default: pcie3-default-state {
+		clkreq-n-pins {
+			pins = "gpio31";
+			function = "pcie3_clk";
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio32";
+			function = "gpio";
+			drive-strength = <8>;
+			bias-pull-up;
+			output-low;
+		};
+
+		wake-n-pins {
+			pins = "gpio33";
+			function = "pcie3_wake";
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
index 5a546a14998b..e3c446eedfb3 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
+++ b/ arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
@@ -8,124 +8,15 @@
 
 /dts-v1/;
 
-#include <dt-bindings/gpio/gpio.h>
 #include "ipq9574-rdp-common.dtsi"
+#include "ipq9574-rdp433-common.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. IPQ9574/AP-AL02-C7";
 	compatible = "qcom,ipq9574-ap-al02-c7", "qcom,ipq9574";
 };
 
-&pcie1_phy {
+&qpic_nand {
 	status = "okay";
 };
 
-&pcie1 {
-	pinctrl-0 = <&pcie1_default>;
-	pinctrl-names = "default";
-
-	perst-gpios = <&tlmm 26 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 27 GPIO_ACTIVE_LOW>;
-	status = "okay";
-};
-
-&pcie2_phy {
-	status = "okay";
-};
-
-&pcie2 {
-	pinctrl-0 = <&pcie2_default>;
-	pinctrl-names = "default";
-
-	perst-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 30 GPIO_ACTIVE_LOW>;
-	status = "okay";
-};
-
-&pcie3_phy {
-	status = "okay";
-};
-
-&pcie3 {
-	pinctrl-0 = <&pcie3_default>;
-	pinctrl-names = "default";
-
-	perst-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
-	status = "okay";
-};
-
-&tlmm {
-
-	pcie1_default: pcie1-default-state {
-		clkreq-n-pins {
-			pins = "gpio25";
-			function = "pcie1_clk";
-			drive-strength = <6>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio26";
-			function = "gpio";
-			drive-strength = <8>;
-			bias-pull-down;
-			output-low;
-		};
-
-		wake-n-pins {
-			pins = "gpio27";
-			function = "pcie1_wake";
-			drive-strength = <6>;
-			bias-pull-up;
-		};
-	};
-
-	pcie2_default: pcie2-default-state {
-		clkreq-n-pins {
-			pins = "gpio28";
-			function = "pcie2_clk";
-			drive-strength = <6>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio29";
-			function = "gpio";
-			drive-strength = <8>;
-			bias-pull-down;
-			output-low;
-		};
-
-		wake-n-pins {
-			pins = "gpio30";
-			function = "pcie2_wake";
-			drive-strength = <6>;
-			bias-pull-up;
-		};
-	};
-
-	pcie3_default: pcie3-default-state {
-		clkreq-n-pins {
-			pins = "gpio31";
-			function = "pcie3_clk";
-			drive-strength = <6>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio32";
-			function = "gpio";
-			drive-strength = <8>;
-			bias-pull-up;
-			output-low;
-		};
-
-		wake-n-pins {
-			pins = "gpio33";
-			function = "pcie3_wake";
-			drive-strength = <6>;
-			bias-pull-up;
-		};
-	};
-};
-- 
2.34.1


