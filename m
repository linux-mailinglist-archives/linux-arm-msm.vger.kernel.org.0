Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7594BF37FD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 20:06:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727352AbfKGTGd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 14:06:33 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42681 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726946AbfKGTGd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 14:06:33 -0500
Received: by mail-pg1-f193.google.com with SMTP id q17so2594264pgt.9;
        Thu, 07 Nov 2019 11:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=5BHyYNb+49Gf/5XB6rC7pY0BUN7tCK0r/sMc+v4m91o=;
        b=Wmy6ixOMzOb3/fMo+IM3tySDr1EcMJwZQ4bf1iRSskw9DhGVJcxECsXhlUIXpGlNkw
         y+m1/jB2eY7WQKkalEHfCLPzBXBnqwwtHzriTYp92MiQ+jP79671Epi81h3s+gR9xF7V
         HOD0JGE+v+5k8NON/XRXSnaAHxANA7r6awl/gvJOytQv6T2110ErmcwlZKPv5tO9CzaF
         q9E+IxVYk02pecrgOrv+L75+j8jUjCX60qrcyNHR49c60Qe7m86zSrMptPfrcruk5DhS
         PEaUj+wdC5SG5qU2bCym0rctKiT5dioAYcXWnvrzTlKySeRYBh/ujETq0AT1waGRv777
         N4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=5BHyYNb+49Gf/5XB6rC7pY0BUN7tCK0r/sMc+v4m91o=;
        b=W6yTzfi+6ORTbmk39B93BYuT+fTbR2CNrJUgXb7dedzYYbUvQBcYpYhxx4n64RMsn7
         Dn5Pn1D0IlFltAr+WYpFD82hpCmz6K5xKGEL7giU4EqwNvm5FGz7LCGWqHKBj4SaDzko
         4pIdj/11EbOJUGvyMj+cMW7/6tH2F2h+4TNxmpYXccnW+ZdkTlyOry3cpocTg1LZ0nHW
         vCKj6CFf3kLiH18whlH6fSFz06/Yskzt0fChPkInQ2zi39I6D7ehFwAWRzJ8V9LgPYkj
         nc+bCu0vGKuPubwnIAZk8vQOsPwgXMyKJPHFXJ+ot18MpSntF2CQGaFxbKRnBI9n4NHw
         r0Dg==
X-Gm-Message-State: APjAAAU8VQ2nr2BagWwvCWMwnwpZF5bufHfKJ1qFZyAuU8H++ZVS0RtR
        rPxJOnamR7R36KjSfZ47DYc=
X-Google-Smtp-Source: APXvYqyw5Wk1Y2seoP6DcXKguZT7qNqsVpLYcP4f5BB/JhJaQV7w2RXFoev5GfAcirhMwKbfodvuLw==
X-Received: by 2002:a63:5848:: with SMTP id i8mr6317989pgm.217.1573153592155;
        Thu, 07 Nov 2019 11:06:32 -0800 (PST)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id m12sm2725912pjk.13.2019.11.07.11.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 11:06:31 -0800 (PST)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        sibis@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH] clk: qcom: smd: Add missing pnoc clock
Date:   Thu,  7 Nov 2019 11:06:15 -0800
Message-Id: <20191107190615.5656-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When MSM8998 support was added, and analysis was done to determine what
clocks would be consumed.  That analysis had a flaw, which caused the
pnoc to be skipped.  The pnoc clock needs to be on to access the uart
for the console.  The clock is on from boot, but has no consumer votes
in the RPM.  When we attempt to boot the modem, it causes the RPM to
turn off pnoc, which kills our access to the console and causes CPU hangs.

We need pnoc to be defined, so that clk_smd_rpm_handoff() will put in
an implicit vote for linux and prevent issues when booting modem.
Hopefully pnoc can be consumed by the interconnect framework in future
so that Linux can rely on explicit votes.

Fixes: 6131dc81211c ("clk: qcom: smd: Add support for MSM8998 rpm clocks")
Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/clk/qcom/clk-smd-rpm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index fef5e8157061..930fa4a4c52a 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -648,6 +648,7 @@ static const struct rpm_smd_clk_desc rpm_clk_qcs404 = {
 };
 
 /* msm8998 */
+DEFINE_CLK_SMD_RPM(msm8998, pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
 DEFINE_CLK_SMD_RPM(msm8998, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
 DEFINE_CLK_SMD_RPM(msm8998, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
 DEFINE_CLK_SMD_RPM(msm8998, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);
@@ -670,6 +671,8 @@ DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, rf_clk2_pin, rf_clk2_a_pin, 5);
 DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, rf_clk3, rf_clk3_a, 6);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, rf_clk3_pin, rf_clk3_a_pin, 6);
 static struct clk_smd_rpm *msm8998_clks[] = {
+	[RPM_SMD_PCNOC_CLK] = &msm8998_pcnoc_clk,
+	[RPM_SMD_PCNOC_A_CLK] = &msm8998_pcnoc_a_clk,
 	[RPM_SMD_SNOC_CLK] = &msm8998_snoc_clk,
 	[RPM_SMD_SNOC_A_CLK] = &msm8998_snoc_a_clk,
 	[RPM_SMD_CNOC_CLK] = &msm8998_cnoc_clk,
-- 
2.17.1

