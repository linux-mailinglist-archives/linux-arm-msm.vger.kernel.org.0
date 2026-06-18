Return-Path: <linux-arm-msm+bounces-113690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wEr/Fkh6M2o/CgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 06:55:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A3D69D917
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 06:55:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hqHLaGyX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113690-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113690-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 067F4301052A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 04:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8963534678C;
	Thu, 18 Jun 2026 04:55:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401EC2E7396
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 04:55:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781758533; cv=none; b=s75/Yl9ckUphpQa7yeVCOuI35SdiCD8DSg48XG7drWTuHfFghAZGzWbjJImAXzCsj2zqkUb3e1WkHe3F7uuQvT5xyU2f37d/2acOMjzPS8+KgabHzyHH3zh+TvXfBGucLe1vOpDSfcerD5PGX5uKOdRimGs/ik1MjvV+PtpngxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781758533; c=relaxed/simple;
	bh=cEEwdeqT05k4doLemATHwf5AlO6Et0xiKaGg6yMA/CQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eFZrduadyUn09+kTS9Dk17Lts3NNPETwIHoVp3JwHjXOPrUzXwyYUuKhMi1uyYzAnB5HxGkhOrtkop/lkxCYxKDLqpqDURt8IG5LAnFxfs2JvZCSlbW3QXfz7hqniRFvbPSifM3TJmPaOvrIU231apf1jycxuzEI0Q1czA2rJWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hqHLaGyX; arc=none smtp.client-ip=209.85.210.173
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84229481d44so190280b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 21:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781758532; x=1782363332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCE4R2BOhT+27QO4acZRvKfk/kBv2Crz43/hbhSMkK8=;
        b=hqHLaGyXVFPYhZlfDXQI3pIHvx5E/rMJZkVIbHaOct83r2aip/xxvn3253l1mVI6R8
         hP5r9kbf+DuXPvGkAFRLBJLqI443vCPj7ZZubyzoMqAh9ibu9Nigw/XXofCvNl+JGM55
         tv9C0EKdY1jHMUj+zJvyxXeef160rqftafPJOIIqnuTv/cbhfi1niDCtTXOiNrKAIScq
         1wMNoV+fJCWUcjlI8vauKiefbhNZbnlvewNKnbhKUhFi+JIP8hTbe1XM4BuJ3KInhbqm
         2j88w8A5IePRCf31Gt4Cs7+fQ+z+K3ZBYIO2mZVfi7dKhLgW4TPosJ+GEXqKbWADbzOM
         CN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781758532; x=1782363332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GCE4R2BOhT+27QO4acZRvKfk/kBv2Crz43/hbhSMkK8=;
        b=ZHXzUWUmYkQYiSeVcUaz+MV+5MSCobSLDEMIRQUCAnSXmzd1y8D9kKrgoIEEDrfJg0
         thLjonCKlNqKgnksa3cbFbGDl5LbUDO3zNnspeIfMpc0OFSTCACP21w33vOhP4eQ3wGw
         rF1vOajtkt8rmDVtBp2wZj7Ppbd5EZje2sxdyEUPHPxdT/HBSQruhfZQKH4v17psJcP7
         0Djk2zSvT/z7r35ZEsaco9pdFiE3UnJwsOxYO9UKOutlFUOGS7UWUcOJq+ZIE8S3H0jo
         d3BgLP1NMsqP99/XLp8iHWeT+eLEPGpG1cWP8Ck//LMkt49pZk/hj9Iqd2zFrw2oCIv6
         MBUg==
X-Forwarded-Encrypted: i=1; AFNElJ++Hyr8ynoWus+u7aEEeg2Dov3/EZMgOostShzLhG2Kbp2ZMuQy8R7OjE3uiS+MZBCFsrMHCiIrhu77DGis@vger.kernel.org
X-Gm-Message-State: AOJu0YyJSGcqFRJBa7KaqTB26YiH3KTs63994524kqhu3x104d69GiND
	uhaYksvz/jNQyBJn+M+3OJaggK3on04vD0nIvBhGnpJVzCo+Z69jg+5C
X-Gm-Gg: AfdE7clpia4ecIQH0d/ZSUdvaxSq/DR+/BFUBYQtjY8TSaNqeRR0Ck66LV/NuOJF/nz
	f51kvtbHNUPHGZNaz7P0cvzMGTn8VhXXouTXRYmJ8hNf64jFWQpaUZCjzaybBLHrjhMA1VaBp2q
	Bhub/bSBZZ/MpDSbtkPFl9o29V1ZDKBfuQ80IMIwha1CBo9dzOzf7ScIvCGZoNOrDl2nImbd2I/
	vA8z9TTIMWSAMGpv1UYjUvHvI4InLKMKOpdNB9aNN7Na8lUuZfNYo4+1QlJmS7WiUy6NaCwRpL9
	x+VDvD52mcUloohIiizsaNU2jyY0UdYJLjeU/8+Edz+p1GZ8mQ3THNkCHx+y+vP5a71uG2IvYg2
	o2y5k/MLuD9CnQXu0rzk2UbCiwONeqKRms94iIeYsM123VJNdXdVtUp2fq7tCGdJam0eZpdCELb
	moPUpnV5BePYyk+M1Vk7n7N/FTZUYpaALzt6Ul+TT+LDIUXSU=
X-Received: by 2002:a05:6a00:238c:b0:835:3d5e:1dd3 with SMTP id d2e1a72fcca58-8453b3a65e0mr2118875b3a.42.1781758531503;
        Wed, 17 Jun 2026 21:55:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434acfd7ecsm18024767b3a.25.2026.06.17.21.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 21:55:31 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 56/78] ASoC: codecs: tas2783: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 11:54:45 +0700
Message-ID: <20260618045507.21339-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-113690-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:cychiang@chromium.org,m:tzungbi@kernel.org,m:groeck@chromium.org,m:bleung@chromium.org,m:david.rhodes@cirrus.com,m:rf@opensource.cirrus.com,m:povik+lin@cutebit.org,m:ckeepax@opensource.cirrus.com,m:support.opensource@diasemi.com,m:nick.li@foursemi.com,m:herve.codina@bootlin.com,m:srini@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:shenghao-ding@ti.com,m:kevin-lu@ti.com,m:baojun.xu@ti.com,m:sen@ti.com,m:oder_chiou@realtek.com,m:lars@metafoo.de,m:nuno.sa@analog.com,m:steven.eckhoff.opensource@gmail.com,m:patches@opensource.cirrus.com,m:chrome-platform@lists.linux.dev,m:asahi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:phucduc.bui@gmail.com,m:povik@cutebit.org,m:matthiasbgg@gmail.com,m:steveneckhoffopensource@g
 mail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,chromium.org,kernel.org,cirrus.com,opensource.cirrus.com,cutebit.org,diasemi.com,foursemi.com,bootlin.com,collabora.com,ti.com,realtek.com,metafoo.de,analog.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,lin];
	RCPT_COUNT_TWELVE(0.00)[35];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B1A3D69D917

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/tas2783-sdw.c | 89 ++++++++++++++++------------------
 1 file changed, 43 insertions(+), 46 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 7d70e7e3f24f..763663daf3e1 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -691,12 +691,12 @@ static s32 tas2783_update_calibdata(struct tas2783_prv *tas_dev)
 		return 0;
 	}
 
-	mutex_lock(&tas_dev->calib_lock);
-	ret = tas2783_validate_calibdata(tas_dev, tas_dev->cali_data.data,
-					 tas_dev->cali_data.read_sz);
-	if (!ret)
-		tas2783_set_calib_params_to_device(tas_dev, tmp_val);
-	mutex_unlock(&tas_dev->calib_lock);
+	scoped_guard(mutex, &tas_dev->calib_lock) {
+		ret = tas2783_validate_calibdata(tas_dev, tas_dev->cali_data.data,
+						 tas_dev->cali_data.read_sz);
+		if (!ret)
+			tas2783_set_calib_params_to_device(tas_dev, tmp_val);
+	}
 
 	return ret;
 }
@@ -764,27 +764,27 @@ static void tas2783_fw_ready(const struct firmware *fmw, void *context)
 		goto out;
 	}
 
-	mutex_lock(&tas_dev->pde_lock);
-	while (offset < (img_sz - FW_FL_HDR)) {
-		offset += tas_fw_get_next_file(&buf[offset], file);
-		dev_dbg(tas_dev->dev,
-			"v=%d, fid=%d, ver=%d, len=%d, daddr=0x%x, fw=%p",
-			file->vendor_id, file->file_id,
-			file->version, file->length,
-			file->dest_addr, file->fw_data);
-
-		ret = sdw_nwrite_no_pm(tas_dev->sdw_peripheral,
-				       file->dest_addr,
-				       file->length,
-				       file->fw_data);
-		if (ret < 0) {
-			dev_err(tas_dev->dev,
-				"FW download failed: %d", ret);
-			break;
+	scoped_guard(mutex, &tas_dev->pde_lock) {
+		while (offset < (img_sz - FW_FL_HDR)) {
+			offset += tas_fw_get_next_file(&buf[offset], file);
+			dev_dbg(tas_dev->dev,
+				"v=%d, fid=%d, ver=%d, len=%d, daddr=0x%x, fw=%p",
+				file->vendor_id, file->file_id,
+				file->version, file->length,
+				file->dest_addr, file->fw_data);
+
+			ret = sdw_nwrite_no_pm(tas_dev->sdw_peripheral,
+					       file->dest_addr,
+					       file->length,
+					       file->fw_data);
+			if (ret < 0) {
+				dev_err(tas_dev->dev,
+					"FW download failed: %d", ret);
+				break;
+			}
+			cur_file++;
 		}
-		cur_file++;
 	}
-	mutex_unlock(&tas_dev->pde_lock);
 
 	if (cur_file == 0) {
 		dev_err(tas_dev->dev, "fw with no files");
@@ -917,22 +917,22 @@ static s32 tas_sdw_hw_params(struct snd_pcm_substream *substream,
 		dev_err(tas_dev->dev,
 			"clear latch failed, err=%d", ret);
 
-	mutex_lock(&tas_dev->pde_lock);
-	/*
-	 * Sometimes, there is error returned during power on.
-	 * So added retry logic to ensure power on so that
-	 * port prepare succeeds
-	 */
-	do {
-		ret = regmap_write(tas_dev->regmap,
-				   SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PDE23,
-						TAS2783_SDCA_CTL_REQ_POW_STATE, 0),
-						TAS2783_SDCA_POW_STATE_ON);
-		if (!ret)
-			break;
-		usleep_range(2000, 2200);
-	} while (retry--);
-	mutex_unlock(&tas_dev->pde_lock);
+	scoped_guard(mutex, &tas_dev->pde_lock) {
+		/*
+		 * Sometimes, there is error returned during power on.
+		 * So added retry logic to ensure power on so that
+		 * port prepare succeeds
+		 */
+		do {
+			ret = regmap_write(tas_dev->regmap,
+					   SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PDE23,
+							TAS2783_SDCA_CTL_REQ_POW_STATE, 0),
+							TAS2783_SDCA_POW_STATE_ON);
+			if (!ret)
+				break;
+			usleep_range(2000, 2200);
+		} while (retry--);
+	}
 	if (ret)
 		return ret;
 
@@ -965,14 +965,11 @@ static s32 tas_sdw_pcm_hw_free(struct snd_pcm_substream *substream,
 
 	sdw_stream_remove_slave(tas_dev->sdw_peripheral, sdw_stream);
 
-	mutex_lock(&tas_dev->pde_lock);
-	ret = regmap_write(tas_dev->regmap,
+	guard(mutex)(&tas_dev->pde_lock);
+	return regmap_write(tas_dev->regmap,
 			   SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PDE23,
 					TAS2783_SDCA_CTL_REQ_POW_STATE, 0),
 			   TAS2783_SDCA_POW_STATE_OFF);
-	mutex_unlock(&tas_dev->pde_lock);
-
-	return ret;
 }
 
 static const struct snd_soc_dai_ops tas_dai_ops = {
-- 
2.43.0


