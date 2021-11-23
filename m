Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4844D45A756
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 17:14:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235462AbhKWQRz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 11:17:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234340AbhKWQRy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 11:17:54 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D29EC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Nov 2021 08:14:46 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id x43-20020a056830246b00b00570d09d34ebso34556724otr.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Nov 2021 08:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eparqKgOL69KUNWYFvdHukdKFpCJnmDKYIk96v9YcXE=;
        b=tFRIBCefavlG2hukUldYOdpVY0ySk2b03cy0H1I/a0B3rDkLqLGZu5drUNLmVZ/Xt+
         lYUlri3zwdm5fjhSo8teSSntK8Z17MjDNG8juqmNE6Wk0tueqEHOZzpf55C8ovwzGDxI
         kqmTZ/AGg6z1sI57XuA0/OFnj/RdAReUB4sT4fMFvn7DmaHwwBUO/wtfU+yiMnHGTcQ7
         H9OrQAge7zXZ/7YL14pyRPRrDiSCOirT6k+cYI1z10kME+xPmwri7ten18Q/XBhEfYjv
         4RigERj1Fjq40b38A/5LLConb32xV9AMcgJrd12NtCzzRsCw/ET0E4yIeZMlJPydpyPW
         qLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eparqKgOL69KUNWYFvdHukdKFpCJnmDKYIk96v9YcXE=;
        b=08TaW0Xkjeix8GX6H/ab5gftdR8dL+B7QoW7DxIs3iQFvhNPFRjgnbrOnzLFpWuJpK
         1irGimA7cQYdpdMSHtQwhRudaFLAiXID/YBHTML8CDlsDuQbhw1PCckduUfGRC8xsKx3
         eN8/qpoRUv26IjYn3fePu4BxJQUkT/nkcIuZXTpDaDMmkABx/iKTkb+ikpzwYVe3CkoB
         R6CfifFx9F0TjqCkQhxE7j+vw3VSDHu+cpHWH0bClm20r1WHiRXAJZbVv0rJDA64jwUV
         hQvXrjTw4X7CVLEwlu0mCgnVQR4gTSJiqrJIPa0k4/0ev36CljVGeSyscZ3sOLZ6rX0c
         MP9A==
X-Gm-Message-State: AOAM532SACrR4GqYsk1OcGiiZsH5m2TPKzXM3jVoqOcVexFbOKU0Wotv
        C+VsY/iAveG94NHMkIo391Mjsg==
X-Google-Smtp-Source: ABdhPJxGLkyYOkYO1lCzvGQGFw0d7eU216flfUBjVWROPBv+YR7xjdIAxKHad7pxr7OtH24lLyZ3LA==
X-Received: by 2002:a9d:22a4:: with SMTP id y33mr5409631ota.188.1637684085769;
        Tue, 23 Nov 2021 08:14:45 -0800 (PST)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q10sm2664338oiw.17.2021.11.23.08.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 08:14:45 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: clk-alpha-pll: Don't reconfigure running Trion
Date:   Tue, 23 Nov 2021 08:16:30 -0800
Message-Id: <20211123161630.123222-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In the event that the bootloader has configured the Trion PLL as source
for the display clocks, e.g. for the continuous splashscreen, then there
will also be RCGs that are clocked by this instance.

Reconfiguring, and in particular disabling the output of, the PLL will
cause issues for these downstream RCGs and has been shown to prevent
them from being re-parented.

Follow downstream and skip configuration if it's determined that the PLL
is already running.

Fixes: 59128c20a6a9 ("clk: qcom: clk-alpha-pll: Add support for controlling Lucid PLLs")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index eaedcceb766f..b04aa0a630e9 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -1429,6 +1429,15 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_fabia_ops);
 void clk_trion_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config)
 {
+	/*
+	 * If the bootloader left the PLL enabled it's likely that there are
+	 * RCGs that will lock up if we disable the PLL below.
+	 */
+	if (trion_pll_is_enabled(pll, regmap)) {
+		pr_dbg("Trion PLL is already enabled, skipping configuration\n");
+		return;
+	}
+
 	clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), config->l);
 	regmap_write(regmap, PLL_CAL_L_VAL(pll), TRION_PLL_CAL_VAL);
 	clk_alpha_pll_write_config(regmap, PLL_ALPHA_VAL(pll), config->alpha);
-- 
2.33.1

