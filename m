Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14C8C6AD3CD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 02:22:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbjCGBWz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 20:22:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbjCGBWy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 20:22:54 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30E2697
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 17:22:52 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id k14so15189838lfj.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Mar 2023 17:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678152170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v2x8CT0qC69q7YoY7JhCMWzXWvhAS15Aiyex8pxnv7E=;
        b=RQdubjvBLAVFreilW44I42iQiHFUhj1JbyenLwezjpLlLVlGhy2HWQWxrGj74EeQ7H
         QcR4HXjUoRM2gjf8O5gXoG93Uar0xzDxgKOuFCz0iyqBToqHIGJSQdI78e2vj9QZLEay
         QdVnOdJH387WGiXeRRZulzPsl4Dr7xIRsQ11gXmAUoOvvW4G96DN/4lM7UVTuyh6MJz9
         FIzFUz7cbKkqByIZwefZCb0EyHI62Mw9nTrwjoCDhKUQ/mxEAlkgFRpM3BZ++KEUO4jp
         6JZEvduDK1Je8SojN76prW4Ln4U2pad5U1w8ND2n9Ez/Co/wvUilJKuarXR1CV+yxDZH
         Ubpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678152170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v2x8CT0qC69q7YoY7JhCMWzXWvhAS15Aiyex8pxnv7E=;
        b=qFSO32LSV/8m2Fd/mzy9F2ZQgbNKTM/zC+1dn/YhYftr38gYW8OaVAHDHwCaGqeoNy
         KL85c8YQ2jQ7Yn5jhWs0Czo47kb5JimyVubzCufr62wy3fHDAuqGGo7/tPpHzVN1aTi1
         sfihVOaFehQGzSnELz4f4FBxquaniAo1o6Lv9DMX625EC0UYo1yydOejkKOo3wq2xEcZ
         rU7u8i3zhDTq3S0RxCd5P8qYhE1D6+cpaLQcdeiGpa50pYH8j0ygeF8A5yd5nFo1VORI
         uTSB1+uTxq3CQkzDRqzra+Tbte54sQnHzWluZ7IinJUOx/zxRujDMUDiR9aE+ovc+Y4F
         FEzw==
X-Gm-Message-State: AO0yUKWb+U6PUVEpQFjzNLjsetCgqPJvT75/1Yq5ucqqX8IriAGM0RYU
        O7QCCY8I1GyWJXRiD5V+KnpbdedW6rydWTcfiDI=
X-Google-Smtp-Source: AK7set/Wo1Bhvg6d91uy/i9lev8howJuGnZgjPUqpM2a4K9IBOjlWDJyG/BbkIgCqi1LhJ/QsW5k/A==
X-Received: by 2002:a19:7506:0:b0:4dc:790c:910b with SMTP id y6-20020a197506000000b004dc790c910bmr3198637lfe.20.1678152170215;
        Mon, 06 Mar 2023 17:22:50 -0800 (PST)
Received: from localhost.localdomain (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id u28-20020ac2519c000000b004dd7fefd2c8sm1819076lfi.242.2023.03.06.17.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 17:22:49 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: qcom_scm: Add SM6375 compatible
Date:   Tue,  7 Mar 2023 02:22:47 +0100
Message-Id: <20230307012247.3655547-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.2
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

While it was introduced in bindings, requiring a core clock, and added
into the DT, this compatible was apparently forgotten about on the driver
side of things. Fix it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/firmware/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 916a0c2fc903..2e8961c84b68 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -1494,6 +1494,7 @@ static const struct of_device_id qcom_scm_dt_match[] = {
 	},
 	{ .compatible = "qcom,scm-msm8994" },
 	{ .compatible = "qcom,scm-msm8996" },
+	{ .compatible = "qcom,scm-sm6375", .data = (void *)SCM_HAS_CORE_CLK },
 	{ .compatible = "qcom,scm" },
 	{}
 };
-- 
2.39.2

