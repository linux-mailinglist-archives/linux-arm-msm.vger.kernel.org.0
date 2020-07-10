Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D4B621AFB5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 08:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727935AbgGJGsD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 02:48:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbgGJGsD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 02:48:03 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19284C08C5CE
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 23:48:03 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id j19so2083065pgm.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 23:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gSZJQMAGEnmb2CqHFz1MNS8tMejxPEXsK0YNj8SWBOU=;
        b=iRwK09LZ3BJmibGsyHoCPM9GNX9trLKrPSXtExFzQHWVgWOR89O1D/k+PuICQMvp0k
         8uI373R2c7W9fJJzkJkk6O7AAPxjodaRHJ1NFg3f71hMp4vWwopxlU8XspS9hh2O5GS/
         bBX7mQl430mHjYbVQaIpKkORhNrosYA0kCQXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gSZJQMAGEnmb2CqHFz1MNS8tMejxPEXsK0YNj8SWBOU=;
        b=ElUG/KYn4p0LJV5ktLR9+mhQ0Xe/1AG6kCJXSH5/oxMS00owUrmFNLqLK5PpeNa9IA
         1dir93VBCZ5pdJbyCeeoheP5E+LC7WoAvB6xzQedxEheYvEzH9CS5ZyO+SDykpVLzeoF
         Em+0ZUWfFbPnP/tz/lNEwJhZITlV7o15sZmCRMchGcFy7hWFTpKlKKyP9HUlRWrH3Xk0
         g84gurKdhy1ANS44Gugl8oMBsU1zqUqTvzICVxXvjBEYeftjC87DIykEGjmT9abWD8vp
         Wdv2lWj9zlxQ0il0H6yfUEaA1KHzyje27X/Sct3r8obAmLZuSQjeHf/2ufaiD1d8Wihp
         3uxg==
X-Gm-Message-State: AOAM532UeFoSs+nKFvwSDW3YIzX1+hn/TUL+4sg3ITylVSDCpJSZCMGP
        amBxTjlVZcnv8idoJbTSGpQoLQ==
X-Google-Smtp-Source: ABdhPJwhX2wS73T6Qup7iqhhvrnjvxKp1seCyklGjzfwCEpwkX280YDw9Yjg2xyo/YXFrjL5wGtLeA==
X-Received: by 2002:a63:4f4d:: with SMTP id p13mr53250980pgl.400.1594363682668;
        Thu, 09 Jul 2020 23:48:02 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com ([2401:fa00:1:b:7220:84ff:fe09:41dc])
        by smtp.gmail.com with ESMTPSA id 190sm4639423pfz.41.2020.07.09.23.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 23:48:02 -0700 (PDT)
From:   Nicolas Boichat <drinkcat@chromium.org>
To:     Andy Gross <agross@kernel.org>
Cc:     Nicolas Boichat <drinkcat@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [RESEND PATCH] media: camss: vfe: Use trace_printk for debugging only
Date:   Fri, 10 Jul 2020 14:47:51 +0800
Message-Id: <20200710144747.RESEND.1.Ifae7abaacb81af1cdc6475986cc788d71de8a13c@changeid>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

trace_printk should not be used in production code. Since
tracing interrupts is presumably latency sensitive, pr_dbg is
not appropriate, so guard the call with a preprocessor symbol
that can be defined for debugging purpose.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---
Sent this before as part of a series (whose 4th patch was a
change that allows to detect such trace_printk), but maybe it's
easier to get individual maintainer attention by splitting it.

 drivers/media/platform/qcom/camss/camss-vfe-4-1.c | 2 ++
 drivers/media/platform/qcom/camss/camss-vfe-4-7.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
index 174a36be6f5d866..0c57171fae4f9e9 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
@@ -936,8 +936,10 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 
 	vfe->ops->isr_read(vfe, &value0, &value1);
 
+#ifdef CAMSS_VFE_TRACE_IRQ
 	trace_printk("VFE: status0 = 0x%08x, status1 = 0x%08x\n",
 		     value0, value1);
+#endif
 
 	if (value0 & VFE_0_IRQ_STATUS_0_RESET_ACK)
 		vfe->isr_ops.reset_ack(vfe);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
index 0dca8bf9281e774..307675925e5c779 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
@@ -1058,8 +1058,10 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 
 	vfe->ops->isr_read(vfe, &value0, &value1);
 
+#ifdef CAMSS_VFE_TRACE_IRQ
 	trace_printk("VFE: status0 = 0x%08x, status1 = 0x%08x\n",
 		     value0, value1);
+#endif
 
 	if (value0 & VFE_0_IRQ_STATUS_0_RESET_ACK)
 		vfe->isr_ops.reset_ack(vfe);
-- 
2.27.0.383.g050319c2ae-goog

