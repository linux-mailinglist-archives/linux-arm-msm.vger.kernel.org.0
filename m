Return-Path: <linux-arm-msm+bounces-99885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDhaK+Hiw2lvugQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 14:28:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4E0325BDC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 14:28:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 21C25316E745
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 13:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495DD347507;
	Wed, 25 Mar 2026 13:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nP4LXN+x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RJGeply1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151293939CD
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 13:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774443658; cv=none; b=skKvgvxJtCBdcVqELXODTbCOjnhIVxA+V61L9jR8k4TF1ZGP7Fq04c5lLJytZKKE+vE0WzR9vQ+Hy/o/3/1g7syFrpBbtYuRksNPsGbTmUPg0Bhk50W3dUG/ZgXyL+V6M3ACmJtLBfYbn9BlCKM52LK7+L0Iu7q8X0IgjRIgDRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774443658; c=relaxed/simple;
	bh=iECa52X1WMxQXk08e2oTItD2s9nnyd0o6WElpXC8J/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mRm9HS0McRh9AsnfHoXXQA4HPPkY/G8KvSQEWb8/Mg+TcwCHv21NeN0pEQBBc43NT0L/npaDlr8fQRimX1KDjwm6XMYYkXSbAFx3lN0VgVwRhlZGiTHZ74bot424hUFXW+RGoiHptDUtlRVZnqXyfsGHzUbOmK4Uuz7moeLfaMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nP4LXN+x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RJGeply1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGdwQ724452
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 13:00:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LjdBzauvOqjzi+H4aHlYeX
	gujOJFM540mstkGc96erE=; b=nP4LXN+xdbQ3uQDml1CVFhdhQPcjogVx96VHYt
	blUy3wFnf7PB3e8Imt/g03JwpYDlNjKUHT/SbEZ83G89KQLyyNi6uC3Mo6MDDGJG
	tOwT9PH8kTDJbGKOsVCta8KB62MXMdnplDQ7mgSUVkO+wqO/4Bn+ZrzkFxe1xGeA
	T1lioRc5zvJcFCdLdAs1trBWGc8eZWft8bbNAKlNaGb7kzEJ+ZL2Qx/vaq/47fo2
	Hg5mgHvsCmnflaZaV7LO/7GeJkOoueM+CIZd/8K/6AZPxNCuwZnAPqvA48RQQrOl
	anmX9tIT0Ahdr3D7FyPP0fJxECqookHmux7jNrOqvId8FCrw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dm2rkcf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 13:00:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b08025f240so13658595ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 06:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774443656; x=1775048456; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LjdBzauvOqjzi+H4aHlYeXgujOJFM540mstkGc96erE=;
        b=RJGeply199+Zz0wGDrrxDCnJorsE/lWRsRmcZv5IyxvlYg9puEIAGFmtue1g+C+Xyw
         7sfUjCVi7O23E625o3TBfEMg0CBPQR/UiMslss0qx+EmZc1qr9qmu5AG3pubJYdNx4om
         sYcIVXgLqVbJb+dkvnKA+nNTVR/8dDsGDSd/Wt7mKqX5bAa4EGBioD/7gFsPrDDzHuAD
         OZA26F1jof23ou25FeHf1ywbrc0kCt50LdQZsLkLOnuAO6ZiO3U84Lj+xThB/VpI0ujU
         uUDCaCiNYzliowTfPBR5gWGo/1vYe+xFXto+cboSImYR7JY3mrwrE/puwtZmO1WVTyRX
         8wDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774443656; x=1775048456;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LjdBzauvOqjzi+H4aHlYeXgujOJFM540mstkGc96erE=;
        b=VOw/mdpvvVPFCoDMA8PEw4mu5roNXBZRQP/X5FrrTuKIgdcHOjkS0x4+H66HbFnxuh
         pDzq+Kn7soUGMOqVNKmK/1rAham8GciKKSiZihf+YU5hfwTSBTe1JAUoL92suLmGbhuZ
         OZUABOj2ci9h6jCNkaOhLYWG5fFoF1YjDDM6PV0xQUKBM7wnDsmTH3+xhSzjq6MLd4Jp
         b5K4S9p+G+Rqaw7ArQb6zZtB0B/XylYSrp7PMd6KNqSUboy5g00OAM8Tg0DYQECxwBOW
         ozwDQbg7gEOZ4TTu4W+HlkRLrrWZjPB/ewQm+FydI4Fuk3DJO0nK3+r8/sJKyWPLI7b0
         c0NQ==
X-Gm-Message-State: AOJu0YyUq1hCYMZQLLb7hfigtRjlHWWahGIKWANRxi7KB2avLsTnNBX8
	XgqkbSi2N+k3p71fOgG0Qfp/7P8brrxpaqkzN029W4Mo8EekO7E51co9iqE2pSIHSDls2BRImxS
	jV1v9RjrJQJs8MnAJ5Qmz6P7qV8rt/vh3llmDszxTY2W9MsTNhbt7aYA/zeHShv0Nnb45
X-Gm-Gg: ATEYQzweF9BLRMdQ7RRag1yMn7TSSw8L81I5U9twBNeFpgNNsrfNqewd6iQ3u77brz9
	0m9IStZkcjEKeGScybewgKwp+gLiCyafRbA5TQ6gAt45ib33grWU24gkXOLbLygTmswbBn+iHhe
	OrTS58QXX9D0rO8edgOpDHIuzJ4gbPD93/d2SI3SEXZ4GVGIvFaElI+K+M7khXhteh7JCrZkpqB
	zeYEfFwS2EDiKjlIv+ZEjABqiMTlQB0XxOvnyAECeDwaK8X3N5h3VaOld0BuSBJS5jwaUXpdmIu
	L51xLGehYCP63THNhHwEIL//KSFbw2cYzYlzDEq2QMwsX4aZe0HLNgSW0OM7qz/Nj1iFACU9t8Q
	oPmzVLgEqJQxPKvDRHkliqGyw6wrPlrq5kPChQzWq8ireiFtNPG1lWpCbgg==
X-Received: by 2002:a17:902:f607:b0:2ae:5350:3a4e with SMTP id d9443c01a7336-2b0b07efad5mr35559605ad.21.1774443655459;
        Wed, 25 Mar 2026 06:00:55 -0700 (PDT)
X-Received: by 2002:a17:902:f607:b0:2ae:5350:3a4e with SMTP id d9443c01a7336-2b0b07efad5mr35558835ad.21.1774443654537;
        Wed, 25 Mar 2026 06:00:54 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083656f65sm262575755ad.45.2026.03.25.06.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 06:00:53 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 18:30:37 +0530
Subject: [PATCH v1] arm64: dts: qcom: lemans: Correct QUP interrupt numbers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-lemans-irq-num-v1-1-a470d544966a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHXcw2kC/yWMwQqDMBAFf0Xe2YUkVgv+SvGgca1bNG2zKoL47
 03b4wzMHFCOwoo6OxB5E5VnSGDzDH5sw51J+sRwxlWmcCVNPLdBSeKbwjqT96a4OjtcStsjRa/
 Ig+y/4Q2bRfN3unYP9sv3hPP8AKhdIGR2AAAA
X-Change-ID: 20260325-lemans-irq-num-cc03721f451d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774443649; l=2483;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=iECa52X1WMxQXk08e2oTItD2s9nnyd0o6WElpXC8J/Q=;
 b=h7U3vULDB7kvty2wDiJfNo0SWaU2i9OgE41ELIdnqbE5iVVqQ7OQGEVtcw67Vr2XB2V3Cd5d6
 novS8Vn0CVAAYodn9Z+B+8hwCdrVdlXpXgIduN37LRhShOP8opzZvNn
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA5MyBTYWx0ZWRfXxib0VdWvRKTT
 ITEXLkLobCpLcyExhkinHZEuBh3QdyT4KsWVi63g3+iR70KVgD5DHPecF5t7UgEQjB45EPygCvK
 lRbs0PEpyYEmsUd79BxHjdxcSWA67FfzV6IUeugB4ik7M62uw2WW7jQTbZwN0z6SviF8FGDdSPb
 SYCSNuYRq5myrn1yF6XR4PCuiUvATjPH5xwwyajeahnWqdVDuI78JbF8xaUVzR8c0FxFXYUcQUa
 NBAIYC40lWAnU6lHzD1/gxpzImflJQl8fljQI18umEXkndrSApJ9rVTAZZtrDD0/nurwXyic0Ny
 72CMUCbOboSQS5WaJtY0AvHsuQmdrVdjHqCmfMX8NaOFio0mcD/4nFGvNSTTKX3iU+jPO6obORw
 O71SQvHSon/1tl8u7HIrbTNDk84a+mQxfPXnYbhWufPViOGKDX9t4v/5DYA3Fiu3P8toCiTH+Rh
 464G/U4AKjwsjSdfyqw==
X-Proofpoint-GUID: m8MowF7BQrN1tL7IR-8qs9Rth1cZ81En
X-Authority-Analysis: v=2.4 cv=Fo0IPmrq c=1 sm=1 tr=0 ts=69c3dc88 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nXOf96giqOHqJdTUQPAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: m8MowF7BQrN1tL7IR-8qs9Rth1cZ81En
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250093
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99885-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.13.179.208:email,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AA4E0325BDC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix GIC_SPI interrupt numbers for QUPv3 SE6 nodes on Lemans SoC.
Using incorrect interrupt lines can prevent IRQs from triggering
and break I2C, SPI, and UART operation.

Fixes: 34a407316b7d3 ("arm64: dts: qcom: sa8775p: Populate additional UART DT nodes")
Fixes: 1b2d7ad5ac14d ("arm64: dts: qcom: sa8775p: add missing spi nodes")
Fixes: ee2f5f906d69d ("arm64: dts: qcom: sa8775p: add missing i2c nodes")
Cc: stable@vger.kernel.org
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index f565067bda31..05c0888e2bc6 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -1512,7 +1512,7 @@ i2c20: i2c@898000 {
 				reg = <0x0 0x898000 0x0 0x4000>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-				interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 833 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
 				clock-names = "se";
 				pinctrl-0 = <&qup_i2c20_default>;
@@ -1539,7 +1539,7 @@ spi20: spi@898000 {
 				reg = <0x0 0x898000 0x0 0x4000>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-				interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 833 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
 				clock-names = "se";
 				pinctrl-0 = <&qup_spi20_default>;
@@ -1564,7 +1564,7 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
 			uart20: serial@898000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x00898000 0x0 0x4000>;
-				interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 833 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
 				clock-names = "se";
 				pinctrl-0 = <&qup_uart20_default>;
@@ -2510,7 +2510,7 @@ i2c13: i2c@a98000 {
 				reg = <0x0 0xa98000 0x0 0x4000>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-				interrupts = <GIC_SPI 836 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 835 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
 				clock-names = "se";
 				pinctrl-0 = <&qup_i2c13_default>;

---
base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
change-id: 20260325-lemans-irq-num-cc03721f451d

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>


