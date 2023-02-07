Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84B8568D99E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 14:46:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231793AbjBGNqy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 08:46:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231782AbjBGNqw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 08:46:52 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5738BBB1
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Feb 2023 05:46:50 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id d14so13589208wrr.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Feb 2023 05:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aG9xyJEWq8xfzQLUkXepXFg+WW0EUsU0Fq705yW4t3s=;
        b=iE7TjlqZz6va0JTZBey0ugvYw+Hk9P/7K2DX5kDSL+OIcRwMuWbfPZidDTq3DHc3Tz
         A0rW8LMOAaF5X1mkf334DG4Mqk3H4XOdOUwuEYdUCVwEZ1xfrZYi6XyOPWwcZ7QaHT+t
         Ft8Gi8YOags67/SOK0mn24qLRZhDDMq2laXisnZOm8xQBmaCxuugnyzI3uHOkRer95tM
         ZBgQHBEfvV8R6bTQ7gUTRhAV51iIIpOQppGDf+66xzCYlXQcKC0Sb1MTXFHN9Ry4RZ4a
         zRVmX1mqCk6kxc23+JCFQs7uYrh0PThVZWxaLesj78tROG8josCnevfnSstSWm4gZgXB
         +L+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aG9xyJEWq8xfzQLUkXepXFg+WW0EUsU0Fq705yW4t3s=;
        b=ITmpvUvStfy8C8OHMvWp2nTfQV3JC8Efr2ZfGE/OWFVkzSk4XoqZzp0mLUVOSP7P4o
         +AOFfUqD2lbsc7vD9K25hHHi2COwiUnfsRVDRzPBNKvltFpZsBvmkuDDw9QlbiqWBa4C
         jjGmM+tg7iZ8Zu++fcqeZ2Hq8OjpIk8IbsU5lYPdfmvL4ZMMon6HIgsMEMT4IxhVjNfH
         ty12YIMdP/LmxBClZs1tfPOjlVGnujjkgzh5MX6O8yA4n3opQ/jvvoarYaA9jSRGqSS8
         xbgE7gyj4w3n2CTnYmXT/oV8yRGyv9ngLo4ancF5tlSyauphmVFLelhZNVaFLvO08EwW
         528A==
X-Gm-Message-State: AO0yUKXcodc8KWlWL4kE/KNFdM6Ngfw8JX9VBddfjMUB2XuMr/Sxr0og
        yPpib6UqoheGh3lsOc53ugX6vQ==
X-Google-Smtp-Source: AK7set/foZL7LzUjzZNlYiTs9qS+b+uBwpRfHsoNPwLIc+5xmfCweBpO4Ts9Ae6+UXoQuVnEkAKxYQ==
X-Received: by 2002:a5d:4685:0:b0:2c3:e5d5:5d77 with SMTP id u5-20020a5d4685000000b002c3e5d55d77mr2563126wrq.68.1675777608918;
        Tue, 07 Feb 2023 05:46:48 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id s2-20020a5d69c2000000b002c3de83be0csm8610927wrw.87.2023.02.07.05.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 05:46:48 -0800 (PST)
From:   neil.armstrong@linaro.org
Date:   Tue, 07 Feb 2023 14:46:46 +0100
Subject: [PATCH v2] dt-bindings: firmware: document Qualcomm SM8550 SCM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-topic-sm8550-upstream-scm-bindings-v2-1-ca12bd33fa1c@linaro.org>
X-B4-Tracking: v=1; b=H4sIAEZW4mMC/x2NywqDMBAAf0X23IWQNhr6K6WHPFZdMKtktRTEf
 2/oceYwc4JSZVJ4didU+rDyKg3srYM0B5kIOTcGa+zdWDPgvm6cUIt3zuCx6V4pFNRUMLJklkm
 RzODjo8/96B20UAxKGGuQNLeUHMvS5FZp5O///Hpf1w/HkWbYiQAAAA==
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Abel Vesa <abel.vesa@linaro.org>

Document the compatible for Qualcomm SM8550 SCM.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Added missing allOf:if:then entries.
- Link to v1: https://lore.kernel.org/all/20221116124038.2769028-1-abel.vesa@linaro.org/
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 4193492ba73e..4eee95f65f8e 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -54,6 +54,7 @@ properties:
           - qcom,scm-sm8250
           - qcom,scm-sm8350
           - qcom,scm-sm8450
+          - qcom,scm-sm8550
           - qcom,scm-qcs404
       - const: qcom,scm
 
@@ -165,6 +166,7 @@ allOf:
             contains:
               enum:
                 - qcom,scm-sm8450
+                - qcom,scm-sm8550
     then:
       properties:
         interconnects: false
@@ -177,6 +179,7 @@ allOf:
             contains:
               enum:
                 - qcom,scm-sm8450
+                - qcom,scm-sm8550
     then:
       properties:
         interrupts: false

---
base-commit: 49a8133221c71b935f36a7c340c0271c2a9ee2db
change-id: 20230207-topic-sm8550-upstream-scm-bindings-e078b46d6f85

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

