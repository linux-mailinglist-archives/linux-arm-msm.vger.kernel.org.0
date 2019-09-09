Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB0C2AD554
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2019 11:08:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389617AbfIIJI4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Sep 2019 05:08:56 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38099 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728214AbfIIJI4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Sep 2019 05:08:56 -0400
Received: by mail-wm1-f66.google.com with SMTP id o184so13679070wme.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Sep 2019 02:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+4BP5T9F1nQ04WHnHdo2p8zuW4F9kfRfYy2Oe7UAEX0=;
        b=zK6YC8uR+gx2gtTbPZfrQvjTvhixWiVL06+lDRgRpep0OWa0qLpWHztn4WRtplHEyU
         dQOdL99eUOl5HZrIxKhvz8dfoCAlkABvDPcWGJE4uSy83Zzmn2NfKPYVslAzh+QfpUWo
         ybimlvKx5VDA92w9wUl/peF69vLGiurOdeQZruQLOv3G8a2aBXlxYz3yJueWUCk8pfF2
         Fthtj+0kBNhsE8S2dvO2H6qCN7GXHeb46x6it+GSFJAJRgl25vEPcmAeyi6H913Yb/tY
         DggHN5cjUxx6A+/nup96gQwTecH8lo3M6h8gbAJqjOac7MddbSYz9kNPcQ/LDv3A14BP
         DNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+4BP5T9F1nQ04WHnHdo2p8zuW4F9kfRfYy2Oe7UAEX0=;
        b=ZNkUSzv33vUIH1phlCuETvZE/koNSSoMBHDpu4A2zGAM5WQSOKj9gqiw22zgxUqSHF
         5IrAq5Wfhb1ncha7k17zd/t78fF2mySIpDrMJ+dncmRwkyK3J+NeDPaCP9Al0N154KDO
         S+UVbGIGIWBckVnAew+zLHQuz8H2EWGrUJbG4rVMta6B2+kS8/wbIgFdpcKKvpc1Qj25
         xq6aICePFVQYmNZg7OOklwVdkmoRcopn68/chyP7FvTsZ53kC6apD9vd/ZcpzPhooiuc
         nOHaPUPNPUJPfuyNbFYkT4YJj+pJB7EyQxizVBTDtFoBDJTSF+YDBZQYOImtMYfqOPAk
         vQlg==
X-Gm-Message-State: APjAAAXldlByu8CU07aMjfN4GxueThhFKM42wgEcTeaFxLBgTL6tGtA5
        PV4bIpIZtj9bQ/qbSWaLc1CZWA==
X-Google-Smtp-Source: APXvYqy4be4Dr2Cov1HiM8TXxugAZyZo8P+mQ23GodeQvo7+IfiZG3JqP+j/0SxUZhFRj9JeyQm2fA==
X-Received: by 2002:a05:600c:228a:: with SMTP id 10mr18757070wmf.62.1568020134357;
        Mon, 09 Sep 2019 02:08:54 -0700 (PDT)
Received: from localhost.localdomain (69.red-83-35-113.dynamicip.rima-tde.net. [83.35.113.69])
        by smtp.gmail.com with ESMTPSA id o12sm14734488wmh.43.2019.09.09.02.08.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 09 Sep 2019 02:08:53 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, agross@kernel.org,
        jassisinghbrar@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, sboyd@kernel.org
Subject: [PATCH v2] mailbox: qcom-apcs: fix max_register value
Date:   Mon,  9 Sep 2019 11:08:50 +0200
Message-Id: <20190909090850.10822-1-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The mailbox length is 0x1000 hence the max_register value is 0xFFC.

Fixes: c6a8b171ca8e ("mailbox: qcom: Convert APCS IPC driver to use
regmap")
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---

 v2: added Fixes tag
 
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index 705e17a5479c..e5d6b1b70441 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -28,7 +28,7 @@ static const struct regmap_config apcs_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.max_register = 0x1000,
+	.max_register = 0xFFC,
 	.fast_io = true,
 };
 
-- 
2.23.0

