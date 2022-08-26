Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBC305A1E13
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Aug 2022 03:22:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244222AbiHZBWH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Aug 2022 21:22:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242730AbiHZBWF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Aug 2022 21:22:05 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A939DC6E81
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 18:22:03 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id 142so164832pfu.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 18:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=xYTu/skGP38f1q1Dy1/xZQnsGWW6M+Lwk/V98c8nDu8=;
        b=JpF/+LgYMZNVlZzZkRsCU4B8eY4IAOMRYjG+0+dOUsTnzvH+xpvG8RkdRizvPNEVR/
         0rS2ucyTxq9BKlqt16xAymDVrA63ezwAzCtsvzi7jvyYXnpEkrQSOigH+W+drEVQ7dAW
         yF3n8St7jBCp0pZ5Ne2HeBzF8y65aAsGd4atY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=xYTu/skGP38f1q1Dy1/xZQnsGWW6M+Lwk/V98c8nDu8=;
        b=sHVgRZRKAecV6/qr95qH6P/Ot6KuTc6uA/o1uud7WnyslfE+9eoLlwzO9fbzT1ThSy
         vJsS3ErLLoB3ZCdslFjeAVGCp42ddALXWQCZ5otrpGSYEirVlK7Wn8jtiSw5WD8yDdTh
         kOBIiWlHqhwegM5B/NlADJedvVeL5d/90AjrWIXfVAufdMEgpE9X+VKrpJZkfVjYnyHl
         t6vHfgp5h29a3Ceb+27t36ReS+okZy+1Q76c++s/BUc8in+mCZld2fW83hZLsAXqWSId
         UhdNVrfksuRGeegA7RaM8HdJsDpev2nf5fa/exrezq4r5I2RquCkLA/nLF06myQzXy/0
         9OpA==
X-Gm-Message-State: ACgBeo3SFtonpbVGkqmfFwhfgvXzObxSsTqq1re7bKHEIAUcK95SB9Bd
        WNdeJ+teuQspwdzleoQkP9o8Dg==
X-Google-Smtp-Source: AA6agR4Z/EoRmqFd1BdKNTESfOYrPjKNqvkrv1ei2EB6fomnI4F/yHLbtdbye+ABKOdFbrSXghBapA==
X-Received: by 2002:a63:4c3:0:b0:42b:5150:fcfa with SMTP id 186-20020a6304c3000000b0042b5150fcfamr1407615pge.210.1661476923185;
        Thu, 25 Aug 2022 18:22:03 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:d529:f79d:2a1a:4e61])
        by smtp.gmail.com with UTF8SMTPSA id t9-20020a17090a1c8900b001f8aee0d826sm354685pjt.53.2022.08.25.18.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 18:22:02 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Johan Hovold <johan+linaro@kernel.org>, linux-clk@vger.kernel.org,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 1/2] clk: qcom: gcc-sc7180: Keep the USB GDSC always on
Date:   Thu, 25 Aug 2022 18:21:58 -0700
Message-Id: <20220825182152.v2.1.I45235b7c40997bc2abf813e4722b4dcdd6aecf6b@changeid>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When the GDSC is disabled during system suspend USB is broken on
sc7180 when the system resumes. Mark the GDSC as always on to
make sure USB still works after system suspend.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
I'm not entirely sure that this is the correct solution. What makes
me doubt is that only msm8953 sets ALWAYS_ON for the USB GDSC. Is USB
broken after suspend on all the other QC platforms?

Changes in v2:
- set the flags of the GDSC not of the GDSC power domain
- updated commit message

 drivers/clk/qcom/gcc-sc7180.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
index c2ea09945c47..c0d7509a782e 100644
--- a/drivers/clk/qcom/gcc-sc7180.c
+++ b/drivers/clk/qcom/gcc-sc7180.c
@@ -2225,6 +2225,7 @@ static struct gdsc usb30_prim_gdsc = {
 		.name = "usb30_prim_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = ALWAYS_ON,
 };
 
 static struct gdsc hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc = {
-- 
2.37.2.672.g94769d06f0-goog

