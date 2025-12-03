Return-Path: <linux-arm-msm+bounces-84186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FEFC9E8A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 10:43:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1378A4E16C4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 09:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205E72E3B07;
	Wed,  3 Dec 2025 09:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="ZP2FGBEi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34202E5406
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 09:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764754942; cv=none; b=I0KEAoZTw4Pg0y3ibFjXm3UkMn0ppdqlHf4kn8lEFnmkU683RgytM541d9/oEUebP1K0mlXgrx7/xS9UNWJduVX+FZGkaD5PN8tA2FoA5LIMNJ8fgO86Q4C0YeWujtsoIgS822R2R70VQeeDqHnhaulMoQUxN284Wubc0hFnCIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764754942; c=relaxed/simple;
	bh=4/YFbyLCZ7VP5m62rGS/d/v3As5XccEE1Csi7Qzr3vs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kl0pPF+NAg62UPclE6aZt+U710p6j1I6o8eykBwM8xZZQzR9TsL+GKaPZq2P1b5BsdeXC0yByAoMPDMhbkVHta8qvhWUuTgP8AZsRPLs9pvqZncSVVgcCV/3Vo9XbCxoBcc57XyHP6F0BIblbDCASj9TS2J4Zv33kG/yvO6GILI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=ZP2FGBEi; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764754927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AnEDzp4wv7gsykfEWXgbvBQGxTjPE7HkdMDhz041C08=;
	b=ZP2FGBEiARImXukqjbrJVMC5kq2KChGXgHdsDi8bL3Ge9LD8KGSrqRSoncudr2t6GSMwua
	3kcDRwhci655Rb4PWwEMSsQcnkXWwwWVsAeNzI4BztXGCt8UOo8KaVDstOVb5m7wrYwR9a
	8xZikVRKRN5ZtA+kC7HHmh1NG8dK4XwdZO/C3wYCkTtAGBneu1ESI+hC8wzUv6bP1O5Erf
	YGyETp0+SNSLTY47hrs2aD7uy1gpYpnGkrb95lhl/KqlY0n37JYorKgtbWXMZErQzIcG0Z
	uTt56mOiEgnufRiDhwmUUcAjkqxz0B69GGvGHw7b/vA9Kb14l6e2IfRW9bMJRw==
From: Paul Sajna <sajattack@postmarketos.org>
Subject: [PATCH v5 00/12] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Improve HW support in dts
Date: Wed, 03 Dec 2025 01:40:49 -0800
Message-Id: <20251203-judyln-dts-v5-0-80c1ffca8487@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XQ3W7CIBTA8VcxXO8YDoV+mMX4HssugJ4q034It
 dEZ331Y3WLjvDwUfvzpmQXyjgJbzM7M0+CCa5s4qLcZsxvdrAlcGWcmuFC8QISvQ3naNVD2ATC
 zEkkVpeUViwc6T5U7jtjH5232tD9Es78tsppC0KO5mL3fSf5LdrqhHQwICLlQNpOSJ8aYVdeGv
 tZ+S30b5q1fL693PUmIUQpb18Em7gera9jXDmIADAI48FJXMle6yDO9ckfXz+33kl0zNy70rT+
 Nv2DAsfOeljy+NoZxEImRJssKXlp6Chu1QTwK6US4dijClFIu0kRXL4TkQRD5REiiYFDaqqBCx
 48vBPknIAo1EWQUtNIpV5wbkWb/CJfL5QcVSR6OGAIAAA==
X-Change-ID: 20250911-judyln-dts-17c41e59dc0f
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Amir Dahan <system64fumo@tuta.io>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Amir Dahan <system64fumo@protonmail.com>, Pavel Machek <pavel@ucw.cz>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764754921; l=4254;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=4/YFbyLCZ7VP5m62rGS/d/v3As5XccEE1Csi7Qzr3vs=;
 b=xTjQIr1En70Fzmnm2UQn00xh0gibh2VKvVw2UNYobJH2ZVG+0SczzS/Cs9lKaJZu956GfAZ16
 NmdcZX2rWnJBftD2Y+kdW0famSai6rFSq7HURQ4Jg/duG47yi0FYGMA
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

Rollup of improved hardware support via devicetree for LG G7 ThinQ 
(judyln) from sdm845-mainline kernel fork

Notably, this patch-series enables full DRM acceleration and wifi,
among other small improvements in individual commits

after this patch-series the main things that remain to be worked
on include touchscreen, audio, and modem.

Depends upon panel driver patch-series https://lore.kernel.org/all/20250910-judyln-panel-v1-1-825c74403bbb@postmarketos.org/T/#r9a976ca01e309b6c03100e984a26a0ffc2fe2002

Depends upon qcom,snoc-host-cap-skip-quirk https://lore.kernel.org/all/20251110-skip-host-cam-qmi-req-v2-0-0daf485a987a@ixit.cz/T/

Co-developed-by: Amir Dahan <system64fumo@tuta.io>
Co-developed-by: Christopher Brown <crispybrown@gmail.com>
Signed-off-by: Amir Dahan <system64fumo@tuta.io>
Signed-off-by: Christopher Brown <crispybrown@gmail.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
Changes in v5:
- update system64's email
- reduce lab/ibb voltage range
- status should go last
- remove rebase leftovers
- fix flashlight
- Link to v4: https://lore.kernel.org/r/20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org

Changes in v4:
- add panel identifier in addition to ddic
- make sde_te pull-down
- fixup flash current
- remove framebuffer reserved-mem 
- remove manual lower guard
- depend upon https://lore.kernel.org/all/20251110-skip-host-cam-qmi-req-v2-0-0daf485a987a@ixit.cz/T
- reword commits
- Link to v3: https://lore.kernel.org/r/20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org

Changes in v3:
- change firmware paths to lowercase 'lg' (matching dt-bindings)
- fix signoffs
- add wifi dmesg to commit message
- remove regulator-always-on from ibb
- remove framebuffer
- remove msm ids
- don't continue commit subject into commit messages
- split bluetooth node
- add sbu uart details to commit message
- change ipa gsi-loader to self
- Link to v2: https://lore.kernel.org/r/20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org

Changes in v2:
- sort at the start
- drop unnecessary labels
- drop unnecessary gmu
- multi-led
- split fb-panel changes
- expand upon firmware commit message
- use qcom,calibration-variant instead of
  qcom,ath10k-calibration-variant
- change firmware paths to include "LG"
- remove framebuffer reservation
- add lab/ibb

- Link to v1: https://lore.kernel.org/r/20250913-judyln-dts-v1-0-23b4b7790dce@postmarketos.org

---
Amir Dahan (1):
      arm64: dts: qcom: sdm845-lg-common: Add LEDs

Christopher Brown (1):
      arm64: dts: qcom: sdm845-lg-judyln: Add battery and charger

Paul Sajna (10):
      arm64: dts: qcom: sdm845-lg-common: Sort nodes and properties
      arm64: dts: qcom: sdm845-lg-common: Add uarts and Bluetooth
      arm64: dts: qcom: sdm845-lg-judyln: Add display panel
      arm64: dts: qcom: sdm845-lg-judyln: Add firmware nodes, change path
      arm64: dts: qcom: sdm845-lg-{common, judyln}: Add wifi node
      arm64: dts: qcom: sdm845-lg-common: Add chassis-type
      arm64: dts: qcom: sdm845-lg-common: Add camera flash
      arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
      arm64: dts: qcom: sdm845-lg-common: Change ipa gsi-loader to 'self'
      arm64: dts: qcom: sdm845-lg-common: remove framebuffer reserved-mem

 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 238 ++++++++++++++++++-------
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 138 ++++++++++++--
 2 files changed, 296 insertions(+), 80 deletions(-)
---
base-commit: 3d53f9ca24dd7492fe88fd0f1a418e3dc8b03515
change-id: 20250911-judyln-dts-17c41e59dc0f
prerequisite-message-id: <20250910-judyln-panel-v1-1-825c74403bbb@postmarketos.org>
prerequisite-patch-id: e51151ea7f8fdad6ad7d90713febc5c6b6fc4f9c
prerequisite-patch-id: b3dd44250da9cd12bc5b2d0d7e865dbe19ceed92
prerequisite-patch-id: fd6c8077806cb03fcf37d0e0d730314c2760e334
prerequisite-message-id: <20251110-skip-host-cam-qmi-req-v2-0-0daf485a987a@ixit.cz>
prerequisite-patch-id: 32934e043aa82e7dccdcb962037e78663eae24a6
prerequisite-patch-id: 9c69ab29256c15a0e8ac1c3b9ef64b27661c7815
prerequisite-patch-id: 8fce59716f5d0d873c3407937e4f852eb18c75f0

Best regards,
-- 
Paul Sajna <sajattack@postmarketos.org>


