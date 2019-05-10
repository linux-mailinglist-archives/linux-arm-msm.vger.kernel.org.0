Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50E0D1A2DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2019 20:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727663AbfEJSN3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 May 2019 14:13:29 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:39618 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727629AbfEJSN3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 May 2019 14:13:29 -0400
Received: by mail-pl1-f196.google.com with SMTP id g9so3193525plm.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2019 11:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+cojE6T8V5ImSjp0mytrz09qkONdmVExdwfw6/pUjGc=;
        b=XeAFnHRBBr343EevnSOiaR1bEMCHTqALQpIAEPJNwf909qly8FahmCyfUZeUX1OWnI
         1GPrjTDzR1qCUCaSCA7dBSmBED6uVd52YvYcxiu1gnBVQr3MnW39/sLtGqrQPQft8wKI
         mvGujMeNftojXQjMhWAz0MH/R+mi4kT2vXYC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+cojE6T8V5ImSjp0mytrz09qkONdmVExdwfw6/pUjGc=;
        b=nD+pTW0l8txnnekaD4swGkHx2X9duniK0HNhi8F+hD1ttUcnPt6LBv+55n1SLgMZ9y
         n4g06QdgEiddQV9Idsip+LfdMGRwM5nh20O7ApKE3fhDO29uJPs3+87uLqARDbDiFYyr
         WXkTUNVbgRgSezf8AEIAtwpUjBEiNF1VtLjEJGut/99Be5U151VzIx2+snaJiDGl9jzJ
         1Oj1rWsw2pNCk9hL8DOvHn6TB8NctecDdP3W2wAKlBWoWACgaz5t8GYoD4WXa/deWX5Z
         2l0u+5VDWhLalzlsAllNInPwVJYb8dd0M3aaHuev1v8IyeDcO/xlgrp665H23/GImo82
         b7Ww==
X-Gm-Message-State: APjAAAUNVv9b57fM8QPEbHg/xOYdmMFQA40f9AgcEctxorKbpCrOVnQk
        6/t0lmsgKmrQBq9UAhk6Pg8Oiw==
X-Google-Smtp-Source: APXvYqy1va4lBAS5EQUovZMTSaUTDacYI7cW8OQovdmDm+fuRXV2/h038u0QUOGHRT91YxzwxGcG7g==
X-Received: by 2002:a17:902:868b:: with SMTP id g11mr15001069plo.273.1557512008726;
        Fri, 10 May 2019 11:13:28 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id g71sm17169365pgc.41.2019.05.10.11.13.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 May 2019 11:13:28 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Evan Green <evgreen@chromium.org>
Subject: [PATCH] soc: qcom: cmd-db: Mark more things const
Date:   Fri, 10 May 2019 11:13:27 -0700
Message-Id: <20190510181327.121666-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Nothing that cmd db returns is ever non-const, so mark cmd_db_header and
rsc_offset const so that we don't try to modify the database
inadvertently.

Cc: Mahesh Sivasubramanian <msivasub@codeaurora.org>
Cc: Lina Iyer <ilina@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Evan Green <evgreen@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/soc/qcom/cmd-db.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
index c701b3b010f1..7d67cbb52b97 100644
--- a/drivers/soc/qcom/cmd-db.c
+++ b/drivers/soc/qcom/cmd-db.c
@@ -99,7 +99,7 @@ static bool cmd_db_magic_matches(const struct cmd_db_header *header)
 	return memcmp(magic, CMD_DB_MAGIC, ARRAY_SIZE(CMD_DB_MAGIC)) == 0;
 }
 
-static struct cmd_db_header *cmd_db_header;
+static const struct cmd_db_header *cmd_db_header;
 
 static inline const void *rsc_to_entry_header(const struct rsc_hdr *hdr)
 {
@@ -108,7 +108,7 @@ static inline const void *rsc_to_entry_header(const struct rsc_hdr *hdr)
 	return cmd_db_header->data + offset;
 }
 
-static inline void *
+static inline const void *
 rsc_offset(const struct rsc_hdr *hdr, const struct entry_header *ent)
 {
 	u16 offset = le16_to_cpu(hdr->data_offset);

base-commit: e93c9c99a629c61837d5a7fc2120cd2b6c70dbdd
-- 
Sent by a computer through tubes

