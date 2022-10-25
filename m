Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93D5B60D4F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Oct 2022 21:51:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbiJYTv5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Oct 2022 15:51:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232402AbiJYTv4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Oct 2022 15:51:56 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 597AB106A72
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Oct 2022 12:51:50 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id b79so11407406iof.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Oct 2022 12:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KifJwYm2J4wmA/ryKiExPDIUq5ZgsA0XWIcfAcXckDw=;
        b=AzhqEQxy38tnrpHWl3m17NBt7Vpd28ILazW48sWm3eymf46kVobx1Dzqs7FA3X0yRp
         l6BSkD3KVC7b9sDw3Ah0TjpifpJoeiyljvtG2Yld0c9ShsJDfZtw3HtT8bKAybXT+eEq
         MM/7wWD+RrGN2GpGJJ2xAyixXBgDZOTSCnkSM4F2J3u8zp4ff37N7EjDAPu5erzMx2YG
         PizQPMYBomLufXMWOeWrGk58Rgra7/ckO69nMcUXgtBgLviAc2wPRkPX9DFLSbFE1gWP
         3QgIG9vp8ehCUgv8R0Kz1B9aNF2z6tBhRqKb3j+3zR26s8ar4PmOERxykf8HI5yX5qML
         QVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KifJwYm2J4wmA/ryKiExPDIUq5ZgsA0XWIcfAcXckDw=;
        b=iPzjGPMwD6RIyu/241CMl7jQtMzGK3dSVThPY1+L3Q7MBIrkP7YlI2t+2Betl8o/g1
         eTbQ8sdk8xiXZfMVCDoOsLLa/v6dnqkb19TulEMaVj0kX6JPtxvTk9KZlfdkOE8sl3Ee
         1nHu58CrV2L/dk1shZeyUe9v+7JADLDhYJGaxGRabCsfZ6PjRckaKrYD0UWgb/LfRH4G
         wlanKvPvys3clRNKvDxs6yKOB9a5xOfbAxfoMWHmGui8XBbbmbTGN0YqH+LnonsQvjEh
         VRXJgZx+p7hwlTjc5a36YQ/ZBQoH9lYzg1jeDUnsfS0Y38d/sm9S84UUTHfH+XAvdXqu
         K6JQ==
X-Gm-Message-State: ACrzQf3vMJm6Zo0X7+x7weqhT/NJ+okxkzcSrazy2teEtdAMAvKgP/LL
        VNoko2CO/VHA97IRGKF/ZiBh2g==
X-Google-Smtp-Source: AMsMyM7qxpmz8WvoeDvhc9mOywqCGFqzNUqateWYVncIOfZr6tBq7Y68i5HFAanYcAmmgzuijdI+Jw==
X-Received: by 2002:a6b:ba55:0:b0:6b4:de08:ee55 with SMTP id k82-20020a6bba55000000b006b4de08ee55mr23276948iof.148.1666727509415;
        Tue, 25 Oct 2022 12:51:49 -0700 (PDT)
Received: from localhost.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id y10-20020a056638014a00b00349d2d52f6asm1211719jao.37.2022.10.25.12.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 12:51:47 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, andersson@kernel.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/4] net: ipa: don't use fixed table sizes
Date:   Tue, 25 Oct 2022 14:51:39 -0500
Message-Id: <20221025195143.255934-1-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently, routing and filter tables are assumed to have a fixed
size for all platforms.  In fact, these tables can support many more
entries than what has been assumed; the only limitation is the size
of the IPA-resident memory regions that contain them.

This series rearranges things so that the size of the table is
determined from the memory region size defined in configuration
data, rather than assuming it is fixed.

This will required for IPA versions 5.0+, where the number of
entries in a routing table is larger.

					-Alex

Alex Elder (4):
  net: ipa: record the route table size in the IPA structure
  net: ipa: determine route table size from memory region
  net: ipa: don't assume 8 modem routing table entries
  net: ipa: determine filter table size from memory region

 drivers/net/ipa/data/ipa_data-v3.1.c   | 19 ++++----
 drivers/net/ipa/data/ipa_data-v3.5.1.c | 27 ++++++------
 drivers/net/ipa/data/ipa_data-v4.11.c  | 17 +++----
 drivers/net/ipa/data/ipa_data-v4.2.c   | 17 +++----
 drivers/net/ipa/data/ipa_data-v4.5.c   | 17 +++----
 drivers/net/ipa/data/ipa_data-v4.9.c   | 17 +++----
 drivers/net/ipa/ipa.h                  |  6 +++
 drivers/net/ipa/ipa_cmd.c              | 21 ++++-----
 drivers/net/ipa/ipa_data.h             |  2 +
 drivers/net/ipa/ipa_main.c             |  6 +++
 drivers/net/ipa/ipa_mem.c              |  4 +-
 drivers/net/ipa/ipa_qmi.c              |  9 ++--
 drivers/net/ipa/ipa_table.c            | 61 ++++++++++++++------------
 drivers/net/ipa/ipa_table.h            | 13 +-----
 14 files changed, 123 insertions(+), 113 deletions(-)

-- 
2.34.1

