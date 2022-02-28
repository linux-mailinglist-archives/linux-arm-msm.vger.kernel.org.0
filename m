Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 738B94C786C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Feb 2022 20:00:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbiB1TA4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 14:00:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbiB1TAz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 14:00:55 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 570738C7E7
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 11:00:16 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id i11so23053434lfu.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 11:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ndjmob5kx5R9FfK9+/Zt8Rf1qAtEW5MFPSV88wL+qT0=;
        b=g9b066xooxXDhzUUdV1cF3lgGt092oWTAlj8uoFu+9tMryoKQoF81dtgyhFv3QMq/b
         UK+yk04kqGjYAmAk4OAtqHn1F3QGCLCBJDgSmrLYNM2Pt8qeXFcOyHT+qAuK8UOGmc21
         SAZDpE4vFJVFAcx7B2S18jWW4DyfR7mzBlWRgzMiLFqFDkNo3v/3Cw/+HEYdBuxGLVBI
         eDvnl1dqKL7XouU7znepJYbkOaOfNUe+BRv/h7DcWGoSonCUviCY/1p10pg1xxy724Lx
         qw6i2k25gg138fK1HELvPHI5DsMINQxbeSSFR0eUFn97/13xrYJGnuKsE15ous6Gk0aj
         gIpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ndjmob5kx5R9FfK9+/Zt8Rf1qAtEW5MFPSV88wL+qT0=;
        b=5+maSjaJzFaukJLCMMtjmOz4AVofFopf01Tc9UBlP8oATf/JijFZOv9T+FEhl2H9Tz
         qfdIa/LlU3o8niUhF1uxOsJyzm7pMegChWtc0E1WbvuvnB2LO/z9lnwqXyTWd2DUGPeb
         NPhTMEOuhRiCxBx3kCYJbJ9UCz2R0oNI87J62yoMM3i1OBIASRhbUci7BKj5O4MzggSt
         wl3uYY/xF9iSIfwCfrdxU04GDIJd6HsC4ZieaHFeXx69Xk4HzbYBxgXca5xjWM2/vncC
         KotEB/f9HX81FTeAzO2vrDHYOb5tZURkdZ2V3NZcZpWSXTPrkoOSxQ9+GTcCiPwuC20u
         xoxw==
X-Gm-Message-State: AOAM532l22kmZ09DKy5i4PfIs0D9IE9stwcXzsFr9ti2Y4bptj34qA1i
        XKZVvPXn4cOZS2EByKbcX1JY0g==
X-Google-Smtp-Source: ABdhPJzWW0JljjtfZANrz3F7mXiXK/yGaYI7W6O1jQbnpkZsGIXYp/rvw2P1PZmyddRgiYJ991QxXA==
X-Received: by 2002:a05:6512:398b:b0:443:3b11:a985 with SMTP id j11-20020a056512398b00b004433b11a985mr13262749lfu.211.1646074814732;
        Mon, 28 Feb 2022 11:00:14 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b3-20020ac25623000000b004435fb1f5basm1089625lff.78.2022.02.28.11.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 11:00:13 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH] soc: qcom: socinfo: Add another ID for SM8450
Date:   Mon, 28 Feb 2022 22:00:13 +0300
Message-Id: <20220228190013.1790617-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add another id for SM8450.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 8b38d134720a..e648af8474d9 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -330,6 +330,7 @@ static const struct soc_id soc_id[] = {
 	{ 459, "SM7225" },
 	{ 460, "SA8540P" },
 	{ 480, "SM8450" },
+	{ 482, "SM8450" },
 };
 
 static const char *socinfo_machine(struct device *dev, unsigned int id)
-- 
2.34.1

