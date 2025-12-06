Return-Path: <linux-arm-msm+bounces-84590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BD6CAAB62
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 18:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA5D4304DA35
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 17:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4715F284B4F;
	Sat,  6 Dec 2025 17:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rEVJDrqc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17ABF35966;
	Sat,  6 Dec 2025 17:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765043146; cv=none; b=KIc+fUFbj2UABLh9NILmJuPxGeYXmy89afrE1tkXouIPnqm7iUAIATBK1MUHSwvkSm+HnvhwwsllHjh41GTiVjEJXf4PHeZ/PhuVtGL6omEetAPxbMOXvHur9rYsA9gAgD50tx4hIF7Ot8O1waxCsLEKUTI2psGwERiGgQxXUcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765043146; c=relaxed/simple;
	bh=nFrCJhn7CB/C2Mdoy6VRhcZxWTSqKHS0XDSF/I+axS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XSB31lHthMBYinIupguaSktEOvK9xk4zVt0CZR6iQDO+PxkzaMB0SERrAAAmLQFJYHmja8QhyC6LUV6kxR3GzFtP6kZwoA5XtZRTCJM2IiF86vM7Z5+jmG/xcHcUT2tYlfNt3uFFpMV3mPh03UByUv1S5cdXnhxrxUIh9NBR4Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rEVJDrqc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD047C116D0;
	Sat,  6 Dec 2025 17:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765043145;
	bh=nFrCJhn7CB/C2Mdoy6VRhcZxWTSqKHS0XDSF/I+axS0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rEVJDrqcQznUMxdcpyxeWS0HjNlkvQmZ5c8xAGB39S1Xct1Q+y00kgDq0Wudx/XJj
	 Ag2s0/2EexcEEEuQoy64xYB+a7u6EWKzfLcVsknj38bX3LyOq8sp44yJ/ZpsJgLFiA
	 PEsTEaxbHlfVedxJjef61mkDIx6Xl5wpoaV4WoVKfIM2GOI2Tl/oEYUXQqiq0ctDlW
	 FQpeyhZyHhiK/ZtLil9zgcPJZ60WYpm9etZvptrXDGVubCuql2NI6LWlxN+7JMlkel
	 D5TX3krdLw20cd4W6/LTVxa7YblYXTMllAcGeV/MDPrqTkz2PhPsA4GA5zvvSbt84j
	 k/kPNB1hd0afg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D886D3B7DA;
	Sat,  6 Dec 2025 17:45:45 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 06 Dec 2025 18:45:42 +0100
Subject: [PATCH 1/2] arm64: qcom: sdm845-oneplus-enchilada: Sort nodes
 alphabetically
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251206-sdm845-oneplus-fb-v1-1-19b666b27d6e@ixit.cz>
References: <20251206-sdm845-oneplus-fb-v1-0-19b666b27d6e@ixit.cz>
In-Reply-To: <20251206-sdm845-oneplus-fb-v1-0-19b666b27d6e@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sam Day <me@samcday.com>, 
 David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=853; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=f8AylPAfQwJYowskjfPG4hRtNdzKdwuU2ot2JsiEcNI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpNGvINIeTkY909kEAv2eAgp3zDkd3W7HQzp2EL
 gUtlwEfgQ6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTRryAAKCRBgAj/E00kg
 cm71EACjsfWlNkz/6eqQ8MTgVoRUzImvKTFKyu0w3zFj0gyysYiJdYICh7zQO5MUfdN/GqAxne2
 HKRvQGbUoRTm8ZRyEJskESRwIhkfV7S5JDg3VEsOmZEppgbUOUDYHnNXQsOmhCf2SkR+QKxfKmA
 VZH9WZZiO8PCEDtgVsV3Y3DpiTAc1wdTG7GpKA55L9sS/EFeoj+ph1VmV/DdvA9OcsXyhocNHjL
 FKjJyb2OvKA0dvRSUjS+8edVbuPhJRBRrYO5N+J2z0km5vRLJS5jccVwoEwmLKHyqcyjmPh0fzn
 4NUxvNrbr5p8PX7jLh+qX4knSaLuvqjo/m/Szfi3OK6DWnzD2D8w7zLlUTChI4fbmDx0IWTRGXs
 O6bRABrGcqdUqaSIqNwmGCZ+8YATMIJffuEDGRY8rk1JrYzfKtWiB1Hty9HZdZnvYvSJW5dfotM
 jSC0Xp+yBkBY5cRrlcwDyOWMyxyA7S2cxjHJ8Rip6Y5g7CTNbsmHnMFBjIotoxrq73PGrT+41Yr
 zNHEru66UmfFm3J9LMUXlmWbuKA3saSifDo86SMzgXy/Z+CdzlrOMHd2/oBRjZz/F2VUq7KpU2Z
 kTZWRHlb/5kpq4FC3dpPaKFyUfwiMp8CXBHKyp6174S/6GokMH3/NeL46PlLdP6xQlR0bDuBsP9
 TFEE9ghggXMZNLw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Sort the nodes by alphabet, no functional changes.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
index 8aead6dc25e00..c6b1edea2809d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
@@ -30,16 +30,16 @@ battery: battery {
 	};
 };
 
+&bq27441_fg {
+	monitored-battery = <&battery>;
+};
+
 &display_panel {
 	compatible = "samsung,sofef00-ams628nw01", "samsung,sofef00";
 
 	status = "okay";
 };
 
-&bq27441_fg {
-	monitored-battery = <&battery>;
-};
-
 &i2c4 {
 	status = "okay";
 

-- 
2.51.0



