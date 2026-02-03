Return-Path: <linux-arm-msm+bounces-91576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CH/VOXZ6gWmOGgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 05:32:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3C1D46B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 05:32:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3924A3074F0D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 04:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13AED1D5ABA;
	Tue,  3 Feb 2026 04:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cn+IQrts";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZyBozyqG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944E113B5AE
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 04:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770093105; cv=none; b=dm50tIak205pnHuyPerig30oIYnloRxabKEzQACb26YTnd8GrZiJaCbpZYmQjBnALah61D4zReXglyCFvBwCEX+cOkuzCI6m51wYwVX86rxVHVSQNVlo/xpiTlg9wxR2cj+RKtNyifHX+Zk8wYa0Ywr698I+5DcYRGaLEpGDSkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770093105; c=relaxed/simple;
	bh=gfvMt7NZHc2g1A0esyJYlBNWDJF7SPNzJoPpYkTyNNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q0JQnoLvdIWFAfLwLlXmAfKKdc8MGZiX7zAZKpZ1dyqiptbAITgcMqbzdrijLc2TYJo+pJT/nQRok3K8DjmR4D7hjmaJZq89HPWXpv9uDmjq+iT2+AbSnZdn09qdqVduyO8rJMNDaj/wGJBTxShXq0BltoPCUQcAyGF3mjSX5oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cn+IQrts; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZyBozyqG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6133H6lw930798
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 04:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lKu/JJZ4BgovY51L2puyItNkDkQw4dZ8GvhPS74zbi8=; b=Cn+IQrtsc3jYfuFJ
	vw64MyWo2CgkIABM+HRvqF3DdAuLiK6bib8QVoake8pMc6fXYbxY1bdhxER+cwAK
	fTpjgru1RVyB8exDzPw5WnBU3HXijtAGw2vShA5EWfNrpAUL5e/BJuzTo/UNmUQn
	c2YTVDhwwhYESMDj695142g74mFI/W/66aOFDUbc0sx/4iAJtfZFvUqau4y5T2Ay
	0fmb8Snp0k16ooPCRMeBB9QzQqND9PmsduPzu90gCQIJNoLmD2rU0Yybtk7htwLA
	BXiza+5ybHDFIDPgPmsQzwk//EszFxXC620DBGL7kaG6qtc0KMCz8iTVEj/hJcl2
	oDi5vg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c38yu05uy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 04:31:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a08cbeb87eso57458325ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 20:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770093102; x=1770697902; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lKu/JJZ4BgovY51L2puyItNkDkQw4dZ8GvhPS74zbi8=;
        b=ZyBozyqG5PPEg83KEBEB4Qako/MtIwRqTi5O2DjGZr59e0U0ZFpdgu/sg+eQSvvvRG
         W11iPlArSMBicdcQxN4uXnDGHktQnp3EZAU+b0/X/OEw/d4V7L2QATxRiPNmbdYmmbk/
         1+4r97ZP2b8lnhq1JGyHn+7MG61wN8Vjweu9EoGoCln2KHkDiqC3rdhOw4x0n4Cm24z9
         NwFbxPfoANUDMqYHFms3e23MvV29xC1KnqZEYhBmQ95gWG3QfCC2kSCWQajU8uJOk2Ip
         n3BJNxSVk6baySSE/P7hLpDDHsbcR3NPuZVnA341I1CRD+gIR2DZov3Ox9FaFENIb25h
         WNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770093102; x=1770697902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lKu/JJZ4BgovY51L2puyItNkDkQw4dZ8GvhPS74zbi8=;
        b=bubxud2pM/AVxxQoaLsCkcCBPb6pnGzyz4rySWi97n3PFMmBe374QihmVmymyFhgK1
         Tv8AC5B7PHUb3uXYhLwXevCVoP/b8bT+2SFGF7mvjG0Vfs/uAYpM+OONufzAyNOBMSjp
         ViCfpcyKfMUORFJyf7uoAGCLNPf8wBhq1PEu/tI0oZdhTtsJ++uOw+3pE9SvKH/fBSbG
         o4/f6CrKAcNj4eYjpTur8ACs3r7qM1OVukkR8MfqjyzwcmFkU5a8f7bGx6yemrOJrvDs
         KGFXtSVeNwm7Pkf16KEJfzkqFBZeZCsbzTegvqPnwLZd9OFkGKu63VtHNBXKB4b9+Oqs
         Q9rA==
X-Gm-Message-State: AOJu0YxhxuWdEHInz3EIgl+Y2yGoZxkAo+zNQA5FqXmtDBLC9u9qItMj
	emQpf0echsHQPfrseVbnQad4S+7MpJIwCVsjB8R8VZqFW4lnmTIMWIYQHe6dvTvxf4bKgbzun5j
	ohqxMjwQm2bruGWrv4qwalVaUNHxaZb37Jo7b1U2tRhhgNVRzF9s+l9ZCwoTYwJicTnnfiMy+CI
	2u
X-Gm-Gg: AZuq6aK82PCRneTj1q0Qznk62SbxrJSPSADSo5DamvX8Kl2ypnQLO7TMGcvRkAp6lGU
	oHu6+EQwLqklnIYoevNpmtGM4P6jaBWWwpYB47xaJGbDXN+kYp4Np3JJG+JuBQxlnkFuhTy9AEZ
	UuL03kcjbjI4xUjBecmKsrmBm60BxFJwOxZkbAMzf2cCps/a8KLG6a63yJ9Pp/wQnQNQ1K93Gn4
	8yE78cACdTK3t3sGDkfZv4bJ3TOqUZNWbHG23wTqVZZIO5uBjbIKbjZJSQYdLxelBZXfpsJEBka
	Bn2GvTV0BQLapnNGx3tr7pKn7Q9RMKAiYDeg85MziAaU8bXjUTeqJQBgpLkQ7ely0+sHXx6BNSp
	5UR5NA8o9pZv7JrHUkC+kxSLhG71vypd1eLak5G8QAHcScw==
X-Received: by 2002:a17:903:38c8:b0:2a7:b039:4b52 with SMTP id d9443c01a7336-2a8d9591c81mr129069245ad.1.1770093101895;
        Mon, 02 Feb 2026 20:31:41 -0800 (PST)
X-Received: by 2002:a17:903:38c8:b0:2a7:b039:4b52 with SMTP id d9443c01a7336-2a8d9591c81mr129069045ad.1.1770093101325;
        Mon, 02 Feb 2026 20:31:41 -0800 (PST)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4148d0sm162487605ad.27.2026.02.02.20.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 20:31:41 -0800 (PST)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Date: Tue, 03 Feb 2026 10:01:29 +0530
Subject: [PATCH v2 2/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add second TC9563 PCIe switch node
 for PCIe1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-industrial-mezzanine-pcie-v2-2-8579ed6bf931@oss.qualcomm.com>
References: <20260203-industrial-mezzanine-pcie-v2-0-8579ed6bf931@oss.qualcomm.com>
In-Reply-To: <20260203-industrial-mezzanine-pcie-v2-0-8579ed6bf931@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770093091; l=5191;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=gfvMt7NZHc2g1A0esyJYlBNWDJF7SPNzJoPpYkTyNNQ=;
 b=Dr15TWLJCayAvWplpQJZxyQrMULW2egbn58JknQ/kwzjU2niHFQR+TscCDNwh3K+3KQt7LmLF
 916MneTeaQDCddPKkkTft8142WuBdXB+riw71JI3Pn/AC2XH0MJDs1T
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDAzNCBTYWx0ZWRfX+koUYPoHUHkA
 gdsI8buxYdtsGS/fhZn2Kqi44m02s/qaeGGuzMSq/Og7uPDF2OkhRd9HEre69WJFlW8A4FEFUop
 a+nFLRTi3mJ64tq374EQ/ZgvRrsahY9JThqQliE0+z32wipj7m2DX4mlBe1EoGHRCI3SnovIBJ4
 v4nFH65BJwEL5qITQgLe+WkNXUlGH6nN5EamDVDn7Ai9YwvXJQ5eH/IbBVJ7AmSqlx1KDl14ziv
 68NccN4UAvNmW3ghBStwrnhY7eGyK9Dxzw/qnenRHhnz1Vp/9/IRFYiLmOp7clWEdEW6IvlpSlW
 J+ec/8Q712eFxDqhVw3wS1vO6BWB9txQKkeJM206VkdRTAYNpdwDJDTLZbeOpjKQHdqYOrjFUQF
 dZ2dARFQWvuex2Al22ZfQnT9acD+PBi2pQMj+7zCjM/4nJpnNxvvrjRZRSeLWvdvL1UFFWnjquR
 c4fXW3E3tH2IjON3d2g==
X-Proofpoint-ORIG-GUID: iBsWBrt_JtkShmF5oykhSdh8-Ppa-Hy7
X-Proofpoint-GUID: iBsWBrt_JtkShmF5oykhSdh8-Ppa-Hy7
X-Authority-Analysis: v=2.4 cv=UKTQ3Sfy c=1 sm=1 tr=0 ts=69817a2e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=RSE3UA2U0-qTjrSbjqYA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030034
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-91576-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,0.0.0.2:email,0.0.0.1:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.3:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4E3C1D46B0
X-Rspamd-Action: no action

Add a node for the second TC9563 PCIe switch on PCIe1, which is connected
in cascade to the first TC9563 switch via the former's downstream port.

Two embedded Ethernet devices are present on one of the downstream
ports of this second switch as well. All the ports present in the
node represent the downstream ports and embedded endpoints.

The second TC9563 is powered up via the same LDO regulators as the first
one, and these can be controlled via two GPIOs, which are already present
as fixed regulators. This TC9563 can also be configured through I2C.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
 .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso | 96 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       | 12 +--
 2 files changed, 102 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
index 89bbcab0908d..1744c9c8bd50 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -146,6 +146,91 @@ pcie0_switch0_eth1: pci@0,1 {
 	};
 };
 
+&pcie1 {
+	iommu-map = <0x0 &apps_smmu 0x1c80 0x1>,
+		<0x100 &apps_smmu 0x1c81 0x1>,
+		<0x208 &apps_smmu 0x1c84 0x1>,
+		<0x210 &apps_smmu 0x1c85 0x1>,
+		<0x218 &apps_smmu 0x1c86 0x1>,
+		<0x300 &apps_smmu 0x1c87 0x1>,
+		<0x408 &apps_smmu 0x1c90 0x1>,
+		<0x410 &apps_smmu 0x1c91 0x1>,
+		<0x418 &apps_smmu 0x1c92 0x1>,
+		<0x500 &apps_smmu 0x1c93 0x1>,
+		<0x600 &apps_smmu 0x1c94 0x1>,
+		<0x700 &apps_smmu 0x1c95 0x1>,
+		<0x701 &apps_smmu 0x1c96 0x1>,
+		<0x800 &apps_smmu 0x1c97 0x1>,
+		<0x900 &apps_smmu 0x1c98 0x1>,
+		<0x901 &apps_smmu 0x1c99 0x1>;
+};
+
+&pcie1_switch0_dsp1 {
+	pcie1_switch1_usp: pcie@0,0 {
+		compatible = "pci1179,0623";
+		reg = <0x30000 0x0 0x0 0x0 0x0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+
+		device_type = "pci";
+		ranges;
+
+		vddc-supply = <&vdd_ntn_0p9>;
+		vdd18-supply = <&vdd_ntn_1p8>;
+		vdd09-supply = <&vdd_ntn_0p9>;
+		vddio1-supply = <&vdd_ntn_1p8>;
+		vddio2-supply = <&vdd_ntn_1p8>;
+		vddio18-supply = <&vdd_ntn_1p8>;
+
+		i2c-parent = <&i2c1 0x33>;
+
+		resx-gpios = <&tlmm 124 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&pcie1_tc9563_resx_n>;
+		pinctrl-names = "default";
+
+		pcie1_switch1_dsp1: pcie@1,0 {
+			reg = <0x40800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+		};
+
+		pcie1_switch1_dsp2: pcie@2,0 {
+			reg = <0x41000 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+		};
+
+	        pcie1_switch1_dsp3: pcie@3,0 {
+			reg = <0x41800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			ranges;
+
+			pcie1_switch1_eth0: pci@0,0 {
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+
+			pcie1_switch1_eth1: pci@0,1 {
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+		};
+	};
+};
+
 &tlmm {
 	pcie0_tc9563_resx_n: pcie0-tc9563-resx-state {
 		pins = "gpio78";
@@ -156,4 +241,15 @@ pcie0_tc9563_resx_n: pcie0-tc9563-resx-state {
 		output-enable;
 		power-source = <0>;
 	};
+
+	pcie1_tc9563_resx_n: pcie1-tc9563-resx-state {
+		pins = "gpio124";
+		function = "gpio";
+
+		bias-disable;
+		input-disable;
+		output-enable;
+		power-source = <0>;
+	};
+
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index e3d2f01881ae..ffe4521eb289 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -828,7 +828,7 @@ &pcie1_phy {
 };
 
 &pcie1_port0 {
-	pcie@0,0 {
+	pcie1_switch0_usp: pcie@0,0 {
 		compatible = "pci1179,0623";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
 		#address-cells = <3>;
@@ -852,7 +852,7 @@ pcie@0,0 {
 		pinctrl-0 = <&tc9563_resx_n>;
 		pinctrl-names = "default";
 
-		pcie@1,0 {
+		pcie1_switch0_dsp1: pcie@1,0 {
 			reg = <0x20800 0x0 0x0 0x0 0x0>;
 			#address-cells = <3>;
 			#size-cells = <2>;
@@ -862,7 +862,7 @@ pcie@1,0 {
 			bus-range = <0x3 0xff>;
 		};
 
-		pcie@2,0 {
+		pcie1_switch0_dsp2: pcie@2,0 {
 			reg = <0x21000 0x0 0x0 0x0 0x0>;
 			#address-cells = <3>;
 			#size-cells = <2>;
@@ -872,7 +872,7 @@ pcie@2,0 {
 			bus-range = <0x4 0xff>;
 		};
 
-		pcie@3,0 {
+		pcie1_switch0_dsp3: pcie@3,0 {
 			reg = <0x21800 0x0 0x0 0x0 0x0>;
 			#address-cells = <3>;
 			#size-cells = <2>;
@@ -880,7 +880,7 @@ pcie@3,0 {
 			ranges;
 			bus-range = <0x5 0xff>;
 
-			pci@0,0 {
+			pcie1_switch0_eth0: pci@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
@@ -888,7 +888,7 @@ pci@0,0 {
 				ranges;
 			};
 
-			pci@0,1 {
+			pcie1_switch0_eth1: pci@0,1 {
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;

-- 
2.25.1


