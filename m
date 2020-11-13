Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D293B2B1DD0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Nov 2020 15:53:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgKMOxs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Nov 2020 09:53:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726569AbgKMOxs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Nov 2020 09:53:48 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96630C0617A7
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2020 06:53:38 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id 19so8388577wmf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2020 06:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zgVSMkybE/yHdW58pRmZ6hvwBaN9PjxZMIrKPG719k4=;
        b=DObHrjgaQOPOVGjzg6UPCpO+kvm/htVfF0tPOoKxa/ErCVmyfQIMJoAyySkqq5435H
         q4bekPDn07Dvop0RdYH7qvTObR9CKbQaF/xVgGLbEjky51qy3MT0l1nsavhqcmDmswE3
         JHqeEmmBh4RgiNMkxzy4XscMHJhLt4ula0WokLBTIOTHeJBsTAiOZMO08NOJ48+vouAM
         u4LDDXEKQoWHDDJYXuowQ3ar+h5XMBjA60lk9sZUS1445EiNzQUyVq+Gi71RjQ5u/u3Q
         ymbiQzEnKrKvTQGGVtN3WOiy25SfwHcB4D7iWfmE27AX069o3Dw9fyNDvR/XA9znDN2T
         MFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zgVSMkybE/yHdW58pRmZ6hvwBaN9PjxZMIrKPG719k4=;
        b=GYaQJgDupPox14qReqxQM+UjotCwFnDS09ZXpxLn25PmFA9ObQeex61buOsH1KZUzQ
         fr1YNKRsCp9xTHiJJzKPkyqscbXarW1alESRFpsBWIv8efr2+3BkrDQs27tQeiG5WcGX
         pXqPNDyN++FEkatUpd0iWBXZiR/W/hew23g5yVk+caNyt67nCHNnmq84y9ZMyTg2Ffif
         OxYeyREHjLUy6i1LbpzkIGt5w8iGV4b2eKgahEbkiQDrWAwAv/6+KnJUnp9U2wsAeRjh
         UYdNmW0/ZXGzYQn39hIqNaXPS7jRANnra+qzzmI3nawmqkRVUUQ5DAmULuPYLNNeTHmw
         fAcg==
X-Gm-Message-State: AOAM5338pJNdiQMCSiTBczt6PfeeCMtbraIvhuLo9xQFAh9vpjJMXphH
        F5N1dM+8WRg+E4g872ujabNFAt860T9c5jwJ
X-Google-Smtp-Source: ABdhPJw0T0XErIlgTq/pVpp7z7RnmxUaCzm3vO0dISm9tx8K4q6PbZDgLXp1xqdN+VWSHDNAuBya0A==
X-Received: by 2002:a1c:7517:: with SMTP id o23mr3063559wmc.91.1605279217338;
        Fri, 13 Nov 2020 06:53:37 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:304f:e9d4:6385:8ac5])
        by smtp.gmail.com with ESMTPSA id i6sm10729341wma.42.2020.11.13.06.53.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2020 06:53:36 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 8/8] mhi: pci_generic: Increase controller timeout value
Date:   Fri, 13 Nov 2020 16:00:02 +0100
Message-Id: <1605279602-18749-9-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605279602-18749-1-git-send-email-loic.poulain@linaro.org>
References: <1605279602-18749-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On cold boot, device can take slightly more than 5 seconds to start.
Increase the timeout to prevent MHI power-up issues.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 6cc7bb9..7f0068c 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -162,7 +162,7 @@ static const struct mhi_event_config modem_qcom_v1_mhi_events[] = {
 
 static const struct mhi_controller_config modem_qcom_v1_mhiv_config = {
 	.max_channels = 128,
-	.timeout_ms = 5000,
+	.timeout_ms = 8000,
 	.num_channels = ARRAY_SIZE(modem_qcom_v1_mhi_channels),
 	.ch_cfg = modem_qcom_v1_mhi_channels,
 	.num_events = ARRAY_SIZE(modem_qcom_v1_mhi_events),
-- 
2.7.4

