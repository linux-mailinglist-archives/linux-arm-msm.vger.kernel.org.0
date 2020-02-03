Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 286C7150F88
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2020 19:32:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729952AbgBCScx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 13:32:53 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:38196 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729932AbgBCSc0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 13:32:26 -0500
Received: by mail-pj1-f66.google.com with SMTP id j17so126822pjz.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 10:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=irG/49dMakkcizB1EhGzZ0q46vUWgKgRR/O4DfgliP8=;
        b=W9txNfqrmlT1zTNYlOzadp2h717ImERtWGxmlFhMJyy3Cvbt2EkrZ7QHEEhZee/tLI
         2o/QteXLaDQfJilOZk+arBl7J9b7EQoAS10PsXrfshojgUPCSr+RcIGpnlZBwJ3PUZKV
         2BNRVlJ75sGaGV17qYBHR6p2AFT6V0ye1npes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=irG/49dMakkcizB1EhGzZ0q46vUWgKgRR/O4DfgliP8=;
        b=Cc90X6/97QLcVGCKKkK0x+fga/6e87mJsz7yYpbBKu19WjtvZ/BkFtH3rzonO6D87G
         +k4hJgVdLbia04h+A0HXNDiImNUjJ/906Awt8PsrU2BBVCTE0uubjbAYmJ0gnJGPTj6+
         SLTUTbrYWLe3D7EWjILbXnj2gmoguzIKRDWeJI4ZbEGhRmLJet4yJMR1g6plj6B0wHuC
         ZrqVwNEhYEaUYqZSCPct8XTRQPgf+Vfr5Ey8/IEkPZ2VZL2C9L67Qlb1Yh7IbFUibkq0
         tTHHqGQHfj6KCMQQcLCA72D3REMpuAe+J0VOgLgj+peyyxES8f1vikw2HdwA+rWmNc1y
         CxcQ==
X-Gm-Message-State: APjAAAUnoKrunkwzrCsCM0XvDOkJXOFmZ9b3T6CjzYSU1e/aU5dsKVuT
        85bfzYu2/h+Ld50MhWsqvNSNtg==
X-Google-Smtp-Source: APXvYqxDEEAhxY5Kou6RFexCZKMGdzs5fWxkyE49qHB7K7s9tyuDQgE8RSJu/rWIOyK6jKu9VzYE2w==
X-Received: by 2002:a17:902:8d8d:: with SMTP id v13mr25103802plo.260.1580754745151;
        Mon, 03 Feb 2020 10:32:25 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id f9sm21009137pfd.141.2020.02.03.10.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 10:32:24 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>, jeffrey.l.hugo@gmail.com,
        linux-arm-msm@vger.kernel.org, harigovi@codeaurora.org,
        devicetree@vger.kernel.org, mka@chromium.org,
        kalyan_t@codeaurora.org, Mark Rutland <mark.rutland@arm.com>,
        linux-clk@vger.kernel.org, hoegsberg@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 10/15] clk: qcom: Use ARRAY_SIZE in gpucc-sc7180 for parent clocks
Date:   Mon,  3 Feb 2020 10:31:43 -0800
Message-Id: <20200203103049.v4.10.I3bf44e33f4dc7ecca10a50dbccb7dc082894fa59@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200203183149.73842-1-dianders@chromium.org>
References: <20200203183149.73842-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It's nicer to use ARRAY_SIZE instead of hardcoding.  Had we always
been doing this it would have prevented a previous bug.  See commit
74c31ff9c84a ("clk: qcom: gpu_cc_gmu_clk_src has 5 parents, not 6").

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4: None
Changes in v3:
- Patch ("clk: qcom: Use ARRAY_SIZE in gpucc-sc7180...") split out for v3.

Changes in v2: None

 drivers/clk/qcom/gpucc-sc7180.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-sc7180.c b/drivers/clk/qcom/gpucc-sc7180.c
index c88f00125775..a96c0b945de2 100644
--- a/drivers/clk/qcom/gpucc-sc7180.c
+++ b/drivers/clk/qcom/gpucc-sc7180.c
@@ -84,7 +84,7 @@ static struct clk_rcg2 gpu_cc_gmu_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpu_cc_gmu_clk_src",
 		.parent_data = gpu_cc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
-- 
2.25.0.341.g760bfbb309-goog

