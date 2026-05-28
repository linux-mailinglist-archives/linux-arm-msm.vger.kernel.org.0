Return-Path: <linux-arm-msm+bounces-110065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMDQD9UIGGoaawgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 11:20:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9771E5EF79C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 11:20:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C642C3211820
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 09:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A8A13A5434;
	Thu, 28 May 2026 09:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="HhR2PwW7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8273A3E66
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 09:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779959193; cv=none; b=gWvC0+nRVafO1nu6THZoJzpPlp18/ONlpaAlniEz83GLLJjHiAYMOAOTjRdV0GSQcVXKlxguDip0uUw/iRqypwcsPPSph4THKP7pOHI7MewHSdY14eO30hpZ/EB9I6i8RMRNOE9wWSFMd7miNHy6UMz8P0IRzhgvt0KTZhBsbaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779959193; c=relaxed/simple;
	bh=/QZevzqoiILuJdxFPPb5GMy1YhLxYNO661KlZBY80hk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HbBohkKSFkZwhdp5KVnDDARaeFq34u4DS9vNHfC7ejeiqApRcuXlrmSfnqLiz9cOU6QF34Drutu31Fx43Lkklxzw/yN1+Oz0d3KD+/oZA3VPgxpJuzmJiJWEvtoOsCwTjiDzH0vRLongHVeVhGKV75gj6xoiF1P29F31zXoQ5Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HhR2PwW7; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49042aeeb75so78760215e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 02:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779959189; x=1780563989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwHmEHawCvEdEm/8FkS4pO9969OH1I8FzaNoFpRPvxc=;
        b=HhR2PwW7DWABhWfN5YO9YxWGYpulQwkeAmag8KDyjzjmdA0xyMI6F9Nijh152Q2pGt
         RUsyc0VxNfpJ8kS/LmKl+vrgJ52pBLRqF4OvOZGXn4M+2bZD+xt0q7vVOhFB8eNiFP6S
         CyfPfxKW6ok1xt0KfTkSHITQiVqjgP0g4dZZwlXVYl6M0QTCbpamH0QgoqWuXoUWKIZa
         qu/759dl9dxQKMThFpRcQVQCkSHPwy5GWXFx+Od5Foa4CSdwQWv6k6ihnEmhJWu6qA5l
         B/QD9vbNiP4wuVDOC5DjrQUNDyqWl9n/JxTjeWkIXGonBgmXnBkBjC0VaTGSqOjKCEQR
         0xqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779959189; x=1780563989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UwHmEHawCvEdEm/8FkS4pO9969OH1I8FzaNoFpRPvxc=;
        b=fwPZDjRPaNeJgVxammEvc/kq7oBYW8muc6bBCaigGomh4RKTlV/s5BKBKi5A9C4UAm
         tv0STch2rZyv1RznRTdY5yT/ketQdT0lDfpOokgjUrZeKG3K+32zKUYo6WPOrLoQsndD
         n6ntBFp3ZJ/KPMHtjsnPzSSB5rguPQV4WasGlIrBBEHx8yLmNyQNoJ+3ao4HdmpvNtA+
         tYw8mtf6yVh+E8oDclYy7MzUeiCuoEdtd81C2qzB3/Jx1lGteKRWMVjoMN/tMY/XDtj/
         Np6cdXkETRTxgT+jDkcNHxOnfmgsx02nI3hza9Oju9ba7Mg0+FZMNwoyk5xdWyT+Sz7U
         uekg==
X-Forwarded-Encrypted: i=1; AFNElJ91ogq09YLpImAlexdpcxmxX/Po7VrtfoKECCPgZiNKnr39HnlIipMWBupv/5/VEsLr2P8JDxSnDAFoVf+g@vger.kernel.org
X-Gm-Message-State: AOJu0YwcVfILW9SXvZzIbOSByYT+pw7iqRvgA1x5LknC4Qfo9LKNpduw
	Z5EJr4/GMsQ6gX67zuEI1ZnRt6jA04XormWfxyp84dOzAb41v0/ICwahP4sthm+ewqM=
X-Gm-Gg: Acq92OFK7HHfHLaDd1X8wAoNKqaYwGu+YOv63Ua/763Bu8TAPBpHZkp1q3lO5aJYYzM
	2ZJJJWi1jBIadnQyFYayS0WbScGPJSDJ5pvNrUIdeAbvnWNiCbR4dRYyRn8vnO0q+1o+kyHrvYG
	1P6xz5Zq700ilj/LcxfvlEWdTimIkqJWjVkp7YMrBSIf2jj9M2D7O0Hmsf2Mhx0Oy2+bu9l+Eup
	4kgsnvCfhwXNPUPvjuyU5PwCdyFoG46r93PKNZnGO7dqmHBzOP3jiVFR9LXBKO+9K1hmgxzlSsl
	xStmInhjkGzr0s+5kgqSn4t+HJXPy5f7j4GOSIkQ2nj59orbHHlaABIDbn6sJxxMfaPM5b5ACTM
	9UsfC/T0MwwexWwBpzIIeC25GmHrHfNV0IxwXL0zlkuMW3cw3WLXRjA3aAzArzdE+tap/j0Eh1d
	9PbCWQHkCYjQ+YbCfomxMHmOqZP3R/cdqB7uXeKhxaiJbATOGIbDti+mOzcKWlEcWNkz2Gi8hBp
	fehsn5VJ998+KPXxziEAaeFIw==
X-Received: by 2002:a05:600c:35c9:b0:490:45bb:8dd8 with SMTP id 5b1f17b1804b1-49045bb8e65mr438275745e9.25.1779959189267;
        Thu, 28 May 2026 02:06:29 -0700 (PDT)
Received: from localhost (p200300f65f47db04e95e43453a0d1648.dip0.t-ipconnect.de. [2003:f6:5f47:db04:e95e:4345:3a0d:1648])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4908b6af139sm17124775e9.4.2026.05.28.02.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 02:06:28 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	=?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 4/4] ASOC: Unify code style for platform_device_id arrays
Date: Thu, 28 May 2026 11:06:03 +0200
Message-ID:  <d131f7afc3c61ca8ac82a848aaa6ecfbb57ec63b.1779958164.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779958164.git.u.kleine-koenig@baylibre.com>
References: <cover.1779958164.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=10010; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=/QZevzqoiILuJdxFPPb5GMy1YhLxYNO661KlZBY80hk=; b=owGbwMvMwMXY3/A7olbonx/jabUkhiwJ1iaBR1031CW00isu5K1or9LLz5CeJt+09/RBa5Vja wscegQ7GY1ZGBi5GGTFFFnsG9dkWlXJRXau/XcZZhArE8gUBi5OAZjIzHT2v5Idn0wVa6bXbuLw dVmSJ/TD6m/pPGHfC6ZpBjUOJtMebPOp9ax+/+f43NriH8dtaxtuXS3TOdEvFfvvzvOazoQCt6D Tl7MPPKqbxpnLIFb5/anq6yLn7JNSsvpxDuff2zO/M5IsOLngxXQ+9uUH5D4JZfUfq/LQXlZn3s nAnDFJYFXU8m86UfvdlEvN+6K3ncxX9928S+Xw/aCFjN/ar+4pf+uk923zmraPjf/iTXq0rHYb/ QmZdCj445bf9fKHV2y9/qVsR1vCpc8F9SsF90nMaIo9emX+zf/2l+91l5bb+zTuO/QwWGdhytXr H/sio25zKzGUzZNrEBc3rrZbwSOheq51xzeBzlR5ljWTAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110065-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	DMARC_NA(0.00)[baylibre.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCPT_COUNT_TWELVE(0.00)[33];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[amd.com,perex.cz,suse.com,metafoo.de,analog.com,kernel.org,gmail.com,nxp.com,pengutronix.de,intel.com,linux.intel.com,linux.dev,igalia.com,collabora.com,renesas.com,opensource.cirrus.com,vger.kernel.org,lists.ozlabs.org,lists.linux.dev,lists.infradead.org];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 9771E5EF79C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

 - Add a trailing comma for initializers unless the closing brace is on
   the same line and for the list terminator;
 - Use a single space in the list terminator;
 - Use compact one-line style for small entries;
 - s/\t=/ =/ were the tab is only one char wide anyhow;

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 sound/soc/amd/acp/acp-sof-mach.c       | 14 +++++++-------
 sound/soc/codecs/adau7118-hw.c         |  2 +-
 sound/soc/codecs/bt-sco.c              | 10 +++-------
 sound/soc/codecs/wcd934x.c             |  6 ++----
 sound/soc/fsl/imx-pcm-rpmsg.c          |  6 +++---
 sound/soc/intel/avs/boards/da7219.c    |  6 ++----
 sound/soc/intel/avs/boards/dmic.c      |  6 ++----
 sound/soc/intel/avs/boards/es8336.c    |  6 ++----
 sound/soc/intel/avs/boards/hdaudio.c   |  6 ++----
 sound/soc/intel/avs/boards/i2s_test.c  |  6 ++----
 sound/soc/intel/avs/boards/max98357a.c |  6 ++----
 sound/soc/intel/avs/boards/max98373.c  |  6 ++----
 sound/soc/intel/avs/boards/max98927.c  |  6 ++----
 sound/soc/intel/avs/boards/nau8825.c   |  6 ++----
 sound/soc/intel/avs/boards/pcm3168a.c  |  6 ++----
 15 files changed, 36 insertions(+), 62 deletions(-)

diff --git a/sound/soc/amd/acp/acp-sof-mach.c b/sound/soc/amd/acp/acp-sof-mach.c
index 36ecef7013b9..8874151e159a 100644
--- a/sound/soc/amd/acp/acp-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sof-mach.c
@@ -128,31 +128,31 @@ static int acp_sof_probe(struct platform_device *pdev)
 static const struct platform_device_id board_ids[] = {
 	{
 		.name = "rt5682-rt1019",
-		.driver_data = (kernel_ulong_t)&sof_rt5682_rt1019_data
+		.driver_data = (kernel_ulong_t)&sof_rt5682_rt1019_data,
 	},
 	{
 		.name = "rt5682-max",
-		.driver_data = (kernel_ulong_t)&sof_rt5682_max_data
+		.driver_data = (kernel_ulong_t)&sof_rt5682_max_data,
 	},
 	{
 		.name = "rt5682s-max",
-		.driver_data = (kernel_ulong_t)&sof_rt5682s_max_data
+		.driver_data = (kernel_ulong_t)&sof_rt5682s_max_data,
 	},
 	{
 		.name = "rt5682s-rt1019",
-		.driver_data = (kernel_ulong_t)&sof_rt5682s_rt1019_data
+		.driver_data = (kernel_ulong_t)&sof_rt5682s_rt1019_data,
 	},
 	{
 		.name = "nau8825-max",
-		.driver_data = (kernel_ulong_t)&sof_nau8825_data
+		.driver_data = (kernel_ulong_t)&sof_nau8825_data,
 	},
 	{
 		.name = "rt5682s-hs-rt1019",
-		.driver_data = (kernel_ulong_t)&sof_rt5682s_hs_rt1019_data
+		.driver_data = (kernel_ulong_t)&sof_rt5682s_hs_rt1019_data,
 	},
 	{
 		.name = "nau8821-max",
-		.driver_data = (kernel_ulong_t)&sof_nau8821_max98388_data
+		.driver_data = (kernel_ulong_t)&sof_nau8821_max98388_data,
 	},
 	{ }
 };
diff --git a/sound/soc/codecs/adau7118-hw.c b/sound/soc/codecs/adau7118-hw.c
index 45a5d2dcc0f2..ffbd2ea3cde3 100644
--- a/sound/soc/codecs/adau7118-hw.c
+++ b/sound/soc/codecs/adau7118-hw.c
@@ -23,7 +23,7 @@ static const struct of_device_id adau7118_of_match[] = {
 MODULE_DEVICE_TABLE(of, adau7118_of_match);
 
 static const struct platform_device_id adau7118_id[] = {
-	{ .name	= "adau7118" },
+	{ .name = "adau7118" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, adau7118_id);
diff --git a/sound/soc/codecs/bt-sco.c b/sound/soc/codecs/bt-sco.c
index 3afcef2dfa35..6507bd20a650 100644
--- a/sound/soc/codecs/bt-sco.c
+++ b/sound/soc/codecs/bt-sco.c
@@ -79,13 +79,9 @@ static int bt_sco_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id bt_sco_driver_ids[] = {
-	{
-		.name		= "dfbmcs320",
-	},
-	{
-		.name		= "bt-sco",
-	},
-	{},
+	{ .name = "dfbmcs320" },
+	{ .name = "bt-sco" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, bt_sco_driver_ids);
 
diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index bc41a1466c70..a9e6f2923099 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -5899,10 +5899,8 @@ static int wcd934x_codec_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id wcd934x_driver_id[] = {
-	{
-		.name = "wcd934x-codec",
-	},
-	{},
+	{ .name = "wcd934x-codec" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, wcd934x_driver_id);
 
diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index 031e5272215d..8f1185dff780 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -829,9 +829,9 @@ static const struct dev_pm_ops imx_rpmsg_pcm_pm_ops = {
 };
 
 static const struct platform_device_id imx_rpmsg_pcm_id_table[] = {
-	{ .name	= "rpmsg-audio-channel" },
-	{ .name	= "rpmsg-micfil-channel" },
-	{ },
+	{ .name = "rpmsg-audio-channel" },
+	{ .name = "rpmsg-micfil-channel" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, imx_rpmsg_pcm_id_table);
 
diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
index 2b17abcbd2bc..163d9982d797 100644
--- a/sound/soc/intel/avs/boards/da7219.c
+++ b/sound/soc/intel/avs/boards/da7219.c
@@ -259,10 +259,8 @@ static int avs_da7219_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_da7219_driver_ids[] = {
-	{
-		.name = "avs_da7219",
-	},
-	{},
+	{ .name = "avs_da7219" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_da7219_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/dmic.c b/sound/soc/intel/avs/boards/dmic.c
index bf6f580a5164..8d36bc7ddf16 100644
--- a/sound/soc/intel/avs/boards/dmic.c
+++ b/sound/soc/intel/avs/boards/dmic.c
@@ -104,10 +104,8 @@ static int avs_dmic_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_dmic_driver_ids[] = {
-	{
-		.name = "avs_dmic",
-	},
-	{},
+	{ .name = "avs_dmic" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_dmic_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/es8336.c b/sound/soc/intel/avs/boards/es8336.c
index 301cfb3cf15b..36c13db3a272 100644
--- a/sound/soc/intel/avs/boards/es8336.c
+++ b/sound/soc/intel/avs/boards/es8336.c
@@ -309,10 +309,8 @@ static int avs_es8336_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_es8336_driver_ids[] = {
-	{
-		.name = "avs_es8336",
-	},
-	{},
+	{ .name = "avs_es8336" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_es8336_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/hdaudio.c b/sound/soc/intel/avs/boards/hdaudio.c
index aec769e2396c..03cfd91202d3 100644
--- a/sound/soc/intel/avs/boards/hdaudio.c
+++ b/sound/soc/intel/avs/boards/hdaudio.c
@@ -231,10 +231,8 @@ static int avs_hdaudio_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_hdaudio_driver_ids[] = {
-	{
-		.name = "avs_hdaudio",
-	},
-	{},
+	{ .name = "avs_hdaudio" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_hdaudio_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/i2s_test.c b/sound/soc/intel/avs/boards/i2s_test.c
index 9a6b89ffdf14..787d781ba1d9 100644
--- a/sound/soc/intel/avs/boards/i2s_test.c
+++ b/sound/soc/intel/avs/boards/i2s_test.c
@@ -107,10 +107,8 @@ static int avs_i2s_test_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_i2s_test_driver_ids[] = {
-	{
-		.name = "avs_i2s_test",
-	},
-	{},
+	{ .name = "avs_i2s_test" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_i2s_test_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/max98357a.c b/sound/soc/intel/avs/boards/max98357a.c
index e9a87804f918..389a50923d3b 100644
--- a/sound/soc/intel/avs/boards/max98357a.c
+++ b/sound/soc/intel/avs/boards/max98357a.c
@@ -136,10 +136,8 @@ static int avs_max98357a_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_max98357a_driver_ids[] = {
-	{
-		.name = "avs_max98357a",
-	},
-	{},
+	{ .name = "avs_max98357a" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_max98357a_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/max98373.c b/sound/soc/intel/avs/boards/max98373.c
index 8b45b643ca29..b8231f71d3d6 100644
--- a/sound/soc/intel/avs/boards/max98373.c
+++ b/sound/soc/intel/avs/boards/max98373.c
@@ -191,10 +191,8 @@ static int avs_max98373_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_max98373_driver_ids[] = {
-	{
-		.name = "avs_max98373",
-	},
-	{},
+	{ .name = "avs_max98373" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_max98373_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/max98927.c b/sound/soc/intel/avs/boards/max98927.c
index db073125fa4d..d657e7da1cc0 100644
--- a/sound/soc/intel/avs/boards/max98927.c
+++ b/sound/soc/intel/avs/boards/max98927.c
@@ -188,10 +188,8 @@ static int avs_max98927_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_max98927_driver_ids[] = {
-	{
-		.name = "avs_max98927",
-	},
-	{},
+	{ .name = "avs_max98927" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_max98927_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/nau8825.c b/sound/soc/intel/avs/boards/nau8825.c
index d44edacbfc9a..d7ea08bb27cd 100644
--- a/sound/soc/intel/avs/boards/nau8825.c
+++ b/sound/soc/intel/avs/boards/nau8825.c
@@ -293,10 +293,8 @@ static int avs_nau8825_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_nau8825_driver_ids[] = {
-	{
-		.name = "avs_nau8825",
-	},
-	{},
+	{ .name = "avs_nau8825" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_nau8825_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/pcm3168a.c b/sound/soc/intel/avs/boards/pcm3168a.c
index b5bebadbbcb2..9d415fd0499a 100644
--- a/sound/soc/intel/avs/boards/pcm3168a.c
+++ b/sound/soc/intel/avs/boards/pcm3168a.c
@@ -132,10 +132,8 @@ static int avs_pcm3168a_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_pcm3168a_driver_ids[] = {
-	{
-		.name = "avs_pcm3168a",
-	},
-	{},
+	{ .name = "avs_pcm3168a" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_pcm3168a_driver_ids);
 
-- 
2.47.3


