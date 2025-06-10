Return-Path: <linux-arm-msm+bounces-60850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0FCAD40B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 19:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0EB67A488F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 17:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F052472B4;
	Tue, 10 Jun 2025 17:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QxGJvXxk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752232459C9;
	Tue, 10 Jun 2025 17:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749576341; cv=none; b=PzXzTC14voumjVob7xsDBRcYyDpsDWn12SodgLr2d5WJ6ZjVzqnMIg3qSAlsJVBYZwiEaGS0WECnP8aaJwmNLZ1iODaxGOVU8PnDrshHdzmYQM4JFcndNcLg3KiIbwfrkp8AvHMBvmHPQpA5TDkXbM2rCWCRivDtith6bOOHe8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749576341; c=relaxed/simple;
	bh=kQI052NsnfikjEDgGGZCroRmSPtFRi8pp/2Vix9BTug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UPICB9oaGDz1AH3e7ojIk1nJdTKw0318AF7UP4t8u66/7YCuRhbzsGPjiliz5hsCphfISTp5/OaIGkC4pLJNlydPwAkVqQVGn+LZPwh6phxjBXgKPVZUJOYVRnuXaEu0DokBdI3R2/MyKkTnVJe1yTNsN4ikQRCUoNpVfLXgTf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QxGJvXxk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29A19C4CEF0;
	Tue, 10 Jun 2025 17:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749576341;
	bh=kQI052NsnfikjEDgGGZCroRmSPtFRi8pp/2Vix9BTug=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QxGJvXxkbrLGgmxPfyL+C7YDJToChaEY2t7Q1aYzeI7wBgaqqq1Xz2z8y/r6KFe5Y
	 0YsGw/pkb074yCQbxQsOqZ6K1/9ML+JxPH3erzSYgHx7sv9V6CZcd9a7mAPgCOClvQ
	 0R8cjktV/4Ksc2v4t+hdoJlXx82JFvTl1P7RHb0T9avYQ653XKEgvZCXOAChc6McVA
	 XUbKg+GODrxkLrIwBt14QK2hp8a13KuqygS+21ociT/3XKnyWuevm65pFAe6LZ+NBs
	 Ng4NM4n1XZL7HMoyhiimWNLvfwmUx44MsMqcC2xr++wTRgSpjsW/7ysHrSCGBTF30o
	 UBn3ssxqx3dnA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C55C71132;
	Tue, 10 Jun 2025 17:25:41 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Tue, 10 Jun 2025 19:25:40 +0200
Subject: [PATCH v3 2/3] arm64: dts: qcom: x1e80100-hp-x14: remove unused
 i2c buses
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-hp-x14-v3-2-35d5b50efae0@oldschoolsolutions.biz>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749576339; l=1346;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=FrraMit7kX/Sh9yt5R1I+dfr8MoW4AAbzr7KGuQ4ucQ=;
 b=DSD+yr/fXemreL6i09UGOcsi7Pz8CB0N+AvSDzB+p5Af2+0mIemWlC0FYRYfIfu1AuqVKQA/Q
 EjypfNhZ25aDwiiJbv4VKoCJJVWzmS3jYcm3hYbzlD/Zy/ZfMWyqgms
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

At least from Linux, these buses are not in use. Remove them from the dt.

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     | 25 ----------------------
 1 file changed, 25 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
index 315987f2b62b818059cd1b5dbba28f908c58f00a..3071ed8e192616be797d30d72c21d56b72afc608 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
@@ -904,15 +904,6 @@ touchpad@15 {
 	};
 };
 
-&i2c1 {
-	clock-frequency = <400000>;
-
-	status = "okay";
-
-	/* type-c PS8830 Retimer #2 0x8 */
-	/* is active on Windows */
-};
-
 &i2c3 {
 	clock-frequency = <400000>;
 
@@ -970,14 +961,6 @@ retimer_ss0_con_sbu_out: endpoint {
 	};
 };
 
-&i2c4 {
-	clock-frequency = <400000>;
-
-	status = "okay";
-
-	/* is active on Windows */
-};
-
 &i2c5 {
 	clock-frequency = <400000>;
 	status = "okay";
@@ -1018,14 +1001,6 @@ touchscreen@10 {
 	};
 };
 
-&i2c9 {
-	clock-frequency = <400000>;
-
-	status = "okay";
-
-	/* is active on Windows */
-};
-
 &lpass_tlmm {
 	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
 		pins = "gpio12";

-- 
2.48.1



