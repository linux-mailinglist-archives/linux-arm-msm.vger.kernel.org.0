Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B35721A6AE4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 19:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732443AbgDMRF1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 13:05:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732377AbgDMREv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 13:04:51 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51419C0A3BE2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 10:04:51 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id t4so3585127plq.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 10:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xNVrx/cI7Cu2aF2a/gD7IMs8PmBNgX56QvuSL2GOgsU=;
        b=U/e6j/f2nuhIpQcM4lGNm4mG6gg2uZF/vFx/YsAipQh6wEYucIh8IJxvdNhsijNsNK
         HhJKGyfUZB1pZWPO9vCaxin77wWWMyy+bNJhuxIwmZhmQlCJoegvL2+SQdR03DnDvS3f
         A1drOrlR1tfi/taZdfgTcK7q3+JQbvSmRnfOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xNVrx/cI7Cu2aF2a/gD7IMs8PmBNgX56QvuSL2GOgsU=;
        b=XXYD+2I7EgeruJt13lF4/F29EHiHemQA1Flvksw+N8IhEChRaLwlg/SZLzeJuxTKcx
         UI8ncP0xWGlnyiaRQxPVJVCGeuZ6P1v38o4mDmzjUVHpSDHZorTK3A/khmbs24MW+Mf4
         hViJUfVaoB9aITy0gCbheeM7iQ3isXPNelemoG6B6fEe7PBV201SFK4RTaAsbXcdM8zS
         j+djCPYEx/ICdukzkPtf4KsWBk+omjXaog8kVuEBiTy+vXL59giEkbvvpGkA9CPdjDLK
         5wH4B3jHBs8HhrG25LuCqKMccBXJLdK3qAA0Q87oAmMmlDLf8m/gC3C7lMVkDLTREXy7
         d8jg==
X-Gm-Message-State: AGi0PubdD9A3YbbZon36vpVNcMN2ub3Fa1b7KjO8DOteXxQCS04mwVfM
        HBryL2LGhin07Nt523Div3eQeA==
X-Google-Smtp-Source: APiQypIi0psKyslevtOfZ9WzW7UTKWqNYR8/2uGXcyDi3BKC73uBASSVCF3GMo2wooVKUt7nJO6Dtg==
X-Received: by 2002:a17:902:8b87:: with SMTP id ay7mr18674684plb.281.1586797490877;
        Mon, 13 Apr 2020 10:04:50 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id p62sm1634414pfb.93.2020.04.13.10.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 10:04:50 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Cc:     swboyd@chromium.org, mka@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>, evgreen@chromium.org,
        Lina Iyer <ilina@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 08/10] drivers: qcom: rpmh-rsc: Don't double-check rpmh payload
Date:   Mon, 13 Apr 2020 10:04:13 -0700
Message-Id: <20200413100321.v4.8.I8e187cdfb7a31f5bb7724f1f937f2862ee464a35@changeid>
X-Mailer: git-send-email 2.26.0.110.g2183baf09c-goog
In-Reply-To: <20200413170415.32463-1-dianders@chromium.org>
References: <20200413170415.32463-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The calls rpmh_rsc_write_ctrl_data() and rpmh_rsc_send_data() are only
ever called from rpmh.c.  We know that rpmh.c already error checked
the message.  There's no reason to do it again in rpmh-rsc.

Suggested-by: Maulik Shah <mkshah@codeaurora.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
Tested-by: Maulik Shah <mkshah@codeaurora.org>
---

Changes in v4:
- Add "payload" to end of ("Don't double-check rpmh") patch subject

Changes in v3:
- ("Don't double-check rpmh") replaces ("Warning if tcs_write...")

Changes in v2: None

 drivers/soc/qcom/rpmh-rsc.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index 4e76e5349c44..4f2a72fdac2c 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -633,7 +633,7 @@ static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
 }
 
 /**
- * rpmh_rsc_send_data() - Validate the incoming message + write to TCS block.
+ * rpmh_rsc_send_data() - Write / trigger active-only message.
  * @drv: The controller.
  * @msg: The data to be sent.
  *
@@ -658,12 +658,6 @@ int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg)
 {
 	int ret;
 
-	if (!msg || !msg->cmds || !msg->num_cmds ||
-	    msg->num_cmds > MAX_RPMH_PAYLOAD) {
-		WARN_ON(1);
-		return -EINVAL;
-	}
-
 	do {
 		ret = tcs_write(drv, msg);
 		if (ret == -EBUSY) {
@@ -734,16 +728,6 @@ int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv, const struct tcs_request *msg)
 	unsigned long flags;
 	int ret;
 
-	if (!msg || !msg->cmds || !msg->num_cmds ||
-	    msg->num_cmds > MAX_RPMH_PAYLOAD) {
-		pr_err("Payload error\n");
-		return -EINVAL;
-	}
-
-	/* Data sent to this API will not be sent immediately */
-	if (msg->state == RPMH_ACTIVE_ONLY_STATE)
-		return -EINVAL;
-
 	tcs = get_tcs_for_msg(drv, msg);
 	if (IS_ERR(tcs))
 		return PTR_ERR(tcs);
-- 
2.26.0.110.g2183baf09c-goog

