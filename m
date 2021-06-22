Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BE153AFA3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 02:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231132AbhFVAmM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 20:42:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230526AbhFVAmI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 20:42:08 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82720C061760
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 17:39:53 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id h4so4089022pgp.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 17:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=99szBSjbwnbGcFHQ+lhV33yeyCNyKEyxf0WQiXYwyIE=;
        b=kj24lNONGYpctZVMSl2KCnBuXpgtKd7zxpj8ZS9+44D8+K989zLy3x/mOfhpRhmn6i
         blRULkF9T/vy2ThOLs1xiUfYL8Jj1pulL/Sfw5+txF61qmJDhyWj1+mvIPtEywhs5M8H
         gtwE/odv6fRP+lE9j0BhgipIDqVYz9SdfjJJlJOFUoMJEsdIq/SU0nyFVabtJZzTds2F
         NIG+VSlNoZBMQaqwu8lA3cIDRRo4G1hJfMDOPTKKCRkUhjO+cr7CCtrv6CLgCFTCVKDO
         6kuNsKakUvxxLvq7j0dbtZF8EuoJh/C++cMQheujeuvUxHKsUfIbgT75ta+2d8Wtmwq0
         686w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=99szBSjbwnbGcFHQ+lhV33yeyCNyKEyxf0WQiXYwyIE=;
        b=IyPAk7xk5U58LpjoaSg9wyhMbHT8MTWvx8fL4L6BiCKJu3uLju316cIWi2fnoWeyCw
         6ix036nBCAU+k8RxpuxXJ5ICgC9VjWeU0IQyaV1agFHy/thCibnF/mGHw2cD2nTSj9yp
         ZEqsq35kj9FYsVUEiYhdMphV+7Gr05hNq3ThKC2vJiSodnZt69UlSMXaxpA/mq4hycZA
         ZWv12aVjM0sbxKMOz4uTWtI0I6b0/y32ls33v9DdmUBmU3QySuDsYj+XKf5GygzpNRr0
         gKG/4CmEBmiKuogaCWPjpfmoPh2veK1Js7AZZ6ctq+psNXV2MFO5/xEJuFzbtkc+BSfj
         FOTw==
X-Gm-Message-State: AOAM5319y9SXjuhViKSEAMMrjiZ1fdPpTfC6E0z1+BJJI6+RYqW7X3GZ
        KP8gdeLIpWJ8FgXtzTWecnTkgA==
X-Google-Smtp-Source: ABdhPJzBMYbQlqJqiFeGYnZVp/15nkjNDWIC81F/P340wTn89xX0o+yle47JXGlxqHziDuIZhkYaDQ==
X-Received: by 2002:a63:d410:: with SMTP id a16mr1146799pgh.298.1624322393123;
        Mon, 21 Jun 2021 17:39:53 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id h11sm17722762pgq.68.2021.06.21.17.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 17:39:52 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Jassi Brar <jassisinghbrar@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v3 3/3] mailbox: qcom: Add MSM8939 APCS support
Date:   Tue, 22 Jun 2021 08:39:19 +0800
Message-Id: <20210622003919.10442-4-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210622003919.10442-1-shawn.guo@linaro.org>
References: <20210622003919.10442-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable MSM8939 APCS support by adding the compatible.  It reuses
msm8916_apcs_data.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index 15236d729625..1699ec38bc3b 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -158,6 +158,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
 	{ .compatible = "qcom,ipq6018-apcs-apps-global", .data = &ipq6018_apcs_data },
 	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &ipq8074_apcs_data },
 	{ .compatible = "qcom,msm8916-apcs-kpss-global", .data = &msm8916_apcs_data },
+	{ .compatible = "qcom,msm8939-apcs-kpss-global", .data = &msm8916_apcs_data },
 	{ .compatible = "qcom,msm8994-apcs-kpss-global", .data = &msm8994_apcs_data },
 	{ .compatible = "qcom,msm8996-apcs-hmss-global", .data = &msm8996_apcs_data },
 	{ .compatible = "qcom,msm8998-apcs-hmss-global", .data = &msm8998_apcs_data },
-- 
2.17.1

