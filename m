Return-Path: <linux-arm-msm+bounces-77325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 440CDBDD3F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 09:57:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6E21406D46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 07:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 860D9315D26;
	Wed, 15 Oct 2025 07:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kYmKSUzM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554F131577D;
	Wed, 15 Oct 2025 07:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760515038; cv=none; b=HIH5N7aeKhs/OH2PmqdrxOVR8wIDGu3AWNiL3WjhnHe8UYpjkcloRp2AZ1PVZ8rc0WCdWaW46uWQez2MM3W1QkKTL2+yH18CShs/IVWcgyP0yvC1Rk1B9MQQeUStMfe/nPQsr88YsxegKOMT7uk66EnpT6lGbiU/l/an8v7icL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760515038; c=relaxed/simple;
	bh=oVjglxA2YVL+EWAe8G0L/QPujTzNnzrVGFjD3bYF2Go=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lreFI3plv4joxOMafdJIORKEcKNCQ9CHpMQGuK14dYTcWEp0jFkEvnAmX/tmGnJNZ/E/R8QyQXG345gCOTVCi0vM9ZzZttSKWNUU2v1Wf45sfiJF9IxOnNyusOetvg0rrXFWNRmXVApLgDsczpSSRL5t606dZiWaOiRhGDw/eO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kYmKSUzM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25BB0C4CEF8;
	Wed, 15 Oct 2025 07:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760515038;
	bh=oVjglxA2YVL+EWAe8G0L/QPujTzNnzrVGFjD3bYF2Go=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=kYmKSUzME7qid6TgJhqyUEK302Ta71PZvWeDgogzPPK80DMuHwXKHR2+QPObZaw6H
	 mft+4Hb4nh/b2CeAivUtkBzpOz/dLMAyJVIGGu5ZMIw9uCCOblhRddfvgRacdj62Hp
	 MMQlL6UyAUfc5WDDlL5MDn7T/pQ1XqFw5e/P3RsK6AEPyQA9R6aNTwys2FZtoDEacp
	 7AzyaJg8YM+fTrI0AVQgp+Ks4N8YMjBzT5TIlURWV5YUCrcv+2Nxji9zes57+Cd3nP
	 eu7zlXlfCSVJbrUAI/4Gpi+94wLergrWJGbsr4IpeP4bqEReYnA7l0YDE33qXfKN1/
	 oAtqu8Tz29Zpg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14752CCD18E;
	Wed, 15 Oct 2025 07:57:18 +0000 (UTC)
From: Prasad Kumpatla via B4 Relay <devnull+prasad.kumpatla.oss.qualcomm.com@kernel.org>
Subject: [PATCH v3 0/5] Add Audio Support for Kaanapali MTP Boards
Date: Wed, 15 Oct 2025 13:27:14 +0530
Message-Id: <20251015-knp-audio-v2-v3-0-e0e3e4167d87@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANpT72gC/03MSw6DIBSF4a0Yxr2Ep9aOuo+mgxvAShShoKaJc
 e8lHXVykm9w/oMUl70r5NYcJLvdFx+XCnlpiBlxeTnwtpoIJjRnXMG0JMDN+gi7gB5l12lhrOG
 a1EvKbvCfX+7xrB5yDLCO2eFfhPVcyVYpKkXfCnYFDiljQUunLSRcZ7zHUuh7w9nEEGgdcp5fK
 /Z7DaoAAAA=
X-Change-ID: 20251014-knp-audio-v2-9a37752cdc15
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
 Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760515036; l=2706;
 i=prasad.kumpatla@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=oVjglxA2YVL+EWAe8G0L/QPujTzNnzrVGFjD3bYF2Go=;
 b=6v34mFGcATJ0yTodD94cdvkszAGp2RJ7NLQbNiAVtOYGS2We3CTlm4YnUqX0oqBwxwDO+ZJTn
 W/+3gQVz8sIAtgwa7d+LGBzCwoIcwmNuqOe0zGhGTzYtKMBwelJKgrb
X-Developer-Key: i=prasad.kumpatla@oss.qualcomm.com; a=ed25519;
 pk=I3mn8JNlYnnm7frqMGXms1Rm2H+0gpAfknMlnBYqCzw=
X-Endpoint-Received: by B4 Relay for
 prasad.kumpatla@oss.qualcomm.com/20251014 with auth_id=541
X-Original-From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Reply-To: prasad.kumpatla@oss.qualcomm.com

Add audio support for Kaanapali MTP boards. Introduces supporting
dependencies required to enable audio functionality on MTP platforms.
These changes have been validated on Kaanapali MTP hardware.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

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
Konrad Dybcio (1):
      ASoC: codecs: va-macro: Rework version checking

Prasad Kumpatla (4):
      ASoC: dt-bindings: qcom,sm8250: Add kaanapali sound card
      ASoC: qcom: sc8280xp: Add support for Kaanapali
      dt-bindings: soundwire: qcom: Add SoundWire v2.2.0 compatible
      ASoC: dt-bindings: qcom: Add Kaanapali LPASS macro codecs

 .../bindings/sound/qcom,lpass-rx-macro.yaml        |  1 +
 .../bindings/sound/qcom,lpass-tx-macro.yaml        |  1 +
 .../bindings/sound/qcom,lpass-va-macro.yaml        |  1 +
 .../bindings/sound/qcom,lpass-wsa-macro.yaml       |  1 +
 .../devicetree/bindings/sound/qcom,sm8250.yaml     |  1 +
 .../bindings/soundwire/qcom,soundwire.yaml         |  1 +
 sound/soc/codecs/lpass-va-macro.c                  | 90 +++++++++++++++-------
 sound/soc/qcom/sc8280xp.c                          |  1 +
 8 files changed, 70 insertions(+), 27 deletions(-)
---
base-commit: 2b763d4652393c90eaa771a5164502ec9dd965ae
change-id: 20251014-knp-audio-v2-9a37752cdc15

Best regards,
-- 
Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>



