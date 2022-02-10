Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B21DB4B0E32
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Feb 2022 14:15:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242040AbiBJNOT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Feb 2022 08:14:19 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242043AbiBJNOS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Feb 2022 08:14:18 -0500
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49FA71163
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 05:14:16 -0800 (PST)
Received: by mail-qv1-xf2e.google.com with SMTP id a28so4852828qvb.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 05:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uqnW/szZ8yMl69fSxYGMyrphrxanTs2JR1CLOUZb5zM=;
        b=KShJlbJHbAl9loI8iynvAEQIMPYc002bkwj24615T+nnpTbXCABKyQbvp9hykiZ/w2
         WCz49rBtNp4Sy8SHN2nzpsHgR9N5e8Rj0Lxwzc8LJEmkm248uqvHCNZZVKXEVzS+9IUT
         DLJYyp9XJAdrrGNE191HFk+8BPwBh9rE9OFdi8LK6NgYji+1ygWZBEXO0XCBOb8PprPc
         +ObYK6uIRS91ao8H3r4WLm8clFNIe+5ofxQXVIIOdgLLzYjapvJarbpRTBjixI1Cg/3G
         /MAuozCLQ2bWnVA8LIXKp0adkVoZaO750eITaXpy5bC/Q/dTruvoMdeB7jSflLLv6LIN
         U2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uqnW/szZ8yMl69fSxYGMyrphrxanTs2JR1CLOUZb5zM=;
        b=3Lm2xAYLUQ+vlW7DhkD24BdDHTDaelkVhmWZuBOngO1+mBifxDAT48DebOJSWi7zgl
         cenJvxHQekVdUQuYR9N1SM37x3UcBW8X/bN97pZ7riDxoAupuEHogpcvTSaStaStufnu
         U01eDhvqOo/Nhmzw39y741QtyFSbexq1HK7eiRTOwa9b3r5pjTg5kAnLXi2HWzrEETtG
         QuyD1XrlCM6CshS4+p3Crn/uUfLPFyz26PPo4q7Ah2l3LxrenQ4zXm7krfiXmFZvDDdl
         auXEa9LseD6zknswoYOlcUOWCGxD1n5ZXP3XlKsl+8DembKeTsaZfFW2ApiMjj1ekMZI
         4gtg==
X-Gm-Message-State: AOAM531KwtzQr9bdtS0gzweROY0xCfoROGp4+/8GgPE6YLypBg2hXNWU
        QJvcdOatIAg12Vuv8YuDBdUx/s52nSsAyOLjX3E=
X-Google-Smtp-Source: ABdhPJwX48+RfVd9PNIxvmxM+Lm9nNjH5HsHrTT/zZU2MUbiGHSQODMEVBJbkr7/14XjQg60DJyvWw==
X-Received: by 2002:a05:6214:5081:: with SMTP id kk1mr5009104qvb.112.1644498855283;
        Thu, 10 Feb 2022 05:14:15 -0800 (PST)
Received: from localhost.localdomain (modemcable134.222-177-173.mc.videotron.ca. [173.177.222.134])
        by smtp.gmail.com with ESMTPSA id p15sm10969824qtk.56.2022.02.10.05.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 05:14:14 -0800 (PST)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     dmitry.baryshkov@linaro.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] pinctrl: qcom: print egpio mode in debugfs
Date:   Thu, 10 Feb 2022 08:12:09 -0500
Message-Id: <20220210131210.24605-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20220210131210.24605-1-jonathan@marek.ca>
References: <20220210131210.24605-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When egpio_enable bit is cleared, the gpio is driven by SSC/LPASS TLMM and
the APSS TLMM settings are ignored. Reflect that in the debugfs dump.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 780878dede9e0..27c19a206502d 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -615,6 +615,7 @@ static void msm_gpio_dbg_show_one(struct seq_file *s,
 	int drive;
 	int pull;
 	int val;
+	int egpio_enable;
 	u32 ctl_reg, io_reg;
 
 	static const char * const pulls_keeper[] = {
@@ -641,12 +642,20 @@ static void msm_gpio_dbg_show_one(struct seq_file *s,
 	func = (ctl_reg >> g->mux_bit) & 7;
 	drive = (ctl_reg >> g->drv_bit) & 7;
 	pull = (ctl_reg >> g->pull_bit) & 3;
+	egpio_enable = 0;
+	if (pctrl->soc->egpio_func && ctl_reg & BIT(g->egpio_present))
+		egpio_enable = !(ctl_reg & BIT(g->egpio_enable));
 
 	if (is_out)
 		val = !!(io_reg & BIT(g->out_bit));
 	else
 		val = !!(io_reg & BIT(g->in_bit));
 
+	if (egpio_enable) {
+		seq_printf(s, " %-8s: egpio\n", g->name);
+		return;
+	}
+
 	seq_printf(s, " %-8s: %-3s", g->name, is_out ? "out" : "in");
 	seq_printf(s, " %-4s func%d", val ? "high" : "low", func);
 	seq_printf(s, " %dmA", msm_regval_to_drive(drive));
-- 
2.26.1

