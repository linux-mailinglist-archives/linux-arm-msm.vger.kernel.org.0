Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46ADE7BEF2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Oct 2023 01:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379081AbjJIXeH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 19:34:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379030AbjJIXeF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 19:34:05 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F2F5A6;
        Mon,  9 Oct 2023 16:34:04 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-66cf380518dso117626d6.2;
        Mon, 09 Oct 2023 16:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696894443; x=1697499243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PIKmGdB/3utN+fo5YOdVXRGf1bdkoiZsUcVvijZ0k1o=;
        b=GIqyMgFL62BK5ZSfoAj3P9Vxauonwxa5z4cIkmix7vyH00xRN0zDQoSXeQ/UjhOM0M
         sGowqrYlWCTqbXsqCALgG3O2K/wO26OjzO588jumdmjXpgIS549Zxbn8BOe9SvvTDkvV
         fnXHW1tRL3NlrD5ymP4ObL+e7L0gjZoyQMMyTQpRwz7MaGOHwUc4o09h4ixLsM+kcA5S
         BE14nfWMqN6tV2efYjxMKaIEsMsMi2YVJVVdNax/+bFz/L/twDnaxnfz24ye57whjnNp
         yYD7mfl7XkxtbgbLcXlwDtNDKhcmwi65VE05O/9FXj56URHoUzTqq7CsbYLJMYu4Njh+
         iOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696894443; x=1697499243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PIKmGdB/3utN+fo5YOdVXRGf1bdkoiZsUcVvijZ0k1o=;
        b=YDHmUXNzASyXLVsla1PNziS87XBz2Z3gJGGWe9tcpGiQ9iIV9+7eFoWmMaOa2nBc4P
         j0T+Dk0g1HoMR9rJ7Q+/l0lrpTdadwQXQawUY6CibcitNmvaeEiv7QaKQciV6r3MkLRi
         1CvAaRl7XVgZ2oQquRSFvk/kYR0dgOYgZ/bOWbMJkeGxvrzTVvxERrpq53tfUCU9x71n
         eSEVz3ee+beEfCQV3rzJvEnuJAeFBgRmxWLTCHAsDd2P9kUlkkE92uJMgQ8ZzEeZbKle
         7GCm9Iuu4hZ3R1LWI8AJYFNzihr3PUC4Q/b+Y0TKfeiBKDgOSgKBb+R9eKnAaP39s5f5
         Yxgw==
X-Gm-Message-State: AOJu0YzwwuhmlfUR5pe+mL0+Zatc2GRwFnoMdBdxpjr8FX/WWK2q1KG2
        ECHI6JQWRYX8U1jZqMj1oeU=
X-Google-Smtp-Source: AGHT+IFX1KSpG727R4twyvT2uLP009BJLPc6asGHk6ULCbzHqgbGEdlfEzdid0hphdLUc+clgU05bw==
X-Received: by 2002:a0c:dd90:0:b0:63d:657:4cb9 with SMTP id v16-20020a0cdd90000000b0063d06574cb9mr17283505qvk.42.1696894443008;
        Mon, 09 Oct 2023 16:34:03 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::1d3d])
        by smtp.gmail.com with ESMTPSA id s3-20020a0cb303000000b006585c7f64a3sm4296617qve.14.2023.10.09.16.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 16:34:02 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
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
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Ryan McCann <quic_rmccann@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Liu Shixin <liushixin2@huawei.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 2/6] dt-bindings: display/msm: sdm845-dpu: Describe SDM670
Date:   Mon,  9 Oct 2023 19:33:40 -0400
Message-ID: <20231009233337.485054-10-mailingradian@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231009233337.485054-8-mailingradian@gmail.com>
References: <20231009233337.485054-8-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SDM670 display controller has the same requirements as the SDM845
display controller, despite having distinct properties as described in
the catalog. Add the compatible for SDM670 to the SDM845 controller.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml      | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
index b917064bdf33..dc11fd421a27 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
@@ -13,7 +13,9 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    const: qcom,sdm845-dpu
+    enum:
+      - qcom,sdm670-dpu
+      - qcom,sdm845-dpu
 
   reg:
     items:
-- 
2.42.0

