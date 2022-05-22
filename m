Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE1D3530005
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 May 2022 02:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348258AbiEVAcq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 20:32:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347927AbiEVAcd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 20:32:33 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EED740931
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 17:32:32 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id y12so12136084ior.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 17:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w1h7lzBoTRhyrnPIVZrDCLdy25xtg4IsChqOgLd2WKk=;
        b=PTPwtLovhOsE11ooX/9DB0FEdX+sJIpSa7FNxpe2MzRMAc29BQRY/87J/gghpZlaHR
         Gu4/vFxwFtAZrsqoRHSxenYN2XSRM8laXMahnoLARsVn0clT3nRmTn2eF2bEb3quQ34e
         MezpcjuRVABCCgWSSgqfyw9rIZ+GpUqG6uLOKW39fGLpUNXLWCm2xEuqqQkMGh033lWF
         HReLueNOm/jQhwOGW/qAqCUtc0Q/BTa9lnG12eItT/q+C2UkVU0Tyz8jqsgfM00ncXF2
         ic8PiPUA4L2u0fqcrEv+jgQv6r2Gr8NXjfp3JRV0gmSbc6lYo8U131FvDkTXCWCPXO+t
         8D8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w1h7lzBoTRhyrnPIVZrDCLdy25xtg4IsChqOgLd2WKk=;
        b=4nhHGoHbPBv4juLPFZfKkjzzybrwtM2URczMgGLZCDWtKRsKdjaH7F1EsA+FWzmEmd
         IaVb7iV1JpvIX7MRdfPA7VWafsDAjcOUUYtGxgQ2lsc+9ZnFl3krna5ceg1mgKYKOjaY
         u2ndVVwZ2IolEiRVFpvHJQhIv2LxAef5jPmfjtq0/OcQq2jXLM8e8lYgrLRRxN2zzXkm
         RwCcngQBizXUKFOrV66m4ucumqKpgCWmDliqhDLULotlcvxkg4TZ4NBF0VUXRdt27cAn
         8neLd/MTzVnx7u9rHU451A9Uc6jXicFsfWb9zrgMBquG4wmGLpUKbQOCoNtqCEiq6Avw
         +dbQ==
X-Gm-Message-State: AOAM53342NKG+Y6oE6ursnKqsKVNpctLp1rUpHP018jxAOD9YZ6F9v3O
        nEGaBogjP2RKtg4/1dFEdVqxyQ==
X-Google-Smtp-Source: ABdhPJw2rchZw30QgObmn4lR9kWP2wPXd/KGSAKRpLux2f8JtTrVAukiW/XFW5bnYvuNHfPPq9cccA==
X-Received: by 2002:a6b:3e41:0:b0:65a:4456:90b8 with SMTP id l62-20020a6b3e41000000b0065a445690b8mr7491000ioa.57.1653179551901;
        Sat, 21 May 2022 17:32:31 -0700 (PDT)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id g8-20020a02c548000000b0032b5e78bfcbsm1757115jaj.135.2022.05.21.17.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 17:32:31 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, bjorn.andersson@linaro.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 5/9] net: ipa: count the number of modem TX endpoints
Date:   Sat, 21 May 2022 19:32:19 -0500
Message-Id: <20220522003223.1123705-6-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220522003223.1123705-1-elder@linaro.org>
References: <20220522003223.1123705-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In ipa_endpoint_modem_exception_reset_all(), a high estimate was
made of the number of endpoints that need their status register
updated.  We only used what was needed, so the high estimate didn't
matter much.

However the next few patches are going to limit the number of
commands in a single transaction, and the overestimate would exceed
that.  So count the number of modem TX endpoints at initialization
time, and use it in ipa_endpoint_modem_exception_reset_all().

Signed-off-by: Alex Elder <elder@linaro.org>
---
v2:  This is a new patch added to the series.

 drivers/net/ipa/ipa.h          |  2 ++
 drivers/net/ipa/ipa_endpoint.c | 10 +++++-----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ipa/ipa.h b/drivers/net/ipa/ipa.h
index 9fc880eb7e3a6..4fc3c72359f5e 100644
--- a/drivers/net/ipa/ipa.h
+++ b/drivers/net/ipa/ipa.h
@@ -62,6 +62,7 @@ struct ipa_interrupt;
  * @initialized:	Bit mask indicating endpoints initialized
  * @set_up:		Bit mask indicating endpoints set up
  * @enabled:		Bit mask indicating endpoints enabled
+ * @modem_tx_count:	Number of defined modem TX endoints
  * @endpoint:		Array of endpoint information
  * @channel_map:	Mapping of GSI channel to IPA endpoint
  * @name_map:		Mapping of IPA endpoint name to IPA endpoint
@@ -114,6 +115,7 @@ struct ipa {
 	u32 set_up;
 	u32 enabled;
 
+	u32 modem_tx_count;
 	struct ipa_endpoint endpoint[IPA_ENDPOINT_MAX];
 	struct ipa_endpoint *channel_map[GSI_CHANNEL_COUNT_MAX];
 	struct ipa_endpoint *name_map[IPA_ENDPOINT_COUNT];
diff --git a/drivers/net/ipa/ipa_endpoint.c b/drivers/net/ipa/ipa_endpoint.c
index 5ed5b8fd3ea36..385aa63ab4bbc 100644
--- a/drivers/net/ipa/ipa_endpoint.c
+++ b/drivers/net/ipa/ipa_endpoint.c
@@ -442,12 +442,10 @@ int ipa_endpoint_modem_exception_reset_all(struct ipa *ipa)
 	struct gsi_trans *trans;
 	u32 count;
 
-	/* We need one command per modem TX endpoint.  We can get an upper
-	 * bound on that by assuming all initialized endpoints are modem->IPA.
-	 * That won't happen, and we could be more precise, but this is fine
-	 * for now.  End the transaction with commands to clear the pipeline.
+	/* We need one command per modem TX endpoint, plus the commands
+	 * that clear the pipeline.
 	 */
-	count = hweight32(initialized) + ipa_cmd_pipeline_clear_count();
+	count = ipa->modem_tx_count + ipa_cmd_pipeline_clear_count();
 	trans = ipa_cmd_trans_alloc(ipa, count);
 	if (!trans) {
 		dev_err(&ipa->pdev->dev,
@@ -1924,6 +1922,8 @@ u32 ipa_endpoint_init(struct ipa *ipa, u32 count,
 
 		if (data->endpoint.filter_support)
 			filter_map |= BIT(data->endpoint_id);
+		if (data->ee_id == GSI_EE_MODEM && data->toward_ipa)
+			ipa->modem_tx_count++;
 	}
 
 	if (!ipa_filter_map_valid(ipa, filter_map))
-- 
2.32.0

