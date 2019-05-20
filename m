Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0C69238E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2019 15:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730698AbfETNyf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 May 2019 09:54:35 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:33967 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390243AbfETNyH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 May 2019 09:54:07 -0400
Received: by mail-io1-f66.google.com with SMTP id g84so11097362ioa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2019 06:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R+Jpk+XthHVG0qFI+gAyJW+786CYrgpLqGw1dG639sc=;
        b=kUlwrKA6Jg9T6clWLPJgeGUuaE9PZk89mqOd9MnvQdrLTvEBvGPK+iniaIoOUfuyIn
         QXoEpsQP3UrMYBN3jNm4JMiGQwiLHjLiNqoSubqfzcWS9J3nMo+Hq8ev5PXyG69DjXHV
         fcIxJ3nHRXB+WfFuhNsCaJL9aSPf0Y5+wQgDHH6x1REzX40cC8jtntFcuHXQBst6HXIF
         VDgfxkjCCr4/AKfVplJelzBYtiIe0RoYpR9mfu99YYKNYe5yJMuUIkEaZC6dft8Z3as9
         urvLde/3DeJRDV2EZz67QkJ6chBk0YkJGVMrr0UIEB3gNKwPmIuzAloPUTyWXsOgD/2k
         U3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R+Jpk+XthHVG0qFI+gAyJW+786CYrgpLqGw1dG639sc=;
        b=N5yqbgiCyQ5956Cby8No8E6IaJ7b6Nnb+fFCB2aJcDcQj3rl7Qwgyeg9LCW1T87mBz
         jXTC+owQdweL4fbtuEbhE7qWoCFNuDZZ1TofAjhSJgyW+jPpWObld8cneN81R6jI9IGo
         lNWyCCZceOae2PICv6AB23YblEJgDn0ukFD2tW+YEWYokNjLOL4V3sHMCIYrTNSwVxjF
         j6B3u5aIFFXgLEBsNsKkiUZ6TXOIjg5jbcjlTY+pfS8ZBNnvhDpNvgTLJnLMRckKJzcc
         2c6KqpwKYQeghvBQCUJzVerHjfWytEi8TmNVE/VQhD4i2vHqzZi6SKqyRMU7nROJLmVh
         U9gw==
X-Gm-Message-State: APjAAAVcmoLqIs/FvCSJruZO3Mf+5Uy4vnh3UJkSwLzRp4Mte997WYDX
        eXc3N+CyDzI3c9MlW7b8CeHzjA==
X-Google-Smtp-Source: APXvYqwdkj2XNTZy7A/BcMrnQZOHJaq1jEZ10NGzfy1RdztnJ5TzENVJ8ePAl4JCjYVq+ttbEYBKKA==
X-Received: by 2002:a5e:a71a:: with SMTP id b26mr12962200iod.95.1558360446575;
        Mon, 20 May 2019 06:54:06 -0700 (PDT)
Received: from localhost.localdomain (c-71-195-29-92.hsd1.mn.comcast.net. [71.195.29.92])
        by smtp.gmail.com with ESMTPSA id n17sm6581185ioa.0.2019.05.20.06.54.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 06:54:06 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     arnd@arndb.de, subashab@codeaurora.org, david.brown@linaro.org,
        agross@kernel.org, davem@davemloft.net
Cc:     bjorn.andersson@linaro.org, ilias.apalodimas@linaro.org,
        cpratapa@codeaurora.org, syadagir@codeaurora.org,
        evgreen@chromium.org, benchan@google.com, ejcaruso@google.com,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] net: qualcomm: rmnet: don't use C bit-fields in rmnet checksum trailer
Date:   Mon, 20 May 2019 08:53:51 -0500
Message-Id: <20190520135354.18628-6-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520135354.18628-1-elder@linaro.org>
References: <20190520135354.18628-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Replace the use of C bit-fields in the rmnet_map_dl_csum_trailer
structure with a single integral field, using field masks to
encode or get at sub-field values.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h      | 6 ++++--
 drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h
index f3231c26badd..fb1cdb4ec41f 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h
@@ -51,13 +51,15 @@ struct rmnet_map_header {
 
 struct rmnet_map_dl_csum_trailer {
 	u8  reserved1;
-	u8  valid:1;
-	u8  reserved2:7;
+	u8  flags;		/* RMNET_MAP_DL_* */
 	u16 csum_start_offset;
 	u16 csum_length;
 	__be16 csum_value;
 } __aligned(1);
 
+#define RMNET_MAP_DL_CSUM_VALID_FMASK	GENMASK(0, 0)
+#define RMNET_MAP_DL_RESERVED_FMASK	GENMASK(7, 1)
+
 struct rmnet_map_ul_csum_header {
 	__be16 csum_start_offset;
 	__be16 csum_info;	/* RMNET_MAP_UL_* */
diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
index 72b64114505a..a95111cdcd29 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
@@ -362,7 +362,7 @@ int rmnet_map_checksum_downlink_packet(struct sk_buff *skb, u16 len)
 
 	csum_trailer = (struct rmnet_map_dl_csum_trailer *)(skb->data + len);
 
-	if (!csum_trailer->valid) {
+	if (!u8_get_bits(csum_trailer->flags, RMNET_MAP_DL_CSUM_VALID_FMASK)) {
 		priv->stats.csum_valid_unset++;
 		return -EINVAL;
 	}
-- 
2.20.1

