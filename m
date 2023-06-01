Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDD457194E0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 09:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231918AbjFAH73 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 03:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231893AbjFAH7K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 03:59:10 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5148618C
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 00:56:58 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f60924944aso33810e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 00:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685606216; x=1688198216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kbLwMBY7CTt9srqkElYmXSCzXyPRxj6aw3//ncDwFY=;
        b=JBN8uv1MCw1dQB1fV1eoZ/6TXOFVKjpskiNyMDbKprEPfaYqXdv+YZCGNAZD22tEnj
         y/DpQdr9liBS/wIxYcp8Tn7YXoufrw0sqkGW1IaD8p57B/FeFlK0FxkZfdBv64FTJvUv
         2idRFWm8YmxR81oSQt7Z52Ffnw+Gr61AcJ9Xe43fuy3tfD+6Kl7h/FNBt2vlViYbAjRE
         7VIHq+nOhIpTH73I8tvzhISPkB5Aib7htCCDsJqldAbYqlnpgUUzi+zplD4TCl8TrGnW
         6LB1MzoiXBf4JO8jPr3OCKvrn/AKbqZJFNZaUG5LGOuP2toFiG3I667XjutKKO46g1S3
         +14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685606216; x=1688198216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+kbLwMBY7CTt9srqkElYmXSCzXyPRxj6aw3//ncDwFY=;
        b=kYeT4cUwFpr2Cp56MfRO6m05j4VYqHwJ69uub6s/SlUQ5NgmD1KjHq0U1pABidsjEb
         KmHuIYgzSUbEsVJyhWsychvsCuwuu5aYa0Y0mxWGzVxzpwOL1a1wsGGOUrBvstl/gxHu
         T/Bw29Y5a0/paad8Fhg9xYhqF4tVLWlwrKpz9lK/d28l/Huczoic8b1APfsulGfNbxe5
         pXovhhurFjo3vOB2TtQ2+VAtQBJlz/vTqDuXbuXOEe217KdDfXj3iYBM83eDouRrjJuE
         fvIYIa8eJTMnwDuUqBzBAlOO0J1LuaB6qMVq+HeAEgwjeBc1orfF65p/kRETbjgWR893
         Zm5g==
X-Gm-Message-State: AC+VfDyobDFdGguZ9cavv2TRVnvr9j1pE3HIvv6jFjA5Oj8bXuaY/2Bj
        E8I+dLUDXVHSfgiJsdA0ZKWu5w==
X-Google-Smtp-Source: ACHHUZ4FPmppaftiNRJejz2B3nDXkbNVjO5xhpAuBx0R9IxvDK42W1I+tXJoFGBWH4COgMnbDEQm+Q==
X-Received: by 2002:a05:6512:247:b0:4e9:c792:c950 with SMTP id b7-20020a056512024700b004e9c792c950mr2871268lfo.1.1685606216682;
        Thu, 01 Jun 2023 00:56:56 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id q28-20020ac246fc000000b004f60a2429d4sm27160lfo.78.2023.06.01.00.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 00:56:56 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 3/5] arm64: defconfig: Build interconnect driver for QCM2290
Date:   Thu,  1 Jun 2023 10:56:48 +0300
Message-Id: <20230601075650.1437184-4-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230601075650.1437184-1-vladimir.zapolskiy@linaro.org>
References: <20230601075650.1437184-1-vladimir.zapolskiy@linaro.org>
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

Build Qualcomm QCM2290 interconnect driver as a kernel module by default.

QUPv3 GENI IP uses the interconnects and provides UARTs, but since the
dependency is not yet displayed in the platform qcm2290.dtsi file, it
could be assumed that the interconnect IP is preconfigured, thus building
the driver as a module and placing it in an initramfs should be sufficient
for booting up to rootfs stage.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes from v1 to v2:

- due to review comments changed building QCM2290 interconnect driver to
  a kernel module and provided a better description in the commit message.

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e2f6a352a0ad..e28794a768d4 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1415,6 +1415,7 @@ CONFIG_INTERCONNECT_QCOM=y
 CONFIG_INTERCONNECT_QCOM_MSM8916=m
 CONFIG_INTERCONNECT_QCOM_MSM8996=m
 CONFIG_INTERCONNECT_QCOM_OSM_L3=m
+CONFIG_INTERCONNECT_QCOM_QCM2290=m
 CONFIG_INTERCONNECT_QCOM_QCS404=m
 CONFIG_INTERCONNECT_QCOM_SA8775P=y
 CONFIG_INTERCONNECT_QCOM_SC7180=y
-- 
2.33.0

