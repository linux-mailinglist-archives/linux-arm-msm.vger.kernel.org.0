Return-Path: <linux-arm-msm+bounces-53289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 76859A7CDFA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 15:09:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90E037A5F1D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 13:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD0C21882B;
	Sun,  6 Apr 2025 13:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="wbXHiHxX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4511A3A8D;
	Sun,  6 Apr 2025 13:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743944974; cv=none; b=OBzynlHcgZHhjOW2YHOt5/rHGZVRTKUJ48yGNHO35Lu46elSQKanf4HcGzPsH7FtcCvC4slnDY8P1hj+IkXkTpzrnf/e5k5G1eRLUjBbM97BxryjxGjhADv5EgUNs2ZoqQU2AsJNipLnPEXqz451SxMKfrhhkbbAyPcsGgDTf/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743944974; c=relaxed/simple;
	bh=Sbd7nCw90xMZRF4A3gAhfbNbsK/lZpbKXDHdxdxgmgE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Pxfm5HlWTpA6+7pZixUQSYtov2UfT6Nxl2e/oLS7cozRyLnD5GXItl2ttWMZ6fEiHGa0pfpOdv6Ui7C8X5L06mUDW/hT8hPSV+PqTieCGSYnCtg0ds7fWuZ++G09+6D8jJbKQ2kB5Cq0gGesuc6H670Z3pxtPEdD1lAqc3EjUsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=wbXHiHxX; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1743944609; bh=Sbd7nCw90xMZRF4A3gAhfbNbsK/lZpbKXDHdxdxgmgE=;
	h=From:Subject:Date:To:Cc;
	b=wbXHiHxXAwXZzOhtW2GnpesMKHmEndl3lPh8n5+/ccjCp8rtH0zkIMs1Xu3M/D9/B
	 uyrPhlbtmSauguBlP2IIurfN7UvLkjK+Ar4g8sptHPzByrZEDb01XnPuNxoPzIBkyJ
	 ut6TnlwG/y7LITrS1W15Mp7mnpFEYU9xNp+oEhA0=
From: Luca Weiss <luca@lucaweiss.eu>
Subject: [PATCH 0/3] Add support for AW8898 Amplifier
Date: Sun, 06 Apr 2025 15:03:14 +0200
Message-Id: <20250406-aw8898-v1-0-58a2d554693f@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJJ78mcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEwMz3cRyCwtLC10DM0sLC1MLoxSjVAMloOKCotS0zAqwQdGxtbUAhvx
 Dl1gAAAA=
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
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1304; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=Sbd7nCw90xMZRF4A3gAhfbNbsK/lZpbKXDHdxdxgmgE=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBn8nuaXi/e9WpUgiOJvwwsbar2Yl6brjK3Z1K32
 gX3ZGkMqlGJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ/J7mgAKCRBy2EO4nU3X
 ViFJEACahpdZ2xLIUuIStUKZuW4STnWPdKIgOgifysdmHOcDwzvjrm1Nnq+6H6ifZDeNxUqDd1v
 mP0CHLRFd0O3ULN2RvzBm1dFdYXYEFc/sJcG3mX1XSYVWTbxve656B/P8SeNflroidtAodEH8Vs
 UvcazVzC2Ftslj6NF+8IOJyHx8ws8yti0LWXiDuDDie886Fi6N6bIQVomHeB0yqJhiLG9DBjz03
 sAe3Ox5hh9z/vY/a7RchlmvCvEwuRMOw5aoKheRI3CllgvdGrAZrD8BgnyfjYaFjj6hpvQkrmuV
 /Qtw75jr6Y5bVLJKrLFHwfwBKJ+/CVNivP5zYYOVTiIl2DkXj/mvclF9CAtyzfBlaNgFPqtUzBG
 Wd1yUohtZMr5/JS6wd7bDfS6/L+VfRp5bghLKC3Ya44mudLWk239I+WlWqrWkMmmsALZNKLktcW
 xyp+Iz/ET/16nJRzqhZgut56FauIjZbCfhijEMtUukFwrU8fzRFP/IWSxHyTRWQ5gyqWfYqKIhR
 qqweXj/PGxFXRlhtQsBc6CVQ7OysXdrmelAEHmVu+d51GwOqGMSlgICgb+/LDUP0RvdA+z30thi
 fuCMOH9QBVOB6D0kK2DPpTfdh4msA5DWKJUn18AyMAYSlfCr1GmOxZuJr8B/ON90uc6WpulolGE
 Jt7QvYRTOQXtdRg==
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
Luca Weiss (3):
      ASoC: dt-bindings: Document Awinic AW8898 amplifier
      ASoC: codecs: Add aw8898 amplifier driver
      arm64: dts: qcom: sdm632-fairphone-fp3: Add AW8898 amplifier

 .../devicetree/bindings/sound/awinic,aw8898.yaml   |  75 +++
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts  |  20 +
 sound/soc/codecs/Kconfig                           |  10 +
 sound/soc/codecs/Makefile                          |   1 +
 sound/soc/codecs/snd-soc-aw8898.c                  | 583 +++++++++++++++++++++
 5 files changed, 689 insertions(+)
---
base-commit: 287e43781488fd6ca5f4306dbb4f2a88c5564d79
change-id: 20250406-aw8898-06988582d2e0

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>


