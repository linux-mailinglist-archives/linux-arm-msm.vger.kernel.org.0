Return-Path: <linux-arm-msm+bounces-81963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7A4C612EC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 11:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD83F3B63FC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 10:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34CC29D26E;
	Sun, 16 Nov 2025 10:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GAhxUu+q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C50D29B8C7;
	Sun, 16 Nov 2025 10:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763290345; cv=none; b=PCM9XuH8dWoUW05VA7/K0hI9KlVm4Sv5kLxJ3VPB64PUOINgm/90NiZeO/f/T8H/yaNGit8z762+1+3TNUqXwIBYRncF7Zo+vUlG3xe6Zu44QrBnk2nL09vA3AUQ1sJ/wldkAmnid2ya2A5nSEMLhrHGC1vA6FSt+J82386xMw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763290345; c=relaxed/simple;
	bh=rPe4gyipcIF7HL0/VyaXz4O56VvUmhrk2PiF4giFqO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TJimftvR3r8EGlo69FwWaJijtNyZ+6iPruv21bKR6XcHBj7sdrC5o0gM0MONq32RX8ZuGtHpEsTKp6J7yqEfHOsSdcrWkaWScXOlJ3vhHubL4/MccLo+y4e48GIVBD1Z7F7MpgGw15Juqw8w6i92Pcs3SEdjSM58pSoNO1rtQBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GAhxUu+q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29D82C16AAE;
	Sun, 16 Nov 2025 10:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763290345;
	bh=rPe4gyipcIF7HL0/VyaXz4O56VvUmhrk2PiF4giFqO8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GAhxUu+qgwBkn21RjhUIzQk3Pepzp2ofUhPqwFY4VCg0U30pnR5flp3Igj4LEHRnF
	 LLtpSokPonzdggaIKjNOR9tAgac6On2jeW2TmkhJoNHj24tILOAY78BifIbL6cnhPj
	 OtniCiQQhYPiCZCo8S40al/fXXvbqDw+LpyTYYu1/cqWoVSy27Rrjnqe7DLP2T82sZ
	 JFuES7RMRiY4V1+lX3SksIfAVHKUgq50rivJxuCVP4qZ/5hNTkwEhKStg0GW/Ne5KC
	 X9eTq/QOdYKLmU5Q3YS5rC0xPGZaZv10eJDqFrs3Ca8mIdEYzWVuz2n1DMTVF6GCJZ
	 RvOIKBkJrJSuA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 177F9CD4F3E;
	Sun, 16 Nov 2025 10:52:25 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sun, 16 Nov 2025 11:52:06 +0100
Subject: [PATCH v2 1/6] dt-bindings: display: bridge: simple: document the
 Parade PS185HDM DP-to-HDMI bridge
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251116-asus_usbc_dp-v2-1-cc8f51136c9f@hotmail.com>
References: <20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com>
In-Reply-To: <20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Maud Spierings <maud_spierings@hotmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763290343; l=876;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=0pWqVth8tq9Q9WV6wD5wdXxK/GglHDQWiUHPPE01118=;
 b=uCs7Uzr//Sc6LSh9XEE6yvwKOOc/vLSwvHLq61xg4rTW5BnoOg1NobJSdkfZNBWj7DKnG5NcQ
 Ii0T4jpO91xCHXS/0llKwPEIIsTz5fympxxJy77s0cy0jC8w6zpcU7d
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
Reply-To: maud_spierings@hotmail.com

From: Maud Spierings <maud_spierings@hotmail.com>

The Parade PS185HDM is a transparent Displayport to HDMI bridge.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
 Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
index 9ef587d46506..950268632370 100644
--- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
@@ -28,6 +28,7 @@ properties:
       - enum:
           - adi,adv7123
           - dumb-vga-dac
+          - parade,ps185hdm
           - radxa,ra620
           - realtek,rtd2171
           - ti,opa362

-- 
2.51.2



