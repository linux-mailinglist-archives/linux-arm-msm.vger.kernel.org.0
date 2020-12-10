Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A06AA2D57C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 10:58:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728885AbgLJJ5g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 04:57:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728735AbgLJJ4g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 04:56:36 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB3F5C0611CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 01:55:58 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id r3so4803477wrt.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 01:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=u23Upri+mVTKw2vMmpl89dQD9K1UaxJ4Tc+YMYk9PIg=;
        b=F+YZszV947hV0T7l6KCoPiZ9y5vDjngLDYyDHnbPdGOBtTiT8jvEbZtFwMrrqImeSI
         tRU5j5+fnGrhadOD9gBnQ0M/YTYT2yy8w7tQ30FMYzTyDVPT1WgjaOer9iUBsBXcH4NS
         uKJ64VjisTX2iASGwxWpQO1qqdtycGx64E98B9a5E/3ylCi2+TXyxc6qOWletY0fZqXi
         q0S21x1iNZdiRjipvx21zyK+ervKjZ8WJMP/ubEfaVV27y8t6XLpeoogo5H+H2QvgrJs
         KrI04tDCRlHt4YHfZjstKjBMd7hj3Ve8jnLodTTPZOs0UA3OKowcRE6qPhCQ+nlld/oE
         ishw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=u23Upri+mVTKw2vMmpl89dQD9K1UaxJ4Tc+YMYk9PIg=;
        b=OH+CRjM+bN5sb+eZ1YoUzX7YcGeuH/9/MUamQJOrxR30faV9w8TYR2BOqeWcQdc1vx
         dqML70Dis1UAtqsAf9Cdddin5M26w2ybMSOo3QJgw2cKVyAAaEdvesMyTB8w7v60N0bX
         US+N1aAiXuaxwMevxp9IuE4ASQWukDKHFk5On/2O8DLL47bVZFQJQrq+80J7K7DnQN9S
         Dnn+J39EXisE3/ycW096v4On1IXvA/XFhxYsNtSPL16aZQbMBRD0DqaI5lFb4pglUc4H
         iOSzcb28l1MJYF2EVmWZbPazwne54OWBAcw4fOIb5vkqGv6Npk1k7LMjwlYIBTxzZV/G
         K2gw==
X-Gm-Message-State: AOAM533NxJzuiu9/A0FnxCThGi+fggqakn2zxp6730dN4pH03PYdDTYe
        v7emwlQXV088w8PnMVyZgAUGNg==
X-Google-Smtp-Source: ABdhPJyWob+5ysw+DPwZLlQCQZyGBgKwDGSv4saPjtMed73fH9E/x/mTc+uJYQniptQ9xPOL3bZrow==
X-Received: by 2002:adf:eec6:: with SMTP id a6mr7103449wrp.239.1607594157683;
        Thu, 10 Dec 2020 01:55:57 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:4468:1cc2:be0c:233f])
        by smtp.gmail.com with ESMTPSA id l16sm9043721wrx.5.2020.12.10.01.55.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Dec 2020 01:55:57 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v4 03/10] mhi: pci-generic: Increase number of hardware events
Date:   Thu, 10 Dec 2020 11:02:48 +0100
Message-Id: <1607594575-31590-4-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607594575-31590-1-git-send-email-loic.poulain@linaro.org>
References: <1607594575-31590-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If the IPA (IP hardware accelerator) is starved of event ring elements,
the modem is crashing (SDX55). That can be prevented by setting a
larger number of events (i.e 2 x number of channel ring elements).

Tested with FN980m module.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index e3df838..13a7e4f 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -91,7 +91,7 @@ struct mhi_pci_dev_info {
 
 #define MHI_EVENT_CONFIG_HW_DATA(ev_ring, ch_num) \
 	{					\
-		.num_elements = 128,		\
+		.num_elements = 256,		\
 		.irq_moderation_ms = 5,		\
 		.irq = (ev_ring) + 1,		\
 		.priority = 1,			\
-- 
2.7.4

