Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E5FC6477CB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Dec 2022 22:15:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbiLHVPl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Dec 2022 16:15:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229840AbiLHVPh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Dec 2022 16:15:37 -0500
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6735A13DB
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Dec 2022 13:15:34 -0800 (PST)
Received: by mail-il1-x134.google.com with SMTP id m15so1755402ilq.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Dec 2022 13:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Z8KQUKCdgYzi8FsOANYv77KV2tDZwVye+hB6FuVtSc=;
        b=ySGfC31MJ+p6DaD0xcmmutCmOmi+o/cHyOsnl19LOygxkHHp4FercGnzTI+PzYgbvW
         k5+pnbUBAhJ9axVyZfAw+AeHi8QRaE+YnTovsQ4dFFko8wMotqf4L8yh9nLrq8+62DVX
         NcmgszozS8O7FMNsMRRLv/wjRHT77nT5rT3Xg1BNAkQcQdQKy1mB8kel6Rh4v8ywT9yL
         rSXEBZYmHh01ygbdSP7KGsnzGAD999Pd6db7cBR4oJ6sowR20mhew0nAiNt2lK5mdiYs
         3P98c/pshFiDsg0yinNgAtryWglRxKOjI3SnV3BUHiEYsFPQPdUxBwOl/0XCoEsbLsqe
         Nhvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Z8KQUKCdgYzi8FsOANYv77KV2tDZwVye+hB6FuVtSc=;
        b=Mxt3+plT3g7D6H81+va/id4FW0Ei3b/OR+c6IAcBNLk9TBY7V65wo3gFBfA1hFkW/L
         KJoxgiQAhHvJC2hUFF95jFSepEalG6xwT738NqczdbCdz1MOOnqPjNBO0sn854JVBJiw
         8P8npzCm5tvxu2TA/D3JjzWAIYyd84cyCnkm5chCMPRqfXDe/K817/7zP0ogCZLT/XqP
         td+5zsANcjXuYBYk7xmIOnI/jBD6ynnezQk/9pjDNfKWBsXZ7/5ysP+jYPEPWcUQi5C/
         Oxp0sCAI3ZsBm35OT7xeE5Y2uOrlaJ3LogMmLmMQhfYnZrBMhtKqtnZdE8tAqAj+V4EI
         wBeA==
X-Gm-Message-State: ANoB5pmCrDQtqnQjilAzzkGAqi021sbr02jkhfArt6hU7W1cGSsoRM19
        vlpMY2JDgn4pWMekyZqv++PXuQ==
X-Google-Smtp-Source: AA0mqf4+PgOefR0uR4CkoPbHQOzhs/foVsK+ZReHznc+XTFG3ssMdjymZkGxRT6izqr4DMfru1GoFw==
X-Received: by 2002:a05:6e02:1bcc:b0:303:17f2:7862 with SMTP id x12-20020a056e021bcc00b0030317f27862mr3197077ilv.0.1670534134293;
        Thu, 08 Dec 2022 13:15:34 -0800 (PST)
Received: from localhost.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id k5-20020a92c245000000b002e85e8b8d1dsm1099821ilo.5.2022.12.08.13.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 13:15:34 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     Luca Weiss <luca.weiss@fairphone.com>, andersson@kernel.org,
        konrad.dybcio@linaro.org, agross@kernel.org, elder@kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/2] dt-bindings: net: qcom,ipa: Add SM6350 compatible
Date:   Thu,  8 Dec 2022 15:15:28 -0600
Message-Id: <20221208211529.757669-2-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208211529.757669-1-elder@linaro.org>
References: <20221208211529.757669-1-elder@linaro.org>
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

From: Luca Weiss <luca.weiss@fairphone.com>

Add support for SM6350, which uses IPA v4.7.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: Alex Elder <elder@linaro.org>
---
 Documentation/devicetree/bindings/net/qcom,ipa.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
index 9e81b9ec7cfdd..4aeda379726fa 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
@@ -49,6 +49,7 @@ properties:
       - qcom,sc7280-ipa
       - qcom,sdm845-ipa
       - qcom,sdx55-ipa
+      - qcom,sm6350-ipa
       - qcom,sm8350-ipa
 
   reg:
-- 
2.34.1

