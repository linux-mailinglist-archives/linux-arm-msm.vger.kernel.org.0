Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A63C6737FF1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jun 2023 13:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231671AbjFUJ2S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jun 2023 05:28:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231642AbjFUJ2B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jun 2023 05:28:01 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91E0230C2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 02:26:34 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f90b8acefeso37579705e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 02:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687339592; x=1689931592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VG9qCKvekYoYgR4Fl0peORs6WrpDzePjez0ReZU/eVI=;
        b=xQESYjL4gW6Io7gbTKsEXRQ8/CpdNIXOBuDG3JUhaOFlzoppGV+5OdFgHiwAJC3epk
         ZHClsNRFnRbabFhaovMpFfMaBODei/Isc4Bpt68KnQoTK42nsknP3LICATYnMfHC+UQ5
         7wzMu7dSfMet++/e5wqPTh+orUNzicgV3xnJxXVbheQcZT1I3EDXf8m87cTKDRIOdBoD
         uCIgcxWtNLh1kWF/qcro/TeVoH+n27IIiI3V54NrEigBZqsM3FWhPwdOVm64chuI0jGm
         acdqDhZD3yiL5KWfr9krEO0ubp+bTruMLn+fm/Qn+QUTOXllvx3AS2dZ21uUTpoUWrWf
         VosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687339592; x=1689931592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VG9qCKvekYoYgR4Fl0peORs6WrpDzePjez0ReZU/eVI=;
        b=ZBdcQ9Tjhyey99U06YZvTk5jyUbWbf73biWVMA7Gb1kVIupYtOh8CI2tyzSfms6IKi
         /l1SxrajZcRssNKnFKYjRr3CuJmTwp6HJaWrq4F7ztzkOY/impn5cryB61fpOl8VGUEa
         CwGsPr/qMZkfZ9IMMgdFQbJw2r/KMkNbb1h6bzK0Gv7RWNTLPYwANdNb30yXC2PRoqPY
         UVA8LurZ/bVLL0QJDqNPb/lII0VJZ3QhqpFmfO3JcTMm1hQ+5YvDkaXkt+LzFjuFMSC4
         5rUr1xepf5i+bQfxgDVAsVZRymDwoOj89ScuhQXn7vqYO3f0x3QZzd4N4iDNOkZLqcXF
         O/Xw==
X-Gm-Message-State: AC+VfDzKRs41Epg7rNZnihkuAECZT9pciF9gsbEdgMxqhzVyuTUV/SIt
        EL0Hd+LCwUP6pgXVlSVkHmRRGQ==
X-Google-Smtp-Source: ACHHUZ76qDL0JPGb4BAfepy4QIinWf6vA5aG9heOM2nB+6kfh7t7vrhlEdyUFRtNteZskvZUuQkciw==
X-Received: by 2002:a7b:c045:0:b0:3f7:b1dd:9553 with SMTP id u5-20020a7bc045000000b003f7b1dd9553mr10904437wmc.14.1687339592026;
        Wed, 21 Jun 2023 02:26:32 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id n8-20020a05600c294800b003f90a604885sm4435068wmd.34.2023.06.21.02.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 02:26:31 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 21 Jun 2023 11:26:27 +0200
Subject: [PATCH 3/3] dt-bindings: display: msm: sm8550-mdss: document
 displayport controller subnode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v1-3-8bf386b373eb@linaro.org>
References: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v1-0-8bf386b373eb@linaro.org>
In-Reply-To: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v1-0-8bf386b373eb@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Robert Foss <rfoss@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=971;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=OJLy9BOcYtfmScZM3DtWEAFi/hUxNEeYncZLHm7ar6U=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkksJD6P8+2DIjZZuy4odgtDdmcuanRr0RVltXqACF
 3dixsyaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJLCQwAKCRB33NvayMhJ0aasEA
 CIw1on1qij6mV/QegVshdcgWDNEBHwXCtfLomZ9fxodct2WSOziNhiAn7o7fUP2U2CXS57K7h3JD/b
 5DdWW1OYk3hLVZgFOoKQ0/RqxzIKulddUnaCA49ScYAvCrghj8iOn8abGBrEYseXJmZoKCkVRKJ6Qd
 m02qXNfrPtHYm++FfR3NB0z3zuboKzncbnf7DbSUD2cUGIOOIdYHCZNKQopgZW3VpHOHvro8lC3zjX
 CijhwuMCyZoqDYkRXHulx+pSnTvykNCaNqQe6At+qQ0Jvx55tkdO0xr7lo+UEzBt2Y1tuKjfandjrJ
 O1dKxzkrOdVN7f6FG0zqLrp3hx8iQe/8y+WTcGevIdew5V5Zpe7g9nXAOV6q+hdwFDBM4ZImVvtpN0
 8xp0Jp5Bk60xAhsQluHYpqlkp53227XSGKuP+4SoQ9Hq/3/dTErV3dC60dtzFji71oLvBiiY5RNh5A
 q2Ag7aDw5HEaECHvgYGnf+4F5MDhMFw4XxPUk2hRcg1qf8eb50iAq1COfMspp5cjPJYUdsc7iCBMfd
 dWY6f7HclsSO08vRySXDhRqqlQk5E1JQxGIGz6fxk6tCxR4En4F42+929J9OAUJuIfa6b8/mIzJia8
 iWc6gfCvRVtjQa/hKZpnz20oVG8I/AZAc3vrHgFyJofaST2TPyaj2uSVQT+g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the optional document displayport controller subnode
of the SM8550 MDSS.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
index 887be33ba108..70ce7cb7a80d 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
@@ -42,6 +42,14 @@ patternProperties:
       compatible:
         const: qcom,sm8550-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        items:
+          - const: qcom,sm8550-dp
+          - const: qcom,sm8350-dp
+
   "^dsi@[0-9a-f]+$":
     type: object
     properties:

-- 
2.34.1

