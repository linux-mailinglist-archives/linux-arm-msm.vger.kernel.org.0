Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66C2464AC4F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 01:24:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233883AbiLMAYw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 19:24:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233827AbiLMAYb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 19:24:31 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C586110C
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 16:24:30 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id z26so2304621lfu.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 16:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+igP2QJ4zhnmJmTalpeVUPlHJ3uUv+ijfE0j0lwlwk=;
        b=k4vUYoD4QEVuww17VhwsQtpXRPQTJZeIdU2yeKwCezoDrS5lsP0U0PJYIXYltp4Kml
         mQKGGsGkwfOu50t9XT/X/NMw4Qta5iV06ySKAkPD0o2ztCvWcrAHV0x7CbJeyq4zVW0x
         ByDflb5B0e0qXSRizIFVtPzfoa2Px976YBvU+0cdiL/tH0T5VLnfzUQfHqeOmAc5TwRm
         sQfUsE0eE504iLZpqB5U6qii3Z3F9kmw6sDd6ce7tWdc/lm27q0HbMUFg/UmoUKDC/a3
         o+aLx2YbScD1c4Muf/YDsnVecYmK2WnrBDqAO+IvriulZGPkv+s/p1RfRL6f9MvnOw91
         jsKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u+igP2QJ4zhnmJmTalpeVUPlHJ3uUv+ijfE0j0lwlwk=;
        b=VPwB3wogyvUQrSOYHL3s7of+vJAiI8ipBiZbYcBOFToxfQekE/bNTXi+9ZhMeBdHHU
         PquQk6OHJg2j+zOY/lgg0W4GY1aaXiIuDp8wA90m1BvE/ou0NPFgjR7v1bpCt1zbhROd
         smekmbFVQX9KF+qG6j//ac9jAERyCU6XsbTmffDImXTDP/PO85aA3DCC9eFEEeMyPQV6
         Prq3VqzpWi7LzAGRUwL4N28Zq+W8LlJW9T76sNiY8ZUre1NLSvt6H50jVt8gV/5KIE3Y
         WQqRZ4yQcdr+AN8xKLlYMGXhf03MKI4qgzQOKBqutLTExE9EUorsman83oDuHN3DgnLk
         /Pzw==
X-Gm-Message-State: ANoB5pmtmhE8uY476ykx//MzWAP+ss5BPXdQJwVpvHo2w/t1ybV3FG5Q
        EfUw1+2AMf74mzpOlvenLogsOHrL0kkUMACZ
X-Google-Smtp-Source: AA0mqf6BYAF1pc+MKAQRYlGa5eC8aZamI4avbyvA7Je2i7JVNS6Eg+GPuY3Fdw9mNRQKakPAGB+i2Q==
X-Received: by 2002:a05:6512:2a86:b0:4a4:68b7:d625 with SMTP id dt6-20020a0565122a8600b004a468b7d625mr4719629lfb.12.1670891068499;
        Mon, 12 Dec 2022 16:24:28 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id m23-20020ac24257000000b004978e51b691sm137352lfl.266.2022.12.12.16.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 16:24:28 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: nvmem: Add compatible for SM8150
Date:   Tue, 13 Dec 2022 01:24:17 +0100
Message-Id: <20221213002423.259039-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221213002423.259039-1-konrad.dybcio@linaro.org>
References: <20221213002423.259039-1-konrad.dybcio@linaro.org>
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

Docuemnt the QFPROM on SM8150.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index ca744f5890ff..a1305fd68f67 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -30,6 +30,7 @@ properties:
           - qcom,sdm845-qfprom
           - qcom,sm6115-qfprom
           - qcom,sm6350-qfprom
+          - qcom,sm8150-qfprom
       - const: qcom,qfprom
 
   reg:
-- 
2.39.0

