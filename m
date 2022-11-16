Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71F7962BD92
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 13:21:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238495AbiKPMV3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 07:21:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238618AbiKPMUm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 07:20:42 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7A072638
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 04:18:26 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id o4so29485092wrq.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 04:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJEtub8V1LnQBPuC/j+4CZ4Uf34CBafwgkOL5JcKXZs=;
        b=QP2wtvzqTHk70Ufy5qLlZu444lFQPCngrbtt3UAP/WOtUufcT4lYsanK04d99j0W18
         IytzeaelnkfTxcirY1rOxyK6ElTHtQePUIrXG15F8PBNQR0g0eIZ2D1zQcblSRcs1FFl
         u10n4OA14EsUM83rPrWDVvRWiONkXnF9ujCgD0tIN9K+ML6rr1n5bKedVcsyq2R3j1LG
         GAK8PF3v5rErB3h3p7rlklRfTf18+0ziSY83PlKKdBu9pqBqhMe9HAjf08M/8b5QHmtb
         oWU7AmGFR7nEmQNKDVhYitTYHvlMStj4zjOgW7LF1Pu78/wSP0LBO2tVRrnuKcdttdkO
         mJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fJEtub8V1LnQBPuC/j+4CZ4Uf34CBafwgkOL5JcKXZs=;
        b=qIJcb2vdJ/kN2LKp9BpZHvT6HowDtsI1/VOFF/hC0u7vz22T6iR+jUEyXTyhrEG317
         UCL/iWSNxn0MF9aAR9IeM8hWlScRVkjSUl06Q+cMN1sQCI+9kOF++KjSlAZ0f47n7J4a
         v29xc/5TOeIlYuRWbGjX34s8aHiWbqmWc87zxa9d0y2Bb9Am3Zm2/zVtQglTbhk5c3X0
         lTHYaUHlvnoFBPZB0f9q50Ziw4TlNIt8NH277RlhbSEeyC3MJWMe4WJn8sneZEFGl7WJ
         e8DpbcjLYc/8wW2QS4elj7DPZR9xk7VJcVRc/I3Gald8Wfh0diUrMWAgE6Crqu6GYUM9
         fpTA==
X-Gm-Message-State: ANoB5pl1GZAuzyMPc8PD5BXIGkUHwuGeXL0Mb7MxrURV6Snz+fgdNG2y
        0u3VK/lLG13XoCYzcDthhxu7aA==
X-Google-Smtp-Source: AA0mqf5j/ZQT6HbQ/iuTie2i710FZ8rhLlrvaUCCfCkCR6ERkMaYmLNVizqEGUg4ksc2+8M/DsZN+w==
X-Received: by 2002:a5d:6086:0:b0:22e:71db:47ba with SMTP id w6-20020a5d6086000000b0022e71db47bamr14186962wrt.359.1668601105326;
        Wed, 16 Nov 2022 04:18:25 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id t14-20020a5d42ce000000b00241a8a5bc11sm1090359wrr.80.2022.11.16.04.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 04:18:24 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: ufs: qcom: Add SM8550 compatible string
Date:   Wed, 16 Nov 2022 14:17:32 +0200
Message-Id: <20221116121732.2731448-3-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221116121732.2731448-1-abel.vesa@linaro.org>
References: <20221116121732.2731448-1-abel.vesa@linaro.org>
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

Document the compatible for the UFS found on SM8550.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index f2d6298d926c..66554adeb515 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -33,6 +33,7 @@ properties:
           - qcom,sm8250-ufshc
           - qcom,sm8350-ufshc
           - qcom,sm8450-ufshc
+          - qcom,sm8550-ufshc
       - const: qcom,ufshc
       - const: jedec,ufs-2.0
 
@@ -103,6 +104,7 @@ allOf:
               - qcom,sm8250-ufshc
               - qcom,sm8350-ufshc
               - qcom,sm8450-ufshc
+              - qcom,sm8550-ufshc
     then:
       properties:
         clocks:
-- 
2.34.1

