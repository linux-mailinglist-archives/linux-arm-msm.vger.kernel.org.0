Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B28C53D2ED9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 23:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231962AbhGVU3s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 16:29:48 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:63516 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231607AbhGVU3l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 16:29:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1626988216; x=1658524216;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4Pp7nwaPfotUJzOGwCLpSxkmTXZV4vvcm5tBDUdjZJA=;
  b=s/es2ibJbBxF6mG96un4QN0KzE6cHs6JAUVKW8DfSGa3rsVnNDe8bdMe
   XcDvC8XDLTgJlrp57ILzYECuZOv3OApYySu8FeAIfbzD5oAAbJZtjkiNv
   mqOMUE2WjUrFguDaqr25TIhDvsf8q8kNE8FCqIFrkPotCbjwHlgYZhBNy
   Q=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 22 Jul 2021 14:10:16 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/AES256-SHA; 22 Jul 2021 14:10:15 -0700
Received: from vamslank1-linux.qualcomm.com (10.80.80.8) by
 nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Thu, 22 Jul 2021 14:10:14 -0700
From:   <quic_vamslank@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <tglx@linutronix.de>, <maz@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Vamsi krishna Lanka" <quic_vamslank@quicinc.com>
Subject: [PATCH v2 4/6] dt-bindings: clock: Introduce RPMHCC bindings for SDX65
Date:   Thu, 22 Jul 2021 14:09:41 -0700
Message-ID: <6fcab884c2238640b53f6aba1e3c7068ba36868f.1626986805.git.quic_vamslank@quicinc.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1626986805.git.quic_vamslank@quicinc.com>
References: <cover.1626986805.git.quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanexm03e.na.qualcomm.com (10.85.0.48)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>

Add compatible for SDX65 RPMHCC.

Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 9ea0b3f5a4f2..0c901e748b2d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -22,6 +22,7 @@ properties:
       - qcom,sc8180x-rpmh-clk
       - qcom,sdm845-rpmh-clk
       - qcom,sdx55-rpmh-clk
+      - qcom,sdx65-rpmh-clk
       - qcom,sm8150-rpmh-clk
       - qcom,sm8250-rpmh-clk
       - qcom,sm8350-rpmh-clk
-- 
2.32.0

