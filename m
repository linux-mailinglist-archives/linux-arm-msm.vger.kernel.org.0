Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66D163B54DD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jun 2021 20:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231483AbhF0TBA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Jun 2021 15:01:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231452AbhF0TA7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Jun 2021 15:00:59 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B2DFC061574;
        Sun, 27 Jun 2021 11:58:33 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id i94so17925174wri.4;
        Sun, 27 Jun 2021 11:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FJu6YpjyhLh8pgdBVVHaQxh2NBPy6GRQwrOShiX7WjQ=;
        b=NnEW2QqztZlLNlK9tnysVtpea7DcwCAydLzi9ru80wKbwm0LbcnxvYGGvvkJfjZJSz
         h0v/DXWfoLdt6qpk4UzNJ42rvaFauu00ahn+KN2nvQpjH5z5glMfv7aFsjDlWMq351MP
         m3aw056SBn2qIO0OtIZUQ4C56Q/n83w9F3E3NQuoNe6cxMu14QSD4MIpCIWMNE5AddQs
         gDGKEmBgoLO7GEJLiAdrajAnvaAqywhYlHSu2ReiU/AFPsU9vZ96ifef45f0Xa9ofj+v
         qwp8qc67Mq2AJxvLxUxAq9Sy0EVg1C3VostORh55lP+7uxN8j/77O1vsdP9d0AKiaI8D
         J4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FJu6YpjyhLh8pgdBVVHaQxh2NBPy6GRQwrOShiX7WjQ=;
        b=aohLxxHpZK9xrSPDEC2a+4p9HNm5elP+xzfkyBy+vsvrE9JFO02PVomYXxyWGfccTB
         IAGpvKKmOShi8Vy0PmUkRrz7mduDEv/hlqKILDgTvSBj+gZj7t2p/3MKK1kenexpXjPS
         WRvMLzcRuN5fP89u4ErjLPPTnuUv1Gki1oCoqAIO+45+JJw4fm9W280KQhv+bTYWoUFR
         EBBG48a+Gll42Y41wy3/Ua9bih2Ia/vX53AO3NRst3rfbJm88GTXvJ10pteeJZsppMhA
         uvs46kG0p92UZZkwb/L6igLutMBjnhy6wm0vfsnfFVYLdrNQAn9Qisspq0sxA2Jfmc5N
         kkSw==
X-Gm-Message-State: AOAM532S9/Kipuldm1vCf3m9QTid5UOX64lZXOaQHf24jz4tcsi5R76U
        5kagBzAeRqvDB4qV8A3L7V8=
X-Google-Smtp-Source: ABdhPJxOuSfv0yNpRsV54jBfOhx1yHIDMcDkzM6lUbtgsyaDeX8zFZWPqqr4zgj6GYxoYDdmqg0tjQ==
X-Received: by 2002:a5d:5302:: with SMTP id e2mr23124558wrv.75.1624820312082;
        Sun, 27 Jun 2021 11:58:32 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id q19sm7112452wmq.38.2021.06.27.11.58.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jun 2021 11:58:31 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: mailbox: qcom: Add SM6115 APCS compatible
Date:   Sun, 27 Jun 2021 21:58:27 +0300
Message-Id: <20210627185829.694136-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible for the Qualcomm SM4250/6115 APCS block to the Qualcomm
APCS binding.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---

v1: https://lkml.org/lkml/2021/6/22/1189

Changes from v1:
- leave only 6115 compat string, there will be one dtsi for both platforms

 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 5dc1173d03fd..535cb0f8609f 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -27,6 +27,7 @@ properties:
       - qcom,sc8180x-apss-shared
       - qcom,sdm660-apcs-hmss-global
       - qcom,sdm845-apss-shared
+      - qcom,sm6115-apcs-hmss-global
       - qcom,sm8150-apss-shared
 
   reg:

base-commit: e71e3a48a7e89fa71fb70bf4602367528864d2ff
-- 
2.32.0

