Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE1336C35F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 16:41:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231326AbjCUPlD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Mar 2023 11:41:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230521AbjCUPlC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Mar 2023 11:41:02 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44333F950
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 08:40:52 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pee6O-0003FW-KD; Tue, 21 Mar 2023 16:40:44 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pee6N-005iqD-V8; Tue, 21 Mar 2023 16:40:43 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pee6N-006neX-2T; Tue, 21 Mar 2023 16:40:43 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 0/3] rpmsg: Convert to platform remove callback returning void
Date:   Tue, 21 Mar 2023 16:40:36 +0100
Message-Id: <20230321154039.355098-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1388; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=N6wdbr/FFulU1PbWUDnt+sVVTgjd5CYaTsNrxM4xFpI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkGc/xHJe1ygUAJCFytP8ePAmLqZGDVEJtGGm5J 4yzrV6pio+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBnP8QAKCRCPgPtYfRL+ TnYwB/oC7MZJ0dGTyfPBJc19oGBqut9eSXkc1EPQOBHPmKpfnrSGfxwLc8MftG3UuKaI4Fw1c0+ D5f26B5Yl3ethAdnQn/LlXo6fkOdetf/5H24n9G46T3WFQ5a+p+9ySssfAZs0E+rk7/PyT1ADZj ILZSsIAua5afp8VvxhvXKTYkNZZzYXW5Y9/Eff6vk7+xZV9lw2BT3eWHgxpQmdJ3az+EgwsPRS3 8z8OCsJaHPILlpthq8T5FfnYr34JPUozBJl7RfI5Gq1K0jHE6boooxPCdI2EM3HCRLBbGwwOaHI HAOV+s+3WYmN1xEl8xFMMnoqkTCqB/scdMZ3pUDiO+u1PqMI
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

this series adapts the platform drivers below drivers/rpmsg to use the
.remove_new() callback. Compared to the traditional .remove() callback
.remove_new() returns no value. This is a good thing because the driver core
doesn't (and cannot) cope for errors during remove. The only effect of a
non-zero return value in .remove() is that the driver core emits a warning. The
device is removed anyhow and an early return from .remove() usually yields a
resource leak.

By changing the remove callback to return void driver authors cannot
reasonably assume any more that there is some kind of cleanup later.

The two rpmsg platform drivers always returned zero before. This just
wasn't obvious, so the first patch simplifies a bit to make it obvious.
After that the drivers are converted without side effects to
.remove_new().

Best regards
Uwe

Uwe Kleine-König (3):
  rpmsg: qcom_smd: Make qcom_smd_unregister_edge() return void
  rpmsg: qcom_glink_rpm: Convert to platform remove callback returning
    void
  rpmsg: qcom_smd: Convert to platform remove callback returning void

 drivers/rpmsg/qcom_glink_rpm.c |  6 ++----
 drivers/rpmsg/qcom_smd.c       | 24 +++++++++++-------------
 include/linux/rpmsg/qcom_smd.h |  5 ++---
 3 files changed, 15 insertions(+), 20 deletions(-)

base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
-- 
2.39.2

