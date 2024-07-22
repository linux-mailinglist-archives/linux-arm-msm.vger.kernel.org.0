Return-Path: <linux-arm-msm+bounces-26741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5BA938C3A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 11:45:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16FBA1C2137D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 034BA16D4FB;
	Mon, 22 Jul 2024 09:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bo0oopWe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF4D16D4F0;
	Mon, 22 Jul 2024 09:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721641425; cv=none; b=kC1T5JanKConTUVOvA6hl/H6TACyCC5F/46TrX8XMeYTIHHlq1ZDZ70Za+1lIF+YyU6BCKjjNe9Ngg6qY1MiIBIc31rjFmaLLsJ9IwEX3pclCrYyfHTz3g94amUSd6bup4C3HK/58/3mbRrVEMv2xJ7RyHaZKkM+suuYZWI5940=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721641425; c=relaxed/simple;
	bh=vWHDPV7SJDyJi0Bd3AA+J+K1tMnD/Z5Sooa8E16YOG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uFuQiqZt3xS/RsRqtEBMsYi9gMVztwN14R4t+k1BMBFIDIrcV0mYV9UPWEYC3RvUc8zFnLV7DgDzCV95yOMrPFJjbXzLwJjhdCtZmKwDE5XTYK54sLw7ENMe1lTjHfVBT4I0XqLLj/1Zu6yl3Pyt3u7O2y7BlMD0aG3N9ccn/lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bo0oopWe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80006C4AF0D;
	Mon, 22 Jul 2024 09:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721641425;
	bh=vWHDPV7SJDyJi0Bd3AA+J+K1tMnD/Z5Sooa8E16YOG0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bo0oopWeefyiu72mDi/OAiFB/EyKIPaHhTxhcNur+R9NtJY7Zm2ZDA62+DuFs2yLj
	 RNt5eLtnzpxJdsz2ZeOnLeUyNtMGwjpci4P5llQ44DEuhysqLZ8tnkcJBFQs6QRyC3
	 aQMJEupbvsbARS9696CHmf3cE2mEdYuBvcYrnBy4uqxMBmzABvozMQr8KFt5tEgKaC
	 j1fvoYXFZ7cVVIYTo3E64PFjJ6OkwNhYE9+MSHQ5bLOLBD59Ct3mqcW2i6N/ZD/ff7
	 NjQ4bKJPC9p04njykjzE7tyF4SxdX14Jd9+q/tl8ThqaYyOs2mZkzpP7KQlFBck5RZ
	 axzTEAqD0g7wA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sVpa4-000000006uL-2SjK;
	Mon, 22 Jul 2024 11:43:44 +0200
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
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 4/8] arm64: dts: qcom: x1e80100-crd: fix up PCIe6a pinctrl node
Date: Mon, 22 Jul 2024 11:42:45 +0200
Message-ID: <20240722094249.26471-5-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240722094249.26471-1-johan+linaro@kernel.org>
References: <20240722094249.26471-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCIe6a pinctrl node appears to have been copied from the sc8280xp
CRD dts, which has the NVMe on pcie2a and uses some funny indentation.

Fix up the node name to match the x1e80100 use and label and use only
tabs for indentation.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 6aa2ec1e7919..41d05ce01cbb 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -975,7 +975,7 @@ nvme_reg_en: nvme-reg-en-state {
 		bias-disable;
 	};
 
-	pcie6a_default: pcie2a-default-state {
+	pcie6a_default: pcie6a-default-state {
 		clkreq-n-pins {
 			pins = "gpio153";
 			function = "pcie6a_clk";
@@ -991,11 +991,11 @@ perst-n-pins {
 		};
 
 		wake-n-pins {
-		       pins = "gpio154";
-		       function = "gpio";
-		       drive-strength = <2>;
-		       bias-pull-up;
-	       };
+			pins = "gpio154";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
 	};
 
 	tpad_default: tpad-default-state {
-- 
2.44.2


