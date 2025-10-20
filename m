Return-Path: <linux-arm-msm+bounces-77944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D52BABEF6D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 08:11:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48C801897358
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 06:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC912D47F1;
	Mon, 20 Oct 2025 06:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ehB02E5P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA492D3EFC
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 06:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760940639; cv=none; b=EDtHTPAHy2QPkDdkUGX/KmjKIeooi9KLH9OmJO/4pEsYLfUKx7tnGEB3e9c5Q42Dlc62jLMpHZ6H3zEfo1a22Opfq+i5bI6Cz46H0Xr5FrsTjSY7Q6ILkSmlLEo3ctds3u1/Xi11kHE+fGC3UpJfjLpsvTSt76N5Hulorbnr4ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760940639; c=relaxed/simple;
	bh=3p1M9r8Ct679RdWEhfdTfbQqtkv5MWTUo32xa1uKPOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rdo4w8Vpuh2dBDqzhcC6Avg8jxXSkn9Se1ULFxvwDIexKyCe/pdL0pyq9zjihnxcIumyraoVI7AjkWBHQ6HG0BSukRbwUpOQusftgZvaBb8eYgF5Do5/N22LK36BRqoYg+oWTcICyC8QsAi6+9LmbWfdQ5vlKoZXvckGQ4B6bfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ehB02E5P; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=2C24+433wJtYbqrC7tIADzE03jy5ELDw2JdjoUreqCc=; b=ehB02E
	5P7dJBqZ0m+irgllkfMmPaMcYPcKIQDB4SrTrKlEfxfyi/GpjyVUDWhP5l7VaDbH
	eD7uP/U2tcaozD956oSY+HGnpJwn1JyX0CPaSoQZJOo627veg+BdVdZuv8316nyY
	jhlflxUaz2/YwvZoxgSJ1It9EtO0O2MvD/8YPKV4Vm3xFs9BKvXLvTCe7kKiQ7tB
	2rjrUzsrAEOM6ivC3bb0LpJHGUtyKGS87IRNJ8g5MJhkxnWSSxD8skB1JWTTNSIr
	8yuZs+cNBkPs75iPtIcn7grRCpEcjF9qvfavjr8FmdH7+KXJXtGkFgbdnLYxi53P
	OcV+CR4VRMk7WQ4A==
Received: (qmail 941062 invoked from network); 20 Oct 2025 08:10:28 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Oct 2025 08:10:28 +0200
X-UD-Smtp-Session: l3s3148p1@HuOe8JBBNoggAwDNf0fPAEuMhp6AgTGK
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: devicetree@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 3/4] ASoC: dt-bindings: don't check node names
Date: Mon, 20 Oct 2025 08:09:52 +0200
Message-ID: <20251020060951.30776-9-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251020060951.30776-6-wsa+renesas@sang-engineering.com>
References: <20251020060951.30776-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Node names are already and properly checked by the core schema. No need
to do it again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
I'd suggest to give subsystems some time to pick this patch before
Rob applies it?

 Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
index a65b1d1d5fdd..3a7334e41fd6 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
@@ -132,7 +132,7 @@ properties:
     $ref: /schemas/gpio/qcom,wcd934x-gpio.yaml#
 
 patternProperties:
-  "^.*@[0-9a-f]+$":
+  "@[0-9a-f]+$":
     type: object
     additionalProperties: true
     description: |
-- 
2.47.2


