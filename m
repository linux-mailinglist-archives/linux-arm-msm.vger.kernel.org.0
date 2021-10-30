Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0281244060E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Oct 2021 02:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231673AbhJ3ADk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 20:03:40 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:14203 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231744AbhJ3ADb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 20:03:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635552062; x=1667088062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=5oQ1014uwlZuBw+SQ6mC7Y7ozap7ONxUprrFXbZ+jMk=;
  b=ESqdu3msVN8frSpPJR2wIemGOJb8zUVsB+No65YbW5OUfis9oMtefRQl
   bNDDUIMzhoTLgd8VkLKfEaUO0YjDm9clrMXolPnkAgdYGjUrX2PNPMO0G
   FCsgAnCHtfhLub8IleFTnXjuPx0oVgiGa/i5ogb12gjpDbwiRpZ076ABU
   g=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 29 Oct 2021 17:01:01 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2021 17:01:01 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Fri, 29 Oct 2021 17:01:00 -0700
Received: from hu-vamslank-sd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Fri, 29 Oct 2021 17:01:00 -0700
From:   <quic_vamslank@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <tglx@linutronix.de>, <maz@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <manivannan.sadhasivam@linaro.org>,
        "Vamsi Krishna Lanka" <quic_vamslank@quicinc.com>
Subject: [PATCH v3 6/6] dt-bindings: clock: Introduce pdc bindings for SDX65
Date:   Fri, 29 Oct 2021 17:00:42 -0700
Message-ID: <1635552042-16250-7-git-send-email-quic_vamslank@quicinc.com>
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

From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>

Add compatible for SDX65 pdc.

Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
index 98d89e5..ce631d8 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
@@ -23,6 +23,7 @@ Properties:
 		    - "qcom,sdm845-pdc": For SDM845
 		    - "qcom,sdm8250-pdc": For SM8250
 		    - "qcom,sdm8350-pdc": For SM8350
+		    - "qcom,sdx65-pdc": For SDX65
 
 - reg:
 	Usage: required
-- 
2.7.4

