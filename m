Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FD1F1A931D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 08:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634778AbgDOGUi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 02:20:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2634791AbgDOGUf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 02:20:35 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43E5AC061A0E
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 23:20:35 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id h11so869070plr.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 23:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ce6sr+CcTt2E/wBJEF5SOEYHtX50oqszVN9CmkzlX/E=;
        b=Fosowwonbvmo4Z2Zo2FOE3ink0asATjzUtSfb4eYAY3FFQeR3PatiHir4oZRNYuley
         X4KJcgo2CCAPUpr6gHfr8oULwt4J3SQLW5YaGv80QTJXyW/FtL6oTjFSxVAkFiY+R2Q+
         KG1IDplabKU+jTWb0dLfXXJgDWHKtoXUdAghY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ce6sr+CcTt2E/wBJEF5SOEYHtX50oqszVN9CmkzlX/E=;
        b=LM8Kp2IE/EnAwfYTYpiEIYsf30STfDV/y7+vCiYsNBRcKZcLBsXK5W5h9OEnBLOdCw
         5p915Jo9Dg2kuO64vsThCltt/TY8sofme+c41qCbAisnR63vWIGNmQ9ct8fbSJLHoi45
         nnoB/hya1cxxmJRBcIzIUhzqTs+jyUycxi8J2BsaItGZRc4QreyaU2cgTlKDIquTLIys
         6JgkKhfj99JcD/xeSRvzwTo6qmJGx9sPL3drJfq3xHMKfxViUeL2fhszsxd+ej+8Sat3
         XaXz1EGEejggoTkSKxZwIWunhatkbms4dl7bYnr7/o7oU2oMIzx4fahckQTME0AZS5UV
         aoVQ==
X-Gm-Message-State: AGi0PubiBMOFP2EvPFwDhrhLwrbFIOrvFBWrrZMore2JUUWjwVKpe3iY
        tez1PhrDPkGyxZ5dCDXW6EiUPw==
X-Google-Smtp-Source: APiQypJJBZRWnzW0QGrGHvXq+dW5VczMHY4xKxhL/5+qEbTKsWyTkgFdUhIZzftweKSaibyeqFCFAQ==
X-Received: by 2002:a17:90a:2645:: with SMTP id l63mr4580241pje.54.1586931634566;
        Tue, 14 Apr 2020 23:20:34 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id x27sm13008542pfj.74.2020.04.14.23.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 23:20:34 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] soc: qcom: cmd-db: Cast sizeof() to int to silence field width warning
Date:   Tue, 14 Apr 2020 23:20:33 -0700
Message-Id: <20200415062033.66406-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.26.0.110.g2183baf09c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We pass the result of sizeof() here to tell the printk format specifier
how many bytes to print. That expects an int though and sizeof() isn't
that type. Cast to int to silence this warning:

drivers/soc/qcom/cmd-db.c: In function 'cmd_db_debugfs_dump':
drivers/soc/qcom/cmd-db.c:281:30: warning: field width specifier '*' expects argument of type 'int', but argument 4 has type 'long unsigned int' [-Wformat=]

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/soc/qcom/cmd-db.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
index 6c308f92a13c..6b5c440c9dc3 100644
--- a/drivers/soc/qcom/cmd-db.c
+++ b/drivers/soc/qcom/cmd-db.c
@@ -280,7 +280,7 @@ static int cmd_db_debugfs_dump(struct seq_file *seq, void *p)
 		ent = rsc_to_entry_header(rsc);
 		for (j = 0; j < le16_to_cpu(rsc->cnt); j++, ent++) {
 			seq_printf(seq, "0x%08x: %*pEp", le32_to_cpu(ent->addr),
-				   sizeof(ent->id), ent->id);
+				   (int)sizeof(ent->id), ent->id);
 
 			len = le16_to_cpu(ent->len);
 			if (len) {
-- 
Sent by a computer, using git, on the internet

