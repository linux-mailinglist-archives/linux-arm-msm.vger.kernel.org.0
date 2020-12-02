Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC4D2CB97C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 10:45:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388606AbgLBJon (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 04:44:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388541AbgLBJom (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 04:44:42 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7FF7C061A4E
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 01:44:06 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id o4so774396pgj.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 01:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EVdtvlNlMaH6XJZVDa7SACl1Wek+TOSf5O60QTYY0oc=;
        b=oNLCZIZ0/aPHgaorzTRveyCpmaxIgzkOy/EMMm968Nh3E6zHjukXnPEgdU/smgfwEx
         0GglQkJ6Z62lmgh6lfclTB4UZazJBcDdd4Lq8IvUCgrB6gxVEuKJDpqDOIK4AIsbJj69
         Pok3FEmvpfEZ9z0i+sU34IcyqHTxfFuzPb/kFQfFFiKNXp9j7mF16flViAm3HexD5g86
         Ef1BFNrG2ieqKgkTa6TVSCbokXW9sjsIS0/h97pDlH3VPcAnhTRdp+Vtw6UrDRx84m/4
         FodcVAuBJNXA5qdOOoy1toC3d91iGGladljqxPf9DXdzG9b8kAL88v7YeNX+2KIwcrdB
         RLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EVdtvlNlMaH6XJZVDa7SACl1Wek+TOSf5O60QTYY0oc=;
        b=jXIN4wVbsLY5t2BD1QKaQo7ijVevAEwOYknqJrncMkFohHOOTah0T5RAOqxRCyPbWM
         gqx7pNjmW9m90WemH0U0qLK6t8qA0bVef1lt0qGK/nZ6Xuk+Q7i0/RRDoKWZPvlEOyI/
         uUIg2Zr2JmR1zUFJ+uycJDAtu743++WxMmyRUQwKytSgRIMiRWKIC6rFPwccTnO42Gm7
         EA7FGOA/QMcmoQveV4fr3/BFqK9TlxZ1laGfQaf14niKlgM7+1QXkinb2t09hGnr5f39
         ezCfaoiAIX72eIvu8b+HKvIUVOtBCbSQK7MZB+74+kjMjDSs3kHdOvvt11wwvVTa72ZN
         pBkw==
X-Gm-Message-State: AOAM5303zIfpT3lnXeJ4ph7qIEdpHfyX8PNHg8OFlKAbuxLDaYibq0Sv
        APk9z/V4jC4Cva2XyKU9nQZA
X-Google-Smtp-Source: ABdhPJxkX16a4AE+GB44iuGv9c1RKokX/87GvxZNAbzmyXaOIW/x3yLPlvPwhwsdZ1nWkK136vbF5w==
X-Received: by 2002:a63:d357:: with SMTP id u23mr1890661pgi.106.1606902246250;
        Wed, 02 Dec 2020 01:44:06 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id bg8sm1393990pjb.52.2020.12.02.01.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 01:44:05 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        Jakub Kicinski <kuba@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 25/29] net: qrtr: Unprepare MHI channels during remove
Date:   Wed,  2 Dec 2020 15:11:55 +0530
Message-Id: <20201202094159.107075-26-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
References: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reset MHI device channels when driver remove is called due to
module unload or any crash scenario. This will make sure that
MHI channels no longer remain enabled for transfers since the
MHI stack does not take care of this anymore after the auto-start
channels feature was removed.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Acked-by: Jakub Kicinski <kuba@kernel.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 net/qrtr/mhi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
index 7100f0bac4c6..2bf2b1943e61 100644
--- a/net/qrtr/mhi.c
+++ b/net/qrtr/mhi.c
@@ -104,6 +104,7 @@ static void qcom_mhi_qrtr_remove(struct mhi_device *mhi_dev)
 	struct qrtr_mhi_dev *qdev = dev_get_drvdata(&mhi_dev->dev);
 
 	qrtr_endpoint_unregister(&qdev->ep);
+	mhi_unprepare_from_transfer(mhi_dev);
 	dev_set_drvdata(&mhi_dev->dev, NULL);
 }
 
-- 
2.25.1

