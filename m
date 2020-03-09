Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE0EC17E78A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 19:51:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbgCISv2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 14:51:28 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:50995 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727505AbgCISv1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 14:51:27 -0400
Received: by mail-pj1-f66.google.com with SMTP id u10so277454pjy.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2020 11:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KlRXdnxj2Ny2y1SE3JlpQNEkyXKUGq38gqBn9QXInvI=;
        b=n/gHlBJqW+XXY/SauS2FEzFd+YOJE/NOQ9qA9YuexD16c6s/bT2qX7CBZaahLEfCP6
         hMkH3Z+CaU7WJL87znswp53rgJuUJyiJM7C2oZTeIM7Zya49z4vcS2fG4vR/2w5IIItc
         soHjU4a0bumE/+uVBcuAbC07De4cXkbtikDyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KlRXdnxj2Ny2y1SE3JlpQNEkyXKUGq38gqBn9QXInvI=;
        b=EomZHAFsu7Pguh0o4GeMCz4xKPdwhnMqbYCMCumBPpUpUGlqL4tICaa1XjotH2IyCd
         jw4A+2nvbXvdJkz3+LKdLt4kYt7ggRNoUZOGchZAtl2BdoLBLI6vSSvBCQP88CHtT7y+
         d+PBJMhKxYtstfPgWgsBZoSBQ4UshCg1HByMDwqZQ1e765cyhHN5Ra3YOaC7NJh9RBOJ
         sol3XC2PjC1YkVNhSiok+i1uDSrk2MK4Wu+9m+Aj3X+ZEW/jUBeBBuqgWbS11qecGa+l
         2BUkvO6m2mttI+BeZuQ8aE5t5J/F8TZWbTy8DpXB81P9FtuH3dK776abttt4jPg0kmgK
         p6Vg==
X-Gm-Message-State: ANhLgQ0R2WpuBdJy/fh8k6DB3GZY6yIHbw0ImjXYQFqiw+jLGsn7IFjT
        mwMGifejIgtu+7woVK1ZnzWVcQ==
X-Google-Smtp-Source: ADFU+vsVGrRceJW/ujmAZpF6YeR9HYUMhFCBSm78ZivX9FVTSj2vlAA+5vyP+j4yQEhXkjJD/I/nFg==
X-Received: by 2002:a17:90a:8d86:: with SMTP id d6mr89910pjo.119.1583779884729;
        Mon, 09 Mar 2020 11:51:24 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id u23sm45168990pfm.29.2020.03.09.11.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 11:51:24 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vaishali Thakkar <vaishali.thakkar@linaro.org>
Subject: [PATCH] soc: qcom: socinfo: Use seq_putc() if possible
Date:   Mon,  9 Mar 2020 11:51:23 -0700
Message-Id: <20200309185123.65265-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a single character that we're printing out. Use seq_putc() for
that to simplify the code.

Cc: Vaishali Thakkar <vaishali.thakkar@linaro.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/soc/qcom/socinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 7864b75ce569..ebb49aee179b 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -277,7 +277,7 @@ static int show_image_##type(struct seq_file *seq, void *p)		  \
 {								  \
 	struct smem_image_version *image_version = seq->private;  \
 	seq_puts(seq, image_version->type);			  \
-	seq_puts(seq, "\n");					  \
+	seq_putc(seq, '\n');					  \
 	return 0;						  \
 }								  \
 static int open_image_##type(struct inode *inode, struct file *file)	  \

base-commit: 2c523b344dfa65a3738e7039832044aa133c75fb
-- 
Sent by a computer, using git, on the internet

