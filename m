Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1894A5ECE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 16:02:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239643AbiBAPCM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 10:02:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239623AbiBAPCL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 10:02:11 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50735C06173B
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Feb 2022 07:02:11 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id y84so21615206iof.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Feb 2022 07:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MLEfOvs0XYTBMi37IYE0nxh2vKRdvGYr4hL4oQxHa8M=;
        b=ytR9ybKf78e9r81Jz1vLmp3ngHBYNuUbyHoXl0+O4rFQB6Vs/4C7C1Ecd9rXJcbbig
         YGojHqXI/UcsZAlFVi6QT0jyJprhWEoJ6mM0GBmachNrlLMrvkuvaaDBJMcnJOtb+MT1
         l/l+UU9EAaIk/tCTmy7F6tUZhTEaJ8+KclYhuj/Xs013OY7RIcrqq6nrmGk0hw4+Evc6
         u7F+0nn+IuRWx+0lSZkx9VQXlzcutd7lJ5T+adOPdCBOQF9tSkOa/D/O5zwX5+h4p3Dw
         noH1d0V7Iv04n5Hh97cQJFj4fs1S7GK59N6L8HHZzcFNI0Uo16GuaDszeSV3e4vl1pDY
         QUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MLEfOvs0XYTBMi37IYE0nxh2vKRdvGYr4hL4oQxHa8M=;
        b=WABEmSwhHMw/EWRKYlgkSo3cQZ3SckEiJgDBqxQtwuQbJY4rXNZxxpP/ryTbvE0c4E
         IHZo3vsCZTybloCLrqUUWtj3OynAX9OSruAfl0i1fwEH4FiQx2htYP7/i3ha/mvZw+T4
         +n6mGWG+KR6jtm0TupOlSEgSrOviWV/LfGJM1TIWJdvCmYdd+uKtjRuj8W1x0mUIOvbj
         V5+ne/+XSq+9e6e8bQLUF3vxTRlCoquHtpl6Es4jP40ZdqTdlhyXbUQCvH5Qbt4k7dE9
         boXO2YEgg4K7AvOPgIWdsa0I+maQL3/GgqPIo+PzfMYA6nU+qYHXyDpJjbR5mHLI3ICp
         bv6g==
X-Gm-Message-State: AOAM531NKd/ZOxqrRdGYcQar0bCEu/jAVh2MgPTdeD9tc1bbN/5E2Se5
        Ml3Zjn8DscCdVGVS5gnUMV1Jyw==
X-Google-Smtp-Source: ABdhPJx88GjpHLi9TGbQVzWh0R/FUwA9VTi13g/mfPQwP/mDrRHrsVDnZ9O+iWUbx3B492hm38AOZA==
X-Received: by 2002:a02:9645:: with SMTP id c63mr12719886jai.260.1643727730766;
        Tue, 01 Feb 2022 07:02:10 -0800 (PST)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id e17sm19141307ilm.67.2022.02.01.07.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 07:02:10 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     robh+dt@kernel.org, davem@davemloft.net, kuba@kernel.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org, mka@chromium.org,
        evgreen@chromium.org, cpratapa@codeaurora.org,
        avuyyuru@codeaurora.org, jponduru@codeaurora.org,
        subashab@codeaurora.org, elder@kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net v2 1/2] dt-bindings: net: qcom,ipa: add optional qcom,qmp property
Date:   Tue,  1 Feb 2022 09:02:04 -0600
Message-Id: <20220201150205.468403-2-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220201150205.468403-1-elder@linaro.org>
References: <20220201150205.468403-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For some systems, the IPA driver must make a request to ensure that
its registers are retained across power collapse of the IPA hardware.
On such systems, we'll use the existence of the "qcom,qmp" property
as a signal that this request is required.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 Documentation/devicetree/bindings/net/qcom,ipa.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
index b86edf67ce626..58ecc62adfaae 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
@@ -107,6 +107,10 @@ properties:
           - const: imem
           - const: config
 
+  qcom,qmp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the AOSS side-channel message RAM
+
   qcom,smem-states:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: State bits used in by the AP to signal the modem.
@@ -222,6 +226,8 @@ examples:
                                      "imem",
                                      "config";
 
+                qcom,qmp = <&aoss_qmp>;
+
                 qcom,smem-states = <&ipa_smp2p_out 0>,
                                    <&ipa_smp2p_out 1>;
                 qcom,smem-state-names = "ipa-clock-enabled-valid",
-- 
2.32.0

