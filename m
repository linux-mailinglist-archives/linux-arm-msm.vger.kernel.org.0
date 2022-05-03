Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D34F519127
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 00:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243526AbiECWNG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 May 2022 18:13:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbiECWNG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 May 2022 18:13:06 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA280419B1
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 May 2022 15:09:31 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id q14so23668196ljc.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 May 2022 15:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gHeT5rA5JgsjUWOJUOsSctk80bGMlL0PN/lfBnuic2Q=;
        b=dDSK/tEKdtVxEg+ekL5vVH2hGiDqMDWXDAVzpKlyY7L9YoHTdnbz2nN0/sdjXPm5Fs
         d5mIbJBygMevb84JXeWGHAZ5voduXjir2DyIWH16uiR90QSl4xIj58IJO4Ii3LuXMTw9
         oaVStjtqCVgLcxINS8XAPPZEf+1W52ADMQq9fRZXUqgXY7T9f03+faTfbVJ8Ggm4fsBo
         9lxg0gza1uYAPQSfw6TJR6tRyh98Hc/OlDypFIcSS4BYtmpZGZi707YcaVackCQ6tPIQ
         jym8ve7p60t7v5UUM6OALMH8WX1TQ/NMesbbxajtv4Cy0bgKp0++XoFIsBNgCggNo6Ue
         zb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gHeT5rA5JgsjUWOJUOsSctk80bGMlL0PN/lfBnuic2Q=;
        b=rM9yIHLCIN1iTq3bp+Au+4iw0G3W3ZX22Vm41aFpIo3IhN2FRYD3SdohST8Ux1QD+l
         udjRApoPINVbCZrfISvaiA0ZfTdanYq6goNqtQYoaq4oGnpLcO9hXWHG5xq3WjXQldvG
         nOGKVIcgSeq7wtA6VHuw0mffA8gb93SlIg84xaaJtxWPpwhY5vN96uqp3VmoXHYkRnyW
         +e1eLiWXUmELWJsjfBmsmIVYHmfBnWIodCotHUxQYqRN9ZxevRRqZLUuaiJucV2mOoR0
         TYijmGSQ8cNTIrTzoRXy/CqA/0GnZMGwCqwqnn61mZqGhfkUTnzsfiZOSs4niZLS91wP
         S45w==
X-Gm-Message-State: AOAM531vrRTk4HFS0yksPws7mz/klR4P8b8ge+9jlQN0hrejYyg3PjAV
        uMzKt+p/h2DnVVX7n7COSOOsWA==
X-Google-Smtp-Source: ABdhPJxlXwJqd38RhfDUDQX3IC7rKHFg32YEoB4hFKGBqIjSX8ihsIqbGUlJ/nPV/ZgEU4ASQLeC3A==
X-Received: by 2002:a05:651c:985:b0:24d:c36e:f600 with SMTP id b5-20020a05651c098500b0024dc36ef600mr11333262ljq.339.1651615770193;
        Tue, 03 May 2022 15:09:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j9-20020ac24549000000b0047255d2111bsm1042349lfm.74.2022.05.03.15.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 15:09:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v1 2/5] arm64: dts: qcom: sdm630: disable GPU by default
Date:   Wed,  4 May 2022 01:09:24 +0300
Message-Id: <20220503220927.960821-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503220927.960821-1-dmitry.baryshkov@linaro.org>
References: <20220503220927.960821-1-dmitry.baryshkov@linaro.org>
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

The SoC's device tree file disables gpucc and adreno's SMMU by default.
So let's disable the GPU too. Moreover it looks like SMMU might be not
usable without additional patches (which means that GPU is unusable
too). No board uses GPU at this moment.

Fixes: 5cf69dcbec8b ("arm64: dts: qcom: sdm630: Add Adreno 508 GPU configuration")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 240293592ef9..45eaaa6a4a74 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1050,6 +1050,8 @@ adreno_gpu: gpu@5000000 {
 
 			operating-points-v2 = <&gpu_sdm630_opp_table>;
 
+			status = "disabled";
+
 			gpu_sdm630_opp_table: opp-table {
 				compatible  = "operating-points-v2";
 				opp-775000000 {
-- 
2.35.1

