Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 263EE6984FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Feb 2023 20:54:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbjBOTyE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Feb 2023 14:54:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbjBOTyA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Feb 2023 14:54:00 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E5CF7EE1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Feb 2023 11:53:58 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id bl9so7556418iob.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Feb 2023 11:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YbMLPKGF7WhK7cdDBBY2la/NoWBzR8bhvPOtNAmLCnQ=;
        b=JauapKQSc+yTYJuA2tbKx2MyJ6hDWbl0keveabfqq02FTqMpXAiVK5PYexk4tHBhVZ
         v3YcU3RbguraYhH3HiM9ELy/vyA5Mp+I2/gcR6WO5jSp6hKm0zjRnk3b5TE5EWFdhfv3
         5b/NTlDWhiu22+YOJwfxocQuxQHfTXp/2lAvm+UN+BYktqRYufuGgGqUOPMJcpRZ4MVk
         AM5JTKGdmwJew8zNOjfTOI8OTpcgNoL0ASeKXpdbX8YFPfOVh0wPkEh9i/LIlxX1y3b1
         VTPW4e02pEVfu3Tz4pqhbpnnRiY0SxbOjRXsB93cwh6Q0RpIq0N1a7On7JNfW5RJC4XH
         Pm7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YbMLPKGF7WhK7cdDBBY2la/NoWBzR8bhvPOtNAmLCnQ=;
        b=EFWhp5pp4holUKakT4yfh5he8p9dtnYNrUrCBM1rt7iDYE9TdaBwE8QQEtlc4krSyz
         i9lqNMcLpNOLkvFC6qk3FDy6H+Hh4MRkf1cMpUFRzIav8UVB3lsjkIsi5Df56TjSYIrT
         9moVqK1CLw2AAtYLiaQDI1DI8Lg74UvdLK0VxiaVklxyyHq8XzGFUwGZ9aIoVCcgYRiE
         MUzrBjEplwy5pabAm/mk2cB4lajPTQIBizkiRyMyEA+Wm5mvsKhc61ULavyWmN1UF+BH
         zgMoP1WJ2vsDad9leUcqR7VnNyRFsX0UMdD8nTtDfdIqQQ6AN9pBJpt3vJBZ9MEQkP+W
         4jyA==
X-Gm-Message-State: AO0yUKWxIOk6A84shbcpu/0RLMSb3DB4LRWPIhEfwbAwqMit5/RK5aPa
        Hq0V/I2faHfLI8EXYpMlA1nPew==
X-Google-Smtp-Source: AK7set/FFZNXp/mkKAuWlNfVUSDHbzd3XSCgK30Giq5p1EZGcNegbcehzTMalw8ddLkmXdwJmPIVXw==
X-Received: by 2002:a5d:8048:0:b0:71a:b85c:2995 with SMTP id b8-20020a5d8048000000b0071ab85c2995mr2416487ior.15.1676490837532;
        Wed, 15 Feb 2023 11:53:57 -0800 (PST)
Received: from presto.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id n10-20020a5ed90a000000b0073a312aaae5sm6291847iop.36.2023.02.15.11.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 11:53:57 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     caleb.connolly@linaro.org, mka@chromium.org, evgreen@chromium.org,
        andersson@kernel.org, quic_cpratapa@quicinc.com,
        quic_avuyyuru@quicinc.com, quic_jponduru@quicinc.com,
        quic_subashab@quicinc.com, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/6] net: ipa: fix an incorrect assignment
Date:   Wed, 15 Feb 2023 13:53:47 -0600
Message-Id: <20230215195352.755744-2-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230215195352.755744-1-elder@linaro.org>
References: <20230215195352.755744-1-elder@linaro.org>
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

I spotted an error in a patch posted this week, unfortunately just
after it got accepted.  The effect of the bug is that time-based
interrupt moderation is disabled.  This is not technically a bug,
but it is not what is intended.  The problem is that a |= assignment
got implemented as a simple assignment, so the previously assigned
value was ignored.

Fixes: edc6158b18af ("net: ipa: define fields for event-ring related registers")
Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/gsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ipa/gsi.c b/drivers/net/ipa/gsi.c
index f44d2d843de12..05ea2502201da 100644
--- a/drivers/net/ipa/gsi.c
+++ b/drivers/net/ipa/gsi.c
@@ -762,7 +762,7 @@ static void gsi_evt_ring_program(struct gsi *gsi, u32 evt_ring_id)
 	/* Enable interrupt moderation by setting the moderation delay */
 	reg = gsi_reg(gsi, EV_CH_E_CNTXT_8);
 	val = reg_encode(reg, EV_MODT, GSI_EVT_RING_INT_MODT);
-	val = reg_encode(reg, EV_MODC, 1);	/* comes from channel */
+	val |= reg_encode(reg, EV_MODC, 1);	/* comes from channel */
 	/* EV_MOD_CNT is 0 (no counter-based interrupt coalescing) */
 	iowrite32(val, gsi->virt + reg_n_offset(reg, evt_ring_id));
 
-- 
2.34.1

