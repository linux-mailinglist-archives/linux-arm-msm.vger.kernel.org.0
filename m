Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AFB6681C32
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jan 2023 22:04:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230322AbjA3VEA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Jan 2023 16:04:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbjA3VDy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Jan 2023 16:03:54 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38E0913DFC
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 13:03:52 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id r6so2464954ioj.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 13:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Q3ZO5XASIsXMpDUmQAaU+Lb+omH36X+YOT42bBfC3M=;
        b=M7Q2dK7BE8v+7dbB8GTF7HUnrgbQGlROg82yKcEvudTV+UfIq3Y8ju26ZYuTHDSE7c
         JAdF2DqZRDYjtj7uRfMdlA0JvI8kLKN1/Vn5URq884CUxFtDymJrroy+TKkZkGXO4hKg
         oUnYXJhjciLZkLsRUrrs0E907EUBcsEjgyDUr3iEYpzyML+W9MMFZ5xkUGj7uDMYd5CS
         WfIfx9x5/JaAZcOKs6yagr7rTPVhVv20Cx1fTcNGEYbaVCKGQPSd1tm1QB7pw/PjZ29j
         1Km14Uv7xNuifDhlxwYLRn6wdI34h1k82CLfpaNNRzWdHKu9QvpIJQlWjeLZzsfxCH1m
         3qyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Q3ZO5XASIsXMpDUmQAaU+Lb+omH36X+YOT42bBfC3M=;
        b=rQdJ08JWYLsK7ywA/sn3J+mTEZdQWOaZwaJdqJ7EyYv5BzYv+WJ693bRqS/54cLFT+
         RoCiZTH1zanZOvta2odFcBAuGKZcyGM9GQJYUd+FkWCXKpHMsYS2NiapIaGnIBwXNksb
         FTY5wFedK8FYuzuVCKc/pGmri3uCkhqZxGXN9srMfjdKBezfHWwCVTE7yCoQPD4OYH3b
         OP3RdHPpAqNVBF3PyHunosUOiIxUmQnhQ7xugD6UKMY/gQZChKxb0bE4qtdVPVLgt7a4
         YVS9vNZNC9HcjA12Eccj01i470/vmZm+BcVeLTD7ms833Hwrck9AbOGe9I1oddOFLaIn
         6jPA==
X-Gm-Message-State: AO0yUKWL8fzjTR5VRNcRRz93u9Kx6cWtnaBYZr0aGmayf8vwdTU7LCwn
        dYm2h3C50Zfv9cFIW83IRAfUMw==
X-Google-Smtp-Source: AK7set+pHPJZjyJPcXcrBm5AZhB8wUYj2LubxHFMJZxqKbGAtWI8NoWPDvO/0BKY5gQ1cN2wIlwA8g==
X-Received: by 2002:a05:6602:22d8:b0:71f:2e0b:5c64 with SMTP id e24-20020a05660222d800b0071f2e0b5c64mr1882223ioe.3.1675112631552;
        Mon, 30 Jan 2023 13:03:51 -0800 (PST)
Received: from presto.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id a30-20020a02735e000000b003aef8fded9asm1992046jae.127.2023.01.30.13.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 13:03:51 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     caleb.connolly@linaro.org, mka@chromium.org, evgreen@chromium.org,
        andersson@kernel.org, quic_cpratapa@quicinc.com,
        quic_avuyyuru@quicinc.com, quic_jponduru@quicinc.com,
        quic_subashab@quicinc.com, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 5/8] net: ipa: support zeroing new cache tables
Date:   Mon, 30 Jan 2023 15:01:55 -0600
Message-Id: <20230130210158.4126129-6-elder@linaro.org>
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

IPA v5.0+ separates the configuration of entries in the cached
(previously "hashed") routing and filtering tables into distinct
registers.  Previously a single "filter and router" register updated
entries in both tables at once; now the routing and filter table
caches have separate registers that define their content.

This patch updates the code that zeroes entries in the cached filter
and router tables to support IPA versions including v5.0+.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_table.c | 38 +++++++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ipa/ipa_table.c b/drivers/net/ipa/ipa_table.c
index 32ed9fec2ca74..b9d505191f884 100644
--- a/drivers/net/ipa/ipa_table.c
+++ b/drivers/net/ipa/ipa_table.c
@@ -499,13 +499,22 @@ static void ipa_filter_tuple_zero(struct ipa_endpoint *endpoint)
 	u32 offset;
 	u32 val;
 
-	reg = ipa_reg(ipa, ENDP_FILTER_ROUTER_HSH_CFG);
+	if (ipa->version < IPA_VERSION_5_0) {
+		reg = ipa_reg(ipa, ENDP_FILTER_ROUTER_HSH_CFG);
 
-	offset = ipa_reg_n_offset(reg, endpoint_id);
-	val = ioread32(endpoint->ipa->reg_virt + offset);
+		offset = ipa_reg_n_offset(reg, endpoint_id);
+		val = ioread32(endpoint->ipa->reg_virt + offset);
 
-	/* Zero all filter-related fields, preserving the rest */
-	val &= ~ipa_reg_fmask(reg, FILTER_HASH_MSK_ALL);
+		/* Zero all filter-related fields, preserving the rest */
+		val &= ~ipa_reg_fmask(reg, FILTER_HASH_MSK_ALL);
+	} else {
+		/* IPA v5.0 separates filter and router cache configuration */
+		reg = ipa_reg(ipa, ENDP_FILTER_CACHE_CFG);
+		offset = ipa_reg_n_offset(reg, endpoint_id);
+
+		/* Zero all filter-related fields */
+		val = 0;
+	}
 
 	iowrite32(val, endpoint->ipa->reg_virt + offset);
 }
@@ -549,13 +558,22 @@ static void ipa_route_tuple_zero(struct ipa *ipa, u32 route_id)
 	u32 offset;
 	u32 val;
 
-	reg = ipa_reg(ipa, ENDP_FILTER_ROUTER_HSH_CFG);
-	offset = ipa_reg_n_offset(reg, route_id);
+	if (ipa->version < IPA_VERSION_5_0) {
+		reg = ipa_reg(ipa, ENDP_FILTER_ROUTER_HSH_CFG);
+		offset = ipa_reg_n_offset(reg, route_id);
 
-	val = ioread32(ipa->reg_virt + offset);
+		val = ioread32(ipa->reg_virt + offset);
 
-	/* Zero all route-related fields, preserving the rest */
-	val &= ~ipa_reg_fmask(reg, ROUTER_HASH_MSK_ALL);
+		/* Zero all route-related fields, preserving the rest */
+		val &= ~ipa_reg_fmask(reg, ROUTER_HASH_MSK_ALL);
+	} else {
+		/* IPA v5.0 separates filter and router cache configuration */
+		reg = ipa_reg(ipa, ENDP_ROUTER_CACHE_CFG);
+		offset = ipa_reg_n_offset(reg, route_id);
+
+		/* Zero all route-related fields */
+		val = 0;
+	}
 
 	iowrite32(val, ipa->reg_virt + offset);
 }
-- 
2.34.1

