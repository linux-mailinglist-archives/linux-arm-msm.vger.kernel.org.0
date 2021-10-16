Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29DB14300B5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 08:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243718AbhJPHAN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 03:00:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243713AbhJPHAM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 03:00:12 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7C91C061765
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Oct 2021 23:58:04 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id i76so8142646pfe.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Oct 2021 23:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PSnBBHmQDKKzZaMOl+dSnVydeHhc9eP8o2lCcovzMc8=;
        b=w8tJccHIf6PPWVXEA/XDUTRC3rJpIf9L7f+3DeKSYA69hhp3JJ2+ro4Fv9KZ/Xq/9m
         dUO/uHgMzKPjtT8E5gD8qQ3bDhGJSFJu0B+gTihLrXduYR2t/DNvcoqe9oZKdM8yZVqI
         jPmC1gOU21d28VUAfcuahRmg3+gPdzsppjQLLOJr1rIXfDuwNUY6pqIELm0nsw3TYS01
         m7aq4vloUggNOYskY6X1O5CTeBlC0Qa9C6oDLoDKDRmOqJ/EJaWLyfQ/43DBP3ZjYl0Q
         /DfsSiG06mH22sX0cIuCoGUfofelm2Jxy2AtObZ9cxv2p1WFrjcgRGYaEptNJOT0YBEU
         2X1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PSnBBHmQDKKzZaMOl+dSnVydeHhc9eP8o2lCcovzMc8=;
        b=T/GG0+dHUIvUTUPtTIE2mwv+9U0wj8bwrQoH5o+R1Cwr2SG4HVP2hqg/93Gl2N388h
         SFdy8rQXly5/jGLySjoqLr4PfjVGgafKUTmc0AVOSKucBI7QdsSEfsq2O2iNYDC4aK7E
         VwvhMAz41SBkFh9EcT/ty8drbaljeXxgmdN1cPAPOrgqIMfCweg4seIs4BZ2HDczW5SU
         OmI3eymLu3sdRdM7fJsbUJOcdpxl6ltHUG7I2numhKXDCBrroP1rUiM45QSirzj4+WF0
         8DTiXS+wdeB8GbujdCXTlSLuKqxjbN7VlRG39exc036tj9WvNvI9X1EjS8fIsw0O68pY
         0SlQ==
X-Gm-Message-State: AOAM532fmzGPBvhXBPC4bNMo4UiOTdxD22dFmGnbUaUscJ635PFvCk+G
        aJWpwto1OOTmUSJiwi9U+8Wn
X-Google-Smtp-Source: ABdhPJwUmO50W6OByAHj6jJvQe3hFBMXPRFvTt8Nun1ZWjTZpMCz5WETXvv8NLVtFMiXAdMsS9lLTQ==
X-Received: by 2002:a63:20f:: with SMTP id 15mr12477340pgc.319.1634367484257;
        Fri, 15 Oct 2021 23:58:04 -0700 (PDT)
Received: from localhost.localdomain ([117.202.185.237])
        by smtp.gmail.com with ESMTPSA id a17sm7024253pfd.54.2021.10.15.23.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 23:58:03 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        loic.poulain@linaro.org, wangqing@vivo.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 3/3] bus: mhi: replace snprintf in show functions with sysfs_emit
Date:   Sat, 16 Oct 2021 12:27:34 +0530
Message-Id: <20211016065734.28802-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016065734.28802-1-manivannan.sadhasivam@linaro.org>
References: <20211016065734.28802-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Qing Wang <wangqing@vivo.com>

coccicheck complains about the use of snprintf() in sysfs show functions.

Fix the following coccicheck warning:
drivers/bus/mhi/core/init.c:97:8-16: WARNING: use scnprintf or sprintf.

Use sysfs_emit instead of scnprintf or sprintf makes more sense.

Signed-off-by: Qing Wang <wangqing@vivo.com>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Link: https://lore.kernel.org/r/1634095550-3978-1-git-send-email-wangqing@vivo.com
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 5aaca6d0f52b..a5a5c722731e 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -94,7 +94,7 @@ static ssize_t serial_number_show(struct device *dev,
 	struct mhi_device *mhi_dev = to_mhi_device(dev);
 	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
 
-	return snprintf(buf, PAGE_SIZE, "Serial Number: %u\n",
+	return sysfs_emit(buf, "Serial Number: %u\n",
 			mhi_cntrl->serial_number);
 }
 static DEVICE_ATTR_RO(serial_number);
-- 
2.25.1

