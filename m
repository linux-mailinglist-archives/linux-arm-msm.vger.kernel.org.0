Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A3AC779B3B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Aug 2023 01:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237055AbjHKXVK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Aug 2023 19:21:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235628AbjHKXVA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Aug 2023 19:21:00 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 326F91736
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 16:20:58 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fe7e67cc77so4045694e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 16:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691796056; x=1692400856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AGsr4NzdI+e+j1eYd8m5yDc+5uVzYrR45CwswVYQ/3I=;
        b=CkJJexvP2VNhIMN8onso+ln7oBF6/KH8OiLZinSFDki6M9XeDJUyRz8RIQjrcVrxbn
         GL63n3TaMFT5By/CaXuZTvw8aTKwEPpZc78FuSd5mP32EjZ8+M8YSHdG6r1jl5ktq6OR
         +2TVks3CxRlVllobbGe/PiB6kzOiKescbbtEep77HsesJ5QnkIrjBXk/Ht/cQ6pYe7yn
         fil+4JP5/QwiDiolMzHk2QJ0CgUHnHkPNU0rwTB0ILrpFwJA1jSTljkup/Ds8D10Q7b7
         8QujFm1iKYHcE+gnj4e8wFVyL9AwS1dwnWBafpVSjxUYoobllkCQhnxXDAX9LNl5kYpO
         yPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691796056; x=1692400856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGsr4NzdI+e+j1eYd8m5yDc+5uVzYrR45CwswVYQ/3I=;
        b=Kilhi6mkIdD+VLoK4q7e3qnma9FCa1rVjATab0/aMSddN4ESSUu40kKu6zBMFwCyxT
         n4YNb6i3xdfJZcKuq7ZI/VBpfYNn0RDvwgJB3NE6i70XRkpYrT2aCJ076M3rxKDTmCrG
         R4/7oj4xoamlqYeN9F0IR7u8c7xgS4EXmCM4vZGggBdkhuajcg/Tvfzk/unuGE/5AKsQ
         UvuXTbep8mAOg+/D+my4sJ0/18ONlvGMcfA+m5KLmftsXHr+QQ+3N6Ixxyu3lGd61vdb
         0ZEcVcJqQINDtfEkXJvqNx0xy3uei6F9UVDIXGD6Bkr1Wdi8QT6ekLAc6P6wMhILECgf
         gzjw==
X-Gm-Message-State: AOJu0YzGdzc5T9MYhcBQfUI1nLWZNKshqteJx8VMjPlc5nsnn5ZF5MbS
        06Y97+Yffbok3s9/zcMSsA0IjBaT/tdWe13AVak=
X-Google-Smtp-Source: AGHT+IE+IS2VTcIvxQ286VQjLDhjrhtdPJWYJdrZv+DP4FUhRY7MbSmTNEYelzkH+NfjtcsA8SVG8Q==
X-Received: by 2002:a05:651c:85:b0:2b9:ecab:d924 with SMTP id 5-20020a05651c008500b002b9ecabd924mr2645685ljq.18.1691796056534;
        Fri, 11 Aug 2023 16:20:56 -0700 (PDT)
Received: from [192.168.1.101] (abyj188.neoplus.adsl.tpnet.pl. [83.9.29.188])
        by smtp.gmail.com with ESMTPSA id z26-20020a2e965a000000b002b9ea00a7bbsm1038210ljh.60.2023.08.11.16.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 16:20:56 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Sat, 12 Aug 2023 01:20:48 +0200
Subject: [PATCH v2 05/11] interconnect: qcom: sc8280xp: Set ACV enable_mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230811-topic-acv-v2-5-765ad70e539a@linaro.org>
References: <20230811-topic-acv-v2-0-765ad70e539a@linaro.org>
In-Reply-To: <20230811-topic-acv-v2-0-765ad70e539a@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mike Tipton <quic_mdtipton@quicinc.com>,
        Georgi Djakov <djakov@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Odelu Kukatla <okukatla@codeaurora.org>,
        Richard Acayan <mailingradian@gmail.com>,
        David Dai <daidavid1@codeaurora.org>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Sibi Sankar <sibis@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691796047; l=728;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=mrWKHs2cIDbYFAcEu3PbhAm7Zox3n+QJAju4DsHg8HY=;
 b=+VpNb5Re85/a5+rrOugddSme5TacJe5BaebDM2hcn/VkZbvhJ6GHSvfhfdvsDWTYwGrNEwj2t
 u2aSAaC1dsVDZRoaXrR/hk17FIvhOCUc0iFhhS6OytsiMP1BkFzQV5L
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

ACV expects an enable_mask corresponding to the APPS RSC, fill it in.

Fixes: f29dabda7917 ("interconnect: qcom: Add SC8280XP interconnect provider")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/sc8280xp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/interconnect/qcom/sc8280xp.c b/drivers/interconnect/qcom/sc8280xp.c
index b82c5493cbb5..0270f6c64481 100644
--- a/drivers/interconnect/qcom/sc8280xp.c
+++ b/drivers/interconnect/qcom/sc8280xp.c
@@ -1712,6 +1712,7 @@ static struct qcom_icc_node srvc_snoc = {
 
 static struct qcom_icc_bcm bcm_acv = {
 	.name = "ACV",
+	.enable_mask = BIT(3),
 	.num_nodes = 1,
 	.nodes = { &ebi },
 };

-- 
2.41.0

