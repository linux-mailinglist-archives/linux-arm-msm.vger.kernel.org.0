Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC09410981
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Sep 2021 05:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236286AbhISDMy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Sep 2021 23:12:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236124AbhISDMu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Sep 2021 23:12:50 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0317EC06175F
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Sep 2021 20:11:26 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id lb1-20020a17090b4a4100b001993f863df2so10215810pjb.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Sep 2021 20:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=oPqupYvWeeM6Lwb6PK6UvVXuUOXRPg/zPprNicPOHWg=;
        b=k+g8OKL/o1sOLr3m0r/7nP/kYz+ye3X4ipmAUJIdKOOLuurPPY78Lr0dn+Sai4L9bH
         PbpM+GfvQzOYWEgr0sZ8n0OOphksRDWQqXDjaHNJDuFTfWh5TgqfBwV5J5oU08oIsqvS
         KMT5GZoie47r/pkp6bB085e9bkbIfYoHyMOjGUfLSPHL73kENnwcGsyW9LcQneFDinKN
         VoYuanWmaFiBj3kruzvlC4TDtPZyP51G4lRlYCKorowpL7vuP1RPgosks5TX0QYnG0Mw
         kNQqh6wyNAPYRHGNoNj/osejns0r2HpMdVZE6IE3MHd2KnPNRwUekd3ReiZXGNBBzXTc
         U9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=oPqupYvWeeM6Lwb6PK6UvVXuUOXRPg/zPprNicPOHWg=;
        b=Xc5dP5ufC4/Vgcrrhnt08b5CDOS+0BLzHPKsi0FMCuM/GTd+7fUzuoqEWQ0ZlRzUnv
         P9IRexUYq4Yxs2JiNXoJKC++ug2mfcLIuCWWyZPPurBAqnHhT6tbPOampY0E4Dtxn1Gh
         ZHU9jM2Q7jCEkM/o5luOkrOD6jDg+sgFBMw5S9K3JR4E44/cX7MQ8sbIR82u12BZWujU
         Rk2wHsAnwR26jsI2ikwO050g6smljnoD5xHnDKUXe8I7SYqoTbJnivKProUEYrbinP//
         avxHLi93RzGqR3dXM20FisOsqNOC+1QgID19hCNzz3sjHxI+m5H+KPe1/gD/x9rgp0xp
         BQ5Q==
X-Gm-Message-State: AOAM532bl5XZij3JgB1cYeX57qzcgZ36fR8aBNl8yPe++YnVZCevgHlV
        bFdw9mHUVYlByxe8ygcEEurlYg==
X-Google-Smtp-Source: ABdhPJwJQkcDr6YFBErGRS8giww3miLjQuT0rU6PoonKewdgt+yaVE7VYJp/AbGkxrglgV0nx2IrVg==
X-Received: by 2002:a17:902:7fc6:b0:13c:a855:6b76 with SMTP id t6-20020a1709027fc600b0013ca8556b76mr12851817plb.61.1632021085507;
        Sat, 18 Sep 2021 20:11:25 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id 132sm10224931pfy.190.2021.09.18.20.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 20:11:25 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 2/2] phy: qcom-qusb2: Add compatible for QCM2290
Date:   Sun, 19 Sep 2021 11:11:10 +0800
Message-Id: <20210919031110.25064-3-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210919031110.25064-1-shawn.guo@linaro.org>
References: <20210919031110.25064-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible for QCM2290 QUSB2 device which reuses SM6115
configuration.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 3c1d3b71c825..ae063a8b3e28 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -913,6 +913,9 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
 	}, {
 		.compatible	= "qcom,msm8998-qusb2-phy",
 		.data		= &msm8998_phy_cfg,
+	}, {
+		.compatible	= "qcom,qcm2290-qusb2-phy",
+		.data		= &sm6115_phy_cfg,
 	}, {
 		.compatible	= "qcom,sdm660-qusb2-phy",
 		.data		= &sdm660_phy_cfg,
-- 
2.17.1

