Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16052719F25
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 16:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233835AbjFAOHa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 10:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233719AbjFAOHZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 10:07:25 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42AAEE40
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 07:07:13 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-30af159b433so884967f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 07:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685628431; x=1688220431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gE1qhAhlgSaB66o5SMOQH1/DZyGEHuOAUxg0SjDKmKE=;
        b=ncTR/LFkICuOKf8JzE8mwzQkAw0gFcGx6bwSWNyTyZvT565r2K0g6cmROydYZR1K3/
         GPs/14R01hYQ9sy+XqgeRbT5aL6y5bM6otfkzqmJ3/WnB/FxCxkmZuLMYFRHfBHwK1Wc
         6vLIy0ZvkkX3gHPRlQ4iPaFFJSu06WUv9acFcgOFc7Ii+Ggq+BEP5LxhV0xMdNl8bWj3
         TagohST1mxSOmm+NJmUR7s1fGw1Rj7zmwH8BrSAx/NPd1X7yYCA1V7QcasLAGgR5aAA0
         NyJsiWKXFKCS2XrTcLM3gOK5WO4jAPe0YlkNHN4SJuRWz0jx/bLDwOl9pbwu69YqD+HA
         ofYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685628431; x=1688220431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gE1qhAhlgSaB66o5SMOQH1/DZyGEHuOAUxg0SjDKmKE=;
        b=WdzTi+eA4b9CMfBgizQBx/PbvwQjBrhrGXUEk//L3CoC8Ik33jVEbqTQgOl1+6P4iy
         kWXktG+ja9FrZKAGQRN+cEvYfKtLulzOPN6QFByttSudLDi/pi3+BYBPHvZBYXE3mw9g
         vxJZKlY3Oy8IlCjaECyv7m8ByBtaqDggscyJXVou/ve7iubDmimYSC1XQJPzvtTUE4ds
         f8Ks3dGTYdQUDbXmlVAcYDROrOv8x3Do41/2uM0d7ZZn/ZAcFzkKIhPKXwzmwt0wcCK8
         2jvowIABcJnsheYe7j6SA2LcofX75IGSDInuk6iPApLpY1OwTtjAzO98f0SciFdAzkcD
         SCcg==
X-Gm-Message-State: AC+VfDx+UuvMg83gQNV9ILo9+JGomRGoJ9JZ0TReRl2InpKBA+Qduux9
        9MeCNFEFniizAInhzqYeEXLADw==
X-Google-Smtp-Source: ACHHUZ5AuOmZ+NfEXgtt168NGlt099DukYcSfpfAo7yOeBDZ/yn/lvo1Al/toGQmnwxHJRX/J3JkDQ==
X-Received: by 2002:adf:e60a:0:b0:30a:f19b:ff98 with SMTP id p10-20020adfe60a000000b0030af19bff98mr2306105wrm.9.1685628430917;
        Thu, 01 Jun 2023 07:07:10 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id k11-20020adfe3cb000000b003078a3f3a24sm10504166wrm.114.2023.06.01.07.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 07:07:10 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Thu, 01 Jun 2023 16:07:04 +0200
Subject: [PATCH RFC 4/7] qcom: pmic_glink: enable altmode for SM8550
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230601-topic-sm8550-upstream-type-c-v1-4-d4d97b4d8bab@linaro.org>
References: <20230601-topic-sm8550-upstream-type-c-v1-0-d4d97b4d8bab@linaro.org>
In-Reply-To: <20230601-topic-sm8550-upstream-type-c-v1-0-d4d97b4d8bab@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1172;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=z0GFmf8RXrtifMxHJ2/MNRFqa/pTMGwvA09+Qr9ms/o=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkeKYI8CawFYNKGPW6pQYZQjQsD0rKsB8i9x5OFsrg
 J7Wlc8iJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZHimCAAKCRB33NvayMhJ0eddEA
 Cu0UbnpZfBtdkq7Zuce07nIBDaroOukoUwo6zh0LsznsNjgsYFXmrKEsC3PotUrLZj+txrA5lC2g4Y
 8cSTvBajiO9kMt5RHE0us+DnxbqnWWjoI+qKfzgX1KAqf544woylwpabVmJJJWUXs0rmXj5ufkaW/z
 KPDJylBPIp4HaeGfWfFL/tcEXMzUKZg+WMUKbw5h/6D7oymcPRm+Q28cDGtZw9ois73sw3C8j7ozmK
 k9xfI5TzxkjA27PwM8GIe0cKczhqvB1jE6wHW4x/m5mK/ingOZIxx+R2hFesKoWnDB/fPck1tfyMCG
 v0GyMvVNxveLRbTGpFEDu9xOFBxJTfx1od9KDwCqSY5deHR5RdZy+SMEAAV/GhmbMopD9NnXKn/LLo
 NiPSLH5j6aXExTXNvl8k+15+mQDDydTzEs+mw44URYwvcdcQD3TdYizCC7zC1cGFB9rZyWAaEugaqx
 4bgqa8zWEwq+5No6s8/bjJa54NkNHJ3WGutyXxe8qhmAwnuDtZ/5PiYqXxbYtrRmSyp4I8mKL64Uur
 BROF+/+d4CkXTRsqErpxT327MwVyyximsd9sB9a3ZE8dhCGyc7tlHrVymb1E/YXjSMymOF9Lpcmnyn
 TBNAvWe8U0UzG+ihrPp5V+IuQMnP2vFgiqbX4Fl2Yq+hoHMoYd3M9ubGZy4A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Altmode is also supported for SM8550, allow it.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/soc/qcom/pmic_glink.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index c87056769ebd..8af06bdc6f5a 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -342,13 +342,9 @@ static const unsigned long pmic_glink_sm8450_client_mask = BIT(PMIC_GLINK_CLIENT
 							   BIT(PMIC_GLINK_CLIENT_ALTMODE) |
 							   BIT(PMIC_GLINK_CLIENT_UCSI);
 
-/* Do not handle altmode for now on those platforms */
-static const unsigned long pmic_glink_sm8550_client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
-							   BIT(PMIC_GLINK_CLIENT_UCSI);
-
 static const struct of_device_id pmic_glink_of_match[] = {
 	{ .compatible = "qcom,sm8450-pmic-glink", .data = &pmic_glink_sm8450_client_mask },
-	{ .compatible = "qcom,sm8550-pmic-glink", .data = &pmic_glink_sm8550_client_mask },
+	{ .compatible = "qcom,sm8550-pmic-glink", .data = &pmic_glink_sm8450_client_mask },
 	{ .compatible = "qcom,pmic-glink" },
 	{}
 };

-- 
2.34.1

