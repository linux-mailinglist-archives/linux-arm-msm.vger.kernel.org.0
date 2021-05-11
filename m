Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C928637ADE0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 May 2021 20:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232034AbhEKSJT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 May 2021 14:09:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232047AbhEKSJQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 May 2021 14:09:16 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1E4EC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 May 2021 11:08:09 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id 76so19667654qkn.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 May 2021 11:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MC52AvU8yTi/lCNA6BimEkKB2wKFkd/KekP+O2t6FxE=;
        b=Vdz8fvLuCohalVsPL1b+SjeaCADacEduuQntDk85lHx7xeA0WiEWGmwz+nVpIf4Ifs
         aYcNzBmg1200+8EYAvvPiPi2RIUfW5kwW+aSgfIEZIj4kdagjRQx4/sOpFU7W7voOdfN
         e987fvLTeKiIg4QumKnwFQQGPs/iBaMSgZx7v3z1EzMHgwu1jwzblEBuz0Fft+fJSdFg
         BivYC4HejhHRMtfMvPc3YTYYGNNgPoLXl/ONUSN0RjiMZPgBrPZKa7mRjFzLBgKOI/M9
         YGsoy9xIOzxAsUROlX9kFq6RkkNfHYSfnmz6IorxjJfckwAV/5ndTD1hwMmTsvHSsSsK
         Ka5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MC52AvU8yTi/lCNA6BimEkKB2wKFkd/KekP+O2t6FxE=;
        b=Y06rVoVDLH1ep5dx/l1YiOTCTupAXUiD+mWYrDtdluD37jwgosmFAj1GPZLAcspO6E
         IuugZpnvR8f9kYIkNhdDwB3QZbptaB4dJb/0JOt1byC4sTCRQwJUbmal6PXNbKEweNHE
         RgmSoM0eLpcld84Y8rDQg+pTezuOc0L6al0wYepkIqYIFyqMFjWVD2e5YkQHtA+9Za+M
         cHyfS4G4Iv8So7O5qAzDBB1hrWsXtpY7nJvz6j0AJkL5ObbtdRiX7dKDzpt/3SfJGwtL
         YgkmfSC/Ee0KG3bl9KnvaV1n+QvQXGvP+mhy5n9MDW25Mo9wYRqeyNb+jZIyWUGDaex+
         4pTQ==
X-Gm-Message-State: AOAM532PZBTI2qfOKI6vbWpsx/hC1JV83KGdXqTuAV9IKbni+13yX9Be
        gLfGb4i2sKJO0yNTMRoZNd3Le/98+RQQb6Nm
X-Google-Smtp-Source: ABdhPJx+SOyMflZBYI28atocWsr1QztLmz98kXzxJdZ4S1QJROf1E3vSxNyUNTTcTcKop+KANu3nMA==
X-Received: by 2002:a37:6714:: with SMTP id b20mr29012977qkc.289.1620756488973;
        Tue, 11 May 2021 11:08:08 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id g5sm17104476qtm.2.2021.05.11.11.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 11:08:08 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:QUALCOMM CAMERA SUBSYSTEM DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 02/17] media: camss: csiphy-3ph: disable interrupts
Date:   Tue, 11 May 2021 14:07:09 -0400
Message-Id: <20210511180728.23781-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210511180728.23781-1-jonathan@marek.ca>
References: <20210511180728.23781-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The driver does nothing with the interrupts, so set the irq mask registers
to zero to avoid wasting CPU time for thing.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 35 ++-----------------
 1 file changed, 3 insertions(+), 32 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 5948abdcd220..783b65295d20 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -352,38 +352,9 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 	else if (csiphy->camss->version == CAMSS_845)
 		csiphy_gen2_config_lanes(csiphy, settle_cnt);
 
-	val = 0xff;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(11));
-
-	val = 0xff;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(12));
-
-	val = 0xfb;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(13));
-
-	val = 0xff;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(14));
-
-	val = 0x7f;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(15));
-
-	val = 0xff;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(16));
-
-	val = 0xff;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(17));
-
-	val = 0xef;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(18));
-
-	val = 0xff;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(19));
-
-	val = 0xff;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(20));
-
-	val = 0xff;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(21));
+	/* IRQ_MASK registers - disable all interrupts */
+	for (i = 11; i < 22; i++)
+		writel_relaxed(0, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(i));
 }
 
 static void csiphy_lanes_disable(struct csiphy_device *csiphy,
-- 
2.26.1

