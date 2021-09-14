Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73CC540A2B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 03:41:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236211AbhINBmZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Sep 2021 21:42:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236425AbhINBmY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Sep 2021 21:42:24 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74128C061767
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 18:41:07 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id nn5-20020a17090b38c500b0019af1c4b31fso707011pjb.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 18:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=z0/SSImFg2hF6zZaUL93PgMKJHZYbA/zVqM/2xdqHn8=;
        b=m+ZZiJzYAZIU+vxr2YG3fqTJmG5Tb98sIMCjHGYVmIiXm7hUBrXIOyVvONa0dW+OGW
         qQptzjhxancQJPTD3kJ3ZYHWPdLH/i7lr0BeifdcerevLzIP7G8lk4EzZUIvaj+orLW1
         WHaOrLfVt8LKud3X8B7q9hf/ntnCh423tTqvc5adu3Aaew6n9suTMmgAK19I45au2DJT
         NtzCLpWi1hO9Q5qr62Y9igyKXTA4oI89oAFBKM+BW8f2I+VaN3AUzs9+JJ+Nt2zBiChx
         vpBzTiAOUQBkJm0TJKlkNu4gH49tjSmCImYUckrCgRB1UWiTCldaKPTscyMyqFVB0cxG
         sP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=z0/SSImFg2hF6zZaUL93PgMKJHZYbA/zVqM/2xdqHn8=;
        b=SrYm+8kTxHgxbCjUx4JDV68fE81TKsjpU7dVYGp6mb7OXfG0t5K/QepneMskr5WuK0
         o54M6ebCWZqdeDamF6LywF0UiV6UntF6vos2Suou2KU8UACK+0GY/oLTY1u3QfGdYAKo
         rZ8+RHtmN0M30sMR79qMLsJOq8XLgaTL1re1IfPZkY4KPDYhCzxQm02EINt+zknNG/eW
         D2vUnbs+DO+u5pa/KJ9h8sCbhAXTQwFJFOoIpKeilFswQpkIcln/AJd5GaTy4ywMwkFP
         +t88D9E2BPs9fy6ai2VqmCStvcTwlnom6tmbhF9U+SjXDpzMmsWewb7AykJO5+3brMkX
         AyLw==
X-Gm-Message-State: AOAM531prIny8PL2jhcda0vWSWW2UJt0BTHHGZ/M/jc1siJKl/hIGECS
        eRbAc/yl/aSGTzqCsbpdgBzeEQ==
X-Google-Smtp-Source: ABdhPJw9ewtd0lQo3LylLq2v1ej0bV3HMxEADmABBGw5BlH/SE2MkxSP63C2/gDJYQ2iN/I6eWmpdQ==
X-Received: by 2002:a17:90a:1d09:: with SMTP id c9mr2618779pjd.204.1631583666987;
        Mon, 13 Sep 2021 18:41:06 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id 4sm8037615pjb.21.2021.09.13.18.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 18:41:06 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Jassi Brar <jassisinghbrar@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 3/3] mailbox: qcom-apcs-ipc: Add QCM2290 APCS IPC support
Date:   Tue, 14 Sep 2021 09:40:50 +0800
Message-Id: <20210914014050.28788-4-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210914014050.28788-1-shawn.guo@linaro.org>
References: <20210914014050.28788-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable QCM2290 APCS IPC support by adding the compatible.  It reuses
msm8994_apcs_data.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index ac42cdae638d..2092dfb5de00 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -151,6 +151,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
 	{ .compatible = "qcom,msm8994-apcs-kpss-global", .data = &msm8994_apcs_data },
 	{ .compatible = "qcom,msm8996-apcs-hmss-global", .data = &msm8996_apcs_data },
 	{ .compatible = "qcom,msm8998-apcs-hmss-global", .data = &msm8994_apcs_data },
+	{ .compatible = "qcom,qcm2290-apcs-hmss-global", .data = &msm8994_apcs_data },
 	{ .compatible = "qcom,qcs404-apcs-apps-global", .data = &msm8916_apcs_data },
 	{ .compatible = "qcom,sc7180-apss-shared", .data = &apps_shared_apcs_data },
 	{ .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
-- 
2.17.1

