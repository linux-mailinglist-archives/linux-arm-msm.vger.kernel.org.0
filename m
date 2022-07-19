Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D11C57A1ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 16:40:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239579AbiGSOk3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jul 2022 10:40:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239208AbiGSOkE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jul 2022 10:40:04 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49A1454AE9
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 07:36:03 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id u20so11935764iob.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 07:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wk2czZHfKCNnzO8KQpU2wlKEqgQnnAKT3z+bj9HU5pA=;
        b=NcQSvw7Gb7qySkIMjDLseOccJuRspSwEBfpM8Wp2nKjABwffQqHD7FWib+EWERoRv3
         Lcx4qq3k5nXxBqjeiIfEFNQsVd1k4Db1Q0nl8LkiGZHEb7L+AFAQTP4ruD2wMYWXg+lT
         KvG48Eeu1l/QQY2ubIns1KycpBaH72PmaViZxfK7YH4QffoYuOrZP8M8e+alTli04FnT
         8lpmNgWGihFwumW4pgATYsvW9thPOG8MkDiyuRWjcfeGJ6zUQy5s7kKKhoNooZYSgqu1
         WnX+/f/dbNWTHDk2rGOkEYgbqDN/5leGEtE2BapEBETLY7C4gZG7EvXqmwZRaTM7l3lV
         tylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wk2czZHfKCNnzO8KQpU2wlKEqgQnnAKT3z+bj9HU5pA=;
        b=6j8GUhlaehLyv/hSZxmut1WzrfqeO5gChtk4NVT0k3Q9DGSLPj3gd36NjYJ6plZhxN
         x2zCIbA6pz7hnoDO8mkMK8wCkMjUOGr40QjYz/tq2caN3B2rObtRUDFnGsbziKdQYvF6
         lrMDe0Xu3S1YT2tDHZfmYFDhmdSd3WjqEqQB5c1/QiPEw0x39ma2JcV2KqVwBYGV9IK+
         m/bKer4DtOZ2U4DhFsIJ+/xEQ4W1gSVFBVQHGzxQCF2B0kQN7y+3SSVr3qOO0nVc6TwF
         0QgFZptLSpDjPSA6OO1dxGSYyBjcfw3hROQxGnEikH30SAbUp2F2SB73poXWPYLOr19I
         UjUQ==
X-Gm-Message-State: AJIora+1zNczhU/5FHtVndUDAS9NRDmF67nVYoKev2u6ZT2F2dyX4+/n
        hz6vF5ZesJZtHVPyvE2BQ1TCBA==
X-Google-Smtp-Source: AGRyM1umkGAm0Fy8Nvn7mJsnFAGVW42OOmvuy4PoGRqz0pD7C9alR/0i4ymidJaA2pOYCgvnVhpWWA==
X-Received: by 2002:a05:6638:3043:b0:335:ce04:2053 with SMTP id u3-20020a056638304300b00335ce042053mr17986644jak.294.1658241362460;
        Tue, 19 Jul 2022 07:36:02 -0700 (PDT)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id t16-20020a056602141000b00675a83bc1e3sm7286559iov.13.2022.07.19.07.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 07:36:02 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, bjorn.andersson@linaro.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 5/5] net: ipa: fix an outdated comment
Date:   Tue, 19 Jul 2022 09:35:53 -0500
Message-Id: <20220719143553.280908-6-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220719143553.280908-1-elder@linaro.org>
References: <20220719143553.280908-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since commit 8797972afff3d ("net: ipa: remove command info pool"),
we don't allocate "command info" entries for command channel
transactions.  Fix a comment that seems to suggest we still do.
(Even before that commit, the comment was out of place.)

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/gsi_trans.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ipa/gsi_trans.c b/drivers/net/ipa/gsi_trans.c
index b298ca7968907..76c440cee2e60 100644
--- a/drivers/net/ipa/gsi_trans.c
+++ b/drivers/net/ipa/gsi_trans.c
@@ -362,7 +362,7 @@ struct gsi_trans *gsi_channel_trans_alloc(struct gsi *gsi, u32 channel_id,
 	trans->rsvd_count = tre_count;
 	init_completion(&trans->completion);
 
-	/* Allocate the scatterlist and (if requested) info entries. */
+	/* Allocate the scatterlist */
 	trans->sgl = gsi_trans_pool_alloc(&trans_info->sg_pool, tre_count);
 	sg_init_marker(trans->sgl, tre_count);
 
-- 
2.34.1

