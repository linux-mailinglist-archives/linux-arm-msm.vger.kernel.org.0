Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68C2D648F26
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Dec 2022 15:15:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbiLJOPK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Dec 2022 09:15:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbiLJOPC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Dec 2022 09:15:02 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1122E175BD
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 06:15:01 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id h7so7856618wrs.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 06:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bpyotPft42ZV60u0TngY41SM20HFUNP0Glod1vYIdB8=;
        b=K3qcscChK3t3/dx/b601XowcWiGEKiasE0saMoFPkEWBhwby25BPEMO6+Et5j3PJQK
         +XnBTW323hxe+cOA1+AC552/9Atbuxavy4GzZvszgBvpjfBvXNNEt9kccZK6pnMkOvSs
         2ZxF2SMn4qZGZY7B9KhHQLB/xL+J9BzuUHzvD/oARisLfcC0UX0v0Khll+MCo8tIcxYz
         puwPXq41YO0ZgJtysNLLQLwBG0EQ8bk1k1zkz2nMKYwha9qnkxIZr4JLL+gGGJU5s5NG
         bxZkH1cbmfjYE/30qZ11YTZKZ/42VpqMR6/CBb9UBaDgrBYH0Uo49vXG0mQ2jEtssSKP
         xpfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bpyotPft42ZV60u0TngY41SM20HFUNP0Glod1vYIdB8=;
        b=ugVaeDhdyHoS77K0AtGrsDrGyANcDrCkbyN0GA3YPy/3t0hOWTye0LNRdVGDvSvi95
         rd7nicor/eISwucw7uREC2HS+1JyP7H3zHW/7nxBHHx+6QTucFQJTMgsbvL6kpeCpnXG
         pKIRGwwdLm74VsA+j8Ji58xgN/vl7NcsiF6t1TN32IrA34HB7EtnqT/efbgWnXfvTS4R
         Cmb4/dCYPPfWH36F39c8e0QnF8EFsz4Eq1Zn1a0PFQ6VEMX6CmJsaN9R+lx1upFN0fPw
         yJY1Th/rXzAG0I7WCTCtKrfpSAGjEtK18pqjK2Q7xEXWwXmtZkjdWCQa7njxBjD+4eAB
         Kkjw==
X-Gm-Message-State: ANoB5plB+TOh6xgLfMImgRxuxpTQNWGLcAwNcjLgeDr7LOLQmw9jtLhy
        a/1e9qPR7FsCPQC/3iKQCH8ujpxLDEhyNHj1
X-Google-Smtp-Source: AA0mqf5LgOj4pB1jzSksCkqXwVPTChw10DqfAzOym5ouXClHMmQB9+TBsaGcVkwicGHxof5kwFMsvg==
X-Received: by 2002:a2e:8e31:0:b0:277:2:bb81 with SMTP id r17-20020a2e8e31000000b002770002bb81mr2277570ljk.11.1670680692732;
        Sat, 10 Dec 2022 05:58:12 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id p20-20020a2eba14000000b002770566d642sm614567lja.17.2022.12.10.05.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Dec 2022 05:58:12 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: remoteproc: qcom,adsp: Add SM6375 MPSS
Date:   Sat, 10 Dec 2022 14:58:06 +0100
Message-Id: <20221210135807.10688-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add entries for SM6375 MPSS. Unlike most other modems, this one only
expects a single (cx) power domain.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index a9219c7c8349..434d34578fc5 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -42,6 +42,7 @@ properties:
       - qcom,sm6350-mpss-pas
       - qcom,sm6375-adsp-pas
       - qcom,sm6375-cdsp-pas
+      - qcom,sm6375-mpss-pas
       - qcom,sm8150-adsp-pas
       - qcom,sm8150-cdsp-pas
       - qcom,sm8150-mpss-pas
@@ -201,6 +202,7 @@ allOf:
               - qcom,sm6350-mpss-pas
               - qcom,sm6375-adsp-pas
               - qcom,sm6375-cdsp-pas
+              - qcom,sm6375-mpss-pas
               - qcom,sm8150-adsp-pas
               - qcom,sm8150-cdsp-pas
               - qcom,sm8150-mpss-pas
@@ -350,6 +352,7 @@ allOf:
               - qcom,sc8180x-mpss-pas
               - qcom,sdx55-mpss-pas
               - qcom,sm6350-mpss-pas
+              - qcom,sm6375-mpss-pas
               - qcom,sm8150-mpss-pas
               - qcom,sm8350-mpss-pas
               - qcom,sm8450-mpss-pas
@@ -379,6 +382,7 @@ allOf:
               - qcom,msm8996-adsp-pil
               - qcom,msm8998-adsp-pas
               - qcom,sm6375-cdsp-pas
+              - qcom,sm6375-mpss-pas
               - qcom,sm8150-adsp-pas
               - qcom,sm8150-cdsp-pas
     then:
-- 
2.38.1

