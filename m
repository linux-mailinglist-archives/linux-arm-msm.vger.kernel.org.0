Return-Path: <linux-arm-msm+bounces-66821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E14AB13790
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 11:34:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE322176675
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 09:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5421921B199;
	Mon, 28 Jul 2025 09:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RWbBe3tr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248A49463;
	Mon, 28 Jul 2025 09:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695239; cv=none; b=gXd3NXvRlxBOO9QDfQLHRB1Xa4UC0B34Y6uNxtNP9udalcb6t/52IkEIfohuSWZjdoXBC2ZdbrWy1cL1WLQ7nJbF+oaHuiOBsoRzvHrzAECI3cFBWwO7uW1cPzeCIe4jNz9uv5AKixAQUqn9X2YNsw93C/uS29l1uc3GQbSUJo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695239; c=relaxed/simple;
	bh=xgvpcMi4xVt5i3iu1enJ7NxI7jGYXAm7Dz6/uB75rOY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ttXbVpnPvI32WG25Q7Ti2UWWIqeRjYqDoBKrpoY3QG5EtZcDyyFkqoj5Q3km+LfmxXqJ0c4sAEZdMhHUi025ykur7m6TRUBgzVCxntrrT7t20YR0ETMMmf1sp+d7+7SEep6Ocez161eXnMoNQYcWUUFemrUDEx92F6OKTClROuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RWbBe3tr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE8CC4CEE7;
	Mon, 28 Jul 2025 09:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753695238;
	bh=xgvpcMi4xVt5i3iu1enJ7NxI7jGYXAm7Dz6/uB75rOY=;
	h=From:Date:Subject:To:Cc:From;
	b=RWbBe3tr4CKS+J/B6qWYTHCDoYGeLU0+BqxHzDqAtpLnvCj747bZmrUdM682wp1KQ
	 Z1EUarHby9qaEdOhHjEIBYuTQfURa4x1QR9pBmvx3yjVXOBmnQdZHSg9gwSkk1OKep
	 deG1M5VxIBCbv5MFHYvk7GHo55XMm5JjigANYIyRCnXvJQfvZvmv4dc+edDLn4vT6d
	 rVQrdb6eR+sOv3+VBFjWpBK5oHEHef70TZljSAnQ1bMrwX7z+7bueHN03FXaJPn6PJ
	 knanufzmNZLkXuKgnlrIb9HRHiM+BHbnxXY5XWngFJ4POXYRwlMu6985XJldVNF4Zo
	 j6LAK8lj8zUWw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 28 Jul 2025 11:33:52 +0200
Subject: [PATCH] arm64: dts: qcom: sc7280-chrome-common: Remove duplicate
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250728-topic-chrome_dt_fixup-v1-1-1fc38a95d5ea@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAP9Dh2gC/x2MWwqAIBAArxL7nWDS+yoRketa+1GKVgTR3ZM+h
 2HmgUiBKUKfPRDo4shuT1DkGeA67wsJNolBSVXJRrXicJ5R4BrcRpM5Jsv36YUtS1PrBrGzGlL
 rAyXxf4fxfT+VX0EBZwAAAA==
X-Change-ID: 20250728-topic-chrome_dt_fixup-f44d6b7cc9fb
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753695235; l=1117;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=iQM1UCMj9uQFICgEonSsjJqyIfrM8L7vyNrS4l0aPBw=;
 b=A7YoltDkgU23tATyvj8vbLap5YbjTYMRFXH6uXIT9nWPoIQa+ib27mtYPno9gNVb14Sa3ikjf
 Q8/DmqCImr0CdKQ2lAn0KGPI5VFxRJHJFI/Z96SunKLsftcuDG69KvY
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

sc7280.dtsi already includes the very same definition (bar 'memory@'
vs 'video@', which doesn't matter). Remove the duplicate to fix a lot
of dtbs W=1 warning instances (unique_unit_address_if_enabled).

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
index 8b4239f13748fe591b68a163f37993f9e84c2de0..84c6d662b54f8c87de56c02100e2b491094f90b3 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
@@ -44,11 +44,6 @@ camera_mem: memory@8ad00000 {
 			reg = <0x0 0x8ad00000 0x0 0x500000>;
 			no-map;
 		};
-
-		venus_mem: memory@8b200000 {
-			reg = <0x0 0x8b200000 0x0 0x500000>;
-			no-map;
-		};
 	};
 };
 

---
base-commit: d7af19298454ed155f5cf67201a70f5cf836c842
change-id: 20250728-topic-chrome_dt_fixup-f44d6b7cc9fb

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


