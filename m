Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 808E01825AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 00:14:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731492AbgCKXOs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 19:14:48 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39783 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731494AbgCKXOU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 19:14:20 -0400
Received: by mail-pf1-f196.google.com with SMTP id w65so2208589pfb.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 16:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kG1+YVl0s8o9smr2trKOZ7NbvC55EDPcXtr8oUkRgXE=;
        b=ClKgrdpCmsvoy2gfXgwaLyaAM1AihCtYKyvZqzuy05EGgTbYcUN7uJ0SPLSwc4/4cw
         aR5se+RbOXCoyHSA33S+YdUlP0iiAd58cRs0M6QOrypjdzfoVRRp2d0QynUiBGxMZtd1
         54mJCAn4YFUnZWaGt34SJYmeqmweS894Ge5Uw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kG1+YVl0s8o9smr2trKOZ7NbvC55EDPcXtr8oUkRgXE=;
        b=td7+GjO5rJgQ7qIIekVFJlQCI4wJ6IFGkTyTJ4/Kmp9Kkrabll4uTmk8Pok254d7XO
         vBbAzU6/RShVrrlU0ThC6neeEcz0DJuov8DJxGHQl47l6zVDR6zXrJl7jgKAMwpsnsGt
         aqJx7u+hKe/MYVlt351RnYkRv+Lkf41PcIJmqisdDD1aj8N8N75vJWZZqSWCCW7S9rgY
         iPSaSoQyBN1Zi9/Jau2ecXIdvDuKuoFtFSyxSsdmMtE1QROVqbYGm9ylQRbeUkuwphG3
         t7C4TyYOxc/B+8O+tRghVeUwx6Cwux7Tvi16W1ntI2fPsQOwKGjs2W92FWliOkAPnh0t
         rwhg==
X-Gm-Message-State: ANhLgQ3wZDnlSr36xJ35b4qA+F7LpzQmgleY+3uYxVjbz9KggxdYI8Dm
        8m+VscsrUsdy/Spxzg4Ri4oamw==
X-Google-Smtp-Source: ADFU+vs/ReMVEIKJdAieZwzQ6Ome0PIMgPnHEZ2NECjwaMVYEiKRDwr2hM+QvF7yG/PvY4YndTe9tw==
X-Received: by 2002:a63:58a:: with SMTP id 132mr5025730pgf.216.1583968459378;
        Wed, 11 Mar 2020 16:14:19 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id g75sm2606334pje.37.2020.03.11.16.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 16:14:18 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Cc:     mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
        evgreen@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        swboyd@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 06/10] drivers: qcom: rpmh-rsc: Comment tcs_is_free() + warn if state mismatch
Date:   Wed, 11 Mar 2020 16:13:44 -0700
Message-Id: <20200311161104.RFT.v2.6.Icf2213131ea652087f100129359052c83601f8b0@changeid>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200311231348.129254-1-dianders@chromium.org>
References: <20200311231348.129254-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

tcs_is_free() had two checks in it: does the software think that the
TCS is free and does the hardware think that the TCS is free.  Let's
comment this and also add a warning in the case that software and
hardware disagree, at least for ACTIVE_ONLY TCS.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Comment tcs_is_free() new for v2; replaces old patch 6.

 drivers/soc/qcom/rpmh-rsc.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index 9d2669cbd994..93f5d1fb71ca 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -181,8 +181,27 @@ static void write_tcs_reg_sync(struct rsc_drv *drv, int reg, int tcs_id,
  */
 static bool tcs_is_free(struct rsc_drv *drv, int tcs_id)
 {
-	return !test_bit(tcs_id, drv->tcs_in_use) &&
-	       read_tcs_reg(drv, RSC_DRV_STATUS, tcs_id);
+	/* If software thinks it's in use then it's definitely in use */
+	if (test_bit(tcs_id, drv->tcs_in_use))
+		return false;
+
+	/* If hardware agrees it's free then it's definitely free */
+	if (read_tcs_reg(drv, RSC_DRV_STATUS, tcs_id) != 0)
+		return true;
+
+	/*
+	 * If we're here then software and hardware disagree about whether
+	 * the TCS is free.  Software thinks it is free and hardware thinks
+	 * it is not.
+	 *
+	 * Maybe this should be a warning in all cases, but it's almost
+	 * certainly a warning for the ACTIVE_TCS where nobody else should
+	 * be doing anything else behind our backs.  For now we'll just
+	 * warn there and then still return that we're in use.
+	 */
+	WARN(drv->tcs[tcs_id].type == ACTIVE_TCS,
+	     "Driver thought TCS was free but HW reported busy\n");
+	return false;
 }
 
 /**
-- 
2.25.1.481.gfbce0eb801-goog

