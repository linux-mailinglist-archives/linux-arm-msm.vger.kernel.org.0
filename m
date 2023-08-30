Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8764078D85C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Aug 2023 20:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233793AbjH3SaQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 14:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242959AbjH3J66 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 05:58:58 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E94B61BF
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 02:58:54 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9a58dbd5daeso577876666b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 02:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1693389533; x=1693994333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YiPebw8AUtBAZvoypQvt5yInW2ANFxoq7EQf9ASV7vY=;
        b=s6elejCV4+5kSfaPRqHegiqr5GFI3SCWy9NZYr5YTxxXG6C63BOSEvnVYitnpHHDM4
         wBtgTxf6vihYtqYfL44a2/9Mys1oDZRFzyubjJjd0LJgvzXxF12H8+WUKvWyeTT+GJo6
         mzmGT21xDlji1M8gOVJobc0Rpe3LJFcvh9KIVVMy/3LsbFGerKkvGw70y1p7q2tfLOQj
         JVyzO/5D9mhyyyiM0x+TmU1jTi16PutieJab0Xe4YcaPRS7UMAtGRj1/1RA+7D139pO4
         zVWEjR45g4ds5jN+CyqwtBj/RcVlpgVeFV+MVZ9v1dsjpsWa8hpQFNDVgXrsoPZRuH0Y
         39rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693389533; x=1693994333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YiPebw8AUtBAZvoypQvt5yInW2ANFxoq7EQf9ASV7vY=;
        b=MOeYT5RyZVmxPJc4tvOEm7VNtjwEK2U2Gkpam1/zkoi/tq1xE19G7ktLpbz/ZCTR5Z
         KYRhtV4ibYeGmXrGX2BHLk92SjcfjBLlfuwRwxSyyfGAMaJESn+Ygs054nFcaG71tNXR
         v73wx+F1/G8w4tJvVX/vRnUpYAb1x+a6gIEwKjctlZXI0pzAYwVJE+x3MJCeEZTdmQ3p
         KdShZTFyClzQFhfAzJqy0juPgx8DTEOFkf01elLyqvPxLLgGmTqIMZoVJdlEPqeKGHC8
         6kiPvTvpMEu3MjDC6XJmN9EUMJyRLVtYlF+4nEwqHumFbRbWQou1erwjk8MTkx6mU5lW
         6TIQ==
X-Gm-Message-State: AOJu0Yz3OTWsTxnR4RRfmmF/qyvcDSDq+qIUEKjfFbhyw40lB4mYruwb
        joLpQbEZf375PCpfD5q+J0Bg/w==
X-Google-Smtp-Source: AGHT+IGJ3YpGP6qiQhKnwFsK8nLNTZdelqdfUpDmN15ez+b2NSkb/FF8/LNows39kAq7P5yJeDksbw==
X-Received: by 2002:a17:907:2c59:b0:9a1:bd86:3acc with SMTP id hf25-20020a1709072c5900b009a1bd863accmr1248612ejc.12.1693389533533;
        Wed, 30 Aug 2023 02:58:53 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (5073ED84.static.ziggozakelijk.nl. [80.115.237.132])
        by smtp.gmail.com with ESMTPSA id i15-20020a1709064ecf00b009a2202bfce5sm6957130ejv.118.2023.08.30.02.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 02:58:52 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Wed, 30 Aug 2023 11:58:33 +0200
Subject: [PATCH 08/11] soc: qcom: socinfo: Add SoC ID for QCM6490
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230830-fp5-initial-v1-8-5a954519bbad@fairphone.com>
References: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com>
In-Reply-To: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com>
To:     cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add SoC ID table entries for Qualcomm QCM6490.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 497cfb720fcb..649732bf9f88 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -389,6 +389,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id_named(SM8450_3, "SM8450") },
 	{ qcom_board_id(SC7280) },
 	{ qcom_board_id(SC7180P) },
+	{ qcom_board_id(QCM6490) },
 	{ qcom_board_id(IPQ5000) },
 	{ qcom_board_id(IPQ0509) },
 	{ qcom_board_id(IPQ0518) },

-- 
2.42.0

