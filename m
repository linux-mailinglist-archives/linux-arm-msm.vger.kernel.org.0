Return-Path: <linux-arm-msm+bounces-26766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE23938CCE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 11:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62B471F24FC3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7223C16F286;
	Mon, 22 Jul 2024 09:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bi8M30qk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0145516EC18;
	Mon, 22 Jul 2024 09:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721642121; cv=none; b=J02Md9NRtcFxyzjm5N3h2IEfbpWdOlV4OK8F+g4sZ3/PFqRFuHI/TAEEekdmLwJZFIItJRNyVg1H/67Oudo7dQswb5flYmXo3gqbvsUW5I3x1fYM0zW+YH/e71WO1HVjyljRIxOg//7Uaju+1tkGPM1Nn0gpwAxmfViCViRpfJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721642121; c=relaxed/simple;
	bh=ifl09MZWOBznlmJMqcf8Xqj34pV8iepPaLINN97wyYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cyxBTzLM1DAqtNnU/KqdzKQdZLASqwvVoEHx5lXj0/gCQzIdymm1U5NVroFx1ad3QAeQfrRSGA69dj30A/+7xWJpgTUU9ZIOzX/6uOb46OjxAZ1wH16lgaxjhI0rKpFrLN+d18wAqsbT4LXC3FxGBdWW51xgkYwEHIz/TxbpaPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bi8M30qk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA656C4DDF8;
	Mon, 22 Jul 2024 09:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721642120;
	bh=ifl09MZWOBznlmJMqcf8Xqj34pV8iepPaLINN97wyYM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bi8M30qkFeVpfvxqpB5v1IWECfhjhFjYliMfku1/yUUEGCX4gN/uqjJiMtuoY+B4N
	 eLDwz0tKO/NsXNngiXM1oBOWQgcorlgYEhV+3gq0QzaoYIuYVPRW5DaAZUK9GDndDO
	 R8IRbjQkkzR4Y4Hjp3xjXvuCfhj3hnoAhjZOQSvSSHqnr/ZeODDsFABFlPcS1Mqq9q
	 yeREc2rjx0Q5iB1t76dSJsA7UlyumUxekYfgalPh4awNjxoN4rb1T7vx+FeYhMfKQm
	 7JT1WjKRNMi0X7X6ppb7VVapS28CyPEwpaEhSZzzuVXoUvFFfrVAN398aAEKlwG3Av
	 VmT20uc4jX8og==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sVplH-0000000079i-3tvN;
	Mon, 22 Jul 2024 11:55:19 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Xilin Wu <wuxilin123@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 10/12] arm64: dts: qcom: x1e80100-yoga-slim7x: fix up PCIe6a pinctrl node
Date: Mon, 22 Jul 2024 11:54:57 +0200
Message-ID: <20240722095459.27437-11-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240722095459.27437-1-johan+linaro@kernel.org>
References: <20240722095459.27437-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCIe6a pinctrl node appears to have been copied from the sc8280xp
CRD dts (via the x1e80100 CRD dts), which has the NVMe on pcie2a and
uses some funny indentation.

Fix up the node name to match the x1e80100 use and label and use only
tabs for indentation.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts    | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index 0aeead5658ec..dde2957e6dc7 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -782,7 +782,7 @@ nvme_reg_en: nvme-reg-en-state {
 		bias-disable;
 	};
 
-	pcie6a_default: pcie2a-default-state {
+	pcie6a_default: pcie6a-default-state {
 		clkreq-n-pins {
 			pins = "gpio153";
 			function = "pcie6a_clk";
@@ -798,11 +798,11 @@ perst-n-pins {
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


