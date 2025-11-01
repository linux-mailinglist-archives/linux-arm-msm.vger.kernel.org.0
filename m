Return-Path: <linux-arm-msm+bounces-79996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D09D3C27E96
	for <lists+linux-arm-msm@lfdr.de>; Sat, 01 Nov 2025 13:55:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B999A4E3C52
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Nov 2025 12:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E97F2F83C3;
	Sat,  1 Nov 2025 12:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FO4I+hf/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AD72F6567;
	Sat,  1 Nov 2025 12:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762001683; cv=none; b=BgFazjRDVK8BN/HLBkIRl4HEiKV71yRgUwRN2VbS4mH88dG/PryLZu4j2k9EblJqeC/42IPlaE4TH4VoGABRlNd6p+UfAbW4TcbmTFozL2927yxC4Mg2KGfMatSqh1pewDTR6Yopn6gOmcPC1eDFJLJRJD2KjGZWoNW3dIzVUhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762001683; c=relaxed/simple;
	bh=9WWaEJY/FJQRR+57wM1DZlmy6MqN333eIEY5yiUWzAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NMicdPrkjhplMt46nLn//aWSuXXtc21OtKiayxHae6lgK7RTXKh9GXwmO09uOJvfG6JWssRY/dbcK3uNVgjTNnjGlylwhKPwJCL4FnuVaF7RiJZDNFWkzrwHY3uYjh5aMAd4C3EsTm5KxJ0dSoID20P+gXnQZg9bs8PCVgxrTLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FO4I+hf/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2673C2BCB5;
	Sat,  1 Nov 2025 12:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762001682;
	bh=9WWaEJY/FJQRR+57wM1DZlmy6MqN333eIEY5yiUWzAQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FO4I+hf/LMuwoqO7MptReIxMDE/kiXu98wUryWFf0qUKFXx6vWM4xRSM/LOBQ5SEl
	 UJ6o+SEfPQPVy4D2w5Be4EBqYRslNPr7EVFHMJgNjiBPZqRqDa8p1AfSHvUv38ZvJr
	 546pccarMxaGLnnO6+uuXr0zvi9QzTd3XTw2i3afXhtKdfaL4NEQTcYrTylld/7q2Z
	 yclJLlCysZMAgBjK9OgD55TZWbk+aLOYUMzfcIMYyZEjpWtG641A+XNUwVBKt9/FAd
	 FpsZFvsxUKpIz8j26wL1UEUOGW/cwdrktG9nXf0MtMr/hL32XiO87UgGCoEqR0GFJ/
	 Wyazt2zcrPyFw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A99AECCFA05;
	Sat,  1 Nov 2025 12:54:42 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sat, 01 Nov 2025 13:54:17 +0100
Subject: [PATCH 6/6] arm64: dts: qcom: x1e80100-vivobook-s15: enable IRIS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-asus_usbc_dp-v1-6-9fd4eb9935e8@hotmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762001681; l=945;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=Ma+VW+zOVD4YEG8QCXRYgRPYDOrXI0NLtiHYjm6xOrk=;
 b=xO+Oa6PMId8jDgzFrfUiJlQAwYKQ27GM6E5hHPHHrF4SbgFZhlOfm/41SDoFh9AcSEZHPUS9p
 OXwj7byAHwSBZ+nBKliCJBI2AG+UumfJZBMxvvuh1y69WG1BFZM3Qc6
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

Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index 7dd0d7999fe5..219c0b05fe27 100644
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
2.51.1



