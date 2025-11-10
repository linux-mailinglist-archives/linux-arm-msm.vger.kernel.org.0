Return-Path: <linux-arm-msm+bounces-81057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DB1C47B2A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 16:54:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BDE23BC2DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 15:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE5C53191B7;
	Mon, 10 Nov 2025 15:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQ1ag7vS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19F43176E6;
	Mon, 10 Nov 2025 15:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762789067; cv=none; b=pwWyuFgaYzA2cozY3peRxal6gUjudC8lKrSNK/+aef6u1Hr4jf2fXfW411rbeU+psu8srz3VYaDSR5gbU4poH0qAoaojTN/hbo/CFq3c2tGQl7G6nrSltOTOqHUtIl1ziguUyD8RnnVYjYEhp5HK72O3XTa0LNcLY81AbKaDeQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762789067; c=relaxed/simple;
	bh=Fkrf0PWHRhMxsfnqBcmvgEgsGPSljsGG2OXkL7VLir8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aoXpXOQyBb6Sno+QEmvY67SvK5Iw7ZIV4SOKLSWFMgcxm9VCybIoSI+vnXrqlxAhlF4OlQ7bQk7q6NgGD73r+ZMr3ojcMy7yYl0/ikBcvSj8BRUBbzsUlY4K7B2tuQkRQInNrzWZhw+3xGPehMsm5+DgQXY7xBR2A1nn1MfM5ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQ1ag7vS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5CC17C19425;
	Mon, 10 Nov 2025 15:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762789067;
	bh=Fkrf0PWHRhMxsfnqBcmvgEgsGPSljsGG2OXkL7VLir8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dQ1ag7vSqAzLWo2G4xlv1ixp7gsiaWIyN+a21MnnGjhN/kXbPkKS3dnNyoFRM9Xzp
	 vJZKKqa+j+9yFHjhFnAMjSRuRT70XRLcKY8aQR5E6d3FmauZ6rD6dd+PYhTlW6sUAx
	 PLo2sY8Efol0yBY578iqQBE5krGkdbpJVRMnNt6J6SLJVDD5oQlyz7UFWpPo1rZLnC
	 lWTaag9TpKk87DmeslRXXux5Hl4EU4WHTqHBIvfRe0qSor4dgQAqiMJfVd15feKyh4
	 BCnqFqVS5xOLXDkfZNgS7BjunSYyULQNtwndbSZ62ZL55QYRa+Im/VPujkD5UC66L0
	 Fn/sPeFMq9GLQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50972CD13D2;
	Mon, 10 Nov 2025 15:37:47 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 10 Nov 2025 16:37:48 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: sdm845-shift-axolotl: Add ath10k
 calibration variant
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-sdm845-calibration-variants-v1-3-2c536ada77c2@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1017; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=NFlBpnPvvQv4gFu7fKwiLMSzZXMqQk9CkNwxThzgmB0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpEgbKmTImf9MgJ76yKNIEDZ4YVhpk2S1bgqqGc
 FiWfWc4i/CJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRIGygAKCRBgAj/E00kg
 cgT/D/9INaLxQeMVxyCU7OkDIVPZsT1+GxivrO5PLlvaSsr51iMfu0sNf4N5HsrtIo1iwWoo8kV
 kBp4ELPhF09ZofT1El1ZBB/7gh6SZsDpOaGpDuZATSbS3OlA9iJpDDW99UZAqlgS+jxWmpnaZkq
 zml1bjNM9cV1YWcUlS59+BALKrbWI4hAQUwTMeo/oqiYJOHX4/1iQRYnqIOKZCYzyx6iRMnwoVJ
 yLyY7QMKad2cruPO5VFfQTw/CC2nptTtAgu72EK4V1/L5LRaabkg0vPLE1STjEoRnv4k1oensGO
 +evcibZEqfatXs2DGCmXabxE5/XRh7hXhJZNhurWtyug63DCrbKzpsvV88YOCLQL6HgyB/Kag+X
 h1KwzKMD2MsuTbyB78dCFpC9pAJFIhZ5H7ALQmrcNcIhxAj00MZaYU57rP6tQ7cXU1n2hR+5794
 pNk4jXsozzKh+cAODdiK/j4jW3XtG4JWRNiV1kmCZXeKp3QD3XLIz0bC7hJth0Qz2glStAD9/pF
 V6KHYr/VaJUnnuASiRztedBabuNvuNctoZYwDJMhKQMiILkuh3R55bhjj+yPh2Rn7lSn9Qc/0wn
 Mtu8wS2Rj9qnf+96S5ShqbUYgqp5XTSC7R5pV7qKdBEC6iXctQQziUfMjQlf2DGPERd8xdQg+mq
 YGy5xxv5NSZly7Q==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Dylan Van Assche <me@dylanvanassche.be>

SDM845-based SHIFTPHONES SHIFT6mq has its own calibration files
for the WCN3990 WiFi/Bluetooth radio with the ath10k driver.
Add the calibration variant name to the DTS to reflect this to
allow using the calibration files from linux-firmware.

[David] Adjust the compatible as ath10k-calibration-variant is deprecated
Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index ddc2b3ca3bc57..7aae5edfec26d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -740,5 +740,6 @@ &wifi {
 	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
 	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
 
+	qcom,calibration-variant = "shift_axolotl";
 	qcom,snoc-host-cap-8bit-quirk;
 };

-- 
2.51.0



