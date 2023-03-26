Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A2706C96F4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Mar 2023 18:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232093AbjCZQwc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Mar 2023 12:52:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbjCZQwb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Mar 2023 12:52:31 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4256F4EEF
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Mar 2023 09:52:30 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id d14so2896511ion.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Mar 2023 09:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679849548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uZDpfx3urFpkn6ahCSfHgrhA7mhIEUMUgAQsnqLHf8E=;
        b=lw02E4M5hD/bCTsw9aoEmp9o5Go8WICBB/nja5f64DrIyDY6COPKylxnqlVBtpfdyv
         GWv5TcbfKlbtBJ+sfHmTSiLAUCwSjT3IZ4gqsSTUwupt8zpbAKCRjRKbx5EDmtHx9Jg7
         wZQeuVT7Y8KrQsCY4h8XRNw9l/iNZSG1avD3eld/z7UqgI3lHJx1EwL95+lC7vdqxed9
         h3cH/8oyD191x2pTz/cgAism5FJUp+2gFb3N2ECBaOXcIqggZjF+I96gjnrReKF8tDe+
         juVli4JRKwUMK6stG0/4Hgfw8oPz0jI3NlEB55ZijzDxTp2ToJEgyy+4tsofGkZ86Zgx
         6rVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679849548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uZDpfx3urFpkn6ahCSfHgrhA7mhIEUMUgAQsnqLHf8E=;
        b=r2Xo7qglEpPBTTkjoeANh/ijb9Rs5hnI4HXl5KWIDpMgEY3qP+AIMRxiTuFtbwX09v
         u0w0sctT8lhfJuRFEQr5WqBXp8vwEAdHe4hDwthvB/pjjkRWRojdq40NreRGmotXUI6Y
         qFOcmRZ0q34uXdOnLnUoYWVhDDgjPUOEUXbQ1AQMd4fnVlFl1+ZcVEtM5hOT5quQiEs4
         W1GZRmAjgxUl7OdRubmObOAC8jb7SCMcxSPGZttrTb3HK7iPZx5EdUTQjuJL0devjJLa
         Q6gTNfE1FhfrQ4Qjuo0H4VN0Y5Xgfq22H2q9fSvmWeXo77Fm8f8E/xi0jVANrwpsxBvM
         b6Qw==
X-Gm-Message-State: AO0yUKXesm44OCzkE+PIQnivLOtKs+XGUBHBYLLLxTsYS7kB3pQ9NH64
        ZM805gil2l4t0GNZKM8WEg95rA==
X-Google-Smtp-Source: AK7set99/fu0tVXo6FiX13qhaEmHEvLC3MCJvfjzz3kDAiKDyyxTs7GgLGQPJFXfM9JXlMm2u5od7w==
X-Received: by 2002:a6b:f707:0:b0:74c:7db1:47cf with SMTP id k7-20020a6bf707000000b0074c7db147cfmr6914684iog.14.1679849548663;
        Sun, 26 Mar 2023 09:52:28 -0700 (PDT)
Received: from localhost.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id s10-20020a6bdc0a000000b0074e7960e70dsm3675834ioc.51.2023.03.26.09.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 09:52:27 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     quic_bjorande@quicinc.com, caleb.connolly@linaro.org,
        mka@chromium.org, evgreen@chromium.org, andersson@kernel.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net] net: ipa: compute DMA pool size properly
Date:   Sun, 26 Mar 2023 11:52:23 -0500
Message-Id: <20230326165223.2707557-1-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In gsi_trans_pool_init_dma(), the total size of a pool of memory
used for DMA transactions is calculated.  However the calculation is
done incorrectly.

For 4KB pages, this total size is currently always more than one
page, and as a result, the calculation produces a positive (though
incorrect) total size.  The code still works in this case; we just
end up with fewer DMA pool entries than we intended.

Bjorn Andersson tested booting a kernel with 16KB pages, and hit a
null pointer derereference in sg_alloc_append_table_from_pages(),
descending from gsi_trans_pool_init_dma().  The cause of this was
that a 16KB total size was going to be allocated, and with 16KB
pages the order of that allocation is 0.  The total_size calculation
yielded 0, which eventually led to the crash.

Correcting the total_size calculation fixes the problem.

Reported-by: <quic_bjorande@quicinc.com>
Tested-by: <quic_bjorande@quicinc.com>
Fixes: 9dd441e4ed57 ("soc: qcom: ipa: GSI transactions")
Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/gsi_trans.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ipa/gsi_trans.c b/drivers/net/ipa/gsi_trans.c
index 0f52c068c46d6..ee6fb00b71eb6 100644
--- a/drivers/net/ipa/gsi_trans.c
+++ b/drivers/net/ipa/gsi_trans.c
@@ -156,7 +156,7 @@ int gsi_trans_pool_init_dma(struct device *dev, struct gsi_trans_pool *pool,
 	 * gsi_trans_pool_exit_dma() can assume the total allocated
 	 * size is exactly (count * size).
 	 */
-	total_size = get_order(total_size) << PAGE_SHIFT;
+	total_size = PAGE_SIZE << get_order(total_size);
 
 	virt = dma_alloc_coherent(dev, total_size, &addr, GFP_KERNEL);
 	if (!virt)
-- 
2.34.1

