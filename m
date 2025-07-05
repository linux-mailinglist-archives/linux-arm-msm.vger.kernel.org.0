Return-Path: <linux-arm-msm+bounces-63794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D3DAF9F13
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 10:13:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BB6D4A3A31
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 08:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7029227AC54;
	Sat,  5 Jul 2025 08:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="nJU+SYzM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-65.smtpout.orange.fr [80.12.242.65])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942BA2E3708;
	Sat,  5 Jul 2025 08:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751703222; cv=none; b=I31Tol6fTKowdoj1stAGCdYz2pN+XWnHcNynO8DaQqOTAaa4HvWysW60RRmm4bCIBEZEqKtNnwRAvrUPlXjZDHOyj8DPkcjMmt/GwYR/XL0RHnWzPzRI+i8Bm8Odt1jN2da15KXq7FSeaovzbxsyDXXoP5QbV7D1lVh5yMmHhhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751703222; c=relaxed/simple;
	bh=Diwz3sxzI9NChf/k2ekgjgSqB6LvFdPzKu2q9jD75Jk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rfvUANrUNFQvRk5ce7/gki196eCq+TYHcbcf407nXkZh9ZCvhncxyN25FiH4RAYs40Z4157Uhuy12fV4xR6pLV6Le8R6Mf5ukoHInNn9wgKvqMaZXdQqtAm/W86lFbXPy64Afl8EmGWfFtzfja1PWmWqSM71GLToLvayz5JqOiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=nJU+SYzM; arc=none smtp.client-ip=80.12.242.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id Xy0au5r9q2WitXy0buPMeJ; Sat, 05 Jul 2025 10:12:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1751703150;
	bh=IDZp6l5xw/oHRf5S1uAFtP428wpChGCpPW/ucIcbiWs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=nJU+SYzM4HD/XrQLZ3iaT+Do+WWVzHyaksrtjIcFamUweVgAbklZsIJX29MUp+ZXG
	 vSMj+/j1dL8JH4u2DbwValvwhKc2foovJqlgGhoMa2BxSY52K525AvoKuLO5L5jERR
	 Wdvu39PWdIQ8eYL1FkrScaT7BRCcird9eAhogiYw7FkfYa3en7vekPN0ag448k54Pt
	 mRP6x3xoh06OR7I2bGIhnjScyIR25AQfjsBEEA53ITsZa1cFA29RlaNm+VYe+dJVgl
	 ndQboLgQ2CS3xzYjcr46ILayBI8fv1Y/KPkAOqmS8mxF/mowuddgUzoAOCzjxxeAIK
	 1jjoEQfn/JbEw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 05 Jul 2025 10:12:30 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2] ASoC: qcom: qdsp6: Add an error handling path in q6usb_component_probe()
Date: Sat,  5 Jul 2025 10:12:25 +0200
Message-ID: <1a3bf0ee02f880919190944e581bef2b428ca864.1751703113.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If an error occurs after a successful q6usb_dai_add_aux_device() call,
some resources should be released as already done in the remove function.

Add an error handling path in the probe and the missing clean-up.

Fixes: 72b0b8b29980 ("ASoC: qcom: qdsp6: Add USB backend ASoC driver for Q6")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Changes in v2:
  - Propagate the error code returned by snd_soc_usb_allocate_port()
    instead of an explicit -ENOMEM.   [Dan Carpenter]

v1: https://lore.kernel.org/all/7338875b20cb41693f803c6b9673cf7f3e5f089a.1746781775.git.christophe.jaillet@wanadoo.fr/
---
 sound/soc/qcom/qdsp6/q6usb.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index ebe0c2425927..0d998e872e82 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -327,8 +327,10 @@ static int q6usb_component_probe(struct snd_soc_component *component)
 		return ret;
 
 	usb = snd_soc_usb_allocate_port(component, &data->priv);
-	if (IS_ERR(usb))
-		return -ENOMEM;
+	if (IS_ERR(usb)) {
+		ret = PTR_ERR(usb);
+		goto free_aux_devices;
+	}
 
 	usb->connection_status_cb = q6usb_alsa_connection_cb;
 	usb->update_offload_route_info = q6usb_update_offload_route;
@@ -337,6 +339,12 @@ static int q6usb_component_probe(struct snd_soc_component *component)
 	data->usb = usb;
 
 	return 0;
+
+free_aux_devices:
+	auxiliary_device_delete(&data->uauxdev);
+	auxiliary_device_uninit(&data->uauxdev);
+
+	return ret;
 }
 
 static void q6usb_component_remove(struct snd_soc_component *component)
-- 
2.50.0


