Return-Path: <linux-arm-msm+bounces-81691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACDDC59668
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 19:14:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3B6674F3090
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 17:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4DD35970C;
	Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sqBgScq2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C673590D2;
	Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763056663; cv=none; b=u2o/cQqFM+agqpCz0uk+XlBAfbdFfCtHFNmYj6wzBG6yrMQbvfw+SiqBF5+YTwhN6eEA8hpyuVGQ+6ckoB75lizcXggH7lz5R6TIYDZ0w9XNMEyV647nhQYjfYAiVOJQXb7GajvWpn5P+1QfCcWvE2G4nwg0SGQvHNHttosznvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763056663; c=relaxed/simple;
	bh=RCFsjUix1XQ76jxISlR0S+cS2leVOmgzdskYmMSCvic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TuS2U5MmasaIQMjPwqcrrx9CkufGBgkyQ6rPIH2apXwk406Ml8MLB6exc+bMoOb7ET0S/3sJMbX7oSf4Jcx5+T/17hNrrvgGvVF5TnmbWrDYHkdPf2NkkFvZEa+qf2wxaDr76gHpE/4Eqo5r/W6u4sjEfOlAWbr2ERp/uaPG4uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sqBgScq2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3ED12C113D0;
	Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763056663;
	bh=RCFsjUix1XQ76jxISlR0S+cS2leVOmgzdskYmMSCvic=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sqBgScq29bnowgvQ38/PLeX6P2J3e7wicY1LCMI5OXYjPFa3I7X6z3xugLkXLvz+S
	 rYXWhFd3dV+Dn8EqfyE50RWl/1S9RoSXs7nuGHOaHaSgzlYcJJeObU4BCOainSy9yR
	 6lv09kIeQT3ERrmr4Q4RTwVy5NtsckfqvVzi3hWcTJewfFAu2IyzHsooSpXi9KkLtv
	 aCXnDr1oLvQNU35WiZ0reV/XaS6zdrAlD/UTuq0K5l6YjEbwylPSVwYM9KuVQ1lXub
	 M8WgZFHOVAK5mO7hh7TJu6MMdwxzYxVYm652bfFjhV4VMkM/ZsRzBQWLIQ5VqW048B
	 dMSGXtvm+ngPg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3271FCD8CAF;
	Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 13 Nov 2025 18:57:36 +0100
Subject: [PATCH v2 02/12] arch: arm64: qcom: sdm845-enchilada: Specify
 panel name within the compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-sofef00-rebuild-v2-2-e175053061ec@ixit.cz>
References: <20251113-sofef00-rebuild-v2-0-e175053061ec@ixit.cz>
In-Reply-To: <20251113-sofef00-rebuild-v2-0-e175053061ec@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=978; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=XdEJMzUlqHmVFvRkb119Ya6neFS+DHA5Y7GV7B5h8w4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpFhwUx5fxhZW3ru/k/CW3PaGg7zjqBNcd1dxuy
 WwS+gVUg/6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRYcFAAKCRBgAj/E00kg
 ciOeD/94fR70j8mcyMtewNc7kRaVyQ+Uf9kvO5pfU7PAvyoGj6eaIMNgCZmw5d3CuDkjm1LlqRN
 KANBySbzAKuH3t+0rayZBiMjWPV72E2PuqMRYKk1/JnD6W9+GGaX0boMH+WbgdQjOTIxfgwMAcT
 VNXfgmsksZcsX+UM4XJXXFb3HHvd8r0gR7U1Fvz+gzT7fDlAE790cSJOnQ2YC4xHNQbqLSED1te
 5aac+sYU2kkbfbLJ3IsTGqRuxhltvmzE8daMEkekpyBqnFJnvc1FWTdjz/mg7c8aPGOyYyyMv3N
 4D7HDbVEuZ1b8m3De/F9WT/p9LO2Tx7k2YmTQZZ8QvIO+mu0QydnW6BsWxoJpIXb2cUOvD2r442
 T1KeNz2tJaTIN2e5jDeJ9ci8OVIStlFtY2m0HY3N4Tir/zZsu9NNxamFO9OHjjVu25EdZU/HWEw
 f6fE81aL2NV7HJ/8hAuAzqacp5NXMij3PwWUk2RnzBVixtSsiux181tt4R0HTZhVozMLeX7165/
 3IYWscFVeLGMY3QOoDCm9YzGfUE1K03YcJMCOyQZAe29mVkIw8HkhMa/GdbEQW/V5vCfwaRqCAe
 6ZmfmZgsuUzmWaAS6k8qrrEJh0PszMU1CL19KmfjgmpaPbUR3V/h5ORHylvpOXki0dZqD5zKYvO
 IyDko+cwq5UXTvQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

sofef00 is name of the DDIC, it doesn't contain name of the panel used.
The DDIC is also paired with other panels, so make clear which panel is
used.

New device-tree will work with old driver as expected, due to secondary
compatible.

cosmetic: sort the node.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
index a259eb9d45ae0..8aead6dc25e00 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
@@ -31,9 +31,9 @@ battery: battery {
 };
 
 &display_panel {
-	status = "okay";
+	compatible = "samsung,sofef00-ams628nw01", "samsung,sofef00";
 
-	compatible = "samsung,sofef00";
+	status = "okay";
 };
 
 &bq27441_fg {

-- 
2.51.0



