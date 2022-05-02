Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66963516AA9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 08:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357978AbiEBGKG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 02:10:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383427AbiEBGKD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 02:10:03 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ADD84EDE1
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 May 2022 23:06:34 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id i1so5585265plg.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 May 2022 23:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2LFzmNO7TCPQPtgoHwZk5k2/uRSVZZGRTm5zpsoWJbc=;
        b=d9NwqnU/0ESwjiYm54qTQDSlOQVbQkLaT/oxMr01WT1sLQSn/nIsYnfDVUIJGmHQFc
         uDLyfb/6sbStsBgP++Bzpcd/uRNJ0Ek5MCO3JAd0BEvmVNkUN9XbglURygJo93dTIFJ4
         D32OsAIgBvYgtFqbMBKZ4ZeAMFmCSjpOvZ8VBxf4PFUOz942bR1c5frVwFcZS0o4uexz
         1IDhD8bmckcDWTiDnGJa6yNaThbzees8/IMhpavLgoMecGPPkYNJX6IfiIz9AGSGN8jG
         ZxpzCb5OmLRR6SMVXtQ5Es8sbIDKAk5vb8qZnjTFKHXlxu20vmw0FY5kdwjLlju9ykH8
         WKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2LFzmNO7TCPQPtgoHwZk5k2/uRSVZZGRTm5zpsoWJbc=;
        b=Lr6X95ekhVYDkuwyvGDTeMRGed4gJNWXXgvptS+6OksEtATfyu1TNjU8cu4oek7h/C
         rbvN3bW7StLaKR3fRzIY8JPe+helnc23xU9OUmBQoCk9CAYBASXheFoy8Tp7jlljDiQ3
         zTgL8Xq7Fa9TJZRFC1IiW6qN8HX4HlQfbB5eLgasuyhVL2ut1MfATiRMGLBVAfSaMWwx
         JtMqwzTjifsBN66sTLvd6GNXP7gTx56SZKSwAYwauFf8k5khQ6xmhojFq/777MybNuGt
         4gWqJwd6nP9tuvOEbSzszSRwE8p/wFrDqc+TFugWVA0Pe+4BNvNNkzGW+FoRCpoSxaG1
         JQNQ==
X-Gm-Message-State: AOAM531xOLUGRuyu6Yk+MtSmWf1D23iOnpa0LLUfqEEk7Yy30kfmLyZf
        mqwXA0r0bQBD0dOpRZqtlOuS
X-Google-Smtp-Source: ABdhPJx8v44BYBTieqJIya4Js5QwL5B5LYV+aXWIrs6lmDjOrWlDALn06JJenvBb1Bv7Ni9twVRZMw==
X-Received: by 2002:a17:902:d508:b0:15e:a12e:8089 with SMTP id b8-20020a170902d50800b0015ea12e8089mr4637149plg.137.1651471593731;
        Sun, 01 May 2022 23:06:33 -0700 (PDT)
Received: from localhost.localdomain ([27.111.75.99])
        by smtp.gmail.com with ESMTPSA id h3-20020a62b403000000b0050dc7628181sm3933826pfn.91.2022.05.01.23.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 23:06:33 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     kishon@ti.com, lorenzo.pieralisi@arm.com, kw@linux.com,
        bhelgaas@google.com, robh@kernel.org
Cc:     linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 3/8] PCI: endpoint: Add an API for unregistering the EPF notifier
Date:   Mon,  2 May 2022 11:36:06 +0530
Message-Id: <20220502060611.58987-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502060611.58987-1-manivannan.sadhasivam@linaro.org>
References: <20220502060611.58987-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add "pci_epc_unregister_notifier()" to unregister the notifier added
between EPC and EPF.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 include/linux/pci-epc.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
index a48778e1a4ee..c414a08bfd67 100644
--- a/include/linux/pci-epc.h
+++ b/include/linux/pci-epc.h
@@ -198,6 +198,12 @@ pci_epc_register_notifier(struct pci_epc *epc, struct notifier_block *nb)
 	return atomic_notifier_chain_register(&epc->notifier, nb);
 }
 
+static inline int
+pci_epc_unregister_notifier(struct pci_epc *epc, struct notifier_block *nb)
+{
+	return atomic_notifier_chain_unregister(&epc->notifier, nb);
+}
+
 struct pci_epc *
 __devm_pci_epc_create(struct device *dev, const struct pci_epc_ops *ops,
 		      struct module *owner);
-- 
2.25.1

