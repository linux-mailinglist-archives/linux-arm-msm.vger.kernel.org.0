Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C85FC526F28
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 09:15:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbiENBlb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 21:41:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbiENBla (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 21:41:30 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 033E93AA23B
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 16:45:54 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id h29so16995511lfj.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 16:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i1goeg2wYzcHMfXO9CDFGJF9XLqANUBaSoksUz5XNRc=;
        b=DOh4ydj8Vt+P+KC3rNmfFvdd0RxSWIf5d7MsrKn4wDhhzx3X5T4v0Z5B+/KH6TQyOC
         bGYJ/c6Lqw9kO2xadkgrLqAkhe6CJ+68tMTQRRAIFiEWzrUuWlatl/Iw2NL0p5nDCQF+
         /bqJrNpu4ZsNn1NtGnNo2osR7rrqQZZFEz29Odxr0g+uI1SxDqN/DoVvSkgHEIfvrT/i
         Jz3WxFaCB6VpSDlx1dvE0sc4j3yXm3XbFY5XUPcWEkO2XVgTJgjNCNaejgD5ztMbIYVn
         21ejXb74zhGuJ+0JTGTo/nxdKWC3aMrHXAdTj95+aOuGrAcLEepLD7zoAXBLJYqtBex7
         caJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i1goeg2wYzcHMfXO9CDFGJF9XLqANUBaSoksUz5XNRc=;
        b=grmIC+538vL/5R2or+ZwM7EZK+4aju0ETuBWKMvcyvtYK2zj5q4t7xNMEtXDoP5Zaw
         fy0b3d20PbHaluvyxlwzJosV0DSIoI6HwjUktBa3xife1qtn3275K0mMHAPOwlaJQuHs
         lxs+TN8JAp2Jzv969Xqi4ih1rHZH8IuUM3Gjvu4gflG4Q+lLj9ZNELNiiS9PNE35lJRR
         Jp1v+y2eahPk1T21HfQDmcIkMicUGE6iCAF3qlcnsp67ZJyzhvEmhIbxYlFpAAffP9E4
         IH+gYUMknxde86zXNAN4pbPLq31LrXC9CK9QVz1dHRpJAbc9plxRWmsyjkGNpMOYVyp9
         /j5g==
X-Gm-Message-State: AOAM530f27FbXu5Y5mm7sxVx4FqxtKE9LToZ398xp2QQQ34GcLj5NnlR
        zvqOFHDHNkKv7DVSevau30igE0lOdEKIIw==
X-Google-Smtp-Source: ABdhPJzuGCarikvO5ii1GxPSc5tz+D29jM0wDdsYs0FLCL+VY4bt1vgxhr6toc81lM9HG2h9qHZVDQ==
X-Received: by 2002:a05:6512:33c5:b0:473:d0c5:dd03 with SMTP id d5-20020a05651233c500b00473d0c5dd03mr5014216lfg.605.1652485522004;
        Fri, 13 May 2022 16:45:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o8-20020a05651205c800b0047255d2118csm527342lfo.187.2022.05.13.16.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 16:45:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 3/8] arm64: dts: qcom: sdm630: disable GPU by default
Date:   Sat, 14 May 2022 02:45:13 +0300
Message-Id: <20220513234518.3068480-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220513234518.3068480-1-dmitry.baryshkov@linaro.org>
References: <20220513234518.3068480-1-dmitry.baryshkov@linaro.org>
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

