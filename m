Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8257456A04
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Nov 2021 07:12:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233534AbhKSGPF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Nov 2021 01:15:05 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:24075 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233225AbhKSGO7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Nov 2021 01:14:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637302318; x=1668838318;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hoO0q3ATVpGGZ1434HlNAZKnycCcIbY6l6L181yYYRU=;
  b=b0h2XtzmUFXLxdi6KvdXOmu01V1V21tigsIOy/MIM8YniTuyyp9wKwq+
   vWPcREgdH+GiXxnT8n+15B2Te+l4nfAsgFhgkHApEAf2EO+0h6VeO1Bs2
   4JBS03RTcTspNEOBS90cluQpCqs6EYeY9zrt6IIxOxWG0thAuLN0EMfVW
   M=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 18 Nov 2021 22:11:58 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2021 22:11:57 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 18 Nov 2021 22:11:57 -0800
Received: from hu-vamslank-sd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 18 Nov 2021 22:11:56 -0800
From:   <quic_vamslank@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <tglx@linutronix.de>, <maz@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <manivannan.sadhasivam@linaro.org>,
        Vamsi krishna Lanka <quic_vamslank@quicinc.com>,
        Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v5 4/6] dt-bindings: clock: Introduce RPMHCC bindings for SDX65
Date:   Thu, 18 Nov 2021 22:11:36 -0800
Message-ID: <f637d562238aaa446ce373f6409e6977d628712e.1637302009.git.quic_vamslank@quicinc.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637302009.git.quic_vamslank@quicinc.com>
References: <cover.1637302009.git.quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>

Add compatible for SDX65 RPMHCC.

Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 72212970e6f5..0e7e05e38bb2 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -22,6 +22,7 @@ properties:
       - qcom,sc8180x-rpmh-clk
       - qcom,sdm845-rpmh-clk
       - qcom,sdx55-rpmh-clk
+      - qcom,sdx65-rpmh-clk
       - qcom,sm6350-rpmh-clk
       - qcom,sm8150-rpmh-clk
       - qcom,sm8250-rpmh-clk
-- 
2.33.1

