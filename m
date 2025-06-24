Return-Path: <linux-arm-msm+bounces-62119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F00DAAE57E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 01:20:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E21353BCB67
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 23:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E097C22CBFE;
	Mon, 23 Jun 2025 23:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AnEsRaV+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A718122A808;
	Mon, 23 Jun 2025 23:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750720817; cv=none; b=Z2anNz+zvSWX6BJpbMg1dg5/3P5JX7Pxi5JOdNe1fw92WHN3WnJuxQJT9JqNBPChHbgsBC6BZ/3bqjSE3tWBJhPSuQf2iaRVgUbAFJNex7qtdDAuAc6nfV3EMRcc3Imn4QZ3VMwAU06/UB+Vprj/VlL5LD0sUvVvkp0DUR8/Dlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750720817; c=relaxed/simple;
	bh=LUlA/DiEIN/Tu/zhjXQCHb0b8RxKqKzkaIf2xrKvops=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=StZtYgfkRK3ap2k41PCl40J7oRna6Cpn4D13IoZAdRj/Wjuky/mFqjJ2E2LlD/KUhqOnd4flbRKjjyL+HzW1bagPyxiuwmhJeiN5L+ORlg5vT7y8R1zuXR3BbqgEEj8KoHQ88RpiC7Jb2ojFout3QJdA2ZQ6IcLQN0MaOLlwvIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AnEsRaV+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E6CDC4CEEF;
	Mon, 23 Jun 2025 23:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750720817;
	bh=LUlA/DiEIN/Tu/zhjXQCHb0b8RxKqKzkaIf2xrKvops=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AnEsRaV+48Mxv0CZw1IImjUyN10G91XBwS7sw75Jb6f62DcGJv7ulWK086Csk5cQ9
	 nPAZfolumaU+dKriMDeHnJav5BA4vHIx2xdDsNDtwsRG0ZFfkWmfQgGldN5zupBGrN
	 O8d9JzqLLUEd+iwyX8Q/vFrM/B3Vm/+9CjpCquSwriuc8giL3OlTkw7W/KhuPIX477
	 MlCP6oEpMTDAVEvu87aFW580YScNzVEG9/60u80fTKLCLhT9gMJQTy7QeHhPxBPZr8
	 op2GQeApKFZAE9a0M/6B8XtdMTe/74DDD4lgZ5rmLCK+0BgNIeqWS3efi7RbYG/ojs
	 o1t3Qy6IO6ntg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C857C7EE30;
	Mon, 23 Jun 2025 23:20:17 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Tue, 24 Jun 2025 03:20:06 +0200
Subject: [PATCH v2 2/3] dt-bindings: arm: qcom: Add Billion Capture+
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-rimob-initial-devicetree-v2-2-34f6045ebc30@protonmail.com>
References: <20250624-rimob-initial-devicetree-v2-0-34f6045ebc30@protonmail.com>
In-Reply-To: <20250624-rimob-initial-devicetree-v2-0-34f6045ebc30@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750728014; l=793;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=rX9AadKtpX+eNxD3sjDhJeQkUeOFBglGYJMKRi4cNf8=;
 b=GBHhvDIR3yaCru3eUZ9eyUoF3NE+9Z0bHd+wdPwQzpMG7LKuZYcIJqHSL/XMavr7GygyD9VOb
 AyYV29f0fqvAkN0OJIdpwlzU0ek1LR025cL93OHcQE4nDTVwWc+d4po
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
Reply-To: cristian_ci@protonmail.com

From: Cristian Cozzolino <cristian_ci@protonmail.com>

Billion Capture+ (flipkart,rimob) is a smartphone based on Qualcomm
Snapdragon 625 (MSM8953).

Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 618a87693ac1dc32b40a2201bc219a4f12e9f3e8..dbe605557af82c2382702011276e920ea18d3bb8 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -274,6 +274,7 @@ properties:
 
       - items:
           - enum:
+              - flipkart,rimob
               - motorola,potter
               - xiaomi,daisy
               - xiaomi,mido

-- 
2.49.0



