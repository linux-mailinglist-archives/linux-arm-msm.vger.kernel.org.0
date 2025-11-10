Return-Path: <linux-arm-msm+bounces-81056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DB8C47A10
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 16:47:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46F8B3BD0A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 15:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7C4331814A;
	Mon, 10 Nov 2025 15:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LD7RhiHJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19463176E1;
	Mon, 10 Nov 2025 15:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762789067; cv=none; b=qIhr06+m/Hnj2OfeEnGb2WIlEqfHu49cgdDc4VclQfFXyUYkzraGjCf8mPSuF9iOFl+wmJtUj+F+dEf8Tp0nXBGv7ix0ycEA31NiW2IjQ8D5As9vdq3tL+ZYwhmNV4hBjruKFwXuJsWeqvl7A9ct9cqGh0k33LNDGKNQGG0wLvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762789067; c=relaxed/simple;
	bh=6J7fvr2vPXP+1OhxiMj2h6wQ/v11hmVHA3VrQ/tDc+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kzg6JkSQrwMxOhi/DksAeJKe1ganhig/ZIB0xFU+OER4C+/csbFiFHlvJVXbVf5khHWnCuQk3pCnxvYwQyBvC5yFm11U6nAcLXYAybT2XJHGVJ0HXmwNh0jvzCeoyvLBe+DYWOGdofnpAILJhsYsguLV2CHfOixUSyfjV5UTsPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LD7RhiHJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4965EC2BC86;
	Mon, 10 Nov 2025 15:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762789067;
	bh=6J7fvr2vPXP+1OhxiMj2h6wQ/v11hmVHA3VrQ/tDc+Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LD7RhiHJhsjCtPzjD0hcv90aCmQ/ZgddpBwoIWaU79Q0pnyc56WIeJ04xwOHOoIPj
	 Py/d/G+dKxD3KwT4ck9mBaDsqWUeyFzyAgEZzkCAoxK1z/C4PZGMW++/G8hWX1DqgV
	 ocyQtwFKhVJHt5VN48nQlhEmkviY09Ln1t9bcEOrWYZxESUz+XH2jTRvYqRKuWmd3/
	 yn/G9sYcw+Lizb6dEcKGOrWwef//wU4twe79iz4cPJuCwfYU4wkXW4xPEtRLpkofmZ
	 y33dTzZ6qOqzQAUAmljNJWLHFgvA4e27pslZyRzFGmy92Adt7AvvJx3DkxwlJZx9Dm
	 Ben40vLMhRSyg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4154DCCF9E3;
	Mon, 10 Nov 2025 15:37:47 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 10 Nov 2025 16:37:47 +0100
Subject: [PATCH 2/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add ath10k
 calibration variant
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-sdm845-calibration-variants-v1-2-2c536ada77c2@ixit.cz>
References: <20251110-sdm845-calibration-variants-v1-0-2c536ada77c2@ixit.cz>
In-Reply-To: <20251110-sdm845-calibration-variants-v1-0-2c536ada77c2@ixit.cz>
To: Dylan Van Assche <me@dylanvanassche.be>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=rYwdSJ6cHAzDm8PURpNylwInOTgz1iatN8QT60N4njI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpEgbKldre6WlnIZ9OS9ViAetuS84ikzOLErwqT
 9IL8w1HG7mJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRIGygAKCRBgAj/E00kg
 crK8D/4q+w5OLGCyysdHrA4Fbt8lO+rpBPT8trhCJgguL9VilUs6elkdCKwlEAZPPfqh3kRypPr
 pUTb1ObhFWBjC3Daq8/WjrTDFWYpUa4TY25VECpxwZfLqYyIKtEbgjW+2jxhFp36aV0upzedB9s
 iNVETBgWhScnPuUhL50M3xWW4cikiKrPxSspGajAg8yIlON7kx0+GS3RIjIl7wYN7HNcad8aWAH
 +OWhykHalU6gWky8J/iJjawDqbB2RvulYw/PBVIPB84tR8hZQkjwYDB2e+P7C3E+yGxd0DU3Iw7
 jmb9pyIxUI6O9t6MyX5N/BZWBnMVAf3D9CCBe8mfo2Kgod4ESYnZzcMtJoijGx6+Es4SADSmPt0
 i++s6aoEvWyJNRh9gZi+hSlw5C7trFHy41Bh5e3k+03XqIQCjwMZKsuVrjo2u8d8eWqbdN7KSt0
 H5hlaTMpNgfpjDbuFR+y6I39Fncr4v38B8BEhYpKdyQHL9g5MdGpvRneXdiogrmpAcOgckJtQFE
 5W6gfvm+rK6QBxgxKmIMnp2o+CywQvCMpl1DqG4IQ8bBS0QTmXTfwbDmBJyclMN4iPbdDjmZTwv
 sVxJTUlSNw8hzsPN/NyiX3PnnJ9F4BUUqICOQxdQBM3wjtJQ7s9dOSq3lVvQ2i613sfI/nGzRaP
 6wh8WUJFptqDNbg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Dylan Van Assche <me@dylanvanassche.be>

SDM845-based Xiaomi POCOPHONE F1 has its own calibration files
for the WCN3990 WiFi/Bluetooth radio with the ath10k driver.
Add the calibration variant name to the DTS to reflect this to
allow using the calibration files from linux-firmware.

[David] Adjust the compatible as ath10k-calibration-variant is deprecated
Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 785006a15e979..ebcd01477f05d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -636,4 +636,7 @@ &wifi {
 	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
 	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
 	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
+
+	qcom,calibration-variant = "xiaomi_beryllium";
 };
+

-- 
2.51.0



