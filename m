Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 213671AB1BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 21:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441799AbgDOTaV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 15:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2436603AbgDOT3T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 15:29:19 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD633C061A10
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 12:29:18 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id g6so403162pgs.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 12:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bm4kU2ZKp3QMbAy5SoYEcpKZV6RD0npZxWuwzSCGnUs=;
        b=KqdhYQ0zbtL9yXg2Bxk2e3AR19MJWNUGM564TCk0GdOiHPJqNwDW5BEC1kr3BJWybs
         gUogR76cvvkgK3pwZp/3ANsg9SJxFBFtpZbE9NvrthZf+5TWO38Nht+VaBh+ZuaGBp2I
         aXk6UIz0PzTSyTO6hk9isRYNGiW1X2Mh2ih6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bm4kU2ZKp3QMbAy5SoYEcpKZV6RD0npZxWuwzSCGnUs=;
        b=fdMjgWZlaLL9JdbSFF6xfZjxUgPwKXD0kLGP86m5VIi6mIpQpIK/snyqyoOaLdWs9k
         WOm4ckXXT43WawFDGHHTOzpWWmYenGPq5NV8ldVDynkuWnUMtOqRivaAkLt4no2A6XS3
         +QAOU2tmhhn3u5jP0Xs5YbJmrMysJxY9ripSeccgaRvH092O52QFFYmXCC2M4zJ+mcuH
         1tHhkVfn+ESFMb4WbxRhVsDayzYNnXWq8DLDGxGajXUBGGvmGds11IfHPphMSogV8EzR
         sqUmLe957j+Lnz6x7FBjN8BNu155RwLd/gXTn5ZmTzapjRiLbayl/8R9a1ZpG7QN9SOr
         VLkg==
X-Gm-Message-State: AGi0PuYcyMAMjP2UEP+AGZFRVEeAqbqeWYvA0yE+6jVfqxAS5whsmIZH
        VFxjrmZ7ZV10s+zNrLfwJSrgZw==
X-Google-Smtp-Source: APiQypJGqAGAcvgr0pgn18GcTFOquOdj4pDUmUBSR2qUPyjJwzMmoxHbt7rZBewVPibsTGM+ZmMj4w==
X-Received: by 2002:a63:1118:: with SMTP id g24mr28220456pgl.259.1586978958145;
        Wed, 15 Apr 2020 12:29:18 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id x4sm14566641pfa.191.2020.04.15.12.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 12:29:17 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH] soc: qcom: cmd-db: Use 5 digits for printing address
Date:   Wed, 15 Apr 2020 12:29:16 -0700
Message-Id: <20200415192916.78339-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.26.0.110.g2183baf09c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The top few bits aren't relevant to pad out because they're always zero.
Let's just print 5 digits instead of 8 so that it's a little shorter and
more readable.

Suggested-by: Lina Iyer <ilina@codeaurora.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/soc/qcom/cmd-db.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
index 57382b64f1da..4f8b739c6485 100644
--- a/drivers/soc/qcom/cmd-db.c
+++ b/drivers/soc/qcom/cmd-db.c
@@ -278,7 +278,7 @@ static int cmd_db_debugfs_dump(struct seq_file *seq, void *p)
 
 		ent = rsc_to_entry_header(rsc);
 		for (j = 0; j < le16_to_cpu(rsc->cnt); j++, ent++) {
-			seq_printf(seq, "0x%08x: %*pEp", le32_to_cpu(ent->addr),
+			seq_printf(seq, "0x%05x: %*pEp", le32_to_cpu(ent->addr),
 				   (int)sizeof(ent->id), ent->id);
 
 			len = le16_to_cpu(ent->len);

base-commit: d6815c5c43d4f9d18e557d27fd27ae8d9cfd450c
prerequisite-patch-id: fc235b174200bb1b24876628a89a841d1c2e4aad
-- 
Sent by a computer, using git, on the internet

