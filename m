Return-Path: <linux-arm-msm+bounces-30487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AF09696D9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 10:19:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0F631C238F9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 08:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EEBF2101A2;
	Tue,  3 Sep 2024 08:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="olU2tuWX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9DB205E15;
	Tue,  3 Sep 2024 08:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725351536; cv=none; b=JVhlpVKEqH5ZxtJDTxeSffrV4ggNKoSNvUynSC3xffMrqx3zBsjvy5lRKj+ejTAOTgc+YUFV+nNYnKCCaUHufZXAq5BX99BWUbvE3H4fPf0ve2jEaAIGewCmp8tQ/+KWL0Yn4g2F8zN10oFG9jliu/QSu2vUCWPEKjwx6x69ENM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725351536; c=relaxed/simple;
	bh=g7ymmQH2esDD1HmWV3+1wWNSYvcNjH8kYis73gaYP5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KrlI8np6Hr3MBFctJE1YDoqe4s1V+swHOGmNXqpmXxvp1m3TmQDnHOYpZFHP9zic30sgq0mOLzS0ELq+ptKjtUQ9EPBk2jv5PC9QZgKksaMs6PPeuZW3aizWWkgOzTUtb6d2eAz7AtfIRM57zXOeTQHltGzt84IdLYjUuKW2Kp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=olU2tuWX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA55C4CEC4;
	Tue,  3 Sep 2024 08:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725351535;
	bh=g7ymmQH2esDD1HmWV3+1wWNSYvcNjH8kYis73gaYP5I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=olU2tuWXIpJl+vvUtyzzy74giwBPEJKRv8ViT1WDop+wVwLYcWCzt7Fu1FzdP6aOQ
	 omZ2kda/DoqTHYh3BkIvuTszwSh13Y9pVP4iFGHuElNuBYCZ8Vz6ReM5BwFxRINaD0
	 iQYhbM7oWAy2epdsGIzsk2p8ejaUfgj+rLveyEhczMqXf8oEfXlZcAUcHKEtTVa7Mj
	 7s1O+Bgz3RyrHOYTi2tc5gAPrI9OHgf4jYH859LrRxIeVK2YmYyLP60IwNE/VmSLvy
	 B6zB3xZ8LTxG5NxuO3KX4cOo45+Q1C3iSPJW0YEaPc51JXE6yIaGfAnbACwSfrOjjx
	 yiZn+bVCzwblw==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
	Edmund Dea <edmund.j.dea@intel.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v5 0/3] drm: fix two issues related to HDMI Connector implementation
Date: Tue,  3 Sep 2024 10:18:50 +0200
Message-ID: <172535151881.1826612.11747911526055879779.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240903-drm-bridge-connector-fix-hdmi-reset-v5-0-daebde6d9857@linaro.org>
References: <20240903-drm-bridge-connector-fix-hdmi-reset-v5-0-daebde6d9857@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 03 Sep 2024 05:01:55 +0300, Dmitry Baryshkov wrote:
> Running IGT tests on Qualcomm Dragonboard820c uncovered two issues with
> the HDMI Connector implementation and with its integration into the
> drm_bridge_connector. Fix those issues.
> 
> Note, I'm not fully satisfied with the drm_bridge_connector move. Maybe
> it's better to add drm_bridge_funcs::connector_reset() and call it from
> __drm_atomic_helper_connector_reset().
> 
> [...]

Applied to misc/kernel.git (drm-misc-fixes).

Thanks!
Maxime

