Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2428552FDB4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 17:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236334AbiEUPVL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 11:21:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355355AbiEUPVB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 11:21:01 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C00FEB49F
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 08:20:57 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id y32so18792348lfa.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 08:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tuq5sCaVtmkjPi9RkbWXYl4iAUGc0Sy3jGc43YOB5ng=;
        b=XSSUpkcW9971TKaNxpF6fFOpwgiEom2zBmy2y8AKhh8QjjCVxUpSiyBQ35HRtTTLUG
         PML7YtP1qCZhPjG7gE4i0ZRchCx1FNms9jn718vP+a5Laa7NM0RXwBYqxUuf5w5c2aur
         3heJ8SePuPGvrsXZYLlJRHwL7qSGPX3OdbLuaQN5Z4AX5haMYkAJ7SjTgzCSBQzbqkbc
         aBnz1HCoj5O0byRISNOa9wZMRW4qaQM9Ju/04NObSnA9l56QKN0F9flK3x5FgCNKi57i
         PsKfElY/lortPfg3ciZst3LNQI/HJsXXtuVuEJjFXvfk+M183DShw6nHnPllTsx43GZo
         dQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tuq5sCaVtmkjPi9RkbWXYl4iAUGc0Sy3jGc43YOB5ng=;
        b=RJWS4POl/qD0wW1BKcKB6A/XkAyf+P8DKLgpJ913ZNSo81yvweqVGY3l1NLbnOuCOU
         nGFUe+drqwR1fm+KapCK7VGP/DHw9MaF6wYx7IfzZXrYvBQadE6lQXehdGGu7j7gCFSX
         mPF2tcI9B/h1GJwyISQM9QxfOkG7yXEzGjczd7zOmV2kpmW2JQxjZ09EtxT3+/xupd/5
         nyjtAzWS7qV+lbZTNwCt1ogG3kn6hCE2gIMfiqK7WGcgspPMPX+ZXjkL++YRcg+HKD9s
         9rYf9Tpw/R/4RUPnREm6IHLOD/QKalsEZXfCd+koQbiPJag/Is0KXbIeJdR91xl3FtY2
         FEcg==
X-Gm-Message-State: AOAM532kIgCAfFYxgz7JKw1iKC6F5lhDva0lVsuciA04X8fNey4/Cwme
        uHwglBjPtLOkB3cis7lXOEyvrQ==
X-Google-Smtp-Source: ABdhPJyIMAexTQEk1MKaX2t94SdwWyx/q24fHvDshpynvSQOYQwjbia8S1JFqQ2bCCHoa/sMDRi2Gw==
X-Received: by 2002:a05:6512:3b14:b0:477:cc51:b2c3 with SMTP id f20-20020a0565123b1400b00477cc51b2c3mr8600131lfv.263.1653146456117;
        Sat, 21 May 2022 08:20:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([94.25.229.156])
        by smtp.gmail.com with ESMTPSA id k8-20020a2e92c8000000b0024f3d1daeccsm739933ljh.84.2022.05.21.08.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 08:20:55 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v6 03/11] arm64: dts: qcom: sdm630: disable GPU by default
Date:   Sat, 21 May 2022 18:20:41 +0300
Message-Id: <20220521152049.1490220-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220521152049.1490220-1-dmitry.baryshkov@linaro.org>
References: <20220521152049.1490220-1-dmitry.baryshkov@linaro.org>
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
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 8697d40e9b74..e8bb170e8b2f 100644
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

