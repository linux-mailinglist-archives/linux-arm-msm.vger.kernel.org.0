Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A852868F936
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 21:57:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231983AbjBHU5j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 15:57:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231550AbjBHU5Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 15:57:24 -0500
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFCCF3F2BA
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 12:57:18 -0800 (PST)
Received: by mail-il1-x136.google.com with SMTP id j12so40070ila.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 12:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIwe/C1xoBP/VLYmSZ2262QaA8JKAX9KelZYYpn1Y5I=;
        b=HFd/O+1uS1aOiGNfht7wY70zmMyh9KIQ9ZIO+BoL23loxojQOWK0yAx24f7AQnSipZ
         jRu6tOu+3/MPt+4/bQ87kdKiLkv+zbaH7cQKTp+7l+lHpmjo22B4ZBgSzbzk4NvTtPpH
         Ox02NBJvZVO0NeaonwSsNmLfbqugpgOFWy5zY4Mqydne89ETsgKyK5o6QVKBfkcJNlk3
         utw2en6mmSXzkKMjR5nw/+bgBB0oODXTXY8uwnpZF2Uk1XbBYmHUq9XrvYV3C9yWgGW5
         3an9piaT0yer39yk9MPDcGBN5FhNChJ5iX3Vf/RkNz7+OrouoN1XUCcG0Zm5Xp2nr/Em
         DNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UIwe/C1xoBP/VLYmSZ2262QaA8JKAX9KelZYYpn1Y5I=;
        b=z8EM8aMZAqwwAkDMWg6IwxMpXHFoWYxzW19LUVKOHuI3AcG6/vvxObf9mgeASqj93k
         J0spb/4vGRPUCvmg75THCDN+8ckbt8EwY5cmREmHCmXqd9vkr6HsyrpLLUUhIXPwCWSi
         wyl3EUCfO/Ll7ynUQATAz1P70aJw8vOt8OJ/j85EXCJ08rQfjUIlBeEF/6VQXX//Wb3x
         csQXhLWCJ/hx7ztYv1VMXie6dTvCT6/4IcnieWWodG6MxPajSOtG3ZX+5KASVsdFCdLS
         HbZPrQUejN3+iacNQyrvxkvDTf4PuW+JGVMFtbhv61CAiIaLEwH4bwQzcFJgLfioKjhG
         uGyg==
X-Gm-Message-State: AO0yUKUjex6qhAq0JQfkskU9SIcyfp8HLD0cFhGl5kSP5Fjm993kjM5l
        UnpAOnGr5ndv0QWT59tpWD0rNw==
X-Google-Smtp-Source: AK7set/PBIUhGzX9MmQdb8Z9i9IM86kFqmtIIfgfjymeYDLuI+zOJ2AJDukE8pcdrB+PJNuKR5aOrQ==
X-Received: by 2002:a05:6e02:b2e:b0:313:9d88:437c with SMTP id e14-20020a056e020b2e00b003139d88437cmr9169741ilu.4.1675889838051;
        Wed, 08 Feb 2023 12:57:18 -0800 (PST)
Received: from presto.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id r6-20020a922a06000000b0031093e9c7fasm5236704ile.85.2023.02.08.12.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 12:57:16 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     caleb.connolly@linaro.org, mka@chromium.org, evgreen@chromium.org,
        andersson@kernel.org, quic_cpratapa@quicinc.com,
        quic_avuyyuru@quicinc.com, quic_jponduru@quicinc.com,
        quic_subashab@quicinc.com, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 3/9] net: ipa: add some new IPA versions
Date:   Wed,  8 Feb 2023 14:56:47 -0600
Message-Id: <20230208205653.177700-4-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230208205653.177700-1-elder@linaro.org>
References: <20230208205653.177700-1-elder@linaro.org>
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

Soon IPA v5.0+ will be supported, and when that happens we will be
able to enable support for the SDX65 (IPA v5.0), SM8450 (IPA v5.1),
and SM8550 (IPA v5.5).

Fix the comment about the GSI version used for IPA v3.1.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_version.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ipa/ipa_version.h b/drivers/net/ipa/ipa_version.h
index d15821467743a..06e75b8ece7ee 100644
--- a/drivers/net/ipa/ipa_version.h
+++ b/drivers/net/ipa/ipa_version.h
@@ -9,7 +9,7 @@
 /**
  * enum ipa_version
  * @IPA_VERSION_3_0:	IPA version 3.0/GSI version 1.0
- * @IPA_VERSION_3_1:	IPA version 3.1/GSI version 1.1
+ * @IPA_VERSION_3_1:	IPA version 3.1/GSI version 1.0
  * @IPA_VERSION_3_5:	IPA version 3.5/GSI version 1.2
  * @IPA_VERSION_3_5_1:	IPA version 3.5.1/GSI version 1.3
  * @IPA_VERSION_4_0:	IPA version 4.0/GSI version 2.0
@@ -20,6 +20,8 @@
  * @IPA_VERSION_4_9:	IPA version 4.9/GSI version 2.9
  * @IPA_VERSION_4_11:	IPA version 4.11/GSI version 2.11 (2.1.1)
  * @IPA_VERSION_5_0:	IPA version 5.0/GSI version 3.0
+ * @IPA_VERSION_5_1:	IPA version 5.1/GSI version 3.0
+ * @IPA_VERSION_5_5:	IPA version 5.5/GSI version 5.5
  * @IPA_VERSION_COUNT:	Number of defined IPA versions
  *
  * Defines the version of IPA (and GSI) hardware present on the platform.
@@ -38,6 +40,8 @@ enum ipa_version {
 	IPA_VERSION_4_9,
 	IPA_VERSION_4_11,
 	IPA_VERSION_5_0,
+	IPA_VERSION_5_1,
+	IPA_VERSION_5_5,
 	IPA_VERSION_COUNT,			/* Last; not a version */
 };
 
-- 
2.34.1

