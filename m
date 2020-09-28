Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F7EE27A623
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 06:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgI1EKj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 00:10:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726497AbgI1EKi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 00:10:38 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2C76C0613CE
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2020 21:10:38 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id w7so8161876pfi.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2020 21:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bmv3vMkNMLZAUojDUc5hK8E8LQxr3ViBRDic1DDVfzI=;
        b=l9NBZSizfObRrViXEC9TUkn0DLL85baGs1fAd2GYZac/cUQKeJYNgmECMOFT7ij5Hm
         8nPQ8Ja9gt9O/DjSV5JoTEQxPB0CJy5tZxZzaqQO0nBn4vbdfRhrAyY4o+95tBoMRoZ7
         BiLQIK4npSydys54KduM+dlvInNX5XArLOrfh2e77/VGNTNlBC7IMypubWEqPjuf2Xdk
         DUztWXbnvllzMYnxMke8stQhAgXj70XpDPpWNSOaGtIryMa2aaeacW54Ma7YwPEv3CX1
         gwlPaBpgBOzovig5K7nCwZWjwa0fVKvkiIYDzhDLh7mPkrNxBvJ9Y4OnT1k+qhw/OfgU
         j3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bmv3vMkNMLZAUojDUc5hK8E8LQxr3ViBRDic1DDVfzI=;
        b=YpavPxtVMP7ywpn+6NmJboxzqlL4c2C/A51JmxLyfr59nCsr9rqaJlPnOUB3QbTkEB
         YaqbS3JVMQO32iSAnzgRUP+4PZ1GKUAB0ISRIPqvnFIRcGSBZYkvGO28IeiVuZKUrOK0
         rIHD8VPEgr2L8/4R1uQlNm18mG74HPW4u0Po1jO0LlpV60b1d49y/CT+TJxSAKTpCRPW
         FYpb4Ia5CoJAMUet0S9PCeU3HGPaQw0LRkXoAEWTG/pa00J/buNW2hBbqJD87cBBlKa+
         EF4+V9R4e3UMcUVGKWoDrtHaE7IFyZ+vsxMRchkTHleo2+nfg3Xd4LHp1r0G4Jlo0IGy
         wjIA==
X-Gm-Message-State: AOAM531cI8wDs1g7bZaghT/4BcMwxllaXtE9CJeL0vegqW7ku6q1PPoP
        TCQuqnsXIw23TYIf/q65t2+V
X-Google-Smtp-Source: ABdhPJywSfq6jeasAfbCMyJ/sERK9m0CyYR1TyAuBxPiuq4t1TaJISYfDXw8ChBwyzeu7PJz1eAfQA==
X-Received: by 2002:aa7:8c11:0:b029:151:b0bd:d607 with SMTP id c17-20020aa78c110000b0290151b0bdd607mr9254226pfd.76.1601266238184;
        Sun, 27 Sep 2020 21:10:38 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:6003:40df:7c40:5a87:eb86:87b0])
        by smtp.gmail.com with ESMTPSA id n21sm8306322pgl.7.2020.09.27.21.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 21:10:37 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 02/21] bus: mhi: core: Remove double occurrence for mhi_ctrl_ev_task() declaration
Date:   Mon, 28 Sep 2020 09:39:32 +0530
Message-Id: <20200928040951.18207-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200928040951.18207-1-manivannan.sadhasivam@linaro.org>
References: <20200928040951.18207-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

mhi_ctrl_ev_task() in the internal header file occurred twice.
Remove one of the occurrences for clean-up.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/internal.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index b1f640b75a94..bcfa7b6558ef 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -592,7 +592,6 @@ void mhi_pm_st_worker(struct work_struct *work);
 void mhi_pm_sys_err_handler(struct mhi_controller *mhi_cntrl);
 void mhi_fw_load_worker(struct work_struct *work);
 int mhi_ready_state_transition(struct mhi_controller *mhi_cntrl);
-void mhi_ctrl_ev_task(unsigned long data);
 int mhi_pm_m0_transition(struct mhi_controller *mhi_cntrl);
 void mhi_pm_m1_transition(struct mhi_controller *mhi_cntrl);
 int mhi_pm_m3_transition(struct mhi_controller *mhi_cntrl);
-- 
2.17.1

