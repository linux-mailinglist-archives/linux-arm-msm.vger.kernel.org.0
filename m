Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 531A344E118
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Nov 2021 05:25:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234729AbhKLE2m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 23:28:42 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:47198 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234697AbhKLE2X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 23:28:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1636691133; x=1668227133;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=BnIMmMG3GLnlGVFFFmf75XcYfyFqpdunJeIco6oUqBA=;
  b=Q6kxFwb+FEiHdRxe39OrYVfy8atiyx5QgWG/RSgrpxTMRCQK6157c1fo
   Hac2TZIruHtBv5DMmnPfN19CnVGHbnzUE0CsJFssTfFQlhSL3dNEKOSTH
   HUD70yWQQavoe5jdEQSeIKOY0Wh6eXOk9lixY8oYi2kYSKm96ZXCCooso
   0=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 11 Nov 2021 20:25:33 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2021 20:25:33 -0800
Received: from nalasex01c.na.qualcomm.com (10.47.97.35) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 11 Nov 2021 20:25:32 -0800
Received: from fenglinw-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 11 Nov 2021 20:25:29 -0800
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        <quic_fenglinw@quicinc.com>, <tglx@linutronix.de>,
        <maz@kernel.org>, "David Collins" <collinsd@quicinc.com>
Subject: [RESEND PATCH v2 08/11] bindings: spmi: spmi-pmic-arb: mark interrupt properties as optional
Date:   Fri, 12 Nov 2021 12:24:16 +0800
Message-ID: <1636691059-4305-9-git-send-email-quic_fenglinw@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1636691059-4305-1-git-send-email-quic_fenglinw@quicinc.com>
References: <1636691059-4305-1-git-send-email-quic_fenglinw@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: David Collins <collinsd@quicinc.com>

Mark all interrupt related properties as optional instead of
required.  Some boards do not required PMIC IRQ support and it
isn't needed to handle SPMI bus transactions, so specify it as
optional.

Signed-off-by: David Collins <collinsd@codeaurora.org>
Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
---
 Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt
index ca645e2..6332507 100644
--- a/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt
+++ b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt
@@ -29,6 +29,8 @@ Required properties:
 - #size-cells : must be set to 0
 - qcom,ee : indicates the active Execution Environment identifier (0-5)
 - qcom,channel : which of the PMIC Arb provided channels to use for accesses (0-5)
+
+Optional properties:
 - interrupts : interrupt list for the PMIC Arb controller, must contain a
                single interrupt entry for the peripheral interrupt
 - interrupt-names : corresponding interrupt names for the interrupts
-- 
2.7.4

