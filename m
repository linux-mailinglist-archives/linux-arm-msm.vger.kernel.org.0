Return-Path: <linux-arm-msm+bounces-61939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7937AAE291F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 15:22:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBA683AE857
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 13:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C5D21CC71;
	Sat, 21 Jun 2025 13:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="Cf0bXCSI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8880195808;
	Sat, 21 Jun 2025 13:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750512103; cv=none; b=Aq+uxwt2JA+2A8OadcK196YXWrsTdjAF8YuUDI124smJS2Sckxor6/RYzWZEze1PzYnM9UNY2H5dZ8kTzx25WQJ0FmzeEUKM1gVz0XBAmJCPrxyhG5y9rlfKsVd4b6LXvvz56EX/M/owOq6LyHB5nR9cZdWTl+0aKBzRLzwnFvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750512103; c=relaxed/simple;
	bh=SR6I4Fqmy6vE+82N3HIvGUTmpwSh34gsiI++K5dI2Kk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CyZ/cNESEEFiZ7yYIv+VbrNJVbpsfNDfJB7Yqc3f9EyTR5Impq2/YpZPrhOiWafhC2fLwIvnEIFkJOToCnHRCHO7TJsAVlyDaldNLzReqq5bldi7DbvcghKPPkufUGulCvZR3DK4hFzGky3ftFmfqZW7y3mD34yB5Tn5klj+zoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=Cf0bXCSI; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1750512099; bh=SR6I4Fqmy6vE+82N3HIvGUTmpwSh34gsiI++K5dI2Kk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Cf0bXCSIDSaQZovAWIxHT8JUygb71qn9fFTIbE/bzZ2bmzOJF0lPcWfTp+apspTrV
	 84/c9gP6xklUrTZ4ag2RgLN3oy6eFRoY72wTGZZhLE9GaOzToMD7QM/a2sdUyLQc/G
	 mvDJqCkdZ0VOWLBIAJSHRTKyXqAzmfL+xY0SHo38=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sat, 21 Jun 2025 15:19:58 +0200
Subject: [PATCH 3/4] ARM: dts: qcom: msm8974: Sort header includes
 alphabetically
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-msm8974-rpmpd-switch-v1-3-0a2cb303c446@lucaweiss.eu>
References: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
In-Reply-To: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1216; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=SR6I4Fqmy6vE+82N3HIvGUTmpwSh34gsiI++K5dI2Kk=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBoVrHg072I9uYVJWbuUoP/cCWQ5jQD4JVBXnI4Y
 25Ogh27hcmJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaFax4AAKCRBy2EO4nU3X
 VqJJEACrZ+i4LWy83lbf9nz86QdN1LgEOSZUEb8yW75L7orLdkgbnfq//p7u7GCkOK8vzDXwEeP
 6jLAfcqxpHBoosvzn8auy+zAjgvYDd7z3GRaVYi8WPEvAYyZ3Ty/fE8222351H9vjesIEaf2OZz
 ap4u1agOLZrlpCdwHdGFsth2c7mpu3lTu7k/9IsLmvb/V0c6j4xP2MfnkrVN6NtXUeDzDFrlCCt
 rKGO5XYgUM9Ug9ZRXqnCUujcejAxxBdFlLrpdc7nsTcT24n7glEnSSkaeudwS8yFmAiBj6OmWnj
 ZITHpGdlbvjuceSKWuEB9K+d24ZjFM74RkmA/IGKb89f+xJuiI42hV4VxG/J0h/34vhJ34c7T2w
 vE4bkvKFwKYSskKMILSiCIEzIDCqvi4Gm1/7Ta/uHa5Nn9BqBsOF+EdCRqzEUg9ohid4RAsoh4Z
 EpU3KUwfjyBRzfMqAQ1c1lRRRdzWR034P0E+cVVP7kAJqKg1cwgKzlPBhgcZ4zYxDBTZgMhhCSS
 nwNUHV2ZxHTRoH6fIYD1umZKqN3hvT1HpK5K8O8UKOQlg8TAmz1iI7hV+ciylbuU0z44CUWxqMd
 mnUdRfoW2vWX1WyKq9s9zEFpZem4IqL2Bw1mgbBdJcWquqJH3vejCuJa/2Bx4XrYpPfN6mp2xCZ
 do9pXj+AXLKhcFw==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Before adding more headers in a random order, let's sort the includes
once so that's done.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
index 7e119370f3375573e284587d48aef6dca3ed707f..8459a840d9ffee9da2f9a4ad8fd5a1419a3eb5a7 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
@@ -1,14 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 
-#include <dt-bindings/interconnect/qcom,msm8974.h>
-#include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-msm8974.h>
 #include <dt-bindings/clock/qcom,mmcc-msm8974.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
-#include <dt-bindings/reset/qcom,gcc-msm8974.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interconnect/qcom,msm8974.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/qcom,gcc-msm8974.h>
 
 / {
 	#address-cells = <1>;

-- 
2.50.0


