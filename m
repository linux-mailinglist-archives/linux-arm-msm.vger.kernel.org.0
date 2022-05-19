Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D23FF52CD1E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 May 2022 09:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234274AbiESHdM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 May 2022 03:33:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234351AbiESHdK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 May 2022 03:33:10 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2D989346E
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 00:33:08 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id s5so5180596ljd.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 00:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=02WDeOSMIYv9VygVENpU4aQEdAwWRy14MQW+7Vqn7rU=;
        b=dUMi81mE4V7/V6IQF8u71oL2zFApG5nLqBa8ToVt8Fd1ND8vj39qB1SOjD2ceM3cpM
         QFG4Xe1UR/CU26g6RVpysSBLRuT+qwZ47K6XKtD44uu5QXO87WwHLu7xnV5v0cq2LqL8
         a4mbj3X6QjAR5wPDkl8yw/fubCSUJtDFRF1C8MascdqqRZT/JI9NeUVlCoVhb4NA8VeM
         +RwIrVpmQvp3Z+VU9GF2V//h8FWaDJHzsVNxXqgrw+6MsN7LJn1zKL164LI1o9rsLgwQ
         C8slFJS8UH+C7LW/4KLpePA28OOQUxUBftznKKvURS3U1Mm1lzx07VpCW61Z614/E3gJ
         QJXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=02WDeOSMIYv9VygVENpU4aQEdAwWRy14MQW+7Vqn7rU=;
        b=sEs+lGDOhw1NneLHnl6vbJJcR0vf07n2HAPa2zHLkERFhCYxLclntqpymDqkJY6+zx
         o1O30cmt9zrtO2WY0LC6PduU+6kV8kSZHzgzQFpaW/G9mpbqfPcw/LV9Fozur7BWMnRv
         gDaijRjD6wH15j5AZJIddA2zjd6pQb/U+tvJ7suQ0Hn5YpAjkgyHHozj2xr0BvQzJCAp
         giZ5tpEYXGBrpu5qLXjjq9vs/YQNR+29070OY4tnerdKZl3ONmQ7a28PX6U7DR6Hnao5
         9cUNqgz9mM/Oo3HVWQcZjICWV+egTHGEhGhUhu1zdD0J69EiXMddeJbmqZicU1qpX7gN
         +0Hg==
X-Gm-Message-State: AOAM5329LvT+d3xV1KhGLekGQxszr26GnRdX8fOEVI5m8n/r+WV3C6KI
        3LkPIgqpPZui0s0Y4Hetrh7krg==
X-Google-Smtp-Source: ABdhPJzNDiT5w6fkd1613//F7mnyC5Uutx3S9OIpmy+IP928l9N2740TAHK1HFhKRx5HoR+JN7OwGg==
X-Received: by 2002:a2e:a366:0:b0:253:d33d:d6d9 with SMTP id i6-20020a2ea366000000b00253d33dd6d9mr1528026ljn.250.1652945587276;
        Thu, 19 May 2022 00:33:07 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id w10-20020ac254aa000000b0047255d21117sm187406lfk.70.2022.05.19.00.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 00:33:06 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/2] soc: qcom: correct kerneldoc
Date:   Thu, 19 May 2022 09:33:01 +0200
Message-Id: <20220519073301.7072-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220519073301.7072-1-krzysztof.kozlowski@linaro.org>
References: <20220519073301.7072-1-krzysztof.kozlowski@linaro.org>
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

Correct kerneldoc warnings like:

  drivers/soc/qcom/mdt_loader.c:126:
    warning: Function parameter or member 'fw_name' not described in 'qcom_mdt_read_metadata'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>

---

Changes since v1:
1. Split series per subsystem.
2. Add tag.
---
 drivers/soc/qcom/mdt_loader.c | 4 +++-
 drivers/soc/qcom/smp2p.c      | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 366db493579b..3f11554df2f3 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -108,6 +108,8 @@ EXPORT_SYMBOL_GPL(qcom_mdt_get_size);
  * qcom_mdt_read_metadata() - read header and metadata from mdt or mbn
  * @fw:		firmware of mdt header or mbn
  * @data_len:	length of the read metadata blob
+ * @fw_name:	name of the firmware, for construction of segment file names
+ * @dev:	device handle to associate resources with
  *
  * The mechanism that performs the authentication of the loading firmware
  * expects an ELF header directly followed by the segment of hashes, with no
@@ -192,7 +194,7 @@ EXPORT_SYMBOL_GPL(qcom_mdt_read_metadata);
  * qcom_mdt_pas_init() - initialize PAS region for firmware loading
  * @dev:	device handle to associate resources with
  * @fw:		firmware object for the mdt file
- * @firmware:	name of the firmware, for construction of segment file names
+ * @fw_name:	name of the firmware, for construction of segment file names
  * @pas_id:	PAS identifier
  * @mem_phys:	physical address of allocated memory region
  * @ctx:	PAS metadata context, to be released by caller
diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index 59dbf4b61e6c..d9c28a8a7cbf 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -119,6 +119,9 @@ struct smp2p_entry {
  * @out:	pointer to the outbound smem item
  * @smem_items:	ids of the two smem items
  * @valid_entries: already scanned inbound entries
+ * @ssr_ack_enabled: SMP2P_FEATURE_SSR_ACK feature is supported and was enabled
+ * @ssr_ack: current cached state of the local ack bit
+ * @negotiation_done: whether negotiating finished
  * @local_pid:	processor id of the inbound edge
  * @remote_pid:	processor id of the outbound edge
  * @ipc_regmap:	regmap for the outbound ipc
-- 
2.32.0

