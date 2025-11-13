Return-Path: <linux-arm-msm+bounces-81688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88594C5958B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 19:04:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C1CB3A6B69
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 17:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B256C3587D5;
	Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dJBFf65V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834552EF67F;
	Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763056663; cv=none; b=Uo4/aS2uOTa/L6BIwei9D2SKFEiAE5elGsUFPo+Q+ALYkOuReevTO3ENWkFuC8aWhB2x4ajvVD0Sp3Utmbh+HB+f5kJyYl7RBidxgMDrfLTexYm2MWPfYSnntT/v2oM8gJBqqgWs2HldaJs1ph1/J3ajJawlQWvsXNc1mjYQjpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763056663; c=relaxed/simple;
	bh=vgzmso7a8Y8t5RJ9ImlUQnWFBosuuGamKlYy2aDvNqk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NZjHSMyODkpUQe8sGDfCK8gYpJhKx9vTeha0nCXJWXEnWAWYSi3LJOnia11YsB/t9RoYELKT9nVdvfDiMVx8J5TbaHT50c1xwiZ3LYnfN36Yu/kavvWB+ERR9trRQfNS1uc4QIqFAVZ9dZhJ4KFerFAnhLSTYhb5q3EJv5jmDLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dJBFf65V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22363C4CEF5;
	Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763056663;
	bh=vgzmso7a8Y8t5RJ9ImlUQnWFBosuuGamKlYy2aDvNqk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=dJBFf65V6xf092PTLrTR0jqE35vrSe3InxtQrAIQ/fsrzmBRilcEUllbi1zBOahIY
	 7EFtbHk4Euo6VrBis/hbtJCKJZLbk6EYQrvOu/v15ic6ZI4JmUXkI5Fu/T7XjAj5qg
	 Kxc0WeZTXujQrNLno+bnnidU+wbBMf2LoXZXfIRGq/gXsABtfg16s72+VHuwbbEQNt
	 iN4vZK9W2CqPzrqSq1VaworrkMzp8uM3HuhPf4BvN9ZtmTfLuJsxsSn9iysAFWJ+0F
	 /5vL649zGDSQL/6GFueSomJcp0xQUYr1oAUaFG0AX+YBZB7cMlpw7RBolGqNYKR3Ow
	 /iAnB6ktyJ0PQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B28CD8C9B;
	Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v2 00/12] Make Samsung SOFEF00 DDIC and panel work
Date: Thu, 13 Nov 2025 18:57:34 +0100
Message-Id: <20251113-sofef00-rebuild-v2-0-e175053061ec@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA8cFmkC/3WNQQ6CMBBFr0Jmbc1Mg8W48h6GBbRTmcSAtoWgh
 LtbceHK5XvJf3+ByEE4wqlYIPAkUYY+g94VYLumv7ISlxk06gMRlioOnj2iCtyOcnMKS+utYXP
 kiiCv7oG9zFvxUn858GPM4fSTncQ0hOf2OtHH/j+YSKFy3vqGKm6pMmeZJe3tC+p1Xd9ajmIGw
 QAAAA==
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
 Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2543; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=vgzmso7a8Y8t5RJ9ImlUQnWFBosuuGamKlYy2aDvNqk=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpFhwUpLovHkS4Wk+TvhDkWFSO6YdoFELC9NIfw
 X/f4peBP9eJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRYcFAAKCRBgAj/E00kg
 clvvEADM9AA6L1Uc0zOH7Xy9Lg+VvtzTdgFMcacL8oqV0Jxc4xA7uwMogRWbbT6AfveF0nYSWJJ
 +RIpkBqvZ69T6klh61F3hrzhXZqOzy1kKtB65Qnp1ESAJkV1RxjLtV3G+xog7LjtK5roItWeBH6
 SyB6/2PVRijQyrHWy0IEhKjqm0gUy2VmcgX4gecnfKFyBO07+PvNr6AkIDj0cIY550VezG5OjxD
 3zrqxMGKvE/+d79+pekZqZsK7hjHLW1FIPNu2GfAH8qQBuWTFsEgecLdJWCz+PdFZwan2JaNDa0
 BE8XIw6GgXrPm2p+LyapG2h2rOj1JTm+GGs0L6GgcILpNoS1jym8eHxvErn1Lmu1ZpFgXsWRMIN
 1hPjN3F6feAMRmfce/iuJ3Pl1EI9trHYqtVfpy+T0IRCdkNyZ11oo4jcwPL02Dbj0z14vJYWzPb
 vLMrqmme9zrCal67ZrmZpux/vY27ZTjls+k5YCBM9F6ZefEzs/vS43O+Mg8ayntl+Sw59bbsiNX
 AG94WO0ZaBOMM/iE/wcb7puT1l8OSr1zu6NpOBArQidVFaOMjAjokTjJA+58uSYFvGG6ingKAaA
 KJhrkSKaLJECwKAYNIZMRlLyiXmFEFhJhC3gfVRDjRdF4h0dXQi11/+w3RIHrrk8raKhb9ZJOfh
 8A9sYHFcvnHLQFw==
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
  https://gitlab.com/dhxx/linux/-/tree/b4/sofef00-rebuild

There are some unknown issues with -next-20251103 - 11, so won't likely
work there, recommend linus 6.18-rc4 and later.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
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
      arch: arm64: qcom: sdm845-enchilada: Specify panel name within the compatible
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
 MAINTAINERS                                        |   6 ++
 .../boot/dts/qcom/sdm845-oneplus-enchilada.dts     |   4 +-
 drivers/gpu/drm/panel/Kconfig                      |   7 +-
 drivers/gpu/drm/panel/panel-samsung-sofef00.c      | 104 +++++++++++++--------
 6 files changed, 162 insertions(+), 63 deletions(-)
---
base-commit: 6d7e7251d03f98f26f2ee0dfd21bb0a0480a2178
change-id: 20251104-sofef00-rebuild-04cfc6e68e71

Best regards,
-- 
David Heidelberg <david@ixit.cz>



