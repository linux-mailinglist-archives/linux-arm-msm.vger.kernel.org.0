Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD5CE57A2A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 17:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237817AbiGSPIi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jul 2022 11:08:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237543AbiGSPIh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jul 2022 11:08:37 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 531BD50192
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 08:08:35 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id v1so4159794ilg.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 08:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+5rv7jjhl+k6S7NYw+9gcQK9B0BL7n+vBwFwuGdweMU=;
        b=g3jn0nTQ2IWCL0Lkg3wzBn2hv1rsD2ZNHxKbm3oRKdWtboUkr3nPOnL6krXVwbBGEi
         OoLGySxfvjlsMF7axkP7zZoLAu37CRpueZNfpp3FPo4J2Y4dUAnvifraOjL8FKIWnK9M
         //2aX9kT3E9/sbYJ+8DIIMSLUoa/YxWqi5M0lwArBeD1fy+kl+Ti+gdkF///qTe62Mhp
         CGqPNKwx66ZNpz5xRxyBd3VLoyk3MSV5JWYd1PSxCplMBFENUUHersUn3kSeQHnva+Ke
         +KVMMzf/2K6nIqf7CT3cpvPDD/SZQ3yoBfysuqIOuCjf4zUC1u+fzvJTqt6HagrjPDGc
         /THw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+5rv7jjhl+k6S7NYw+9gcQK9B0BL7n+vBwFwuGdweMU=;
        b=MVE/ZKi8YFdJbrFrP5DMqq1uUfNgYA3Xil4UGhAC+b8/sjZe8ZTWqAUReVPECRDEHo
         A2lnbQ0adqYpMcYlb4oWyQnADY5Rebg3n4tdiqejkwXL/MJDX1IWgvvO9WQecA7wAp83
         rHujEtdYTu+CIklwS4rFacdeyX892zkB6SwpFRx1/kayVxv/CqGSu3+nzQiq/uyYcx+E
         jrlvvag/XF/XE0/kljuDkxpZliGhRFOwoob6fi4zWBP25LU8/kHiHhFz6kh99/thX9Da
         Fek5qdenvuFU9pen8srD46JhiVgjso8OZDhxJMEhXt+ZdYm4VmRGPsA8FpNNONzA27A8
         /AtA==
X-Gm-Message-State: AJIora/IUX3lgMTgv9esD5kIjGiYnlqnNBa0Lv09ymDG4TtltgPXcbmf
        jxDqAzZT77pj4MPlsKznV7FeQw==
X-Google-Smtp-Source: AGRyM1txepzshbSvujIEFhPrHDzMJVugQoXexwl6GFOEuCZgSy4u2kn6BBfSgAT6n403N5cy8SuDZg==
X-Received: by 2002:a05:6e02:1ba4:b0:2dc:2b41:4052 with SMTP id n4-20020a056e021ba400b002dc2b414052mr16619717ili.200.1658243314590;
        Tue, 19 Jul 2022 08:08:34 -0700 (PDT)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id f6-20020a056e020b4600b002dae42fa5f2sm5944899ilu.56.2022.07.19.08.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 08:08:34 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, bjorn.andersson@linaro.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 2/2] net: ipa: move configuration data files into a subdirectory
Date:   Tue, 19 Jul 2022 10:08:27 -0500
Message-Id: <20220719150827.295248-3-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220719150827.295248-1-elder@linaro.org>
References: <20220719150827.295248-1-elder@linaro.org>
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

Reduce the clutter in the main IPA source directory by creating a
new "data" subdirectory, and locating all of the configuration data
files in there.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/Makefile                     | 2 +-
 drivers/net/ipa/{ => data}/ipa_data-v3.1.c   | 0
 drivers/net/ipa/{ => data}/ipa_data-v3.5.1.c | 0
 drivers/net/ipa/{ => data}/ipa_data-v4.11.c  | 0
 drivers/net/ipa/{ => data}/ipa_data-v4.2.c   | 0
 drivers/net/ipa/{ => data}/ipa_data-v4.5.c   | 0
 drivers/net/ipa/{ => data}/ipa_data-v4.9.c   | 0
 7 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/net/ipa/{ => data}/ipa_data-v3.1.c (100%)
 rename drivers/net/ipa/{ => data}/ipa_data-v3.5.1.c (100%)
 rename drivers/net/ipa/{ => data}/ipa_data-v4.11.c (100%)
 rename drivers/net/ipa/{ => data}/ipa_data-v4.2.c (100%)
 rename drivers/net/ipa/{ => data}/ipa_data-v4.5.c (100%)
 rename drivers/net/ipa/{ => data}/ipa_data-v4.9.c (100%)

diff --git a/drivers/net/ipa/Makefile b/drivers/net/ipa/Makefile
index 14b313fefa3a3..8b2220eb6b92d 100644
--- a/drivers/net/ipa/Makefile
+++ b/drivers/net/ipa/Makefile
@@ -13,4 +13,4 @@ ipa-y			:=	ipa_main.o ipa_power.o ipa_reg.o ipa_mem.o \
 				ipa_resource.o ipa_qmi.o ipa_qmi_msg.o \
 				ipa_sysfs.o
 
-ipa-y			+=	$(IPA_VERSIONS:%=ipa_data-v%.o)
+ipa-y			+=	$(IPA_VERSIONS:%=data/ipa_data-v%.o)
diff --git a/drivers/net/ipa/ipa_data-v3.1.c b/drivers/net/ipa/data/ipa_data-v3.1.c
similarity index 100%
rename from drivers/net/ipa/ipa_data-v3.1.c
rename to drivers/net/ipa/data/ipa_data-v3.1.c
diff --git a/drivers/net/ipa/ipa_data-v3.5.1.c b/drivers/net/ipa/data/ipa_data-v3.5.1.c
similarity index 100%
rename from drivers/net/ipa/ipa_data-v3.5.1.c
rename to drivers/net/ipa/data/ipa_data-v3.5.1.c
diff --git a/drivers/net/ipa/ipa_data-v4.11.c b/drivers/net/ipa/data/ipa_data-v4.11.c
similarity index 100%
rename from drivers/net/ipa/ipa_data-v4.11.c
rename to drivers/net/ipa/data/ipa_data-v4.11.c
diff --git a/drivers/net/ipa/ipa_data-v4.2.c b/drivers/net/ipa/data/ipa_data-v4.2.c
similarity index 100%
rename from drivers/net/ipa/ipa_data-v4.2.c
rename to drivers/net/ipa/data/ipa_data-v4.2.c
diff --git a/drivers/net/ipa/ipa_data-v4.5.c b/drivers/net/ipa/data/ipa_data-v4.5.c
similarity index 100%
rename from drivers/net/ipa/ipa_data-v4.5.c
rename to drivers/net/ipa/data/ipa_data-v4.5.c
diff --git a/drivers/net/ipa/ipa_data-v4.9.c b/drivers/net/ipa/data/ipa_data-v4.9.c
similarity index 100%
rename from drivers/net/ipa/ipa_data-v4.9.c
rename to drivers/net/ipa/data/ipa_data-v4.9.c
-- 
2.34.1

