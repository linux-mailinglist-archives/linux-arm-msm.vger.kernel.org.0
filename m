Return-Path: <linux-arm-msm+bounces-54799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED162A94281
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 11:04:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B017B8A604B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 09:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A78CA1C9DC6;
	Sat, 19 Apr 2025 09:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="Dpxicw0H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276B21C5F37;
	Sat, 19 Apr 2025 09:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745053460; cv=none; b=QOgZjhzYXjyRj/jJHXqD30h5GbYUY4fx1aPIKDzeGH59H1m7RgU/nreAAFtQkQYu3gMo3WiDDSUyqOKXbe23/3sDNL3bl3UetcNVYgYkgpqv40AhF5Qihhkz3tP6e/EQTKh+9EYTVLvhYIDqKeI+IHnXalfxSqaEIDeuSHWVi84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745053460; c=relaxed/simple;
	bh=YYw+4Yqcqnd6wv1yzJ823RLhLXSASJkRZ8l6cS68fCo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=StYNAk4b1qsSdFAGmqXaEGEWHFHwL/H04+4fFmPuXgT6AOzoAdp2VcDzHRYnYvqo8EddukjaPwHzQ4MhZSdVajZb5o122KCq9mnCn/aAW/PDaiRO4LQM6TUMB+rkQBxqeLDc06XHHLaAhYAoaW4fF8zp5RYvPaQMPucCiUlVLgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=Dpxicw0H; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1745053457; bh=YYw+4Yqcqnd6wv1yzJ823RLhLXSASJkRZ8l6cS68fCo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Dpxicw0HMtJTtqAZSuWvdp6P7LNiGAKXsJO/7WglYFenuP93ZmWx0NjugTzzLL9f2
	 QjeZZWHLs2xizd+9F4pDveL7WVdEvm+eZYWB+OrYQxgxju/T1UODq1p5vANbu3S0uK
	 K8G2usbQQMDpn2pY6fM4xIsgQcRLe3Vm9h6REf34=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sat, 19 Apr 2025 11:03:59 +0200
Subject: [PATCH 3/3] ARM: dts: qcom: sony-xperia-rhine: Add alias for mmc0
 & mmc1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250419-msm8974-mmc-alias-v1-3-82aa131224b6@lucaweiss.eu>
References: <20250419-msm8974-mmc-alias-v1-0-82aa131224b6@lucaweiss.eu>
In-Reply-To: <20250419-msm8974-mmc-alias-v1-0-82aa131224b6@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=750; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=YYw+4Yqcqnd6wv1yzJ823RLhLXSASJkRZ8l6cS68fCo=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBoA2cLm/UQ4837PJLZU4DaoJuoDnwlSPR9uAyTy
 G3JW5edF2GJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaANnCwAKCRBy2EO4nU3X
 VlHMD/4tW2wwtVIJVNYnZZTNB8bqsaXvbKupPsnEzSdIuTnAOdAbyiOlXBno3NYWOcrybHOYRAE
 ksdqWSbzpK2UxUEKWfuq0JTYNabZXa992kk+q93pXMmujH9SWgJ/TTLogOz73HtNVCuq0QgEGtq
 2A47W6EhhQgpBw//jvGWek3GEvrQd6iLh5U4pYaQ8kAHfT/T7KCmTVBPRnM1IaAT8O52kSegewW
 zPDrTDAw+w9NGo9/0G3q2EX+jO+FahywnORJxBVnYEwtIZNM/U7nFOalWTYEmzclj0PSUgRjvzp
 H1ywY6ND+kJMos4Tt5rxh9vnyeqN4ZOzcr12kgzNJZ0j2z06uxciv2F5FM1QsHuOjwDm/IBIBnM
 c3WHkp5iYfAzvp/VY9ielP8HOGjjozUQkeua8D3tKz7sj0KDcvLEMOjQpoaDo69FvHUyrsQB3Wi
 4E/yOAynTEHEVkuQBK9Axcdn5Dw3e5wIWw7pYgXgtuSyg+mLBU7UJH84g5T/iFqIOIGUN6yHYcZ
 FfJVEA3+CftceUa319UcWLFc78QyP8R59HYT+xpvD8XF9WhjVJRF8N4ga7C2V0XNMDRsmBRd14G
 ORjHp1d9K7rhDjBmAUMA04qIMObla+WHg90tmA6SPSifxS2ssykHj2rh+o7ivZfQU/pqktMxyzE
 Zx+EDxVDTOMBK3g==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add an alias for the internal storage so it always becomes mmcblk0 and
SD card becomes mmcblk1.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
index d34659ebac22e65a511994ef201fe04f12089781..145908f319e47fbabfa8f59ea38be5d2d8487fd8 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
@@ -8,6 +8,8 @@
 
 / {
 	aliases {
+		mmc0 = &sdhc_1;
+		mmc1 = &sdhc_2;
 		serial0 = &blsp1_uart2;
 	};
 

-- 
2.49.0


