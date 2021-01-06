Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA1582EB821
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 03:40:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbhAFCjW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 21:39:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbhAFCjV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 21:39:21 -0500
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71C7DC061357
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 18:38:17 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id q137so1387112iod.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 18:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gozs01SwdY8I39zxiwBamPfufMMGKBY8qkPWT8AJSEc=;
        b=zZe5RJeCePEPR23z2Ht9TAOno83rgGQZlZTu+zMOjyoKFVBVnN1ej1gV5gpKRujn6N
         sQFNLiR+5PusWNdpZsVzpwZcKEYBM/39oa4PXqwKci4+oSufCzOKgKx25lSTwMQFSJ8b
         KD/in9MT+D/acqUij/Ooq63ZSkRcyJBaPhdDIUpDSCKWZ7oNihzoOS1LIacLSwn5Uisg
         iT1UztQRa9v1o1B0kZ1cR2uC3deZ8h/+/YYYhG+KcJIZFU4T1Wjen0a8atBLFZsn+tV6
         SnMsa5fWkiNzNZUH4ufYNd4u34n7uFnnlVO0WRXit88Ya7OAPqmVYk0xldqLcXOdNmKJ
         QQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gozs01SwdY8I39zxiwBamPfufMMGKBY8qkPWT8AJSEc=;
        b=uJNc8zZUgiK/AzNraXkEOsGdTkKQO195kzFF+FNu/gn7wRsZ9WYnNE6vGYbojpDmdK
         DRBxl/6xc8fuvRi/qA45pJd+Vq/Sh0Azvo2154minkN6KduHUaS+xvDvWW/vzk6HXKHr
         n7IDQXGAvU0W1ONBwLFhD0PXsR6K0CLHrEVvaU0jM3BZ53KOwbC4mDKcSx9uvpACCjyw
         esB27vnP/DnM1a/T19opS0sdD/M32hlbuaWdXNTAUCu6ZTgrwGwxYxRGtcP9nzBIC7rp
         /zHTl2moojFTuLBG8lTNhcNvhLTlD1Su2BbVjWCptvY+9yA6k1n6N1WRgB1Kq6Jr7iIj
         WZLA==
X-Gm-Message-State: AOAM531na7TJJ7azPxLmM5pkxYr+dKzIpCnY9fF2vbI80P+ZPW6c97K/
        T+GmM2Mt0x/0ino+rS9eO38JqHDNPSonTQ==
X-Google-Smtp-Source: ABdhPJz8G4ViqBAz7V/QOPSDM+499ONMYcZevz1mF1sjfb1Nbue7D01A5E5ZGvSSDrW+8/hA/KiZeA==
X-Received: by 2002:a05:6638:30f:: with SMTP id w15mr2161336jap.121.1609900696885;
        Tue, 05 Jan 2021 18:38:16 -0800 (PST)
Received: from beast.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id x2sm631755ior.42.2021.01.05.18.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 18:38:16 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org, ohad@wizery.com
Cc:     davem@davemloft.net, kuba@kernel.org, evgreen@chromium.org,
        cpratapa@codeaurora.org, subashab@codeaurora.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/3] remoteproc: qcom: expose types for COMPILE_TEST
Date:   Tue,  5 Jan 2021 20:38:10 -0600
Message-Id: <20210106023812.2542-2-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210106023812.2542-1-elder@linaro.org>
References: <20210106023812.2542-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Stub functions are defined for SSR notifier registration in case
QCOM_RPROC_COMMON is not configured.  As a result, code that uses
these functions can link successfully even if the common remoteproc
code is not built.

Code that registers an SSR notifier function likely needs the
types defined in "qcom_rproc.h", but those are only exposed if
QCOM_RPROC_COMMON is enabled.

Rearrange the conditional definition so the qcom_ssr_notify_data
structure and qcom_ssr_notify_type enumerated type are defined
whether or not QCOM_RPROC_COMMON is enabled.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 include/linux/remoteproc/qcom_rproc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/remoteproc/qcom_rproc.h b/include/linux/remoteproc/qcom_rproc.h
index 6470516621749..82b211518136e 100644
--- a/include/linux/remoteproc/qcom_rproc.h
+++ b/include/linux/remoteproc/qcom_rproc.h
@@ -3,8 +3,6 @@
 
 struct notifier_block;
 
-#if IS_ENABLED(CONFIG_QCOM_RPROC_COMMON)
-
 /**
  * enum qcom_ssr_notify_type - Startup/Shutdown events related to a remoteproc
  * processor.
@@ -26,6 +24,8 @@ struct qcom_ssr_notify_data {
 	bool crashed;
 };
 
+#if IS_ENABLED(CONFIG_QCOM_RPROC_COMMON)
+
 void *qcom_register_ssr_notifier(const char *name, struct notifier_block *nb);
 int qcom_unregister_ssr_notifier(void *notify, struct notifier_block *nb);
 
-- 
2.20.1

