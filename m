Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 681306CF656
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 00:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbjC2WZG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Mar 2023 18:25:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229869AbjC2WZF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Mar 2023 18:25:05 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C1942109
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 15:25:03 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id y20so22181654lfj.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 15:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680128702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/Gpn4+VfV0wCWDJ0YpMb1Da+cHbqOuOEqeu7hzsijo=;
        b=nDADtY1MNhUxuY6EGjRKHWNhT2q7zQLaqK91ZE3RoXB5dqE+denbqh6V+w/pvDckIm
         ziA9uOqyFRqDctqvJ0yJQw5G79+ToeSVEm39pRsnzbyrR/LnQIcpwg5GCPEf/2qZItoi
         nrue8Rko7VdFUgdueiy+rgNwvp/HhA0IKFOjSeqS67GN/yAZfaJwfTlEp9AyAmGsqyTV
         ZyC/6AVStmyAVIpo4L38QUyCsZH6Y00erOKa4UCbc5oNxFIduWa85OGcn+7hNK7eTydm
         B+Dqyl+FYHELJE6ttVsFKjqPU8PvhGDysthng0zkvjYiI0brRx1lWgacCTi5z6gBhg1e
         EI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680128702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/Gpn4+VfV0wCWDJ0YpMb1Da+cHbqOuOEqeu7hzsijo=;
        b=OUoPEQbxmsEFiBBghWi1gnPeZp8rrR4XgUyR4hF43hZpqGlhbNwH+tFZOjYFrp7jYk
         OI8QmnpWxjBYZiLMcu0IDGPUXwv/Ie6irjqcZb/Dz6Wc62flzmxaKcKi/UQKoHG5jNrZ
         kDV56SG7KdTzrzEhe5nMfmCKmxHGu9E2ZgjsFlCVkkrorSsx1CnKR0N+xYKAlMLdgRpN
         zNlaU/7BXIFXpLHiZCOyI1NARObH2tY/BqVM8UNR9NUs2aw+NIFt1ReTvPuILXxXyTpJ
         XOzIXiI0ggU5uZBYWRykjdewbiCQduD8pxKBnjomzlnrmd3AYpYLfZhKXEEYMZomd0xN
         Fc+A==
X-Gm-Message-State: AAQBX9fzHBtVSDEYk5hqVngRW1CXLNOSyMM2YCOfaQ1xrU2F8++AVVZu
        zispzCXInsiwogXXGmsXgemm+w==
X-Google-Smtp-Source: AKy350aKz0eSaRFpT7uZkTxnfGftY4OCRs6FePvYdaJqqR04XYMczWlf18G1+The6TPPmvj8l+u+vQ==
X-Received: by 2002:ac2:51cc:0:b0:4cc:a107:4227 with SMTP id u12-20020ac251cc000000b004cca1074227mr1131212lfm.22.1680128701854;
        Wed, 29 Mar 2023 15:25:01 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y26-20020ac255ba000000b004e9b307d2c8sm4724226lfg.238.2023.03.29.15.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 15:25:01 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH 1/3] dt-bindings: display/msm/gpu: allow specifying MX domain A5xx
Date:   Thu, 30 Mar 2023 01:24:58 +0300
Message-Id: <20230329222500.1131836-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329222500.1131836-1-dmitry.baryshkov@linaro.org>
References: <20230329222500.1131836-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some a5xx Adreno devices might need additional power domains to handle
voltage scaling. While we do not (yet) have support for CPR3 providing
voltage scaling, allow specifying MX domain to scale the memory cell
voltage.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index d4191cca71fb..4dc1f6b2cdbf 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -78,7 +78,14 @@ properties:
     type: object
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: gx
+      - const: mx
+    minItems: 1
 
   zap-shader:
     type: object
-- 
2.39.2

