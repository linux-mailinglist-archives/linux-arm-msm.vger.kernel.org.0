Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD12755C37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jul 2023 08:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbjGQG4D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jul 2023 02:56:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbjGQGzq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jul 2023 02:55:46 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDEA219AC
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Jul 2023 23:55:29 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6831e80080dso2642284b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Jul 2023 23:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689576928; x=1692168928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cRwHHVBuwFdTSPfIU1R1ZLyGoM8LybFGSYGhuRMiUuk=;
        b=kSVx8Wk/UdV6T3ySTsoCWHjmRp7PQqIlR1Asg6XqAdVC2L3DfGAYYvNgU0CLQAGoik
         kb9RlF+7lRH2uctGidrXT9GDHJvclhslSq7CQuzokRMM2Xh4c0gIlwJfscGF7zU8ZGg+
         utgqJrbCJttTV1GGHqw3LfBtgRcFcCItEnXulZ+5+eGxY7Qb0spCSpbE2Kp7duQqLUBJ
         CQY9bAntoLYs6yPGX19LWWdyTs3VX+NUg4IdORjto6yFlh7tDvr3hGq3uGCJiS6QIwqH
         zUlDixthW871aJxwAkTAEWYHHA2wq4SrL7eNnLKde2kZhJQYY1Uilduz+LOMMXQAbIS0
         Y0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689576928; x=1692168928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cRwHHVBuwFdTSPfIU1R1ZLyGoM8LybFGSYGhuRMiUuk=;
        b=OSZeLYq8lWTTx469k3ZTPfJFbf9XzgSMiClE8S0EhNQ4MRPqzWDDIRSDey267X/uxq
         7wdJbTv8E5Xib4JBrIo3QR8QWylG4iDri23fa5g6MQwoMuWRBhxEeOyiNUpQ6MTEjNpo
         k7l2yrCqopXQiciKXntZqHLwOzZ6ncfPhhYpCVv4wjcZ7YuXfkX5diqWrNax+Dd5RHS/
         iqGjQiNZGomg0btzCM4dHh6xGvA4kouuAJyowRFCyaAzUcVu9Ts7m7p5yDG/g6ZcIQ1V
         wS02PL1B1kU+3rniJ4x2f7wa7dqsC9Fs08osd7T1I/6AfITtIPyx6s/07h9Ka1drfSp/
         UXnw==
X-Gm-Message-State: ABy/qLZKRSVSln9dt0iq6Fa0/4Zov9XABtvA/KgQYJesy9Ok4jt/k/b3
        cKY8AT0O3o8i6ITiCKnszT0P
X-Google-Smtp-Source: APBJJlG4K9K281TmKA2IFNIDJX1vCI+o79+13v51XsucEfkt42YZpay+GD8qVKNI+/1HgkkDP26ObQ==
X-Received: by 2002:a05:6a00:3983:b0:668:7e84:32e6 with SMTP id fi3-20020a056a00398300b006687e8432e6mr14433427pfb.29.1689576928654;
        Sun, 16 Jul 2023 23:55:28 -0700 (PDT)
Received: from localhost.localdomain ([117.193.215.209])
        by smtp.gmail.com with ESMTPSA id x7-20020a62fb07000000b006675c242548sm11196422pfm.182.2023.07.16.23.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jul 2023 23:55:28 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, kw@linux.com
Cc:     kishon@kernel.org, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 7/7] PCI: endpoint: Add kernel-doc for pci_epc_mem_init() API
Date:   Mon, 17 Jul 2023 12:24:59 +0530
Message-Id: <20230717065459.14138-8-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230717065459.14138-1-manivannan.sadhasivam@linaro.org>
References: <20230717065459.14138-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add missing kernel-doc for pci_epc_mem_init() API.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/pci-epc-mem.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pci/endpoint/pci-epc-mem.c b/drivers/pci/endpoint/pci-epc-mem.c
index 7dcf6f480b82..a9c028f58da1 100644
--- a/drivers/pci/endpoint/pci-epc-mem.c
+++ b/drivers/pci/endpoint/pci-epc-mem.c
@@ -115,6 +115,16 @@ int pci_epc_multi_mem_init(struct pci_epc *epc,
 }
 EXPORT_SYMBOL_GPL(pci_epc_multi_mem_init);
 
+/**
+ * pci_epc_mem_init() - Initialize the pci_epc_mem structure
+ * @epc: the EPC device that invoked pci_epc_mem_init
+ * @base: Physical address of the window region
+ * @size: Total Size of the window region
+ * @page_size: Page size of the window region
+ *
+ * Invoke to initialize a single pci_epc_mem structure used by the
+ * endpoint functions to allocate memory for mapping the PCI host memory
+ */
 int pci_epc_mem_init(struct pci_epc *epc, phys_addr_t base,
 		     size_t size, size_t page_size)
 {
-- 
2.25.1

