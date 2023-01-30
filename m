Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F5BD681C37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jan 2023 22:04:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230342AbjA3VEK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Jan 2023 16:04:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230296AbjA3VDz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Jan 2023 16:03:55 -0500
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9369527D5A
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 13:03:53 -0800 (PST)
Received: by mail-il1-x130.google.com with SMTP id z2so5128378ilq.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 13:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dM0y1yQcXWiFMZI5D02Tn6gafxuwKDl7gTmaBAdj+n8=;
        b=j5jAfAy0SfjdnpKaxOWTdmx/JhW/AWmoGzSpAwZUmP2Zy0IlmVplU1xuKKrZZzLUGg
         U5vlw8wBNxGR90mztzFpVIZqQcodf/ypx7ZOqk0s5VRfIvtFH2p6YlkbRhCWxchapwjZ
         5otexYaTtN87Sm4eXhINjgEhpkoJEqu0JmET4JZlDVepOS9qNmf5qBPnh1aAG6fMFcdV
         PjyuObiUZCHp6PvWmnuQ3BZtJ0PRbMHUX4zFn3qzQTmuOvnJXcETzLCGerEl6146b3Ev
         moD7AR+V2+HIaF5VrqRAmkdsgLWav0N8wzUpni3rtbYiciLAJdHARcFUkgvuRq0j7Mxx
         YdpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dM0y1yQcXWiFMZI5D02Tn6gafxuwKDl7gTmaBAdj+n8=;
        b=Hc3ZXCOSb+u8/a1srod/YMkZeDS8jYqHAIpyk+O5AW5s25c296r4zkmIRPuvwhcWrp
         +jPMM727CEookdtmYAq9go0u6KATySAbAiNqPZ3KmzI/fQveKL/YFEbPDq2W6io6VplX
         y2GmguxCMnLguFo3nsVn1qNCENgYdAatVX4zK9HnPO9ucYz08CyOPkaYpKI6jPxbYz7y
         yQmyYbw94R/zlpzNtrtSgRMxkPhLSLivAkZHg0Szi7131dG/ySJ2KlvTTlrFM89N2Od1
         lPu68ud6rr4ZylDVQ+Po4Sm3LKc7v9R2Ux2O4olcdS8XfolX4u3hDoB1hes1AbCIX9Gh
         iEsg==
X-Gm-Message-State: AO0yUKU/2ZDu5AX1xLgtnfrb6mex6TTeShXegQykapvWMRJEbheFejyw
        Y4U9xNju19kBqQ51NJUikrGwRA==
X-Google-Smtp-Source: AK7set/gHSEF7kOB76p04GVqM2c7AWCq9ftpz+QGvjPhHjCQ/I2JMhz66iBi9fBPqO0kK9OnT2l2cQ==
X-Received: by 2002:a05:6e02:1e08:b0:310:f849:83b9 with SMTP id g8-20020a056e021e0800b00310f84983b9mr4044843ila.9.1675112632939;
        Mon, 30 Jan 2023 13:03:52 -0800 (PST)
Received: from presto.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id a30-20020a02735e000000b003aef8fded9asm1992046jae.127.2023.01.30.13.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 13:03:52 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     caleb.connolly@linaro.org, mka@chromium.org, evgreen@chromium.org,
        andersson@kernel.org, quic_cpratapa@quicinc.com,
        quic_avuyyuru@quicinc.com, quic_jponduru@quicinc.com,
        quic_subashab@quicinc.com, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 6/8] net: ipa: greater timer granularity options
Date:   Mon, 30 Jan 2023 15:01:56 -0600
Message-Id: <20230130210158.4126129-7-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130210158.4126129-1-elder@linaro.org>
References: <20230130210158.4126129-1-elder@linaro.org>
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

Starting with IPA v5.0, the head-of-line blocking timer has more
than two pulse generators available to define timer granularity.
To prepare for that, change the way the field value is encoded
to use ipa_reg_encode() rather than ipa_reg_bit().

The aggregation granularity selection could (in principle) also use
an additional pulse generator starting with IPA v5.0.  Encode the
AGGR_GRAN_SEL field differently to allow that as well.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_endpoint.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ipa/ipa_endpoint.c b/drivers/net/ipa/ipa_endpoint.c
index 8909ba8bfd0e9..c029209191d41 100644
--- a/drivers/net/ipa/ipa_endpoint.c
+++ b/drivers/net/ipa/ipa_endpoint.c
@@ -965,7 +965,7 @@ static u32 aggr_time_limit_encode(struct ipa *ipa, const struct ipa_reg *reg,
 		ret = ipa_qtime_val(microseconds, max);
 		if (ret < 0) {
 			val = -ret;
-			gran_sel = ipa_reg_bit(reg, AGGR_GRAN_SEL);
+			gran_sel = ipa_reg_encode(reg, AGGR_GRAN_SEL, 1);
 		} else {
 			val = ret;
 			gran_sel = 0;
@@ -1057,7 +1057,7 @@ static u32 hol_block_timer_encode(struct ipa *ipa, const struct ipa_reg *reg,
 		ret = ipa_qtime_val(microseconds, max);
 		if (ret < 0) {
 			val = -ret;
-			gran_sel = ipa_reg_bit(reg, TIMER_GRAN_SEL);
+			gran_sel = ipa_reg_encode(reg, TIMER_GRAN_SEL, 1);
 		} else {
 			val = ret;
 			gran_sel = 0;
-- 
2.34.1

