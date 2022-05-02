Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE71516AA7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 08:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383428AbiEBGKE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 02:10:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357964AbiEBGJ5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 02:09:57 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 842F34EA3E
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 May 2022 23:06:29 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id r9so11852554pjo.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 May 2022 23:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=93jtjgesAZgKkt2MEbIMRdAbnBRLq9BXrD5v1vHX1gQ=;
        b=JbBvB6dQd/mSuV8LOxRZPK1pa9SnW1PgfZO16mPnV8by3pq26M1sQuuI1YvqzJhQqI
         8p+Hc/cDWK8n9GLfBHaAetj7mRawHbLvmfbtJ1yG173rUxmJm4yorK2fsA7jINDAbtaA
         M3CzWsjHNW2a6cI5kI2iIN2EvB5zeaCGxQkP9+ochaWD4VNxoFMg8LAwA01pw0cZKXcH
         KYgf/R7XJgWiPCZxKwQjl2/qxYc0rplEIc7Zhlb5sMgQQ2w6Vc8/CqQDL+TQr01Gdk08
         qOoCVHmr7ISE3JQdlLBzLRAx+C619KNncKKpKhnhs/CbsFt79X/LY6Wb6omhAyO7Fogs
         wetw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=93jtjgesAZgKkt2MEbIMRdAbnBRLq9BXrD5v1vHX1gQ=;
        b=XXXgTCHDPWQrxYlOomWLGjDB8fPNzfWwPFv26XS2YSMg8hZdrro4QWZZ2zjqYEDUA1
         eIVuaHPkG3K9p76U7LU89VYcaWQvdyrI2zd5zFqacdt0Tn31d6oJNoPcPOqsXuDhA50D
         fouro6wG1+nVe5hKsbdliwPPt7a8rYAivehlREmYdAChsFTAO3j6W+VymPIeTHTiR463
         IuBtqcC6TSFuROPAwMFumE38L/4LKj51p5LSDar+TOIKiWeodckOkD6XQTqLjpcSRsSX
         3vHO1sePvYPa2NWE+XFcYQ6ZMoc02iOJ+TrFXLt4jV3N5esgN7/NNxiaBCTTZMGHImnI
         xpdg==
X-Gm-Message-State: AOAM531VjnGCd6ZvRFM3A88a5bu5gVujjtr0rFDAWqGjDxdm8+I12TTl
        7LXY7Yqmdj1WFsuwHX83mZ7m
X-Google-Smtp-Source: ABdhPJzmLobDpJ2EzONy0DMl6qqRS3HJXR8j8ZCsc4CrtTvqTxUcHcdEKoWzu++DW5cmRxtzLONgyA==
X-Received: by 2002:a17:903:41cb:b0:15e:ab0c:5172 with SMTP id u11-20020a17090341cb00b0015eab0c5172mr1604917ple.170.1651471589075;
        Sun, 01 May 2022 23:06:29 -0700 (PDT)
Received: from localhost.localdomain ([27.111.75.99])
        by smtp.gmail.com with ESMTPSA id h3-20020a62b403000000b0050dc7628181sm3933826pfn.91.2022.05.01.23.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 23:06:28 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     kishon@ti.com, lorenzo.pieralisi@arm.com, kw@linux.com,
        bhelgaas@google.com, robh@kernel.org
Cc:     linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/8] PCI: endpoint: Warn and return if EPC is started/stopped multiple times
Date:   Mon,  2 May 2022 11:36:05 +0530
Message-Id: <20220502060611.58987-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502060611.58987-1-manivannan.sadhasivam@linaro.org>
References: <20220502060611.58987-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When the EPC is started or stopped multiple times from configfs, just emit
a once time warning and return. There is no need to call the EPC start/stop
functions in those cases.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/pci-ep-cfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/endpoint/pci-ep-cfs.c b/drivers/pci/endpoint/pci-ep-cfs.c
index d4850bdd837f..2cfd5fd2794c 100644
--- a/drivers/pci/endpoint/pci-ep-cfs.c
+++ b/drivers/pci/endpoint/pci-ep-cfs.c
@@ -178,6 +178,9 @@ static ssize_t pci_epc_start_store(struct config_item *item, const char *page,
 	if (kstrtobool(page, &start) < 0)
 		return -EINVAL;
 
+	if (WARN_ON_ONCE(start == epc_group->start))
+		return 0;
+
 	if (!start) {
 		pci_epc_stop(epc);
 		epc_group->start = 0;
-- 
2.25.1

