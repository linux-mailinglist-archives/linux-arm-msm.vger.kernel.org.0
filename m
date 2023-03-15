Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9A5E6BB8F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 17:02:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232167AbjCOQCz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 12:02:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232942AbjCOQCe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 12:02:34 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5250187A0C
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 09:02:14 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id j3-20020a17090adc8300b0023d09aea4a6so2328976pjv.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 09:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678896129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NzfnJ/fl2EOzAuf3MTrOySXsOi45cg44bO61w+XqodU=;
        b=JCyL/2azMQT8TR2/0Oh7RhfDNYsdJYPC5P5lM+jjQD/1hyZkaOMo59ZOHUVgQ6bUP4
         zLeCq4Sad/f2NXYv9xctUzJwdRD0CO1UpOAwI6pmi7eNcF+G0aWtdo3574SQlhzm02ZQ
         d7biN7johrGfUDPh96Mn2Ttj/FmbrZhiHImaKNEUCCDKfMpyGbQkiqQ0bjIgSUcQTvjn
         4j3P5tv5NklC0/CUO9OiDo6oMGuSXhLIMDdqwn/4+Isfu2fAE8x3I9T97aGXKzYWljOQ
         2iozRk76Nv9PldAJEdEpMkMLdT5E3+FgKy1/hkyfLTqado3w5bpfFoDPpt7URASHTnpt
         cTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678896129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NzfnJ/fl2EOzAuf3MTrOySXsOi45cg44bO61w+XqodU=;
        b=0l+qq6cxghRB0QvFprU32gyVIvEDGHbA2E4ceKsnS75lgic0xEpMRN67ZeVtMP2M4z
         fbQaLdyhs3PHUJpMs79UXmEfTiYjFjn2FRflqflPXo+L4MVJFNbVFXBc2Efz9Nm7f0iQ
         PagbeHt6V05D9HG07WDHrTHocOpv2Ochtc2c5447xKWzLD9GWoKmQwuGn87hRI8jR16F
         hwe6PwBFc98JWI0XakfVr76vk3zA2b4lPG1hp1Y/XKJUn1QSJDrxHZnBaHob915QROHu
         H5clx3bzVy4QWEMmheST6QwNE3Kjsz+49kyfm5C7vuIT99h6l+f1vEEdffBtzM3GaagT
         hb0Q==
X-Gm-Message-State: AO0yUKUAZuO9L1IjvPKmiEKmBy6w/Bqc869CViPcQgKnvh+xY+j4NT9Q
        /KcAt8iq0riRSisESNzvt6JVL6N0IEf71zBRjkc=
X-Google-Smtp-Source: AK7set+DwWhs0BqEGWSy2aNG4vjhj0iL2tYjxNAji0NOiSYrG7Bh4yq42ZuWovwE0vNH32pgebJ9mw==
X-Received: by 2002:a05:6a20:7d94:b0:cd:c79:514b with SMTP id v20-20020a056a207d9400b000cd0c79514bmr511744pzj.2.1678896129266;
        Wed, 15 Mar 2023 09:02:09 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c61:1acb:9af6:bd7f:78e7:7ae6])
        by smtp.gmail.com with ESMTPSA id o1-20020a655bc1000000b00502dc899394sm3457170pgr.66.2023.03.15.09.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 09:02:08 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org
Subject: [PATCH 2/2] soc: qcom: socinfo: Add IDs for QRB4210
Date:   Wed, 15 Mar 2023 21:31:51 +0530
Message-Id: <20230315160151.2166861-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230315160151.2166861-1-bhupesh.sharma@linaro.org>
References: <20230315160151.2166861-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the ID for QRB4210 variant.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 89081ec34dbac..fcef116ffc25a 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -447,6 +447,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(SC7180P) },
 	{ qcom_board_id(SM6375) },
 	{ qcom_board_id(SM8550) },
+	{ qcom_board_id(QRB4210) },
 	{ qcom_board_id(SA8775P) },
 	{ qcom_board_id(QRU1000) },
 	{ qcom_board_id(QDU1000) },
-- 
2.38.1

