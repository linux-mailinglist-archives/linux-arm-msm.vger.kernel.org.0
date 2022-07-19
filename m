Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B31857A1F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 16:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239406AbiGSOkc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jul 2022 10:40:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239397AbiGSOkA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jul 2022 10:40:00 -0400
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5B593CBD2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 07:36:01 -0700 (PDT)
Received: by mail-il1-x131.google.com with SMTP id h14so532062ilq.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 07:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g+HjSH1OT4ZSTM+eXDsDJSu3gPtVsd7iXr5tehMDAHk=;
        b=UVl5ZgQLGmxFULFa7NUHhaeZ2fz4c8pq9g4BFufL+0iUBbmDyK9e3n6HQWUumFARad
         5ZltrdcLyVRosi7dx1A1pI6FIklKe0PkVClF53+JouXSsUQR0FKnCWKS5Q4YVp489Cow
         FXt7Z/GrVqyUwWVLuTS6jb+k88Z/BtYCtvuc5kz3ASHUOV4S1B4HGBjCVac5ieHhrKQG
         Cc3xpeH42FvQOpFYnKn5bqXCCv7ozEsRqNOHmxkjAhqKzoEsKXK9h9Xny3FFOENcjrB6
         x31ANOLdamX9/DaJ0RfZ1D3lUcqhzbDML0y0r09Vmyt0liAzinGoU0evtmXS6Ik5Bryf
         moDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g+HjSH1OT4ZSTM+eXDsDJSu3gPtVsd7iXr5tehMDAHk=;
        b=rnuFRbsH5BloWK8kxrMQ3CsDxjsrHzlumsA5e541oYzO+0gbdRk2dI6Vz71l4MKouk
         Bjk2BhWAKJVqzmUkqtawArYvCtuEGoD9l+5AqBok46ttnt9e6tgYNffDAG5lDArpgqyp
         8OG77SWBJPIo63ffZRIWKb8QkI7ox9gb3mvqMzoI48FjnznXqT+4xsvko8/MEicRxlj2
         raH7Ftn6w000/VSuZpw9G8mWBLQMTBxrtpeS7SiwCaOBS+fLtH+vNxojUXGhlZbr/Tgd
         MSw4/96r4T2Snfe87sXwOcwzpHF1Zloh/GspU0jWDnTk3/ure/0D3VDHMfhVmLhnZHdH
         SvHQ==
X-Gm-Message-State: AJIora8MAV3RL6WoszEQ8y0KDNWbyNL2Wcax3BKjSw5U9w0bRtf4HUxV
        kHjQouOlSQ6VKCQI8SLfvE1nfw==
X-Google-Smtp-Source: AGRyM1sj0ex0FAXdt3pBqnlnyH9HM6+drp7gvBcpR7wLH5QwVYV6EWHcF0uQEucv+yluBk4Sc4VnAw==
X-Received: by 2002:a92:6603:0:b0:2da:82b6:34a3 with SMTP id a3-20020a926603000000b002da82b634a3mr16275124ilc.250.1658241361376;
        Tue, 19 Jul 2022 07:36:01 -0700 (PDT)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id t16-20020a056602141000b00675a83bc1e3sm7286559iov.13.2022.07.19.07.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 07:36:01 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, bjorn.andersson@linaro.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 4/5] net: ipa: report when the driver has been removed
Date:   Tue, 19 Jul 2022 09:35:52 -0500
Message-Id: <20220719143553.280908-5-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220719143553.280908-1-elder@linaro.org>
References: <20220719143553.280908-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

