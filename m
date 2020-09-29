Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93D5E27D521
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 19:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727863AbgI2Rxr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 13:53:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728379AbgI2Rxl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 13:53:41 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85F76C0613D2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 10:53:41 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id n14so5310992pff.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 10:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=d5NHMOfzoZtUI9mNkF0dRKXjszoqYK7ekBI5K8v9id0=;
        b=HhWa9++EqlvSV1/AxY493KAUH2ktKFTjdgz6plENoEl5upE9fuV1zfwvRXB9C0mLaJ
         QmupooH+E+lkgbOIaAJOn8xeYgUvPWVHG6IWXmDCngyVBUtdDcBY7H7g0QrkP0f0c32q
         ucMwSb29Ewy6Vz8yn7GFHZrjbILJxJba/PtystV7CoWBAP8SqrxHNLA3Yu8ebfY42bRO
         qad+sZaKR/Jqh+aAZ6c1CV5EGKd0NtXPXBEq8QEbDO0xP501oilRb0iEqLZ4+paP1Od7
         8wU3F8lvVt5NV7TgGn8ejQEB0NMeZvFuEfhi/hAu21zS5gx/rSRehdt/Qwy682y1yk3h
         h18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=d5NHMOfzoZtUI9mNkF0dRKXjszoqYK7ekBI5K8v9id0=;
        b=PR3D4VARh7iksfq9+1w40JQ7xf11i76sPIZ/8bXCcAsEN8B5Ll75VesZIUsTaOuyj+
         UJKZoiKldc5Xk1XLHRsae/+fZshNBtIXBISF0KUEswrbJUTfHtnajt2l34kcWHoELqL/
         AMLweg9bgHdiYmiipBp7dXDkxD88v4Mx8i58MUT8W5JO8ZDHmItS63NWgewrDoPlS48L
         QlHUEzStCaYph/jRIv/38dR0897sv1nKUYXxAn+hcQG+dXRAybGBqBvkRkz0GqPVta14
         Ly1fdfqPggMypen3fFruKpFTsBQhLXInAsORTdE4Gr3bmaycbhhtY29+VoLqWjQEWIhi
         lwfg==
X-Gm-Message-State: AOAM531DXcvFzfjEAeum/SZWiQBK1F7K2yS7sPKwkKMjdYLSvRuSXvtd
        KqBlcqZlg9W8MSqbMJhiNugK
X-Google-Smtp-Source: ABdhPJxBBwqWfMMoD+HnTfwjAWNt4UlJd3VoGL0BhhqEJ+dg+fNv2g4nWNaP5VKIpgMADXBlJR4EVw==
X-Received: by 2002:aa7:9817:0:b029:13e:d13d:a139 with SMTP id e23-20020aa798170000b029013ed13da139mr5011278pfl.33.1601402020983;
        Tue, 29 Sep 2020 10:53:40 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id r188sm6271046pfc.67.2020.09.29.10.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 10:53:40 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 17/19] bus: mhi: Remove unused nr_irqs_req variable
Date:   Tue, 29 Sep 2020 23:22:16 +0530
Message-Id: <20200929175218.8178-18-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929175218.8178-1-manivannan.sadhasivam@linaro.org>
References: <20200929175218.8178-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Loic Poulain <loic.poulain@linaro.org>

nr_irqs_req is unused in MHI stack.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c | 3 ---
 include/linux/mhi.h         | 2 --
 2 files changed, 5 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 103d51f35e28..0ffdebde8265 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -680,9 +680,6 @@ static int parse_ev_cfg(struct mhi_controller *mhi_cntrl,
 		mhi_event++;
 	}
 
-	/* We need IRQ for each event ring + additional one for BHI */
-	mhi_cntrl->nr_irqs_req = mhi_cntrl->total_ev_rings + 1;
-
 	return 0;
 
 error_ev_cfg:
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index fb45a0ff9aa3..d4841e5a5f45 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -312,7 +312,6 @@ struct mhi_controller_config {
  * @total_ev_rings: Total # of event rings allocated
  * @hw_ev_rings: Number of hardware event rings
  * @sw_ev_rings: Number of software event rings
- * @nr_irqs_req: Number of IRQs required to operate (optional)
  * @nr_irqs: Number of IRQ allocated by bus master (required)
  * @family_number: MHI controller family number
  * @device_number: MHI controller device number
@@ -393,7 +392,6 @@ struct mhi_controller {
 	u32 total_ev_rings;
 	u32 hw_ev_rings;
 	u32 sw_ev_rings;
-	u32 nr_irqs_req;
 	u32 nr_irqs;
 	u32 family_number;
 	u32 device_number;
-- 
2.17.1

