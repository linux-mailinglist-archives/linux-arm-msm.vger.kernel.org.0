Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77EEE272B1C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 18:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728061AbgIUQKR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 12:10:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727803AbgIUQKR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 12:10:17 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C650C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 09:10:17 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id b124so9642166pfg.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 09:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SCbfk5KhIaeQlvR4Cwr7GsH4vv2lp3s8XkSFmUeV6ps=;
        b=rdwKiMbw15soRTNgDT16iUi/RaR4vGcj998+9ku+WxSzu/MlxUra5XX0ii3CcLXYuR
         oXCFK+OzujkmeJmFnS8TBqqZaiDmAuyRNNF7vbr2/UV4F+z697ANlhePjuktJ9Xt0ZIW
         BDTguJyeFEvUilrZ4vWLSZBsnA774lzjXW2qJKsawrJBSyBEeF8i9+MvHIH8+8Or1ngA
         xCbqZetbs/Fh4YqLUq0+OUZd1x603vy0FGzVZPxqKLxPnTGPsEnTRylJu53eBzSt0yTb
         pBgjAka1/yZaXYsqIApPwdo/y0fZexuRrl3cplfdgFzVgTcJd6MHfygzfFC6U8wURfDq
         tytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=SCbfk5KhIaeQlvR4Cwr7GsH4vv2lp3s8XkSFmUeV6ps=;
        b=tKwZZu2uG6Dwb+cz6+I50OexfjOYKdkRF5qalnQhxZGj3qOAApPo4MjjlJf66RhyQV
         X5ltgWC2pA42RTrxKYgkm1Y4FJgzV+JdkeMGGB+iCnuoJT0R4cHqn/0c2GOIS1oHZW24
         /8+a8qJ0/nQ3ql4Gu9Xb+nenEi1TGSLvtXqOsMpoFBFphYjKpm3G1/ymRHpLB05i/bpw
         mCs2nqr7VXdDOHINAbnTDatlCjx628FEKFkoqUkR7OVY7s0mpLC4ZtWrwbu7pWwCRslD
         6gOks0Yd6+wd/RY7hB8+Rxye4GSueLaw7C175FiN58XHyjMVpequmX9wWwPvQXrBxe0L
         PBIQ==
X-Gm-Message-State: AOAM531hwTxsYY2JSaNx/OB38y2lwrWd/Yu+WymOWVP0LIdq2ztl2DgO
        XrY3XDb82KQZF924O1PzGX8vkyH8C5kn
X-Google-Smtp-Source: ABdhPJzQxB9AAqs9pHSYgnLOqarkBdkFgsGhxoNxac2OdMjNlIPlqD4xSychnhw5DW+yGcF4q4aDJw==
X-Received: by 2002:a17:902:d3d4:b029:d1:e598:3ff3 with SMTP id w20-20020a170902d3d4b02900d1e5983ff3mr630205plb.45.1600704616562;
        Mon, 21 Sep 2020 09:10:16 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:6d03:bd12:1004:2ccf:6900:b97])
        by smtp.gmail.com with ESMTPSA id f4sm9204577pgr.68.2020.09.21.09.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 09:10:15 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 07/18] bus: mhi: core: Introduce helper function to check device state
Date:   Mon, 21 Sep 2020 21:38:04 +0530
Message-Id: <20200921160815.28071-9-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921160815.28071-1-manivannan.sadhasivam@linaro.org>
References: <20200921160815.28071-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

Introduce a helper function to determine whether the device is in a
powered ON state and resides in one of the active MHI states. This will
allow for some use cases where access can be pre-determined.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/internal.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 1bbd6e99d38d..5a81a428c4aa 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -598,6 +598,11 @@ int mhi_pm_m3_transition(struct mhi_controller *mhi_cntrl);
 int __mhi_device_get_sync(struct mhi_controller *mhi_cntrl);
 int mhi_send_cmd(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
 		 enum mhi_cmd_type cmd);
+static inline bool mhi_is_active(struct mhi_controller *mhi_cntrl)
+{
+	return (mhi_cntrl->dev_state >= MHI_STATE_M0 &&
+		mhi_cntrl->dev_state <= MHI_STATE_M3_FAST);
+}
 
 static inline void mhi_trigger_resume(struct mhi_controller *mhi_cntrl)
 {
-- 
2.17.1

