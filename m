Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05B02254237
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Aug 2020 11:26:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728439AbgH0JZI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Aug 2020 05:25:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728554AbgH0JZG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Aug 2020 05:25:06 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DC01C06121A
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 02:25:05 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id o4so4667500wrn.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 02:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rGqT7srmFAjxM5njBGX2TMqgn+GAvNxXqSd+GHPZX9A=;
        b=f+pTmgDm/DKMlxPbeJzbk9Hif87pYsP3omG0gPyVr9mgLkGJdniqShJ83UPveG/GDz
         o46myXYaeLLS16hwT7cLTN9x+CitiSttF1ldsRTbG5M9MJAYp7jTmlFjXbCeIGkORPY7
         vxN8WYmg9B8ztxNylLjLLok+HiBWesI2wYh/8bTmlIUHI2EUFz9CyKP+cQiYtUAtmS8K
         LUbe+v67RgK2LFR1pzghN/DYExSNrrLbV6jnRMGlSWSFOVWosvNTbFDZSK65XPmb6rTH
         7u0XvnJaY6rPITBn8kK5hVNVkacJA6b5CY6JrO9RkibYyxz8BQRLbvgKGzKb9YDMu8qQ
         pU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rGqT7srmFAjxM5njBGX2TMqgn+GAvNxXqSd+GHPZX9A=;
        b=S5wPev0T4MGERbQym9SwskOV8orlVObxEoireGpJc4sptD3I9AP5ItWHf7PU7BAIcC
         iCfxMtniNrFsPramOvC3mj6GWn4hFuABu6PndWGEv+Yuu7re66R/NRpAhjOIMD/RIXxV
         2hHGqYUpV7nMYFu0NDBSmUAIvFM2GNB4VTAe4/QkWkJjfXwbbnsrpzcBr03gwRKJqSL8
         3j9d35mmcUGObjyin90ylvPJENit7UUzEKR69VFzKcT6vqKnx4lLdTHy4f504OcIgMr8
         IRVApjwMA13YMwB9uKZF0VSHNfuO/qu8zPeDC96gbjMP/TYhJpQV9GbNgr5mHw4/NHo6
         jaCw==
X-Gm-Message-State: AOAM531WsorE3cwXZ6s9f1DZZnyS68l77ig03Z87Dgdo/IRa/CAoSEpV
        2301j7GBKrvaIq2oGNHatSFRMg==
X-Google-Smtp-Source: ABdhPJzUjrlZ6nfXQRs00k+sxlWe8Lcdhud3RXEWA9JgMHa2dZw/NBbQAuBjMVabv+Y8CBD4XemJyg==
X-Received: by 2002:adf:dfc8:: with SMTP id q8mr18516222wrn.231.1598520304235;
        Thu, 27 Aug 2020 02:25:04 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id z203sm4357330wmc.31.2020.08.27.02.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 02:25:03 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 05/13] venus: hfi_plat: Add codecs and capabilities ops
Date:   Thu, 27 Aug 2020 12:24:09 +0300
Message-Id: <20200827092417.16040-6-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827092417.16040-1-stanimir.varbanov@linaro.org>
References: <20200827092417.16040-1-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add ops to get the supported by the platform codecs and capabilities.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_platform.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_platform.h b/drivers/media/platform/qcom/venus/hfi_platform.h
index 174428e97b86..8084d092d5d1 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform.h
+++ b/drivers/media/platform/qcom/venus/hfi_platform.h
@@ -46,6 +46,8 @@ struct hfi_platform_codec_freq_data {
 struct hfi_platform {
 	unsigned long (*codec_vpp_freq)(u32 session_type, u32 codec);
 	unsigned long (*codec_vsp_freq)(u32 session_type, u32 codec);
+	void (*codecs)(u32 *enc_codecs, u32 *dec_codecs, u32 *count);
+	const struct hfi_plat_caps *(*capabilities)(unsigned int *entries);
 };
 
 extern const struct hfi_platform hfi_plat_v4;
-- 
2.17.1

