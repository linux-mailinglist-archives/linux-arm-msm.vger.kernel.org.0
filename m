Return-Path: <linux-arm-msm+bounces-79991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D983C27E65
	for <lists+linux-arm-msm@lfdr.de>; Sat, 01 Nov 2025 13:54:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4025189B1AC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Nov 2025 12:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B26A2E54B9;
	Sat,  1 Nov 2025 12:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="efH/3QAL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF573285CAE;
	Sat,  1 Nov 2025 12:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762001682; cv=none; b=IZJRVmFptPT350rzznqeB/VcBsoO0c4rshKVbx0apDgX/qvDwACLQ3Lv0RaOBZNHS5av3LNiaYR1UtTf9GUqOcp+GWWQ2ay5JBi8EihMYGmnIbgKg+MoJXO3xYy9Bj0ejK7WsdQKH9GM20+8SAi0qfrW/HlMeAssO2m5d0cnMxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762001682; c=relaxed/simple;
	bh=rDu4alBE9xc96IQ8M88D+0yqiGPw2gKwSwKTC6CV0mg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WnDIJuNym+YcBDqN1CYmz6MN6k5G6sUbrcYy+/UVDUcTk+V0xn2i5Q84BWaXIOk06xUs8N7Ygi9i23DlS9AN2fPPap3jkiMVlMRsDKtPoS+MoVJDgam4T0LwH3vfY5S5op9TrUmNGFWasJopaN9qBCbQ384yFgNTvldyW/Eeauc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=efH/3QAL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62912C113D0;
	Sat,  1 Nov 2025 12:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762001682;
	bh=rDu4alBE9xc96IQ8M88D+0yqiGPw2gKwSwKTC6CV0mg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=efH/3QALhJh3vncaZPmjWA08dj7ABgo/ne3hYLiCD3gqEBOMI6NQyCemKlK+iBF75
	 soAvnRkbZV4zIY3hpupyGOQsmfC2mgG3KV/CUMBqyci7bKZw5nT/Er3g9/GhWBa40s
	 eBR78cK0auclU+giayq3aKmpQddno92+rtQ0xY4V7dJc95PJ/rd12VpQfBLzD4OSUV
	 C/CApa19Bk20UFSBudC6bSqog4w6Ek13NmPW+VuASbrD6PZkXt3XUxXVeCuhlPX1nP
	 cQPrngdZsWyPrSXRd64T87R9jU60RQG5OAk8LJQzMtUzVUtvxmBYvrCgHsJbm9gYAK
	 G5e0ZHafcMBHQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 528CACCFA03;
	Sat,  1 Nov 2025 12:54:42 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sat, 01 Nov 2025 13:54:12 +0100
Subject: [PATCH 1/6] dt-bindings: display: bridge: simple: document the
 Parade PS185HDM DP-to-HDMI bridge
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-asus_usbc_dp-v1-1-9fd4eb9935e8@hotmail.com>
References: <20251101-asus_usbc_dp-v1-0-9fd4eb9935e8@hotmail.com>
In-Reply-To: <20251101-asus_usbc_dp-v1-0-9fd4eb9935e8@hotmail.com>
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
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762001681; l=812;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=OQShTopki2aCGWcGKpxk+5iRM+E9syn+/c170E3+gpU=;
 b=v10KXQFzQ1p49KCoi11KOfvf7wV76/VOoc6mzZMj5sAEC8d30AiU1ywFBJ9hoarSb3yPYwiGU
 zTGPqM+DFYwCLykcz91aTgzKiveMXc/u8fJKJhjguItS/L7YHoI0uZ9
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
Reply-To: maud_spierings@hotmail.com

From: Maud Spierings <maud_spierings@hotmail.com>

The Parade PS185HDM is a transparent Displayport to HDMI bridge.

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
2.51.1



