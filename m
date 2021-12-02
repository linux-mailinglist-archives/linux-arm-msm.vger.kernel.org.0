Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C194046626F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 12:37:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357397AbhLBLkl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 06:40:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357404AbhLBLkj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 06:40:39 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 246EFC0613D7
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Dec 2021 03:37:14 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id iq11so20339308pjb.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Dec 2021 03:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=44MPCPkBWKMOTQLD9ThY64nAkhMI2QaAg6Wgp+sfo/8=;
        b=IznxiP5PA7KR8x7WUe0P/ZvJ5sCBzbLkVcwePoGjFS5WsaWqfxF9L0vKlJveOBds7k
         6XooxnjtD98qLmNatbTyjBUNR8ybrMSub8Z8CYQLlM8b73jMyhh4XFZgx6/9IjnzS+Nl
         aYvzninfZJ6iiT65YqRPEuWC11jEiT4We6fyIuJDLSTjf7DhEpw0eNS5qNBcmP8il8Wf
         FgOod9MUxPf6lXQFqX3RVsXyW9n9LJWW3WDkcOrKMlHt2By4AIoEb0w3fYbrGEhD9F88
         XE+ZJzuaNgfHvVG1IkHGd0fwxvY+q9v3FdsBllLGRf3EZ3sJmMnugJszJMX/+katu/dn
         heNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=44MPCPkBWKMOTQLD9ThY64nAkhMI2QaAg6Wgp+sfo/8=;
        b=Zb0MRWoPsolQxjo4tlLFxUiqissWsW3GVTvEi/BJLmBQ2PEqNLCwiXaFCNx5Mt9NBx
         zN10DBPZkIMxFpIfncEGjS2RpMWRxuzkbMbzoc/QDlDuWThfG1zlSo12pxYyR4uTC5sx
         5o2O9HbVKy3AsKKH6CCTtp3/GaCKcrpoqYKNnEfq/qYv+dvaSW9GklEdwaWlzRPc9G2W
         0d4LUcwVvPiN0mXxerk+lhZTG8rthVYso7N5EhT7v6HAwymNK4dmSyxePm6IC1RalWmW
         Xt/AJMMzOQNtu6in/YhcsrEodpdS6bExno3hYrJrDIQlv81TZrB+su9D5CT2f+6jT8zj
         F3sw==
X-Gm-Message-State: AOAM531ywHOK9WnaGNzaQ10eiLl4Rrcu+ELbKBjs/+E8iSipV3FBArhz
        IyigdSaOl1FC89k78OpPoBbD
X-Google-Smtp-Source: ABdhPJyEhQ+TkSI2P9Sio8xgTrStr+8mfjRSDmp7hoptpHUOilhSy2VxO3E8eRg9Qrh54/IYmrXqGw==
X-Received: by 2002:a17:90b:4c4c:: with SMTP id np12mr5348018pjb.68.1638445033651;
        Thu, 02 Dec 2021 03:37:13 -0800 (PST)
Received: from localhost.localdomain ([117.202.184.5])
        by smtp.gmail.com with ESMTPSA id h5sm3602552pfi.46.2021.12.02.03.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 03:37:13 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        quic_jhugo@quicinc.com, vinod.koul@linaro.org,
        bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org,
        skananth@codeaurora.org, vpernami@codeaurora.org,
        vbadigan@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 03/20] bus: mhi: Make mhi_state_str[] array static const and move to common.h
Date:   Thu,  2 Dec 2021 17:05:35 +0530
Message-Id: <20211202113553.238011-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211202113553.238011-1-manivannan.sadhasivam@linaro.org>
References: <20211202113553.238011-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

mhi_state_str[] array could be used by MHI endpoint stack also. So let's
make the array as "static const" and move it inside the "common.h" header
so that the endpoint stack could also make use of it. Otherwise, the
structure definition should be present in both host and endpoint stack and
that'll result in duplication.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/common.h    | 13 ++++++++++++-
 drivers/bus/mhi/host/init.c | 12 ------------
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
index 0f4f3b9f3027..2ea438205617 100644
--- a/drivers/bus/mhi/common.h
+++ b/drivers/bus/mhi/common.h
@@ -174,7 +174,18 @@ struct mhi_cmd_ctxt {
 	__u64 wp __packed __aligned(4);
 };
 
-extern const char * const mhi_state_str[MHI_STATE_MAX];
+static const char * const mhi_state_str[MHI_STATE_MAX] = {
+	[MHI_STATE_RESET] = "RESET",
+	[MHI_STATE_READY] = "READY",
+	[MHI_STATE_M0] = "M0",
+	[MHI_STATE_M1] = "M1",
+	[MHI_STATE_M2] = "M2",
+	[MHI_STATE_M3] = "M3",
+	[MHI_STATE_M3_FAST] = "M3 FAST",
+	[MHI_STATE_BHI] = "BHI",
+	[MHI_STATE_SYS_ERR] = "SYS ERROR",
+};
+
 #define TO_MHI_STATE_STR(state) ((state >= MHI_STATE_MAX || \
 				  !mhi_state_str[state]) ? \
 				"INVALID_STATE" : mhi_state_str[state])
diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 5aaca6d0f52b..fa904e7468d8 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -44,18 +44,6 @@ const char * const dev_state_tran_str[DEV_ST_TRANSITION_MAX] = {
 	[DEV_ST_TRANSITION_DISABLE] = "DISABLE",
 };
 
-const char * const mhi_state_str[MHI_STATE_MAX] = {
-	[MHI_STATE_RESET] = "RESET",
-	[MHI_STATE_READY] = "READY",
-	[MHI_STATE_M0] = "M0",
-	[MHI_STATE_M1] = "M1",
-	[MHI_STATE_M2] = "M2",
-	[MHI_STATE_M3] = "M3",
-	[MHI_STATE_M3_FAST] = "M3 FAST",
-	[MHI_STATE_BHI] = "BHI",
-	[MHI_STATE_SYS_ERR] = "SYS ERROR",
-};
-
 const char * const mhi_ch_state_type_str[MHI_CH_STATE_TYPE_MAX] = {
 	[MHI_CH_STATE_TYPE_RESET] = "RESET",
 	[MHI_CH_STATE_TYPE_STOP] = "STOP",
-- 
2.25.1

