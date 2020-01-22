Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF25C145711
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2020 14:46:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbgAVNq5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jan 2020 08:46:57 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33428 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbgAVNq4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jan 2020 08:46:56 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 6C21A294051
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        kernel@collabora.com, dafna3@gmail.com
Subject: [PATCH] dt-binding: fix compilation error of the example in qcom,gcc.yaml
Date:   Wed, 22 Jan 2020 14:46:39 +0100
Message-Id: <20200122134639.11735-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Running `make dt_binging_check`, gives the error:

DTC     Documentation/devicetree/bindings/clock/qcom,gcc.example.dt.yaml
Error: Documentation/devicetree/bindings/clock/qcom,gcc.example.dts:111.28-29 syntax error
FATAL ERROR: Unable to parse input tree

This is because the last example uses the macro RPM_SMD_XO_CLK_SRC which
is defined in qcom,rpmcc.h but the include of this header is missing.
Add the include to fix the error.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
index 19d00794fe7d..50ff07f80acb 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
@@ -220,6 +220,7 @@ examples:
 
   # Example of MSM8998 GCC:
   - |
+    #include <dt-bindings/clock/qcom,rpmcc.h>
     clock-controller@100000 {
       compatible = "qcom,gcc-msm8998";
       #clock-cells = <1>;
-- 
2.17.1

