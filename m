Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FFC9598482
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Aug 2022 15:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245268AbiHRNnW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Aug 2022 09:43:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245181AbiHRNnE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Aug 2022 09:43:04 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7220785FD4
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Aug 2022 06:42:10 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id e28so1111341qts.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Aug 2022 06:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=fEl5/MZkqTMXgHOWXV9A2H8cNKuuMZWcnutD4sufu6s=;
        b=ht8Gx8e2Ikbg0xL5tTN9yUSBAnaJAa9W+z/ivanBDORHCh4gJXk+iF7rZkapcUDT97
         cCmTExnGDOR9IyskxbtWp08xaDh3dXDI7lw1zQ16mvB58eixGo3bnK3wmWUnIyTG3mva
         dR0MOIH3M+4e60hYD3I23ne5WHqUAlfnrkrWBr/UYhBj/YG38gSvDtoT02LIqlVHXFT9
         dgB13Ynn/hKXojCTppcehXAS8KXH/jdUdZBkG3rZGwTczQtTx2ZbC7RSxznJoDhPcw39
         GoIx8Oad3MeL0EhBMfmiGLoupUgz999ABEz+WE1VR5atJcn7BGnfuQpJGhBvNDKDkEJh
         Fkyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=fEl5/MZkqTMXgHOWXV9A2H8cNKuuMZWcnutD4sufu6s=;
        b=rFux3azsVlyq/5xpNJEKshbHWnATpqOOsgtXCgf7sly1uzdTt9tfRlxTtdFNkW2sp2
         uQG9Jq9bRb/cTyctUQCDkb8iJ66aPoLhvgpVJFVijS0afhzFCok/6rk7CA6SlJsUTuzt
         QR3wf0BBdmdkRYm1h5ViZfTCHPLLnFFAB3Oi/wqT/VxP8GXI3dq0Iy8B/R6QGfFD5UyB
         P+kFhHvxkMMcXxyqi1KfIAjoY4d1zodjbZa+/s/EznwioyTvEEnZqM0aQ0ukJxMhoNTS
         CTEukaOQiTyrC6Xif3gzxLxdYivUd6yxO2oPyeDQTg3lVfXxvNSvIvXjHO4E58vYtuJq
         tnXg==
X-Gm-Message-State: ACgBeo0CYXjm4FN2BPQHl9tbqj0/Hxic4JgDleAdlZojbW2RDzwdFPvV
        BrIWiNOxpj6THY/C3qyYuBfLHg==
X-Google-Smtp-Source: AA6agR4jTgrZJP0jHnhpoEcJLuhZqFp9nVJLbFrYqbcB6Yo9V3tEpfH7+LK6oECe9AWPfVpNq4DZyQ==
X-Received: by 2002:a05:622a:44c:b0:343:7b8e:2cb with SMTP id o12-20020a05622a044c00b003437b8e02cbmr2527312qtx.617.1660830129554;
        Thu, 18 Aug 2022 06:42:09 -0700 (PDT)
Received: from localhost.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id bm30-20020a05620a199e00b006bb11f9a859sm1493430qkb.122.2022.08.18.06.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 06:42:09 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, bjorn.andersson@linaro.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net] net: ipa: don't assume SMEM is page-aligned
Date:   Thu, 18 Aug 2022 08:42:05 -0500
Message-Id: <20220818134206.567618-1-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In ipa_smem_init(), a Qualcomm SMEM region is allocated (if needed)
and then its virtual address is fetched using qcom_smem_get().  The
physical address associated with that region is also fetched.

The physical address is adjusted so that it is page-aligned, and an
attempt is made to update the size of the region to compensate for
any non-zero adjustment.

But that adjustment isn't done properly.  The physical address is
aligned twice, and as a result the size is never actually adjusted.

Fix this by *not* aligning the "addr" local variable, and instead
making the "phys" local variable be the adjusted "addr" value.

Fixes: a0036bb413d5b ("net: ipa: define SMEM memory region for IPA")
Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ipa/ipa_mem.c b/drivers/net/ipa/ipa_mem.c
index 1e9eae208e44f..53a1dbeaffa6d 100644
--- a/drivers/net/ipa/ipa_mem.c
+++ b/drivers/net/ipa/ipa_mem.c
@@ -568,7 +568,7 @@ static int ipa_smem_init(struct ipa *ipa, u32 item, size_t size)
 	}
 
 	/* Align the address down and the size up to a page boundary */
-	addr = qcom_smem_virt_to_phys(virt) & PAGE_MASK;
+	addr = qcom_smem_virt_to_phys(virt);
 	phys = addr & PAGE_MASK;
 	size = PAGE_ALIGN(size + addr - phys);
 	iova = phys;	/* We just want a direct mapping */
-- 
2.34.1

