Return-Path: <linux-arm-msm+bounces-83013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2944C7F1F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 07:51:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BB3E3A6BD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 06:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BBF82E2DFB;
	Mon, 24 Nov 2025 06:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="bGsyp2Y0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702E52E0916
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 06:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763967046; cv=none; b=DX4GLgdW6N1ywxRWCVzO7ARRQB9Ingbe9WHNHFIVXOCHRNxfXkLx0S0lL4spAARoGyqf1oDAMxoj6M1ZWmWixHgFoCTakKiGWexm67nYF97/hJ/mWq9yZL2JtG4yefayrGGI3JXW6bO2sY2UT7/SUVALWnbfKRuHlUbiLPlArI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763967046; c=relaxed/simple;
	bh=hPxffe85SE/feRXKwYw8pMZU/39AmCqapyWMwo4D6cQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ebC3DOaGoJSe1Jnx8O96p18j4fcPyrV0pa6HZS0Q52kn3AtS1/BdcWW5I5GvBGF90v7Cw6K2UzCghzOEmfrbYCnQI4ZN4tF6AQF+E4YWJitW4yxbgssVc5iy1IwObtGgBpRtch1/5fB8E4ilxL1BJlepY0gFVTuPCqMjUtTn2pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=bGsyp2Y0; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8b2d7c38352so526894885a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Nov 2025 22:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1763967043; x=1764571843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBzF9N1dKK9aG8cBCXibRQcXrqo/BdkER+uqsD1fva0=;
        b=bGsyp2Y0ElvH/UVMAk/BWcyJ9AnJfiMuyt8Dfd16p1fJPskhLYxBS+5SP+ndYmWNtp
         zNK8CiYI+FezF1KkAD1fha1njF9p8KJn/h+ZwSW6LFQXx1AJZASQTlSFaC8GvoAc4fOM
         ll3CP5z0sez2n69Z6UPK85NHMQBwIuJxCohrZAJw9qoxUG26hn+sBzGQPxZo8aXBr1cD
         CQ3UjndRrfqfpFWH2jDIUimlW53uRMssPX0EDjIQdYk/3C/xWoW6C/qEWjYpm6xLyzBH
         JS8KfVvwVmXAG/KUND7wpf3S0ZN8RdK4CI4vDZt4Wc4BA4ENfA0DjA+qZYrPOAzsifCw
         7bpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763967043; x=1764571843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hBzF9N1dKK9aG8cBCXibRQcXrqo/BdkER+uqsD1fva0=;
        b=OGgGnCrG+d2zV2SGOzLwCPHuyGWP2erlxZ+IAkBwkQX5iwXJX8FL2ujjDWOMEEiKrb
         pTxUd/5Shjm99UoguaTgcNStpWWSnO94LPfWydEu36Wym2p6vsSKa1O2hX9/KLXf5LGX
         sPPPMAGaK5vuA2Al6hMy0pof9xNt9MZ4On8pQndLsZOeKloLw16ZL73KOrg8KLFYHG9f
         xqG986ZmZGrDgRak+fxPVdijJrRynDvugLpuo7D66UNWk2Iw5kB+lbCc4KSZt0mbufk9
         Bk6b3qpSDClEVGI/VseNMX8z5aZIwTF7cyyUAjsaTGnYggkHHhRTCgpsqW5eiY+XTdbI
         +iNA==
X-Gm-Message-State: AOJu0Ywfvi6SVWQieHRhZ2eqKn1hV46kVUc1/y1pSzaLvedATMntt+Vf
	krQvPIYBtlaq9qZUAnarHCvKhhCLZ5zfR27QoInySLqZLj15AxQlLWenQuQ6IlrHU5q1VkHoMhV
	+or4S
X-Gm-Gg: ASbGncvrgJSvBxvKaC48kGYqXpRQRuR29LJKreD/jTJXZV73gl2UFnlXN/UFNHz3D07
	loaPmR231JZcfn45jN7byGmv8yfnvDDP8HvIfwWoYwOIEuAOF2P1w80tPpW/DxUh32A95DKK37O
	m3a0CHaEs79zy671Rrn9fgkAYol1tV3ztXiz0P/vujD3q5o/+BDlWToRcKwxmm7vgv3n+JVcpP9
	i89+8dkst6h7Oj63PEiN/WR8UOSMyJcqyilEztlywdIqU3Qcp2zjCvpD2crxeLj5FaFd046Trhy
	JThLB3tIzHQCto2jLIN3txpMGQG6rFaWLx9ZOPgLSqQHtHiAHcM0Wx77uOpSji68WPVll2pKeVu
	HbUmZSmujT/MURajlwF+DIrCBMMJo/jZFADXFcc51ebBBeHdd/VQSZ2N04Ci139qS1yE9rUAgrE
	hyYpD3ZpjeUXwhMQswZliTecumtjKTMaYtmCoNEPd77u0ctuTj2uPJRcDXpioa0KIgpQ==
X-Google-Smtp-Source: AGHT+IGeadpXTYxre3q5TarwP90JExiHx4plmAto9YjMNpDKthPh+yqnWxesSrme8bdG5dYdEFE8Rw==
X-Received: by 2002:a05:620a:3949:b0:8b2:f102:b907 with SMTP id af79cd13be357-8b32af2f63emr1931671485a.37.1763967042983;
        Sun, 23 Nov 2025 22:50:42 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3295db8b1sm889075185a.40.2025.11.23.22.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 22:50:41 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 5/6] ASoC: codecs: wcd939x: fix get_swr_port behavior
Date: Mon, 24 Nov 2025 01:45:58 -0500
Message-ID: <20251124064850.15419-6-jonathan@marek.ca>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251124064850.15419-1-jonathan@marek.ca>
References: <20251124064850.15419-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For example trying to do this:

amixer sset HPHL on
amixer sset HPHR on

Both HPHL and HPHR share the same "portidx" value. After HPHL is enabled,
wcd939x_get_swr_port returns an 'on' state for HPHR as well, and nothing
happens when trying to set HPHR on because it looks like it is already on.
The result is audio plays only on the left side.

To fix this, drop the port_enable array and use ch_mask in port_config to
determine if the switch was enabled.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 sound/soc/codecs/wcd939x.c | 8 ++++----
 sound/soc/codecs/wcd939x.h | 1 -
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 48f82a92722dd..8a95fe39792ea 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -1783,8 +1783,10 @@ static int wcd939x_get_swr_port(struct snd_kcontrol *kcontrol,
 	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(comp);
 	struct wcd939x_sdw_priv *wcd = wcd939x->sdw_priv[mixer->shift];
 	unsigned int portidx = wcd->ch_info[mixer->reg].port_num;
+	u8 ch_mask = wcd->ch_info[mixer->reg].ch_mask;
+	struct sdw_port_config *port_config = &wcd->port_config[portidx - 1];
 
-	ucontrol->value.integer.value[0] = wcd->port_enable[portidx] ? 1 : 0;
+	ucontrol->value.integer.value[0] = !!(port_config->ch_mask & ch_mask);
 
 	return 0;
 }
@@ -1811,9 +1813,7 @@ static int wcd939x_set_swr_port(struct snd_kcontrol *kcontrol,
 	struct wcd939x_sdw_priv *wcd = wcd939x->sdw_priv[mixer->shift];
 	unsigned int portidx = wcd->ch_info[mixer->reg].port_num;
 
-	wcd->port_enable[portidx] = !!ucontrol->value.integer.value[0];
-
-	wcd939x_connect_port(wcd, portidx, mixer->reg, wcd->port_enable[portidx]);
+	wcd939x_connect_port(wcd, portidx, mixer->reg, !!ucontrol->value.integer.value[0]);
 
 	return 1;
 }
diff --git a/sound/soc/codecs/wcd939x.h b/sound/soc/codecs/wcd939x.h
index 6bd2366587a8f..dab7ef108b485 100644
--- a/sound/soc/codecs/wcd939x.h
+++ b/sound/soc/codecs/wcd939x.h
@@ -899,7 +899,6 @@ struct wcd939x_sdw_priv {
 	struct sdw_stream_runtime *sruntime;
 	struct sdw_port_config port_config[WCD939X_MAX_SWR_PORTS];
 	const struct wcd_sdw_ch_info *ch_info;
-	bool port_enable[WCD939X_MAX_SWR_CH_IDS];
 	int active_ports;
 	bool is_tx;
 	struct wcd939x_priv *wcd939x;
-- 
2.51.0


