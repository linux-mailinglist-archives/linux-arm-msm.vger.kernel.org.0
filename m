Return-Path: <linux-arm-msm+bounces-26635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7576937867
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 15:25:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D60021C213F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 13:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D1313EFEE;
	Fri, 19 Jul 2024 13:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IqDFgbQQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0727C84A28;
	Fri, 19 Jul 2024 13:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721395539; cv=none; b=ga7re+lav6jaqgWrSg9WnSBc9mLWA7m0yMECMhlomdsB3VWC5Tq6dYEBmpF3kR3VPAB6gK6xl1xA5GA+70f7YKb4PoRMm92o98WQHOm1J7rK5fwuJrlEC4adpiZkDue/o29aIIoRH5kuTlQMvQoljWVDEdYaCaqXXTagPirxbX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721395539; c=relaxed/simple;
	bh=nTpOqNJ4PzR01+Bu5uIixOxMbOnqss1t/gbvzvgIneA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eQ2UWaabsf7o57A5/91KptHlWN7iDE9g+59NnEudzOjJM21cYHylGdLmuV72vwlW5EyyASKJuiWFX0hVw1PZy6WTNfqBMlNf8l6HLMSSYsvq1qy1QwBIHKzi2rJYOShLVKSTtLneGvxTlBRcsZRgTaYWUBd8PRJpoAeBf9a8ZL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IqDFgbQQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD87C4AF0A;
	Fri, 19 Jul 2024 13:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721395538;
	bh=nTpOqNJ4PzR01+Bu5uIixOxMbOnqss1t/gbvzvgIneA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IqDFgbQQPs51geR3fVkk2GnpdGxIrpkqALovJbLl783gh4M4DD+YWTA1/jQYMetBo
	 u2T/UaFvACoXFCzTYhTm8KS3DLJtQq1B8jVdfk9GdxrXVRkaXzXf/paig5eBoq/CBF
	 ocGCF+9YZeQqi6kX3TreI/ZqPgbYpbbdn99KXmgkbLuUf9w/xj2izZV8FU8ZNDm+xu
	 YeWOjfTB13bdYp9b5OSYiTWLlD5sZjhhYFcrQ6BJxox7V8fBIbzSuz7H0LEB/4Zg9N
	 RI4LutegUltbZG5kWUnh4cu2UDs3jtZ8PJ91PJvBFnoAhuj8i8GR9L/lMYYsFDaES2
	 IfQiuPHy5qqtg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sUncI-000000002Oz-3RS1;
	Fri, 19 Jul 2024 15:25:46 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 1/4] arm64: dts: qcom: sc8280xp-crd: disable PCIe perst pull downs
Date: Fri, 19 Jul 2024 15:25:19 +0200
Message-ID: <20240719132522.9176-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240719132522.9176-1-johan+linaro@kernel.org>
References: <20240719132522.9176-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Disable the PCIe perst pull-down resistors to save some power.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index 2897dff8e3bb..4c8ae13d25b9 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -885,7 +885,7 @@ perst-n-pins {
 			pins = "gpio143";
 			function = "gpio";
 			drive-strength = <2>;
-			bias-pull-down;
+			bias-disable;
 		};
 
 		wake-n-pins {
@@ -908,7 +908,7 @@ perst-n-pins {
 			pins = "gpio151";
 			function = "gpio";
 			drive-strength = <2>;
-			bias-pull-down;
+			bias-disable;
 		};
 
 		wake-n-pins {
@@ -931,7 +931,7 @@ perst-n-pins {
 			pins = "gpio141";
 			function = "gpio";
 			drive-strength = <2>;
-			bias-pull-down;
+			bias-disable;
 		};
 
 		wake-n-pins {
-- 
2.44.2


