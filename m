Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5FB255F4EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jun 2022 06:13:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231475AbiF2EMB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jun 2022 00:12:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231430AbiF2EL7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jun 2022 00:11:59 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79FBB3632B
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 21:11:57 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id 7-20020a9d0107000000b00616935dd045so11266283otu.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 21:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9XwhN6hWHSS8Xo3qCEB3TdmpDY/iGy7IMz5cHkd8nAs=;
        b=LuowUxMaf7ZxYLIzl28Xcn061Su9qODhPNu4CAu0xhJH54vrNxhsZOOe26dBmkcckt
         UzAR1lQR3ObBX1BYpDOp/XngcpdzaC2UnaASLzCfOYSJgGf7UlArWBhIEypsry1j6aWU
         V8cnWwOaeROIVDUh/PnEJGbd6mlZxEnHjPMCElk4ZvEYn1FyGTG3jxQXk2lnQXovfeAz
         G+x36R4R6BEs+AnJGzK2V+LkrsWiS0Vnl6LvPWd2psaQOEvdOTczQPoVdnGakbdyHSqm
         3PiV07MURgZSbeLQzAYPvAfYiA39yeTYjdlCt3vdWCXK/Qzx1oylZQAzbFCIxpz3dYtz
         5XxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9XwhN6hWHSS8Xo3qCEB3TdmpDY/iGy7IMz5cHkd8nAs=;
        b=FhT4KZAPOENHoNffQAnBMauxQ9sKHlsy9e9Kmkvap34dUCXktLeIn5OjjmdNuiqpIW
         MOk6Pd9lqtuavCC3gMfzIPBbm6nbgN3j0PDVfgPRrKne3yX6UnTIzLKtvRhWd3Kgm6tR
         Ez9Iz5RSXBd5bsO+oWALuE2JhuTNJuuF32odCne8hd5hfw66upaNEiUyXQWaMYF4YKgW
         7vMDYn0KvCgRltQFWOu1wNAh9fd+ht8GUoRYAdGXwE3JcQ1ZGKMgEFFo4Zi44mEKS/mF
         BVHawuFUu6MrSbNz3mHZKFloFAwXm3L6S4EWgDGrkPW1F/tzj17zYVz2FH3RIttDNNOL
         hufQ==
X-Gm-Message-State: AJIora//DJcGvvka8qDbrlJ2MOVE7Y+itvYulZRN1Epv0RTv8GseajR8
        8y/pZDtIJ+zsCjB1EKBcJWxjtw==
X-Google-Smtp-Source: AGRyM1vpOGqtNCrvhjYcOhVDfmJ0I5KWq4+tcQHHhrV/n6DUEwzjx0mwajHGJj55URJjQ+NkFWT92Q==
X-Received: by 2002:a9d:471a:0:b0:616:ed33:e41 with SMTP id a26-20020a9d471a000000b00616ed330e41mr677682otf.192.1656475916851;
        Tue, 28 Jun 2022 21:11:56 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p12-20020a9d4e0c000000b00616ec82b29bsm1578692otf.35.2022.06.28.21.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 21:11:56 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Johan Hovold <johan@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 2/5] dt-bindings: mailbox: qcom-ipcc: Add NSP1 client
Date:   Tue, 28 Jun 2022 21:14:35 -0700
Message-Id: <20220629041438.1352536-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220629041438.1352536-1-bjorn.andersson@linaro.org>
References: <20220629041438.1352536-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a client for the NSP1 found in some recent Qualcomm platforms.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- None

 include/dt-bindings/mailbox/qcom-ipcc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/mailbox/qcom-ipcc.h b/include/dt-bindings/mailbox/qcom-ipcc.h
index 9296d0bb5f34..fbfa3febc66d 100644
--- a/include/dt-bindings/mailbox/qcom-ipcc.h
+++ b/include/dt-bindings/mailbox/qcom-ipcc.h
@@ -30,6 +30,7 @@
 #define IPCC_CLIENT_PCIE1		14
 #define IPCC_CLIENT_PCIE2		15
 #define IPCC_CLIENT_SPSS		16
+#define IPCC_CLIENT_NSP1		18
 #define IPCC_CLIENT_TME			23
 #define IPCC_CLIENT_WPSS		24
 
-- 
2.35.1

