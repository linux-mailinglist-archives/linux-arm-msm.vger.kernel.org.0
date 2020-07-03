Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD773213708
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2020 11:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgGCJDR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jul 2020 05:03:17 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:33638 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgGCJDQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jul 2020 05:03:16 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 03 Jul 2020 02:03:15 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 03 Jul 2020 02:03:12 -0700
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg02-blr.qualcomm.com with ESMTP; 03 Jul 2020 14:32:55 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id 7B22E217AE; Fri,  3 Jul 2020 14:32:53 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     gokulsri@codeaurora.org, sboyd@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com,
        robh+dt@kernel.org, sricharan@codeaurora.org,
        nprakash@codeaurora.org
Subject: [PATCH V6 08/10] dt-bindings: firmware: qcom: Add compatible for IPQ8074 SoC
Date:   Fri,  3 Jul 2020 14:32:50 +0530
Message-Id: <1593766972-29101-9-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593766972-29101-1-git-send-email-gokulsri@codeaurora.org>
References: <1593766972-29101-1-git-send-email-gokulsri@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible for IPQ8074 support.
This does not need clocks for scm calls.

Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Signed-off-by: Sricharan R <sricharan@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.txt b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
index 354b448..7fdd4a1 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.txt
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
@@ -11,6 +11,7 @@ Required properties:
  * "qcom,scm-apq8084"
  * "qcom,scm-ipq4019"
  * "qcom,scm-ipq806x"
+ * "qcom,scm-ipq8074"
  * "qcom,scm-msm8660"
  * "qcom,scm-msm8916"
  * "qcom,scm-msm8960"
-- 
2.7.4

