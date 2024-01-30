Return-Path: <linux-arm-msm+bounces-8951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA5B841C22
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 07:47:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA3281F20C8C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 06:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5942E53803;
	Tue, 30 Jan 2024 06:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ykT9lGsZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA67524B5
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 06:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706597232; cv=none; b=OAeOka7nc+3ENzuw0ccM9JcWWMBy/cmxkkY1fPewbh59cANuwEEHZafse+rTC+sZ5Kr8IERx1p/FpkA27AfHfts4eNEk2B7l1Q73ShnBKawxifYGTVauMgSMnUlDPr2rCzMlW1zHJtsRoOZpFcYpxkSEJxbSgWc9NT1j606GuhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706597232; c=relaxed/simple;
	bh=4sXJMfjR+PTrADSaa6VnyMvVcG0wetxthgIIrXFaUnw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l7+TxUtfSbqiD8jc0VW3asGsi/dS9CP6/7aNgygVom/UCfCaL3FlXPgleqlUKIKbE/EuZ9gndrFRKIRMkCuV7KiWo3SZCJ/qtQpNABKLIjoHVU+40PvfKezE7VDMBiuK/HaLDD7Ut+trOxaEeFeF5HFc1hjYtcWLmf3/nkLfpT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ykT9lGsZ; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51030ce36fbso3582348e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 22:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706597228; x=1707202028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dqLDmmgNVt25kz9DvyJPnFFAmvKedGK3XgbaetyElYk=;
        b=ykT9lGsZiU20RAKMST/CYZLQwecYAep2ySm/ozWxwuEitwb2FuMOUGt+ElDf6pT6YA
         yQTB0zVlgdcqgtSKsxn1Cy3g5YygWtTYavTPuQtOXJ/ApqkHTTPPMsd2Q+3/7h4jMyMT
         rfcFSbeVJ6Ic6eqNh+jWw/GbXpaT2h1sVs2iQcGFABBNsl0w3emdSS1R60Z0QyH8FFMB
         H78P3NhOcfXuRTS9+r9Ytf8Sqdknlt92tfpkHGBPKgt2AnQM4fNEQc8flLOaHnt6WMl4
         2zepkJSMhpIuqCaoTbAnyb+cyy0HzXrlrRugxgOGbklszbGvToGTlCi3Q4KG3OYjFtlM
         R7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706597228; x=1707202028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqLDmmgNVt25kz9DvyJPnFFAmvKedGK3XgbaetyElYk=;
        b=AAnaaVmP3NQ89FbPIDEaPL0NAEe3tlMI83gPkDNVZxGhxpUebOUBmbDMTboeu5YONk
         ljSU4vwyQqJ+Bq6Tcmw9nJjV/17/5cLV1ACqNo3iuJZg+f5NQ3BMvWALxpSGk84/+xUX
         a4tkj3sd02jXP3wzbQYaHhhQ5GRBWBKAgIDgJBorjeu22bdTf2rgpFOzMtSnrGbhHfhv
         uYT9QqU7paIymZDylOLNbUDjD1sEsIiJJRO85eJTbRHG4iDHbhyAcogqptvtTTyJZ34T
         4vShPqBhLW+lO0LTqz4C697RJl7i8eMWn+x/vVzQohqtcV1afgXXhDSdzVQ0cKNwyA7O
         0xpQ==
X-Gm-Message-State: AOJu0YwdrRefhm1nsSTonKeMf3hZdXzfKid/kUT4bL3i3nBOQypYfzCX
	UIX4FfgwUXtkQ0a+41PqMznUO7kwEh0N6L3arSg0HkDk0F747WI1Wi/6OBnVX8BQDll038Q173G
	I
X-Google-Smtp-Source: AGHT+IFsP81hA9bair2VUa2XT1uNWy0tiHBHvQkTXa0XnR6j+jkWbfPDs75In/v+SdeLMLGSVR+YCA==
X-Received: by 2002:ac2:58d0:0:b0:50e:e557:f1c4 with SMTP id u16-20020ac258d0000000b0050ee557f1c4mr4305021lfo.0.1706597228312;
        Mon, 29 Jan 2024 22:47:08 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d18-20020a056512369200b005101e1870aasm1367068lfs.162.2024.01.29.22.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 22:47:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Jan 2024 08:47:06 +0200
Subject: [PATCH 1/3] wifi: ath10k: populate board data for WCN3990
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240130-wcn3990-board-fw-v1-1-738f7c19a8c8@linaro.org>
References: <20240130-wcn3990-board-fw-v1-0-738f7c19a8c8@linaro.org>
In-Reply-To: <20240130-wcn3990-board-fw-v1-0-738f7c19a8c8@linaro.org>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Yongqin Liu <yongqin.liu@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2121;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=4sXJMfjR+PTrADSaa6VnyMvVcG0wetxthgIIrXFaUnw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBluJtqvjuD743H/VMeFlPphDaQqqClmuEC0fOYj
 d6+r7C1DxKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbibagAKCRCLPIo+Aiko
 1f6nB/997EijkV3o+y7zhXxJBfDxsPhIOCLhx9ejOnp15LAm8Jy8EEjrZFbUto8oGgozTZuQ7f8
 3f86N2joD6TAxgcLWn5jVzanBUJRuGNlh1B/TalPP9Fx5sSlV4ijcuRUwvT+hbSBs86t5RsZ/iW
 fsg/MVdzu0arN6LwZIQhez4IZ5kx4BHQWIGo9Clyi+qV9JHpdHovIpoBOVcY52r4sOHullMfFsK
 BZzrdLU9uJoMPb7/UTNmncpkS9d7inihWFzBdKM3MANUsdJLPl6GvIRMU4YAgOeARicHEh1XfkL
 BbX2e2VLiLuXQOdvqldVyhreiYYUBEfsh+ndOY9/neFhbtvF
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Specify board data size (and board.bin filename) for the WCN3990
platform.

Reported-by: Yongqin Liu <yongqin.liu@linaro.org>
Fixes: 03a72288c546 ("ath10k: wmi: add hw params entry for wcn3990")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/net/wireless/ath/ath10k/core.c      | 3 +++
 drivers/net/wireless/ath/ath10k/hw.h        | 1 +
 drivers/net/wireless/ath/ath10k/targaddrs.h | 3 +++
 3 files changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 0032f8aa892f..4e3736d7aff7 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -720,6 +720,9 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.max_spatial_stream = 4,
 		.fw = {
 			.dir = WCN3990_HW_1_0_FW_DIR,
+			.board = WCN3990_HW_1_0_BOARD_DATA_FILE,
+			.board_size = WCN3990_BOARD_DATA_SZ,
+			.board_ext_size = WCN3990_BOARD_EXT_DATA_SZ,
 		},
 		.sw_decrypt_mcast_mgmt = true,
 		.rx_desc_ops = &wcn3990_rx_desc_ops,
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 93c073091996..9aa2d821b507 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -133,6 +133,7 @@ enum qca9377_chip_id_rev {
 /* WCN3990 1.0 definitions */
 #define WCN3990_HW_1_0_DEV_VERSION	ATH10K_HW_WCN3990
 #define WCN3990_HW_1_0_FW_DIR		ATH10K_FW_DIR "/WCN3990/hw1.0"
+#define WCN3990_HW_1_0_BOARD_DATA_FILE "board.bin"
 
 #define ATH10K_FW_FILE_BASE		"firmware"
 #define ATH10K_FW_API_MAX		6
diff --git a/drivers/net/wireless/ath/ath10k/targaddrs.h b/drivers/net/wireless/ath/ath10k/targaddrs.h
index ec556bb88d65..ba37e6c7ced0 100644
--- a/drivers/net/wireless/ath/ath10k/targaddrs.h
+++ b/drivers/net/wireless/ath/ath10k/targaddrs.h
@@ -491,4 +491,7 @@ struct host_interest {
 #define QCA4019_BOARD_DATA_SZ	  12064
 #define QCA4019_BOARD_EXT_DATA_SZ 0
 
+#define WCN3990_BOARD_DATA_SZ	  26328
+#define WCN3990_BOARD_EXT_DATA_SZ 0
+
 #endif /* __TARGADDRS_H__ */

-- 
2.39.2


