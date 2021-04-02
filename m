Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79CF635256D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 04:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234089AbhDBCVX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 22:21:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234229AbhDBCVU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 22:21:20 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8AF5C061793
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 19:21:19 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id q29so5641661lfb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 19:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e7cDGwvCK159I/9FSrY1M64d33eVbPn2loBLKSHFDao=;
        b=WyOFnevHam6slUq80IQ+E2VUcEZiMzkK/5S4mUL461r3CjkTYQoP7zVY+AC4ygjm5c
         Yn6++nO8/OYkua1EtT/HKNI2xwOvynmBpYSBE2st9EldZG01w8BJEreZ09eFfmyFniwm
         o4ltsL7gtFhFMdFR/wfR89vwpcLdBA9w2d94r/ermjB1frU7YTWQRYMQ8GkfrvgrLtIG
         w/GIXFx6vE3jJ5mDiGbSW4Vmx5/7bbxV+r97ald1h6SsLCXmrKcen2JKp3FO5s0m8jdp
         z1o2IXe2AtcE9bQAv+L37cr0wwMS8k7uHmda+wFbvrjcaiSMMqw3LJ/1yTAzJTgick2G
         kEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e7cDGwvCK159I/9FSrY1M64d33eVbPn2loBLKSHFDao=;
        b=IcA9vBZhHyHjQbx4G12bcx5GXYral9LeEFmn7j5g+XZP6hhFbqLptMusI6TWTNzbFv
         oRXRePwV5+uBkvk1bDCvSOKavLNYT4NGJ32uhKC+r09w6pwiO0pgNDUp4pNaILWvhbC5
         WtyIIgpK6efeca2DzYN2Jqat/Wfez83Yax/lpqOjS2H0R7pq8l85vzayPKpZ9Jt3nkpY
         3flvFhxCf6BZpOZjq0iTwudUuQfP+yk2/hx44kix+GOXfPpxfxYxxFSmED5v+jIv6EkS
         i4J6Ssh1bKYJlIOCH1z+Hdn/4rGlrl3gDXIOjLR5hEI0jDl2RFP4hwAdcUclAqaEtd+j
         aaxg==
X-Gm-Message-State: AOAM533ALjfO21q27vrQs0SxuBNLyaR8th4FTCj7rNVuR/YuQDn3U51X
        lPaaVRsi4FNXFsHtReXOejgLRg==
X-Google-Smtp-Source: ABdhPJyJ5pUisbwrto5Yca7KraMYJp6dRVlD1WaRBWGW0wIAJ9TNqdKDAZTksIwIQTDg25XZNAzK+A==
X-Received: by 2002:a05:6512:33c7:: with SMTP id d7mr7048519lfg.601.1617330078322;
        Thu, 01 Apr 2021 19:21:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x74sm713634lff.145.2021.04.01.19.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 19:21:17 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 10/16] clk: qcom: videocc-sm8250: drop unused enum entries
Date:   Fri,  2 Apr 2021 05:21:02 +0300
Message-Id: <20210402022108.4183114-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210402022108.4183114-1-dmitry.baryshkov@linaro.org>
References: <20210402022108.4183114-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop unused enum entries from the list of parent enums.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/videocc-sm8250.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index b0efadc19634..06a8a2c98deb 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -21,8 +21,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CHIP_SLEEP_CLK,
-	P_CORE_BI_PLL_TEST_SE,
 	P_VIDEO_PLL0_OUT_MAIN,
 	P_VIDEO_PLL1_OUT_MAIN,
 };
-- 
2.30.2

