Return-Path: <linux-arm-msm+bounces-50646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48194A56EC1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 18:10:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33F803ADDE3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 17:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6072F23ED66;
	Fri,  7 Mar 2025 17:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lmrN/363"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B70664C6;
	Fri,  7 Mar 2025 17:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741367447; cv=none; b=Juc5OHzmMk/GkZbqLk/BPPuXQ2U/U4Qu6jhtKCGQcGDHJJkKZxXHNHSqR3kH/pQ/zZMbnAFq9MO+t2dO8MJy6uriyvJuc6TupWooz9Fi3WaZ5bfFDigp5tvcSq0GfaQU0sO6exJ/fAWtYfX+gCuXdEtnlgf9Ra/AuesmiQL/XTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741367447; c=relaxed/simple;
	bh=UtUjan0RBifzMrQyhjYYw/jNSvvuZGdyk0P9I9WQxxw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OMtUEkQ0m7tCBvmK/q8pxK3rZywJ74XWELcSjBKScp1D9jC1tLmXZJPEU7gu1uxDpH0kT5wwTZHOyGf8YY3h2FzHFtQSCXsKPZWrp9T8htFv/Vc75Ubc1nPYmHAwLnsveu+CD7UfOg0+feFgGz2sDDjU+4X6zWYuhaYJQ4mTtTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lmrN/363; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03858C4CED1;
	Fri,  7 Mar 2025 17:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741367447;
	bh=UtUjan0RBifzMrQyhjYYw/jNSvvuZGdyk0P9I9WQxxw=;
	h=From:To:Cc:Subject:Date:From;
	b=lmrN/363ujfmOxvtujwFBeoer1iOLthL+joB6VqC3ZIbLJCZaCurL3ldEmo7+nCCI
	 N6hToW3FUCrEtkFIv/+8Y/xktLXr+gCOZoWRMTNM1Lkv3UaACNILH6fAyCjJMaZfKe
	 NzUsHWivVACoBBuiw3i/gFPcX1IMhrF1/b29IXLyfcGhYkBr/Xrre7w0cROOHX8+DC
	 eXW1+SAn/Ox5nI5Hv4BYH6HqgNSgx9kFka8G9LcXvk3CAuQBKNEIPrD82ruj/RKJbN
	 64lIuhNV+6MrCMx02nVsuqYMiwlPnQtuK29TGu7SP+vSj3GGfk3JiLLs0JYOxEzHoD
	 9pdtYyvQ6G+cw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tqbDh-000000001te-2RhM;
	Fri, 07 Mar 2025 18:10:45 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] arm64: dts: qcom: sc8280xp-crd: add support for volume-up key
Date: Fri,  7 Mar 2025 18:10:36 +0100
Message-ID: <20250307171036.7276-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the keypad volume-up key on the debug extension board.

This is useful to have when testing PMIC interrupt handling, and the key
can also be used to wake up from deep suspend states (CX shutdown).

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index 75adaa19d1c3..8badf7f49b95 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -37,6 +37,20 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&kypd_vol_up_n>;
+		pinctrl-names = "default";
+
+		key-vol-up {
+			label = "volume_up";
+			gpios = <&pmc8280_1_gpios 6 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			wakeup-source;
+		};
+	};
+
 	pmic-glink {
 		compatible = "qcom,sc8280xp-pmic-glink", "qcom,pmic-glink";
 
@@ -885,6 +899,14 @@ edp_bl_reg_en: edp-bl-reg-en-state {
 		function = "normal";
 	};
 
+	kypd_vol_up_n: kypd-vol-up-n-state {
+		pins = "gpio6";
+		function = "normal";
+		power-source = <0>; /* 3.3 V */
+		bias-pull-up;
+		input-enable;
+	};
+
 	misc_3p3_reg_en: misc-3p3-reg-en-state {
 		pins = "gpio2";
 		function = "normal";
-- 
2.45.3


