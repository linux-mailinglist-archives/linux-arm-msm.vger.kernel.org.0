Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5F5368F92E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 21:57:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232344AbjBHU5c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 15:57:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232307AbjBHU5X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 15:57:23 -0500
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DBA946154
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 12:57:16 -0800 (PST)
Received: by mail-il1-x135.google.com with SMTP id o13so32940ilt.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 12:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLamySAr1zUOG/dPPEeRuzX5hSRA9o9Azm7PHROMYBo=;
        b=qHTKOSfOt0lAKtirhKtA9vpmWHAvSU3grHwxM89A/2+E2FbgvuQp6GaX58hXlh1Kam
         RUHAmnLswF5wxEUwFd+Fsjb0Mq4RNmPhkH0rDpJE+P4uteVlWTRCFYxK9YuNh38P4c4k
         F9zOkwR3nP1s3B9G3k30yI6uAnb1Aih/DP+u1Ck0ebF+qRu8a7AW8V4Jd52/SvAT9+KR
         nLn9xnwMiJgFm6Lcej5qIageMt2kvOOt6vKKGk3zc12evikTt1d+Rr6t4VOrSux3G78d
         LydLP0WdSHpfCnpZaftFOAC2KpMD/FRqeWqN7T7G34IMpFeKo3T/v4KrB0/QuCcGeYXd
         y8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hLamySAr1zUOG/dPPEeRuzX5hSRA9o9Azm7PHROMYBo=;
        b=DRYvOSJa1azBr80GfJptOp472Bh6TwxdTb30JuHadoopOzY2/hAlnVpMj1uGMFxVyG
         DTw9unHG9DfwPQ7Uk93B26zBFc2AxfESJtW+laFWg4xHmQ+46nezQ+p3tjukK7mKIvyu
         C97ja+x4AvcXOcQk/xNqXPOIE1INE47qkk0pAjyTbaZ/Cjz4OqaTAtiCWy0ylYS+EO64
         pSitJ1hjedFOL7JJj4gKySMhjooVqeerovDQskIqr2d8v05x+rKh11qdIz5x42HjD/ix
         lqlK3N6kt/dvE+IwCW01IrZP6IF8sdkU4CkwtXVmj/Mpv8qdB+aOl6pDTUy1rbemMvdb
         /3zQ==
X-Gm-Message-State: AO0yUKX0CBHL38/ctYYyW+hcEA69JY1pH1/QpGRK9wzl+ypsSv11xcgs
        MlIeI5zeDNYVmmYFlOPiJe+koQ==
X-Google-Smtp-Source: AK7set9HzrjPXUf3mdPdNqdakAfcYUv9zsMZglDr9hf8cHLPiPcWu2HazlnJlw120SfPSXeoBM1sMg==
X-Received: by 2002:a05:6e02:198a:b0:314:216:3a78 with SMTP id g10-20020a056e02198a00b0031402163a78mr825066ilf.15.1675889835377;
        Wed, 08 Feb 2023 12:57:15 -0800 (PST)
Received: from presto.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id r6-20020a922a06000000b0031093e9c7fasm5236704ile.85.2023.02.08.12.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 12:57:13 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     caleb.connolly@linaro.org, mka@chromium.org, evgreen@chromium.org,
        andersson@kernel.org, quic_cpratapa@quicinc.com,
        quic_avuyyuru@quicinc.com, quic_jponduru@quicinc.com,
        quic_subashab@quicinc.com, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 2/9] net: ipa: get rid of ipa->reg_addr
Date:   Wed,  8 Feb 2023 14:56:46 -0600
Message-Id: <20230208205653.177700-3-elder@linaro.org>
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

The reg_addr field in the IPA structure is set but never used.
Get rid of it.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa.h     | 2 --
 drivers/net/ipa/ipa_reg.c | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/net/ipa/ipa.h b/drivers/net/ipa/ipa.h
index 5372db58b5bdc..fd54c328e8271 100644
--- a/drivers/net/ipa/ipa.h
+++ b/drivers/net/ipa/ipa.h
@@ -45,7 +45,6 @@ struct ipa_interrupt;
  * @interrupt:		IPA Interrupt information
  * @uc_powered:		true if power is active by proxy for microcontroller
  * @uc_loaded:		true after microcontroller has reported it's ready
- * @reg_addr:		DMA address used for IPA register access
  * @reg_virt:		Virtual address used for IPA register access
  * @regs:		IPA register definitions
  * @mem_addr:		DMA address of IPA-local memory space
@@ -97,7 +96,6 @@ struct ipa {
 	bool uc_powered;
 	bool uc_loaded;
 
-	dma_addr_t reg_addr;
 	void __iomem *reg_virt;
 	const struct ipa_regs *regs;
 
diff --git a/drivers/net/ipa/ipa_reg.c b/drivers/net/ipa/ipa_reg.c
index ddd529153e15c..d3d05420c5e91 100644
--- a/drivers/net/ipa/ipa_reg.c
+++ b/drivers/net/ipa/ipa_reg.c
@@ -123,7 +123,6 @@ int ipa_reg_init(struct ipa *ipa)
 		dev_err(dev, "unable to remap \"ipa-reg\" memory\n");
 		return -ENOMEM;
 	}
-	ipa->reg_addr = res->start;
 	ipa->regs = regs;
 
 	return 0;
-- 
2.34.1

