Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9A9026E6D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Sep 2020 22:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726344AbgIQUjV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Sep 2020 16:39:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726234AbgIQUjV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Sep 2020 16:39:21 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4958C061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2020 13:39:20 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id y2so3629495lfy.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2020 13:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3RdmXRAaT9U1dmRk1FrzkC+PQqgXDR/Od5t72WqZDaY=;
        b=VBJMNNg4MhmV9Y62LuVY5hB1HGvzBTxH5devTT4PTYhZPqSLMOs/e8LlBQdpnXU5+q
         tMNdYePTMJXOeFimvLV1t/jo9heRAqml8GApRcONshP2mrJS5tBqiIT/As74PXvmB65h
         CqRGA8xY/YeFh3DHSFDFbEypcMLT8XUjcdszkq+9vojBTp9GylclUpkf/R1R4bR4sueY
         9KCZzHsCPtNY4/uyO09mn7sImu6oLqAjNOrrCgT0ZdXf2BfSDAS+DQzqb0Hkg3i6L1j9
         cb8BP3c5LBf6b//ITFmtvbHZw4JOOqTZThm7um4iPFhIXEBONOWHe3OAX1NtXa9pixGS
         +Tvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3RdmXRAaT9U1dmRk1FrzkC+PQqgXDR/Od5t72WqZDaY=;
        b=nFw5aDBhUkgi8WTFfZG/ph3m0QTzi+H2zNoksE/cTXGXk8LO1wNxYTiSlKG3YnQRje
         qHS/UezTeXadsmw4KQq6E5ygvmiZAr4tV4G/WTQ4iOkt0XZXNiUmQpAgHDjq0JLHAfyS
         CaJa2fqFB+7uNYT4WX/1nnKtPphH2rt9iiwOu5jeAqoF02g9KNoV2s9anDNu7GqSEdk4
         2tvphdiqTHJL9Mpjm0F09AK0d1nNFPZHBn6JNQbdpumRzmTowCZNKLYXIgnD5MI2KVBv
         zZ2xaLylFdRpZHMH0bjNO1XmN6Tdj46O57G6keBnms46mlo9jHZquc+oWy+VL5HzM8HA
         aI+g==
X-Gm-Message-State: AOAM533q4qBbluOvruM1a9CGZcy8Cjz3TGZK+hyE+pj2qWEidzsZBe7p
        wHdixPUrQU9IIkTY/LKevqKg4g==
X-Google-Smtp-Source: ABdhPJxPfTs2n8pTlk89ZxJ5OXe0l6sxpUqP22lFI2MtBy+l77liGdHKtQbqiurqYzjv381ZRVJG4A==
X-Received: by 2002:a19:8606:: with SMTP id i6mr9246512lfd.263.1600375159132;
        Thu, 17 Sep 2020 13:39:19 -0700 (PDT)
Received: from eriador.lan ([188.162.64.171])
        by smtp.gmail.com with ESMTPSA id d9sm128192lji.87.2020.09.17.13.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 13:39:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/4] arm64: defconfig: enable Qualcomm ASoC modules
Date:   Thu, 17 Sep 2020 23:39:12 +0300
Message-Id: <20200917203913.3250205-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917203913.3250205-1-dmitry.baryshkov@linaro.org>
References: <20200917203913.3250205-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable CONFIG_SND_SOC_QCOM and several platform drivers to be built as modules.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7c741e73a282..d0a0d5d27c32 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -689,6 +689,9 @@ CONFIG_SND_BCM2835_SOC_I2S=m
 CONFIG_SND_SOC_FSL_SAI=m
 CONFIG_SND_MESON_AXG_SOUND_CARD=m
 CONFIG_SND_MESON_GX_SOUND_CARD=m
+CONFIG_SND_SOC_QCOM=m
+CONFIG_SND_SOC_APQ8016_SBC=m
+CONFIG_SND_SOC_MSM8996=m
 CONFIG_SND_SOC_SDM845=m
 CONFIG_SND_SOC_ROCKCHIP=m
 CONFIG_SND_SOC_ROCKCHIP_SPDIF=m
-- 
2.28.0

