Return-Path: <linux-arm-msm+bounces-61981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3023AE3162
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Jun 2025 20:37:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6778F1890536
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Jun 2025 18:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E26D41F4621;
	Sun, 22 Jun 2025 18:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="fDtb7KSW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from toucan.tulip.relay.mailchannels.net (toucan.tulip.relay.mailchannels.net [23.83.218.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AE42260C;
	Sun, 22 Jun 2025 18:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.254
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750617419; cv=pass; b=gYu77gxyPURHYBjCAlCFuqZ0kr3ExjGGVV5F3F4ddbSvcS0Aj2SKuc30DqpL/IWaj6oW9RXgH1MKp87Wb3XOTs0VzB13rYpHxWRB6CJJb6XTEqznt444KSkYQ9UOH/9dPdCBJE+mqavPffdYabZJaZusMzcW6Pjd5aZQoWrVdkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750617419; c=relaxed/simple;
	bh=AEyr0s1lN9Tsb7Gyv22SLI62+3u++q2bNqb/BorFezQ=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=mXROTwXy9VwLz63EvH+p7raMd89vGv3HqPyuHgHK7qjGZPTBUzYRs/+oAVaEeAYaACmlU4nP09w+gja685ZpkfMmSm0jJ7iPYv0o//vnhHvyTMECxiSDLOWJgbgsPZSz0fE+MOBDPTWRs050CB4230yrc4aJXrJzi4GCZY0BXJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=fDtb7KSW; arc=pass smtp.client-ip=23.83.218.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 76A1118301A;
	Sun, 22 Jun 2025 18:26:48 +0000 (UTC)
Received: from fr-int-smtpout7.hostinger.io (trex-green-5.trex.outbound.svc.cluster.local [100.127.221.91])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 5FC8E183D68;
	Sun, 22 Jun 2025 18:26:43 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1750616805; a=rsa-sha256;
	cv=none;
	b=honM+T4M346jeoCLqW3clSTTgH87iKze6f+nHwm7609bN4g/4PZwAjoe1w+pc/7v8SrinR
	+iUbyX+7Uab2YA9KQUQNXwzp2etK+0Y+hfFGcppdQX2nk9TpH5bEODa1P3wJinDqqauVDz
	FYk18zR9H7Voptz9P4PlVEJO/aQpXr/YlMwp7vuN0bLifk/BD43HCuFIrK9GHKT0dVqqWi
	KZKoV06WgslvAcu/m5uleZPWIJOSEbdNpEocx0xY+Mb8qtd5YxqPBQASwcNaNDhhMBzcvo
	05BSm/dQK2wr7aPKgAw28eJbTavWMy3cFBLdwJRxbHjfV9aPK0//ts9v873xdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1750616805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=rc3HHQegCVPQFmYqd8gctSDPuwAn2xx+6Q/U8EdGm7E=;
	b=VUxTeMZFRJws3yuYKPrCPsaaw9S90GMcU+SFVstQm59WkcXYOAL+Z5sjxtOhnsm3CzDoLP
	00fk6qqSqljL3jOF/vxg83ttfgD21GEcLxkJAq9XfNbCR9EGxq0pyWtqO3TlxwuqVfZeid
	VNMe4PR7q1PJJGzh7yVHZBUERCG6R1dtX/APHsmB/UAZEfZ2wsuIEgkvFp5d1CINZ275tF
	VrFvB269T1xMKTOewFXyxdKNU1Iy8lnWfEEUT9LHzne4kpORvCv0VvvUEv5QPuKUl6brFY
	ThEcGPJKo4hEfX+gPy8qMmY4lN2+HkeDYEZpL0vPO3v7Ja/Bko0tDV51IXrOtg==
ARC-Authentication-Results: i=1;
	rspamd-679c59f89-qvsjt;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Battle-Versed: 542b59dc55d284b1_1750616808375_777128975
X-MC-Loop-Signature: 1750616808375:2165682262
X-MC-Ingress-Time: 1750616808375
Received: from fr-int-smtpout7.hostinger.io (fr-int-smtpout7.hostinger.io
 [89.116.146.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.127.221.91 (trex/7.0.3);
	Sun, 22 Jun 2025 18:26:48 +0000
Received: from [172.17.0.2] (unknown [36.79.123.39])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4bQKRg0mb2zKLLGY;
	Sun, 22 Jun 2025 18:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1750616801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rc3HHQegCVPQFmYqd8gctSDPuwAn2xx+6Q/U8EdGm7E=;
	b=fDtb7KSWqWWkUgalslY2TBfLqlDZziTrzTv/tFQq/q+ZZrN5+vtMESqrNTW95XFtpKs+Lg
	mFNxuirrnTy6UErDXAEUJFQtMb6/0nXZiV9r3oK4YGbGmiscmLqWurKU0c9Ns5rFYbP+Dy
	QYfPl6s46VU9j7tgM5FPyV3c0fNz5UNbEsGV+Xejd2cTvJiOo4hiKp2MH3sfIe1h4unfvX
	f82VSesBTD5l465IEJNuowec7JoyrseMzhnUUV1D7B2sYcn7jiN28Rl4QGqraFYmn2s8eb
	8UyZpkiph6H6LVZa1ZFe/SSre69pW/X2c987Wivtbdxu9UJoHRhxaDQRy9bmMA==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH v2 1/5] ARM: dts: qcom: msm8960: add sdcc3 pinctrl states
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-msm8960-sdcard-v2-1-340a5e8f7df0@smankusors.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750616795; l=2211;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=AEyr0s1lN9Tsb7Gyv22SLI62+3u++q2bNqb/BorFezQ=;
 b=hnwNLKHd3sUr3z1uyqSQG1scDdBa7BB+pCjP20Zrx/goUNdPJomL4azD0gmK3hZbAJV2N8i0N
 AoKoHQaSTzuCFXsYexqGnaPjhHOpuKgdJDoIp8w0DMkAH2F5TE+tQTb
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sun, 22 Jun 2025 18:26:38 +0000 (UTC)
X-CM-Envelope: MS4xfPKxLiBMIkAs3iTKMDwMkguZlGPca+w0e79twyntxV60UC7Rj+U9U2W2wflSo2gxTVhe3atx0fzJk0rYRqvtn3yK5X/O7XG6tjrNurx3aIg+Y4fbDCVJ pVduceROPM1+pS5m8cgc4MfmdaeI50rSqivHTjvCA8OEnPLOItIxYogcfnKdgPy03I3LJOVezKUVcLnkN+ewpZ5Bd15OqGgxKJzpT3FmrNYYmwJKukZQJdry 6m8Ij+D8DqoumrD8/2GZDHfzJT9lg5ATPxDm7JcSkkxgtH33sEYey992an/uFShiLpyvErs+W4mDSEaTiskl5QlGXy5dFguhgEmJXY2q0AexoljdIrL5j7jt Ynlpwh0D7wdPNECn3FWWIzUO7dL6D3vC5KlpXMGL5zxVFY676zMFISFz6yZTdvLcdopQoFJyXb+r9ie+Eln66SjXQvmyRAN8HDMnv/ceF0JKXKKTuLJ+qEUc NyZa5J16uyiae8HBcFRh5nHga+FUqohuxoSgtH84XiCy5b2yMkd/umPuTgg=
X-CM-Analysis: v=2.4 cv=Vv1xAP2n c=1 sm=1 tr=0 ts=68584ae1 a=vFgqIyFt8cetXi1S0ACNwg==:117 a=vFgqIyFt8cetXi1S0ACNwg==:17 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8 a=wxLWbCv9AAAA:8 a=2wrJF2QuKA2qlS4toWQA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-AuthUser: linux@smankusors.com

Adds sdcc3-default-state and sdcc3-sleep-state pinctrl states for
MSM8960. These are required for devices like Sony Xperia SP to ensure
micro SD card functionality, though they are a no-op on the Samsung
Galaxy Express.

Tested-by: Rudraksha Gupta <guptarud@gmail.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi      | 40 ++++++++++++++++++++++
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   |  5 +++
 2 files changed, 45 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi
index 4fa98277128897a531c54296576a6f15cd6d2a28..f18753e9f5ef3b8ebd33cb0ca0b2cfd1010b679c 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi
@@ -18,4 +18,44 @@ i2c3-pins {
 			bias-bus-hold;
 		};
 	};
+
+	sdcc3_default_state: sdcc3-default-state {
+		clk-pins {
+			pins = "sdc3_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		cmd-pins {
+			pins = "sdc3_cmd";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		data-pins {
+			pins = "sdc3_data";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+	};
+
+	sdcc3_sleep_state: sdcc3-sleep-state {
+		clk-pins {
+			pins = "sdc3_clk";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		cmd-pins {
+			pins = "sdc3_cmd";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		data-pins {
+			pins = "sdc3_data";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
 };
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
index af6cc6393d740d30f3555825175ea6851d406166..49d117ea033a0ef73c134d1225982786fbded2c2 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
@@ -71,6 +71,11 @@ &sdcc1 {
 &sdcc3 {
 	vmmc-supply = <&pm8921_l6>;
 	vqmmc-supply = <&pm8921_l7>;
+
+	pinctrl-0 = <&sdcc3_default_state>;
+	pinctrl-1 = <&sdcc3_sleep_state>;
+	pinctrl-names = "default", "sleep";
+
 	status = "okay";
 };
 

-- 
2.34.1


