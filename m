Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 859202A49A4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 16:29:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728598AbgKCP3i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 10:29:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728592AbgKCP3i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 10:29:38 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72B8EC061A04
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2020 07:29:36 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id a9so18973533wrg.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2020 07:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=74kwsd9s/7RX6OGE0ar+JI4L17MZk/RLlZX6k/SU9Ys=;
        b=AXfzYrLedCJ+NE7AlPtG+hmlhN/nF5QENjl0mUZ7YnvFu0xKosP6t0qLQ1XQXDnLNB
         JsDvUFBL/YxT3HQ1mr/v2Aq7mOR6EFnQ6UBkJNh18LTCo4enALf5xuUr6Eu7LQL8XoSY
         GsomjY4Uc9TbW6Q+wcJadiZDvrzquh/TbWMf4+8mu3RtyYZZ734C0tknnV9SDD8Pzo77
         b9iEiI89jIPRA+hMdRlS/7kx2Bs2DxXe6JfXZQdj/5eJR56JQMu7eCUKVrATR/oBubbE
         OV7D7jldWqGCIEw+xlNRy6AMRKb44cgZXmcVs20Vujg4Zwfoxjijfc89kaLcxU09oxPT
         BHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=74kwsd9s/7RX6OGE0ar+JI4L17MZk/RLlZX6k/SU9Ys=;
        b=XF9yZMEruxJ4tL/JY+s/NdHbzk3NygbbpBpEd20mhqCvnrDc6epFLboeGqBugCGYsi
         8hO2nB9hwPyVzYxZnFXY9n1/Z3323uLjNbpLbiqmDtO6CAKUTkc00Jn+sLCI0yBAkgXq
         xoojH/DqrJDBqCid96xhSoTtyKxYHDP0EG6VwXxaAJUxALwAS/hT0G6WllOVPFUot2Ql
         Xg2ygtfl+IN8hs619ZkZHGrdlJnTV7EHRKTcctVdG8oZIUov6DVBUFxDVhPNVjfXgmOI
         koZpgTgsNLnwiV4o56vs11Cw6R7kFR3Ius/bUfws6MPfY2sYQt+yN+9/wnlaXFD+G7bw
         cKgg==
X-Gm-Message-State: AOAM533M/cPVRLVDBTOBpmp2N2UUVY8izFCvPe/2z+aK4CUh/aiRtr2C
        PXxbPyixKFxCiT6KlCY+YwrVXw==
X-Google-Smtp-Source: ABdhPJyWd/yVeEtZYcJjICLwCYXFcFOee58ZBQbIsf5UdHE9S+K9RsdiLWos0KT8fPT+nG9qXPr1vQ==
X-Received: by 2002:adf:8366:: with SMTP id 93mr26923860wrd.6.1604417375245;
        Tue, 03 Nov 2020 07:29:35 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id j127sm3491779wma.31.2020.11.03.07.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 07:29:34 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 19/25] soc: qcom: smp2p: Remove unused struct attribute provide another
Date:   Tue,  3 Nov 2020 15:28:32 +0000
Message-Id: <20201103152838.1290217-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201103152838.1290217-1-lee.jones@linaro.org>
References: <20201103152838.1290217-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/soc/qcom/smp2p.c:74: warning: Function parameter or member 'flags' not described in 'smp2p_smem_item'
 drivers/soc/qcom/smp2p.c:149: warning: Function parameter or member 'out' not described in 'qcom_smp2p'

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/soc/qcom/smp2p.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index a9709aae54abb..43df63419c327 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -52,7 +52,6 @@
  * @remote_pid:		processor id of receiving end
  * @total_entries:	number of entries - always SMP2P_MAX_ENTRY
  * @valid_entries:	number of allocated entries
- * @flags:
  * @entries:		individual communication entries
  *     @name:		name of the entry
  *     @value:		content of the entry
@@ -65,7 +64,6 @@ struct smp2p_smem_item {
 	u16 remote_pid;
 	u16 total_entries;
 	u16 valid_entries;
-	u32 flags;
 
 	struct {
 		u8 name[SMP2P_MAX_ENTRY_NAME];
@@ -112,6 +110,7 @@ struct smp2p_entry {
  * struct qcom_smp2p - device driver context
  * @dev:	device driver handle
  * @in:		pointer to the inbound smem item
+ * @out:	pointer to the outbound smem item
  * @smem_items:	ids of the two smem items
  * @valid_entries: already scanned inbound entries
  * @local_pid:	processor id of the inbound edge
-- 
2.25.1

