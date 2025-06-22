Return-Path: <linux-arm-msm+bounces-61978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA98AE3152
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Jun 2025 20:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E93E616E396
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Jun 2025 18:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D52171EBA1E;
	Sun, 22 Jun 2025 18:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="NKLU18YQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from panther.cherry.relay.mailchannels.net (panther.cherry.relay.mailchannels.net [23.83.223.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7601E485;
	Sun, 22 Jun 2025 18:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750616819; cv=pass; b=hLjGFZX7SXmmn6pEu1qBwKhQpzTamKwY5M0m+Q7Jo2lNSX3OSB/2QMHIwbgMwnSS75z0RftzfA1Nbc6picZkUC+D6ErEZVthWxAlU1nQwuUijl1gIFFQBmGPiK78hHlTjDKui0raTH+rF98peFQQNC6w3EK25ZdlA+eIpDGptCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750616819; c=relaxed/simple;
	bh=Qa2TloQybQQfBMHL/md68YrvWj606JET01tnBUBBtLU=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=bQCJN+bb9oxxS7QljDp4XpZEnV28L5yp9UZ22wKwuSKpg5ISi2eJGKd0C0N7Coabq3N4T8JgKYZJCiHWR/njFLYp/uwG1OIMh6t3lLMjUTzGEqfSarCcSbc/K7ZNwmvY0kjxohV42c0bgdP0gofCpHrhvKz7HohQ6weEVrPh2Ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=NKLU18YQ; arc=pass smtp.client-ip=23.83.223.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 060ED845776;
	Sun, 22 Jun 2025 18:26:51 +0000 (UTC)
Received: from fr-int-smtpout7.hostinger.io (trex-green-0.trex.outbound.svc.cluster.local [100.108.88.219])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 01E53845790;
	Sun, 22 Jun 2025 18:26:48 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1750616810; a=rsa-sha256;
	cv=none;
	b=h8GFnMx+Zgtd4q0G54rocllNeh+n9MvA8nkXiThDxv4+ydpzx86m3ZNpEQhtTFeS6TfRtj
	8pu+r9yvH/SpW512a0+ajIv/6GuoY5exh1yU2NZiujHL5zb4iAJtXhs5mqm0Ip9mJNpo54
	bFwnZ67NCvhEDvcBWoG/ZQMVKVYrfi9Zcrg9uQiH3DZddekiGaEdEoiuHVOWWy/7wgUNAy
	GOqOf0hqVU8h13Qb4gBJP77RDIp8V1JKMJGpe7upRxrWHvY1L40Gmvfs5JwvStsR0GXOZ+
	5W8xe++J8C4tovdUp/VkYQXxex+O+wpEy2k2jsgraJA9l5k+G4Gbfs7Zbx8yzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1750616810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=guP/zBtP1vNwG7seMSXtY5a0H4wpmEXu7K56UvsSjGU=;
	b=FJc+hhU5J301+3C7vzCKHZSme+v8Upc8eEgINSIMsZcNih6kuCm6gEKfwXd4vhxNo9si3W
	+JDaO1OsMTieLrFsM2FVZ4Hxe2Gd8W7Pm8bXsQ3pGLbupJrPJ7FFPj2VEAW4PptB0V8XCQ
	zP0il6Tk50ABhQINdRBy2z0fHR380hSmE/E2mlFPLhav2S4a1kr0aYPk7HBmtLcgGky5cg
	e6vIuryQcvfZHrL2D+bQDEQkVWwi0xBsofJJlcQ63N9wjbNFxuJW6FKGUkZuw8XJ7v2Mmb
	p59PIfH2xybN1xvdcibajCsw6cSLsLAKEHddXSW4LxBH7F7mynyiYZvLsBC40w==
ARC-Authentication-Results: i=1;
	rspamd-6597f9cdc7-tj99m;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Celery-Supply: 02810db92af57a62_1750616810846_91599388
X-MC-Loop-Signature: 1750616810846:2239689500
X-MC-Ingress-Time: 1750616810846
Received: from fr-int-smtpout7.hostinger.io (fr-int-smtpout7.hostinger.io
 [89.116.146.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.108.88.219 (trex/7.0.3);
	Sun, 22 Jun 2025 18:26:50 +0000
Received: from [172.17.0.2] (unknown [36.79.123.39])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4bQKRm4wH3zKLLHc;
	Sun, 22 Jun 2025 18:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1750616806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=guP/zBtP1vNwG7seMSXtY5a0H4wpmEXu7K56UvsSjGU=;
	b=NKLU18YQk75jFqmaFT7Zon07El45dARH1i90DJ172iPekel3pj8T/oTNVcCEMZ/kwD2iCU
	LjX5lV4asdXceaAuF0SsxS1o5JSh6rOU1K96N2bJCeMA8yeZ2nfUIlkLRM9htOCeLfIY6B
	M7Fm3Y/Bnx339ZpxCS7CF8oTCxkhZ8nPSNJYUTaIG1bpCF3CPLtEvkhCuAzgBq59t5ebXT
	XjPeHn1y1Ky2cp9eBY1lh7liqStXyoKRmVhVNesWXOkP2W4lDmPbaNbkSH+kQJUFB+MehS
	gcjTneDgE0nsLgrPn9lJJEThLba1wNxqSrYc2XTyC/2zeSPJSDmsmNEdfDlQ0g==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH v2 3/5] ARM: dts: qcom: msm8960: disable gsbi1 and gsbi5
 nodes in msm8960 dtsi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-msm8960-sdcard-v2-3-340a5e8f7df0@smankusors.com>
References: <20250623-msm8960-sdcard-v2-0-340a5e8f7df0@smankusors.com>
In-Reply-To: <20250623-msm8960-sdcard-v2-0-340a5e8f7df0@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 Max Shevchenko <wctrl@proton.me>, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750616795; l=1510;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=Qa2TloQybQQfBMHL/md68YrvWj606JET01tnBUBBtLU=;
 b=bESHLXO9JgtAIKUCgJLe3vpLFVhU4TUHdYnRgUoJm77cOAqyYkbMGkh8pIlV6rQ59eHSQhqGX
 5WmL8y1kegLCOkyCU6AWui45LsIhpbn6cAgHd26iWGxOv1ImuccFoyP
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sun, 22 Jun 2025 18:26:44 +0000 (UTC)
X-CM-Envelope: MS4xfEQZ8komricnluPPkg9eCwgyIoppsWsKVU36E49C7TpmhXPWhctIE1faMexVNTAI5FsNRHavC8W6wj42QkPj6FG91hSL3jHEdzugmSWd+3gYqanwXhKI v6hE/N6QxzaBHjiodfy0LD33P9SDLZ50YOPVldCZjtKFXyocLMkwkWnoPp6aI3GZwyUQys8qv4P+tKHlit4U7gKOyeosV0PQMQiEhaWFdxfunaU9Laimz7Ok 2MDInrc9ZxdGWIf+roIwHvyi9d9k6eGPMC1SDKYSWknpfnrVdKnfxW8hRAbkaggFaAuVqmp9NDn4kYpde3wa5v9DlTGtjH3xD0kq0UtxXcjUVydeCHCFXzoT diN6elkzab2QJe0ziPliVuR6YLIpOBf7ddbgBTMF0i9dHbFatYkO5L30IKlYU9qQucFqS1/UXBxXizvP9cUkMOe3dm57NtgEBzX+oTxOauRW3g183++zXXAt WtEJ8Pde0Ro1fKbAD+COFmEt2gKJ2ZPtQDXcWFHIMw4wT9DN4GacWObwJyM=
X-CM-Analysis: v=2.4 cv=Vv1xAP2n c=1 sm=1 tr=0 ts=68584ae6 a=vFgqIyFt8cetXi1S0ACNwg==:117 a=vFgqIyFt8cetXi1S0ACNwg==:17 a=IkcTkHD0fZMA:10 a=wxLWbCv9AAAA:8 a=DTDndxlCylVmyPESURwA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-AuthUser: linux@smankusors.com

Not all devices use gsbi1 and gsbi5, so these nodes should be disabled
in the SoC dtsi, following the existing pattern used for gsbi3. The
upstream samsung-expressatt and msm8960-cdp devices already have status
"okay" for these nodes, so this change should not break existing
functionality.

This eliminates the following error messages when gsbi nodes are not
configured in the board's device tree:
[    1.109723] gsbi 16000000.gsbi: missing mode configuration
[    1.109797] gsbi 16000000.gsbi: probe with driver gsbi failed with error -22

(Note: Xperia SP doesn't use gsbi5)

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 588ac6c7a51a667202550432bee14fa14f3f74e7..4916e0d1f528a9320b66fb5bce3928beaa203e5e 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -322,6 +322,8 @@ gsbi5: gsbi@16400000 {
 
 			syscon-tcsr = <&tcsr>;
 
+			status = "disabled";
+
 			gsbi5_serial: serial@16440000 {
 				compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
 				reg = <0x16440000 0x1000>,
@@ -445,6 +447,8 @@ gsbi1: gsbi@16000000 {
 			#size-cells = <1>;
 			ranges;
 
+			status = "disabled";
+
 			gsbi1_spi: spi@16080000 {
 				compatible = "qcom,spi-qup-v1.1.1";
 				#address-cells = <1>;

-- 
2.34.1


