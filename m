Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31BFC5E6F8E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Sep 2022 00:21:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbiIVWVK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 18:21:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbiIVWVJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 18:21:09 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9673510D0F0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 15:21:05 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id e205so8983447iof.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 15:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=lSdeMmKOatLt1HIEIx6J8l8o81Ep3DSqpQTV4HSGmjQ=;
        b=BLrB/OURumYJfvjcJAgrrvjpSokfJ/yHuaEheiKd201cRLgLBU2mKAmzUVxzCkuHXS
         U66diQmI5s64GPFTfjtx30gWBdboZzOkHsyPB/l5jJlJ5WNI1+CuUVZVnJeiO+qpMBwD
         1GgbSkLM5Ft6jXzYf1GpK43+7UoX/PkiuRJJ8KISJDq643R26c1TeYxi39YLfVXzptCH
         4gNHWI2M9x+3spV3K3i/WnWKtgzSij7A9YUg2QFoei2nuFp9ZuzS+B35VjGT3F8pijwF
         WLatGGtE/dO5dpY1uOdQqE/1CrurIdCxgCtdj2YYWr+7z+F1Efao4dqHTbTEy2ulsMOs
         098Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=lSdeMmKOatLt1HIEIx6J8l8o81Ep3DSqpQTV4HSGmjQ=;
        b=zYyWrF3d2WqQwtwYxJmWdWnGVvMzDngYL69ZPBVhHrje3HDmFNTONln/JnbcxFAegJ
         L8GslM0crKCQ0kdD0jb9vADDRTblJXeD3uCyr2OJsW4QhTlWXyKVlY+GiuxDH55frRHx
         AE5Ou8484yxUlKhNV1OsflSJQg8WRIHdKpIa2Co6tsLK/9Om9tb3cHaPXoO8j8z2kMlz
         6XUPlDC6TFLY7JWTwTLzWB0B/VWJQ7zJ1YqcCFcwfOG7lOqJZLdJcWMB0BB4ryRI4+x6
         F49QxN+vGFoPGMQUFc/tnHcV93HeAa0TW9fDQGIViWpMdQbIthKYUzKh5oddReGA6C2m
         x/dg==
X-Gm-Message-State: ACrzQf1ohSSq7t9e/3yyDuJ0NyUFeAlRsEzP00ST4Tw1lpo+bxI0G9Y1
        FupCSPR9A417+3E0mXXMGJimhA==
X-Google-Smtp-Source: AMsMyM49ojpZ4NtZ85F+TDgqbi78KCnusmOwNYbyav9onsrplQqsvWMs9fDUxMB0WWpzSU7jT/Hz2A==
X-Received: by 2002:a05:6638:3286:b0:349:fd14:7af6 with SMTP id f6-20020a056638328600b00349fd147af6mr3165876jav.48.1663885265001;
        Thu, 22 Sep 2022 15:21:05 -0700 (PDT)
Received: from localhost.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id g12-20020a92d7cc000000b002f592936fbfsm2483332ilq.41.2022.09.22.15.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 15:21:04 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, andersson@kernel.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/8] net: ipa: don't use u32p_replace_bits()
Date:   Thu, 22 Sep 2022 17:20:53 -0500
Message-Id: <20220922222100.2543621-2-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922222100.2543621-1-elder@linaro.org>
References: <20220922222100.2543621-1-elder@linaro.org>
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

In two spots we use u32_replace_bits() to replace a set of bits in a
register while preserving the rest.  Both of those cases just zero
the bits being replaced, and this can be done more simply without
using that function.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_table.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ipa/ipa_table.c b/drivers/net/ipa/ipa_table.c
index 69efe672ca528..037cec2fd5942 100644
--- a/drivers/net/ipa/ipa_table.c
+++ b/drivers/net/ipa/ipa_table.c
@@ -524,7 +524,7 @@ static void ipa_filter_tuple_zero(struct ipa_endpoint *endpoint)
 	val = ioread32(endpoint->ipa->reg_virt + offset);
 
 	/* Zero all filter-related fields, preserving the rest */
-	u32p_replace_bits(&val, 0, IPA_REG_ENDP_FILTER_HASH_MSK_ALL);
+	val &= ~IPA_REG_ENDP_FILTER_HASH_MSK_ALL;
 
 	iowrite32(val, endpoint->ipa->reg_virt + offset);
 }
@@ -571,7 +571,7 @@ static void ipa_route_tuple_zero(struct ipa *ipa, u32 route_id)
 	val = ioread32(ipa->reg_virt + offset);
 
 	/* Zero all route-related fields, preserving the rest */
-	u32p_replace_bits(&val, 0, IPA_REG_ENDP_ROUTER_HASH_MSK_ALL);
+	val &= ~IPA_REG_ENDP_ROUTER_HASH_MSK_ALL;
 
 	iowrite32(val, ipa->reg_virt + offset);
 }
-- 
2.34.1

