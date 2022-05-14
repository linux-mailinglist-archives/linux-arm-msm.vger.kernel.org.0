Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC51852745C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 23:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235516AbiENVzG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 17:55:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235562AbiENVy4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 17:54:56 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 966A22E08B
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 14:54:52 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id n10so11028604pjh.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 14:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AAcG7rX+mEnMpt5XVNtu3dX5eVwzJDr7gAFJhDONIy0=;
        b=nxxzsvWzWEKNE3cxFqH6yQ4ICQZmVH8De5uCsd8WKaCkF6jZNyxQF5xp2Cu4Z3Dzl8
         gJbC40QKZlyfSDBzP7QQzgfM4GYfhBAXQYZIgzZ80553VWgDCmhZTm9bT+D8PJugAiY0
         s461rzBlWZa2DpQpth4RfHtw9NJiAJNadeEKnD1AoIoJka+YRClOtfVi6QQL7oJ2SygF
         Z7egm0LlDM5h00heNOLguU92IlCYP8AU5ZSjjFE9Lo0FOCyO4Eq0kbvuuHQKHAJT9hO8
         lVD9KGn7KT9X1pfhdAXJoQNW+XU7Q2yZrVbRjh+BvUDtCdFUnKsJPdWJFt8w2hYG18kr
         Znrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AAcG7rX+mEnMpt5XVNtu3dX5eVwzJDr7gAFJhDONIy0=;
        b=NoKp3jYNKirGUYdNl7TkgtrdIjHdrFZrFQ1Jlbs90guLKmiM/u2yKji4cqwmtakYW0
         xIsATfJ/r7ZZL1tBPCoNJPmYxIAptU5/hrPSXxQLjcBusEI6Yj5dOn+i+HxLkFMXn8DK
         VQfGvlAZUB8lB4D+X0UEhnToOg5M02a6MtxCcNUc2rJ5aiObtHDRspFVPc8zjGn74Qdp
         DuuaW7VQWanJwb5YybL6NSF3dB6ZgsNAvrwzotBlcerHdQOJRxmE+SjrbkFH3COU+3se
         HudauQWvOWi2QJLfKabR/0+/WqCDa6OhB8eKaplnHJAfkIAz/rNhvlK4IBa0KYfoqP2Y
         lO/g==
X-Gm-Message-State: AOAM533xQjVBGu+55UcKrjt7PA4m91sIhhMmQbsR86iR4CHndHuvKhGe
        k650tGAaM+VRziNWlqggvWWDYjw8E3QtjA==
X-Google-Smtp-Source: ABdhPJwCxPIfJBC5n04iupZetTYjVESBk39k3MQPbmK94RzqJnkiGQiafVLDjd5ZEzsWsUgXEY+e1Q==
X-Received: by 2002:a17:903:40d1:b0:15e:f8ee:c278 with SMTP id t17-20020a17090340d100b0015ef8eec278mr10911956pld.100.1652565291841;
        Sat, 14 May 2022 14:54:51 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:931c:dd30:fa99:963:d0be])
        by smtp.gmail.com with ESMTPSA id m13-20020a170902db0d00b0015e8d4eb2d2sm4189522plx.284.2022.05.14.14.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 14:54:51 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        robh@kernel.org
Subject: [PATCH v2 6/6] arm64: dts: qcom: ipq8074: Fix 'max-frequency' value for sdhci node
Date:   Sun, 15 May 2022 03:24:24 +0530
Message-Id: <20220514215424.1007718-7-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220514215424.1007718-1-bhupesh.sharma@linaro.org>
References: <20220514215424.1007718-1-bhupesh.sharma@linaro.org>
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

Since the Qualcomm sdhci-msm device-tree binding has been converted
to yaml format, 'make dtbs_check' reports issues with
'max-frequency' value for ipq8074 sdhci node:

 arch/arm64/boot/dts/qcom/ipq8074-hk01.dtb: mmc@7824900:
  max-frequency:0:0: 384000000 is greater than the maximum of 200000000

Fix the same.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index ab2a1e7955b5..b2d71af9b419 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -388,7 +388,7 @@ sdhc_1: mmc@7824900 {
 				 <&gcc GCC_SDCC1_APPS_CLK>,
 				 <&xo>;
 			clock-names = "iface", "core", "xo";
-			max-frequency = <384000000>;
+			max-frequency = <200000000>;
 			mmc-ddr-1_8v;
 			mmc-hs200-1_8v;
 			mmc-hs400-1_8v;
-- 
2.35.3

