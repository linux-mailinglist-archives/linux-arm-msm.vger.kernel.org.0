Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 839F96AAA00
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Mar 2023 14:28:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229862AbjCDN2s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Mar 2023 08:28:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbjCDN22 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Mar 2023 08:28:28 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 345EF9015
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Mar 2023 05:27:59 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id d36so3868233lfv.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Mar 2023 05:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677936478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a/RYmnwCu18aIYaj6lw64sU1EXpG38sGCKjbpOsXfEA=;
        b=DZTO0TdSK8N4lqRQPkMzpOAUbyTrVd+3pEjEh0goKTFyjr3MZdElLOB9+lOTBst7VP
         yJ47JxGV6P1solRa7I/ojx1P2B2P0FOKgZ6WRAN4mgC/XSgZOu7A0V/hbdMEB77gMxvy
         Kb1d/fIljOaxt8qBTo6BJuk4lWVlhn3hIz12T7Ljhte8zCK89DkJci4l1jMjD7ilOlah
         lXQTziHc1mNy1BjosRWvtCVibpU6dVnez04xdDyPq16l1o/8YLyJcV4zMbumRCmjttep
         aaKV3n6yty86JgA47q2+IGzLjtHyBuF45r79+ffPlwnxYMOCMLebD6vV6TqvjK50elrZ
         rVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677936478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/RYmnwCu18aIYaj6lw64sU1EXpG38sGCKjbpOsXfEA=;
        b=jx9bu0rTRF9GmWdaOulCpafe+p53h38vJaCNNQsluvUqERwLvGAoOw/b4ObXh2J6yM
         tied/AgNBDwLOQheZZdH6odSjhHssb0UgSxfPndPvHo1n6xmLib1gXjJHsANxu7NLYUr
         xTLOb8jL8qF5hxDTVjoK6wRc4nGVlPXbVehy2NXY8lg0wqf7LNXKNWoBxoprBvY8E6DY
         kmHdG7I/QOvBgnKYyVZuaBqUeYPWN3glMYMv8zDwH7vXtZ18z2cauw8GN0HVLFyvgqtk
         pxjYFOnzckDsSnZgk1ytu/5MwVUw++D/u+ONF2qFfySwJykW8NluqBFvLWvcCYlZrxwD
         1mLA==
X-Gm-Message-State: AO0yUKVExGVhFgHp492Zwe7Q+e+iqXl3jhNJVzHynw/BvPpLMyccQFad
        zyN3Qxm9FFe0DYe9uOty37vaUg==
X-Google-Smtp-Source: AK7set9EpuXK2CgzpSu0tQO7kD1sXbbn3mWkowXw/sGcEiouKjdplqvGE0EOspf8BEN8I9krCJNslQ==
X-Received: by 2002:a19:c209:0:b0:4dc:537c:9229 with SMTP id l9-20020a19c209000000b004dc537c9229mr1587929lfc.30.1677936478739;
        Sat, 04 Mar 2023 05:27:58 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id j15-20020a19f50f000000b004e7fa99f2b5sm342975lfb.186.2023.03.04.05.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 05:27:58 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Sat, 04 Mar 2023 14:27:49 +0100
Subject: [PATCH RFT 14/20] clk: qcom: smd-rpm: Add keepalive_clks for
 SDM660
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230303-topic-rpmcc_sleep-v1-14-d9cfaf9b27a7@linaro.org>
References: <20230303-topic-rpmcc_sleep-v1-0-d9cfaf9b27a7@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v1-0-d9cfaf9b27a7@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677936461; l=779;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Rb3QVu+NO31acEP29f3lE6nekr2heNfaQYlZU4A+bEc=;
 b=9bPgW8Ir6yVRwUGSc/35oIyuUGCsCSDL2Idq3MSYvOrTOZPZGOUaZqnzw5AivwnTNJE43pP8OfLX
 cxob95m2CUtfKHkyqR0/hqK/0uKAKrS9ZRe7tXSSr7SON/Ga7lt0
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SDM660 requires that the PCNoC clock always gets an active vote.
Guarantee that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 6649f13c741f..7e1814f606e9 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -1042,6 +1042,8 @@ static struct clk_smd_rpm *sdm660_clks[] = {
 static const struct rpm_smd_clk_desc rpm_clk_sdm660 = {
 	.clks = sdm660_clks,
 	.num_clks = ARRAY_SIZE(sdm660_clks),
+	.keepalive_clks = cnoc_keepalive_clks,
+	.num_keepalive_clks = ARRAY_SIZE(cnoc_keepalive_clks),
 };
 
 static struct clk_smd_rpm *mdm9607_clks[] = {

-- 
2.39.2

