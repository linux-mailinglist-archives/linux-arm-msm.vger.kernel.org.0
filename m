Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D09332EF9A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 17:06:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbhCEQFv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 11:05:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229465AbhCEQFe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 11:05:34 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5115FC061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 08:05:34 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id v15so2662195wrx.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 08:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=6eL/pHfKKce3suHTjHO/pn+tjwwEeqL466qlyxAdWew=;
        b=y4XGTUxDmJQuq5TrHNEwoaNvvFVfPG7MnnNan6mqYyzWAhQKDTc38udM44YNrLEWVU
         aatPKqf5vMRFuLgzUm6bqbX9lYaPtz10fcQpbW5c0YuSOy3qmXX1BHRFUpKT/BkHaTK+
         wLESrBH5dnsVfneIwtz9j86xgi7s5eQBfQkmGjJA4l8Ep7qSXbuvq/8qRGn8qfZrmJsi
         brfMbD5uCQrNsfSBoQOfVUuvFJoBe0cUT9rILkUQm+0nxOvpMC7EEF/XPjGfYGmYClt1
         XIc0ELuq9bkr5NcjkVquqqHMR/lPzy6fBAMxBRTUvwuhWrfMSdq4e3CEAdU2CstjHQ7I
         wqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6eL/pHfKKce3suHTjHO/pn+tjwwEeqL466qlyxAdWew=;
        b=EAd19EQ2yUyritsj/0w3LDBvUp4O8T6UeVsFESEyuLrLuiw3L3aEU8yC7Dv0UkFmVm
         eL3WRI58wmo2DIGoTMiPCM15CUFJ74UP2zmGe/MMg22LayE3iVpqO866cQIRPBduSS0b
         pCL/gGECifPSBpoG0oE/IBN62J8OyMTyeiLfqSe+ab1ifbOyzy38XTYrmsPoAHKgEkpK
         1df4BmYbanr/VMFUVwyJCDA+cbBc0N7fwBd8ZNkYd7Nzmhqqx0twPkDR2jSQaPchTG/k
         5h1gfmu7qcyZlwlnqhxGUBz+Ykh5x8Ys6N4i2leQDhdYPBQrlWIehhxe9MxWKUmKWUvU
         s6rQ==
X-Gm-Message-State: AOAM533ywoZCSrFICU7HsTXuvAXZDY8nyGjPgfF0H1Z2gbysT9lV7BLs
        mTfrKPHasohQsxLF6ub+U1pabg==
X-Google-Smtp-Source: ABdhPJx7lMnbiqk/MQPiGGkn4LNuC1IJWCG8dHDK8TCl1PIxYe3gBtyPwQulhF77Aav2K+CWgJAfeg==
X-Received: by 2002:a05:6000:c7:: with SMTP id q7mr10334518wrx.356.1614960332944;
        Fri, 05 Mar 2021 08:05:32 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:55da:a740:2edb:1c7e])
        by smtp.gmail.com with ESMTPSA id h62sm5207639wmf.37.2021.03.05.08.05.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Mar 2021 08:05:32 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] bus: mhi: Early MHI resume failure in non M3 state
Date:   Fri,  5 Mar 2021 17:14:01 +0100
Message-Id: <1614960841-20233-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MHI suspend/resume are symmetric and balanced procedures. If device is
not in M3 state on a resume, that means something happened behind our
back. In this case resume is aborded and error reported, to let the
controller handling the situation.

This is mainly requested for system wide suspend-resume operation in
PCI context which may lead to power-down/reset of the controller which
will then lose its MHI context. In such cases, PCI driver is supposed
to recover and reinitialize the device.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/core/pm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 0cd6445..725a0b2 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -916,6 +916,9 @@ int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
 	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state))
 		return -EIO;
 
+	if (mhi_get_mhi_state(mhi_cntrl) != MHI_STATE_M3)
+		return -EINVAL;
+
 	/* Notify clients about exiting LPM */
 	list_for_each_entry_safe(itr, tmp, &mhi_cntrl->lpm_chans, node) {
 		mutex_lock(&itr->mutex);
-- 
2.7.4

