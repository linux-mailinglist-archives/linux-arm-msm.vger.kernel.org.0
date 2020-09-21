Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30B40272B0B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 18:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728001AbgIUQI4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 12:08:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727305AbgIUQI4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 12:08:56 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2575AC0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 09:08:56 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id d9so9671645pfd.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 09:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bmv3vMkNMLZAUojDUc5hK8E8LQxr3ViBRDic1DDVfzI=;
        b=vkyI7N2BSW4Xxq9vxmjVpgswgAlTlKnABK65yu4BJ/gu8vJpocGZEAg/CXJ6FeZM6V
         DcfTqi54oPUHdozYn2C3Uw8zwy2AhUnLGHeY5q8h26bcT/jl6bEkjnGwoctSK09t6Q17
         0ZGo4G8ZOgLPL1RRdZ2HLr/aAbCempa04zIAWBAmvZ9Gf0fa54gb931dbeWiNCeSeK01
         1o9pFGJ7Gwx63SDBjnCa6xmCb3R0bz81IwRov6qgeW9F1+7ldC5aTH1TvUvd3+t1V4+T
         XMCJe/EbOY7keBrv58Mzspo6Y9GRa1ExpnTYjODdYbMiDYAhQX9DA84Yc3FqsZX7yXhf
         8tSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bmv3vMkNMLZAUojDUc5hK8E8LQxr3ViBRDic1DDVfzI=;
        b=a3IJCAVEvvfH98QTMnOU2xCkEVI3kaoPGF43nPrIdB0khPGMu2Dr0JxbcNSaz7bPBH
         QCzXsdWq+dJEeRCgq0atVKev7IekpMOFqlBT/wGr7kDKDpJ80ZkTrXAlNCB6osNHx3h7
         +c88/6Xqw5GR6BJLCBPFkkyfRgtLWzQJwp+E6O6cDMtMzEy8L79j/EfH59dYTaaWAVPW
         aKjUEap5Crq2z665FBqEey6Y+9z9KLPjiT5+6knCZ+L1QgS+Pe1nZn40nk7B0awUP4GW
         ULH/FFS/taaD3dlZjrMKhsVB2v2Q1rmbzkViFF+qEPyfyFdMJCl8t+v/5/DaonLnECOz
         Pgfg==
X-Gm-Message-State: AOAM532GiGKtYXTuFKVRKeEm4PO7zj8O4ariR65BR8Y0IY5/DjYB73G7
        DXZmP3Vebx8LtshkhexAvnqT
X-Google-Smtp-Source: ABdhPJzAEyZ6LnpjwsY7prLFC8HnmtRfEILqhk+IFYjpn1YRIB7bJv0jcX3n4n6XkjmUxFJZdC/hpg==
X-Received: by 2002:a17:902:ba83:b029:d1:e5e7:be6c with SMTP id k3-20020a170902ba83b02900d1e5e7be6cmr599927pls.70.1600704535586;
        Mon, 21 Sep 2020 09:08:55 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:6d03:bd12:1004:2ccf:6900:b97])
        by smtp.gmail.com with ESMTPSA id f4sm9204577pgr.68.2020.09.21.09.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 09:08:54 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 02/18] bus: mhi: core: Remove double occurrence for mhi_ctrl_ev_task() declaration
Date:   Mon, 21 Sep 2020 21:37:59 +0530
Message-Id: <20200921160815.28071-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921160815.28071-1-manivannan.sadhasivam@linaro.org>
References: <20200921160815.28071-1-manivannan.sadhasivam@linaro.org>
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

