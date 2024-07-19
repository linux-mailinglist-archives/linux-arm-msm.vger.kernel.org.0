Return-Path: <linux-arm-msm+bounces-26630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2ECD937842
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 15:17:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3063D1C20FCF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 13:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C30F143751;
	Fri, 19 Jul 2024 13:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KaY026k+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0D685283;
	Fri, 19 Jul 2024 13:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721395049; cv=none; b=FDRfI8VmKWgYX9oatA11qSNquA1D3RQI0nu8/I3fF/vlgb9oTwYxUrQIPitTwXgaZPOQ4DzlOBnrjMnS6iCZcS5zD8gvothxO3n9u8ddgEunxHXP8L7BEdftCQ3oht3ROtQDUOBm91OvILdpBBHnRr690KtfOmMbyZI6qRERPJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721395049; c=relaxed/simple;
	bh=duXa92ouaTdUeRj9iAXjigOdHkj9jO/WZ01Q6V+4258=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kyj6ZQbh0peRwQxRDpp5VXCZZnbXGmeQ156k6g0g8YJjqL+cYqtt95ETLd8eImCTM9BViZQQScwVsAu5JM3BqMShJ1VzEIZKroCvOyIGdduRc3e14Gj0sKz/cK8yO3EVSMzJdNTrP3b2VK14VDfjfHOj2co+rBtkdSshcK6ri8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KaY026k+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0EA7C4AF09;
	Fri, 19 Jul 2024 13:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721395048;
	bh=duXa92ouaTdUeRj9iAXjigOdHkj9jO/WZ01Q6V+4258=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KaY026k+3NPH0NRHitAK3IeCKDZVMoaJeewtgaVtVCj9fejgo+XQIfTd6o926Kkpo
	 XkyWQClC/xCp5YYgKsv4F2NSyAfgQpu6LU8V/FkDp/NK0IGiwOjfMC4O+WCaNff7mE
	 pfCzUTvrphCOySR5GXQscxX/9yfW5MQklLHqalhAXC0nz+8KVGaPBleXqiIuPJihTV
	 5XAjakYv533qpfBD2ZNtn9/f6ltrVzbp6irHjLt62gdRGkoeWbXIXw4uHt3LdUrF+W
	 2BUXqH/Iq/Cm9GP+/BWrMvMNe6p38BP4LunkoVj0RfVSBhViJqFCDGNwYcquMNeR1Y
	 zlVg6hXZO1dYQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sUnUO-000000002BK-39rI;
	Fri, 19 Jul 2024 15:17:36 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 5/7] arm64: dts: qcom: x1e80100-crd: fix missing PCIe4 gpios
Date: Fri, 19 Jul 2024 15:17:20 +0200
Message-ID: <20240719131722.8343-6-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240719131722.8343-1-johan+linaro@kernel.org>
References: <20240719131722.8343-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing PCIe4 perst, wake and clkreq GPIOs.

Fixes: d7e03cce0400 ("arm64: dts: qcom: x1e80100-crd: Enable more support")
Cc: stable@vger.kernel.org	# 6.9
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 7406f1ad9c55..72d9feec907b 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -784,6 +784,12 @@ &mdss_dp3_phy {
 };
 
 &pcie4 {
+	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie4_default>;
+
 	status = "okay";
 };
 
@@ -975,6 +981,29 @@ nvme_reg_en: nvme-reg-en-state {
 		bias-disable;
 	};
 
+	pcie4_default: pcie4-default-state {
+		clkreq-n-pins {
+			pins = "gpio147";
+			function = "pcie4_clk";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio146";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio148";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
 	pcie6a_default: pcie6a-default-state {
 		clkreq-n-pins {
 			pins = "gpio153";
-- 
2.44.2


