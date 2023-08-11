Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E167778F16
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Aug 2023 14:18:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236133AbjHKMRK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Aug 2023 08:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236396AbjHKMQx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Aug 2023 08:16:53 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08E273C19
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 05:16:21 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b9338e4695so29807871fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 05:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691756152; x=1692360952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=scoeTIYy4vb5EgheFAepiFWqi4fXeq1lFa7JMfWYqi4=;
        b=C5hjA2S/Uccx24YZCltvH14WW1DjSgehLr2zvEQ1zUpYLvp3Ep2058M7NUD/fJGVzK
         e2XH3FuUjUGSCMCKGE8UbXPsSJyr266p/higTc21BDWeZ/m6QeBr7Z127hQcuKGMQm72
         KJOL9opmyXTRykWJGm2Y6o41dhy7hnmD0ctwV/rrEWseng6GJEEjMlnRXQPn2Whtjf73
         3FQAwBYlL5YlGWGvW14+omJmvN/gheBRiurkr4HOQCIz0xIHh0xEAon/DpMd9VeREqvC
         F+ikY6h5TT28GPwhHi2GWpHflDc77C2fJGCdgitJCCFrfqu5UEDw69hsHTbJhUhM4P/U
         CLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691756152; x=1692360952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=scoeTIYy4vb5EgheFAepiFWqi4fXeq1lFa7JMfWYqi4=;
        b=IzgZwMMsKd+TFEqm1q8kQJ4EL+TjJCdR2JSDFWX9SjgZIoY29d9AHv9pDE4X8dkfSX
         JMY1O939oyJ7Ma8xiQ8Sd4+cTVfuuB9inSNyqXWcQzdjiwC2839WuLcYpicjd6rEOImq
         MBK25xIacZL0BBcoM4Rs0UJ6Vgth+hKjj3owNtBXIDdxtkXZ3vlwstTlAlLRo+jHgeIl
         pJ2dHalqzdK4QfWFQiggl8CZqPEq0jpu9FFetoFYV8k/aH1NpwqxSSobyMwykJB48l1G
         vwZ++ehOQzE7oPERbx+XylSgH5b8wAwoGpu36jsXzEfdUN3B9c2C3k+RsTub+fLRki4K
         7nsQ==
X-Gm-Message-State: AOJu0YxRdMk7GZBNB+bbP70vLU3ngiLBZlvoH+/csq2K9ra/h/vzYF5x
        TOeao3CD0dlZGYz8Dc7gBzE40kXQvcyg6maD2yo=
X-Google-Smtp-Source: AGHT+IHUQj4nlzIpMERyWnRpPlm8/hRJlhu2LuR3NUI9A+k9Uov93YlmNF9lJlfR1mhihnZVThwHlQ==
X-Received: by 2002:a2e:7e0f:0:b0:2b7:344c:a039 with SMTP id z15-20020a2e7e0f000000b002b7344ca039mr1516337ljc.33.1691756152190;
        Fri, 11 Aug 2023 05:15:52 -0700 (PDT)
Received: from [192.168.1.101] (abyj188.neoplus.adsl.tpnet.pl. [83.9.29.188])
        by smtp.gmail.com with ESMTPSA id m12-20020a2e870c000000b002b9ec22d9fasm848487lji.29.2023.08.11.05.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 05:15:51 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 11 Aug 2023 14:15:31 +0200
Subject: [PATCH 20/20] interconnect: qcom: icc-rpmh: Retire DEFINE_QBCM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230811-topic-icc_retire_macrosd-v1-20-c03aaeffc769@linaro.org>
References: <20230811-topic-icc_retire_macrosd-v1-0-c03aaeffc769@linaro.org>
In-Reply-To: <20230811-topic-icc_retire_macrosd-v1-0-c03aaeffc769@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691756124; l=1036;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=d/FxCw9vPsUH66qzqeSqW0F14Dv5hGAeVeTLrU6DYfA=;
 b=9QE5KS8si/WcCOpbrLw414HVV5vapAeqBDPdSGPCaJePvsiXpQVgYDPEb06sIUCTNNw1thasA
 6zdLGvveLtKB2JHjNFvHKEXfBCdO0HaDXN87WN7arvIF3dFtHTIBI7o
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This helper has no users anymore. Kill it with heavy fire.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/bcm-voter.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/interconnect/qcom/bcm-voter.h b/drivers/interconnect/qcom/bcm-voter.h
index 0f64c0bab2c0..b4d36e349f3c 100644
--- a/drivers/interconnect/qcom/bcm-voter.h
+++ b/drivers/interconnect/qcom/bcm-voter.h
@@ -12,14 +12,6 @@
 
 #include "icc-rpmh.h"
 
-#define DEFINE_QBCM(_name, _bcmname, _keepalive, ...)			       \
-static struct qcom_icc_bcm _name = {					       \
-	.name = _bcmname,						       \
-	.keepalive = _keepalive,					       \
-	.num_nodes = ARRAY_SIZE(((struct qcom_icc_node *[]){ __VA_ARGS__ })),  \
-	.nodes = { __VA_ARGS__ },					       \
-}
-
 struct bcm_voter *of_bcm_voter_get(struct device *dev, const char *name);
 void qcom_icc_bcm_voter_add(struct bcm_voter *voter, struct qcom_icc_bcm *bcm);
 int qcom_icc_bcm_voter_commit(struct bcm_voter *voter);

-- 
2.41.0

