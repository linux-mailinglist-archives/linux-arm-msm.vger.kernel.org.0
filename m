Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB63750C430
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Apr 2022 01:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232045AbiDVWQF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Apr 2022 18:16:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232047AbiDVWPu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Apr 2022 18:15:50 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 045D731AAB5
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 14:06:27 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id z16so9082196pfh.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 14:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6/iQfuLXFC8ki26IOGLQhuyEO0Ix/0UGaDfitMH3V8Y=;
        b=Sr6SteOrCBE2XsI59QA6RWqy9vn4XJeeVQ0JpUmiAp5JFOl39N6gthheZHnkLUQJyv
         /wAAAt+YizHnKAW5WByOLMPlJk+hXqqqpeoFmCovpahKNEl+R/UNWI7khiiXpxCnZZkH
         KVI53yGcUPgiA5MVVytWJ4xA1nRJDw2b0o7OKSXafuXmWHGnfBYzk9dy80hICVlT7IXc
         BVE96MwUO416MBd/IedjzPnKWPuWhq6a621gEi94/vCNTzzH4L4U0EmcJWWIRS7v8IVc
         +qVPcjm2bjhvkGxMccktJnN+1guINiaR0Hj4zyIZ81jZTMMGKuecMnHU8BOcguJJqrEZ
         QpPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6/iQfuLXFC8ki26IOGLQhuyEO0Ix/0UGaDfitMH3V8Y=;
        b=cNTs3tX3cmckh7lr5T8ImBJdUE6aF1keI67215r1hzIv+np24v9IsAEMkfewTzsrmU
         Tq/Pnfu7sBp538bkZ9mi14cW5vsZ6O/KeWvh4/zotqgD0OXge/dxPxVddRLWJ91+STjl
         vBWqyIlT62XvgbxvTXbVs/gBc7xo65m3Gl5xn8VEEUpZHzlPfWjWJy7dawJoQPB7tKAa
         KhWyi1x+feXVgBaTth7tbvBVflJr93xcDROvWbinyoEVi/35jm9EcobdpK+sNlbF/OYC
         qlv7JqBEHkzImmT3K6N+bQNBH18TOqaZpx55vhTLmfpY24RCXcxHGEs2uaboOW1sfc0K
         q/uA==
X-Gm-Message-State: AOAM530Ltr0bp1cjQXWbGhhIfPV73ve7GJ8nlxNwBwyOUrurRunvtCJh
        sGrnKvQl21DNYsSPagp9xYQ+0A2F00Kxlw==
X-Google-Smtp-Source: ABdhPJyXVzSqZwF9kIf3hmhU+RIUMpb6UXowxQK44fBDY2TDf1w6fCJwplsnEe6IZrvXIUSK7+mZPg==
X-Received: by 2002:a05:6a00:7d4:b0:50c:de96:a6e7 with SMTP id n20-20020a056a0007d400b0050cde96a6e7mr6923886pfu.45.1650661586373;
        Fri, 22 Apr 2022 14:06:26 -0700 (PDT)
Received: from localhost.localdomain ([223.233.64.97])
        by smtp.gmail.com with ESMTPSA id lw3-20020a17090b180300b001cd4989fecesm7391641pjb.26.2022.04.22.14.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 14:06:25 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org
Subject: [PATCH 1/1] arm64: dts: qcom: sm8150: Fix iommu sid value for SDC2 controller
Date:   Sat, 23 Apr 2022 02:36:11 +0530
Message-Id: <20220422210611.173842-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Fix the IOMMU sid value for SDC2 controller, to ensure that no
ADMA error is observed when the microSD card is detected on the
SA8155p-ADP board.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 2700a8145cb9..f70ae4c56762 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3555,7 +3555,7 @@ sdhc_2: sdhci@8804000 {
 				 <&gcc GCC_SDCC2_APPS_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "iface", "core", "xo";
-			iommus = <&apps_smmu 0x4a0 0x0>;
+			iommus = <&apps_smmu 0x6a0 0x0>;
 			qcom,dll-config = <0x0007642c>;
 			qcom,ddr-config = <0x80040868>;
 			power-domains = <&rpmhpd 0>;
-- 
2.35.1

