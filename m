Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D28117C950
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2020 01:01:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbgCGAA1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Mar 2020 19:00:27 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:51302 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726910AbgCGAA0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Mar 2020 19:00:26 -0500
Received: by mail-pj1-f65.google.com with SMTP id l8so1719572pjy.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2020 16:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u8+XDECHKDnfFP2mU6jtvKWXeYjZc2hEZEODKmTyouM=;
        b=Rk1/bVnMbRF9Lx6Cx0Z+WlP/U4z3dT3o630PtJQW78Ee+ARVteSVzn9G09ald+vqpy
         Anl9XlNteMq5T7K5e8b2nVG19kbp/QVP5S0ps+nWFuCHVqh5ychoRrmSlDFEiSiEmLNL
         R6ac50QbuiTN35VMh81HB+/1D358MDgXZLFPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u8+XDECHKDnfFP2mU6jtvKWXeYjZc2hEZEODKmTyouM=;
        b=UGqJcGHI5iP4KRWwCLW7P9P92G09WLm5uC3olsnv1AxijI8IAQ/X6YeCtogDYcgTEC
         dSMdtfayWFdKksjPM3nPeWNklNDBQMpCTicfdQoglbSMmruRbJtc6FjUURkJVDESCGNS
         GUGTZBdHeamfWeNt5JQKBtk1Y0lkeYa2MQZspPjVveEAXce5xwgaghyxLubxrR2PmIch
         ICxlKEaeEaFiKUyfkp22pPkCGPytwONofW14yJQjnhV1wAMCG60XKrHbC50dlIqg+rzK
         3WFjKWush2D0Ha+XqzgnTo4C/jvhrb84mcy8D7CGIp2rwQKcVZRM5/JHWulm6Y6KM2Ng
         AO0w==
X-Gm-Message-State: ANhLgQ2Bwa6VKHfAjDStIZu4oLIhuIPP2Ul1zJX0ekgQflXor74BFTLB
        Q8BHfkpR8ruYhjwulqnbfT1c/8iJa48=
X-Google-Smtp-Source: ADFU+vsMW5ZhQfBcezJmBw3nxRDvAXLlbc/cbUBGeIMPdBufoGau4nXPge83URx0Kor3ZsEK7Q4sPA==
X-Received: by 2002:a17:90b:378d:: with SMTP id mz13mr6440459pjb.191.1583539225658;
        Fri, 06 Mar 2020 16:00:25 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id 9sm32302246pge.65.2020.03.06.16.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 16:00:25 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>, mka@chromium.org,
        evgreen@chromium.org, swboyd@chromium.org,
        Lina Iyer <ilina@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFT PATCH 4/9] drivers: qcom: rpmh-rsc: Remove get_tcs_of_type() abstraction
Date:   Fri,  6 Mar 2020 15:59:46 -0800
Message-Id: <20200306155707.RFT.4.Ia348ade7c6ed1d0d952ff2245bc854e5834c8d9a@changeid>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200306235951.214678-1-dianders@chromium.org>
References: <20200306235951.214678-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The get_tcs_of_type() function doesn't provide any value.  It's not
conceptually difficult to access a value in an array, even if that
value is in a structure and we want a pointer to the value.  Having
the function in there makes me feel like it's doing something fancier
like looping or searching.  Remove it.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/soc/qcom/rpmh-rsc.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index 099603bf14bf..a1298035bcd2 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -169,17 +169,10 @@ static bool tcs_is_free(struct rsc_drv *drv, int tcs_id)
 	       read_tcs_reg(drv, RSC_DRV_STATUS, tcs_id);
 }
 
-static struct tcs_group *get_tcs_of_type(struct rsc_drv *drv, int type)
-{
-	return &drv->tcs[type];
-}
-
 static int tcs_invalidate(struct rsc_drv *drv, int type)
 {
 	int m;
-	struct tcs_group *tcs;
-
-	tcs = get_tcs_of_type(drv, type);
+	struct tcs_group *tcs = &drv->tcs[type];
 
 	spin_lock(&tcs->lock);
 	if (bitmap_empty(tcs->slots, MAX_TCS_SLOTS)) {
@@ -245,9 +238,9 @@ static struct tcs_group *get_tcs_for_msg(struct rsc_drv *drv,
 	 * dedicated AMC, and therefore would invalidate the sleep and wake
 	 * TCSes before making an active state request.
 	 */
-	tcs = get_tcs_of_type(drv, type);
+	tcs = &drv->tcs[type];
 	if (msg->state == RPMH_ACTIVE_ONLY_STATE && !tcs->num_tcs) {
-		tcs = get_tcs_of_type(drv, WAKE_TCS);
+		tcs = &drv->tcs[WAKE_TCS];
 		if (tcs->num_tcs) {
 			ret = rpmh_rsc_invalidate(drv);
 			if (ret)
-- 
2.25.1.481.gfbce0eb801-goog

