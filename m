Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3D063F27C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Dec 2022 15:16:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231470AbiLAOQn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Dec 2022 09:16:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231773AbiLAOQj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Dec 2022 09:16:39 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AB1EC6E71
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Dec 2022 06:16:38 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id o5-20020a17090a678500b00218cd5a21c9so2167106pjj.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Dec 2022 06:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9z15GcvNuRMNo2BN/9lRT8Q5BhNXbMviW/S6PD92K0M=;
        b=SHoQhPFJ3XyXWJgXVxmO7wu2YTqgDSWfvNfeW370fWnYzaYu1QaSwAUmr4x0ksAx8P
         mT2lHH5Tg4fagALN9RqqSXxobR39W/JnRxTjSHEBl4Jk4OmSSnn9Uc4YW2LDrgP+MWGd
         1f0JS5qm4AftYIUU454/ACbxDpvh/CkogI3alCVBv6v6QP6MrJebsUoHpTX8vR5ALDR4
         KCO4zhenqo/DGRl6XAJ3HzaxnqD7cuB+iNCtFAeH2y8Rxos6B7CVfUaN7tm+gsxAIPA/
         ABeA0I76PersCtwiK4M7nrUYh2t5keuW6Ya5EFGZ/aRjMDP7tc2quRhsiH/deIe+fPNk
         96qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9z15GcvNuRMNo2BN/9lRT8Q5BhNXbMviW/S6PD92K0M=;
        b=8BNTbbKOtkKLXO8WjB50sFugqoEQGKVwcQFGiZYRtG34VEiSOzVChXnvP26M582COg
         NVc72k5E2LnQ31MGe83IqRreTVqxvFknLUYQOoz8Qme5Hf+FLQvFy9ZPrjfdD0NEx6JA
         SrbTCKn7e0wTzPL7ESJf1bCnP6tcAJhTFOKUfPE/QLggyhzTA5RIgUNwWKolr/h5K1Xn
         nA8HVq0CGaFtEUwVfM7y4ky3sKcCuShwDRel4TPCuz6Jwn755e58uATPMk2SbsgkR4UF
         LObTXpmQqEysjvmYA9yxbGRdoe1mmZnVtoqGDtEkOBWqTWTLx4blGSceTZJbZcY/vCaq
         i9UA==
X-Gm-Message-State: ANoB5pmiXAhvCDPiO0NNoU/IqAHk1R6jPpy/NsEm110ts5Y6rUJAAmLP
        Rvi+YYpCk3gocRg+PbUjp7pKVjTDhng+Nw==
X-Google-Smtp-Source: AA0mqf61oU5Em0iyGfYt0eGOn2HIev6wP3V7ev+tWGJit0sNvnU76MYg4nbdtInKpxdUKaVql6Zr3A==
X-Received: by 2002:a17:902:8bc4:b0:187:2790:9bc2 with SMTP id r4-20020a1709028bc400b0018727909bc2mr50317178plo.61.1669904197688;
        Thu, 01 Dec 2022 06:16:37 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1c61:2814:c945:522d:e948:beb1])
        by smtp.gmail.com with ESMTPSA id f2-20020a170902ff0200b0018975488514sm3663041plj.126.2022.12.01.06.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:16:37 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, bhupesh.sharma@linaro.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski@linaro.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        a39.skl@gmail.com,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 2/4] soc: qcom: socinfo: Add SM8150 and SA8155 SoC IDs to the soc_id table
Date:   Thu,  1 Dec 2022 19:46:17 +0530
Message-Id: <20221201141619.2462705-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201141619.2462705-1-bhupesh.sharma@linaro.org>
References: <20221201141619.2462705-1-bhupesh.sharma@linaro.org>
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

Add SoC ID table entries for the SM8150 and SA8155 SoCs.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/soc/qcom/socinfo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 545934aead43..92b27db60840 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -305,6 +305,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(SDA658) },
 	{ qcom_board_id(SDA630) },
 	{ qcom_board_id(SDM450) },
+	{ qcom_board_id(SM8150) },
 	{ qcom_board_id(SDA845) },
 	{ qcom_board_id(IPQ8072) },
 	{ qcom_board_id(IPQ8076) },
@@ -315,6 +316,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(SDA632) },
 	{ qcom_board_id(SDA450) },
 	{ qcom_board_id(SM8250) },
+	{ qcom_board_id(SA8155) },
 	{ qcom_board_id(IPQ8070) },
 	{ qcom_board_id(IPQ8071) },
 	{ qcom_board_id(IPQ8072A) },
-- 
2.38.1

