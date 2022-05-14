Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 092E5526EEC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 09:15:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbiENCqu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 22:46:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbiENCqr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 22:46:47 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12DFF4F008D
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 17:47:56 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id n10so19100916ejk.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 17:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p1+Xm7EUInIY3jvthb6tC3vLUTde35YYnc+B4cs34zo=;
        b=orPadqrPCDmcbZuPrF06wsMUbSjw0K+eL03xR0/hC+F5ybl24xD7r7i/VpUfJehJjk
         X7fSZnDiXocFltfDjaIUXQ+2sZJSMEBKp7kxrsGGq4S5G/NJxkIfzIQXJ+A7TWZyrU33
         iTKOFmYgHaZevZbhf3ot98zN7uXpkuR6sOTHnPqzxXlgjnHRtoY8RMP9ey+fYqZvlp79
         4NMatCxHNITiRkmcwILZ7Rx80bpuJdAsaH5juR9kCTcF7CFb4Br5dhPPVbUjWQq3RXW9
         2/yGlPOeaPIWEGbSJABM4Trh8lsVMpLOuCd45SlXaur4jayaeS8Qf9i0I+e7snI2bISe
         Tstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p1+Xm7EUInIY3jvthb6tC3vLUTde35YYnc+B4cs34zo=;
        b=tJDMIpFk316/cKwjRAEN2AVHEq2+llRmSJHXgk1RQqFu4duprFGKWZmh01mHiztvuh
         TAmUHe2fBa3CFaPfp8lqobVpxpoOPKLzCQgUfZseey9LxPmdTFQG5wtC7PZkK7/jiXFt
         0f6CxE2OkIW0Nwao6s8gKo/y6g65g0+Y3At6W0RxfEAL9l2JwqfWsfW469NoKEprh3yk
         Y7xUaAKVkMpMncjkn0yPafU0zJwdNZwVfOTIhPAKeMhBRKzBAq1YW2d9UXi2DsqmFpfI
         FiWj+dHcN6BK94K0PELkl7pBEqnjOyDsjVTZLLlIyOae69H81nhLIDIrs9NT4SRZsbAO
         XlQg==
X-Gm-Message-State: AOAM532U48cz/uHtYLFLR3XnHI4V4apGBScoqLC8s2vmB7SN94k/B6pq
        OJ96m0jibrVtXko+dNUZJtAcIGVXczoUjw==
X-Google-Smtp-Source: ABdhPJx0UmqhGj8S6MnXyxoYZW8I6PIYPveeEoxF6Y5cYXtbK5eThZLO5BKTg4wcW6L0KPMOIrlYQQ==
X-Received: by 2002:a05:651c:10b:b0:24f:24a3:9dec with SMTP id a11-20020a05651c010b00b0024f24a39decmr4361223ljb.144.1652486470712;
        Fri, 13 May 2022 17:01:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z2-20020a2e9b82000000b0024f3d1daeaesm626221lji.54.2022.05.13.17.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 17:01:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: remoteproc: qcom: Add SDM660 modem PAS compatible
Date:   Sat, 14 May 2022 03:01:05 +0300
Message-Id: <20220514000108.3070363-2-dmitry.baryshkov@linaro.org>
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

Describe required properties of the SDM660 MSS PIL device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 8f1507052afd..5ecfaf2048ab 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -16,6 +16,7 @@ on the Qualcomm Hexagon core.
 		    "qcom,msm8998-mss-pil"
 		    "qcom,sc7180-mss-pil"
 		    "qcom,sc7280-mss-pil"
+		    "qcom,sdm660-mss-pil"
 		    "qcom,sdm845-mss-pil"
 
 - reg:
@@ -44,6 +45,7 @@ on the Qualcomm Hexagon core.
 	qcom,qcs404-wcss-pil:
 	qcom,msm8916-mss-pil:
 	qcom,msm8974-mss-pil:
+	qcom,sdm660-mss-pil:
 		    must be "wdog", "fatal", "ready", "handover", "stop-ack"
 	qcom,msm8996-mss-pil:
 	qcom,msm8998-mss-pil:
@@ -84,6 +86,7 @@ on the Qualcomm Hexagon core.
 		    must be "iface", "bus", "mem", "xo", "gpll0_mss",
 		    "snoc_axi", "mnoc_axi", "pnoc", "qdss"
 	qcom,msm8998-mss-pil:
+	qcom,sdm660-mss-pil:
 		    must be "iface", "bus", "mem", "xo", "gpll0_mss",
 		    "snoc_axi", "mnoc_axi", "qdss"
 	qcom,sc7180-mss-pil:
@@ -175,6 +178,7 @@ For the compatible string below the following supplies are required:
 	qcom,msm8974-mss-pil:
 	qcom,msm8996-mss-pil:
 	qcom,msm8998-mss-pil:
+	qcom,sdm660-mss-pil:
 		    must be "cx", "mx"
 	qcom,sc7180-mss-pil:
 		    must be "cx", "mx", "mss"
-- 
2.35.1

