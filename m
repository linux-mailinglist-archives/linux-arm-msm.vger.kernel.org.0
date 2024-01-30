Return-Path: <linux-arm-msm+bounces-9074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7C2842C8C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 20:23:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 082EE1F250D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 19:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E507AE7F;
	Tue, 30 Jan 2024 19:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Czldj+uX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977367AE60
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 19:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706642592; cv=none; b=DYqLoaYYngOBT+2QJJhwyb7ZjodVSyMH31oWUMCoc+4xtRrLevbygUIh3p26jp5WDSOvjPl3QRaa3lc7dtsy1al6DwAwrzy9i4y84xSNwpizEbYXjnrxU+nMhYTg0zw4ITVvi72qh4mrOrlo4NiHsBosYUs77WariU1zMjjXzkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706642592; c=relaxed/simple;
	bh=Y2XYalvyDF0LSGy+Ssi1gO1ShePw9aqEjMk9LIb7/dk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NSv18Mv7LMl2ZWcklvC5Bw3LO+BCXxH7u+FbTLl5638xdcmEJNCU2EproW5/3M7dyIgWi5QkM4FG7ug5U1Y/bPnCx5oAEbwFxBOCfHzIEPSayPmZpxPpx5x+eL3r5NcDhfOMbyf3FULB2YOH9NamWdbw1PwnAuOI0AtmBs1r0HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Czldj+uX; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-7bfd5570ed0so122128039f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 11:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706642590; x=1707247390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Nt9gsHgFMlaiKN5ea39BAFtn18uNvSPnFNNqT/KSks=;
        b=Czldj+uXX2VbHJZf2+Zt0x28FYAWXvA5tSkb1Jw4rv4w59eVuFaMacBjkB7Pr74oh0
         YtRnlulGTWC+lZpdjG+Joye/3S1BgcDkO6pcbQb7TPMUaFCq7XcrXFOpLF4Hcuy8RC+E
         SrQ716zlJN1CehSfLAAxkmjW+sg0DYVvDK96C8RKUSlUFGbJ4DcdiJm9noMbuOK5CkBH
         juBf/RUoiGdp3gVA/24NKTq+n8qCW8KEhhIXqaw2IuZqJuF5S/WTnPjcie2PY6X5sF4L
         JyQtALif/pqY+h5qym/2wwaMlGaQgy01NijGVP70S+Z8jBCk3opzbuJQO8UrGn4JXfbQ
         NYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706642590; x=1707247390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Nt9gsHgFMlaiKN5ea39BAFtn18uNvSPnFNNqT/KSks=;
        b=anhwPg6h+7XB0wfqegfXDxh4R+wSBcOkgBqEAyP97Ts6/n1KpvsZHtaHYL20McuDyW
         sjpsp68FoShmNReUHW6PszjEKlEz4a5pnpHGjWICWOmMQjrnGD91zqRycHlfoSWHxFQ6
         x5wBH2HyM4nBaxY2LAs0i9+UJtcHop8TIaV4B2lHQmpgnOBfFjwumqRtN739lmrSYDcL
         gNVwa5On/4EOT5KG5EyHzgBPDl9BNAwMj+Ucnb6Ge8gJKkSCe95jWtk5A4J/3d1DbnMT
         xz37mGljzy7rAzNIicN5Hkt2zenV1v9hqP/ZW536vsxHKljGaynileMs+1GxwTCdf4ZC
         6I/w==
X-Gm-Message-State: AOJu0YxETdJDBjxZrZ9owvgoeJK1svuiTvyVa5K2iQWa1TFB4bKPZrvI
	TMhfBX0BdlLFYTHRxHsdq5/s5tuIPrNWUxX25SqlSbLu8c2icFirCB2xIJkak/o=
X-Google-Smtp-Source: AGHT+IEU2PbnQQI+R4Qm7rBHo4FAbpAqDDFj+7F6iVI1GVHdEr+lP+XFz6AvY9uUmD0GBcaFAoBrrw==
X-Received: by 2002:a92:c106:0:b0:363:8727:dddf with SMTP id p6-20020a92c106000000b003638727dddfmr124649ile.7.1706642589735;
        Tue, 30 Jan 2024 11:23:09 -0800 (PST)
Received: from localhost.localdomain (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.gmail.com with ESMTPSA id t18-20020a92c912000000b003637871ec98sm2157762ilp.27.2024.01.30.11.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 11:23:09 -0800 (PST)
From: Alex Elder <elder@linaro.org>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: mka@chromium.org,
	andersson@kernel.org,
	quic_cpratapa@quicinc.com,
	quic_avuyyuru@quicinc.com,
	quic_jponduru@quicinc.com,
	quic_subashab@quicinc.com,
	elder@kernel.org,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/7] net: ipa: stash modem TX and RX endpoints
Date: Tue, 30 Jan 2024 13:22:58 -0600
Message-Id: <20240130192305.250915-2-elder@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240130192305.250915-1-elder@linaro.org>
References: <20240130192305.250915-1-elder@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rather than repeatedly looking up the endpoints in the name map,
save the modem TX and RX endpoint pointers in the netdev private
area.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_modem.c | 49 +++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ipa/ipa_modem.c b/drivers/net/ipa/ipa_modem.c
index 423422a2a445f..a6f6cd149c1b6 100644
--- a/drivers/net/ipa/ipa_modem.c
+++ b/drivers/net/ipa/ipa_modem.c
@@ -39,10 +39,14 @@ enum ipa_modem_state {
 /**
  * struct ipa_priv - IPA network device private data
  * @ipa:	IPA pointer
+ * @tx:		Transmit endpoint pointer
+ * @rx:		Receive endpoint pointer
  * @work:	Work structure used to wake the modem netdev TX queue
  */
 struct ipa_priv {
 	struct ipa *ipa;
+	struct ipa_endpoint *tx;
+	struct ipa_endpoint *rx;
 	struct work_struct work;
 };
 
@@ -59,11 +63,11 @@ static int ipa_open(struct net_device *netdev)
 	if (ret < 0)
 		goto err_power_put;
 
-	ret = ipa_endpoint_enable_one(ipa->name_map[IPA_ENDPOINT_AP_MODEM_TX]);
+	ret = ipa_endpoint_enable_one(priv->tx);
 	if (ret)
 		goto err_power_put;
 
-	ret = ipa_endpoint_enable_one(ipa->name_map[IPA_ENDPOINT_AP_MODEM_RX]);
+	ret = ipa_endpoint_enable_one(priv->rx);
 	if (ret)
 		goto err_disable_tx;
 
@@ -75,7 +79,7 @@ static int ipa_open(struct net_device *netdev)
 	return 0;
 
 err_disable_tx:
-	ipa_endpoint_disable_one(ipa->name_map[IPA_ENDPOINT_AP_MODEM_TX]);
+	ipa_endpoint_disable_one(priv->tx);
 err_power_put:
 	pm_runtime_put_noidle(dev);
 
@@ -97,8 +101,8 @@ static int ipa_stop(struct net_device *netdev)
 
 	netif_stop_queue(netdev);
 
-	ipa_endpoint_disable_one(ipa->name_map[IPA_ENDPOINT_AP_MODEM_RX]);
-	ipa_endpoint_disable_one(ipa->name_map[IPA_ENDPOINT_AP_MODEM_TX]);
+	ipa_endpoint_disable_one(priv->rx);
+	ipa_endpoint_disable_one(priv->tx);
 out_power_put:
 	pm_runtime_mark_last_busy(dev);
 	(void)pm_runtime_put_autosuspend(dev);
@@ -233,14 +237,14 @@ static void ipa_modem_netdev_setup(struct net_device *netdev)
  */
 void ipa_modem_suspend(struct net_device *netdev)
 {
-	struct ipa_priv *priv = netdev_priv(netdev);
-	struct ipa *ipa = priv->ipa;
+	struct ipa_priv *priv;
 
 	if (!(netdev->flags & IFF_UP))
 		return;
 
-	ipa_endpoint_suspend_one(ipa->name_map[IPA_ENDPOINT_AP_MODEM_RX]);
-	ipa_endpoint_suspend_one(ipa->name_map[IPA_ENDPOINT_AP_MODEM_TX]);
+	priv = netdev_priv(netdev);
+	ipa_endpoint_suspend_one(priv->rx);
+	ipa_endpoint_suspend_one(priv->tx);
 }
 
 /**
@@ -268,14 +272,14 @@ static void ipa_modem_wake_queue_work(struct work_struct *work)
  */
 void ipa_modem_resume(struct net_device *netdev)
 {
-	struct ipa_priv *priv = netdev_priv(netdev);
-	struct ipa *ipa = priv->ipa;
+	struct ipa_priv *priv;
 
 	if (!(netdev->flags & IFF_UP))
 		return;
 
-	ipa_endpoint_resume_one(ipa->name_map[IPA_ENDPOINT_AP_MODEM_TX]);
-	ipa_endpoint_resume_one(ipa->name_map[IPA_ENDPOINT_AP_MODEM_RX]);
+	priv = netdev_priv(netdev);
+	ipa_endpoint_resume_one(priv->tx);
+	ipa_endpoint_resume_one(priv->rx);
 
 	/* Arrange for the TX queue to be restarted */
 	(void)queue_pm_work(&priv->work);
@@ -306,16 +310,21 @@ int ipa_modem_start(struct ipa *ipa)
 	SET_NETDEV_DEV(netdev, &ipa->pdev->dev);
 	priv = netdev_priv(netdev);
 	priv->ipa = ipa;
+	priv->tx = ipa->name_map[IPA_ENDPOINT_AP_MODEM_TX];
+	priv->rx = ipa->name_map[IPA_ENDPOINT_AP_MODEM_RX];
 	INIT_WORK(&priv->work, ipa_modem_wake_queue_work);
-	ipa->name_map[IPA_ENDPOINT_AP_MODEM_TX]->netdev = netdev;
-	ipa->name_map[IPA_ENDPOINT_AP_MODEM_RX]->netdev = netdev;
+
+	priv->tx->netdev = netdev;
+	priv->rx->netdev = netdev;
+
 	ipa->modem_netdev = netdev;
 
 	ret = register_netdev(netdev);
 	if (ret) {
 		ipa->modem_netdev = NULL;
-		ipa->name_map[IPA_ENDPOINT_AP_MODEM_RX]->netdev = NULL;
-		ipa->name_map[IPA_ENDPOINT_AP_MODEM_TX]->netdev = NULL;
+		priv->rx->netdev = NULL;
+		priv->tx->netdev = NULL;
+
 		free_netdev(netdev);
 	}
 
@@ -355,9 +364,11 @@ int ipa_modem_stop(struct ipa *ipa)
 		if (netdev->flags & IFF_UP)
 			(void)ipa_stop(netdev);
 		unregister_netdev(netdev);
+
 		ipa->modem_netdev = NULL;
-		ipa->name_map[IPA_ENDPOINT_AP_MODEM_RX]->netdev = NULL;
-		ipa->name_map[IPA_ENDPOINT_AP_MODEM_TX]->netdev = NULL;
+		priv->rx->netdev = NULL;
+		priv->tx->netdev = NULL;
+
 		free_netdev(netdev);
 	}
 
-- 
2.40.1


