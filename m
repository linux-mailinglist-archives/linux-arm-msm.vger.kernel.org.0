Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38ECE526F8E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 09:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbiENBRE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 21:17:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbiENBRC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 21:17:02 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B04284F23F4
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 17:48:27 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id s27so12096342ljd.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 17:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wBxMEIa7glrwrCrckfkFnYPIKZ191GVYDBXQw925KJM=;
        b=JONcElkgDZphNsx81je19YoaYkIWiMXMmwWkXlRXBRAoc2mTGHmpUt3PVXhzlE7zOk
         w1olp0FSMeHbZ2s2dF2YXwBndjBW4gZJCN3c/jAJu/pzOTbmIR0DCO1EDjSJFZOlAvzF
         2rBrEVG+JhyXcRlhoCB9KoBC4NtQeSlqRz+QWoRUrUtE/YPl18UTVtkhfmH/Kim5Pt8r
         D/mzYJ5oWj8NXSB5608/xtHNfZJxs/V+2BBAil73jGDzejFoko6GhJbBFAxFPE4o6VG8
         jCXzbIDMth9WiTWAyLVoR2dQ6zs62At73Hkqc629pl/9N7Yqgqwr8Le/0XPh8tecPF5H
         iaQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wBxMEIa7glrwrCrckfkFnYPIKZ191GVYDBXQw925KJM=;
        b=aRXX4P1fyjEgyrivzZD6kQ5X8KRtAw4MHbFQjSDmARWn4FD4j7zPCZ1nNesAujnniR
         Q4kZwU0Zf/xirdU/oJ8GRBNisnEDi+0f590vgZYkfW+jy3ywMOPSE3N92CSsCaa/turh
         wkz+1mCdwLwK5/w1yPnXEP3dmd8YXBgh+LGFut8Z69+1fqTVq+mfpxKErMWFNsdh0Edn
         DBFMfX/AFwfo/gVfPG+3+dt9eLaAFov2v9rKoJm2hx0/jiPNCYk4E2CKOEQ3IO7gbMI9
         Xio09i7oQyjTZRT6CylAY/WTRBSXvwgsujmiSB1JfSAs+iNPPIXiLGzAY+FLb1/TxgQf
         N/9Q==
X-Gm-Message-State: AOAM532vZiKURxi4aEjj0gZUYy4CzBVG9De9OElGrEGX5SVpnL+4i5t4
        qjGfyj2JnZrIrGAmitHslr0BrmemiW1d2w==
X-Google-Smtp-Source: ABdhPJwDY51jaWk5OxFlqX2bG7+SQ3FCT87DAJ8k854xm7TgH2QAb1WKHYeT0fxHN9Xtcqg+lLJ3Vg==
X-Received: by 2002:a05:6512:1513:b0:448:39c0:def0 with SMTP id bq19-20020a056512151300b0044839c0def0mr4888476lfb.469.1652486471683;
        Fri, 13 May 2022 17:01:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z2-20020a2e9b82000000b0024f3d1daeaesm626221lji.54.2022.05.13.17.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 17:01:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: remoteproc: qcom: pas: Add SDM660 CDSP PAS compatible
Date:   Sat, 14 May 2022 03:01:06 +0300
Message-Id: <20220514000108.3070363-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220514000108.3070363-1-dmitry.baryshkov@linaro.org>
References: <20220514000108.3070363-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm SDM660 has the usual audio, compute, sensor and modem
remoteprocs. Add compatible string and conditions for the compute and
modem PAS.  While we are at it, also add missing conditions for the
audio PAS.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/remoteproc/qcom,adsp.yaml          | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index a4409c398193..682df80d3a96 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -30,6 +30,7 @@ properties:
       - qcom,sc8180x-cdsp-pas
       - qcom,sc8180x-mpss-pas
       - qcom,sdm660-adsp-pas
+      - qcom,sdm660-cdsp-pas
       - qcom,sdm845-adsp-pas
       - qcom,sdm845-cdsp-pas
       - qcom,sdx55-mpss-pas
@@ -169,6 +170,8 @@ allOf:
               - qcom,sc8180x-adsp-pas
               - qcom,sc8180x-cdsp-pas
               - qcom,sc8180x-mpss-pas
+              - qcom,sdm660-adsp-pas
+              - qcom,sdm660-cdsp-pas
               - qcom,sdm845-adsp-pas
               - qcom,sdm845-cdsp-pas
               - qcom,sm6350-adsp-pas
@@ -284,6 +287,8 @@ allOf:
               - qcom,qcs404-wcss-pas
               - qcom,sc8180x-adsp-pas
               - qcom,sc8180x-cdsp-pas
+              - qcom,sdm660-adsp-pas
+              - qcom,sdm660-cdsp-pas
               - qcom,sdm845-adsp-pas
               - qcom,sdm845-cdsp-pas
               - qcom,sm6350-adsp-pas
@@ -366,6 +371,8 @@ allOf:
             enum:
               - qcom,msm8996-adsp-pil
               - qcom,msm8998-adsp-pas
+              - qcom,sdm660-adsp-pas
+              - qcom,sdm660-cdsp-pas
     then:
       properties:
         power-domains:
-- 
2.35.1

