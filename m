Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA9D86BBD58
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 20:36:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232736AbjCOTgD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 15:36:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232789AbjCOTgB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 15:36:01 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D99F98F720
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 12:35:59 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id c19so17415029qtn.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 12:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678908959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erRl2xavC/v8RCG0iGxQtKfxSfjcWRGZhzPnMxXYyms=;
        b=syf2MHuNA5s5VBnyIDPYogKU3AXFQCUZgbXRKEzUafSRlVP/42EQWCyRl4OHJYHcFW
         Wk+2eOgSe/kzjvo5bjj4D8CARFP7tVYdNo4v5xJFIBh8tz2QYXIAwMPmb9EwvnZi2ujU
         5jwaQXIILl9/IZiuwUJA4deWfxjK1KZYhxFbheAxDvg4KAsbYVHO4XBgC4P4NU9F2Hve
         xvPRTyU3SL1mtQEYCi1cRedp4hxxzEfDWTOQ/MbecgEX1z+yRSMCK/+mABl1uGiUluYJ
         LKS45G3TKGpoq6cRabFFhn7my6UJamjGj4yfu/hwSS9m14XPDBfYIVNlfDTzCFeGVnbh
         XVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678908959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=erRl2xavC/v8RCG0iGxQtKfxSfjcWRGZhzPnMxXYyms=;
        b=PwaVrsAKvSjDFUUFiXdnpUd1i5T0mfPsLL2B3di611K4XgqZQl0fuR28xqRpSzxEfl
         sH3XPWjNWp8V7oY0/XaMFuaJsOeHOyYA5teuKBmLR3ku+dgYFBFqiqZg4ah/HLeGX5QY
         SzW5XvE39A2cExKgOoylFJNCRPpfpsJlrSMPLPb8LrOByNqq+hFCgRwAvXC6V/g9rxsB
         FdAZU7IoogkHIyNJvhqfjgthXe8nitxeC2AgZfX5VDv/oiVsKhlZNI0ZnxpnqegcYiVP
         82m8sMXrBUT8SzkS1etDCeeJDXZKCuHhtYmgJuPdf/7cdwV4U4qjKZAhF0WL8brlCX5W
         Nu7g==
X-Gm-Message-State: AO0yUKWEJArCtY2fRMwpQuF5tnPAhXEX5qeeLWQuL+5F/A1brGn+BbSq
        RBxkJfr/0hJ4XD8FL1UpMwZZ2Q==
X-Google-Smtp-Source: AK7set9dHEALzKOulqYYDBAhnymWtF4QNOfjv1Gy30FmFLGHtk9RA6oXYi2QQMTXY2e5Mu323NL4aw==
X-Received: by 2002:a05:622a:34d:b0:3d0:7bdf:42c4 with SMTP id r13-20020a05622a034d00b003d07bdf42c4mr1586720qtw.59.1678908958994;
        Wed, 15 Mar 2023 12:35:58 -0700 (PDT)
Received: from localhost.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id q9-20020a05620a024900b0071eddd3bebbsm4369462qkn.81.2023.03.15.12.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 12:35:58 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     caleb.connolly@linaro.org, mka@chromium.org, evgreen@chromium.org,
        andersson@kernel.org, quic_cpratapa@quicinc.com,
        quic_avuyyuru@quicinc.com, quic_jponduru@quicinc.com,
        quic_subashab@quicinc.com, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net v2 1/4] net: ipa: reg: include <linux/bug.h>
Date:   Wed, 15 Mar 2023 14:35:49 -0500
Message-Id: <20230315193552.1646892-2-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230315193552.1646892-1-elder@linaro.org>
References: <20230315193552.1646892-1-elder@linaro.org>
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

When "reg.h" got created, it included calls to WARN() and WARN_ON().
Those macros are defined via <linux/bug.h>.  In addition, it uses
is_power_of_2(), which is defined in <linux/log2.h>.  Include those
files so IPA "reg.h" has access to all definitions it requires.

Meanwhile, <linux/bits.h> is included but nothing defined therein
is required directly in "reg.h", so get rid of that.

Fixes: 81772e444dbe ("net: ipa: start generalizing "ipa_reg"")
Signed-off-by: Alex Elder <elder@linaro.org>
---
v2: Correct the "Fixes" commit hash.

 drivers/net/ipa/reg.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ipa/reg.h b/drivers/net/ipa/reg.h
index 57b457f39b6e2..2ee07eebca677 100644
--- a/drivers/net/ipa/reg.h
+++ b/drivers/net/ipa/reg.h
@@ -6,7 +6,8 @@
 #define _REG_H_
 
 #include <linux/types.h>
-#include <linux/bits.h>
+#include <linux/log2.h>
+#include <linux/bug.h>
 
 /**
  * struct reg - A register descriptor
-- 
2.34.1

