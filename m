Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E36554588BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Nov 2021 06:06:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231656AbhKVFJe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 00:09:34 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:15329 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230514AbhKVFJ3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 00:09:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637557584; x=1669093584;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=6qTUFxSnquDR3KcxVhonywPpgHQBiiZWm5wmojtjnMI=;
  b=Bveme0gOxYYCzST/+cpCCb3RGZT5rFDhbF2Go2H7VGQK0nQkM55GMJb5
   +7MWQzRjnSFPcwrJgX6JNwY6hmMOiDwMlPe2BZ79UVN/4YsyT1IsHRmij
   +K0TPJr6egoLdGTuURzqU8MsFTWdMq+Fl8msU8vApx445cHbEtimOOnTT
   M=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 21 Nov 2021 21:06:23 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2021 21:06:22 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sun, 21 Nov 2021 21:06:22 -0800
Received: from hyiwei-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sun, 21 Nov 2021 21:06:18 -0800
From:   Huang Yiwei <quic_hyiwei@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <mani@kernel.org>, <jassisinghbrar@gmail.com>, <robh+dt@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_psodagud@quicinc.com>,
        <quic_tsoni@quicinc.com>, <quic_aiquny@quicinc.com>,
        <quic_eberman@quicinc.com>, Huang Yiwei <quic_hyiwei@quicinc.com>
Subject: [PATCH 4/4] dt-bindings: mailbox: Add more protocol and client ID
Date:   Mon, 22 Nov 2021 13:05:09 +0800
Message-ID: <20211122050509.5979-5-quic_hyiwei@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211122050509.5979-1-quic_hyiwei@quicinc.com>
References: <20211122050509.5979-1-quic_hyiwei@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add more protocol and client ID which can be used in device
tree properties.

Signed-off-by: Huang Yiwei <quic_hyiwei@quicinc.com>
---
 include/dt-bindings/mailbox/qcom-ipcc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/mailbox/qcom-ipcc.h b/include/dt-bindings/mailbox/qcom-ipcc.h
index eb91a6c05b71..9296d0bb5f34 100644
--- a/include/dt-bindings/mailbox/qcom-ipcc.h
+++ b/include/dt-bindings/mailbox/qcom-ipcc.h
@@ -8,6 +8,7 @@
 
 /* Signal IDs for MPROC protocol */
 #define IPCC_MPROC_SIGNAL_GLINK_QMP	0
+#define IPCC_MPROC_SIGNAL_TZ		1
 #define IPCC_MPROC_SIGNAL_SMP2P		2
 #define IPCC_MPROC_SIGNAL_PING		3
 
@@ -29,6 +30,7 @@
 #define IPCC_CLIENT_PCIE1		14
 #define IPCC_CLIENT_PCIE2		15
 #define IPCC_CLIENT_SPSS		16
+#define IPCC_CLIENT_TME			23
 #define IPCC_CLIENT_WPSS		24
 
 #endif
-- 
2.17.1

