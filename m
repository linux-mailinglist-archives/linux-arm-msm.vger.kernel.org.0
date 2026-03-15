Return-Path: <linux-arm-msm+bounces-97745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AC4nFKQpt2kLNQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 22:50:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBB5292B61
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 22:50:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2760830048F3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 21:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04E59370D70;
	Sun, 15 Mar 2026 21:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WGcSX6Bv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35B037CD2C
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 21:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773611389; cv=none; b=K2zCb1p9VgRNiuPHGDKOiyPM8VSnc6GP5YdqXjyVgn5YaU3B7p/7JMPVZcMnRdZnjXFhtdcIiw8T3VuOdGbuWyCBq/1A4H4NkqQLavuih9xX+1BLtt/HXw31xKOIjq8ZkqBHW3doSndpdxhqbjPo1MNnzQwFWGBv6s5vh5EsaLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773611389; c=relaxed/simple;
	bh=1+OQKMD/CDckp0yWxZa9Evr03RSgcFZmtdVhDhwjsEc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sRa6YrwCwoaVtfDlxTwtw9ppX9NYnOvvG7Yaap1OSvUPGJjb7CYgpL3RXksfv+FqJ4UJ1eozhCChGjv38pTbM4niDMYOLD4IKrsHAmHfDj/NxwpW/CgbkNDuNO5IVyPdoRck4irXEKNeiliZmmWp/UJP2xe/ogLCTchzhXnCtxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WGcSX6Bv; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c6dd5b01e14so1449055a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 14:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773611388; x=1774216188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yyQZotK09J79wwzOqO2g7g0QUr0ijW8kVif2Dvv/7Zs=;
        b=WGcSX6BvwkHrICrJtwrohBbv3i3iMJZn4pnmR/myzoEgkFslRyquAIalKFNStLDFVR
         Z843lBlOiNq7hf7MNa0lXFYWf652Y02sftJFcUiOlAtf+cJIDVqt9BhQzDIEK5PwJ/Vv
         NLjyoiSOMUs+fYacPiGh0S6eCoLcqzbmOquJUiKbE2vY8ZbS/TMFwjI+VrIDQJbTlb55
         eUW5APB9grf/1qY1GSAzYe9Ip9oDmeTdS1qWP8QY7pBFOrqk3TSybVDwodTlS+/JwtO/
         /FwqhAy0aIhLbmcG1vqqtO+CmBHw7+S4cAkxuUeAyseglbEG22QN/qc4OTc8XVgC122Y
         jGcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773611388; x=1774216188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yyQZotK09J79wwzOqO2g7g0QUr0ijW8kVif2Dvv/7Zs=;
        b=H9DaC8C0CTM/VAC96sL6GTG/BN0nS5adwZZivz2uYvaEcRsrGVct93ZgEoao672X/x
         BW0Yif6DME/RwX5A1epsbXZj3zb9FgWAVZm+o1wyfOPQsnO2obTkck174RWCNGFANYMd
         uHMXmagdiqGQGN0uIJkkbDd4p2Fgrxd//6NbRYXFFejwMCt43ToHso6nbJ9+4yhLygJE
         9j5RzUanQ9y0fAUblJxRcfqRm5s+nbgAG4nKy5xj0HJAgdH87m7i5xqfe0Lso6xTY9IC
         bdQ+9pEJGYw4zhSKu7QWFpWLFss96Kg47p2PfJvZGrdQkj0inhTOjo8YXXg5RyxfzPzy
         iVEg==
X-Forwarded-Encrypted: i=1; AJvYcCWOGJOxDGyZhKwh6ivRMDs//sJDVPBor5L9ONQXAFV6FIkyCJDy0wfuOQV1iad6b0yczK+bt6ra6fwC1BOt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Dq7DfWXm6BGk3gkfhmadZxOL5X1YNrGjIEs3FnSKI1VEtkFV
	atXlUiNUEHoglmWWlf+CjceKtc0dRnVNGroX3xT6j1fY1rPE3qw5+1F5
X-Gm-Gg: ATEYQzxsbm5xEj8Sp1cuYzMYrsYCvwfhJkibZXbI2bm6OMtk1qFHMDwFDnz7cq1YMRi
	q8yQxvEkWizh2R1I006jFRpArwQV0OSgepWKPsP1K4wFO84pvcaG42mQJ4nexsW98we+ZIZbkcx
	ALVIzuhMtbAZj+K67TY06oeC85/D2h+YCni89HKuJMJqTg3o6BwpScQzG8gL6ktkG+befuz+0d0
	XPFjrQMZPmHX64tQKdljflWqLsciYKV+gz2YF4a6fWO8+MFshklDPSmhWfSk8A98v+hg4UvkPhz
	nd6VOXlUOGMvXgw97P6+9DHD8MnrSxvP+9JdqnDZJtz6LPI/zZJbtIcn/o4EKpxPB7hPGj+9KKE
	FqqkWaiN7/NXUhOFjkCpa+3vBHv0VjAOrllN6QAh59/PfRQIzmQs/siWsJtWEOieMtoDIFPP1G/
	PyZEIvVONpdgOUWXBfW0q4a5SlBOOyLSj4yEHyN2TbpPghizs8zMs4y6c=
X-Received: by 2002:a05:6a20:1603:b0:398:b178:a53f with SMTP id adf61e73a8af0-398ecca3e40mr10326239637.40.1773611387990;
        Sun, 15 Mar 2026 14:49:47 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73ebb6336bsm7896099a12.21.2026.03.15.14.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 14:49:47 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] phy: qcom-usb-hs: use flexible array member
Date: Sun, 15 Mar 2026 14:49:30 -0700
Message-ID: <20260315214930.4621-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-97745-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BFBB5292B61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Simplify allocation by removing kmalloc_array and just doing kzalloc.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/phy/qualcomm/phy-qcom-usb-hs.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-usb-hs.c b/drivers/phy/qualcomm/phy-qcom-usb-hs.c
index 98a18987f1be..928a982a8a76 100644
--- a/drivers/phy/qualcomm/phy-qcom-usb-hs.c
+++ b/drivers/phy/qualcomm/phy-qcom-usb-hs.c
@@ -34,9 +34,9 @@ struct qcom_usb_hs_phy {
 	struct regulator *v1p8;
 	struct regulator *v3p3;
 	struct reset_control *reset;
-	struct ulpi_seq *init_seq;
 	struct extcon_dev *vbus_edev;
 	struct notifier_block vbus_notify;
+	struct ulpi_seq init_seq[];
 };
 
 static int qcom_usb_hs_phy_set_mode(struct phy *phy,
@@ -209,19 +209,16 @@ static int qcom_usb_hs_phy_probe(struct ulpi *ulpi)
 	int size;
 	int ret;
 
-	uphy = devm_kzalloc(&ulpi->dev, sizeof(*uphy), GFP_KERNEL);
+	size = of_property_count_u8_elems(ulpi->dev.of_node, "qcom,init-seq");
+	if (size < 0)
+		size = 0;
+
+	uphy = devm_kzalloc(&ulpi->dev, struct_size(uphy, init_seq, (size / 2) + 1), GFP_KERNEL);
 	if (!uphy)
 		return -ENOMEM;
 	ulpi_set_drvdata(ulpi, uphy);
 	uphy->ulpi = ulpi;
 
-	size = of_property_count_u8_elems(ulpi->dev.of_node, "qcom,init-seq");
-	if (size < 0)
-		size = 0;
-	uphy->init_seq = devm_kmalloc_array(&ulpi->dev, (size / 2) + 1,
-					   sizeof(*uphy->init_seq), GFP_KERNEL);
-	if (!uphy->init_seq)
-		return -ENOMEM;
 	ret = of_property_read_u8_array(ulpi->dev.of_node, "qcom,init-seq",
 					(u8 *)uphy->init_seq, size);
 	if (ret && size)
-- 
2.53.0


