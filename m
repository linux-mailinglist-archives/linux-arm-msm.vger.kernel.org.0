Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 237D14ACD81
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Feb 2022 02:08:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237026AbiBHBGe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Feb 2022 20:06:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343979AbiBHARc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Feb 2022 19:17:32 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D767FC061355
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Feb 2022 16:17:31 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id e28so15886262pfj.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Feb 2022 16:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U33ZTHwgHmjIzYzVW35GSTUErZveTsvzYRI78IuL0pI=;
        b=PKAr0GJCu78ei+S4Lat41so9TQfJkESk2YAtsBLsuDgdCKYbchdWWZO0zcikvlM4qp
         SEL9aoQ+G7EDbuJwajYjmQXILX6hHHyQxcI3O/cOVfV8sA8Da7g621rfx5Mqzcf4Qh5D
         6SNG+Ui/OunaDApsqN5YkvnAB5mfr8npQe+iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U33ZTHwgHmjIzYzVW35GSTUErZveTsvzYRI78IuL0pI=;
        b=u2jps74fEbSFlvHfW/pERXxhcn4vV84rdnoPm/thzWzY2HoZYzjeGbj6s9mOolrBbw
         X4ZvQYNng4WvhvidpAdyy8l8JT0dFbBSSeMsABDJxYt1RXV7uLCre8ZV6Iva4B3sRHO7
         f/UTJFo0/KUUaczgf+6pyObLrZv3B31rZYxOdLE/hxijekMmS4YvFYhhNDImdujPCUrv
         ueWqVcptDGQesapCxlEAjp3jGpfzF9iOiY/cZCQOXo9sKqtDu0FCdBlnBJ5WKkr6f4wO
         rUSm0yZyxYmrwTT9PyBJm+J4rhQwmr+MKUMIoZmN4E6FBeNfEdzPw7XXrQuXHupoPgcP
         mejg==
X-Gm-Message-State: AOAM532hiGfOgxVxjF6l5CixPreG2mIY8RFJx1SN98U2eAJIxF1YwJ/I
        fzwxHBdvNNurPXP35iOQpBwdcg==
X-Google-Smtp-Source: ABdhPJyat6mgLk+B7LHmqgM/oZQI4LpOtABby6iQ3FD5YT8iXzyLG2E7KhwkS5O6kFxtifv6r+5mAg==
X-Received: by 2002:a65:5801:: with SMTP id g1mr1479962pgr.43.1644279451436;
        Mon, 07 Feb 2022 16:17:31 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:6c4d:c442:5b4:f597])
        by smtp.gmail.com with ESMTPSA id mz4sm456185pjb.53.2022.02.07.16.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 16:17:31 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        robdclark@gmail.com, quic_khsieh@quicinc.com,
        quic_abhinavk@quicinc.com, linux-phy@lists.infradead.org,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [REPOST PATCH v1 3/3] phy: qcom: Program SSC only if supported by sink
Date:   Mon,  7 Feb 2022 16:17:04 -0800
Message-Id: <20220207161612.REPOST.v1.3.Ie81d594ec2327dae6410db359cc492484bab171f@changeid>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208001704.367069-1-dianders@chromium.org>
References: <20220208001704.367069-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>

Some legacy eDP sinks may not support SSC. The support for SSC is
indicated through an opts flag from the controller driver. This
change will enable SSC only if the sink supports it.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/phy/qualcomm/phy-qcom-edp.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 21cafbb623f8..cacd32f6e0cc 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -335,9 +335,11 @@ static int qcom_edp_phy_power_on(struct phy *phy)
 	writel(0x00, edp->tx0 + TXn_LANE_MODE_1);
 	writel(0x00, edp->tx1 + TXn_LANE_MODE_1);
 
-	ret = qcom_edp_configure_ssc(edp);
-	if (ret)
-		return ret;
+	if (edp->dp_opts.ssc) {
+		ret = qcom_edp_configure_ssc(edp);
+		if (ret)
+			return ret;
+	}
 
 	ret = qcom_edp_configure_pll(edp);
 	if (ret)
-- 
2.35.0.263.gb82422642f-goog

