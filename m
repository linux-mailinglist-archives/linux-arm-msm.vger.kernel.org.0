Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A7B36CC7E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Mar 2023 18:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbjC1Q17 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 12:27:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230510AbjC1Q16 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 12:27:58 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE32C2114
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 09:27:55 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id x6so6624640ile.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 09:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680020875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HZlLwQPOb8jKLc2eNXMwjH3kvxbHnpPjAYHKfKgd7uA=;
        b=Qtxy9wPVh5rqdceW19ctke0VfOWZMgcfxj6GjZesd+Pd9vieH4JM1u8sejWiGo2BxB
         WT2qiUUZE5kv7/kYXwFQwDi4BKmVmod9Z9YoY39MubGBP8Q5PYUKTsm3hNjqW2YUXGYA
         duSYZBfxSHuODhD80wW3+aRpuL4SPAxpIS14OOgD8i2lX/3R1dLLTMF4Ogyt/Zlo5WUw
         5uLA613pQMPoqacuHvClHq8/2Wfmz+k+S/S5W1kNSQ1YwiRA5jb73pXIRyhITApxjZtv
         jn40+ffjxJd3ZTS9WJ14eeJ9czJLt47Ks33FNntjUbmfUTxzMUYnFV+QJ5qQk+Sfw4XY
         vJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680020875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HZlLwQPOb8jKLc2eNXMwjH3kvxbHnpPjAYHKfKgd7uA=;
        b=xktw8jNsNR6xmniG/cL0FhJdkYeqb0QFtHUXrCyY91PfsPSPPMObqy8RU6uFcAImte
         tH4S0sDbv9jjQNcrDhpDszWpnFBMusHP4X7wVDeXJSdxfWbiHGqLyd/5A9xcqANgpE6J
         4WZELwG/Lc3gEyGYF6Pf9gSGkTK6+NWpABvitlq7P1bifSVCmNeMcRwIpk5Mbazn2x1H
         9YunOh/cYmZc7eic7yM/+9Tvo48exyNwhd1A1AKdfmimGLyp1w5E8YK1rMX0m9MgdJeO
         +/iXBO4i0D46uFzvobxEUStcUQ+q3fqB4I6aSYC2U1V/VlDN8Fc1rIgHEXP9J0K1ae/W
         Ak+A==
X-Gm-Message-State: AAQBX9fI5dPECeKzNzjjxQT9jH6YiLpk2mhinYXG7m/oUUFlJDUau/Ka
        SIQnpG2t0yV0Nx4jOcXwnib6PA==
X-Google-Smtp-Source: AKy350auGPR2rXe6tX4isI+DRP4rAbQtTgO5YEMWMmej3TcLoAd9VmkXAB1ub8WFQZAjitvbzGN9hw==
X-Received: by 2002:a92:c8c6:0:b0:315:8bc0:1d85 with SMTP id c6-20020a92c8c6000000b003158bc01d85mr12800420ilq.11.1680020874908;
        Tue, 28 Mar 2023 09:27:54 -0700 (PDT)
Received: from localhost.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id g2-20020a92c7c2000000b003159b6d97d6sm8642814ilk.52.2023.03.28.09.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 09:27:54 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     quic_bjorande@quicinc.com, mbloch@nvidia.com,
        caleb.connolly@linaro.org, mka@chromium.org, evgreen@chromium.org,
        andersson@kernel.org, quic_cpratapa@quicinc.com,
        quic_avuyyuru@quicinc.com, quic_jponduru@quicinc.com,
        quic_subashab@quicinc.com, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net v3] net: ipa: compute DMA pool size properly
Date:   Tue, 28 Mar 2023 11:27:51 -0500
Message-Id: <20230328162751.2861791-1-elder@linaro.org>
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

Reported-by: Bjorn Andersson <quic_bjorande@quicinc.com>
Tested-by: Bjorn Andersson <quic_bjorande@quicinc.com>
Fixes: 9dd441e4ed57 ("soc: qcom: ipa: GSI transactions")
Reviewed-by: Mark Bloch <mbloch@nvidia.com>
Signed-off-by: Alex Elder <elder@linaro.org>
---
Note: This was reported via private communication.
v3: - Added Mark Bloch's reviewed-by tag.
v2: - Added Bjorn's actual name to tags.  

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

