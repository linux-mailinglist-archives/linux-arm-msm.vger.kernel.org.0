Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B220B227CA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 12:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728479AbgGUKNI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 06:13:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726607AbgGUKNH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 06:13:07 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FFB7C0619D9
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 03:13:07 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id f2so20588464wrp.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 03:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=/OxVowHa1fzTS8gxpWxPISoWUyhArDmXgs2hoChHUPc=;
        b=A6xv2xdqRRmjsJnH38u8wGV4i2qAIL7q6a0rbpYXygq+txew9VnMaadu8N2TcsQi7Y
         6nMIE/yX12FfnEv05wILXT4YUa9VDeTLZvLYQN0GgsWfdioW4h19cZTGo0lXPoTIfPyT
         4IidUIr/O71+cOtxrGb1FY/MNmrTTbF7ThDxjUSez2EJdSL4x9K/v1diaNOPqT6cnyFc
         iAEYZ5kb+UgWnxQdicnDwZiA8hmEPblKNdsPZArgp09sVibWaFksD98xgoHBdhg6QF0f
         57YbGxjwNQDwhTGjfVVcDPLDKDZ5jjC5TdYbAGhZv57oCsRhDaXknnEjtsLgKopI+fmu
         HA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/OxVowHa1fzTS8gxpWxPISoWUyhArDmXgs2hoChHUPc=;
        b=dUKuqH1f98Ee8gbDMLGZk4KPuAzlVaJtMw49rDapZFR02MoBlY5wa7zi+JqqAuEBRB
         x2lH60497qRVeTnomJZbnqCEilTNlb/my5MvbMSd0zUERz4cK7VpOYkDFDvuHtI4Ns5t
         4fBTw4dhSBP4IHfrWUjqp9pg4s265x7PUKflQ9ST8QVqy82RxEid0UKNXkcIVX2tNSEK
         IfZL4G97yJGbJxFi4uPO8YmpA3oISCzDSb+XQZXIy+TFPPHT7So396eJ4PfVymq/c03y
         YDofx0DwMuvgOZDNeW3DOQA2ZfqxnjNqFXEM464/vDq+wzF/PDE3CIujxBkS5ZhNnXDY
         h1cw==
X-Gm-Message-State: AOAM531ywUJnwf9wLQFTwJulZPacV63H6lJguKwkndw+5GVNlsllSmXJ
        fS3eIiOtFwrRFVED+DCRZc/rFw==
X-Google-Smtp-Source: ABdhPJw+fh8anSweT6KXCWAMvVeosjJlXbgdhOWwmSRONVbvlwc51svaGRDnQBXR5UIfVdtGrqM76g==
X-Received: by 2002:adf:f44b:: with SMTP id f11mr14033056wrp.114.1595326385607;
        Tue, 21 Jul 2020 03:13:05 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id t3sm5546169wre.41.2020.07.21.03.13.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Jul 2020 03:13:05 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, robh+dt@kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] dt-bindings: clock: Fix qcom,msm8996-apcc yaml syntax
Date:   Tue, 21 Jul 2020 12:18:34 +0200
Message-Id: <1595326714-20485-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix errors reported by dt_binding_check.
- Fix literal block scalar for dts example
- Fix schema identifier URI

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml b/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
index d673ede..a20cb10 100644
--- a/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/clock/qcom,kryocc.yaml#
+$id: http://devicetree.org/schemas/clock/qcom,msm8996-apcc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm clock controller for MSM8996 CPUs
@@ -46,11 +46,9 @@ required:
 additionalProperties: false
 
 examples:
-  # Example for msm8996
   - |
     kryocc: clock-controller@6400000 {
         compatible = "qcom,msm8996-apcc";
         reg = <0x6400000 0x90000>;
         #clock-cells = <1>;
-  };
-...
+    };
-- 
2.7.4

