Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4EBB6C1871
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Mar 2023 16:24:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232569AbjCTPY3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 11:24:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232830AbjCTPYL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 11:24:11 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4456434309
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 08:17:20 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id ek18so48150576edb.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 08:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679325436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vBucV0l0f8VxCv4hVjolEhn4xOxJUjWzDmLImLuXF8g=;
        b=sHZ2FXTJBw7fvFMLIo57RXUaxl6ZEKppX0tU7sd4H7BoV6Oxt3S0bi6d1kDI7Ag44G
         Xn2lViKxpvnytJPtuR7DFt7GyhxbBQqkM5DmuHlgO2cGh501Ez56A0Hj4b7W+9Lrmbf+
         uvH1ZngwncN1/p8yrhFWLtfmQG9KpcKY7Rmq3o+dVDOTitPRUO8REw4B0hBaos7L2eIX
         H0G12N6Jkbtr2zRY1v+SLDp/f71jbgeb2JORNIOKTtU6eia8q0fDKwiE7fA76NSkAEpB
         LvXhCJDsL5s9aeu15G3BDYBLXpsOqBM1RJzSzmdERDw16KxFcOAfgP/gtJ5ID59SA3lN
         MhaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679325436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vBucV0l0f8VxCv4hVjolEhn4xOxJUjWzDmLImLuXF8g=;
        b=GlVrewM4PTYjl08TezVHXpU4/xMWheEUNqggghOo+/mgAEt8EW9dn6rYH+DNYX5GRI
         z91ozkAG3XS0JfToZumIvc9Tw3O+uA8fsV+8uTtHRAEMvfXNzWBgUC0u5Yo/bz2OQ8UK
         FHTySgPCnwG6DpsyLRSft8tpUD+eMjkfE3/9i9HFvKvR7IYU9aa7GzqE6fLlthoXkZk0
         k6OgbGwNVYK6ngWnAVm/RvRGGoPCm6HYhQm6edv70xJ8Bz8uq4aXQEJ7I+pVgnM6HXhd
         IPcNo1N3TH0ffgAPEZfE6/3SykqOMyhRB/0zeVEBjaPal57huFkThcNYTHIkKOM5eHA8
         kzNg==
X-Gm-Message-State: AO0yUKXAI1s3xzCCB219n1KqIznjDOu8gnWukU8mmFSMv9iwWURIYXAH
        1JbkmPuJuPMWsyg6awoe/im/tA==
X-Google-Smtp-Source: AK7set8ikkvZZf7TXTkJukfEeckPkijXLHgfxgwnRKuVSD1YYtvJoZJgwmtEdIezc9dtM9QuAdPb+Q==
X-Received: by 2002:a17:906:d8c:b0:92b:e3f0:275f with SMTP id m12-20020a1709060d8c00b0092be3f0275fmr8812587eji.40.1679325435938;
        Mon, 20 Mar 2023 08:17:15 -0700 (PDT)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id q21-20020a170906a09500b009226f644a07sm4548250ejy.139.2023.03.20.08.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 08:17:15 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: defconfig: Enable QCOM eUSB2 SNPS PHY and repeater
Date:   Mon, 20 Mar 2023 17:17:07 +0200
Message-Id: <20230320151707.1842171-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
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

In order to have USB 2.0 working on Qualcomm SM8550, both the eUSB2 PHY
and the eUSB2 repeater need to be built as modules.
So select them accordingly.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5029ff92eb68..87824cc1604a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1308,9 +1308,11 @@ CONFIG_PHY_HISI_INNO_USB2=y
 CONFIG_PHY_MVEBU_CP110_COMPHY=y
 CONFIG_PHY_MTK_TPHY=y
 CONFIG_PHY_QCOM_EDP=m
+CONFIG_PHY_QCOM_EUSB2_REPEATER=m
 CONFIG_PHY_QCOM_PCIE2=m
 CONFIG_PHY_QCOM_QMP=m
 CONFIG_PHY_QCOM_QUSB2=m
+CONFIG_PHY_QCOM_SNPS_EUSB2=m
 CONFIG_PHY_QCOM_USB_HS=m
 CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
 CONFIG_PHY_QCOM_USB_HS_28NM=m
-- 
2.34.1

