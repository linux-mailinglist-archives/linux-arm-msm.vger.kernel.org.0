Return-Path: <linux-arm-msm+bounces-53791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C467A83E11
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 11:14:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1307C7A7082
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 09:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9B920E319;
	Thu, 10 Apr 2025 09:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t/FM43oT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420D420C48F;
	Thu, 10 Apr 2025 09:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744276410; cv=none; b=Iu4LvPE4pj6x0VWpqD+HOwSEXv2JDra7bIi8GqcZmMXhEmaaGfcC5HczddNPXuJPf6zFd8DmuigpYFk2IZJFDpLTtjD1o4n9Zq1Lsu7108brSJ0hiGy7t3lmoFwaaU1ntud/lyDu9+neDIjPyWH80pWnInl0JijIXD7UZP68eAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744276410; c=relaxed/simple;
	bh=AXP6ZybTNz6OQVvcYVObzg0VC4+1HCbi48kMRIDfj1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tc14IEewmahd1I/yHwEaIfBRqI0AJDq8Qay11wT2WW6i7jKik8IiY7RXS4QMsIafXzpeauvlpTpHyKoQdfjAHQzxvn3f3nVumSOS/Wq4/23jxRLjtgMzcG9lJp7iPmVWKhK/61EsnAruWVl/leMkfmlXVAQq871EzITdaKs0dYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t/FM43oT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5610C4CEE3;
	Thu, 10 Apr 2025 09:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744276409;
	bh=AXP6ZybTNz6OQVvcYVObzg0VC4+1HCbi48kMRIDfj1Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=t/FM43oTmCoFlsUnSDvnmeI4DVZDppj124zOlqPREU1zZEcVL6pUMkIOiB6pFwC/E
	 Rx2Nu1C3jytiRZQ5ocFg8dW3oMmIO1x9osFHPz+gkryUAlMV1qetGII5AikUSl5tJd
	 4I8ekzq8bRcrxJKxR6fdny8XiaTbrmrpPl8fh5jEPQCxJV+z1T/8NQonYvIsUbztyj
	 /FjaQcz1ioEr+Bi8S6cZePvcYIwwOqfSc1EKzpnthNMwbRFTpyHn6OCNXfhJsnJA80
	 1BlK/f+8lkwWi4Lo3pACmLX4iJVoxeBs0ic8RkK6NGUaIbwuAKcf4Vr9TNuNUxpjto
	 o/hVgSv7z3itg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8531C369A6;
	Thu, 10 Apr 2025 09:13:29 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Thu, 10 Apr 2025 11:13:24 +0200
Subject: [PATCH 3/5] arm64: dts: qcom: x1e80100-hp-x14: remove unused i2c
 buses
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-hp-x14-v1-3-b4e5ca253ec9@oldschoolsolutions.biz>
References: <20250410-hp-x14-v1-0-b4e5ca253ec9@oldschoolsolutions.biz>
In-Reply-To: <20250410-hp-x14-v1-0-b4e5ca253ec9@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744276408; l=1346;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=ZyHx8tpkezT4PWqlyK3kuVMpZWcGl8TKWIo9oNbQYXE=;
 b=QKkUpIEiU7wG4p4KIn6bZqrOERBiKX+NtdKiIFBrLYEkMuhgKIW1dj5MoINsX8sbAha/RXb1A
 BLW1SISp1gnBn+IuONVfH5I6ZbLhkzzT0UZFMgB4ll6YHJd9B13GufJ
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



