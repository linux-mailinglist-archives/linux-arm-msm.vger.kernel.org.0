Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF85154BE12
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jun 2022 01:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357490AbiFNXBn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jun 2022 19:01:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357467AbiFNXBj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jun 2022 19:01:39 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 209D7532CB
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jun 2022 16:01:38 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id v17-20020a17090a899100b001ead067eaf9so455026pjn.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jun 2022 16:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anholt-net.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RWlMcK/WiHaE2lupDQgc+icrhgmdMQxgOsPbDDDl0aE=;
        b=rxZaCTVb83tYMLMGAxqk8WP2FjGYRIoCovnvFYKSSOhMElgtlaDdZdSZMKPgSK4Yvo
         rC52cpeIJXo1GGTArDPxTrvH2g0j3p7QIUY5w78AbPKw2KsYXheKA8zc25on4qL9jc7k
         Pux+AQFyh9bQxZS2Av8mD7rxozr+inA00Hb7dAzDh+Di3oqIzFrchKq0vkDUvlbHaxek
         DRfGsep2dsYUDMjpJWrl4htAQKqUQVJIsWTNYxGeAn5KVIyPZqHF/KFc4lT4YMeLJIf5
         ry7iVS607W8w4IYMtJIee9psu43QKUIBJbDZIHwrUeV5l21LlnXFp0dg9U3JNTJh/a2F
         me6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RWlMcK/WiHaE2lupDQgc+icrhgmdMQxgOsPbDDDl0aE=;
        b=8OmKatKGP+f6pvpZknYCmDUGUDJOOcjyCQGr5J6TUIme3ZVtHUpffO7zia1j3YNNWI
         gqbKzB6OONNTPy/NsuFRxU/qmzx4lkR6k5EdHcNkDI9xYi8G4xPyQjZkO/8WpkxJgIFE
         2GuFL55Zl+C2MlPPPdFuZYp1QSQr/2fD4/mxKPMCtoHjK24nwn7h7wwG8jI81/aK6XOH
         aoZJvuPlPBC5Wda5wlDWmJvDemt4iDP0anKtPkLPzavn0Q6PqyFCjCX6QVgS8nTMAJdO
         sKf2Vy//ZP6wvzdM8QkXBHquK+Z8R5l6jLWFbriAyjorf6O8cQYuDMsC9JmF4/9UXqKf
         Oxpw==
X-Gm-Message-State: AJIora9PsBzkcTg+xOpIhS3kPShSWAeI+R+YbBbN+AkWt2eSTLp9gtXl
        3W92JwV5K3rwj/zeJUAi61BuKg==
X-Google-Smtp-Source: AGRyM1sug/F5zUgorGwld6/cvjxSjJ3Ba76jZNwLVen3RaltHSazhsqEJzh8eunYtM28ILlpP5FJ5Q==
X-Received: by 2002:a17:90a:a605:b0:1ea:6b4f:915e with SMTP id c5-20020a17090aa60500b001ea6b4f915emr6825913pjq.60.1655247697545;
        Tue, 14 Jun 2022 16:01:37 -0700 (PDT)
Received: from wildbow.anholt.net (97-115-79-125.ptld.qwest.net. [97.115.79.125])
        by smtp.gmail.com with ESMTPSA id cp15-20020a170902e78f00b00168c5230332sm7787768plb.148.2022.06.14.16.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 16:01:37 -0700 (PDT)
From:   Emma Anholt <emma@anholt.net>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, Emma Anholt <emma@anholt.net>
Subject: [PATCH 1/2] iommu: arm-smmu-impl: Add 8250 display compatible to the client list.
Date:   Tue, 14 Jun 2022 16:01:35 -0700
Message-Id: <20220614230136.3726047-1-emma@anholt.net>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Required for turning on per-process page tables for the GPU.

Signed-off-by: Emma Anholt <emma@anholt.net>
---

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index d8e1ef83c01b..bb9220937068 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -233,6 +233,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,sc7280-mdss" },
 	{ .compatible = "qcom,sc7280-mss-pil" },
 	{ .compatible = "qcom,sc8180x-mdss" },
+	{ .compatible = "qcom,sm8250-mdss" },
 	{ .compatible = "qcom,sdm845-mdss" },
 	{ .compatible = "qcom,sdm845-mss-pil" },
 	{ }
-- 
2.36.1

