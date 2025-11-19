Return-Path: <linux-arm-msm+bounces-82509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA24C6F3AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:22:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 914152E3CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 14:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8768A3451BB;
	Wed, 19 Nov 2025 14:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MkQQbDBu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EAD32A3C1;
	Wed, 19 Nov 2025 14:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562102; cv=none; b=iZYDjRPuJywMM9Rsbf6tSyQUPAo/NjER3KndS4aWq58W+Altatl7cjT59Ocv4sposATBZEV5Ye5QuZR3luIUAr2KZx8eQSelNEIFFGRrWEEgiJZXeAxuPiUuWcLnjz3SaM0XbkWL2rBEg4O1V3D7ZJ4fpShXcsPDZ6vTOiNwkdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562102; c=relaxed/simple;
	bh=30zdp00ssHhIY0HNpB1mEZhkfA29GQGRCgBxkHTNKNQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pFbsokbAoeOtTkkVJsRqF4aCWoq9IC3qZAWbh5xFUq9170Qjey2b6K6Q3zQdO+0yXSsED0906ce5JUwpjSurfit5RRXk+4DyLy9mg3AC2mKC5nGeDmRV6iT0RNEAEydLbyBKCskBDozXnAtVPx6b8/pjJ2sWHKr0ZWEoX5DLtp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MkQQbDBu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA3B5C2BCAF;
	Wed, 19 Nov 2025 14:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763562101;
	bh=30zdp00ssHhIY0HNpB1mEZhkfA29GQGRCgBxkHTNKNQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=MkQQbDBulixDf7rwtVL1NJQxyL1D2A7qyKVI863DLalhC8eDronb5O1i9jRQxXjG+
	 EfG5hhAfZ4pydJSNalTR4DiA5/n5cB2CaXJi6ZhWK6VRsu3lXPcEXWrRN/N2ByZrTS
	 VjGn11bQcFO+K+YmOrH0DDmzQPaYcv0gU3GoqDZJmqTbiKSktw7bpG/TcaMwTIEaQn
	 lEUKWExsp7Tch5sckjU0zhaUe78mN6ZHOvxyuol2tsIxStLwdB47AVXXJNjudwBNTR
	 yByPslUFJNwrfbNpssGQTm5VU2KmoiW/jrWSX2U6S6c6ZxsXVqqCxjoRId4sJb1LHG
	 KFKIbC7etQGcw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53ABBCF2598;
	Wed, 19 Nov 2025 14:21:40 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v3 00/12] Make Samsung SOFEF00 DDIC and panel work
Date: Wed, 19 Nov 2025 15:21:25 +0100
Message-Id: <20251119-sofef00-rebuild-v3-0-6cd55471e84e@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGXSHWkC/3WNyw6CMBBFf4V0bc1MedS48j+MCyhTmcSAttCgh
 H+34AIT4/Lc5Jw7CU+OyYtjMglHgT13bYR0lwjTlO2VJNeRhQKVI0ImfWfJAkhH1cC3WkJmrCm
 oOJBGEa27I8vjWjxfPuzoMcRwv40N+75zz/U14LL+PwgoQdbW2BI1VaiLE4/c781LLKWgvmxMf
 20VbUKdQ55CgWQ2e57nN9Ax3mn/AAAA
X-Change-ID: 20251104-sofef00-rebuild-04cfc6e68e71
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2672; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=30zdp00ssHhIY0HNpB1mEZhkfA29GQGRCgBxkHTNKNQ=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpHdJxCvV6m5YJzmboX2MJ3rsvOYNmpY0I/N9qe
 qp6mD33FnyJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaR3ScQAKCRBgAj/E00kg
 cs+4D/9HKugFefH70tsVLJ0YUo21AB/Lx+KhnQL0uFXMgzIoq5TY+ez5QDGbAKJGRSjX4nBYst0
 Y379l6+hvpaLs3kY2+jNAm2j+IEzF0P/3RXxUNCmv8CBsk1jtMsxcJz1e3uXVU5ShJZYEe70sLa
 puuOi07P4WTzlYtqG8SywmhzPPELdVY2vGD423hFzjSck4cdtNXYsUkUh9bh8voq1/AuLRDmgYP
 P/N6HMOwW79paMyDifuOYSEEw6b76+x4qlcero/t8GNmGd2N3DAEu4iuNZrKssrqd/itMrRcada
 ntcFrwdg2evJ1c+K5rC8Jm93xoJ2YOFTnGU+pB7Ivp1DIQ8nOop2HacvfDVhb/zSkbmi39IMgt9
 Pf02dIQeo80CxqpZCZC7tw6zmwx2LUKerGk4K/eaiDSVQOlAOYQVhCcolj/FMWxtQCg9JJsz3jy
 YN4hWg+L0q8oeYUDtoUWZp9xht0kPo9gLRhkzRoJd9TMLhIckNyo05gmb5UtLNppspjEkMrjBh7
 vcXHseO/ejimV3/ChOChQNGqDjgFRNIM1x3dRoD/D86WRdNGYjnsXofFB4rxyXrdHmuEUH9H4/s
 wXM0WetyjgKmgFO//scrW4GsKOPswleBaVKnfY9wEBjVQ92QHXUgVwFc1Ql7YhITpmJ/zU9sV8o
 1rC845UWm/IW+zw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

This DDIC is essential for panels used in OnePlus 6 and Pixel 3a XL
(SDC variant). With proper support, all downstream patches in
sdm845-mainline and sdm670-mainline can be dropped.

The mainline driver was broken so far, and with my recent introduction
of S6E3FC2X01 driver, I had to "break it even more" due to OnePlus 6
common device-tree changes which defined all the regulators and
corrected properties.

At this moment the first version of the patchset will not include
Pixel 3a XL (SDC) as no testers yet volunteered.

The code, including the Pixel 3a XL enhancement can be found at
  https://gitlab.com/sdm845/sdm845-next/-/commits/b4%252Fsofef00-rebuild

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v3:
- Drop arch prefix from the commit. (Bjorn)
- Added Casey into MAINTAINERS file. (Casey)
- Moved compatible legacy comment inline.
- Link to v2: https://lore.kernel.org/r/20251113-sofef00-rebuild-v2-0-e175053061ec@ixit.cz

Changes in v2:
- General fixes to device-tree binding (Krzysztof)
- Add myself as a maintainer
- Updated commits wording
- Link to v1: https://lore.kernel.org/r/20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz

---
Casey Connolly (2):
      drm/panel: sofef00: Add prepare_prev_first flag to drm_panel
      drm/panel: sofef00: Initialise at 50% brightness

David Heidelberg (10):
      dt-bindings: panel: Convert Samsung SOFEF00 DDIC into standalone yaml
      arm64: qcom: sdm845-enchilada: Specify panel name within the compatible
      drm/panel: sofef00: Clean up panel description after s6e3fc2x01 removal
      drm/panel: sofef00: Handle all regulators
      drm/panel: sofef00: Split sending commands to the enable/disable functions
      drm/panel: sofef00: Introduce page macro
      drm/panel: sofef00: Introduce compatible which includes the panel name
      drm/panel: sofef00: Simplify get_modes
      drm/panel: sofef00: Mark the LPM mode always-on
      drm/panel: sofef00: Non-continuous mode and video burst are supported

 .../bindings/display/panel/panel-simple-dsi.yaml   |  25 +----
 .../bindings/display/panel/samsung,sofef00.yaml    |  79 ++++++++++++++++
 MAINTAINERS                                        |   7 ++
 .../boot/dts/qcom/sdm845-oneplus-enchilada.dts     |   4 +-
 drivers/gpu/drm/panel/Kconfig                      |   7 +-
 drivers/gpu/drm/panel/panel-samsung-sofef00.c      | 105 +++++++++++++--------
 6 files changed, 163 insertions(+), 64 deletions(-)
---
base-commit: fe4d0dea039f2befb93f27569593ec209843b0f5
change-id: 20251104-sofef00-rebuild-04cfc6e68e71

Best regards,
-- 
David Heidelberg <david@ixit.cz>



