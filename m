Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD371DE42B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2020 12:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728542AbgEVKVn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 May 2020 06:21:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728329AbgEVKVk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 May 2020 06:21:40 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FA2DC05BD43
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2020 03:21:40 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id j21so12418776ejy.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2020 03:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=POPglGew/cq7Fh3lzWt5jzw//XiaJ0U+eE6M/nZ46PE=;
        b=HXkbxbAPPaOIi1vBFvOH0rF0y8ltpzsJ/lBiWigcsLc9jSNJndrYz3imJ+LSJL6TPj
         6BjbTD11XqeL9eI1U6RSrVx814wygYKfxwjGuoUB3N7Lo+eNl/Lv0LVa9VrkldxGt46P
         SADCzcTA0SWD0LdfbkzfEhpJijvRD4NnXeTUEl2wy1e5D6jscDDPunPCAycUv49S1SYU
         57PS86PXDUMDBOiTv0qn8ZBm3sVXP4tHMxm169LpNK3REJjw5G7jUFhmjV1BHVCuYYHk
         t4zPhz/c2OxgU3Gh5anI8kpNd5q2kVrJ11h1ROko9U+eknJRsORi3W0cVbGT1Ig2sJLK
         9v0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=POPglGew/cq7Fh3lzWt5jzw//XiaJ0U+eE6M/nZ46PE=;
        b=FJVBr+2ZIGW+j0lFUvy/ao9A0sDSZNAOIWwhwwhccwf3P4MFehksxBkfRWXOEWU8VS
         EdnDU9SIvBQuJtoDH/lvicV/gqStnAOGm8jj7oYVL8OmQP6J/YB5qn7+DId0dU2354IB
         +IPyTGL6+tWj+S+96751dfeIznPujYm8X1lxS560H8NNLRU1NvyX8VhaJoco2B8mvKg6
         GlbYG8UN7U3Q7yePYPLLj6piLJPOoWHpzi+DxfWf457AI1HpzMJSNiX7QIRM9ThINc8M
         kkTkvMZBLyBF5mFOc1t3AnUXPPx7fNMblK5tuOdrBTpnTiBUXniHV0uGnDberSO4IgEn
         4CNQ==
X-Gm-Message-State: AOAM530/C7EYBYELHV9pzBylCJZn12rhtixMD5BBF1vMwfTMA9seQSGV
        lrQ9LKdBm6oUb0uMwFNaaSsuJg==
X-Google-Smtp-Source: ABdhPJxusO2sj7i9AzZa/+pdI1I/q3pAWDlBSWuq0T4Sjds7K6f87kmGOQXdGisF58+e3ee9GgKRkA==
X-Received: by 2002:a17:906:278e:: with SMTP id j14mr7264295ejc.270.1590142898982;
        Fri, 22 May 2020 03:21:38 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-12.ip.btc-net.bg. [212.5.158.12])
        by smtp.gmail.com with ESMTPSA id z14sm7472532ejd.37.2020.05.22.03.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 03:21:38 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Li Yang <leoyang.li@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Olof Johansson <olof@lixom.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH] arm64: defconfig: Enable SDM845 video clock controller
Date:   Fri, 22 May 2020 13:21:09 +0300
Message-Id: <20200522102109.3607-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the build of sdm845 video clock controller by default.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 03d0189f7d68..4eb7e35d2d7d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -806,6 +806,7 @@ CONFIG_MSM_GCC_8998=y
 CONFIG_QCS_GCC_404=y
 CONFIG_SDM_GCC_845=y
 CONFIG_SDM_GPUCC_845=y
+CONFIG_SDM_VIDEOCC_845=y
 CONFIG_SDM_DISPCC_845=y
 CONFIG_SM_GCC_8150=y
 CONFIG_QCOM_HFPLL=y
-- 
2.17.1

