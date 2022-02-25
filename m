Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A12C4C4F60
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Feb 2022 21:15:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236024AbiBYUQL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Feb 2022 15:16:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236043AbiBYUQK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Feb 2022 15:16:10 -0500
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4937E2023A2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Feb 2022 12:15:35 -0800 (PST)
Received: by mail-il1-x12f.google.com with SMTP id q4so5240102ilt.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Feb 2022 12:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vj/W5XS6HVqNQijF0TxsmTuehT9DxzRkoqLx906rHIM=;
        b=Mxn8YgkVkM1NAMOHsI5/Evv7qtSJv6/K7jCFjq4seUaGTlzuQsVRcHPdmGB90sClDz
         S3hPrn1jRtmjDHaRqn2rMgvvfQFI8Qdy06vvH/1v0jfktxZrf8X4ssMZdmrD+L3oavnG
         i5tCmh7uJk1pBSq52eS98VuFujt1yOgFtOF+9EyZzFpwUdvVd3i/aN5UnqhToVQBnCRB
         2IH09cJ6FYGqJ7LH6tIUlgAoGZhZMI8jaDp+fMyebZV1pK2zsZSes2p4hovnrzMU4rJ0
         tPbwIFQEUXcco+DkbN6NQ+YQ67zspnMsrrn00FEG+gf0K8UOUQQS6sOzy9+bE5UB3UkD
         iCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vj/W5XS6HVqNQijF0TxsmTuehT9DxzRkoqLx906rHIM=;
        b=U77VVWFGNDImfFsP7ciL/LAgIX6Va8046QkVg8Af3fyGvG5RLotDtlMCw7xFtulWA/
         omUXcLCz5qAsJwybx+37zxD/+9L3f0wO40HGGiY9I8+KY9WxbMUH8yc3xqBbd39KXved
         Y6Qcv3Re1ZVnU3CAXIQN2is8iJoAtqmlupFm27Egbn6XXxtRSNvUj6O48RMNwbYAUUEN
         1UcpwJSjSx+yKhdOfejElkQKMzz369vFUSOGWHjUfZ9bvHstx4BnWejlMo1WubMMHeuS
         554rhS7S1HZtAMFLxp0Mt7s8Z75Bkt68hBpGW5FfrtdLxn+7qlcaRM58zpXFvC5xBoR9
         B80Q==
X-Gm-Message-State: AOAM532inBAGVNNR379kQ8EM7nklcQpFpSx3RVM6qDPQu3VNuXRpZqIT
        LycDYDRj/P3chvtYTc/yJVNllQ==
X-Google-Smtp-Source: ABdhPJy8DFOwVj/VbIrrBosIJ3nw4eHyrvgZRJn5JpQwpU8L0+W+sYtDdyHjhCx6tiNJqBmUNXTikA==
X-Received: by 2002:a92:c990:0:b0:2be:4192:79d8 with SMTP id y16-20020a92c990000000b002be419279d8mr7140965iln.29.1645820134605;
        Fri, 25 Feb 2022 12:15:34 -0800 (PST)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id v17-20020a927a11000000b002c29e9b5186sm2241799ilc.43.2022.02.25.12.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 12:15:33 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     rdunlap@infradead.org, bjorn.andersson@linaro.org,
        mka@chromium.org, evgreen@chromium.org, cpratapa@codeaurora.org,
        avuyyuru@codeaurora.org, jponduru@codeaurora.org,
        subashab@codeaurora.org, elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net] net: ipa: fix a build dependency
Date:   Fri, 25 Feb 2022 14:15:30 -0600
Message-Id: <20220225201530.182085-1-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

An IPA build problem arose in the linux-next tree the other day.
The problem is that a recent commit adds a new dependency on some
code, and the Kconfig file for IPA doesn't reflect that dependency.
As a result, some configurations can fail to build (particularly
when COMPILE_TEST is enabled).

The recent patch adds calls to qmp_get(), qmp_put(), and qmp_send(),
and those are built based on the QCOM_AOSS_QMP config option.  If
that symbol is not defined, stubs are defined, so we just need to
ensure QCOM_AOSS_QMP is compatible with QCOM_IPA, or it's not
defined.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Fixes: 34a081761e4e3 ("net: ipa: request IPA register values be retained")
Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ipa/Kconfig b/drivers/net/ipa/Kconfig
index d037682fb7adb..e0164a55c1e66 100644
--- a/drivers/net/ipa/Kconfig
+++ b/drivers/net/ipa/Kconfig
@@ -3,6 +3,7 @@ config QCOM_IPA
 	depends on NET && QCOM_SMEM
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on QCOM_RPROC_COMMON || (QCOM_RPROC_COMMON=n && COMPILE_TEST)
+	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select QCOM_SCM
 	select QCOM_QMI_HELPERS
-- 
2.32.0

