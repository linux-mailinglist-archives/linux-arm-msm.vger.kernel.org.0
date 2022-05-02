Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5848516AAC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 08:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383427AbiEBGKH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 02:10:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357964AbiEBGKF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 02:10:05 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 668594EDE1
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 May 2022 23:06:37 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id g8so9147516pfh.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 May 2022 23:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FL4JimMUhmY1BeTMTK+TnPmU576KVxmETjweuyLuCOo=;
        b=OFXE66pE/ktWSt/5voVeEhMhzzjJ3ORO0W5OjxJds9qw+k7j2EG9ORxSHmD5i8yEm5
         nC9O4KPZiYx+rv4InxZiPdWLN2X4hDs0DhNp1k2iT/ZeAFpAmYyTDJIBCYb9udtNrq+G
         xPCzCRXZ2b+LgvRYHNkcR98uDFeQdjZNhZ9q7kZSRWU2Z0MDzV3ZeYTHPoWoNpv7+fQs
         cky8tLry5aLxOdICsNscsAYGlpDeRdlIcFXEG11VuGjhzJ9+YMFlhmiwe7E7yb13rf+H
         4HE25MLXBrJ52iZQPuL9A9rrp+85ZdIa9POCM2WQQBOBUr8zfcQh0BR8L4/uAdM8Mxz6
         4TuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FL4JimMUhmY1BeTMTK+TnPmU576KVxmETjweuyLuCOo=;
        b=khEDSDS7OTS70WHNA3ROnwwlS+ZoinKBTkrb7Rs3pTafWVzJoui8FftekdPw8eJsv1
         U2uiv40ubG/45mfxVD4V9O8JmVenur0HEvBXB76y/dCpbrLFVHzIk8hp3A7rzksXc5PJ
         9RaJ5jQJgqlgeKoVetAwwCSG/VCnPiyn90KTQr/k3TPGhaZT3jkqNm1ig/1EPQZLraYB
         492NhZm8/WcxGDpiccRf4FoAli1XiIOetPSvLyFPWPc4xpDDuOsLimlj/ZFrUJbPUCRS
         8YDYNIWZiRJyTtj8VgSN9jWN3/oTr2V/oHAxS6u9H3CVI9ipsMly5AurghTWqKP3lMnn
         +Wkg==
X-Gm-Message-State: AOAM530U83XRHbrbC+G8FrEsmJGnvXwQcyKYcn8y2K/tZe7xbZOS4I7U
        aOAkOBh+Vcq6LkVG+NHM4KG0
X-Google-Smtp-Source: ABdhPJxb6iPxT001JHILmsfK5SvyQcjtft+sZmMyKCsyzDQDauyPZCbU2PiXuVxii4Sz+RFpxlBhLQ==
X-Received: by 2002:a62:e518:0:b0:4fa:9333:ddbd with SMTP id n24-20020a62e518000000b004fa9333ddbdmr10156182pff.11.1651471596890;
        Sun, 01 May 2022 23:06:36 -0700 (PDT)
Received: from localhost.localdomain ([27.111.75.99])
        by smtp.gmail.com with ESMTPSA id h3-20020a62b403000000b0050dc7628181sm3933826pfn.91.2022.05.01.23.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 23:06:36 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     kishon@ti.com, lorenzo.pieralisi@arm.com, kw@linux.com,
        bhelgaas@google.com, robh@kernel.org
Cc:     linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 4/8] PCI: endpoint: Add linkdown notifier support
Date:   Mon,  2 May 2022 11:36:07 +0530
Message-Id: <20220502060611.58987-5-manivannan.sadhasivam@linaro.org>
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

Add support to notify the EPF device about the linkdown event from the
EPC device.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/pci-epc-core.c | 17 +++++++++++++++++
 include/linux/pci-epc.h             |  1 +
 include/linux/pci-epf.h             |  1 +
 3 files changed, 19 insertions(+)

diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
index 3bc9273d0a08..8401c2750c9e 100644
--- a/drivers/pci/endpoint/pci-epc-core.c
+++ b/drivers/pci/endpoint/pci-epc-core.c
@@ -697,6 +697,23 @@ void pci_epc_linkup(struct pci_epc *epc)
 }
 EXPORT_SYMBOL_GPL(pci_epc_linkup);
 
+/**
+ * pci_epc_linkdown() - Notify the EPF device that EPC device has dropped the
+ *			connection with the Root Complex.
+ * @epc: the EPC device which has dropped the link with the host
+ *
+ * Invoke to Notify the EPF device that the EPC device has dropped the
+ * connection with the Root Complex.
+ */
+void pci_epc_linkdown(struct pci_epc *epc)
+{
+	if (!epc || IS_ERR(epc))
+		return;
+
+	atomic_notifier_call_chain(&epc->notifier, LINK_DOWN, NULL);
+}
+EXPORT_SYMBOL_GPL(pci_epc_linkdown);
+
 /**
  * pci_epc_init_notify() - Notify the EPF device that EPC device's core
  *			   initialization is completed.
diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
index c414a08bfd67..d346ab9ae061 100644
--- a/include/linux/pci-epc.h
+++ b/include/linux/pci-epc.h
@@ -215,6 +215,7 @@ void pci_epc_destroy(struct pci_epc *epc);
 int pci_epc_add_epf(struct pci_epc *epc, struct pci_epf *epf,
 		    enum pci_epc_interface_type type);
 void pci_epc_linkup(struct pci_epc *epc);
+void pci_epc_linkdown(struct pci_epc *epc);
 void pci_epc_init_notify(struct pci_epc *epc);
 void pci_epc_remove_epf(struct pci_epc *epc, struct pci_epf *epf,
 			enum pci_epc_interface_type type);
diff --git a/include/linux/pci-epf.h b/include/linux/pci-epf.h
index 0c94cc1513bc..b1fcd88d0b1f 100644
--- a/include/linux/pci-epf.h
+++ b/include/linux/pci-epf.h
@@ -20,6 +20,7 @@ enum pci_epc_interface_type;
 enum pci_notify_event {
 	CORE_INIT,
 	LINK_UP,
+	LINK_DOWN,
 };
 
 enum pci_barno {
-- 
2.25.1

