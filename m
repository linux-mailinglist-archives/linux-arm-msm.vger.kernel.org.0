Return-Path: <linux-arm-msm+bounces-60849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C2BAD40D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 19:31:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D37C17AE32
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 17:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A112B24729C;
	Tue, 10 Jun 2025 17:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XrBXa/Ef"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751A7245008;
	Tue, 10 Jun 2025 17:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749576341; cv=none; b=hWedkKrjYzFG8qibwjM+UhftaFRKiwePT7TSv5m9XpO8skc2BC+RmUd3ArZy2CU5mVbefaHg6jjYzdVxJVaA2FxWklVFtwU2sVFg69D5T3bh1ZDNhU9P67ZVaSq/O5LEqGDqkwARbd63YrdRWkKK1ItW5ZDSpyVilS6HISUyi/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749576341; c=relaxed/simple;
	bh=TLKKCys6ZP/hE1CmBzE5Q3b3bHy9Tht350M4Sa30kqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UTpH1Vl/FOuXkz9BCfhtxn6IpuvW00MSqK6Pkqwmyr+rfIya5Omj83PVyXC88g16jKaDfMrBO3iW2ycnG4Xa0CcJ1S2DW0C1cfpQZhn4Op2lqhsT8ZHGwsBvrHGCAdqLbG3LabkL4vlktGvhZTuWAsQlzjhQudZeJm4TJhfzBYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XrBXa/Ef; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 369CEC4CEF6;
	Tue, 10 Jun 2025 17:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749576341;
	bh=TLKKCys6ZP/hE1CmBzE5Q3b3bHy9Tht350M4Sa30kqI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XrBXa/EfTr8Q2icKyHruWxvHvEfbmHGwN2vAnlxeO0vJ7Wh5GTyHplBjKweW+jWjf
	 N5BvRE37gdcZk6jGo7WjErrwrBeVH5VpxmCvj3xYPZXudsAvSPcl5Y2AuRu1Xfy8v+
	 +SruNBRLuvOKoGhVrQkKdXk5CrVwhiRZpvfthFYquQFPyzi/c1/NqFCy/3DpzE+NJr
	 cHp4qXKld8uYF+52gkA21B2mEFS0LExPHhPBir07GcGQCLMlSytUhDLgcdOu9wbrv4
	 WP1btyPQzvv+Qcz3dP37R2FxpBOwLeXJovhX/mdw85ugaVDK5qpUNpjEAgQmi3hKAx
	 LWfAjEhsUh4qA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B90C71131;
	Tue, 10 Jun 2025 17:25:41 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Tue, 10 Jun 2025 19:25:41 +0200
Subject: [PATCH v3 3/3] arm64: dts: qcom: x1e80100-hp-x14: amend order of
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-hp-x14-v3-3-35d5b50efae0@oldschoolsolutions.biz>
References: <20250610-hp-x14-v3-0-35d5b50efae0@oldschoolsolutions.biz>
In-Reply-To: <20250610-hp-x14-v3-0-35d5b50efae0@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749576339; l=1222;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=dzrW5h8pJ8/2hv2ut9pqkEtS5SFQ8Go1URDVD/Cy3k8=;
 b=hEBRh0gq01ab5O2lESzPy6g7gHcF4XGYGcJh8IpddSjdJZM5FLzbokfqvJjH3fO95iyFBOY0d
 WNjy823F8qOD1SwCWoQKHLjL6T/goaLa37x2N+8B7Y0CGEmBYI3A/Ml
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

amend the order of pmk8550_* nodes afte pmc8380_*

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
index 3071ed8e192616be797d30d72c21d56b72afc608..8d2a9b7f4730783bbaa81e488a0e99cc195a195f 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
@@ -1195,17 +1195,6 @@ edp_bl_reg_en: edp-bl-reg-en-state {
 
 };
 
-&pmk8550_gpios {
-	edp_bl_pwm: edp-bl-pwm-state {
-		pins = "gpio5";
-		function = "func3";
-	};
-};
-
-&pmk8550_pwm {
-	status = "okay";
-};
-
 &pmc8380_5_gpios {
 	usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
 		pins = "gpio8";
@@ -1217,6 +1206,17 @@ usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
 	};
 };
 
+&pmk8550_gpios {
+	edp_bl_pwm: edp-bl-pwm-state {
+		pins = "gpio5";
+		function = "func3";
+	};
+};
+
+&pmk8550_pwm {
+	status = "okay";
+};
+
 &qupv3_0 {
 	status = "okay";
 };

-- 
2.48.1



