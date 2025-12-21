Return-Path: <linux-arm-msm+bounces-86070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EB6CD46CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 00:32:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6555D300304F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Dec 2025 23:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D481627B32B;
	Sun, 21 Dec 2025 23:32:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1537124C692
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 23:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766359944; cv=none; b=P+ixyRWcWq2xFpMEX8CUBAhAbcl6HAdTt4uK9C7LP9xaoWA07NnzdgZUcU1vje/MtmCtrS99CmXGIlBqQ5zn7kjKFQG7eiIF+YEcfB/KWKs5QQFTXnM6r2sVVtFaKLtn7L7wF9hKdSUsWS3Xh/efSt5bTD3vhmaGQaV/kfupQDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766359944; c=relaxed/simple;
	bh=K67x8906beDdx2WsWxtu475jpx65pzBUTHCGk31JWeI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jcfs5J46f1zhj4r85S/nPj1d1QLW6UkbF9aqeSVR82sMjb1qc2thQGfp5ZY4E99Y6kjCLE7H8lUUeCqqFz5w0l8UdaIewPfUMxbwRRwcwDqb7s/wb2oblVa4NlyWlEySxpQtGQdL6HaNhMowB9ANvc609mk5Z6oR3dsM0CE2jn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from Marijn-Arch-PC.localdomain (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 6F28E1F6FC;
	Mon, 22 Dec 2025 00:32:12 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 00/11] drm/panel: Add 5 DDIC panel drivers for 14 Sony
 phones
Date: Mon, 22 Dec 2025 00:32:06 +0100
Message-Id: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHeDSGkC/3WNQQ6CMBAAv0J6dg1tQY0n/mE4lLLCJmVLukokh
 L9buXucSSazKcFEKOpebCrhQkKRM5hTofzoeECgPrMypbFlbTT0aYLZMQYBibyC9bXz1uhbZa4
 qV50ThC459mPu+B1ClnPCJ32OzaPNPJK8YlqP66J/9v9g0VBCXWlvK91fOsRG4uSIAzGeYxpUu
 +/7FyvVGTLIAAAA
X-Change-ID: 20230521-drm-panels-sony-3c5ac3218427
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Casey Connolly <casey.connolly@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5747;
 i=marijn.suijten@somainline.org; h=from:subject:message-id;
 bh=K67x8906beDdx2WsWxtu475jpx65pzBUTHCGk31JWeI=;
 b=owEBbQKS/ZANAwAKAfFi0jHH5IZ2AcsmYgBpSIN6YkG9pGec0D26HJiZ4bHB25d/8INCjaU9i
 YBMsf9neEOJAjMEAAEKAB0WIQROiwG5pb6la1/WZxbxYtIxx+SGdgUCaUiDegAKCRDxYtIxx+SG
 duL5D/0VcS96EtxOGwu/7DcTf+QxrcQUXaRUkZIa/j66BbxcC6JH6IkGwBFStuemq+wbisssVNs
 DzKAADfjTy0in0o4Hp7pTtQ7rVubzo7Ipkhrk3epb9LXPjCTt17N5UVWriR2WNGEiHDrO/Pqgvr
 GrMGK7w8yXx+7+U8woTCLZ4J2YC+cg6YbmJfxm6xh3xAP+Ddo7MIcSfSuMR7kC/A5H4GSiYYd3L
 gjrj9p7Tl05RCgJIuIAs8fBZUSleFfSQtSb3Gz8Xe4ltFfjLIh5RFXGKJlFK4PxBjzfGTT0u4ue
 zS0/Zdc6NbxzV0x7Owp9U9yxj8ZWRTuH0GQIU5IsB41uEarhnrXd3yo+sgaMXD0mESKLxOmdzNl
 uQ1aE2QnrjqX8nv4hjR1yeiAvJQBSya5swLnBftXXBYAcIqq3F6u1nL7MFnCRL1p/ToAr2TjVzC
 XLtMxbwOLU2zLjpwa6zQXgxkFQIiQ3ng2QCol0EvOZKTQgGjqVymSnjRb+D2eZIF1KouCYnynGX
 vDHBMzPiSUDKGeQV6toWuiEzR2GYT3Ip3KrAbutarvqWEiHa5DzkLQBjExZYqixVXEEq6G1xy5r
 jO7q71u1GCrD5VXXgCRh2zxtPM87O0q8CIbX0PnfOg3NUqCk6wIt6NTwFOggfhP09ND3IO8Opt6
 Fn5wQ/l1ZxD9X3A==
X-Developer-Key: i=marijn.suijten@somainline.org; a=openpgp;
 fpr=4E8B01B9A5BEA56B5FD66716F162D231C7E48676

This is the second version of a largely reshaped series that brings 5
new DDIC panel drivers (4 Samsung, 1 LGD) that are compatible with 14
Sony phones:

- LGD LG699QH3-EDB1 (1440x2880@60Hz, DSC):
  - Sony Xperia XZ3
- Samsung SOFEF01 (1080x2520@60Hz):
  - Sony Xperia 5
  - Sony Xperia 10 II
  - Sony Xperia 10 III
  - Sony Xperia 10 IV (yet untested)
  - Sony Xperia 10 V (yet untested)
  - Sony Xperia 10 VI (yet untested)
- Samsung SOFEF03 (1080x2520@120Hz, DSC):
  - Sony Xperia 5 II
  - Sony Xperia 5 III
- Samsung SOUXP00 (1644x3840@60Hz, DSC):
  - Sony Xperia 1
  - Sony Xperia 1 II
- Samsung ANA6707 (1644x3840@120Hz, DSC, dual-DSI):
  - Sony Xperia 1 III
  - Sony Xperia 1 IV (yet untested)
  - Sony Xperia 1 V (yet untested)

DTS changes will follow shortly to collectively enable the GPU,
touchscreen and configure this panel driver for aforementioned (tested)
devices.  After that we can focus on the untested devices and ultimately
all newer devices that are not even mentioned here.

The ANA6707 driver depends on [1] (revert of quad-DSC over dual-DSI) to
function correctly.

A few limitations/issues with these drivers:

- Panels/drivers featuring multiple modes

  Most of these drivers support multiple modes, for example to save
  bandwidth/energy by running on lower resolutions or framerates.
  These can be picked via mode selection by userspace, but are not yet
  forwarded to the drm_panel abstractions.

  Work is underway to bring those atomic modeset calls to drm_panel
  together with moving where drm_dsc_config lives, since its
  configuration depends on the resolution for example.

  For now the choice between either mode has been hardcoded behind a
  static const bool.

- pclk

  The brunt of some older discussion was around getting these command
  mode panels functioning at their desired 60Hz or 120Hz refresh rate
  without tearing/artifacts, and without hacks.  Part of that discussion
  around DSC-specific timing adjustments is happening in [2], but
  the SOFEF01 (non-DSC) Driver-IC is also struggling on the Xperia 5
  specifically, as outlined in that specific patch.  That is currently
  "addressed" with a "porch hack" but should probably have some sort of
  overhead / transfer time taken into account in the MSM DSI driver.

  Let me know what the best place is to collate all the relevant info
  (links to downstream panel DTS, outcomes with different patches and
  tweaks, etc).  A new fd.o drm/msm issue?

- Flickering on brightness changes

  Likely because of the missing "transfer overhead" calculations and/or
  proper sequencing in the DSI host driver, changing brightness results
  in corruption on all (Samsung) panels excluding the LGD panel for the
  XZ3.  It is yet unknown why this is happening and likely requires more
  debugging outside of these panel drivers.

[1]: https://lore.kernel.org/linux-arm-msm/20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-0-654b46505f84@oss.qualcomm.com/
[2]: https://gitlab.freedesktop.org/drm/msm/-/issues/24#note_1917707

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
Changes in v2:
- Names of all panels are now included;
- All drivers are rewritten against the latest _multi() API with dsi_ctx
  struct;
- DSC structures are no longer optional;
- get_brightness is removed;
- set_brightness no longer takes DSI out of LPM - specifically on the
  SOFEF01 brightness changes are ignored otherwise;
- Regulators converted to regulator_bulk_data;
- Panel driver for ANA6707 following up on my dual-DSI-dual-DSC work
  in MSM DPU is now included;
- Possibly more that I've either forgotten or been too careless to
  diff properly with the *over 2.5 years old!* v1:
- Link to v1: https://lore.kernel.org/r/20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org

---
Marijn Suijten (11):
      drm/panel: Clean up SOFEF00 config dependencies
      dt-bindings: display: panel: Describe LGD LH599QH3-EDB1 panel
      drm/panel: Add LGD LH599QH3-EDB1 panel driver for Sony Xperia XZ3
      dt-bindings: display: panel: Describe Samsung SOFEF01-M DDIC
      drm/panel: Add panel driver for Samsung SOFEF01 DDIC
      dt-bindings: display: panel: Describe Samsung SOFEF03-M DDIC
      drm/panel: Add panel driver for Samsung SOFEF03-M DDIC
      dt-bindings: display: panel: Describe Samsung SOUXP00-A DDIC
      drm/panel: Add panel driver for Samsung SOUXP00-A DDIC
      dt-bindings: display: panel: Describe Samsung ANA6707 DDIC
      drm/panel: Add panel driver for Samsung ANA6707 DDIC

 .../bindings/display/panel/lgd,lh599qh3-edb1.yaml  |  76 ++++
 .../bindings/display/panel/samsung,ana6707.yaml    |  91 ++++
 .../bindings/display/panel/samsung,sofef01-m.yaml  | 120 ++++++
 .../bindings/display/panel/samsung,sofef03-m.yaml  |  79 ++++
 .../bindings/display/panel/samsung,souxp00-a.yaml  |  79 ++++
 MAINTAINERS                                        |  30 ++
 drivers/gpu/drm/panel/Kconfig                      |  84 +++-
 drivers/gpu/drm/panel/Makefile                     |   5 +
 drivers/gpu/drm/panel/panel-lgd-lh599qh3-edb1.c    | 340 +++++++++++++++
 drivers/gpu/drm/panel/panel-samsung-ana6707.c      | 461 ++++++++++++++++++++
 drivers/gpu/drm/panel/panel-samsung-sofef01.c      | 463 +++++++++++++++++++++
 drivers/gpu/drm/panel/panel-samsung-sofef03.c      | 373 +++++++++++++++++
 drivers/gpu/drm/panel/panel-samsung-souxp00.c      | 399 ++++++++++++++++++
 13 files changed, 2599 insertions(+), 1 deletion(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20230521-drm-panels-sony-3c5ac3218427

Best regards,
-- 
Marijn Suijten <marijn.suijten@somainline.org>


