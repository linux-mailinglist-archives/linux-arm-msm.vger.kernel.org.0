Return-Path: <linux-arm-msm+bounces-28119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D00694B16A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 22:34:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 492651C21C36
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 20:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50E5113E409;
	Wed,  7 Aug 2024 20:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="cmTIRDLh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697D580045;
	Wed,  7 Aug 2024 20:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723062842; cv=none; b=JHBj5LdKibNEfCoRPxEPNtnmg6wjVXutsg6VpS1jZYizYTcSpF0s2K331aYeQKtxFwuvexJ96AIhja0YlgXLIvbfnOLN9DwIdG2879WKVWthdPDegUSG0KzbeDuuUbkm8KCY2jmbV3Qa9Z2h1a3tTQmGKVu9BzytqphUA2y3TmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723062842; c=relaxed/simple;
	bh=7/tYYIONdOh2Wmq5RbfksRSLfJFqArpGvHzJ0vMW4hQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=l56Hd45xCou+SaLzSbbZc8rPIKuixYYesvblrbPEWd1oiKQgQ2vKR1slBvF5u08ppVuP63sUqgwUbKvwerohb2YKjLSap4YJAYRyziYHgfyPXvg+aWelSFEDQCTgQdF9u6h5Y0qjwfDuKn+fUIV90d+BCJ48YxSsgFFL9R30pkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=cmTIRDLh; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.1.90] (86FF4CFD.dsl.pool.telekom.hu [134.255.76.253])
	by mail.mainlining.org (Postfix) with ESMTPSA id E61BDE450D;
	Wed,  7 Aug 2024 20:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1723062838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8GnGRb4/WQrVpspUMkcrNsYyDiMk+fzAl900IJHy058=;
	b=cmTIRDLhg4Rlkiz1R1Xfmgvb7njvv9Cvz+Gn9OhyaL06kNutjz5wAChuM6Hqa72nR01wM0
	SYtWwOT2KmNboNEoyuvqkTv2Hut+3csgFq8OcRiK3TyDGCZL6nmVOvz8YpV0iWmEPMWrRI
	ewQBRx+AHf5o7wDD8TjjX1lKPAVt6ZkK8Z5qVFcuXttWLxbxk8VVyyrsnZQlov419xx8VM
	y9FbzjXe+RlBpyAPEuoUAp06fU6xaQp8BN46uQ9USqW+0yHfCk4RTp6xAUvPoU0mBAc6mn
	5yeCeVcY5qdwD6c5nuYEphT1WtyVy3Uzr0iyeabd0jYD5TOoiVJfeGSy0dpDaQ==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 07 Aug 2024 22:33:56 +0200
Subject: [PATCH] arm64: dts: qcom: msm8976: Add restart node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240807-pshold-v1-1-0fa7927e99ce@mainlining.org>
X-B4-Tracking: v=1; b=H4sIADPas2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDCwNz3YLijPycFF1LU2MT06S0VAujJEMloOKCotS0zAqwQdGxtbUAKmO
 khVgAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723062837; l=958;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=7/tYYIONdOh2Wmq5RbfksRSLfJFqArpGvHzJ0vMW4hQ=;
 b=o5cc+cxYH2Rleu2QfQgHrlzFEiTUR0QCEEEC/WeNe868dyApS3cBOl+Kq5Tf2x5HA11uYXndH
 nlyz9pbAEklDPQ/46g9Sl04atUOeAMsjL4xxzfNueUvZBI4S6FzB9Hl
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add a pshold restart node what can be found in downstream for
enable to perform restart operations.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/msm8976.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
index d62dcb76fa48..a58dbb9a3c65 100644
--- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
@@ -663,6 +663,11 @@ tsens: thermal-sensor@4a9000 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		restart@4ab000 {
+			compatible = "qcom,pshold";
+			reg = <0x004ab000 0x4>;
+		};
+
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,msm8976-pinctrl";
 			reg = <0x01000000 0x300000>;

---
base-commit: eec5d86d5bac6b3e972eb9c1898af3c08303c52d
change-id: 20240807-pshold-95345bfe82b1

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


