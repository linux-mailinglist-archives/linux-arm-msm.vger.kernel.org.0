Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1203666E91
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 10:46:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239856AbjALJqV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 04:46:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232027AbjALJpP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 04:45:15 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FC4F390
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 01:42:51 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id g10so12765268wmo.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 01:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GKI1e/olZBE0WNap4KRNex2ej5kGh0U21AghWA1HZZY=;
        b=mhI4jZF2UWjIt5yn0A46WNh3DSj7ZLdq1/IQEf+JYT6eDplIwKZgWI5uwkJG87y4J0
         vfIAu4WMX7HCYcvuGNjYWE6d3tfDUtT3MILGfpx2K5jFfLmSZugT6Ruu20QlDMnMWste
         FVuUU13M6t24rxMkszhFtY7lwZoFZF1ANvD3c5c+dZeQNSZcvGHl18oIx4R0cJvFYa+j
         TFOKtJtH8hhiA07zERYZXteQByvutOE/Gpv77PTyRCI17UKiBrItEMnb+//02sIjWB75
         lNRLml8tVdC7aLGJxjCF+aZz2FaBUUPdBW8rlcc85jWT7fHT+YmFO4+NKXxCEkgTJfhE
         ykIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GKI1e/olZBE0WNap4KRNex2ej5kGh0U21AghWA1HZZY=;
        b=BFpXyQXd9zxyPMzxswh0xmZuKyK4krZZNuqG8X+puV4O0i1DW7vq+Uha57XgXj4H0R
         jNA879DXGN6QlGGITfVAlPct6OArrMH71Yf4imVzS9N5hm7+Q5XMtAUA0Tq1O4QWMKOc
         drLQ6xEwq2hDJwTp5A9b2Wkxb83bXDk75Y4FuIzrgQWEc1Jf/wFE7nz63HoseQah0+Td
         BJU9xSq4WnUdQoHIoScTqLO5JIBtQGAylHu40qFHrnJTb4Tx7ZjrPtPl2/fRai+ZKD95
         PRLjyoE1hHErUNCbLOvDWZg3WcEnttzro2i3DvGBZn0qGOqUzTO5rPTcCfqJVFkcrYtV
         AOGQ==
X-Gm-Message-State: AFqh2kqY8WD42qDuNbLv/XyGGEkEhJ1lzstsDPp/AIQLIfY29Za8Luta
        9BeBHEtOAlp4YINjVlT2SL5E9BTAvFF14+GT
X-Google-Smtp-Source: AMrXdXvTSEtuIufSTAXNipVi8Ox6she5RGRw851IDFVjB/ccbB+Imd6hG4OKVbX2sQZldpGwb9HcXA==
X-Received: by 2002:a05:600c:4f02:b0:3d9:f217:6f6b with SMTP id l2-20020a05600c4f0200b003d9f2176f6bmr10421251wmq.33.1673516569772;
        Thu, 12 Jan 2023 01:42:49 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id l14-20020a05600c4f0e00b003d96c811d6dsm28047649wmq.30.2023.01.12.01.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 01:42:49 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Thu, 12 Jan 2023 10:42:46 +0100
Subject: [PATCH v2 2/2] arm64: defconfig: enable Visionox VTDR6130 DSI Panel driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230110-topic-sm8550-upstream-display-defconfig-v2-2-c29b9714c85f@linaro.org>
References: =?utf-8?q?=3C20230110-topic-sm8550-upstream-display-defconfig-v2?=
 =?utf-8?q?-0-c29b9714c85f=40linaro=2Eorg=3E?=
In-Reply-To: =?utf-8?q?=3C20230110-topic-sm8550-upstream-display-defconfig-v?=
 =?utf-8?q?2-0-c29b9714c85f=40linaro=2Eorg=3E?=
To:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.11.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Build the Visionox VTDR6130 DSI Panel driver as module

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c9011e1438c0..7bbf628ab80c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -765,6 +765,7 @@ CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_SITRONIX_ST7703=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
+CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m

-- 
2.34.1
