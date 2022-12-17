Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC30B64F653
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 01:33:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbiLQAdz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Dec 2022 19:33:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbiLQAdy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Dec 2022 19:33:54 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E05A71C139
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 16:33:52 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id a19so3848697ljk.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 16:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7A7d9lu1TYw46vVoEpDLiF1xMuebk27n3Wae+ym3d4=;
        b=AhIZ9//hDbJz2u/SEEH9fVnvNKKVqEgEicLACbhSHX4eELafQDsFny426Ul5DKjTPx
         +mlDmn6lXhLkgUD272Tid/MRHE4yb7ngVO9w0gsxqIGggkZjo9H4nOPTgZVujiR4KYhQ
         iqpBHMxZMaqxG9J61ODjfcd/5gfWMbpQqvkTfLzZfbOt++ZeNFbRCyGKzZCG3CyKMNyD
         42GwkY6FhdaRWAvrtDbwzswNIjnDIlctYQx7WTKVE68THuedUGBKtSzr66YM72A7+UqD
         ZgxY/34Q42NQk+D2uaQd7pzTMrgQMTtyNzN7xi10DpkIGaXZH8VPA51DnriVNbgp/AWm
         PTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I7A7d9lu1TYw46vVoEpDLiF1xMuebk27n3Wae+ym3d4=;
        b=rD9BOmBgV5rPGCDzGhZFdVVT5MAIB+nDjsHlSQk2F0eDlhdDM72zuwYbTzQOTeFfE7
         jTCc7QEs6PT6fXTP2S86V3EGzYrRQG5Ii7Q1lGX9Bf2S+nPyKWy/bClteaJsMGJUQQFo
         2VxobUtY60aefAkivQ+GIeLRQPJcS3r4bPbaJYxeFVQRr4WQDxqJzFzyS8BH43vmHZqJ
         fk47eTjRKzlX3xsgwy5bdXN4SNy9yOV/Oxi7jLAtS7DksGWDPVazKUBliMZ9uv/SYNjK
         +37V2+OTDcg7hcuSrshLHPMifT8XWm+eyrudG4Pdp3SNzDQB8bektI95HSJPpqhp4Out
         40pQ==
X-Gm-Message-State: AFqh2kpHz2/EmrTIy3gVkNs/WQn8XP/ZvZCzpofApUWPpUGqFNTvS31F
        rHZ4ZbJBdIQbO4J/MQirB+QfrA==
X-Google-Smtp-Source: AMrXdXvYfHeCqctkdbfJjoB4NzP30Zx/7hUihfIxPJid9r2ptEsqM8a1AUwP0NV5z0kSKwGnDVFXvg==
X-Received: by 2002:a2e:b954:0:b0:27d:7c33:8d4 with SMTP id 20-20020a2eb954000000b0027d7c3308d4mr3738774ljs.51.1671237231208;
        Fri, 16 Dec 2022 16:33:51 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id u12-20020ac258cc000000b00497b198987bsm351458lfo.26.2022.12.16.16.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 16:33:50 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: mfd: qcom-spmi-pmic: add pm8450 entry
Date:   Sat, 17 Dec 2022 02:33:45 +0200
Message-Id: <20221217003349.546852-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221217003349.546852-1-dmitry.baryshkov@linaro.org>
References: <20221217003349.546852-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add bindings for the PM8450 PMIC (qcom,pm8450). No driver changes are
necessary, since the PMIC is handled by the generic qcom,spmi-pmic
entry.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index a5edab6f2e40..93d157153428 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -55,6 +55,7 @@ properties:
           - qcom,pm8350
           - qcom,pm8350b
           - qcom,pm8350c
+          - qcom,pm8450
           - qcom,pm8841
           - qcom,pm8909
           - qcom,pm8916
-- 
2.35.1

