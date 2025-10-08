Return-Path: <linux-arm-msm+bounces-76418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15085BC55CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 16:05:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EAF83ACB54
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 14:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05EB128B407;
	Wed,  8 Oct 2025 14:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mnQzdlN3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D5A2853F3;
	Wed,  8 Oct 2025 14:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759932330; cv=none; b=UtKebtzBPbdxSwPJhlVt4HuTwQJeSXjqQ5Q+d7Nht9VMHRLcKyqeegl8aIk+2j+sCdMDfaci13M9GqyIgJhwOvlbAqJsnvGz7UanxDK5IQFA9uRov3AgZafw6dUx1htqK3tGwba6bqL0bDjwM78AdR2bM4w518305p2lAEVL8lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759932330; c=relaxed/simple;
	bh=agTZVVmdqx9pobjeJ46jC9gSHyxn89Ywa2Q1fCm/NhM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hFJBKZPoQqie1mEEsZ2pZ+M0xB6mNd4uKq9NkuYSCXXiW+iX33m8JZRC+fyToEFlfUYpzm30GczWG5hvMz6gf2gs79S4CG6URdXCcsLzQkfZoPjxdxKHMkz393gh3o/gvFcY0qwUkvDordkzAcF02Qy3pLmQGlhof61Ls0wmQ54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mnQzdlN3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93E58C4CEE7;
	Wed,  8 Oct 2025 14:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759932330;
	bh=agTZVVmdqx9pobjeJ46jC9gSHyxn89Ywa2Q1fCm/NhM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=mnQzdlN3AlOGcEXBdjL/Er5d0CuVA6tnB9E/JIN42U9+e3XIYArMVNy2Qrww12j2P
	 SNnorfrpvctBCqvjuZCEYhkCMNLurWGSHrEq/2W39VsSXQjBOe7AakOIzhf36ckbDh
	 mnhdqZuAcxgfNizWnrIzF9wAdahuOw05o7sngm1iRxXwvKQ8fvbt15eyeh7sbs5qYC
	 0nm66zxkuyNzZ/KkXhDL0N1D8MnJ0+JBMRH/Ht4/pUOKDPxYdKmOX+jDdnw3I9zc0E
	 j/d0FdTq5fJAeDswCUQc9q4q53aGibjGI2L/9un9hB2qsajXh7FdJQbg553dEi7BtZ
	 5orQ9wYADFx/g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8932BCCA470;
	Wed,  8 Oct 2025 14:05:30 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v2 0/7] Add OnePlus 6T display (Samsung S6E3FC2X01 DDIC
 with AMS641RW panel)
Date: Wed, 08 Oct 2025 16:05:27 +0200
Message-Id: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKdv5mgC/03MQQ7CIBCF4as0sxYDQ6DFlfcwXSgOdjatgYagD
 XcXm5i4/F/yvg0SRaYEp26DSJkTL3MLPHTgp+v8IMH31oASjXSoRbKkg8cilQjOGHkbEAMZaId
 npMBlxy5j64nTusTXbmf1XX+M+WeyElI4dFoq29sh9GcuvB79G8Za6we7/hzYogAAAA==
X-Change-ID: 20250923-s6e3fc2x01-f9550b822fe5
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
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2718; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=agTZVVmdqx9pobjeJ46jC9gSHyxn89Ywa2Q1fCm/NhM=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo5m+oaZnPSmruAyRfu3d01fCRQiEN17hyQnmfG
 xIMnIZs67mJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaOZvqAAKCRBgAj/E00kg
 ctejEACEfmutlZ1j+l8Po12Swx8lJu/R3b5592nUbUYS+908mR5Bt6VMStvUQ0eapAX0MxScMSc
 urNyLa7UGIeNzYiQP4QzAoQZTF3GjVQY1q9Azeces8CkZx3+EIj9EPI7nb/V2IEVUijUxKQV0kp
 tchSHPzH4yfDLfpqy+UXksUZ8LjhhbCKZUQdjTEIzpEfgOsUpXbnJD+RSxtgnqfXBcm+AZq/Ufc
 ClOgnxfikRxj5rJdNJgaDIVvbaKx3ADteKSy7ksD+UqDrnsAc5V5LR1ir1V+D1gHk8vfSS+VRZi
 guW4MWr9LtDY9D6NunkoePGKR6D+fiYXsAEh99TSIRGzL/FhQbXAcZMfzLhXVAkT3P7YUy/wljJ
 AxWC06UiXIQ53PxeyqxPGNYv2zB7HVtfZHJgaLN3aznHgVh5kUpYwyHVj6OTuLqIQSUUqqTcpSP
 YzcTBr2zA6C9Ry/7SmkjqN6plkaaVW9BoNltsFQs3+Qos2hRjRDHqzHlV5BJZKMGIv+zwTRKl08
 HkpcC/H9yvnbggJN/kMNWeX5jduc1IZqHUiYu2kPuv3sxgg6sLekkgyBnelx0saz/HjtSs9nI04
 GM/29JG+zCGaLsnUu+Je/6qgIF3U+4TswyTv8Y9Mdn1WG1JCi9+Xkrk6ysVxvDUicTn9zt1aIsg
 tDhHrhGdKzm5epw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

First, proper bindings for the DDIC and panel are added.

Next, the VCI and POC supplies are introduced for the OnePlus 6 and 6T
phones, and the OnePlus 6T device tree is updated with the new compatible
string.

This series also documents the tearing-effect GPIO line.

Finally, a new DDIC driver is introduced along with the AMS641RW panel
initialization sequences.

This patchset enables the display on the OnePlus 6T smartphone.

Since the display node is shared between the OnePlus 6 and 6T,
the following warning appears:

..sdm845-oneplus-enchilada.dtb: panel@0 (samsung,sofef00): 'poc-supply', 'te-gpios', 'vci-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'

This will be addressed in a follow-up patch, as the SOFEF00 DDIC also
requires additional overhaul to properly initialize and function in mainline.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v2:
- Dropped the gpio reset polarity change as suggested (Jens and Dmitry).
- Fixed unused warnings (kernel test robot).
- Added a pinctrl config for the VCI and POC supply.
- Removed patch "dt-bindings: display: panel-simple-dsi: Remove Samsung S6E3FC2 compatible"
  while the compatible is used in device-tree, but without any driver
  serving it, do not touch it (Rob)
- Added more details into the device-tree about the OnePlus 6T panel properties
- Put display gpio -pins into one -state block.
- Link to v1: https://lore.kernel.org/r/20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz

---
Casey Connolly (1):
      arm64: dts: qcom: sdm845-oneplus: Describe panel vci and poc supplies

David Heidelberg (6):
      dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC with panel
      arm64: dts: qcom: sdm845-oneplus-fajita: Use the freshly introduced driver
      arm64: dts: qcom: sdm845-oneplus: Describe TE gpio
      drm/panel: Add Samsung S6E3FC2X01 DDIC with AMS641RW panel
      arm64: dts: qcom: sdm845-oneplus: Group panel pinctrl
      arm64: dts: qcom: sdm845-oneplus: Implement panel sleep pinctrl

 .../bindings/display/panel/samsung,s6e3fc2x01.yaml |  78 ++++
 MAINTAINERS                                        |   6 +
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 113 ++++--
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts |   2 +-
 drivers/gpu/drm/panel/Kconfig                      |  13 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c   | 402 +++++++++++++++++++++
 7 files changed, 593 insertions(+), 22 deletions(-)
---
base-commit: 7c3ba4249a3604477ea9c077e10089ba7ddcaa03
change-id: 20250923-s6e3fc2x01-f9550b822fe5

Best regards,
-- 
David Heidelberg <david@ixit.cz>



