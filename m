Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F0C74E2795
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Mar 2022 14:34:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347911AbiCUNfT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Mar 2022 09:35:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347894AbiCUNfR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Mar 2022 09:35:17 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A2773BFAE
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Mar 2022 06:33:52 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id x34so16680581ede.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Mar 2022 06:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mZ8HdiTgcVigl0a3UV5zlYJCfBrMwpgPetl89qLpPSQ=;
        b=DlGlkCrtzbxekERuNvjOkzibW+KoiiKsaBjyFta8KwhfwCXES710MnwIsbNk/VoOdj
         Kot/QSNUCXwBiyNS836CFk0qVrUPazQgqKcxfnxbi7dsBkpSmbu63iVUSsguyzeA26oK
         3NfVfJ5IaeByUOnA7GJU/GzD5DHk7SP03TF4CCRrOWJeodI3KnAU8HMtIGrgT3aaGlkC
         5TxxLflrak8WwJe+xR22+ASOI1xPo9OXABrw8WuWc56vOjjAZ88xmsIjaRpDUUwRxedg
         DFtY19B/5zp/Vgpf+LtF1ymNI6Jyks29h3liBSpJfEIW4ibmATo5ev76K4ue4byfuvXW
         +rQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mZ8HdiTgcVigl0a3UV5zlYJCfBrMwpgPetl89qLpPSQ=;
        b=3OcJ+y3BymBOQyx7YDJK6KYvPsufHcEHRZ8ZY4SdeSyDrqbYWln7lQiuLk9shJ1MLl
         tlgLTDUuB4od0ClxHkeNXil3rEGoSkPm4nBIAqmnH4DX6fWqZafs7+NX9q7WXzurVsiC
         LHVgMo7aqV8qCFHLrcv8Io+cYmJyymnWglmu3weZ8vAT/zyABiW9yPVpakMrUKLgZ8Gb
         ItcMazw713SJ9ODIMIIH4w+eEqwEmscgBWCXZRNeaPN5PtGeU1y9heG6v3cIag0BYlzG
         nBax1waA3TJyFfYG5KAZkGaXwz4CzpdT69dmILTk3jX4BJEENBmzjS67aOrqKLddyMn8
         RPZA==
X-Gm-Message-State: AOAM533Bx2XqudleFoqH4344nNedJyqImRwCBw+8LPXmqsNjpDWiLJHB
        IeCcFunR4elfCvQcYgHGfphPucJHHkF43Q==
X-Google-Smtp-Source: ABdhPJx2zzuXLmvAkDeu7gED1IhSElcio6x5gdV3r+KWk0yff6fDQ6CLsQqc2tkzZkv904iYSqyQbA==
X-Received: by 2002:a50:a449:0:b0:418:d875:1730 with SMTP id v9-20020a50a449000000b00418d8751730mr22877841edb.371.1647869630480;
        Mon, 21 Mar 2022 06:33:50 -0700 (PDT)
Received: from otso.arnhem.chello.nl (a246182.upc-a.chello.nl. [62.163.246.182])
        by smtp.gmail.com with ESMTPSA id r22-20020a17090638d600b006d584aaa9c9sm6862154ejd.133.2022.03.21.06.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 06:33:50 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] scsi: ufs: dt-bindings: Add SM6350 compatible string
Date:   Mon, 21 Mar 2022 14:33:13 +0100
Message-Id: <20220321133318.99406-2-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220321133318.99406-1-luca.weiss@fairphone.com>
References: <20220321133318.99406-1-luca.weiss@fairphone.com>
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

Document the compatible for the UFS found on SM6350.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- add second hunk for clock validation

 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index 5b3a2157f7e5..dcd32c10205a 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,msm8996-ufshc
           - qcom,msm8998-ufshc
           - qcom,sdm845-ufshc
+          - qcom,sm6350-ufshc
           - qcom,sm8150-ufshc
           - qcom,sm8250-ufshc
           - qcom,sm8350-ufshc
@@ -125,6 +126,7 @@ allOf:
           contains:
             enum:
               - qcom,sdm845-ufshc
+              - qcom,sm6350-ufshc
               - qcom,sm8150-ufshc
     then:
       properties:
-- 
2.35.1

