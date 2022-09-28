Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 632BA5EE64B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 22:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234636AbiI1UAj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 16:00:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234731AbiI1UAP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 16:00:15 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FC00D76;
        Wed, 28 Sep 2022 12:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1664395173; x=1695931173;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FiwuO7720y1R53gujahjdqSkYpeyV9KxqW1U8kdCmo0=;
  b=NLjjYBKTKBe0iUpAmwgJK/4BfyIX7dcRZ2Uo4B638QhkfdujuZAdGSfj
   nWndqwklt0iWTb6H64v6q2kaidMAYjXW0KWjpVHAdQ2OC1du9uiirFtI0
   VFpF9xyeqKDG0CWKgb4kKP34cMOCbRwXxXVrEi+CVTBraGXFh3nBZ1Q9z
   o=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Sep 2022 12:57:29 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2022 12:57:29 -0700
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Wed, 28 Sep 2022 12:57:28 -0700
From:   Elliot Berman <quic_eberman@quicinc.com>
To:     Bjorn Andersson <quic_bjorande@quicinc.com>
CC:     Elliot Berman <quic_eberman@quicinc.com>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Srivatsa Vaddagiri" <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "Will Deacon" <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Arnd Bergmann" <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 08/14] virt: gunyah: msgq: Add hypercalls to send and receive messages
Date:   Wed, 28 Sep 2022 12:56:27 -0700
Message-ID: <20220928195633.2348848-9-quic_eberman@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220928195633.2348848-1-quic_eberman@quicinc.com>
References: <20220928195633.2348848-1-quic_eberman@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add hypercalls to send and receive messages on a Gunyah message queue.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
 arch/arm64/gunyah/hypercall.c | 33 +++++++++++++++++++++++++++++++++
 include/asm-generic/gunyah.h  |  5 +++++
 2 files changed, 38 insertions(+)

diff --git a/arch/arm64/gunyah/hypercall.c b/arch/arm64/gunyah/hypercall.c
index 5b08c9d80de0..042cca31879e 100644
--- a/arch/arm64/gunyah/hypercall.c
+++ b/arch/arm64/gunyah/hypercall.c
@@ -26,6 +26,8 @@
 							| ((fn) & GH_CALL_FUNCTION_NUM_MASK))
 
 #define GH_HYPERCALL_HYP_IDENTIFY		GH_HYPERCALL(0x0000)
+#define GH_HYPERCALL_MSGQ_SEND			GH_HYPERCALL(0x001B)
+#define GH_HYPERCALL_MSGQ_RECV			GH_HYPERCALL(0x001C)
 
 /**
  * gh_hypercall_get_uid() - Returns a UID when running under a Gunyah hypervisor.
@@ -67,5 +69,36 @@ void gh_hypercall_hyp_identify(struct gh_hypercall_hyp_identify_resp *hyp_identi
 }
 EXPORT_SYMBOL_GPL(gh_hypercall_hyp_identify);
 
+int gh_hypercall_msgq_send(u64 capid, size_t size, uintptr_t buff, int tx_flags, bool *ready)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_hvc(GH_HYPERCALL_MSGQ_SEND, capid, size, buff, tx_flags, 0, &res);
+
+	if (res.a0)
+		return res.a0;
+
+	*ready = res.a1;
+
+	return res.a0;
+}
+EXPORT_SYMBOL_GPL(gh_hypercall_msgq_send);
+
+int gh_hypercall_msgq_recv(u64 capid, uintptr_t buff, size_t size, size_t *recv_size, bool *ready)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_hvc(GH_HYPERCALL_MSGQ_RECV, capid, buff, size, 0, &res);
+
+	if (res.a0)
+		return res.a0;
+
+	*recv_size = res.a1;
+	*ready = res.a2;
+
+	return res.a0;
+}
+EXPORT_SYMBOL_GPL(gh_hypercall_msgq_recv);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Gunyah Hypervisor Hypercalls");
diff --git a/include/asm-generic/gunyah.h b/include/asm-generic/gunyah.h
index 86eb59e203ef..43915faea704 100644
--- a/include/asm-generic/gunyah.h
+++ b/include/asm-generic/gunyah.h
@@ -107,4 +107,9 @@ struct gh_hypercall_hyp_identify_resp {
 void gh_hypercall_get_uid(u32 *uid);
 void gh_hypercall_hyp_identify(struct gh_hypercall_hyp_identify_resp *hyp_identity);
 
+#define GH_HYPERCALL_MSGQ_TX_FLAGS_PUSH		BIT(0)
+
+int gh_hypercall_msgq_send(u64 capid, size_t size, uintptr_t buff, int tx_flags, bool *ready);
+int gh_hypercall_msgq_recv(u64 capid, uintptr_t buff, size_t size, size_t *recv_size, bool *ready);
+
 #endif
-- 
2.25.1

