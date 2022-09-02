Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8F55AB9C1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Sep 2022 23:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbiIBVC1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Sep 2022 17:02:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230459AbiIBVC0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Sep 2022 17:02:26 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE9E6B4424
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Sep 2022 14:02:24 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id c4so2663026iof.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Sep 2022 14:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Hl3DE3DGBmmIurt4RnwSIbwXbwcvmQfsOkHdcjb4ehA=;
        b=nIFAP19qCeoYKPNI7pbOjx3eI6VLjPRIQwMe1yCLxXwR/qvklSstwH5D2RrS3K1ekL
         B/nFskNKtZLOfjx6Ro5SJnDLg2SkF2Doao6PZd/B+8hvr1pS/HzhdNKG40sWUA/Ymaq8
         boBbWsnHZ9VEPqeVngwQ1Ac5bg5ixgmE0TexIIcZl+5/ZUL2cxgMMCBGs+OTpYpobd0L
         1ZPKkKlNoS/zVoFNSMoYC2QKgXc8gWAIuYlS5kpslpk2sYKjm6lyJJv53fP5xd4LoSt4
         GvGMGxG0Gu/qeG6UcU/LWRGVIYRcCcz5VTCk/NIiuc5KMbc/lkPQOfZpwJ7+ThXabsjN
         B1Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Hl3DE3DGBmmIurt4RnwSIbwXbwcvmQfsOkHdcjb4ehA=;
        b=tZPgXGiZ3vLcD1iVAv1GSP1ErbgMGLcPXsbIs9Ou6b9iFqA25vneFn8PYYo8tlBcpq
         nS+QnufZAgaoL7YcmSIuIMRb3PKxpsOztA9K8pu/gzQHitEmd9wcce+WG40ezHEh6pyv
         RUrysWTUW5rW13mxRDWu6+jtVNtrNyZqZKCQFbvittUxgyN32WOPZgTW66VG7yKeki86
         hRFfIiDTsxRhpL3h690n8h02TeTl9OUzfE4Imm8BDUBKsLDFUSDwHdcHNRPHOKm9Y5Xk
         2GIbM2rx9VKqrd4VHpBZLtrZinehk9iXI43bVw/eHMTcOHAdI1Rmo+z8wUmscRTsooFf
         GVyQ==
X-Gm-Message-State: ACgBeo0jQnkoSco/it2+XrgwNXguhebJO/tWpy/W9sYYRCi4Ks7wWdr7
        bWXathDWrMrV9Yo0RfaiLiewYg==
X-Google-Smtp-Source: AA6agR4QdOByxczM9RKD1gLXTWthZsvFuwAYY1NtHLAzxExT6iLpugn99qjPLbhyJwTHBKHQP4LA3g==
X-Received: by 2002:a6b:5d01:0:b0:688:ac7c:95ec with SMTP id r1-20020a6b5d01000000b00688ac7c95ecmr18308999iob.142.1662152544086;
        Fri, 02 Sep 2022 14:02:24 -0700 (PDT)
Received: from presto.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id i7-20020a0566022c8700b00689e718d971sm1259208iow.51.2022.09.02.14.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 14:02:23 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, bjorn.andersson@linaro.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 2/6] net: ipa: use IDs for last allocated transaction
Date:   Fri,  2 Sep 2022 16:02:14 -0500
Message-Id: <20220902210218.745873-3-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220902210218.745873-1-elder@linaro.org>
References: <20220902210218.745873-1-elder@linaro.org>
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

Use the allocated and free transaction IDs to determine whether the
"last" transaction used for quiescing a channel is in allocated
state.  The last allocated transaction that has not been committed
(if any) immediately precedes the first free transaction in the
transaction array.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/gsi.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ipa/gsi.c b/drivers/net/ipa/gsi.c
index 0ea98fa5dee56..135e51980d793 100644
--- a/drivers/net/ipa/gsi.c
+++ b/drivers/net/ipa/gsi.c
@@ -711,6 +711,8 @@ static struct gsi_trans *gsi_channel_trans_last(struct gsi_channel *channel)
 {
 	struct gsi_trans_info *trans_info = &channel->trans_info;
 	struct gsi_trans *trans;
+	u16 trans_index;
+	u16 trans_id;
 
 	spin_lock_bh(&trans_info->spinlock);
 
@@ -718,10 +720,14 @@ static struct gsi_trans *gsi_channel_trans_last(struct gsi_channel *channel)
 	 * before we disabled transmits, so check for that.
 	 */
 	if (channel->toward_ipa) {
-		trans = list_last_entry_or_null(&trans_info->alloc,
-						struct gsi_trans, links);
-		if (trans)
+		/* The last allocated transaction precedes the first free */
+		if (trans_info->allocated_id != trans_info->free_id) {
+			trans_id = trans_info->free_id - 1;
+			trans_index = trans_id % channel->tre_count;
+			trans = &trans_info->trans[trans_index];
 			goto done;
+		}
+
 		trans = list_last_entry_or_null(&trans_info->committed,
 						struct gsi_trans, links);
 		if (trans)
-- 
2.34.1

