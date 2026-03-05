Return-Path: <linux-arm-msm+bounces-95481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SH69MIDPqGlIxgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 01:34:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E03209776
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 01:34:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 613AD30457E9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 00:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA197218EB1;
	Thu,  5 Mar 2026 00:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9oZgeT8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B462D1EA7F4
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 00:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772670815; cv=none; b=RrWI0n/qaNXkMsn+RmTCQWt3sQ9ozzohCYEFzpIwL62lcabLkc+0qc9PrFY9lMaayfXj4yyhWY8/DtxFbH9m7l1kAy9V9FwEE+/XfwV0gzEAVMpsRYU1LB+o4gU2bgUlrU7vlTx+AltUUkdpYx7PKOsmSYbk8SlomN5Uon/s3Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772670815; c=relaxed/simple;
	bh=gjx/luXr2IInwZB3AG8Qj1FXedQuMcZEoRMWeNjhxzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rEaskXZeiUfwVEzD5lj/6HEPjBhPJxoikVHnqfv3OTnLbbbKnL9tjWTd1sgaxC/LU4B9XI6au3FOGfestFFjZdxprAM9WC1rPsFHN+ac800pNtwFkP6wsGkCxhkkIlfLeSBDLr3cnfm25x6CAIO59Q+mhaEsg9gszdqP+swMrfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9oZgeT8; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7d4c383f2fcso5227668a34.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 16:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772670813; x=1773275613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wH6JXc706Rri1TSvZQPAHiGjKjB+D25ghdkglEV0XbU=;
        b=i9oZgeT8O5OKGYdyLVW9WZBoou79XdyJkbFFrEb1qGPdS1FnNRNF51UplA6jvJpCAN
         RLeYbMlYVJ4EI3CncjDMmhxvOarS3YD4AvkkVB9eqrLFWmyJ0jQgF0j+umODjBbFKP4Z
         PFGIdvhT/IcOE99VtSq9XfxDFGSsDU9KqlcbcY1WyyLS4kmyb1/hKAVU9MoFvyZULkkJ
         +ZNXve2ELnDlOLOHuEscan5hApdesRIdfqg1yvNhN6TpvDsa91l3vQnTqjXg+UwwTuxD
         sOyO+bwx/l2wZQvOE1h69ElD5+L99Mvts9mufBS7e+a4h9ZAlYtlbKtR0Uf9HyifBHBz
         2Plg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772670813; x=1773275613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wH6JXc706Rri1TSvZQPAHiGjKjB+D25ghdkglEV0XbU=;
        b=fT6T4qmKw87CBYbPCmqV8zcxT6Q7fOJJds/MpwCQVqkUA/a2fr0m0j4Kclx26H8PkE
         6klU7W/VBDrXPqoWnpkT3hJKre4jtULrYlvASr7gTbjUQm/iZjLmkDqOuw9eFW8IQhpp
         0q1Htw4gOuY8n0HM3xCW2KTaU9VYDb4zJ5bdG8AANT5s9abq62M5xcqdVNyqoDEEPziT
         gG/KT39yx1ziSwabICIkl57NAhGNfFrpH3XnnxoSee/rvHpvDOVb4204FElGrNKzoaPf
         910lK/0s/icVXYum+8xSEa5VdAnKUlw8rPZItHy5xdhno/CnPh85Sdugc+GS7t2kc/ZS
         QFig==
X-Forwarded-Encrypted: i=1; AJvYcCVmL1dNEN/E+aHhgEVZb1WPR111+4/wLcZI6+U4M9InLDFaBDAwHkiZAMp8GPkBXWfFdm0iIt3ANbPM7NcP@vger.kernel.org
X-Gm-Message-State: AOJu0YxPXPJRIYvdH2WiEjdOOihuwN2SP3QpPCWaJNLqcSlzOz+Sztu0
	F7FaD/rPC5uapBNMggg//oszVKEXVV73mtrayZOKaXeyjelTfW3Whnm4
X-Gm-Gg: ATEYQzzF374GLcz+dTKclxo+BVvROCQ7zI8UReS4lugAamcJ513Ghe6OXH0e7l6KadD
	NoncDLyi6RUt6C498n+8xLLwdbX3hHAKlPgyfFwaRYX+cmfj1cfceoYsaponDrpKe57tKq/Ta4f
	SGi5Szv48wgnVddPr8QbeinDZjiDz2PO6nEGcvNfYPqBnMx0AlyNl6viWapsFOJca4TqDUleG1d
	Uyyw620PStaT0mT++MDQMdo65LambjtareIRL50lMiCBWFUo5hM++W0cMc3JeQxkWuXLTn0SH8L
	VqBoUK/gyUAK1as/U2sTzaGnUNegrO9w8aA3i0S0LcjxvxRQcafnEU4d/flQLIVii59wl8s8Fri
	4LzYTLTbsi7So4PC0bDqI68fhjRcipPQzoYyacHJYg8NM3igtcEBydQ1aehX6BkiRPw4fdlb1Pf
	10c6v9Cw63sI1dpGpiI8Ydpc8YAceUJpGiCTpjU58f/EaS8KA0e9EINRygrKDVkcWerCEl9z4Tb
	fQNainzFR8jXi3d6fr0Vm4KsSedPm99BvNSasiNbiJoXitmMVIt
X-Received: by 2002:a05:6830:71a8:b0:771:5ae2:fce0 with SMTP id 46e09a7af769-7d6d139f00dmr2433844a34.20.1772670812750;
        Wed, 04 Mar 2026 16:33:32 -0800 (PST)
Received: from framework.misc.iastate.edu ([2610:130:110:25d:2aa4:4aff:fed7:9b19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d58644dd17sm16633834a34.5.2026.03.04.16.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 16:33:32 -0800 (PST)
From: Kerigan Creighton <kerigancreighton@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com,
	wcn36xx@lists.infradead.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kerigan Creighton <kerigancreighton@gmail.com>
Subject: [PATCH v2 3/3] wifi: wcn36xx: add support for WCN3610
Date: Wed,  4 Mar 2026 18:32:53 -0600
Message-ID: <20260305003253.1022386-4-kerigancreighton@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305003253.1022386-1-kerigancreighton@gmail.com>
References: <20260305003253.1022386-1-kerigancreighton@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 57E03209776
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,lists.infradead.org,kernel.org,linaro.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-95481-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kerigancreighton@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

The WCN3610 has a lot in common with the WCN3620, so much
of that code was reused.

Tested on an Anki Vector 1.0 and 2.0 robot. Support for other
WCN36xx chips has not been affected.

The WCN3610 requires specific BTC configuration values for
stable Wi-Fi. Without these values, there's some packet loss.
An extra CFG table was made so other chips are not affected.

STA_POWERSAVE causes firmware bugs (long hangs) with the
WCN3610, thus it has been disabled just for this chip.

Signed-off-by: Kerigan Creighton <kerigancreighton@gmail.com>
---
Changes in v2:
 - Move wcn36xx driver changes to the end of the patch set.
---
 drivers/net/wireless/ath/wcn36xx/main.c    |  4 +-
 drivers/net/wireless/ath/wcn36xx/smd.c     | 70 +++++++++++++++++++++-
 drivers/net/wireless/ath/wcn36xx/wcn36xx.h |  1 +
 3 files changed, 73 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/wcn36xx/main.c b/drivers/net/wireless/ath/wcn36xx/main.c
index c3f0860873..6c90c13251 100644
--- a/drivers/net/wireless/ath/wcn36xx/main.c
+++ b/drivers/net/wireless/ath/wcn36xx/main.c
@@ -1438,7 +1438,7 @@ static int wcn36xx_init_ieee80211(struct wcn36xx *wcn)
 		BIT(NL80211_IFTYPE_MESH_POINT);
 
 	wcn->hw->wiphy->bands[NL80211_BAND_2GHZ] = &wcn_band_2ghz;
-	if (wcn->rf_id != RF_IRIS_WCN3620)
+	if (wcn->rf_id != RF_IRIS_WCN3620 && wcn->rf_id != RF_IRIS_WCN3610)
 		wcn->hw->wiphy->bands[NL80211_BAND_5GHZ] = &wcn_band_5ghz;
 
 	if (wcn->rf_id == RF_IRIS_WCN3680)
@@ -1535,6 +1535,8 @@ static int wcn36xx_platform_get_resources(struct wcn36xx *wcn,
 	/* External RF module */
 	iris_node = of_get_child_by_name(mmio_node, "iris");
 	if (iris_node) {
+		if (of_device_is_compatible(iris_node, "qcom,wcn3610"))
+			wcn->rf_id = RF_IRIS_WCN3610;
 		if (of_device_is_compatible(iris_node, "qcom,wcn3620"))
 			wcn->rf_id = RF_IRIS_WCN3620;
 		if (of_device_is_compatible(iris_node, "qcom,wcn3660") ||
diff --git a/drivers/net/wireless/ath/wcn36xx/smd.c b/drivers/net/wireless/ath/wcn36xx/smd.c
index 813553edcb..7352c73f32 100644
--- a/drivers/net/wireless/ath/wcn36xx/smd.c
+++ b/drivers/net/wireless/ath/wcn36xx/smd.c
@@ -83,6 +83,70 @@ static struct wcn36xx_cfg_val wcn36xx_cfg_vals[] = {
 	WCN36XX_CFG_VAL(LINK_FAIL_TX_CNT, 1000),
 };
 
+static struct wcn36xx_cfg_val wcn3610_cfg_vals[] = {
+	WCN36XX_CFG_VAL(CURRENT_TX_ANTENNA, 1),
+	WCN36XX_CFG_VAL(CURRENT_RX_ANTENNA, 1),
+	WCN36XX_CFG_VAL(LOW_GAIN_OVERRIDE, 0),
+	WCN36XX_CFG_VAL(POWER_STATE_PER_CHAIN, 785),
+	WCN36XX_CFG_VAL(CAL_PERIOD, 5),
+	WCN36XX_CFG_VAL(CAL_CONTROL, 1),
+	WCN36XX_CFG_VAL(PROXIMITY, 0),
+	WCN36XX_CFG_VAL(NETWORK_DENSITY, 3),
+	WCN36XX_CFG_VAL(MAX_MEDIUM_TIME, 6000),
+	WCN36XX_CFG_VAL(MAX_MPDUS_IN_AMPDU, 64),
+	WCN36XX_CFG_VAL(RTS_THRESHOLD, 2347),
+	WCN36XX_CFG_VAL(SHORT_RETRY_LIMIT, 15),
+	WCN36XX_CFG_VAL(LONG_RETRY_LIMIT, 15),
+	WCN36XX_CFG_VAL(FRAGMENTATION_THRESHOLD, 8000),
+	WCN36XX_CFG_VAL(DYNAMIC_THRESHOLD_ZERO, 5),
+	WCN36XX_CFG_VAL(DYNAMIC_THRESHOLD_ONE, 10),
+	WCN36XX_CFG_VAL(DYNAMIC_THRESHOLD_TWO, 15),
+	WCN36XX_CFG_VAL(FIXED_RATE, 0),
+	WCN36XX_CFG_VAL(RETRYRATE_POLICY, 4),
+	WCN36XX_CFG_VAL(RETRYRATE_SECONDARY, 131),
+	WCN36XX_CFG_VAL(RETRYRATE_TERTIARY, 129),
+	WCN36XX_CFG_VAL(FORCE_POLICY_PROTECTION, 5),
+	WCN36XX_CFG_VAL(FIXED_RATE_MULTICAST_24GHZ, 1),
+	WCN36XX_CFG_VAL(FIXED_RATE_MULTICAST_5GHZ, 5),
+	WCN36XX_CFG_VAL(DEFAULT_RATE_INDEX_5GHZ, 5),
+	WCN36XX_CFG_VAL(DEFAULT_RATE_INDEX_24GHZ, 6),
+	WCN36XX_CFG_VAL(MAX_BA_SESSIONS, 40),
+	WCN36XX_CFG_VAL(PS_DATA_INACTIVITY_TIMEOUT, 200),
+	WCN36XX_CFG_VAL(PS_ENABLE_BCN_FILTER, 1),
+	WCN36XX_CFG_VAL(PS_ENABLE_RSSI_MONITOR, 1),
+	WCN36XX_CFG_VAL(NUM_BEACON_PER_RSSI_AVERAGE, 20),
+	WCN36XX_CFG_VAL(STATS_PERIOD, 10),
+	WCN36XX_CFG_VAL(CFP_MAX_DURATION, 30000),
+	WCN36XX_CFG_VAL(FRAME_TRANS_ENABLED, 0),
+	WCN36XX_CFG_VAL(BA_THRESHOLD_HIGH, 128),
+	WCN36XX_CFG_VAL(MAX_BA_BUFFERS, 2560),
+	WCN36XX_CFG_VAL(DYNAMIC_PS_POLL_VALUE, 0),
+	WCN36XX_CFG_VAL(TX_PWR_CTRL_ENABLE, 1),
+	WCN36XX_CFG_VAL(ENABLE_CLOSE_LOOP, 1),
+	WCN36XX_CFG_VAL(ENABLE_LPWR_IMG_TRANSITION, 0),
+	/*
+	 * BTC_EXECUTION_MODE
+	 * 0: SMART_COEX
+	 * 1: WLAN_ONLY
+	 * 2: PTA_ONLY
+	 * 3: SMART_MAX_WLAN
+	 * 4: SMART_MAX_BT
+	 * 5: SMART_BT_A2DP
+	 */
+	WCN36XX_CFG_VAL(BTC_EXECUTION_MODE, 2),
+	WCN36XX_CFG_VAL(BTC_STATIC_OPP_WLAN_ACTIVE_WLAN_LEN, 90000),
+	WCN36XX_CFG_VAL(BTC_STATIC_OPP_WLAN_ACTIVE_BT_LEN, 60000),
+	WCN36XX_CFG_VAL(BTC_STATIC_OPP_WLAN_IDLE_WLAN_LEN, 30000),
+	WCN36XX_CFG_VAL(BTC_STATIC_OPP_WLAN_IDLE_BT_LEN, 120000),
+	WCN36XX_CFG_VAL(BTC_FAST_WLAN_CONN_PREF, 1),
+	WCN36XX_CFG_VAL(BTC_STATIC_LEN_LE_BT, 120000),
+	WCN36XX_CFG_VAL(BTC_STATIC_LEN_LE_WLAN, 30000),
+	WCN36XX_CFG_VAL(MAX_ASSOC_LIMIT, 10),
+	WCN36XX_CFG_VAL(ENABLE_MCC_ADAPTIVE_SCHEDULER, 0),
+	WCN36XX_CFG_VAL(ENABLE_DYNAMIC_RA_START_RATE, 0), /* Let the firmware handle it */
+	WCN36XX_CFG_VAL(LINK_FAIL_TX_CNT, 1000),
+};
+
 static struct wcn36xx_cfg_val wcn3680_cfg_vals[] = {
 	WCN36XX_CFG_VAL(CURRENT_TX_ANTENNA, 1),
 	WCN36XX_CFG_VAL(CURRENT_RX_ANTENNA, 1),
@@ -632,6 +696,9 @@ int wcn36xx_smd_start(struct wcn36xx *wcn)
 	if (wcn->rf_id == RF_IRIS_WCN3680) {
 		cfg_vals = wcn3680_cfg_vals;
 		cfg_elements = ARRAY_SIZE(wcn3680_cfg_vals);
+	} else if (wcn->rf_id == RF_IRIS_WCN3610) {
+		cfg_vals = wcn3610_cfg_vals;
+		cfg_elements = ARRAY_SIZE(wcn3610_cfg_vals);
 	} else {
 		cfg_vals = wcn36xx_cfg_vals;
 		cfg_elements = ARRAY_SIZE(wcn36xx_cfg_vals);
@@ -2380,7 +2447,8 @@ int wcn36xx_smd_feature_caps_exchange(struct wcn36xx *wcn)
 	mutex_lock(&wcn->hal_mutex);
 	INIT_HAL_MSG(msg_body, WCN36XX_HAL_FEATURE_CAPS_EXCHANGE_REQ);
 
-	wcn36xx_firmware_set_feat_caps(msg_body.feat_caps, STA_POWERSAVE);
+	if (wcn->rf_id != RF_IRIS_WCN3610)
+		wcn36xx_firmware_set_feat_caps(msg_body.feat_caps, STA_POWERSAVE);
 	if (wcn->rf_id == RF_IRIS_WCN3680) {
 		wcn36xx_firmware_set_feat_caps(msg_body.feat_caps, DOT11AC);
 		wcn36xx_firmware_set_feat_caps(msg_body.feat_caps, WLAN_CH144);
diff --git a/drivers/net/wireless/ath/wcn36xx/wcn36xx.h b/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
index 7ee79593cd..cb409d48f7 100644
--- a/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
+++ b/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
@@ -96,6 +96,7 @@ enum wcn36xx_ampdu_state {
 #define WCN36XX_MAX_POWER(__wcn) (__wcn->hw->conf.chandef.chan->max_power)
 
 #define RF_UNKNOWN	0x0000
+#define RF_IRIS_WCN3610	0x3610
 #define RF_IRIS_WCN3620	0x3620
 #define RF_IRIS_WCN3660	0x3660
 #define RF_IRIS_WCN3680	0x3680
-- 
2.53.0


