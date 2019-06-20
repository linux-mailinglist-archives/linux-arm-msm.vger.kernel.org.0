Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C20194DA2A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 21:29:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbfFTT3w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 15:29:52 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46092 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726169AbfFTT3w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 15:29:52 -0400
Received: by mail-pg1-f193.google.com with SMTP id v9so2066575pgr.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2019 12:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=j7d2QvcT/8eBbi8nBlEvZHaNIzBtkV4pzC2LXBZdiaw=;
        b=KQbdA+N4tUMikejyDIercfMIwNrKpgJVfbcS+M3DhvwX0pVh3Gp3vwlajSzs3Txixj
         1WEZwzBfG9CEB0yl2XIJKjuO6LI99wCjpi/cBg4rvAuPnpoNIARDAcGCp8/Nax1IpDcS
         hR/kB11olXk1HJhu8cwrMRh1H/z2rrOERQJJ+osy9pZbCi0ge7Oq9LoS7ctasbVH//kL
         MhJDba+yaRPowKzfKsrGfgzTxUglvCI6kwtgNG6k+crQFEHVzZomr6RVY4PqBJrmKk+W
         fZPRezrMQcdL5BitDAe972AsIuSQKBKVOsgNbF41qMpAjc0Xgggk7mzesKHe9ZSehjXc
         RZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=j7d2QvcT/8eBbi8nBlEvZHaNIzBtkV4pzC2LXBZdiaw=;
        b=e0248gEnB8xRDqbLu6i36tTA7Dbae3REIde/hTZP1p12Eqv3u3Uhf1+IrZCV95mCXu
         xb2X/66jiqL0LmDt8ZegNk16RboPN1RWaxjhVe9NSrdXpz29dtvIwb5mxbDIvGOhJhmL
         NqnnENbEt2rKPTjNigIfm5W5eIURat/Tkt7CmaNNsQscsR1vIfKJfXcyO3peQ530zrKS
         obSk77KTCZ7AY30oVEJLvlQhMWUyUAUp9t1I883jm+lVsApoweWqa87gOuqwH4K05hks
         a3QxAP6htzEtBDbJrhUpUzKuAVrA+fYgMOeuD3MnTrl1WTQwhqOdcf3lXsQs3OQiuTtB
         2D6A==
X-Gm-Message-State: APjAAAU+/fVg4LNnXvLavG6caBUg0s4ftqDAMLRfs981/RetuCXnMk4C
        LLaGMrJ5taXmTqkXWmke5Sw=
X-Google-Smtp-Source: APXvYqxPxPdYwWjEbgiqsp60jXuqvuBjRk9K9JM2KR005s2UYFu5rMbkZ4xi0vud3DX7A7m2GJsTeg==
X-Received: by 2002:a17:90a:aa0d:: with SMTP id k13mr1214674pjq.53.1561058991983;
        Thu, 20 Jun 2019 12:29:51 -0700 (PDT)
Received: from ahmlpt0706 ([2405:204:848a:2221:8df3:86b:64f5:962f])
        by smtp.gmail.com with ESMTPSA id q1sm261021pfn.178.2019.06.20.12.29.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 20 Jun 2019 12:29:51 -0700 (PDT)
Date:   Fri, 21 Jun 2019 00:59:40 +0530
From:   Saiyam Doshi <saiyamdoshi.in@gmail.com>
To:     agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/2] drivers: firmware: qcom: fix line over 80 characters
Message-ID: <20190620192940.GA16646@ahmlpt0706>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch fixes below checkpatch warning.
"WARNING: line over 80 characters"

Signed-off-by: Saiyam Doshi <saiyamdoshi.in@gmail.com>
---
 drivers/firmware/qcom_scm-64.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index 91d5ad7cf58b..986aa3184fd9 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -39,7 +39,8 @@ enum qcom_scm_arg_types {
 			   (((j) & 0x3) << 22) | \
 			   ((num) & 0xf))
 
-#define QCOM_SCM_ARGS(...) QCOM_SCM_ARGS_IMPL(__VA_ARGS__, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
+#define QCOM_SCM_ARGS(...) QCOM_SCM_ARGS_IMPL(__VA_ARGS__, 0, 0, 0, 0, 0, \
+					      0, 0, 0, 0, 0)
 
 /**
  * struct qcom_scm_desc
@@ -352,8 +353,8 @@ int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
 	desc.args[1] = 0;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL, QCOM_SCM_PAS_MSS_RESET, &desc,
-			    &res);
+	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL, QCOM_SCM_PAS_MSS_RESET,
+			    &desc, &res);
 
 	return ret ? : res.a1;
 }
-- 
2.20.1

