Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8F84538F44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 May 2022 12:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343574AbiEaKwF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 May 2022 06:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343592AbiEaKwD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 May 2022 06:52:03 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B031A580C0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 May 2022 03:52:01 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id rs12so25714804ejb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 May 2022 03:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=l4c6eL6FkT3F5Q2UMeh1SdTOW/jzEthp0aJ+P51R6LI=;
        b=ezKQ6zWeGyXve1iTyjENVNkwv9DtZyXm+EaCQv5YRyn8Pu7QEY14SzoxTP6UcXVvY8
         SNKT2aqUgKz99tKPOFRTuUIIe2yPd8Bgz72lHTaOa6k4f/LHmRSaX1IPS0V4K0/efuAg
         1sOclLct0LvM55lEHU2yh6bSapLfeNno4Abq+eL8AO0pQm/XdALoPGVi6njK8xl3HGw6
         vALl4o4ChpH9uYGKFSQjpDjjTf0bZcPHobSRWdXk5xR/Yrmyygl59q2sx65dC5PyLyME
         hN75O3Qe9lrknIc/i7Uz8uQZTZmO65ExCv9cw5F9Y8H3nYxNHLVg+Bv6UQ9PJx5yBXwM
         LsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l4c6eL6FkT3F5Q2UMeh1SdTOW/jzEthp0aJ+P51R6LI=;
        b=eINX8UidKFom3vZjEj1KfAoqs1siYISpDjrniUU9j3fcPWowo0LCMw/VFwy7z1aWH1
         5O0hJ12JnbiwbcqAq9Oc0aperYXnnBEAc17qzSXY0Cmhe7f4RG2Br86BXKsmnZGilp+F
         jvZBg3xL/xmV4et59YtvtGtLDxPIurPw5AYcEBhKm8JLuAPxmeU90zCIiRfYNvN+jRJm
         tZFoR7tp+zLGpUl6ou5o7TC3k2xbJTcKAcOGVxTzWoBLUc0UV8F2O6AAdGtMfaMwRhCE
         6CkPsezg9CtBQqfu9R+dGqgznnZmDSvzdCPrABO10thsyIyOTdw+K8gZ0HFNdua+13RO
         zAUw==
X-Gm-Message-State: AOAM530JQCXYT8TF8yREbQu75c4p1A9tyqjJGlaVyQ5lNNDeJAraE+Pz
        ZIRsajOjBBEkLtfMZSM448wbeg==
X-Google-Smtp-Source: ABdhPJxfZv4U0lBM9OJVvLX7P2n5KCPOoB4LZP9WL8Zcg/eBddHTbAuxRdGAVz7FKnJtIdW+j6aNyg==
X-Received: by 2002:a17:907:8a11:b0:6ff:d8c:eff with SMTP id sc17-20020a1709078a1100b006ff0d8c0effmr28865372ejc.659.1653994320263;
        Tue, 31 May 2022 03:52:00 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q3-20020a50aa83000000b0042dc513ced8sm5117441edc.30.2022.05.31.03.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 03:51:59 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 3/4] arm64: defconfig: enable Qualcomm Bandwidth Monitor
Date:   Tue, 31 May 2022 12:51:36 +0200
Message-Id: <20220531105137.110050-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220531105137.110050-1-krzysztof.kozlowski@linaro.org>
References: <20220531105137.110050-1-krzysztof.kozlowski@linaro.org>
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

Enable the Qualcomm Bandwidth Monitor to allow scaling interconnects
depending on bandwidth usage between CPU and memory.  This is used
already on Qualcomm SDM845 SoC.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6906b83f5e45..6edbcfd3f4ca 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1096,6 +1096,7 @@ CONFIG_QCOM_SOCINFO=m
 CONFIG_QCOM_STATS=m
 CONFIG_QCOM_WCNSS_CTRL=m
 CONFIG_QCOM_APR=m
+CONFIG_QCOM_ICC_BWMON=m
 CONFIG_ARCH_R8A77995=y
 CONFIG_ARCH_R8A77990=y
 CONFIG_ARCH_R8A77950=y
-- 
2.34.1

