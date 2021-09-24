Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEBBF4171A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Sep 2021 14:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245724AbhIXMVG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Sep 2021 08:21:06 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:54009 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245425AbhIXMVC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Sep 2021 08:21:02 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 24 Sep 2021 05:19:28 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 24 Sep 2021 05:19:27 -0700
X-QCInternal: smtphost
Received: from ekangupt-linux.qualcomm.com ([10.204.67.11])
  by ironmsg02-blr.qualcomm.com with ESMTP; 24 Sep 2021 17:49:15 +0530
Received: by ekangupt-linux.qualcomm.com (Postfix, from userid 2319895)
        id 443FB3DE5; Fri, 24 Sep 2021 17:49:14 +0530 (IST)
From:   Jeya R <jeyr@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org
Cc:     Jeya R <jeyr@codeaurora.org>, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com
Subject: [PATCH 1/4] dt-bindings: devicetree documentation for secure domain
Date:   Fri, 24 Sep 2021 17:49:08 +0530
Message-Id: <1632485951-13473-2-git-send-email-jeyr@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632485951-13473-1-git-send-email-jeyr@codeaurora.org>
References: <1632485951-13473-1-git-send-email-jeyr@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add information about secure domain property.

Signed-off-by: Jeya R <jeyr@codeaurora.org>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt b/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
index 2a1827a..276c1d1 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
@@ -49,6 +49,12 @@ on the dsp.
 		    context bank. Defaults to 1 when this property
 		    is not specified.
 
+- secure-domains:
+	Usage: Optional
+	Value type: <empty>
+	Definition: Specify DSP domain is secure, must be
+		    "qcom,secure-domain"
+
 Example:
 
 adsp-pil {
-- 
2.7.4

