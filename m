Return-Path: <linux-arm-msm+bounces-1602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B714E7F543E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 00:09:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C1B828128F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 23:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A514020B05;
	Wed, 22 Nov 2023 23:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QmqVYXG7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7A071B6
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 15:09:16 -0800 (PST)
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-357cf6725acso1084405ab.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 15:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700694556; x=1701299356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PrdFQJL7LtkUn1w2VUnO0MAm6i+n93tJ5rqse/ufmbA=;
        b=QmqVYXG7Y9n8jUmEa7evMMVQqe89djsIkVxAVSqqrtTabB1Ruywn+YFKxw07B0pjoN
         zCIQ4GQksFppqpL9jpc4y+SpwUQ7K+72roQvx7TSl/L4CH9/ybN6Xvl7MxFHt92TgZAR
         YwjiHaB7xZyYgWIJUjws0KCf9/NODYIpQjIlIysqdLaNWfAyt2jjssJq0QDx+fFfidHP
         D/aogmFTMy6ib9soPT585t4QjYMcFhRSX/LLLSqd6JNU3RUqUH14yPYcHDo4U8MK7GUJ
         WPl3aP4Lc30HPxO/pyW1B1Bg9hEY/BQPYeRomBH+990jGaanhuiTv8I5wqpSplGqQctf
         CNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700694556; x=1701299356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PrdFQJL7LtkUn1w2VUnO0MAm6i+n93tJ5rqse/ufmbA=;
        b=RpRYdQxYxYlmf56IBVAn6PB3q/Jo11HghaC5YmIjOugpdNo76Bh1rew26T9TohAA18
         7LIUCi+a1E9NcgewFQ60+4GuamXJM9K5YWWN+d3ip5No8P/cH6Bh7Q0YveKrB1VEph9N
         hfIlZQ2rTcNFWvZEVySQDKeFiISFCOWNyQnWQ5OiFkBP3L5lme6m9bOV/oftqG/xpcjh
         q2kGKS58fnwKfbmFSgLzAv1eiJIYafFoptKDhZJtalhzDq3ENDDP2pcMy4y/SMm9gLQ8
         WugKf+wKpxutDH78UDjxA1+pqQADxE41QgCqIEacV4MYoBrmsAA5gSjrNoUJW5VdpKff
         p5mQ==
X-Gm-Message-State: AOJu0Yw9niqMDQAx0ZlXJs6HIXRf3+60ED6hmhFRrik6m5I9F4B6bPm4
	zp6FudN4tDeJHea/nn9cSlvaIQ==
X-Google-Smtp-Source: AGHT+IEBsG197MY1xKFYc8C0K6GBy637b/fOQl1hyapjF2Pm2x4aHOJ4C6RjiZdvRDUAzTw440tuGw==
X-Received: by 2002:a92:908:0:b0:359:d397:c806 with SMTP id y8-20020a920908000000b00359d397c806mr4244376ilg.18.1700694556008;
        Wed, 22 Nov 2023 15:09:16 -0800 (PST)
Received: from localhost.localdomain (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.gmail.com with ESMTPSA id fm29-20020a0566382b1d00b0043a20ad93c8sm117754jab.41.2023.11.22.15.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 15:09:15 -0800 (PST)
From: Alex Elder <elder@linaro.org>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	agross@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	mka@chromium.org,
	quic_cpratapa@quicinc.com,
	quic_avuyyuru@quicinc.com,
	quic_jponduru@quicinc.com,
	quic_subashab@quicinc.com,
	elder@kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 2/5] net: ipa: update IPA version comments in "ipa_reg.h"
Date: Wed, 22 Nov 2023 17:09:06 -0600
Message-Id: <20231122230909.895482-3-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231122230909.895482-1-elder@linaro.org>
References: <20231122230909.895482-1-elder@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some definitions in "ipa_reg.h" are only valid for certain versions
of IPA.  In such cases a comment indicates a version or range of
versions where the definition is (or is not) valid.  Almost all such
cases look like "IPA vX.Y", but a few don't include the "IPA" tag.

Update these so they all consistently include "IPA".  And replace
a few lines that talk about "the next bit" in the definition of the
ipa_irq_id enumerated type with a more concise comment using the
"IPA vX.Y" convention.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_reg.h | 86 +++++++++++++++++++--------------------
 1 file changed, 41 insertions(+), 45 deletions(-)

diff --git a/drivers/net/ipa/ipa_reg.h b/drivers/net/ipa/ipa_reg.h
index 3ac48dea865b2..aa1cbe76a4505 100644
--- a/drivers/net/ipa/ipa_reg.h
+++ b/drivers/net/ipa/ipa_reg.h
@@ -240,25 +240,25 @@ enum ipa_reg_local_pkt_proc_cntxt_field_id {
 
 /* COUNTER_CFG register */
 enum ipa_reg_counter_cfg_field_id {
-	EOT_COAL_GRANULARITY,				/* Not v3.5+ */
+	EOT_COAL_GRANULARITY,				/* Not IPA v3.5+ */
 	AGGR_GRANULARITY,
 };
 
 /* IPA_TX_CFG register */
 enum ipa_reg_ipa_tx_cfg_field_id {
-	TX0_PREFETCH_DISABLE,				/* Not v4.0+ */
-	TX1_PREFETCH_DISABLE,				/* Not v4.0+ */
-	PREFETCH_ALMOST_EMPTY_SIZE,			/* Not v4.0+ */
-	PREFETCH_ALMOST_EMPTY_SIZE_TX0,			/* v4.0+ */
-	DMAW_SCND_OUTSD_PRED_THRESHOLD,			/* v4.0+ */
-	DMAW_SCND_OUTSD_PRED_EN,			/* v4.0+ */
-	DMAW_MAX_BEATS_256_DIS,				/* v4.0+ */
-	PA_MASK_EN,					/* v4.0+ */
-	PREFETCH_ALMOST_EMPTY_SIZE_TX1,			/* v4.0+ */
-	DUAL_TX_ENABLE,					/* v4.5+ */
-	SSPND_PA_NO_START_STATE,			/* v4,2+, not v4.5 */
-	SSPND_PA_NO_BQ_STATE,				/* v4.2 only */
-	HOLB_STICKY_DROP_EN,				/* v5.0+ */
+	TX0_PREFETCH_DISABLE,				/* Not IPA v4.0+ */
+	TX1_PREFETCH_DISABLE,				/* Not IPA v4.0+ */
+	PREFETCH_ALMOST_EMPTY_SIZE,			/* Not IPA v4.0+ */
+	PREFETCH_ALMOST_EMPTY_SIZE_TX0,			/* IPA v4.0+ */
+	DMAW_SCND_OUTSD_PRED_THRESHOLD,			/* IPA v4.0+ */
+	DMAW_SCND_OUTSD_PRED_EN,			/* IPA v4.0+ */
+	DMAW_MAX_BEATS_256_DIS,				/* IPA v4.0+ */
+	PA_MASK_EN,					/* IPA v4.0+ */
+	PREFETCH_ALMOST_EMPTY_SIZE_TX1,			/* IPA v4.0+ */
+	DUAL_TX_ENABLE,					/* IPA v4.5+ */
+	SSPND_PA_NO_START_STATE,		/* IPA v4,2+, not IPA v4.5 */
+	SSPND_PA_NO_BQ_STATE,				/* IPA v4.2 only */
+	HOLB_STICKY_DROP_EN,				/* IPA v5.0+ */
 };
 
 /* FLAVOR_0 register */
@@ -319,8 +319,8 @@ enum ipa_reg_rsrc_grp_rsrc_type_field_id {
 
 /* ENDP_INIT_CTRL register */
 enum ipa_reg_endp_init_ctrl_field_id {
-	ENDP_SUSPEND,					/* Not v4.0+ */
-	ENDP_DELAY,					/* Not v4.2+ */
+	ENDP_SUSPEND,					/* Not IPA v4.0+ */
+	ENDP_DELAY,					/* Not IPA v4.2+ */
 };
 
 /* ENDP_INIT_CFG register */
@@ -359,11 +359,11 @@ enum ipa_reg_endp_init_hdr_field_id {
 	HDR_ADDITIONAL_CONST_LEN,
 	HDR_OFST_PKT_SIZE_VALID,
 	HDR_OFST_PKT_SIZE,
-	HDR_A5_MUX,					/* Not v4.9+ */
+	HDR_A5_MUX,					/* Not IPA v4.9+ */
 	HDR_LEN_INC_DEAGG_HDR,
-	HDR_METADATA_REG_VALID,				/* Not v4.5+ */
-	HDR_LEN_MSB,					/* v4.5+ */
-	HDR_OFST_METADATA_MSB,				/* v4.5+ */
+	HDR_METADATA_REG_VALID,				/* Not IPA v4.5+ */
+	HDR_LEN_MSB,					/* IPA v4.5+ */
+	HDR_OFST_METADATA_MSB,				/* IPA v4.5+ */
 };
 
 /* ENDP_INIT_HDR_EXT register */
@@ -374,23 +374,23 @@ enum ipa_reg_endp_init_hdr_ext_field_id {
 	HDR_PAYLOAD_LEN_INC_PADDING,
 	HDR_TOTAL_LEN_OR_PAD_OFFSET,
 	HDR_PAD_TO_ALIGNMENT,
-	HDR_TOTAL_LEN_OR_PAD_OFFSET_MSB,		/* v4.5+ */
-	HDR_OFST_PKT_SIZE_MSB,				/* v4.5+ */
-	HDR_ADDITIONAL_CONST_LEN_MSB,			/* v4.5+ */
-	HDR_BYTES_TO_REMOVE_VALID,			/* v5.0+ */
-	HDR_BYTES_TO_REMOVE,				/* v5.0+ */
+	HDR_TOTAL_LEN_OR_PAD_OFFSET_MSB,		/* IPA v4.5+ */
+	HDR_OFST_PKT_SIZE_MSB,				/* IPA v4.5+ */
+	HDR_ADDITIONAL_CONST_LEN_MSB,			/* IPA v4.5+ */
+	HDR_BYTES_TO_REMOVE_VALID,			/* IPA v5.0+ */
+	HDR_BYTES_TO_REMOVE,				/* IPA v5.0+ */
 };
 
 /* ENDP_INIT_MODE register */
 enum ipa_reg_endp_init_mode_field_id {
 	ENDP_MODE,
-	DCPH_ENABLE,					/* v4.5+ */
+	DCPH_ENABLE,					/* IPA v4.5+ */
 	DEST_PIPE_INDEX,
 	BYTE_THRESHOLD,
 	PIPE_REPLICATION_EN,
 	PAD_EN,
-	HDR_FTCH_DISABLE,				/* v4.5+ */
-	DRBIP_ACL_ENABLE,				/* v4.9+ */
+	HDR_FTCH_DISABLE,				/* IPA v4.5+ */
+	DRBIP_ACL_ENABLE,				/* IPA v4.9+ */
 };
 
 /** enum ipa_mode - ENDP_INIT_MODE register MODE field value */
@@ -439,10 +439,10 @@ enum ipa_reg_endp_init_hol_block_en_field_id {
 
 /* ENDP_INIT_HOL_BLOCK_TIMER register */
 enum ipa_reg_endp_init_hol_block_timer_field_id {
-	TIMER_BASE_VALUE,				/* Not v4.5+ */
-	TIMER_SCALE,					/* v4.2 only */
-	TIMER_LIMIT,					/* v4.5+ */
-	TIMER_GRAN_SEL,					/* v4.5+ */
+	TIMER_BASE_VALUE,				/* Not IPA v4.5+ */
+	TIMER_SCALE,					/* IPA v4.2 only */
+	TIMER_LIMIT,					/* IPA v4.5+ */
+	TIMER_GRAN_SEL,					/* IPA v4.5+ */
 };
 
 /* ENDP_INIT_DEAGGR register */
@@ -463,7 +463,7 @@ enum ipa_reg_endp_init_rsrc_grp_field_id {
 /* ENDP_INIT_SEQ register */
 enum ipa_reg_endp_init_seq_field_id {
 	SEQ_TYPE,
-	SEQ_REP_TYPE,					/* Not v4.5+ */
+	SEQ_REP_TYPE,					/* Not IPA v4.5+ */
 };
 
 /**
@@ -512,8 +512,8 @@ enum ipa_seq_rep_type {
 enum ipa_reg_endp_status_field_id {
 	STATUS_EN,
 	STATUS_ENDP,
-	STATUS_LOCATION,				/* Not v4.5+ */
-	STATUS_PKT_SUPPRESS,				/* v4.0+ */
+	STATUS_LOCATION,				/* Not IPA v4.5+ */
+	STATUS_PKT_SUPPRESS,				/* IPA v4.0+ */
 };
 
 /* ENDP_FILTER_ROUTER_HSH_CFG register */
@@ -588,8 +588,7 @@ enum ipa_reg_endp_cache_cfg_field_id {
  */
 enum ipa_irq_id {
 	IPA_IRQ_BAD_SNOC_ACCESS			= 0x0,
-	/* The next bit is not present for IPA v3.5+ */
-	IPA_IRQ_EOT_COAL			= 0x1,
+	IPA_IRQ_EOT_COAL			= 0x1,	/* Not IPA v3.5+ */
 	IPA_IRQ_UC_0				= 0x2,
 	IPA_IRQ_UC_1				= 0x3,
 	IPA_IRQ_UC_2				= 0x4,
@@ -610,17 +609,14 @@ enum ipa_irq_id {
 	IPA_IRQ_PIPE_YELLOW_ABOVE		= 0x13,
 	IPA_IRQ_PIPE_RED_ABOVE			= 0x14,
 	IPA_IRQ_UCP				= 0x15,
-	/* The next bit is not present for IPA v4.5+ */
-	IPA_IRQ_DCMP				= 0x16,
+	IPA_IRQ_DCMP				= 0x16,	/* Not IPA v4.5+ */
 	IPA_IRQ_GSI_EE				= 0x17,
 	IPA_IRQ_GSI_IPA_IF_TLV_RCVD		= 0x18,
 	IPA_IRQ_GSI_UC				= 0x19,
-	/* The next bit is present for IPA v4.5+ */
-	IPA_IRQ_TLV_LEN_MIN_DSM			= 0x1a,
-	/* The next three bits are present for IPA v4.9+ */
-	IPA_IRQ_DRBIP_PKT_EXCEED_MAX_SIZE_EN	= 0x1b,
-	IPA_IRQ_DRBIP_DATA_SCTR_CFG_ERROR_EN	= 0x1c,
-	IPA_IRQ_DRBIP_IMM_CMD_NO_FLSH_HZRD_EN	= 0x1d,
+	IPA_IRQ_TLV_LEN_MIN_DSM			= 0x1a,	/* IPA v4.5+ */
+	IPA_IRQ_DRBIP_PKT_EXCEED_MAX_SIZE_EN	= 0x1b,	/* IPA v4.9+ */
+	IPA_IRQ_DRBIP_DATA_SCTR_CFG_ERROR_EN	= 0x1c,	/* IPA v4.9+ */
+	IPA_IRQ_DRBIP_IMM_CMD_NO_FLSH_HZRD_EN	= 0x1d,	/* IPA v4.9+ */
 	IPA_IRQ_COUNT,				/* Last; not an id */
 };
 
-- 
2.34.1


