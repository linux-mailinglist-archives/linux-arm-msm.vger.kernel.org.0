Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2A12699568
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Feb 2023 14:15:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbjBPNPH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Feb 2023 08:15:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230316AbjBPNOu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Feb 2023 08:14:50 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F25045454B
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 05:14:45 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id b16so1860755ljr.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 05:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1676553285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drQma7nNWgYIegGN8xjgb6Jv9bqzaE0wjeikGVtXijQ=;
        b=FDyBsCyO20brAo9mArK9sLpKTcfWTBO6lkQ3Yhr3vKaFRh7X8VpRii5YD/dln9157Z
         oZwUTwCwWZ9SKKDfU2ny6zyEXZSUSyKQZwOJAm9/jheDgWsZvJLBgxNoKVOMZMv1VPus
         F6a1RhDwbG23H7cN6ToOHVb+k/18K3OjlTHDDEvbY3eaDd2U7nZy3jpGav5FHc3fG2WD
         uozmLlxxkCshEfDabs7uth+OvXysjEXFOQC9RZ96fKIwb9bNSwAGrc206vr2ME8ENGIX
         BfjQ3PffZFduWDryHO4nGax/gDezfYGiG50J+jYLda+5pvysXUjZZCh5AfY9+CjrXKYU
         iH8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676553285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=drQma7nNWgYIegGN8xjgb6Jv9bqzaE0wjeikGVtXijQ=;
        b=0r5fji1y+M0rc5NJNMP5AKVfikhMZnj784qHNvXQWo/kiMwWoE4NczZ5UIC6pvtDso
         jbegZMypqSIr8xmON4Ux04xLnudogY4jh5uBMtTFW9IJaluOVtNKtiY1khx4JKKsIrJm
         kSICvs5Cue4Jp+Kv2Bz+UeJK8XJx0Mn0WHrNayhg/Us6zvw7vKHixxdDrETtKQQqFAiz
         //02kqByZQAcqzW6a8xOcj+UxCgmHguqgHC5k00p644PnV2gAPVpHTjBbk5HudIUel4C
         aYTkot/i1Hq6oMfjTjPXpYJ+bX6+kOjV7Va6KFEF+cFK0VWFwi+tVkEKeOedeyF8kLIN
         BaAw==
X-Gm-Message-State: AO0yUKVvrJ4njUOfyCIFti4lX4QnSzpdb0/UVwU307mmdFugwqhQulaV
        nJcx4YCpTf8IE/XEM+nVLhJHKQ==
X-Google-Smtp-Source: AK7set/KKe9iXZAkK+yWzAUyqQqZOENyMPekg2hCaKYdm3gVnxuJhHxy5l5i0oL15TDFFzOk8pBsvA==
X-Received: by 2002:a2e:9913:0:b0:293:4eac:734a with SMTP id v19-20020a2e9913000000b002934eac734amr1593442lji.0.1676553285510;
        Thu, 16 Feb 2023 05:14:45 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id j8-20020a2e8248000000b00293500280e5sm194345ljh.111.2023.02.16.05.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 05:14:44 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, Jordan Crouse <jorcrous@amazon.com>
Subject: [PATCH v10 09/10] crypto: qce: core: Make clocks optional
Date:   Thu, 16 Feb 2023 15:14:29 +0200
Message-Id: <20230216131430.3107308-10-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230216131430.3107308-1-vladimir.zapolskiy@linaro.org>
References: <20230216131430.3107308-1-vladimir.zapolskiy@linaro.org>
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

From: Thara Gopinath <thara.gopinath@gmail.com>

On certain Snapdragon processors, the crypto engine clocks are enabled by
default by security firmware and the driver should not handle the clocks.
Make acquiring of all the clocks optional in crypto engine driver, so that
the driver initializes properly even if no clocks are specified in the dt.

Tested-by: Jordan Crouse <jorcrous@amazon.com>
Signed-off-by: Thara Gopinath <thara.gopinath@gmail.com>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
[Bhupesh: Massage the commit log]
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/crypto/qce/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 0654b94cfb95..5bb2128c95ca 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -209,15 +209,15 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	qce->core = devm_clk_get(qce->dev, "core");
+	qce->core = devm_clk_get_optional(qce->dev, "core");
 	if (IS_ERR(qce->core))
 		return PTR_ERR(qce->core);
 
-	qce->iface = devm_clk_get(qce->dev, "iface");
+	qce->iface = devm_clk_get_optional(qce->dev, "iface");
 	if (IS_ERR(qce->iface))
 		return PTR_ERR(qce->iface);
 
-	qce->bus = devm_clk_get(qce->dev, "bus");
+	qce->bus = devm_clk_get_optional(qce->dev, "bus");
 	if (IS_ERR(qce->bus))
 		return PTR_ERR(qce->bus);
 
-- 
2.33.0

