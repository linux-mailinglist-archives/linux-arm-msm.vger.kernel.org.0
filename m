Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C34068F935
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 21:57:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232358AbjBHU5h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 15:57:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231976AbjBHU51 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 15:57:27 -0500
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B5574672C
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 12:57:21 -0800 (PST)
Received: by mail-il1-x134.google.com with SMTP id v15so18920ilc.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 12:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOlqwmHHH1NdfQPZELO6lO0jAthsz5j3T6gQsxNYaGc=;
        b=HDDxnLA2j9uAi2Sk4hUBrZNA0QxpY3KvxmJJ80yMOp7e/T1DKCnlCRA/1OgAIbCCsu
         MWx3/YnUgQrudKIsQGRYjxwJytz9fWAkigZz9siA9xRNZ5Ih9xB+/rE2dNtNd5WMgMtW
         iinTfXrG6YCEqIT706+gdsJ45/KImohKbGyxJAPNr/NqaLj+SLRgcKQjK2vraqRFZ+eH
         gfT7nVemiK1Wurvj0nw+pTi+buvgZNgWtppCXd82JCwKMAivsooEQ16RFOiUqN0e17d+
         p+qLfMXEIkKfz/Rvw/Z4xSeKWVhsHh85HJVkybJ2g/6bzKsGP0lCEMrzBfu0aUVmQR0M
         yS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZOlqwmHHH1NdfQPZELO6lO0jAthsz5j3T6gQsxNYaGc=;
        b=SMOR/q68ZwiMBHrz8ii+eRC9dVnOIHHwmf0XrxjVm7MlPbW/u0nvo/FDjpzQqaFb9e
         auxiStVWfhu17JVbTwD8fcvj/qicKFu11DdMnI3vHdj9RLo0+qQndwlehn9pVvwzV7Ug
         DePodcnDWRa535HiAU9zwcvmVTvoqNWZT+s46HEnzWCKsFb6lK7TlUmd9gU2WsFriVCy
         HOg5GKbiqkSBp6cMBDZPbuHLka/57v63ZFT2OZikp+Mws5+MTXZG7LhIgU3e0nWzaEZM
         Y5T28t/k+w4rANKAna7gi4aHWOoLwXvaas7ejTR5uQZXOZYPxT7vkcd4KGmB2sCV6Fwd
         Fe1A==
X-Gm-Message-State: AO0yUKW4/AETnEau/VyoTFYBFliGHCr/ptu/5r9UUPfQdHxnaPLJFvRv
        vpVUSOdPPZRF/s0lecpcxzjaEQ==
X-Google-Smtp-Source: AK7set/3WeZcn3UWNFdAjMQN6BzAOHv3Xc68J+jR7feHT0IF0mFXOl8Y5pML8f8osAvpdpeGeHsFkg==
X-Received: by 2002:a92:c149:0:b0:313:c491:52dd with SMTP id b9-20020a92c149000000b00313c49152ddmr2600659ilh.8.1675889840392;
        Wed, 08 Feb 2023 12:57:20 -0800 (PST)
Received: from presto.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id r6-20020a922a06000000b0031093e9c7fasm5236704ile.85.2023.02.08.12.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 12:57:18 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     caleb.connolly@linaro.org, mka@chromium.org, evgreen@chromium.org,
        andersson@kernel.org, quic_cpratapa@quicinc.com,
        quic_avuyyuru@quicinc.com, quic_jponduru@quicinc.com,
        quic_subashab@quicinc.com, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 4/9] net: ipa: tighten up IPA register validity checking
Date:   Wed,  8 Feb 2023 14:56:48 -0600
Message-Id: <20230208205653.177700-5-elder@linaro.org>
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

When checking the validity of an IPA register ID, compare it against
all possible ipa_reg_id values.

Rename the function ipa_reg_id_valid() to be specific about what's
being checked.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_reg.c | 49 +++++++++++++++++++++++++++++++++++----
 1 file changed, 45 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ipa/ipa_reg.c b/drivers/net/ipa/ipa_reg.c
index d3d05420c5e91..65d747200be3c 100644
--- a/drivers/net/ipa/ipa_reg.c
+++ b/drivers/net/ipa/ipa_reg.c
@@ -9,8 +9,8 @@
 #include "ipa.h"
 #include "ipa_reg.h"
 
-/* Is this register valid and defined for the current IPA version? */
-static bool ipa_reg_valid(struct ipa *ipa, enum ipa_reg_id reg_id)
+/* Is this register ID valid for the current IPA version? */
+static bool ipa_reg_id_valid(struct ipa *ipa, enum ipa_reg_id reg_id)
 {
 	enum ipa_version version = ipa->version;
 	bool valid;
@@ -57,8 +57,49 @@ static bool ipa_reg_valid(struct ipa *ipa, enum ipa_reg_id reg_id)
 		valid = version >= IPA_VERSION_3_1;
 		break;
 
+	case COMP_CFG:
+	case CLKON_CFG:
+	case ROUTE:
+	case SHARED_MEM_SIZE:
+	case QSB_MAX_WRITES:
+	case QSB_MAX_READS:
+	case FILT_ROUT_HASH_EN:
+	case FILT_ROUT_CACHE_CFG:
+	case FILT_ROUT_HASH_FLUSH:
+	case FILT_ROUT_CACHE_FLUSH:
+	case STATE_AGGR_ACTIVE:
+	case LOCAL_PKT_PROC_CNTXT:
+	case AGGR_FORCE_CLOSE:
+	case SRC_RSRC_GRP_01_RSRC_TYPE:
+	case SRC_RSRC_GRP_23_RSRC_TYPE:
+	case DST_RSRC_GRP_01_RSRC_TYPE:
+	case DST_RSRC_GRP_23_RSRC_TYPE:
+	case ENDP_INIT_CTRL:
+	case ENDP_INIT_CFG:
+	case ENDP_INIT_NAT:
+	case ENDP_INIT_HDR:
+	case ENDP_INIT_HDR_EXT:
+	case ENDP_INIT_HDR_METADATA_MASK:
+	case ENDP_INIT_MODE:
+	case ENDP_INIT_AGGR:
+	case ENDP_INIT_HOL_BLOCK_EN:
+	case ENDP_INIT_HOL_BLOCK_TIMER:
+	case ENDP_INIT_DEAGGR:
+	case ENDP_INIT_RSRC_GRP:
+	case ENDP_INIT_SEQ:
+	case ENDP_STATUS:
+	case ENDP_FILTER_CACHE_CFG:
+	case ENDP_ROUTER_CACHE_CFG:
+	case IPA_IRQ_STTS:
+	case IPA_IRQ_EN:
+	case IPA_IRQ_CLR:
+	case IPA_IRQ_UC:
+	case IRQ_SUSPEND_INFO:
+		valid = true;	/* These should be defined for all versions */
+		break;
+
 	default:
-		valid = true;	/* Others should be defined for all versions */
+		valid = false;
 		break;
 	}
 
@@ -69,7 +110,7 @@ static bool ipa_reg_valid(struct ipa *ipa, enum ipa_reg_id reg_id)
 
 const struct ipa_reg *ipa_reg(struct ipa *ipa, enum ipa_reg_id reg_id)
 {
-	if (WARN_ON(!ipa_reg_valid(ipa, reg_id)))
+	if (WARN_ON(!ipa_reg_id_valid(ipa, reg_id)))
 		return NULL;
 
 	return ipa->regs->reg[reg_id];
-- 
2.34.1

