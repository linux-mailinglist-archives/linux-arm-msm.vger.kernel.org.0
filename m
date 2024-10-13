Return-Path: <linux-arm-msm+bounces-34207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB9199B93E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Oct 2024 13:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 444AE1F213ED
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Oct 2024 11:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ECC213DB99;
	Sun, 13 Oct 2024 11:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FQVOz1nj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CD113AD2A;
	Sun, 13 Oct 2024 11:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728820458; cv=none; b=AD8rt+50H1JiQ33g+R0xvYqluvaJcI1zexJxpVHbYp+NzRhd/DLpqv7U5LJRqrbkPSoUFdd9wiDUkaL9/WIvoqZcIWoLe7bQplhCvwMl/LtBo8N9yDCJ1ha3BciH1tXrwVyY2NSJNMW+D4i0xMwQMbUPQi7FKvfWCgTZWqGP8A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728820458; c=relaxed/simple;
	bh=bB5RDp8LRq06SYA+1aEDuhhYu9ITwqH+z9v6kCN/GJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ja83k4jx2MbLyQ9AxE0ETBU0SYsWxChYJFtNek+vKxgVnPpmfISBSHyCimI4v3iwxePP7Qzw1diBANZMfSUMBZRowmFTQ6vkUBTaarxOK2cSJnxi6VrEsQQ8DxGCBpw3AN0sDtZJHOOaRCTCZkA/sv2sxPSXme02HQUX7lj0WHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FQVOz1nj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1B9FC4CECF;
	Sun, 13 Oct 2024 11:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728820458;
	bh=bB5RDp8LRq06SYA+1aEDuhhYu9ITwqH+z9v6kCN/GJQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FQVOz1njsGxC/K8VvSdJR9cxwqsq2WMBrcdDBzmtMmwKQImNQAW0mFwl36imUxAqr
	 S7NPWuJPAqBfzomqIBKbVWaflBCNQw8GI0eMTdjf02jtE2aw2wvA04iegVVkdSpGdb
	 gV3VhgmjSf26Z6xckNwqJkLWP2DaQFAzPh1cFxWAOunASg7AgaBNJL7InQ/4G6aHGr
	 a20g5E6wiunQlUdngDmd1oCLcf8k/5KkKGsM1b0bitAccXq45eFlvqOKo6FwdkVTgk
	 +HZMoQRs3ckIK6qM68BLdok1Nyt+gDL1OcD4tDotWYxgGY5PxCCI38a6E76cFoYCG1
	 dn0mVekHjTymA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B70CF2576;
	Sun, 13 Oct 2024 11:54:17 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sun, 13 Oct 2024 13:54:03 +0200
Subject: [PATCH v3 1/3] dt-bindings: arm: qcom: Add Microsoft Windows Dev
 Kit 2023
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241013-jg-blackrock-for-upstream-v3-1-839d3483a8e7@oldschoolsolutions.biz>
References: <20241013-jg-blackrock-for-upstream-v3-0-839d3483a8e7@oldschoolsolutions.biz>
In-Reply-To: <20241013-jg-blackrock-for-upstream-v3-0-839d3483a8e7@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Merck Hung <merckhung@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728820456; l=1029;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=IplL0shONZvDiTTnGoLL+Sj1NmoGENvTEN3itFDkMrA=;
 b=8fl/UPEy/W4r7SATjMMCoo/7ABk0fBShrNE0dZzD0e+zYzNztcO7Av+g/nd2GauFuhxvG8jGh
 v/XU062wlR/AQ2CXjNxhfyBwTopcKq30LzqrvCT0rJJx3dROaskJr+W
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Add compatible values for the Microsoft Windows Dev Kit (WDK2023)
with its codename "blackrock". The Dev kit is a small desktop box
based on the mainboard of the Surface pro 9 5G, intended for
developers to test/build arm64-based Windows software.
Link: https://learn.microsoft.com/en-us/windows/arm/dev-kit/

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 5de6290cd063a..8790c6ef768c7 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -822,6 +822,7 @@ properties:
           - enum:
               - lenovo,thinkpad-x13s
               - microsoft,arcata
+              - microsoft,blackrock
               - qcom,sc8280xp-crd
               - qcom,sc8280xp-qrd
           - const: qcom,sc8280xp

-- 
2.43.0



