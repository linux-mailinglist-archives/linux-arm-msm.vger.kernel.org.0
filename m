Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34231440608
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Oct 2021 02:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231732AbhJ3ADe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 20:03:34 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:17983 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231715AbhJ3AD2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 20:03:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635552060; x=1667088060;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=3vJOmZux+Oenzv7qyifb6eDmeQ9VkOzznMpthjttgE0=;
  b=BndOKeOJtpyGIqB9DBIx9rKpZwXWIFOnqr2fTTLnISABYSbts9zCDm3X
   EKY5friGp1BQFb1Nzx3wze7Sp3KMSrX8Zabwiq1w9ZEsWATKURMSmao74
   ZlbLsyqROUjna6LXgGTlbQeT7Bd4LxoI20bYtp3VXKQJM33wHqt8oB7if
   w=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 29 Oct 2021 17:00:59 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2021 17:00:58 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Fri, 29 Oct 2021 17:00:58 -0700
Received: from hu-vamslank-sd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Fri, 29 Oct 2021 17:00:58 -0700
From:   <quic_vamslank@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <tglx@linutronix.de>, <maz@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <manivannan.sadhasivam@linaro.org>,
        "Vamsi krishna Lanka" <quic_vamslank@quicinc.com>
Subject: [PATCH v3 4/6] dt-bindings: clock: Introduce RPMHCC bindings for SDX65
Date:   Fri, 29 Oct 2021 17:00:40 -0700
Message-ID: <1635552042-16250-5-git-send-email-quic_vamslank@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635552042-16250-1-git-send-email-quic_vamslank@quicinc.com>
References: <1635552042-16250-1-git-send-email-quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>

Add compatible for SDX65 RPMHCC.

Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 7221297..0e7e05e 100644
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
2.7.4

