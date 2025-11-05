Return-Path: <linux-arm-msm+bounces-80448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FEBC35957
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 13:19:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2E5D3B2F39
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 12:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1448313558;
	Wed,  5 Nov 2025 12:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tyt8YziP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7703B312815;
	Wed,  5 Nov 2025 12:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762345153; cv=none; b=gai7qmyiWTRbKU8pzIPGdw6u5B1JDayA/nCEBUrWmp6iGa4qGb4VnX2VPYSPm/2wFiGhbyrcDr+VSYB6sc8ZXpEmpPsCQmWoh8eGY2noYq2yHSW7Ko61gaywAtcrM9giQRsRNKf6NkJYqFsXml8T3LL3o5mRjAVcs0uy7y9kVYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762345153; c=relaxed/simple;
	bh=WpEVUOYe+o0ODCJcitnI3R656IlVO6R4iBigsvtbubg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GVlEYQ5EG4smnyLeE1WXayDqJm4GktFXY39cIkBodZf0JjaoqRPinVFMczIrPJK9InslqudwV4X+JMM++naG7aMZb1VtXA8UlCL0iPgqTwEK+0XdQmoo0xwoYJVbeQiss0mHATljF3UV6lRfIP4NwYKgXNqxktJ4xBBc/2nhMKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tyt8YziP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB250C4CEFB;
	Wed,  5 Nov 2025 12:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762345152;
	bh=WpEVUOYe+o0ODCJcitnI3R656IlVO6R4iBigsvtbubg=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=tyt8YziP88ZbFQ1oRBb7U2mkHwTICJ5gryp1Su4+QrBXgLzZsnZK+SrRdSVRI39EE
	 bXVkn1id1UK7DphpAPVOUP9fyMT7WskopkSx0zw3fmVgLAqXmslfGhwYSo9nX76NzV
	 +5cTNhPqN3mmomHMW2bY7ZaylGV6WmrqTzS5FU307xsIoKKGWhpcd9sk2iU4u+A4c1
	 G3qW7R5GR0JR5y/r83AYzVSZePkvoBv+HDZpXXMhJClZt3HABlYwE01FxvIRwQIo5W
	 CWWX7wDSa+TzJ7ENaFK3P5gN9RV8fng+BvlG/97pSseC/e4aKH2YhwpclNyyUAgj+o
	 qPfZvvMzXPdPQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4019CCFA0D;
	Wed,  5 Nov 2025 12:19:12 +0000 (UTC)
From: Prasad Kumpatla via B4 Relay <devnull+prasad.kumpatla.oss.qualcomm.com@kernel.org>
Date: Wed, 05 Nov 2025 17:49:10 +0530
Subject: [PATCH v4] dt-bindings: soundwire: qcom: Add SoundWire v2.2.0
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-knp-audio-v2-v4-1-ae0953f02b44@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAL1AC2kC/03MQQ6DIBCF4auYWXcIIGrtqvdoupgAVqIIBTVNj
 Hcv6aqbl3yL9x+QbXI2w606INndZReWAnWpQI+0vCw6UwySy0ZwoXBaItJmXMBdYk911zVSGy0
 aKJeY7OA+v9zjWTyk4HEdk6W/CO+FqlulWC37VvIrCoyJMhk2bT7SOtM95MzeG806eM/KwHl+A
 YQekP6qAAAA
X-Change-ID: 20251014-knp-audio-v2-9a37752cdc15
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>
Cc: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762345151; l=2851;
 i=prasad.kumpatla@oss.qualcomm.com; s=20251104; h=from:subject:message-id;
 bh=c0O8eohmd+tIOQmYmE+msxYJGTgpEFCpk9Tc3tlijMA=;
 b=ocgeixzvp6gml7lZDN8J/V00Hjhfw8/FNaA5PabRQ4bj1gT3/E+VAps1m5rUg83WZLThayGL4
 jBRU6e7qN64DakcZMi5lNphdjqayfbOVmzC3JU2famuZ0IrrA5FI9z1
X-Developer-Key: i=prasad.kumpatla@oss.qualcomm.com; a=ed25519;
 pk=XN9tL2ispFX+irMtnM7RxBH6rj+awD6oEjXmk0YJodY=
X-Endpoint-Received: by B4 Relay for
 prasad.kumpatla@oss.qualcomm.com/20251104 with auth_id=560
X-Original-From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Reply-To: prasad.kumpatla@oss.qualcomm.com

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Add qcom,soundwire-v2.2.0 to the list of supported Qualcomm
SoundWire controller versions. This version falls back to
qcom,soundwire-v2.0.0 if not explicitly handled by the driver.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
Add audio support for Kaanapali MTP boards. Introduces supporting
dependencies required to enable audio functionality on MTP platforms.
These changes have been validated on Kaanapali MTP hardware.

Changes in [v4]:
	- Dropped merged patches.
	- Link to v3: https://lore.kernel.org/linux-arm-msm/20251015-knp-audio-v2-v3-0-e0e3e4167d87@oss.qualcomm.com/

Changes in [v3]:
	- Correct SoB chain, comments from Krzysztof.
	- Link to v2: https://lore.kernel.org/linux-arm-msm/20251009143644.3296208-1-prasad.kumpatla@oss.qualcomm.com/

Changes in [v2]:
	- Addressed compilation issue for lpass version check patch.
	- Sorted compatible string in machine driver.
	- Link to v1: https://lore.kernel.org/linux-arm-msm/20250924-knp-audio-v1-0-5afa926b567c@oss.qualcomm.com/

Konrad Dybcio (1):
  ASoC: codecs: va-macro: Rework version checking

Prasad Kumpatla (4):
  ASoC: dt-bindings: qcom,sm8250: Add kaanapali sound card
  ASoC: qcom: sc8280xp: Add support for Kaanapali
  dt-bindings: soundwire: qcom: Add SoundWire v2.2.0 compatible
  ASoC: dt-bindings: qcom: Add Kaanapali LPASS macro codecs

 .../bindings/sound/qcom,lpass-rx-macro.yaml   |  1 +
 .../bindings/sound/qcom,lpass-tx-macro.yaml   |  1 +
 .../bindings/sound/qcom,lpass-va-macro.yaml   |  1 +
 .../bindings/sound/qcom,lpass-wsa-macro.yaml  |  1 +
 .../bindings/sound/qcom,sm8250.yaml           |  1 +
 .../bindings/soundwire/qcom,soundwire.yaml    |  1 +
 sound/soc/codecs/lpass-va-macro.c             | 90 +++++++++++++------
 sound/soc/qcom/sc8280xp.c                     |  1 +
 8 files changed, 70 insertions(+), 27 deletions(-)

--
2.34.1
---
 Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 95d947fda6a7..1c4b0bdbb044 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -26,6 +26,7 @@ properties:
       - items:
           - enum:
               - qcom,soundwire-v2.1.0
+              - qcom,soundwire-v2.2.0
           - const: qcom,soundwire-v2.0.0
 
   reg:

---
base-commit: 2b763d4652393c90eaa771a5164502ec9dd965ae
change-id: 20251014-knp-audio-v2-9a37752cdc15

Best regards,
-- 
Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>



