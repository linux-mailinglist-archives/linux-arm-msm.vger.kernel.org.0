Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3151521F5C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 17:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728802AbgGNPFj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jul 2020 11:05:39 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:27935 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725890AbgGNPFb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jul 2020 11:05:31 -0400
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 14 Jul 2020 08:05:29 -0700
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
  by ironmsg04-sd.qualcomm.com with ESMTP; 14 Jul 2020 08:05:25 -0700
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
        id 5BEFD2199D; Tue, 14 Jul 2020 20:35:24 +0530 (IST)
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Subject: [PATCH 4/4] clk: qcom: ipq8074: include gcc reset bindings
Date:   Tue, 14 Jul 2020 20:35:22 +0530
Message-Id: <1594739122-29327-5-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594739122-29327-1-git-send-email-sivaprak@codeaurora.org>
References: <1594739122-29327-1-git-send-email-sivaprak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Include gcc reset bindings in ipq8074 gcc clock controller

Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
---
 drivers/clk/qcom/gcc-ipq8074.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-ipq8074.c b/drivers/clk/qcom/gcc-ipq8074.c
index 443e28cda8ed..dbc10b6ebac2 100644
--- a/drivers/clk/qcom/gcc-ipq8074.c
+++ b/drivers/clk/qcom/gcc-ipq8074.c
@@ -13,6 +13,7 @@
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,gcc-ipq8074.h>
+#include <dt-bindings/reset/qcom,gcc-ipq8074.h>
 
 #include "common.h"
 #include "clk-regmap.h"
-- 
2.7.4

