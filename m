Return-Path: <linux-arm-msm+bounces-53812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D73A8403F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 12:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39B35189EC9B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 10:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D05926B95B;
	Thu, 10 Apr 2025 10:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kMwS5pNg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605A026B082;
	Thu, 10 Apr 2025 10:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744279683; cv=none; b=RjvoNIlxvHzJdVEIjgx8tP2ZiIHilRPTmRKa1lyMJQ17iiom+8orTtn5ri118a1FlBrrqyAHipfWeOhuPxav6l4S3/BIYuoob6pjA0vA616FZbK8H/S5S/mZQ1MyFc4cEN27bxscUfrmw03m0vOiVY/+vpyVhFVPgFXuc2VZBrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744279683; c=relaxed/simple;
	bh=AXP6ZybTNz6OQVvcYVObzg0VC4+1HCbi48kMRIDfj1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XS6XUEQ+ZrOh3fvAdwFHGjkMNcsvVFoYdOqWKv/QGfJ0ZXXv3nLfkRVUh0GEfX6xDiqxcAKiXTslOKiCUElmknITJNn6BS68Q8xi/IUPb8TCocXj4Fa9yAhxZLxvQz3ulwJ5YxtULnF8GuwA7VURMGhpJlDgq8UPHkxigt+a9AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kMwS5pNg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F02EDC4CEEC;
	Thu, 10 Apr 2025 10:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744279683;
	bh=AXP6ZybTNz6OQVvcYVObzg0VC4+1HCbi48kMRIDfj1Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kMwS5pNga7h4wxKXUY3+qz3K+9rS9tiAWqAtxIEEcVgBQmUBs6GT1wrq1MNll9pom
	 zy/WUh6fACBqJN0wm2IeYompM3Y28rRcgNBKxPYFwpIcekDozweLibtxDLhaXiIyko
	 LowzIZ+VNIEZa2qvo+suPig7QrJebniqa1gr6U3NNqTauUJnNwztbuPyahZn44elZP
	 GiL7xDn8V/9kKxOrD+FbDganygkinMepVuZxN1wZhkUSWe+L4NorItJJGkK4qI8rAt
	 I6vPMVE3Wf9LT2dZ93l3bdZYIeTjRr9rRo1jhPe38aF57yHnE+mGwxNeuIWl63C4H7
	 Ns25I4FRKU2vw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A22C369A8;
	Thu, 10 Apr 2025 10:08:02 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Thu, 10 Apr 2025 12:07:29 +0200
Subject: [PATCH v2 2/3] arm64: dts: qcom: x1e80100-hp-x14: remove unused
 i2c buses
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-hp-x14-v2-2-d36414704a0a@oldschoolsolutions.biz>
References: <20250410-hp-x14-v2-0-d36414704a0a@oldschoolsolutions.biz>
In-Reply-To: <20250410-hp-x14-v2-0-d36414704a0a@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744279681; l=1346;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=ZyHx8tpkezT4PWqlyK3kuVMpZWcGl8TKWIo9oNbQYXE=;
 b=D758D0QxXhHhG79neF4c/1QKsPkT1M2ln7uW3IK/IEHVTWDOJdE4obhp2pTeW9z5575I+WhsB
 F1YVh6NG5zADoAsSjT9QAhybXlCqe5wK58knK80SxbwQwor1FSYIGp/
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
index 582d4326d5d527d20f99e716349ea0e9c0d35099..6c0e56168eaf133b9500c32b98821fa1fc3e7a2d 100644
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



