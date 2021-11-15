Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A69F444FD6F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Nov 2021 04:19:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236490AbhKODWa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 14 Nov 2021 22:22:30 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:61495 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236500AbhKODWZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 14 Nov 2021 22:22:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1636946371; x=1668482371;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=GThrTAJ5BiF2EzWunrB2GrDeQT7ScWkCki7lALDOGGc=;
  b=m7T3kTkgxcIWqexj/7z1prjThWSGCbrsvPzEGDDYKxP/sAM32JaQHCYX
   YEpCGAuktKLAikLEX87pTJ4O6M/DwR5p56Mh/Pi5jwQ219VNg8AFyn7ky
   JD//n65MPJI5KRUMsuBeXsU29XLRClpl9gD0p7S/c+gKrcej5Im+v9n+D
   Q=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 14 Nov 2021 19:19:29 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2021 19:19:27 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sun, 14 Nov 2021 19:19:27 -0800
Received: from hyiwei-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sun, 14 Nov 2021 19:19:24 -0800
From:   Huang Yiwei <quic_hyiwei@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <mani@kernel.org>, <jassisinghbrar@gmail.com>, <robh+dt@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_psodagud@quicinc.com>,
        <quic_tsoni@quicinc.com>, <quic_aiquny@quicinc.com>,
        <quic_eberman@quicinc.com>, Huang Yiwei <quic_hyiwei@quicinc.com>
Subject: [PATCH] mailbox: qcom-ipcc: Update the QCOM_IPCC driver
Date:   Mon, 15 Nov 2021 11:18:30 +0800
Message-ID: <20211115031830.6795-1-quic_hyiwei@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update the QCOM_IPCC driver with below main features:
Dynamic alloc for channel arrangement instead of static alloced
array.
Multiple instance can be supported.
IPCC interrupt wake up support from suspend.
More protocol and client ID support added.

Signed-off-by: Huang Yiwei <quic_hyiwei@quicinc.com>
---
 drivers/mailbox/qcom-ipcc.c             | 101 ++++++++++++++++++------
 include/dt-bindings/mailbox/qcom-ipcc.h |   9 ++-
 2 files changed, 85 insertions(+), 25 deletions(-)

diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
index f1d4f4679b17..80bac21ccbc3 100644
--- a/drivers/mailbox/qcom-ipcc.c
+++ b/drivers/mailbox/qcom-ipcc.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2018-2021, The Linux Foundation. All rights reserved.
  */
 
 #include <linux/bitfield.h>
@@ -13,8 +13,6 @@
 
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 
-#define IPCC_MBOX_MAX_CHAN		48
-
 /* IPCC Register offsets */
 #define IPCC_REG_SEND_ID		0x0c
 #define IPCC_REG_RECV_ID		0x10
@@ -52,9 +50,10 @@ struct qcom_ipcc {
 	struct device *dev;
 	void __iomem *base;
 	struct irq_domain *irq_domain;
-	struct mbox_chan chan[IPCC_MBOX_MAX_CHAN];
-	struct qcom_ipcc_chan_info mchan[IPCC_MBOX_MAX_CHAN];
+	struct mbox_chan *chans;
+	struct qcom_ipcc_chan_info *mchan;
 	struct mbox_controller mbox;
+	int num_chans;
 	int irq;
 };
 
@@ -166,25 +165,37 @@ static struct mbox_chan *qcom_ipcc_mbox_xlate(struct mbox_controller *mbox,
 	struct qcom_ipcc *ipcc = to_qcom_ipcc(mbox);
 	struct qcom_ipcc_chan_info *mchan;
 	struct mbox_chan *chan;
-	unsigned int i;
+	struct device *dev;
+	int chan_id;
+
+	dev = ipcc->dev;
 
 	if (ph->args_count != 2)
 		return ERR_PTR(-EINVAL);
 
-	for (i = 0; i < IPCC_MBOX_MAX_CHAN; i++) {
-		chan = &ipcc->chan[i];
-		if (!chan->con_priv) {
-			mchan = &ipcc->mchan[i];
-			mchan->client_id = ph->args[0];
-			mchan->signal_id = ph->args[1];
-			chan->con_priv = mchan;
-			break;
-		}
+	for (chan_id = 0; chan_id < mbox->num_chans; chan_id++) {
+		chan = &ipcc->chans[chan_id];
+		mchan = chan->con_priv;
 
-		chan = NULL;
+		if (!mchan)
+			break;
+		else if (mchan->client_id == ph->args[0] &&
+				mchan->signal_id == ph->args[1])
+			return ERR_PTR(-EBUSY);
 	}
 
-	return chan ?: ERR_PTR(-EBUSY);
+	if (chan_id >= mbox->num_chans)
+		return ERR_PTR(-EBUSY);
+
+	mchan = devm_kzalloc(dev, sizeof(*mchan), GFP_KERNEL);
+	if (!mchan)
+		return ERR_PTR(-ENOMEM);
+
+	mchan->client_id = ph->args[0];
+	mchan->signal_id = ph->args[1];
+	chan->con_priv = mchan;
+
+	return chan;
 }
 
 static const struct mbox_chan_ops ipcc_mbox_chan_ops = {
@@ -192,15 +203,49 @@ static const struct mbox_chan_ops ipcc_mbox_chan_ops = {
 	.shutdown = qcom_ipcc_mbox_shutdown,
 };
 
-static int qcom_ipcc_setup_mbox(struct qcom_ipcc *ipcc)
+static int qcom_ipcc_setup_mbox(struct qcom_ipcc *ipcc,
+				struct device_node *controller_dn)
 {
+	struct of_phandle_args curr_ph;
+	struct device_node *client_dn;
 	struct mbox_controller *mbox;
 	struct device *dev = ipcc->dev;
+	int i, j, ret;
+
+	/*
+	 * Find out the number of clients interested in this mailbox
+	 * and create channels accordingly.
+	 */
+	ipcc->num_chans = 0;
+	for_each_node_with_property(client_dn, "mboxes") {
+		if (!of_device_is_available(client_dn))
+			continue;
+		i = of_count_phandle_with_args(client_dn,
+						"mboxes", "#mbox-cells");
+		for (j = 0; j < i; j++) {
+			ret = of_parse_phandle_with_args(client_dn, "mboxes",
+						"#mbox-cells", j, &curr_ph);
+			of_node_put(curr_ph.np);
+			if (!ret && curr_ph.np == controller_dn) {
+				ipcc->num_chans++;
+				break;
+			}
+		}
+	}
+
+	/* If no clients are found, skip registering as a mbox controller */
+	if (!ipcc->num_chans)
+		return 0;
+
+	ipcc->chans = devm_kcalloc(dev, ipcc->num_chans,
+					sizeof(struct mbox_chan), GFP_KERNEL);
+	if (!ipcc->chans)
+		return -ENOMEM;
 
 	mbox = &ipcc->mbox;
 	mbox->dev = dev;
-	mbox->num_chans = IPCC_MBOX_MAX_CHAN;
-	mbox->chans = ipcc->chan;
+	mbox->num_chans = ipcc->num_chans;
+	mbox->chans = ipcc->chans;
 	mbox->ops = &ipcc_mbox_chan_ops;
 	mbox->of_xlate = qcom_ipcc_mbox_xlate;
 	mbox->txdone_irq = false;
@@ -212,6 +257,8 @@ static int qcom_ipcc_setup_mbox(struct qcom_ipcc *ipcc)
 static int qcom_ipcc_probe(struct platform_device *pdev)
 {
 	struct qcom_ipcc *ipcc;
+	static int id;
+	char *name;
 	int ret;
 
 	ipcc = devm_kzalloc(&pdev->dev, sizeof(*ipcc), GFP_KERNEL);
@@ -228,27 +275,33 @@ static int qcom_ipcc_probe(struct platform_device *pdev)
 	if (ipcc->irq < 0)
 		return ipcc->irq;
 
+	name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "ipcc_%d", id++);
+	if (!name)
+		return -ENOMEM;
+
 	ipcc->irq_domain = irq_domain_add_tree(pdev->dev.of_node,
 					       &qcom_ipcc_irq_ops, ipcc);
 	if (!ipcc->irq_domain)
 		return -ENOMEM;
 
-	ret = qcom_ipcc_setup_mbox(ipcc);
+	ret = qcom_ipcc_setup_mbox(ipcc, pdev->dev.of_node);
 	if (ret)
 		goto err_mbox;
 
 	ret = devm_request_irq(&pdev->dev, ipcc->irq, qcom_ipcc_irq_fn,
-			       IRQF_TRIGGER_HIGH, "ipcc", ipcc);
+			IRQF_TRIGGER_HIGH | IRQF_NO_SUSPEND, name, ipcc);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to register the irq: %d\n", ret);
-		goto err_mbox;
+		goto err_req_irq;
 	}
 
-	enable_irq_wake(ipcc->irq);
 	platform_set_drvdata(pdev, ipcc);
 
 	return 0;
 
+err_req_irq:
+	if (ipcc->num_chans)
+		mbox_controller_unregister(&ipcc->mbox);
 err_mbox:
 	irq_domain_remove(ipcc->irq_domain);
 
diff --git a/include/dt-bindings/mailbox/qcom-ipcc.h b/include/dt-bindings/mailbox/qcom-ipcc.h
index eb91a6c05b71..fb405e211028 100644
--- a/include/dt-bindings/mailbox/qcom-ipcc.h
+++ b/include/dt-bindings/mailbox/qcom-ipcc.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
 /*
- * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2018-2021, The Linux Foundation. All rights reserved.
  */
 
 #ifndef __DT_BINDINGS_MAILBOX_IPCC_H
@@ -8,8 +8,13 @@
 
 /* Signal IDs for MPROC protocol */
 #define IPCC_MPROC_SIGNAL_GLINK_QMP	0
+#define IPCC_MPROC_SIGNAL_TZ		1
 #define IPCC_MPROC_SIGNAL_SMP2P		2
 #define IPCC_MPROC_SIGNAL_PING		3
+#define IPCC_MPROC_SIGNAL_MAX		4 /* Used by driver only */
+
+#define IPCC_COMPUTE_L0_SIGNAL_MAX	32 /* Used by driver only */
+#define IPCC_COMPUTE_L1_SIGNAL_MAX	32 /* Used by driver only */
 
 /* Client IDs */
 #define IPCC_CLIENT_AOP			0
@@ -29,6 +34,8 @@
 #define IPCC_CLIENT_PCIE1		14
 #define IPCC_CLIENT_PCIE2		15
 #define IPCC_CLIENT_SPSS		16
+#define IPCC_CLIENT_TME			23
 #define IPCC_CLIENT_WPSS		24
+#define IPCC_CLIENT_MAX			25 /* Used by driver only */
 
 #endif
-- 
2.17.1

