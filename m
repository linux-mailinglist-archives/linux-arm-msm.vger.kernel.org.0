Return-Path: <linux-arm-msm+bounces-81967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 853AFC612DD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 11:54:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 69CEA3610F2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 10:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5545B2BE62E;
	Sun, 16 Nov 2025 10:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q6SU/Htl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000D629E0F7;
	Sun, 16 Nov 2025 10:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763290346; cv=none; b=hqy+1QnHOZK5282XRxQkTx6USBoZRBdVBiV+QtdTmgT99dny7vTRGegOYwW1ZbvtCOGaaEThv+KN1lVE/Qu+qT7NX/u4CV42EPIyqqqvai0WF/2ymjvT4zBab78rJg0w9YEGWadxHg+9RR5cIIpnA6brGBSs7jgMVsTrO9if3Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763290346; c=relaxed/simple;
	bh=k3KRolxdNesj6iiyyyETOCkob3J9SPgOASuozIOhElA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bl78iQorPm0dpn3W53JmTkphnzzraMUb0FmEUBPYVWTBoMo0VyMmPuR/pv4ZnlttP61Y6n9OfrKBSXPgmM9sCf+wwsX9qb5i3D7xGY90iXIyTPTZGzv7ABb8toNtO1waunLW99xgo/EnjXnNtKIq5psZfAYHK9cSqvEPGUWRsMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q6SU/Htl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93FE7C19421;
	Sun, 16 Nov 2025 10:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763290345;
	bh=k3KRolxdNesj6iiyyyETOCkob3J9SPgOASuozIOhElA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Q6SU/Htl3VJwP+rcDiRZ/vo+LTaM/yg3Jnbxu8Ga35qboE1mxEr9I/rjMVn1f9F8l
	 1SqyqJ1ETZ4fFezvQWD6pMtbNnVeyFfZa7OmXZVPN1eZaVE/vuUn1mSbA0x3EbO6mr
	 7WGN1X22IHujoYSHGONpxsbLN+YuxcH87Ty4efBV4viHEnY4DXVF9F386Y9orCcj2Q
	 bcpgkdf81inMXAbL4T8gYlSDA8V93eslkwiSexyOPTmg/WU3J8YaTagJr/BRL6CW1u
	 uuwXbp8e9m9Oy9MtHOec32WoKnmd7NO8fRjJ/Rh8ApGc3L3NcDHMS8MKxp00VJ2aFD
	 9OGcoigontAGw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CA9FCD4F3E;
	Sun, 16 Nov 2025 10:52:25 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sun, 16 Nov 2025 11:52:11 +0100
Subject: [PATCH v2 6/6] arm64: dts: qcom: x1e80100-vivobook-s15: enable
 IRIS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251116-asus_usbc_dp-v2-6-cc8f51136c9f@hotmail.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763290343; l=1012;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=ZWmCWiua5n5egQRb9x1NYydUjOW+BFATCTtHiwvWGpQ=;
 b=phmvb/RyHfB1ybeFgUHWUKLmMar+NfvGWePtX7qURUDEXGwzjyThXM+8lI4SyDMrXhwAXx2F+
 AFk4wqlw6IyBe4MbThNRTuOOSM4O0tqKhG6nHiNQlIlj4ZrdMO9Pl8P
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
Reply-To: maud_spierings@hotmail.com

From: Maud Spierings <maud_spierings@hotmail.com>

Enable IRIS to allow using the hardware-accelerated video codecs. The
firmware is not upstream in linux-firmware yet, so users need to copy it
from Windows to qcom/x1e80100/ASUSTeK/vivobook-s15/qcvss8380.mbn (just like
GPU/ADSP/CDSP firmware).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index 2d9b812d299e..7e57d5029a73 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
@@ -839,6 +839,11 @@ retimer_ss1_con_sbu_out: endpoint {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/x1e80100/ASUSTeK/vivobook-s15/qcvss8380.mbn";
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.51.2



