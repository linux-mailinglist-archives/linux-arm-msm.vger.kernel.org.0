Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2B6865DBE4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jan 2023 19:10:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239897AbjADSKW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Jan 2023 13:10:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235418AbjADSKW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Jan 2023 13:10:22 -0500
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA1FC1DDF1
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jan 2023 10:10:20 -0800 (PST)
Received: by mail-il1-x12f.google.com with SMTP id o13so19859468ilc.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jan 2023 10:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8FAYOoZlV85IsIHNRYn6JbF3crw7qgzdxYaheW3nilA=;
        b=urwDLjqo6Ai8B7JnKOiLTbBm5ymoqcBrHSbzmF0Hr7Y99Y6jEcPwNJi9PQtbSow7BN
         Dx2jl/ooHqN4ybnadVwEyk4FM+lHQ0/xHLPmDoTuBbPCffv8a3aFx97uTg6mTzYrjo9c
         uyxGcR8Amk7RiXp3Kk9cAYxZsDK5QjUlFW2gJvAU3dmiNiH7u6wSs58kW+srX8MsMeK8
         Xz4NdTr74rvmxjUBfKUvKItmzheRgjTyzhMYS2sHfwtF3bRiXFcmN0Rv+4nGgm/VBsQA
         6dQ0AwFMiVGvQ0j0QGTWjpIH2d1yXMl+08sHQP+ljYyEEHI21XjMDfAraLi0ONA89hkB
         5QMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8FAYOoZlV85IsIHNRYn6JbF3crw7qgzdxYaheW3nilA=;
        b=7dttVAghmWb95pMqhdGVkXZjPviq+0bCYgmqDe9oU5O7aCyosO22py4qckEIhhry+m
         CoJVe92zbXhi8dC5vcoXlxOTWqD1nafChRmM4Ff4uoh62Ad6s3zD2JpepjWxIQrf8c5Q
         FjwYuCLQELuYC2ei+Kt//iLCFxZEk4eaVJqI27LrFGpSXGm6V8MPBtCjhSE0XyrbyChl
         l5KRkkc7R4y5kFv/szjn4VHEKI2pTQfV2jlK8/JesfpWGwv90Xpx7XvvW9NszCkhcYfo
         nAY1bbqrVY77OJ9hDz2zRsJ8U5WqJi8yUEgCxQBLZXh4rTM4Xzu4a+E1QYXatmxV/tpM
         rvBg==
X-Gm-Message-State: AFqh2kpfXPO47Tadge7EucwcYkKI8EZPULHIO3tLWe6BrQKkAgL0MMWZ
        Nv+QA/IgfeUC/2u1hEQVEsMhPg==
X-Google-Smtp-Source: AMrXdXvYXHTT4J8rdsO8OHxvmzKWVWoqYGkz56LHThn+EgM64BjPB9/dMBdn8kX0uEpgjcu+HeSLpw==
X-Received: by 2002:a05:6e02:96b:b0:30d:7aaf:894d with SMTP id q11-20020a056e02096b00b0030d7aaf894dmr635268ilt.22.1672855820283;
        Wed, 04 Jan 2023 10:10:20 -0800 (PST)
Received: from presto.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id e14-20020a02860e000000b003712c881d67sm11113553jai.164.2023.01.04.10.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 10:10:19 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     luca.weiss@fairphone.com, konrad.dybcio@linaro.org,
        caleb.connolly@linaro.org, mka@chromium.org, evgreen@chromium.org,
        andersson@kernel.org, quic_cpratapa@quicinc.com,
        quic_avuyyuru@quicinc.com, quic_jponduru@quicinc.com,
        quic_subashab@quicinc.com, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: ipa: correct IPA v4.7 IMEM offset
Date:   Wed,  4 Jan 2023 12:10:17 -0600
Message-Id: <20230104181017.2880916-1-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Commit b310de784bacd ("net: ipa: add IPA v4.7 support") was merged
despite an unresolved comment made by Konrad Dybcio.  Konrad
observed that the IMEM region specified for IPA v4.7 did not match
that used downstream for the SM7225 SoC.  In "lagoon.dtsi" present
in a Sony Xperia source tree, a ipa_smmu_ap node was defined with a
"qcom,additional-mapping" property that defined the IPA IMEM area
starting at offset 0x146a8000 (not 0x146a9000 that was committed).

The IPA v4.7 target system used for testing uses the SM7225 SoC, so
we'll adhere what the downstream code specifies is the address of
the IMEM region used for IPA.

Link: https://lore.kernel.org/linux-arm-msm/20221208211529.757669-1-elder@linaro.org
Tested-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: Alex Elder <elder@linaro.org>
---
Note:  This fixes a commit that first landed in v6.2-rc1.

 drivers/net/ipa/data/ipa_data-v4.7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ipa/data/ipa_data-v4.7.c b/drivers/net/ipa/data/ipa_data-v4.7.c
index 7552c400961eb..b83390c486158 100644
--- a/drivers/net/ipa/data/ipa_data-v4.7.c
+++ b/drivers/net/ipa/data/ipa_data-v4.7.c
@@ -357,7 +357,7 @@ static const struct ipa_mem ipa_mem_local_data[] = {
 static const struct ipa_mem_data ipa_mem_data = {
 	.local_count	= ARRAY_SIZE(ipa_mem_local_data),
 	.local		= ipa_mem_local_data,
-	.imem_addr	= 0x146a9000,
+	.imem_addr	= 0x146a8000,
 	.imem_size	= 0x00002000,
 	.smem_id	= 497,
 	.smem_size	= 0x00009000,
-- 
2.34.1

