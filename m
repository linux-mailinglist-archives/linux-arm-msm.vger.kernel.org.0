Return-Path: <linux-arm-msm+bounces-61155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B6FAD7E7C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 00:37:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFE22175C55
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 22:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E6CA2E0B52;
	Thu, 12 Jun 2025 22:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hNF7raea"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91AC2DECBC;
	Thu, 12 Jun 2025 22:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749767849; cv=none; b=a8odFl4xc9E/SQG4i0YEnP6SFvBJVZU+ajLh36oacdA0kidYbkO2AaKTdiBxGZxOK6KA2vSj+MS3aWZ2LXPWXFz2pbHMDg/+lVpAvNWDQTgw9a4G+LH4t/BKsSWZ0T8MGcK/o93nsYq3tSzNL6Jb9Cb8TEH5C6pwXuZBtstgwLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749767849; c=relaxed/simple;
	bh=BuGkE3E1AEr1z3MC3ft91Kq0SflMY1/y45MNOn4L5EE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qqihotycpg4jfRHvrdRCUJH9qDP6OSoGlwuFSPYirbRmNInznnJ/83l3gaH1ObjT+VRgV940+99VsnI5IOLnoAtBhpD62hPV490DTjOGVS3rb4FoSbSyFs2Af5H6uHGbHJMS86JDd34ATJqm2mPk2mxUq/lxVZOdbdY95tYPMJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hNF7raea; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9504BC4CEF3;
	Thu, 12 Jun 2025 22:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749767848;
	bh=BuGkE3E1AEr1z3MC3ft91Kq0SflMY1/y45MNOn4L5EE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hNF7raeaCWvF6Box6UEZTfzpGtZnLy8JPm8KWQLZyp4rOpPoEZmQgG0f6qaMCVKPV
	 ppSQgJCsW5qmSR6MIU3BccdnLcKSNV1ZmV93XQu2q8kwputNEHatqfL7Sbvaa216AZ
	 Fq/OkevG+HjJn0tGy5MnF9ShPBLbIesBqTzjOidYgsmE0kj/sWuCGZTetIARyQePYY
	 vLPcoaHL7rgUk9eSkB8/XhP5zU5ihBkkZHZ3gUDcem59kpj+mZJFk5QKgjU/vpjxIn
	 qZIfSgtqdtH2sjipYWeKmjbE55bHtVh4+oFSMLCQMkR9l0zW7DeBM5/1UfRZk1aYDr
	 PLNhygKB/ktJg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DBA7C71136;
	Thu, 12 Jun 2025 22:37:28 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Fri, 13 Jun 2025 00:37:19 +0200
Subject: [PATCH 2/3] dt-bindings: arm: qcom: Add MSM8976 BQ Aquaris X5 Plus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250613-bqx5plus-v1-2-2bc2d43707a6@apitzsch.eu>
References: <20250613-bqx5plus-v1-0-2bc2d43707a6@apitzsch.eu>
In-Reply-To: <20250613-bqx5plus-v1-0-2bc2d43707a6@apitzsch.eu>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749767846; l=847;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=dI/0IRSIfadPPMn3LJmHpD092PxglhBVPQzVyv8YEEE=;
 b=I82Gh36khmxYNrTuS6PT/iGlLKgaTfX57Ix/fUoJGQLE1VLziLlsUD51oRj1ewFWfec22oVGo
 qzstKUOGWY4CWKwElpz0eIwBljlbjzeEmLgZH8/gHEBivbi9h45QUyv
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

BQ Aquaris X5 Plus (Longcheer L9360) is a smartphone based on MSM8976
SoC.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 56f78f0f3803fedcb6422efd6adec3bbc81c2e03..1ca79192590f9e55de53d7fc7fe51c1b9a4a77bc 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -230,6 +230,11 @@ properties:
           - const: qcom,msm8974pro
           - const: qcom,msm8974
 
+      - items:
+          - enum:
+              - longcheer,l9360
+          - const: qcom,msm8976
+
       - items:
           - enum:
               - acer,a1-724

-- 
2.49.0



