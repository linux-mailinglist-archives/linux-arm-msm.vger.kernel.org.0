Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 040195B4394
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Sep 2022 03:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231365AbiIJBMR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 21:12:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230526AbiIJBLp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 21:11:45 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C6D010B035
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 18:11:42 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id n81so2345704iod.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 18:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=1LolOI6aGh7rm9r9ueAoq3mSQTbVxlrrckk6AM7E3uo=;
        b=E7x02qSAEqC0nPJvyZO88UEgDKUmu+J+lP4YRcTnEKpuqWCqE8JKWTgAG22598cYI0
         1CSe6uR3BxiRLseuBt0c0ZcnDEWhZFTgCViQtmlqgvvpGKjtV00H+0oRV3p9FY7XX71Q
         O4TR6V2PQaCpw68EYs0X1ah7U9S4sLUeVFIExdJ38rd/w/PDUn38s4vc/sLvgG4MkRK/
         +ZkwtzH6kuw+07sJ8dAuDJ74LVZ9rjGVf9SkivV3yl15pvYy0oTxu9nbyqN4LiTwTJ8d
         0v2RsSizqcGnTOHUCKZaOwEDvBmhduEKE8u8aDGRTPbdD9WmSc/zQ1L2bQX4aLljzqxO
         IShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=1LolOI6aGh7rm9r9ueAoq3mSQTbVxlrrckk6AM7E3uo=;
        b=dnQ6ZBMAOoL3W2d3PE6A5WMoq2L91A6HvVfOkxRlP1fXk+xeAzdvr/p9DmhyFL8Gu8
         rE8PIG1qwNTa8lIgcziHxJz7e9lKI0k6mv8dx2eq6Ria08N3df00SWOerf+mqKsIK4R+
         F5FOo3C+svb2yHKdnMiON+tmSIG5/qUktnssXMAIOCT0+MBg/Ox1Maxn6LeuEk8viEGV
         xWVMVxohTyfblnRk6MesugCAY5nY+vFOppEbr9bCy99DyXDwToaXg58AXS4zkTJvgnqL
         ez2ga+ve1PcPL+FIHWUroZ3CcEyM16yA5xBP5vDiZ2EYt9xZpDoItSgBqzYzwRwJAdY8
         PdcQ==
X-Gm-Message-State: ACgBeo3VFa5TVreyEYnFuO9gP5Pr9pU6i0EDifCZudeEioxCA2oIxvkH
        t6FPxXDUXg4Yd33+dMERkGjk7w==
X-Google-Smtp-Source: AA6agR5wrbtcdjGjJHlYeKI/sefWLcLhoWJoqcftUP45mj9i97qQaFPoX3oAslox+0AR3DvxXahDFQ==
X-Received: by 2002:a02:c519:0:b0:358:4da5:4ad with SMTP id s25-20020a02c519000000b003584da504admr4062280jam.67.1662772301196;
        Fri, 09 Sep 2022 18:11:41 -0700 (PDT)
Received: from presto.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id u133-20020a02238b000000b00348e1a6491asm733064jau.137.2022.09.09.18.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 18:11:40 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, andersson@kernel.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 6/6] net: ipa: fix two symbol names
Date:   Fri,  9 Sep 2022 20:11:31 -0500
Message-Id: <20220910011131.1431934-7-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220910011131.1431934-1-elder@linaro.org>
References: <20220910011131.1431934-1-elder@linaro.org>
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

All field mask symbols are defined with a "_FMASK" suffix, but
EOT_COAL_GRANULARITY and DRBIP_ACL_ENABLE are defined without one.
Fix that.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_reg.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ipa/ipa_reg.h b/drivers/net/ipa/ipa_reg.h
index b7b7fb553c445..3e24bddc682ef 100644
--- a/drivers/net/ipa/ipa_reg.h
+++ b/drivers/net/ipa/ipa_reg.h
@@ -254,7 +254,7 @@ static inline u32 proc_cntxt_base_addr_encoded(enum ipa_version version,
 /* The next register is not present for IPA v4.5+ */
 #define IPA_REG_COUNTER_CFG_OFFSET			0x000001f0
 /* The next field is not present for IPA v3.5+ */
-#define EOT_COAL_GRANULARITY			GENMASK(3, 0)
+#define EOT_COAL_GRANULARITY_FMASK		GENMASK(3, 0)
 #define AGGR_GRANULARITY_FMASK			GENMASK(8, 4)
 
 /* The next register is present for IPA v3.5+ */
@@ -470,7 +470,7 @@ static inline u32 ipa_metadata_offset_encoded(enum ipa_version version,
 /* The next field is not present for IPA v4.5+ */
 #define HDR_FTCH_DISABLE_FMASK			GENMASK(30, 30)
 /* The next field is present for IPA v4.9+ */
-#define DRBIP_ACL_ENABLE			GENMASK(30, 30)
+#define DRBIP_ACL_ENABLE_FMASK			GENMASK(30, 30)
 
 /** enum ipa_mode - ENDP_INIT_MODE register MODE field value */
 enum ipa_mode {
-- 
2.34.1

