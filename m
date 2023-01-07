Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC4A660E89
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jan 2023 13:06:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232481AbjAGMGo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Jan 2023 07:06:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232563AbjAGMGk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Jan 2023 07:06:40 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BE3D5C93E
        for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jan 2023 04:06:36 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id y25so5699526lfa.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jan 2023 04:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szWiuzwy1ILS/TFdcNSbENvUjQTaXD04RLB3PoEYe0U=;
        b=fNTkbXHjgiesE8YD9zKl+8BIvoAhtL3TosRlBcqxSLur+dEGM8fkm2BwePckMFCIB6
         cD7YIlkBUaB9z6swTC1Xq6E1UZa/pTSjSzJiMktiEXafyySsQLdU/qfYX5aatQnBGf5l
         B/QbfTOKWeEdw2Kn0iURpqUafL9dHEu/O6cV0eQwhbmqhiGCVVwGHk1zBqX5iSkgaxZg
         LuvJrHZ5PFfPtUNub62e+DUVzQNMD564Pf7cUQHSD7iF6I2u49tQWTZ3P6fKgq0l5+wg
         FkAeDxG/ZHf8cFWmoBuZPR6dL+c5+IuTgD8Oo1CPVPCo70MPQbixG+ShkuVY2kRbonuA
         oWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szWiuzwy1ILS/TFdcNSbENvUjQTaXD04RLB3PoEYe0U=;
        b=ibZvddrJjCf4y7NiK9R0iSt7DAsisWyvljJfejng44C2DoTmzsuZV549MELRsNDBhm
         FiZA3E9RuLglQIdTH7f+gWEC0kKd8Sp/q2Hw/NktQH8JNL116vm5ib08xQn2xHtKqDx4
         OkEwtebPYB5bKhtRdop96pLNNg/OgYTBz3AnQPXUJLNTWFQ1nW1mI4LNuy5okwm1xFk5
         7/modrWI7RIPoj0x1B3QW2aNAtw5ps+HZT2cJiH9PpCsjdABeGuOgfyUcAGfnoViQfzT
         vpl56gO7JCJ8WGBR8kbiPsh7TeHu1ACJ0WIAtPRhOJ4ZZJVTVBaZnbSJPqErTtSuearf
         qpnA==
X-Gm-Message-State: AFqh2krEmvQ6s9UuHUXNXgVXEGSHCJJJ9noSzPLfolm2VfspP3zLXTOF
        0YptMdzCQAO92p/pQAToNaGD7QzAjX7BUNeD
X-Google-Smtp-Source: AMrXdXui89qwgyefRu4tANL7SHcZteDnJ0Drd+aEze6Zg+iJLoqaWoyWGKQX/n9RONOYMQvXVOGBew==
X-Received: by 2002:a05:6512:1523:b0:4a4:68b7:deb8 with SMTP id bq35-20020a056512152300b004a468b7deb8mr20059879lfb.20.1673093195000;
        Sat, 07 Jan 2023 04:06:35 -0800 (PST)
Received: from localhost.localdomain (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id m2-20020a056512114200b004caf992bba9sm551424lfg.268.2023.01.07.04.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 04:06:34 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] remoteproc: qcom: pas: Add SM6375 ADSP & CDSP
Date:   Sat,  7 Jan 2023 13:06:23 +0100
Message-Id: <20230107120623.1903056-3-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230107120623.1903056-1-konrad.dybcio@linaro.org>
References: <20230107120623.1903056-1-konrad.dybcio@linaro.org>
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

Add a config for the ADSP&CDSP present on SM6375.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v1 -> v2:
No changes

 drivers/remoteproc/qcom_q6v5_pas.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index f95e0229a6c1..d8a4ecec8535 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -948,6 +948,8 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sm6350-adsp-pas", .data = &sm6350_adsp_resource},
 	{ .compatible = "qcom,sm6350-cdsp-pas", .data = &sm6350_cdsp_resource},
 	{ .compatible = "qcom,sm6350-mpss-pas", .data = &mpss_resource_init},
+	{ .compatible = "qcom,sm6375-adsp-pas", .data = &sm6350_adsp_resource},
+	{ .compatible = "qcom,sm6375-cdsp-pas", .data = &sm8150_cdsp_resource},
 	{ .compatible = "qcom,sm8150-adsp-pas", .data = &sm8150_adsp_resource},
 	{ .compatible = "qcom,sm8150-cdsp-pas", .data = &sm8150_cdsp_resource},
 	{ .compatible = "qcom,sm8150-mpss-pas", .data = &mpss_resource_init},
-- 
2.39.0

