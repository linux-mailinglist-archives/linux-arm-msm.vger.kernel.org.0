Return-Path: <linux-arm-msm+bounces-85149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B00CACBA894
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 13:00:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF5D330D741D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 12:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 380072D8799;
	Sat, 13 Dec 2025 12:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a3L7wiPA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019F11DF736;
	Sat, 13 Dec 2025 12:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765627223; cv=none; b=Rb5MhNHP37O5lYOHYDsF0FX1PrSL2VXM1bl1TJj4cU4lgY27PfA5Jik5croPFpaAroCEl5ObgLZEI8wohTxJR/VYz6v1Ciy/5EMqWcwf2hJzupmS1oSr30Tj0gBqDRq9/3j8wWqH2TGC5//M1KRpgqqSiO33P8SA1JwXXe2Y9Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765627223; c=relaxed/simple;
	bh=mDucH85lbN6AcudVUgixgA8rr9QiV3SwRhuBq9Pll6w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ezb83cDc94mfTyRmOsSdiyR7PxQiIiEdFAE5fxnQQLZBi189R7dMXjMsxMmZ3SqLrm4kR/K78GuAdvFTMjVoHuycysvFy/eFsc2gOcBBurCyNoUJMD0QnuR9QHnXh2TD5IfI4c8YFJmwfdF6FE6b3peaDEEfsxwCPgeBbSpquyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a3L7wiPA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3E09C113D0;
	Sat, 13 Dec 2025 12:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765627222;
	bh=mDucH85lbN6AcudVUgixgA8rr9QiV3SwRhuBq9Pll6w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=a3L7wiPAWlK39BdrUAe+caPFAbEDerLQwzJYhOfQKQ/gXlCfimfQvc71+ODbxdctk
	 QV1+YZbI9wu8GZsin8YpqxDJxXsUTnIMWTDIZi3Ipsg849/N9oSuH/ZIavTPQ5GHc2
	 IeYhTouk7tRaJ7tfmqn68dEMrgkrowsgt5/iPoDqAjolze71ulZ8PSeiYXlaDAka5O
	 GL/tLKUeQjdkxhz6y98Emmkp/A65kqwQjB6vitzLzE7+cax1NnZFND8Fn8errIBbHm
	 vD/Mbyhj5wAE6nnkdUxjQKpFplBAfMt+Ks9eoznOmMR9qFezy/YNiDnl4C2gUCK4xy
	 pzeQ4sVflu4cQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B40ADD5B154;
	Sat, 13 Dec 2025 12:00:22 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 13 Dec 2025 13:00:20 +0100
Subject: [PATCH 1/2] arm64: qcom: sdm845: Introduce camera master clock
 pinctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251213-sdm845-mclk-v1-1-197bc947d4c6@ixit.cz>
References: <20251213-sdm845-mclk-v1-0-197bc947d4c6@ixit.cz>
In-Reply-To: <20251213-sdm845-mclk-v1-0-197bc947d4c6@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1674; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=uiiq2Mic+x+DbSSB9OvLTBg10YTIOXvynitnln45aLk=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpPVVVWKfTbtgcJIewa2IfTh2XKygUwnuNJGKA5
 5eYfz/GN9eJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaT1VVQAKCRBgAj/E00kg
 cj2TD/91EXzwitxuPe/Jh13JyhhwBF9x1xsAxlMrHt3uT9UXfKJP5zinawtJH4/xSyRl9DtnERm
 i7v0CxGvmiqwC2n9Fx7RUaaXrwMaVAhO/IbM1M1PL6GX/kQUcuxW3/YfMRH5YTnr64itPQza0g5
 mJ6k4LiIIzjxw5SM6hjqGhF4/UQMlfbYFnoFwqDFsEESevZTimMFftKdipQIT3/mQs0PcC+AXZx
 aQAt0c4uRzef4Im+Dl3YNMjFarLJf6vMbbraD2ijFrUSu2RGNouT4HU6AJkGKF9kYo2eKrmvmhh
 gwDJDOp8OQ4eyKLv2yzWdzL2BU/Izku7mgkouqG9JDyUqmwgTwXcBl2Fn/R8zNiVFIxmuKjGKRy
 gP8+hfCrSsZTeWWwp4gcLLzy0TzzgZsY4WxMoBkKmjD0Gv5//XkIfyPWbYvSV4ZZKgdl1VGlBIQ
 gveI6a0jnRS2WsXqushNLApaj5ZtZltvL8Vbd7HdqLQKNxQGnNFi3TAJfV5pBvWEYUHpQCWkRTd
 S4IWP9xPxAmEv8UKUh0mNgN1uPkG9b2mYayyYJqEB2YrltU/XlSW4JENvutsFLle1DT0UUgBTky
 CeJX1/FXVMzU18t+uzpIKcqcgRtyJszm5tD8BitR7l+QJFTYwtcIS8mi1vRjzYIunZOl2BG4NGH
 TW9nAk0gjsw4jlA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

There are shared for the whole architecture, so let's define these in
proper place.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 43 ++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index bf2f9c04adba7..97bd9513b011b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2805,6 +2805,49 @@ tlmm: pinctrl@3400000 {
 			gpio-ranges = <&tlmm 0 0 151>;
 			wakeup-parent = <&pdc_intc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio13";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk0_sleep: cam-mclk0-sleep-state {
+				pins = "gpio13";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio14";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_sleep: cam-mclk1-sleep-state {
+				pins = "gpio14";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio15";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_sleep: cam-mclk2-sleep-state {
+				pins = "gpio15";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+
 			cci0_default: cci0-default-state {
 				/* SDA, SCL */
 				pins = "gpio17", "gpio18";

-- 
2.51.0



