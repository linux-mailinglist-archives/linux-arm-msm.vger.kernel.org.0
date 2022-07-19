Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6DA857A629
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 20:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239946AbiGSSKt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jul 2022 14:10:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238338AbiGSSKr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jul 2022 14:10:47 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AE905406F
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 11:10:30 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id f1so2292357ilu.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 11:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g+HjSH1OT4ZSTM+eXDsDJSu3gPtVsd7iXr5tehMDAHk=;
        b=GHdqy9jwnxqOSDBsP91TeeCtjW2CEr8BcF4twe6kX3kictIQcvbYlfaH/OghejF6mH
         jwhhslPX6XiVzOkR4asjq1sG0dIcK+lyG5uWWqbyfYkF2WDM4qy48S5pLQPTXzl7pnn9
         9TBcOW98nIa6gU0oKAqRhHGxwZrqqJNna1Qyv43MVJIfP/5plnE9yXH2fc7Rtybgu+Nx
         VbrESdeHqySuOt2QdJB+hHPh2dzInHmXPdRzRpwJNq2Pdesnc3b7wYoKkjjE03CZ35O4
         DnrFTQ2M3aLWTvMyDGcN28usWf8a4GABrds/ykzDmUhhA/YxQo6B6dmS76P0GbDS8j3R
         bnbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g+HjSH1OT4ZSTM+eXDsDJSu3gPtVsd7iXr5tehMDAHk=;
        b=rtch78/MV1tdrydf1Tkd63oH4bHtMLtyA78jAiCeMFLNZSynH2Ex7ECihWDWn8H88r
         YQNCLD57Oz/9rGfdvz7jcSCPzhWHOWNQnrdPU3Cd8Q6VZ+J5gAYgA7Ivh6MSC6pMyM3s
         pkqm+DDZy2HeC+X6ZFxFguDqzpJEC6nx5LY/lp48+8UKxI6/OZ35uiVi4GIasrW4t5GT
         9fvv9Wu9k6/m/D0PObIflphuSuHJmpugQYSZc3qcsH2p01Ku1EdoR+MFLkYgFfJHWjI9
         yKMbm1s8VnrneT5YBI/ll3AzAmqkDQbYPeqCg6d9IIY6BhD6wB9BbqF7v9hAa8oyoMYt
         rklA==
X-Gm-Message-State: AJIora/ynwLUdoLtmK58/1FwJulZGJ0KvzkAq60hv1UAbypDvM8fqYnA
        eOl7St/XF/LhKVzhz5LcGeDlqg==
X-Google-Smtp-Source: AGRyM1uHKrocN4CdjfBxEuzXdoxSqvRVIcF8w3G7sFbu5gzkImHx+JcjlbyeUGkiqmWs74UGS4SgmQ==
X-Received: by 2002:a92:d64a:0:b0:2dc:fa9f:7b27 with SMTP id x10-20020a92d64a000000b002dcfa9f7b27mr3197376ilp.173.1658254229837;
        Tue, 19 Jul 2022 11:10:29 -0700 (PDT)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id f6-20020a056e020b4600b002dae42fa5f2sm6089552ilu.56.2022.07.19.11.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 11:10:29 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, bjorn.andersson@linaro.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 4/5] net: ipa: report when the driver has been removed
Date:   Tue, 19 Jul 2022 13:10:19 -0500
Message-Id: <20220719181020.372697-5-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220719181020.372697-1-elder@linaro.org>
References: <20220719181020.372697-1-elder@linaro.org>
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

When the IPA driver has completed its initialization and setup
stages, it emits a brief message to the log.  Add a small message
that reports when it has been removed.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index 3757ce3de2c59..96c649d889a7c 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -836,6 +836,8 @@ static int ipa_remove(struct platform_device *pdev)
 	kfree(ipa);
 	ipa_power_exit(power);
 
+	dev_info(dev, "IPA driver removed");
+
 	return 0;
 }
 
-- 
2.34.1

