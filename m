Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF7DC5E6F91
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Sep 2022 00:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231609AbiIVWVN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 18:21:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231215AbiIVWVL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 18:21:11 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B55610D656
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 15:21:10 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id p202so2674831iod.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 15:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ybkiqrZQo1QQIIoJIKPprmgORGixQ/ko91UWMUF73QQ=;
        b=xl+nH3bUaprBGonS7kXU93KnO2b7BCackcckjSOJRZcmqJAbaeTG8ZW86oMIPTecaV
         MRqmdCMhfsqZeiPHL1tTo3H4NdZb7Segq+s/qzVE34mGNQ21285Jq2uHqbzJ9mhkft48
         xBLncLgFx0jLAGAQs9rRIo0wjFSyO8+E7uZmMZHCymMfHkuM7PnRC5j+N1rgwSuQW73I
         eMgYQR/n6vf+6vO5nhMMyIcUSEOJdN6J+n4FvGTpi0jlzl+nrZOgPY5/kOV88NyWxIEM
         oIB4fVmlvXEL8CHdAI7kM3RRdH5T7xYkwRHb2jn3lxsUsrA3yM5KseOXyxDqnkIX5sFI
         z/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ybkiqrZQo1QQIIoJIKPprmgORGixQ/ko91UWMUF73QQ=;
        b=oA+NWB/wTnfP19uxgErX57WOv6P8ICUlghmGpN+kGfZ5qMcbNH0Fhwqp0CfU9CJsNU
         f+5EdQgasc5CAnzoP/AgYzvwTJT4oWAzmaYAm4A6c+Y7kfEArVKujMNUt+3Xm+KUe8IG
         ByT5OFrqjgAdNhzTH5ceeqMvb447DvHq1hLLzsLi4c0MPgqepnZChWMpz+l5PkeAZCam
         8mi8Ln/Fc5D6F7XZp9/Qjqp7d5U8ZiHXUh/9GMcMf3RCBS2ZBxJCaEa9wbyXjqxx5Ltv
         D4jKdR6iKFsCshZQY+17PPtFuIHRjVtCenBVMLp/JZGt2U6Y54tjQdFNuS7yrI1xrCfi
         WzKQ==
X-Gm-Message-State: ACrzQf1qDQt+c303Yj8kyk4AtWmOdO/pBVBqoTSaAmRaSgIMQiuxIxoZ
        o8Cusuq9vAzmaX5UfhHqME/0Yw==
X-Google-Smtp-Source: AMsMyM5XuMdSWispqeU7nZFRD2uSSOXQmr3nsXfL3q/EZwlHAFlAMFgMgQYR16/dHVeKj4SCDtDPTQ==
X-Received: by 2002:a05:6602:1551:b0:6a1:6852:baa7 with SMTP id h17-20020a056602155100b006a16852baa7mr2607864iow.48.1663885269717;
        Thu, 22 Sep 2022 15:21:09 -0700 (PDT)
Received: from localhost.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id g12-20020a92d7cc000000b002f592936fbfsm2483332ilq.41.2022.09.22.15.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 15:21:09 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, andersson@kernel.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 5/8] net: ipa: tidy up register enum definitions
Date:   Thu, 22 Sep 2022 17:20:57 -0500
Message-Id: <20220922222100.2543621-6-elder@linaro.org>
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

Update a few enumerated type definitions in "ipa_reg.h" so that the
values assigned to each member align on the same column.  Where a
"TX" or "RX" (or both) comment is present, move that annotation into
a separate comment between the member name and its value.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_reg.h | 42 +++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ipa/ipa_reg.h b/drivers/net/ipa/ipa_reg.h
index 2aa1d1dd0adf5..f593cf3187950 100644
--- a/drivers/net/ipa/ipa_reg.h
+++ b/drivers/net/ipa/ipa_reg.h
@@ -363,10 +363,10 @@ enum ipa_pulse_gran {
 
 /** enum ipa_cs_offload_en - ENDP_INIT_CFG register CS_OFFLOAD_EN field value */
 enum ipa_cs_offload_en {
-	IPA_CS_OFFLOAD_NONE		= 0x0,
-	IPA_CS_OFFLOAD_UL		= 0x1,	/* Before IPA v4.5 (TX) */
-	IPA_CS_OFFLOAD_DL		= 0x2,	/* Before IPA v4.5 (RX) */
-	IPA_CS_OFFLOAD_INLINE		= 0x1,	/* IPA v4.5 (TX and RX) */
+	IPA_CS_OFFLOAD_NONE			= 0x0,
+	IPA_CS_OFFLOAD_UL	/* TX */	= 0x1,	/* Not IPA v4.5+ */
+	IPA_CS_OFFLOAD_DL	/* RX */	= 0x2,	/* Not IPA v4.5+ */
+	IPA_CS_OFFLOAD_INLINE	/* TX and RX */	= 0x1,	/* IPA v4.5+ */
 };
 
 /* Valid only for TX (IPA consumer) endpoints */
@@ -376,9 +376,9 @@ enum ipa_cs_offload_en {
 
 /** enum ipa_nat_en - ENDP_INIT_NAT register NAT_EN field value */
 enum ipa_nat_en {
-	IPA_NAT_BYPASS			= 0x0,
-	IPA_NAT_SRC			= 0x1,
-	IPA_NAT_DST			= 0x2,
+	IPA_NAT_BYPASS				= 0x0,
+	IPA_NAT_SRC				= 0x1,
+	IPA_NAT_DST				= 0x2,
 };
 
 #define IPA_REG_ENDP_INIT_HDR_N_OFFSET(ep) \
@@ -472,10 +472,10 @@ static inline u32 ipa_metadata_offset_encoded(enum ipa_version version,
 
 /** enum ipa_mode - ENDP_INIT_MODE register MODE field value */
 enum ipa_mode {
-	IPA_BASIC			= 0x0,
-	IPA_ENABLE_FRAMING_HDLC		= 0x1,
-	IPA_ENABLE_DEFRAMING_HDLC	= 0x2,
-	IPA_DMA				= 0x3,
+	IPA_BASIC				= 0x0,
+	IPA_ENABLE_FRAMING_HDLC			= 0x1,
+	IPA_ENABLE_DEFRAMING_HDLC		= 0x2,
+	IPA_DMA					= 0x3,
 };
 
 #define IPA_REG_ENDP_INIT_AGGR_N_OFFSET(ep) \
@@ -524,20 +524,20 @@ static inline u32 aggr_hard_byte_limit_enable_fmask(bool legacy)
 
 /** enum ipa_aggr_en - ENDP_INIT_AGGR register AGGR_EN field value */
 enum ipa_aggr_en {
-	IPA_BYPASS_AGGR			= 0x0,	/* (TX, RX) */
-	IPA_ENABLE_AGGR			= 0x1,	/* (RX) */
-	IPA_ENABLE_DEAGGR		= 0x2,	/* (TX) */
+	IPA_BYPASS_AGGR		/* TX and RX */	= 0x0,
+	IPA_ENABLE_AGGR		/* RX */	= 0x1,
+	IPA_ENABLE_DEAGGR	/* TX */	= 0x2,
 };
 
 /** enum ipa_aggr_type - ENDP_INIT_AGGR register AGGR_TYPE field value */
 enum ipa_aggr_type {
-	IPA_MBIM_16			= 0x0,
-	IPA_HDLC			= 0x1,
-	IPA_TLP				= 0x2,
-	IPA_RNDIS			= 0x3,
-	IPA_GENERIC			= 0x4,
-	IPA_COALESCE			= 0x5,
-	IPA_QCMAP			= 0x6,
+	IPA_MBIM_16				= 0x0,
+	IPA_HDLC				= 0x1,
+	IPA_TLP					= 0x2,
+	IPA_RNDIS				= 0x3,
+	IPA_GENERIC				= 0x4,
+	IPA_COALESCE				= 0x5,
+	IPA_QCMAP				= 0x6,
 };
 
 /* Valid only for RX (IPA producer) endpoints */
-- 
2.34.1

