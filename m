Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D14375B6AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jul 2023 20:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231708AbjGTSYb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jul 2023 14:24:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231821AbjGTSY3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jul 2023 14:24:29 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18642173A
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 11:24:10 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b70404a5a0so16788601fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 11:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689877448; x=1690482248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yJbGKInlejV3VBpG5lEDNq2UlayrlJtje9RzPRt66/k=;
        b=lUXvfFB/TUTP9i4ubj+/XnDoC2z0EeSV4kj8IPHoFxmNTzAZ2sOtVt6ZjpD4AK/Jtr
         P9yoiJnwNdDYtgeUSadSscna6eWzWoWdj+lT4h+sqUalqPpyf/NtUqpvGxiUMEYiqSc0
         e/naKrZE3sJM27pDBT5OEewYfnx7PeO7RsA9veLGYX+9AEeyJY3F4XGVtBNV5vUGkR/C
         Fz4uD+WVdU+8qH66tX0QJLDnkTv/xV8ohza82S7kTfRDC0pUKH9eS6cKM1g/KRhiaJ7o
         TaEjOThGah/45S6sfsa8UZdU2XLAmv+CdFt/Z0H0a+0oMMC4a0IxccPphGEpcYst68ST
         FKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689877448; x=1690482248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJbGKInlejV3VBpG5lEDNq2UlayrlJtje9RzPRt66/k=;
        b=PAKen3K7yUJRnswvaAEiaEtSzNFKAAw1dJMAOMelir4wILUJpiYaqNLaqK/ECriq+I
         ABwfydiVLad5juC7I4cx0sZXI0BPnBkhBdzNGqYQmChH8lGfP8zNCi4jNvtyTOPsElRJ
         VRxOszlVNfy4Si/e0z2nX6nGIdem8iynbwlLL4iwTSGQLgAW3r7hzxnM8IxjUG91CqM3
         IUW2ZHQFuPsg88DJMcv+T1Sxj0ZjGu+gRjAI43PtA/cLh1OYsbO+d3zHQM6XUni/ZBUh
         tyVXtXkXP3jgH3TzQr/mB5a/1Bcpl202MPltbJ8pqHdMknyF1BJI0jZ/qNovOOYPH3mu
         cTDQ==
X-Gm-Message-State: ABy/qLZ+4T7QeR1Pa+hXv9IcC3BeJufhbNoSDFcWat1oqPWkU8ToRspf
        Wb+vdHQHfDPs7C5acypqmYjvWpWhXcmnc0mXAi6SLQ==
X-Google-Smtp-Source: APBJJlHV1QHpzsg80ARmHDESJiKhl5IF5JagGcUDVuYGprI5a6So4BFnkaUdKnPLxqlrI8RqgACZPQ==
X-Received: by 2002:a05:651c:d7:b0:2b4:6eb0:2a27 with SMTP id 23-20020a05651c00d700b002b46eb02a27mr3212817ljr.17.1689877448302;
        Thu, 20 Jul 2023 11:24:08 -0700 (PDT)
Received: from [192.168.1.101] (abyj181.neoplus.adsl.tpnet.pl. [83.9.29.181])
        by smtp.gmail.com with ESMTPSA id g23-20020a2e9397000000b002b31ec01c97sm428304ljh.15.2023.07.20.11.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 11:24:08 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 20 Jul 2023 20:24:01 +0200
Subject: [PATCH 2/2] interconnect: qcom: qcm2290: Enable sync state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230720-topic-qcm2290_icc-v1-2-7f67f2e259c1@linaro.org>
References: <20230720-topic-qcm2290_icc-v1-0-7f67f2e259c1@linaro.org>
In-Reply-To: <20230720-topic-qcm2290_icc-v1-0-7f67f2e259c1@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689877443; l=848;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=2/Oo4HuXZdKRBcTWrVM14eHjkhJTowhQs8f0byzlaxA=;
 b=2gODwk7mWvcrH5TQAE0U2G2K/SvZ95dPHXuYPuK3g+M4nAEtnVC0r7SxHnKOKLbIiCVrjsW36
 WuqFs51GY1ADgmVf+qN+a2iYVWXF4g5plMugYznKlk5iAxPCiI/xHId
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Very surprisingly, qcm2290 does not seem to require any interface
clocks. It's therefore safe to enable sync_state to park unused devices.
Do so.

Fixes: 1a14b1ac3935 ("interconnect: qcom: Add QCM2290 driver support")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/qcm2290.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/interconnect/qcom/qcm2290.c b/drivers/interconnect/qcom/qcm2290.c
index c22354f3e667..5bc4b7516608 100644
--- a/drivers/interconnect/qcom/qcm2290.c
+++ b/drivers/interconnect/qcom/qcm2290.c
@@ -1364,6 +1364,7 @@ static struct platform_driver qcm2290_noc_driver = {
 	.driver = {
 		.name = "qnoc-qcm2290",
 		.of_match_table = qcm2290_noc_of_match,
+		.sync_state = icc_sync_state,
 	},
 };
 module_platform_driver(qcm2290_noc_driver);

-- 
2.41.0

