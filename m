Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 742FD24A626
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Aug 2020 20:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgHSSrU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Aug 2020 14:47:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53162 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726466AbgHSSrQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Aug 2020 14:47:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1597862835;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=n1r99O9sF3KmCtBpBDuUEdXHcIRahMGRsJ4wLhKM7X4=;
        b=UCa6lW2zyTtD76NQjiBoWJqjcdGQVu1JbBuAV1nYAu1UejvVulLRXKhRnyseYwxVNexP9i
        X275g+93XYy20W20wdKguIN4ehMfHQldZSrB6hWSzRkgwhwEiouYNH7lq4WbYEpMvLC3gO
        fnhOa/jWbZolBPccFS6rRxLraTAQR+E=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-Uj9oQGDPP6aJfe-jB8Q11g-1; Wed, 19 Aug 2020 14:47:13 -0400
X-MC-Unique: Uj9oQGDPP6aJfe-jB8Q11g-1
Received: by mail-qk1-f200.google.com with SMTP id q3so16001355qkj.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2020 11:47:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=n1r99O9sF3KmCtBpBDuUEdXHcIRahMGRsJ4wLhKM7X4=;
        b=PyIgptKaQqQTWzAJTldoHjCzM5uXFX/WyuuxNEFUN9kjoZoE6OnbFcDqNQvNrbKsGp
         4WI5+5tyz2Kjeyf+xcd4PhxT4vj4wF+va9D1zYSJzMZCDijOrVJrZU1Z1CZW4H88kSQi
         yb3Hq9yZ/sl00PsUhGY/4Mb2gzmEuzs/irNuvuce23tOX7OlK7UB4e88rKTmwPuTZ/9A
         l94rHOfXlhhuDwOqpEgOs2qS2NQOTh2BNXeeWIzlR0y+ZavU9utI+wJYBycTAVUfTCI3
         zzAFa/4v/MJ7BF/bAdK4LMgZOS3+tN2LnzW2x4VAuHBC96wLckQkdBKC3JaF5yFUgiYS
         xS6w==
X-Gm-Message-State: AOAM532SlTtHU8dYCDuZiSYCddxhzIZJA9ED39C7TQNhwhXQ4eMDP3yO
        0oPLVhIPdXp00kgJzcjL4iAiTlGeXiIlp2GNn+VPG9iMPvpBouFM2mofNX+XZzdCdhOBb6i0wAN
        sllwpJBBUkfgAd/BtfUadbCCKig==
X-Received: by 2002:ac8:568a:: with SMTP id h10mr23862125qta.239.1597862832926;
        Wed, 19 Aug 2020 11:47:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzBbFyRJFyOM+0EEV33sP7wXkBj/aJZVelGHRYuIOT/f/OlA76miUUwSBAv7jlSbeVETUZcw==
X-Received: by 2002:ac8:568a:: with SMTP id h10mr23862108qta.239.1597862832688;
        Wed, 19 Aug 2020 11:47:12 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id 20sm29006673qtp.53.2020.08.19.11.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 11:47:12 -0700 (PDT)
From:   trix@redhat.com
To:     agross@kernel.org, bjorn.andersson@linaro.org, sibis@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] soc: qcom: initialize local variable
Date:   Wed, 19 Aug 2020 11:46:37 -0700
Message-Id: <20200819184637.15648-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Tom Rix <trix@redhat.com>

clang static analysis reports this problem

pdr_interface.c:596:6: warning: Branch condition evaluates
  to a garbage value
        if (!req.service_path[0])
            ^~~~~~~~~~~~~~~~~~~~

This check that req.service_path was set in an earlier loop.
However req is a stack variable and its initial value
is undefined.

So initialize req to 0.

Fixes: fbe639b44a82 ("soc: qcom: Introduce Protection Domain Restart helpers")

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/soc/qcom/pdr_interface.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
index 088dc99f77f3..f63135c09667 100644
--- a/drivers/soc/qcom/pdr_interface.c
+++ b/drivers/soc/qcom/pdr_interface.c
@@ -569,7 +569,7 @@ EXPORT_SYMBOL(pdr_add_lookup);
 int pdr_restart_pd(struct pdr_handle *pdr, struct pdr_service *pds)
 {
 	struct servreg_restart_pd_resp resp;
-	struct servreg_restart_pd_req req;
+	struct servreg_restart_pd_req req = { 0 };
 	struct sockaddr_qrtr addr;
 	struct pdr_service *tmp;
 	struct qmi_txn txn;
-- 
2.18.1

