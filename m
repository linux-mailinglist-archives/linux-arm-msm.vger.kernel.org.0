Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A29436FF376
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 May 2023 15:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238201AbjEKNzR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 May 2023 09:55:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238212AbjEKNzN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 May 2023 09:55:13 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0311E40E0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 May 2023 06:55:10 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-50bc3a2d333so13124411a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 May 2023 06:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683813308; x=1686405308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V8AOCEVomoDZok1Dg2q4lqllSgyeZdt+RTw89j3c4Dw=;
        b=yB2yAkgLR2v2D9BFaoAAzrhGWCKsts2HnAvHh9Nglcyg87nG0BWOojftvLym1/FwdX
         XJXSpNVSwn9swqFlsQ/m4Sd5G/5Poo58WrTvAneDcnk8/iVpsZfwb5/R+sjRSt+3mzyL
         6lnEUTvpT+bwXF7cFeCy0PLTogZNYHTlAuMSkQ4+R1hjDROwjn+RMcO1wr0Za5rrcI0u
         7Lme3TeNfMuVGMYW+hgUd9wtlMHmoWOL4oQ3ixby5h53ajdAhconNoY7yGZx/dJwMHAs
         s8IivxgLqam8HM8d8Pq0edB6I7Stl7z6W0Msf+wcP80RnRDT3S1bLzgS8zZDMy/DGSfv
         gQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683813308; x=1686405308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8AOCEVomoDZok1Dg2q4lqllSgyeZdt+RTw89j3c4Dw=;
        b=js1ktR/0SbcBr7EVe6moZuxfThCdhvPHNsGG3oCHSUT9Rbhb6msZxcI3ex86SsmFOX
         U3Bf7D8MQNbOGhxCrjiPn00kvGJ2u/MpwLgNPBNDBg93QgZL5Vt0zcif+ZGOF910Q0bb
         a+tIQ03xW9vasO0JTDzl9aR2+h6dgg1Kj87PzkJLoQUBH8PI2HReRezZOtMM6KdPshGh
         3cLXBh9SLv4VuH1XDKT+0BP1V6udgBY5PUUAUB/VK1a67j7nRWQCQdtg3xz8Vj6YVWsI
         PIyhR5PFcMHKEpc4yK9ciqF1ENUXfnPeUjybtan6QFYtdTIuOKaK0WX85m6azT7oDSjJ
         J/Nw==
X-Gm-Message-State: AC+VfDxKiGEEM5ZFupF6gHERaI5rmPQG6b3gdibFO0WqvVXyV2xBb3i4
        7sH1KOLJNJFXAOlyg8nZY1ZEYw==
X-Google-Smtp-Source: ACHHUZ7PzTvxrXjXnT1fmCNWf/6Uia7OJIZYGTDpF3t/pX2v1BJ+paRMwcYFqVj28svkZYDWB+8Xjw==
X-Received: by 2002:a17:907:94d2:b0:94a:959f:6d58 with SMTP id dn18-20020a17090794d200b0094a959f6d58mr22426579ejc.18.1683813308437;
        Thu, 11 May 2023 06:55:08 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d7cd:1be6:f89d:7218])
        by smtp.gmail.com with ESMTPSA id y13-20020a170906070d00b0093313f4fc3csm4090414ejb.70.2023.05.11.06.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 06:55:07 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: defconfig: enable TYPEC_QCOM_PMIC
Date:   Thu, 11 May 2023 15:55:03 +0200
Message-Id: <20230511135503.198538-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Enable CONFIG_TYPEC_QCOM_PMIC necessary for full USB Type-C support on
Qualcomm QRD8550 and MT8550 boards.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a24609e14d50..8b6407d2059d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -991,6 +991,7 @@ CONFIG_TYPEC_TCPCI=m
 CONFIG_TYPEC_FUSB302=m
 CONFIG_TYPEC_TPS6598X=m
 CONFIG_TYPEC_HD3SS3220=m
+CONFIG_TYPEC_QCOM_PMIC=m
 CONFIG_TYPEC_UCSI=m
 CONFIG_UCSI_CCG=m
 CONFIG_TYPEC_MUX_GPIO_SBU=m
-- 
2.34.1

