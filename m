Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 508516F9A84
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 May 2023 19:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbjEGRUs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 7 May 2023 13:20:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbjEGRUr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 7 May 2023 13:20:47 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5170411552
        for <linux-arm-msm@vger.kernel.org>; Sun,  7 May 2023 10:20:45 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2ac7de2b72fso42890781fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 May 2023 10:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683480043; x=1686072043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M/5pOupv+/kvkx49PpIkwAf4CCXzUUa1iRSgEDfB2Bo=;
        b=zH3v1112yeSDEBiV7yhjERrpyO+AgDkRPv4aF54awBRDwT98bmi2Nx86biY4uBVP5k
         xsSIgEEPVwG6flsjJOwo7cAYzza5BjEnsBv+LQ+ve6MZh+/IgAp4YHpqHRv8usQuJUQo
         vFamnmdkUrcoHOJtZWpoIZDi8SnyixJWIa1bPgcCcRzCFjxQiAXZyiv3IvV5jeGigubh
         PKkQ4ECTRtNDlY0nrbhHT6zc9rSnFHhbF0yJo9nmAIQD58nuv6A5n+pncqn2WsLc8v3W
         iFmGD6uTnjuPZ561ZLeLLT1BfjgjgKSZKm8yAPMmz64Hfg02N0NEtgHQIqZlyq68ydY9
         i0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683480043; x=1686072043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M/5pOupv+/kvkx49PpIkwAf4CCXzUUa1iRSgEDfB2Bo=;
        b=fmSL8W5iM3GKg9wZhAMck3MmSCE0HIIh/R7Ow3UyeJIcULy9V1XWlrhNwRdQijngNC
         mzQtCbb2eUJ27WivydeHynznuQZBQIbBtduE/oUPsK8WqWXLpgcORyVi5LziYxlRC8r+
         GR7ifs5qvb68FaOd94cqOXRuRtf+0m/Ra3nwWzNYrAtHbepotSZsq04uK/wzJBOiRrWs
         AajRSc+W1GrEjgi7CgcQcnoGj7KN+BnvVUE99DSYSqkdh6dB3LSBkzNgMYDPvgTWjtQI
         SR17eEIYxqF0yYbIyxXkoNb3GnDGP3/mN464NKwj0hw74w0imxXm/RJw3pP+fx1OnOkF
         IzyQ==
X-Gm-Message-State: AC+VfDyRputnQlrHnyjhAfpoXc4GAFYykqPnooshj4H6h3OA/F+VpMqE
        paJwRDd1vww33m5jtd9UOP+1xA==
X-Google-Smtp-Source: ACHHUZ4zT0S8OQd/CfK13BN8dZVv75uAk+rfuEFzFc1ESTE11Wk0qjSheblxNSbXN5N/TsGL9UD0iQ==
X-Received: by 2002:a2e:a3d8:0:b0:2a8:c1bf:5ce2 with SMTP id w24-20020a2ea3d8000000b002a8c1bf5ce2mr1875797lje.7.1683480043385;
        Sun, 07 May 2023 10:20:43 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id d12-20020a2e96cc000000b002a7e9e4e9dcsm877363ljj.114.2023.05.07.10.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 10:20:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: [PATCH] remoteproc: qcom_q6v5_mss: support loading MBN file on msm8974
Date:   Sun,  7 May 2023 20:20:41 +0300
Message-Id: <20230507172041.2320279-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On MSM8974 and APQ8074 the MSS requires loading raw MBA image instead of
the ELF file. Skip the ELF headers if mba.mbn was specified as the
firmware image.

Fixes: 051fb70fd4ea ("remoteproc: qcom: Driver for the self-authenticating Hexagon v5")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index ab053084f7a2..1603c5be44c8 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -477,7 +477,11 @@ static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
 		return -EBUSY;
 	}
 
-	memcpy(mba_region, fw->data, fw->size);
+	if (qproc->version == MSS_MSM8974 &&
+	    !memcmp(fw->data, ELFMAG, SELFMAG))
+		memcpy(mba_region, fw->data + 0x1000, fw->size - 0x1000);
+	else
+		memcpy(mba_region, fw->data, fw->size);
 	q6v5_debug_policy_load(qproc, mba_region);
 	memunmap(mba_region);
 
-- 
2.39.2

