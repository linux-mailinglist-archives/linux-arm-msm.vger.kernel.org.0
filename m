Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5F804A6045
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 16:37:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240456AbiBAPh4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 10:37:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240489AbiBAPhp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 10:37:45 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE2F3C06173D
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Feb 2022 07:37:45 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id q204so21654220iod.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Feb 2022 07:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yBiZZz1/NPVKpecgM8sZYmPy5LVgZiPd3RTXAo466MU=;
        b=HPCWdCGi+HlGqTGBgUD0GIrUJF9YEObheXYdQRvjKoYrSFb+C5jhR+2iPEZHFXZTMR
         /LjZS3Opk4mgz/lVEHdcjT4rNe4IzgwuPbU9Vg9WpkZGZlfBPdk5v4DPW5+STiAQtO5y
         F7rn/fGb7gczkCxzXEiOqMbY9jsYri9LbgxKWxgTBBWbhnwMbT9zwSOzDSW3PFUPv14r
         0dZ7R+qcr50Ag2pRo9jDTFO79aLiTP9u+wDl/b9jJI45NGTwWOZo4tX/8x7JHW6f4Nx3
         kGWWBA7peoWg292nz2bQRxtEhL24AaiOpIA5rS0NMd6XTIqjTbwbsw9L0hBYX6/iGo44
         HZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yBiZZz1/NPVKpecgM8sZYmPy5LVgZiPd3RTXAo466MU=;
        b=A2yn46Wgd9AMHTseMa3HHcfgLIswqxS19bKux5YaIBRMxvVAFQCZBw+HARSQWjGFTL
         BVBNhqIWwLi1RKU0PuVexz726bXyKLDP/1bkqDNM3+qgV7xujrbyp1saO9oEjkfHrgr8
         nppwQEu8mrTxwc6o7FSDArq9uKQ2LeMrFinbYgH2HMQj8n39ylqiMz+yFMGlt3W+L/Rt
         Ys7voLETVmDMag/P5oHOV4oU4XCbW7F0tAhxxsXRmaLT7vJXiaNDw8x/YUpN50k/b9se
         TRuLcWXTU7/VvY0FxiAaNYAIOrqUeG7q6gyU5GG7H4JyaPWEuGguNhSSt4Jd63OUyoJ5
         P25Q==
X-Gm-Message-State: AOAM5313wIt3di/bRsc1s9KBz+TgKmMJOMnfOZigYII8qQ882GPf/Y+d
        8jgvWyPSqMAe9v/X2Ig8PwmeVA==
X-Google-Smtp-Source: ABdhPJz//G7nSbZNcFnRLJQppjxJN5pz9lAKJVKU6Kz4Fxatt/29OjsY/I4QaMTX7LixQuRhUvhPGg==
X-Received: by 2002:a02:cab8:: with SMTP id e24mr8654963jap.33.1643729864828;
        Tue, 01 Feb 2022 07:37:44 -0800 (PST)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id n12sm1234583ili.69.2022.02.01.07.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 07:37:44 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org, mka@chromium.org,
        evgreen@chromium.org, cpratapa@codeaurora.org,
        avuyyuru@codeaurora.org, jponduru@codeaurora.org,
        subashab@codeaurora.org, elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 2/2] net: ipa: set IPA v4.11 AP<-modem RX buffer size to 32KB
Date:   Tue,  1 Feb 2022 09:37:37 -0600
Message-Id: <20220201153737.601149-3-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220201153737.601149-1-elder@linaro.org>
References: <20220201153737.601149-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Increase the receive buffer size used for data received from the
modem to 32KB, to improve download performance by allowing much
greater aggregation.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_data-v4.11.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ipa/ipa_data-v4.11.c b/drivers/net/ipa/ipa_data-v4.11.c
index 8f67c44e19529..b1991cc6f0ca6 100644
--- a/drivers/net/ipa/ipa_data-v4.11.c
+++ b/drivers/net/ipa/ipa_data-v4.11.c
@@ -134,7 +134,7 @@ static const struct ipa_gsi_endpoint_data ipa_gsi_endpoint_data[] = {
 				.qmap		= true,
 				.aggregation	= true,
 				.rx = {
-					.buffer_size	= 8192,
+					.buffer_size	= 32768,
 					.aggr_close_eof	= true,
 				},
 			},
-- 
2.32.0

