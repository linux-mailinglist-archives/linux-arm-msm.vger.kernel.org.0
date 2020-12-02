Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 952EE2CB976
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 10:45:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388555AbgLBJod (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 04:44:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388545AbgLBJob (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 04:44:31 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D727C061A52
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 01:42:58 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id e23so734447pgk.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 01:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UISj8CWAL6pda/2do9TebmYyKaX57n+8YUGGANaX7W0=;
        b=sLCmBPiQlkMjcP5oGrJgKQzzo8uyPkgPRAqX4hAAQO50S5gr48ua4GeeKT99lfpxz1
         GRCqFji/lR6xCQHHsURqW7hgPIRRnxdPONmT1rxwPPItHo2XYZNjGVy8kD3WEsMSQUFf
         xRA1og6GGg/tQBehyfIvZa5AT2wc0nVfQKSnxUDBX0zQlJgXOkPkhUG/Idcjrrexy42C
         JrNmBCcMnrTps1p3idxwuCCWF7blMxRsuAdXqqzs+iZHCgJ6ixU1NwEUzY64aUCzBOet
         qx/eH+u2OSr5H5dp0Cgs5CarR6uNe6q0j1msCeNEzzf/dJ9ZlhuF7qAChQo2+3PWeot0
         g+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UISj8CWAL6pda/2do9TebmYyKaX57n+8YUGGANaX7W0=;
        b=T21gOGuTMaCGPNnRT4YlbPsYuO2NnujwzQeZ8eVL4RxEar+yUfrYQB9RvVQK6QkFeC
         Xn4NZ2C0GWllnC4yu+Ey9p7I5zfjMiLEw/IwA1SPxdj9QVhEX+HOoXXrg0k4B08KGU85
         pyVShsUBtxNvL1+wZeH53kGYlVZ3rEPLTlcqP72ff6peYLBcuYzZDDe8OCl7aon/X3RN
         tWso1VV39BP7MFxLIy5CGSRyXiHcvCz0Fmdc+SDskLQqjxLd07ym7GaIkMFKYvyJESKw
         nITB323+6gzSp6KvBZMQEISjANAW27SUdE+xteG0UQqPO1Nad+/fuiAfWPGyNQFHgGKs
         1KAg==
X-Gm-Message-State: AOAM532LimdqIjXFpYUoHqQpYVW4KtXxFCDalaaK0ZX2zmNA83B+APDp
        r3htynFeWEp9NrFOC4s1FW40
X-Google-Smtp-Source: ABdhPJzB6eg6sP3c2s68jpJ5N6YRxqHWf9EWXEPn5fGeup4eXipSk953yqS2T9LIjIWtjdU6MzoEyQ==
X-Received: by 2002:a63:5802:: with SMTP id m2mr1904626pgb.58.1606902178104;
        Wed, 02 Dec 2020 01:42:58 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id bg8sm1393990pjb.52.2020.12.02.01.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 01:42:57 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 08/29] bus: mhi: core: Add missing EXPORT_SYMBOL for mhi_get_mhi_state()
Date:   Wed,  2 Dec 2020 15:11:38 +0530
Message-Id: <20201202094159.107075-9-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
References: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

Add missing EXPORT_SYMBOL_GPL() declaration for mhi_get_mhi_state()
API.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index cea5eab83f48..6ecaacaa8b54 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -132,6 +132,7 @@ enum mhi_state mhi_get_mhi_state(struct mhi_controller *mhi_cntrl)
 				     MHISTATUS_MHISTATE_SHIFT, &state);
 	return ret ? MHI_STATE_MAX : state;
 }
+EXPORT_SYMBOL_GPL(mhi_get_mhi_state);
 
 int mhi_map_single_no_bb(struct mhi_controller *mhi_cntrl,
 			 struct mhi_buf_info *buf_info)
-- 
2.25.1

