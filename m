Return-Path: <linux-arm-msm+bounces-75580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA80BAC5A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 11:44:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43DB77A4443
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 09:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60BF52F49E9;
	Tue, 30 Sep 2025 09:44:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cmccmta3.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B1E1F03C9;
	Tue, 30 Sep 2025 09:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759225463; cv=none; b=kkmLyaH3wLe8OFufHxDmKijhaSY9xpUJHz1d527x6eEDAtHKpv1DBnU9R5mPZLbrP5f3q5GxfXIU70CZ62yFOEo5fwiSHh29KAsdcZN2loXLV3PScL+WGg/SfXQyg97QoWmpaOLtqpH09xOdj6WGgWAF7rgpr+Qa+Oa2rD37JjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759225463; c=relaxed/simple;
	bh=x2q1Qksfn5zOztbRm8lhJbBJJxiPAv94DfljHKpne/E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YEu+oUO87+3qTLHsTc11MJu6zE5MSDXcxsemxxz6wIUNwCAmVePT36w1TG9Ca8he8PNzMrEFs0biWCyGQF6z7/nzAQ1rIEMs6XGmPlcpH9PFCOPdBQDuQ1Tc3lMdJhwds6BYFTvmVsRX908yJfjlmRGcD+3V3FezPJ/7L1Oj/cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee968dba5b5350-8040a;
	Tue, 30 Sep 2025 17:41:10 +0800 (CST)
X-RM-TRANSID:2ee968dba5b5350-8040a
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[223.108.79.103])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee668dba5b102d-cf033;
	Tue, 30 Sep 2025 17:41:10 +0800 (CST)
X-RM-TRANSID:2ee668dba5b102d-cf033
From: TangBin <tangbin@cmss.chinamobile.com>
To: srini@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tang Bin <tangbin@cmss.chinamobile.com>
Subject: [PATCH] ASoC: codecs: Fix the error of excessive semicolons
Date: Tue, 30 Sep 2025 17:41:03 +0800
Message-Id: <20250930094103.2038-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tang Bin <tangbin@cmss.chinamobile.com>

Remove unnecessary semicolons in the function
pm4125_codec_enable_adc and pm4125_micbias_control.

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/codecs/pm4125.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/pm4125.c b/sound/soc/codecs/pm4125.c
index 706fc668f..aa8319c4a 100644
--- a/sound/soc/codecs/pm4125.c
+++ b/sound/soc/codecs/pm4125.c
@@ -691,7 +691,7 @@ static int pm4125_codec_enable_adc(struct snd_soc_dapm_widget *w,
 						      0x00);
 		pm4125_global_mbias_disable(component);
 		break;
-	};
+	}
 
 	return 0;
 }
@@ -756,7 +756,7 @@ static int pm4125_micbias_control(struct snd_soc_component *component, int micb_
 		dev_err(component->dev, "%s: Invalid micbias number: %d\n",
 			__func__, micb_num);
 		return -EINVAL;
-	};
+	}
 
 	switch (req) {
 	case MICB_PULLUP_ENABLE:
@@ -799,7 +799,7 @@ static int pm4125_micbias_control(struct snd_soc_component *component, int micb_
 			pm4125_global_mbias_disable(component);
 		}
 		break;
-	};
+	}
 
 	return 0;
 }
-- 
2.33.0




