Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F075D4DA44
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 21:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbfFTTfj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 15:35:39 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39253 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbfFTTfj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 15:35:39 -0400
Received: by mail-pg1-f194.google.com with SMTP id 196so2095730pgc.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2019 12:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=TmvH/uHwXYBXc2lnG1r8dsP3FGwS5Da/mZ27gikZaVQ=;
        b=sz/jWKVSJx3ZD2t0rdeVKJhTnpEyl+MRZYtM32E9Yy4/P2ZTxYPTRAaE0EJwaTqKmP
         ef6YMdoORd22tEv9F9PGCB/9uJpq7fn3ELH8ADwqrMSoUS5fcFw+Bzr5WG08lUkuQY5i
         H9FvF99uLr+oozWAbX1NC8FEHsPCRAvS8d/SLkuABYwblki2QgfNIIzwzhYqBh4ORz19
         S7QQ8XPrDQ6CFBf8uAC5Ms/OKjOeQgISswkgeV9iZdrngUUTRywkgcvTh9jlJB7kyhHP
         xcxt7q2qSBJIVDBYRQs0tVJsK26UKhgMlsL/EAd4qCJ/0nG+CROIOZAUzzXQIzje6RXV
         +Jbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=TmvH/uHwXYBXc2lnG1r8dsP3FGwS5Da/mZ27gikZaVQ=;
        b=YjTJpAfEE9jqKE1SJYvGcfFWfJ7NQpSs3BjcIumMviAEI8ohR2aZ/N8nXG9hJr6qUN
         H6OEz4cYxp8YhSX8s8FflJs9Hw89EEY+m8arpVonBnBcJ0ZgO7vLwqIXpl8ONbfp/4/y
         a2W+S6R0ucl5b+MzuhlsPqDqYeExh/UWrSp8Fx8xZgS0nDB++MdlVxQWM1+5qdYqeT1z
         XADAUiKbNkZW5JtgZeT9jNuS1ejxv6ELOTMqHH9vopwecGECK9cGYQPhkRNke5c2dUWX
         3hclfo2S0q1PQaUmxLlL8ijyqlObhiaY7YfTjGMxTWjndVyvaR7Bm8Umfx4DhmMSzOPu
         HzOQ==
X-Gm-Message-State: APjAAAUOPriD0VxKQ72h94vIfrI9tt9avVxczNzGIWR1GLxhllXASYF+
        odLgpjMk23pCUWYQ7hx+9cZBg/e/
X-Google-Smtp-Source: APXvYqzSd/saJ+ERORCcpLcVjYjMeX3ldrJ6FCi8sRNSMc1v6dgKxzj6ppOByp6KuRoNBxxU27PqVA==
X-Received: by 2002:a17:90a:19d:: with SMTP id 29mr1345169pjc.71.1561059338643;
        Thu, 20 Jun 2019 12:35:38 -0700 (PDT)
Received: from ahmlpt0706 ([106.222.8.151])
        by smtp.gmail.com with ESMTPSA id t8sm291635pfq.31.2019.06.20.12.35.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 20 Jun 2019 12:35:38 -0700 (PDT)
Date:   Fri, 21 Jun 2019 01:05:23 +0530
From:   Saiyam Doshi <saiyamdoshi.in@gmail.com>
To:     agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/2] drivers: firmware: qcom: fix block comment style issue
Message-ID: <20190620193523.GA17374@ahmlpt0706>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch fixes below checkpatch warning.
"WARNING: Block comments should align the * on each line"

Signed-off-by: Saiyam Doshi <saiyamdoshi.in@gmail.com>
---
 drivers/firmware/qcom_scm-64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index 986aa3184fd9..27cab1f26197 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -72,7 +72,7 @@ static DEFINE_MUTEX(qcom_scm_lock);
  *
  * Sends a command to the SCM and waits for the command to finish processing.
  * This should *only* be called in pre-emptible context.
-*/
+ */
 static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
 			 const struct qcom_scm_desc *desc,
 			 struct arm_smccc_res *res)
-- 
2.20.1

