Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2A2D1F6A08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2020 16:29:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728361AbgFKO25 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jun 2020 10:28:57 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:25946 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726657AbgFKO25 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jun 2020 10:28:57 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 11 Jun 2020 19:58:44 +0530
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 11 Jun 2020 19:58:17 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 27C6E2AC6; Thu, 11 Jun 2020 19:58:16 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-clk@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
Subject: [PATCH 1/2] clk: qcom: gcc: Add genpd active wakeup flag for sc7180
Date:   Thu, 11 Jun 2020 19:58:02 +0530
Message-Id: <1591885683-29514-2-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591885683-29514-1-git-send-email-sanm@codeaurora.org>
References: <1591885683-29514-1-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Taniya Das <tdas@codeaurora.org>

The USB client requires the usb30_prim gdsc to be kept active for
certain use cases, thus add the GENPD_FLAG_ACTIVE_WAKEUP flag.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/gcc-sc7180.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
index ca4383e..2b3dd4e 100644
--- a/drivers/clk/qcom/gcc-sc7180.c
+++ b/drivers/clk/qcom/gcc-sc7180.c
@@ -2263,6 +2263,7 @@ static struct gdsc usb30_prim_gdsc = {
 	.gdscr = 0x0f004,
 	.pd = {
 		.name = "usb30_prim_gdsc",
+		.flags = GENPD_FLAG_ACTIVE_WAKEUP,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

