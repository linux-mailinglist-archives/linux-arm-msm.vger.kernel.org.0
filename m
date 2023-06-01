Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5243571A135
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 16:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234619AbjFAO6F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 10:58:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234606AbjFAO5v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 10:57:51 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D4E118C
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 07:57:50 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1b041cceb16so8008825ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 07:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685631470; x=1688223470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GvBjA4f+x+l+Skjyvt+2SPWzkMrr8PFd+q36DPYPr/I=;
        b=M5S9mlRaejKgvOSl8duhITEhAxL6kGU78BEMw3mZjje/myzFonnP8QPj96Z2E20rc+
         r0M/j5jKVXaIbu98Jt5+i1l0h9bbhyuUIT1tErteJDBqD7SQ4z4QdvF21aLWU4iI50mm
         cMh4YZoHJ8uEr/BtHL1C0T1sx15XxUdKRZcoJ0x9xoYRGmE0DqUvGN7VgrMiroLT4fk/
         zmjv4ne23HKOCz74ycXrlDPCuq77r0N0aC0vCHTye2QCsbJjFujYRb5Is1ClmwAl0sz7
         /6BWNHunm5TEBC9/YFxWKwwtquO9sSlIJylBLr3nBBeFQCWpQzOao5eNyxV2fr/UURzN
         6IrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685631470; x=1688223470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GvBjA4f+x+l+Skjyvt+2SPWzkMrr8PFd+q36DPYPr/I=;
        b=QysNY9hboky4HViA2R90kcfcl6qdrjYMUwVULDUI+W3zGAPGhQZN3qRy2JUrpgRcVo
         089jf8BC4WH+3Xe/0FG65li4yTMkdbz60z26cZlORBKlU689gGtBINJT8IxpiNkFReoD
         SR6/WdD2j7/JjlLoVqL0z0svxtkTZ2xkza2LKcZ2sRF09oPeCm6HrxMTrcz8m3AoRHGl
         XGXCPfoEahPZJYGm+oeXYVfd7lz6HzgFbEBFCYEELz/uXfngda/Q1OKee4YKLKjEKS3o
         8CAty+hjK2fu1tiSsF7HhzNXgvf7m4PWjExeR6iGF4A516QO6Ck6fn6W7uB1VkzirV9Y
         TpdA==
X-Gm-Message-State: AC+VfDyfdZpREuYOv67brJTgl4ONdLdtYIdPmzzBBj1gm27G7nXYP6RX
        AsI7I+UnEkJEQWD2Dmj/mw/R
X-Google-Smtp-Source: ACHHUZ56J950wSxd4DtqFHLFWXuVm5ogp5k0d04Q9CfE/ViqbGnjudBQIm2Fu3pyX40cLBPPgqrUHw==
X-Received: by 2002:a17:902:bb94:b0:1ad:cba5:5505 with SMTP id m20-20020a170902bb9400b001adcba55505mr8718101pls.14.1685631469914;
        Thu, 01 Jun 2023 07:57:49 -0700 (PDT)
Received: from localhost.localdomain ([117.217.186.123])
        by smtp.gmail.com with ESMTPSA id o17-20020a170902d4d100b001b0603829a0sm3577826plg.199.2023.06.01.07.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 07:57:49 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, kw@linux.com
Cc:     kishon@kernel.org, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v5 4/9] PCI: endpoint: Warn and return if EPC is started/stopped multiple times
Date:   Thu,  1 Jun 2023 20:27:13 +0530
Message-Id: <20230601145718.12204-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230601145718.12204-1-manivannan.sadhasivam@linaro.org>
References: <20230601145718.12204-1-manivannan.sadhasivam@linaro.org>
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

Reviewed-by: Kishon Vijay Abraham I <kishon@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/pci-ep-cfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/endpoint/pci-ep-cfs.c b/drivers/pci/endpoint/pci-ep-cfs.c
index 4b8ac0ac84d5..62c8e09c59f4 100644
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

