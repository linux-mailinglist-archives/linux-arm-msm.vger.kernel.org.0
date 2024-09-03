Return-Path: <linux-arm-msm+bounces-30434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD326969139
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 04:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9336D283364
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 02:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD081CDA11;
	Tue,  3 Sep 2024 02:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wGUxtohm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44402AEFD
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 02:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725328929; cv=none; b=FMa5rJCXaRK+vrtBmfWnXtwJkSimeZBe50QqBx308GfxmSGkQ+WA3zmExiQqykTHLF1FD1JT3Rx6PVpOKZz4PKByxlJrs4hwM2uQ4610O/fUvrtDXZxjl0BsjLDfXDR6+8KJ7gvKDvcFNrfb5lqc8J+CB0PGs0enlXAkXkwJ1l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725328929; c=relaxed/simple;
	bh=EYI46Bz/nggRktCfUc4nuXKd2sUlD/7bxU6zar/vXO0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TnSkiButc/Bd1gH8Uwfvyrle3IX4xePoSqFHe0r7Px9z2Hce+HCrZokUykNYnAlC0YtGhuvMNDDR3FUMydd6keoPGgfHRTvWgUsTmlizphbdqbJtKt8x6JIef77Re25pIm/2e1BshdmiVDRxOaTDatnn+Z363KUfyOhrCdvQw/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wGUxtohm; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f4f505118fso54665601fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Sep 2024 19:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725328924; x=1725933724; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jaon4WakhCpB6iL+hPLr96orgJfk9v1/Fqkvo3LCw0o=;
        b=wGUxtohmCwWG2wtqP6/uWSSzQbqVOTxvnCvYqVd8pYTh5ZwlD/1HhT0DFuTY7zaAHQ
         w7UKkojYHeLZhwQuM6JGge9aC2EA6qG6R8ZqH1gubJ2QZLKGusqPHwd6yMhOO36AOT/0
         VSO7qpqem8eLqTubDFF+XRM+dgKLt4ZEfx6w2M7Eqa8youbYvHqLZJKFydyDZVE1N4Qh
         TjulIrk3qIjOnlhbw5mXgv5BBWPPocgQzMKFhn74kq3ho8JFixbld2OtstN+OK+bqZp7
         MbYxxqUsywsw6Tg4nROUJtgteWdj7+3L7I1HyPj2kvt7FHMmWyLoWQHkJzCclZlyHLlC
         gq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725328924; x=1725933724;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jaon4WakhCpB6iL+hPLr96orgJfk9v1/Fqkvo3LCw0o=;
        b=N5FipsVL8S1tlEW5eXQ+S90b4l+toIKNZNkRc+4X22czQTj92rMwLYuscB4NXBmqfK
         5XiVwl/cOp/h2QFXTeBfbakVXs+kAJzltbYH0nUf54L6J7GIG25GgoDoMsuoY5PXannj
         rIbh+I2HhFJskYgF6k2vyvQiAWdQ69TOYJvLxmBI1+19W7NUgBFx7ecbA400zlim5hTa
         +BBtLgeGqaQYeaJlWuWupPmL8vIW3P6KHu8j6nzzi2kJqFS39xWtK9URknElUxHWm62G
         j3PRd4ZObclQKt9emwdCuWz/62CdIVUtkw9Gj2BqS+s5bwxuhgufrPVZ4pH8xgT5EvQp
         Db5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2MeSbyxRp2Yxk2VwwKQvTDrHmR7Xlo+HxzRgDBWZtAKzqRF2ZeOn8DVHbG9k40iDxobRc4VHbOUAuRful@vger.kernel.org
X-Gm-Message-State: AOJu0YxDyTmrAduUMR10rYD4PyGjxLelLfhmqnBckuJeH3FlaJPRKOgM
	IZBQcTgHaWjZC4ZOziqnXXSoXfZ5pCi9GIoNSYWfGaSDj4/uaaXLIArv5wqBgxw=
X-Google-Smtp-Source: AGHT+IH2ddOPWpP9vOPua5bV93XUii65ilyuJnbCbqXryT6U4fN0EdmF5ySMd7clEDi4r6Z/lY2Rhw==
X-Received: by 2002:a2e:4c09:0:b0:2ef:290e:4a39 with SMTP id 38308e7fff4ca-2f626bbbd74mr47016851fa.35.1725328922705;
        Mon, 02 Sep 2024 19:02:02 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614ed15a5sm20827761fa.8.2024.09.02.19.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 19:02:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v5 0/3] drm: fix two issues related to HDMI Connector
 implementation
Date: Tue, 03 Sep 2024 05:01:55 +0300
Message-Id: <20240903-drm-bridge-connector-fix-hdmi-reset-v5-0-daebde6d9857@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABNu1mYC/53NTW7CMBAF4KsgrzvIHk9C3BX3QF0Ye0IsFbuyU
 QRCuXsHNi1iQ7t88/O9q2pcEzf1vrqqynNqqWQJ3dtKhcnnA0OKkhVqJN2jhViPsK8pyiaUnDm
 cSoUxnWGKxwSVG59ABx56P+rOeq9E+qosF/eW3YfkKTX5utxLZ3Ob/s2fDWggw25wFEPksP1M2
 deyLvWgbgUz/gNFQYfO6UjkDAZ+Qu0PutH4GmoFNbjXbA1S8PSE0i/UdK+hJGhvuCezCWN07gF
 dluUbDBv28dYBAAA=
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3353;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=EYI46Bz/nggRktCfUc4nuXKd2sUlD/7bxU6zar/vXO0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm1m4YRSvsImJpHuC/wcLa1DcZOPuYqAiynu6nD
 hrSfiRv7eOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtZuGAAKCRCLPIo+Aiko
 1T8VB/4laRhXOUULaJ+JMQI12xMPUKXQH5ph8rJNcS9B/gmLgbcPLgMhO/fJS4iK0YjhNZoPI0W
 NJ70iNUleeMx0GBlB+RyVJuS/d1SFgtPXp/jx2RDS0Wm21hPh/X3Fm1nEQ2eqX6oz939nxLb2g1
 hrjPMsp+fy/DoJp+WyPqy/YwSqHBZlcYwPUPH1mctmZwJC1GkTrajvdYFKB188SS/N9bztPoBUy
 kG2weWvQkMNcYmSOjnh5gEtxQ6gHkWX2ve9pRhaVXOiHiWkM0q1mHZF6HXhCeGTAAhhiSv/+N17
 PRBvnlt91b/RQK3b1NoB53F/rapRdYsKJEf9cpwjn7/ZFhmz
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Running IGT tests on Qualcomm Dragonboard820c uncovered two issues with
the HDMI Connector implementation and with its integration into the
drm_bridge_connector. Fix those issues.

Note, I'm not fully satisfied with the drm_bridge_connector move. Maybe
it's better to add drm_bridge_funcs::connector_reset() and call it from
__drm_atomic_helper_connector_reset().

Depends on https://lore.kernel.org/dri-devel/20240704-panel-sw43408-fix-v6-1-3ea1c94bbb9b@linaro.org

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v5:
- Rebased on top of drm-misc-next
- Dropped the DRM_MODE_PROP_IMMUTABLE patches, replaced with the IGT
  patch.
- Link to v4: https://lore.kernel.org/r/20240715-drm-bridge-connector-fix-hdmi-reset-v4-0-61e6417cfd99@linaro.org

Changes in v4:
- Fixed DRM_MODE_PROP_IMMUTABLE to use MUST in the single-value clause (Maxime)
- Rebased on top of DRM_DSC_HELPERS patch
- Removed 'depends on DRM_DISPLAY_HELPER' (Maxime)
- Link to v3: https://lore.kernel.org/r/20240702-drm-bridge-connector-fix-hdmi-reset-v3-0-12b0e3124ca4@linaro.org

Changes in v3:
- Document the DRM_MODE_PROP_IMMUTABLE requirements currently exposed
  only via IGT tests (Maxime).
- Move drm_bridge_connector to drm_display_helper.
- Link to v2: https://lore.kernel.org/r/20240623-drm-bridge-connector-fix-hdmi-reset-v2-0-8590d44912ce@linaro.org

Changes in v2:
- Actually pass the flags to drm_property_create_range().
- Link to v1: https://lore.kernel.org/r/20240623-drm-bridge-connector-fix-hdmi-reset-v1-0-41e9894dcdec@linaro.org

---
Dmitry Baryshkov (3):
      drm/display: stop depending on DRM_DISPLAY_HELPER
      drm/bridge-connector: move to DRM_DISPLAY_HELPER module
      drm/bridge-connector: reset the HDMI connector state

 MAINTAINERS                                        |  2 +-
 drivers/gpu/drm/Makefile                           |  1 -
 drivers/gpu/drm/bridge/Kconfig                     |  1 +
 drivers/gpu/drm/display/Kconfig                    | 25 ++++++++++++----------
 drivers/gpu/drm/display/Makefile                   |  2 ++
 .../gpu/drm/{ => display}/drm_bridge_connector.c   | 13 ++++++++++-
 drivers/gpu/drm/imx/dcss/Kconfig                   |  2 ++
 drivers/gpu/drm/imx/lcdc/Kconfig                   |  2 ++
 drivers/gpu/drm/ingenic/Kconfig                    |  2 ++
 drivers/gpu/drm/kmb/Kconfig                        |  2 ++
 drivers/gpu/drm/mediatek/Kconfig                   |  2 ++
 drivers/gpu/drm/meson/Kconfig                      |  2 ++
 drivers/gpu/drm/msm/Kconfig                        |  1 +
 drivers/gpu/drm/omapdrm/Kconfig                    |  2 ++
 drivers/gpu/drm/renesas/rcar-du/Kconfig            |  2 ++
 drivers/gpu/drm/renesas/rz-du/Kconfig              |  2 ++
 drivers/gpu/drm/renesas/shmobile/Kconfig           |  2 ++
 drivers/gpu/drm/rockchip/Kconfig                   |  4 ++++
 drivers/gpu/drm/tegra/Kconfig                      |  1 +
 drivers/gpu/drm/tidss/Kconfig                      |  2 ++
 drivers/gpu/drm/xlnx/Kconfig                       |  1 +
 21 files changed, 59 insertions(+), 14 deletions(-)
---
base-commit: ca097d4d94d808409386fde414370900cc41adad
change-id: 20240623-drm-bridge-connector-fix-hdmi-reset-0ce86af053aa

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


