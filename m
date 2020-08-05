Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0696223D26C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Aug 2020 22:13:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728078AbgHEUMs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Aug 2020 16:12:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726968AbgHEQZe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Aug 2020 12:25:34 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C601C001FE1
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2020 09:16:36 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id t6so24701987pgq.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2020 09:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yoUWB0P6FTokCu5fDJiOmP1nTkXeVKywh1BuHo0WaYk=;
        b=PH+mAesaWFdItU17aWsg/FXG5MD1NTJNqiVx4V5E7t/gK1JX24tKMa9SU33PBqiVlW
         hJnkIvrbxMcLIfI/5vfig4MkwqT8ywcTqOzNQ1/MhO6RK4tW2PMqUofXj0H6dv6+NK9U
         KmxgLN3iKX4j5mg3wdDNJ9wn2Was1zgft42N8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yoUWB0P6FTokCu5fDJiOmP1nTkXeVKywh1BuHo0WaYk=;
        b=Q/J+Nxax+2O5+B/YQp3lKw9W1ulPgyQeLehXqLNTcONt4c616gDiwDN2sEql9rXdOz
         ZTXOE5v3weeqt+D2b9n79+rhm3mVb5+02laJgAa5a2DpTtnr8Enkx1nviRYXXsWUG8sH
         t/bkVAmfZrDOvdfJ0/0TZ9Pka+gd2DBleNjDbQlSV6HS+SzNHTJoyTseSXic6aeMryll
         rn86n9aaRnRKCJNnTYaZys3SY1sYIk9rRPJyi8BapEohT7j7FubQOH8s0teUrVqUa1ZE
         a/L7GoUZIBPgbRO3CFJRuLuFelbCL8dLVhZM4unPujIeFI49uI1oA2UclnMvT4DhEC9B
         Oiew==
X-Gm-Message-State: AOAM532/ibDPsdo78f76BdiS8+eCa3kFHF4zQ/tPBcJBuB5eKqIfHI0b
        fpVeTJWnS9BqPhmZLbkXwV2+GA==
X-Google-Smtp-Source: ABdhPJyI7n/ZnEwi7VJ7iEODyBwIQasFlmldWO0wkAr5x7dLBPwWfsy76ZCGbBdA4sMgeYeWOSX1XA==
X-Received: by 2002:a63:1c23:: with SMTP id c35mr3471145pgc.91.1596644195727;
        Wed, 05 Aug 2020 09:16:35 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id f2sm4259734pfb.184.2020.08.05.09.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 09:16:35 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     swboyd@chromium.org, Alex Elder <elder@linaro.org>,
        mka@chromium.org, Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] soc: qcom: aoss: qmp_send() can't handle interruptions so stop pretending
Date:   Wed,  5 Aug 2020 09:16:11 -0700
Message-Id: <20200805091141.2.If847565ed7568448c67804f3735d5f8a61eda560@changeid>
X-Mailer: git-send-email 2.28.0.163.g6104cc2f0b6-goog
In-Reply-To: <20200805091141.1.I86b3faaecb0d82997b599b1300f879606c71e116@changeid>
References: <20200805091141.1.I86b3faaecb0d82997b599b1300f879606c71e116@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The function qmp_send() called wait_event_interruptible_timeout() to
wait for its interrupt.  However, this function did not check for
-ERESTARTSYS and assumed that any non-zero return value meant that the
event happened.

While we could try to figure out how to handle interruptions by
figuring out how to cancel and/or undo our transfer in a race-free way
and then communicating this status back to all of our callers, that
seems like a whole lot of complexity.  As I understand it the transfer
should happen rather quickly and if we're really hitting the 1 second
timeout we're in deep doggy doodoo anyway.  Let's just use the
non-interruptible version of the function and call it good enough.

Found by code inspection.  No known test cases expose the problem
described here.

Fixes: 2209481409b7 ("soc: qcom: Add AOSS QMP driver")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/soc/qcom/qcom_aoss.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index 818cdf74a267..897f9f1c33ba 100644
--- a/drivers/soc/qcom/qcom_aoss.c
+++ b/drivers/soc/qcom/qcom_aoss.c
@@ -257,8 +257,8 @@ static int qmp_send(struct qmp *qmp, const void *data, size_t len, bool noirq)
 		time_left = readx_poll_timeout_atomic(qmp_message_empty, qmp,
 						      is_empty, is_empty, 1U, 1000000U);
 	else
-		time_left = wait_event_interruptible_timeout(qmp->event,
-							     qmp_message_empty(qmp), HZ);
+		time_left = wait_event_timeout(qmp->event, qmp_message_empty(qmp), HZ);
+
 	if (!time_left) {
 		dev_err(qmp->dev, "ucore did not ack channel\n");
 		ret = -ETIMEDOUT;
-- 
2.28.0.163.g6104cc2f0b6-goog

