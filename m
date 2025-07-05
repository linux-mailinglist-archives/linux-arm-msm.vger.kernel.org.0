Return-Path: <linux-arm-msm+bounces-63814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5BFAF9FF8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 14:13:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20B4E5621AE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 12:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30069256C7E;
	Sat,  5 Jul 2025 12:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="TzB+n9HE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3315E2441AA;
	Sat,  5 Jul 2025 12:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751717615; cv=none; b=BSwexOlGDtlgf5p1XzIgEDUXK5qmtp8W44ay5/wOZjEQFRzHD96zv8jPv9TgjfYEofJEtx4wP54X/VFlGKPiftt0myAsfdjrzVfm0ZJZlWIRudRA86lDblqslnOa0xIfKeGF+Pt3jtEISg5q60Mda0/KdeTBhoUwnMou1tFJxhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751717615; c=relaxed/simple;
	bh=XBsSA4lmonBD6F2b7rSW7gGkYuRB+Q0avmS+D4Z7QhI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BFhZNFkSyY58A6x+IC0i2azZFmAnEEri6xddy3x1WDqvpoU+e6WsUFBY8LLhBIB7FvTRT7pUTZZb+lEigggqzoae1RK7i4cS0QhxK+PHhvn7cmTYAY3xy/3Dd9Z66g6Bd95DxuV3aRBgUxnRsq39pU5bx58L6caK36sHW0IasoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=TzB+n9HE; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1751716994; bh=XBsSA4lmonBD6F2b7rSW7gGkYuRB+Q0avmS+D4Z7QhI=;
	h=From:Subject:Date:To:Cc;
	b=TzB+n9HETmBPTK/MHlQndbOC6eUUWO5L3RvwgC1F3zNYBuNnYHlFAeMwZ1biMHtI9
	 R5c7MSMQP2/SgMmA8nyJgkhnZwWZGZUxk1c7xyRAUfUJ/b6IcADaQphZeH3zhAwjA4
	 qjwIypDoldPMzNkZOrAthi3KeIHvZL5Z7zZHsalA=
From: Luca Weiss <luca@lucaweiss.eu>
Subject: [PATCH v2 0/3] Add support for AW8898 Amplifier
Date: Sat, 05 Jul 2025 14:03:04 +0200
Message-Id: <20250705-aw8898-v2-0-9c3adb1fc1a2@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHgUaWgC/2XMQQ6CMBCF4auQWVtTRtoMrryHYdHQQSYxYFooG
 tK7W9m6/F9evh0iB+EI12qHwEmizFMJPFXQj256sBJfGlCj0Y22ym1ELSltWyJD6JE1lPMr8CD
 vA7p3pUeJyxw+h5vq3/pHpFppZcihN6ax7WW4PdfebSwxnnmFLuf8BZPldJyfAAAA
X-Change-ID: 20250406-aw8898-06988582d2e0
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Weidong Wang <wangweidong.a@awinic.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=XBsSA4lmonBD6F2b7rSW7gGkYuRB+Q0avmS+D4Z7QhI=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBoaRR7C+RBt0mbDKKD4fFi2an8AJzZkxWl3jqWj
 LNOu+pkliGJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaGkUewAKCRBy2EO4nU3X
 VlnzD/9ofkJEqr8PZOvscZ77IdrIrctTdV7+qVP1fNObu/yQXR4IcDwGe502ejdiF3SeX3AbWmR
 1btGKopHU+VDM586o4Z6RyTShjBhStxMa6CZvWTnQFHd+m7d3qjij6g5bmQQ+pNZKiH/OOD+Z+i
 kPDh81FJDZ/E5POFXrFH7QloHKsL80Clpw14R96NsrjGDbw2AREhYf2Az4JAtfjzoyMwtOs/tfR
 4Yv2CyVGP84Oj/FkdRNzq/SlCUNCCg1r2FdnekoebQfjkAbyjIbo+yTUKHzmitJro2tT1szc/aY
 SzClE0idp7S9wHQ4GRXspYt0EGXyAKFFQFoAgv+5L3z6cLkGIIJCoDGOkfJoDEniKNc4ekUbXzO
 IUPajQrluEM6ytjVa7sF3uKzJQE3zKMOExpU6x2LJQC/v42Xyp33SLsb3BIwUCqf0el2BRU192q
 oBJ23Wri0b7V26csIhsBv8ExE/4dhGDXGjYv0Wspuy/A8MpAiYYWgc6LsBaI9ry3h6cOl6Y57ZH
 QIPNM3zrZ3x/BLZX4Y2LajGXWS6Bc2JCb7/sS8Epmb1bnP2J0khveGn5Grp4p+HpVpbEFAq+XQa
 NZ/gE4Jw3oMSPO2f86+0CDch7diezgmFhvJc09rjZNkzlae4RZRqE+QHK999mJuhHlnuRvIPN8b
 NQGZ5LIfyu6XLNA==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add devicetree bindings and a driver for the AW8898 Amplifier, and add
it to the devicetree for the Fairphone 3 smartphone.

Note, that this is the first audio driver I've worked on, so please
complain if something doesn't quite look right, it probably wasn't done
on purpose.

Unfortunately we can't wire up the full audio stack yet since the SoC
side is not upstream yet, the last revision from July 2024 can be found
here:

https://lore.kernel.org/linux-arm-msm/20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com/

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
Changes in v2:
- Make supplies required & use unevaluatedProperties in dt-schema
  (Krzysztof)
- Implement many suggestions from Mark in the driver, quite a major
  refactor, most of it is unraveling the initialization and using the
  proper callbacks
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20250406-aw8898-v1-0-58a2d554693f@lucaweiss.eu

---
Luca Weiss (3):
      ASoC: dt-bindings: Document Awinic AW8898 amplifier
      ASoC: codecs: Add Awinic AW8898 amplifier driver
      arm64: dts: qcom: sdm632-fairphone-fp3: Add AW8898 amplifier

 .../devicetree/bindings/sound/awinic,aw8898.yaml   |  78 +++
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts  |  20 +
 sound/soc/codecs/Kconfig                           |  10 +
 sound/soc/codecs/Makefile                          |   1 +
 sound/soc/codecs/snd-soc-aw8898.c                  | 561 +++++++++++++++++++++
 5 files changed, 670 insertions(+)
---
base-commit: 1f5c752d94a7c3388dd562f5dd82f102ac7a3ffc
change-id: 20250406-aw8898-06988582d2e0

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>


