Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 473CA4FE912
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 21:47:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232367AbiDLTuL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 15:50:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234308AbiDLTtb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 15:49:31 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE0C16B09C
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 12:45:07 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id q19so18182508pgm.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 12:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2Yxt65tffffagVJ4U912AUE06OtMy/uby86IV/Jpv1M=;
        b=ME7iQ15peYitKfSrqIs0ojrtwYW9+F94eedLg4yFY+Y3Zx+TNqMtjQJ7ZFtlAN/Fys
         tWY3mSMTBwp+Pabg2+cdapFMz0zkAi0/lL+KTrj9CeBIgLRUTdV7RpQxS9UpEDmxcUmK
         ve0ssqy815Sy3kLOplwK2pO1w7ep8xdnK938A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2Yxt65tffffagVJ4U912AUE06OtMy/uby86IV/Jpv1M=;
        b=0cBGmZdejD5n9DeMS9FzwQiyNkgUjuRx7X029V3M+aJWOtv/TBUn0i5E5aN989PbNe
         ycR9/dcsXXj6sCOuZDYZ3CvUhIKwGeg3ESCixKwA8MjoAKvti88vIOAO32b6LUBbxC+8
         q+rP+bmjbQwCzcFxVBIaVqQNdCahuhZTAITTrQ6FxfqiXlIbYUBXhcZfCclqzUPfu5Bw
         Ch89W8joVpYzF6ZqteYNqPISU8nLKV2UOPtUZqBYgwhpfH5UOKZYYTgV6FBf03SWD5sh
         yXlzlkQTBCTZUfB6CRi8636jytbUMXvg0HrWfyh7Egjn75Bac3NHwEH7R0jgvTd6ODVd
         DaHw==
X-Gm-Message-State: AOAM531VwkkINpE0Z3L31EB79vM2nIsrMQ1rPOZx9gfHRE8gQsLis2yx
        aYgrJn6XNwoiNkalqmE7WS1/TA==
X-Google-Smtp-Source: ABdhPJzX3wsolXB3gh4HLIugnLXEvTj+2HYpykcX60mAnwZSgmxSksBkiiajaUu2dKLK1IoBcOmU0A==
X-Received: by 2002:a05:6a00:c8f:b0:505:d602:679a with SMTP id a15-20020a056a000c8f00b00505d602679amr8329790pfv.66.1649792707292;
        Tue, 12 Apr 2022 12:45:07 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:e880:a5db:8eff:6b6a])
        by smtp.gmail.com with ESMTPSA id x24-20020aa793b8000000b00505d614f4e0sm5793424pff.112.2022.04.12.12.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 12:45:06 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, patches@lists.linux.dev,
        Alex Elder <elder@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH] clk: qcom: rpmh: Set wake/sleep state for BCM clks
Date:   Tue, 12 Apr 2022 12:45:05 -0700
Message-Id: <20220412194505.614002-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Set the wake and sleep state for BCM clks here, not just the active
state, as the active only state is dropped when CPUs go to deep idle.
This ensures the clk is always on when the driver thinks it is on.

This was found by inspection, and could very well be incorrect if the
RPMh hardware copies over the active only state to the sleep and wake
states.

Cc: Alex Elder <elder@linaro.org>
Cc: Taniya Das <quic_tdas@quicinc.com>
Fixes: 04053f4d23a4 ("clk: qcom: clk-rpmh: Add IPA clock support")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/clk/qcom/clk-rpmh.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index aed907982344..29da1ffd10cf 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -260,6 +260,7 @@ static int clk_rpmh_bcm_send_cmd(struct clk_rpmh *c, bool enable)
 	struct tcs_cmd cmd = { 0 };
 	u32 cmd_state;
 	int ret = 0;
+	enum rpmh_state state;
 
 	mutex_lock(&rpmh_clk_lock);
 	if (enable) {
@@ -274,15 +275,19 @@ static int clk_rpmh_bcm_send_cmd(struct clk_rpmh *c, bool enable)
 		cmd.addr = c->res_addr;
 		cmd.data = BCM_TCS_CMD(1, enable, 0, cmd_state);
 
-		ret = clk_rpmh_send(c, RPMH_ACTIVE_ONLY_STATE, &cmd, enable);
-		if (ret) {
-			dev_err(c->dev, "set active state of %s failed: (%d)\n",
-				c->res_name, ret);
-		} else {
-			c->last_sent_aggr_state = cmd_state;
+		for (state = RPMH_SLEEP_STATE; state <= RPMH_ACTIVE_ONLY_STATE; state++) {
+			ret = clk_rpmh_send(c, state, &cmd, enable);
+			if (ret) {
+				dev_err(c->dev, "set %s state of %s failed: (%d)\n",
+					!state ? "sleep" :
+					state == RPMH_WAKE_ONLY_STATE	?
+					"wake" : "active", c->res_name, ret);
+				goto out;
+			}
 		}
+		c->last_sent_aggr_state = cmd_state;
 	}
-
+out:
 	mutex_unlock(&rpmh_clk_lock);
 
 	return ret;

base-commit: 3123109284176b1532874591f7c81f3837bbdc17
-- 
https://chromeos.dev

