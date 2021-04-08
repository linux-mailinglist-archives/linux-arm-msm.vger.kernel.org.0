Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C554357CBC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 08:45:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbhDHGqD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 02:46:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbhDHGqD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 02:46:03 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32C87C061761
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Apr 2021 23:45:51 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id h20so513499plr.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Apr 2021 23:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZIYfXAXPOp7ZatAz23o3vJ3662QuBOhC/c1rjTDCIu0=;
        b=POhQHZ7X/bDZKkqiIHdXpytiko3Kg763WFx1IAWlLE676y/Kxj40Nksj6yvpi4tCKj
         8BxHTQ4jAaf5OTRh3geuw4K0b0yedRVEdw0GuuBt0dxAgB19N7zIGi6jNm9Do77LEJ79
         l5IGIZT8559uENOV9umiXVkt/gudM6BKg606+MsIHLl2dQEImGTSYHE2GnJtgqZxfBw6
         fMMwlercmku+uNiwYHDI1pd5gTjT7EdBRvHmC6HZBVBswatcSX7E43PiprEp3G/kk2Xk
         +NRTyMKzjFYGya89nu3a/NBDAnw3Ftb8TIlApZV8MEGecwK3jFOc/rIMZhRCy/GoUxhi
         SKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZIYfXAXPOp7ZatAz23o3vJ3662QuBOhC/c1rjTDCIu0=;
        b=uTN3w1EncTy4RJTWLbhHHbvrSCAMe8gmSHENSTAsCX+7MA0uypoLyCHIwMFVo80Edr
         i2s0gp5z+NhRuy1nplU0N7TyfDXD7SUXHXcVCBzxpmNd/c8s76zGegosMLl0cuSNuJHn
         HcQnYrmCfGU9enNvhrcqXVvomDDGV7iGShOOQ1TUnedjNixB9BLogUVIegnNZJnJVDs7
         429UOIRpjQEp/y4IEezocvdUcYW8aRchKiFTWMae037F9+oIzqYxJcCje5IbdxvDUH+Y
         i34q24cKEN3aja/G77TzuB5AILknjKw3m+H2im4erjITRS275mot8JfqxLtDUpguulX+
         UFIw==
X-Gm-Message-State: AOAM532kT+Js5JukmPEOyHmZ6YC/cNmgsls2mdHzDoD1WIrphKBITMgp
        0Ec+M2p7NaBM7m1k0UZlJjYmKDcFujmFWbo=
X-Google-Smtp-Source: ABdhPJxHOQiNZBcpNPjaImrKRbHQdwqhh1CqIfZPknK4NLlBreFHuwDuXfN5EO08Pe0QcBTUY3pSNg==
X-Received: by 2002:a17:902:748c:b029:e9:3d7e:7894 with SMTP id h12-20020a170902748cb02900e93d7e7894mr6609634pll.51.1617864350335;
        Wed, 07 Apr 2021 23:45:50 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:6e85:565f:2e19:9e93:4526:a814])
        by smtp.gmail.com with ESMTPSA id q9sm4604672pfn.19.2021.04.07.23.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 23:45:49 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     hemantk@codeaurora.org, linux-kernel@vger.kernel.org,
        bbhatt@codeaurora.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] bus: mhi: core: Fix shadow declarations
Date:   Thu,  8 Apr 2021 12:15:42 +0530
Message-Id: <20210408064542.22451-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit fixes below sparse warnings with W=2 about shadow
declarations:

drivers/bus/mhi/core/main.c: In function ‘parse_xfer_event’:
drivers/bus/mhi/core/main.c:667:17: warning: declaration of ‘flags’ shadows a previous local [-Wshadow]
  667 |   unsigned long flags;
      |                 ^~~~~
drivers/bus/mhi/core/main.c:565:16: note: shadowed declaration is here
  565 |  unsigned long flags = 0;
      |                ^~~~~
drivers/bus/mhi/core/main.c: In function ‘mhi_process_ctrl_ev_ring’:
drivers/bus/mhi/core/main.c:856:23: warning: declaration of ‘new_state’ shadows a previous local [-Wshadow]
  856 |     enum mhi_pm_state new_state;
      |                       ^~~~~~~~~
drivers/bus/mhi/core/main.c:837:19: note: shadowed declaration is here
  837 |    enum mhi_state new_state;
      |                   ^~~~~~~~~

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/main.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index b0c8afe16e3a..8e28e4a3ab4b 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -664,8 +664,6 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
 	case MHI_EV_CC_OOB:
 	case MHI_EV_CC_DB_MODE:
 	{
-		unsigned long flags;
-
 		mhi_chan->db_cfg.db_mode = 1;
 		read_lock_irqsave(&mhi_cntrl->pm_lock, flags);
 		if (tre_ring->wp != tre_ring->rp &&
@@ -853,8 +851,6 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
 				break;
 			case MHI_STATE_SYS_ERR:
 			{
-				enum mhi_pm_state new_state;
-
 				dev_dbg(dev, "System error detected\n");
 				write_lock_irq(&mhi_cntrl->pm_lock);
 				new_state = mhi_tryset_pm_state(mhi_cntrl,
-- 
2.25.1

