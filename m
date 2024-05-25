Return-Path: <linux-arm-msm+bounces-20454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8E68CF08F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 19:49:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73361B20EF2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 17:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1780485C76;
	Sat, 25 May 2024 17:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tKXmdsHQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE93F58ABC;
	Sat, 25 May 2024 17:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716659360; cv=none; b=SLcZ5DPdPniiNiMaChxIjWjO9dxAyCXh5FmmfUzoV6uuNteUnSfuMMiatoVdH8SAMHoblaeiidVtJxKyqcrKbZQNxmCq0qKS6gsqSDKy8kEHB1cQ4dOV0zGc2cUJ772QK4BXslnNpkXuXezYIxEzzW72dVNQtWgY31Pi6RZ0i64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716659360; c=relaxed/simple;
	bh=w2lVbQg7geYYElaG8kXR8QWNNNuZkQJ3SeHqc8G6cxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QnQ2cZy2A6dXPnxnXQogl86eweEoNh/BjMA6ALzFta2NI+Y5LHHF4SLscNPF8u9LqzbpTx73k6Gx/67WXwNekhahLvtTTmpCv8xIvmh0IWTu1Ze49dMCN7qR4IQH9d9UOvec/mkTO+VXoJeoGHCYT/8MWGErR7DQuuvbCsitrno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tKXmdsHQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFD25C2BD11;
	Sat, 25 May 2024 17:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716659359;
	bh=w2lVbQg7geYYElaG8kXR8QWNNNuZkQJ3SeHqc8G6cxE=;
	h=From:Date:Subject:To:Cc:From;
	b=tKXmdsHQNoqvsYNH9h5YCuHyJKgJ7AhDFHZnDmPpvlz9u4aY1p+oj/4fOCTAmmQ9M
	 YX6+KGgQ1ZLUYsPeKV44bIJEWDxPdX0ttcwA78dO1yxZ6tl4pClPCTdcOCMZKPvdqZ
	 nCjyQQqYu6AH85remkiC1ITd50/gdX+cVK77B0bfEaUsKubtK7GL6hFblJq6T5C11S
	 TYqIrsSgqpMVuwwuHOrWHezW3ymvWF+AkjIJs2h/ZWSnLJoSrS7FDlMxQlKaIRLtfZ
	 +mKRCMASKZrt1oNghjwVeY4yTtx3DXKdT/MkRW0RYDaRVQ09HqsBXZkpiP6Uqr/GRR
	 zUrFU0aTmukQQ==
From: Bjorn Andersson <andersson@kernel.org>
Date: Sat, 25 May 2024 10:54:07 -0700
Subject: [PATCH] arm64: dts: qcom: sc8180x: Fix aoss_qmp node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240525-sc8180x-aop-validation-fix-v1-1-66cfa3c9ccf6@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAL4lUmYC/x2MQQqAMAzAviI9W9imk+FXxENxVQuisokIw79bP
 CaQFMichDP0VYHEt2Q5dgVbVzCttC+MEpXBGdca7zzmKdhgHqTjxJs2iXRpgrM82PhITQyBbed
 AB2di1f98GN/3A1/2z4JsAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=851;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=wuENVIW+TtD94LIkXR7+JtVLuNiFndHlEROGJJbESw8=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmUiXAu9MfjIFs01t/MEpOBUlepEFkbcj1VvANB
 zYcEhXWWtGJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZlIlwBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUT/w//UCAXTj92B9lDLl412iFQCpaJOSO+dvxt0rUbaJq
 JfO/m0hZWQhIuLfDcwVkG9ofZIiUQs1yzAlyuy1nPIr68P4iWelnPTGMMBhkfI0A1sgaxkKkhct
 DVyXUvQxwOF74irvR5/+Ii24h1xgPoWrXq8dCGzfpzzruRKvm47RRBAC1fVbtHP6yx1/XX0t1Dt
 gABK37xN+5ogUrM4tMafKMlw68B2B/FOKgEP+e62M/Vest7Trop5gAWFHgWdY8nE8jQj19z/3DJ
 FuyuMt6vltmTeJjGOh8tSyd7CkDrLc9N1V+uuzJY5cZ/JTqj9q/NXclZzZh9FRj4c3oPkXmLaiD
 00qQDnRMtz2bTwn3G9NPHJ1ECNvr0/6OdZPufOziDWH0QCqcphr9Fjnw3m/xPLcjtCZx1ew9O8Y
 pLlhIRjsWWXMsgFcGseDdMW4ecLWlMuI/Nx2NziU+gdg1DsvFNWR19uhnAgM6Z6Cz8BmiL0dJ6b
 C42X/rKtPHII5XCAUAQzvJBOdEyMVuYaRgCwShqiXGsGBT8iBx3VCt/lA+c5eSP3lxKaocWLlZr
 ZQGQ8o7wQyJtGDdsCShzKa6NHj2nGUaMZRDgj1eQ7gKF/ZtfeZoFMcXOkmcP6fVZ27HujoDegZG
 r/aDEV6CGDZl9wFebTDKX74gn4q/LF5t9wBbekmt7mdU=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

The #power-domains property is no longer accepted according to the AOSS
QMP binding, drop it from the node.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 067712310560..13ad3b728fbb 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -3368,7 +3368,6 @@ aoss_qmp: power-controller@c300000 {
 			mboxes = <&apss_shared 0>;
 
 			#clock-cells = <0>;
-			#power-domain-cells = <1>;
 		};
 
 		sram@c3f0000 {

---
base-commit: 3689b0ef08b70e4e03b82ebd37730a03a672853a
change-id: 20240525-sc8180x-aop-validation-fix-35da3d88e162

Best regards,
-- 
Bjorn Andersson <quic_bjorande@quicinc.com>


