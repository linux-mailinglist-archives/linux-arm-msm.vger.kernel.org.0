Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 947182CB98A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 10:45:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388378AbgLBJpE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 04:45:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388580AbgLBJog (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 04:44:36 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBE04C08E9AA
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 01:43:33 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id f17so754345pge.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 01:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=piBK26WWTtM+MfbHLM9kzA+YwSLGGZPEJLMRCXt48HI=;
        b=Aweua2qvLI3vaGm2ogi1Ow8Aw954ahXaedQDSNlLz8Fb/qcv4oqHM+xvCR7KWxXr3U
         XcYy9hxRjZs4iDKq9GRsoOxWGsRmvFvKSwhyP+PNWEkoLknXp56P16MiqmC5v6WckZ51
         TT+ueBy7NXTQRciXCLeXtgKd6vPS0Xi+jAGoMi9oAXK+0BVz3/qHqsn+gElkG7AMKx4N
         7ze7DY2fWTmeE6+ESkJj2W7Ab+FF2I/GV4MjnR2FKqbsf0ZL5ZNhsskf7LYF6MBtG3Yv
         COFwNwYvcGdUfn/xk59XsOTL1PucwjUABO8vAg/xI9nFkm/GB52Xuf+P+9xdN2L2otG5
         yEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=piBK26WWTtM+MfbHLM9kzA+YwSLGGZPEJLMRCXt48HI=;
        b=e/2guUXcyWv/r63QKc+U+MJrOoLftpq8okyWFqf7eAmLD1abtb0qvt4mYkg6Ae85t+
         3rohMZavYCNb/YJveAe5E1FYTNl0QC+AZocjLC87zP/2HEXkFVf+CwO7QVj5fvS8it57
         8Nok3LeJ7Ls2vX7xEWvJXy8EbOag9JLe8bJ2locswS388BPujZJuJm4EaUsUwIpvuHvi
         ytzBCc9l1gHn6NBsWptW69uB7A1xE2L1rYCSvhaWyJoUaeEk7GzoBwbAUv1G8p7c9sHg
         6D6YyjK0v72vI8408aclvn4DdTUeAbz6P+IWoqahW0VVL1E9+f85rNrxPp6AAgo+PNFY
         TlWA==
X-Gm-Message-State: AOAM531NtthJayt7ylf/10Lp+/BbDVGV3o//dQsPtOPey0OlOya7QMEp
        jcNv/pKJ0kx58A8FkBF1zYtO
X-Google-Smtp-Source: ABdhPJwNug3EG9T0Jw4vlAJDEk5T00dVv1Ji8xIVuSOrhEb1dQMAQejUYleKScmrEc5F53/v9aF9sg==
X-Received: by 2002:a63:5941:: with SMTP id j1mr1918512pgm.59.1606902213344;
        Wed, 02 Dec 2020 01:43:33 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id bg8sm1393990pjb.52.2020.12.02.01.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 01:43:32 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 17/29] bus: mhi: core: Prevent sending multiple RDDM entry callbacks
Date:   Wed,  2 Dec 2020 15:11:47 +0530
Message-Id: <20201202094159.107075-18-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
References: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

If an mhi_power_down() is initiated after the device has entered
RDDM and a status callback was provided for it, it is possible
that another BHI interrupt fires while waiting for the MHI
RESET to be cleared. If that happens, MHI host would have moved
a "disabled" execution environment and the check to allow sending
an RDDM status callback will pass when it is should not. Add a
check to see if MHI is in an active state before proceeding.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 91f8b8d05a62..4eb93d8bea1d 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -401,6 +401,10 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
 
 	 /* If device supports RDDM don't bother processing SYS error */
 	if (mhi_cntrl->rddm_image) {
+		/* host may be performing a device power down already */
+		if (!mhi_is_active(mhi_cntrl))
+			goto exit_intvec;
+
 		if (mhi_cntrl->ee == MHI_EE_RDDM && mhi_cntrl->ee != ee) {
 			mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_EE_RDDM);
 			wake_up_all(&mhi_cntrl->state_event);
-- 
2.25.1

