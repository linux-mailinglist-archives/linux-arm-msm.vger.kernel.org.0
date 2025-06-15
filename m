Return-Path: <linux-arm-msm+bounces-61332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4F7ADA399
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jun 2025 22:36:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0486F18903B7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jun 2025 20:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60A99280315;
	Sun, 15 Jun 2025 20:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EIEMXVYj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2774127FB31;
	Sun, 15 Jun 2025 20:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750019750; cv=none; b=vDs/s2B+FDnCIhK+U5CzLqwgZ16Q8DFJhOWROD54ownvDcmh5qRLlpE/NCTVFyHAAY3sRJRPJlp9auJgAcKyAaC9XscwqTskt/dCP7ESsodD8F3qVbfVKbhaXvynS/IgO/4bew8dURLUSso7v8FZBcWVUFiEidJIneiCS+Z1OS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750019750; c=relaxed/simple;
	bh=BuGkE3E1AEr1z3MC3ft91Kq0SflMY1/y45MNOn4L5EE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fw4C1/6f636AotGMKq6jDPX7u75O/KWET5zgsF1bFpuqMxAkrbgX9cdtQgE8Hqf6u8+CoFb3wO/Hl6djRxSqepU9MDCGgvB2O6hiFv6q+2bY2sK/g0z+DH9Q3DMEYHQ+rknSElucflb4/AP0bP9eiOZdz2Mf27O3l4egmoAmSHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EIEMXVYj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8DDE4C4CEF6;
	Sun, 15 Jun 2025 20:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750019749;
	bh=BuGkE3E1AEr1z3MC3ft91Kq0SflMY1/y45MNOn4L5EE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EIEMXVYj+6c9f1dyRx6B7LCIkgn0KIONCmKii9UfpKEKl1O9oy/RXuipIo2e498Dm
	 HMCIzDq2A6Ht/kYhCCUcKH7yod+faRc5MG232n9asO8TbRG6nxbhPRquiaCnkbj8Io
	 PZoWTGAbyM4dhYTAbPgZS3n78LqkN0mG7ucZBycqoQIuicQYe5eWE+f/7K2WBOuiBp
	 rr9sFwLGUhXzfp2uJ+B9fCHpn44XBPVLPD7e1ZbUmAT4kIrKyVtKmpIa8scqLfjWEc
	 IGKEcxMfGcynfjaISJBaBtHfvsK2UlZAH8ovQ1lR5rPLGIUdkdjgO/RqtQFc0WWls9
	 xNS0lxqkL211A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A4AEC71155;
	Sun, 15 Jun 2025 20:35:49 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sun, 15 Jun 2025 22:35:04 +0200
Subject: [PATCH v2 2/4] dt-bindings: arm: qcom: Add MSM8976 BQ Aquaris X5
 Plus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250615-bqx5plus-v2-2-72b45c84237d@apitzsch.eu>
References: <20250615-bqx5plus-v2-0-72b45c84237d@apitzsch.eu>
In-Reply-To: <20250615-bqx5plus-v2-0-72b45c84237d@apitzsch.eu>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750019747; l=847;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=dI/0IRSIfadPPMn3LJmHpD092PxglhBVPQzVyv8YEEE=;
 b=0VBUKn+9rVlZx6PgT7UUtdMVOT/rdaBSzSdQDw04Ik9164kVYxwT6yl1VceC7Cur6Mh5MzElF
 r+GLLX4dJo4CYxajtuOw0whij7NJaOh0QV9IgPQL+XvWyxnlHhTO8dQ
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



