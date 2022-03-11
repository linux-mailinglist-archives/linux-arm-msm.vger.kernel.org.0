Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCE2F4D64EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Mar 2022 16:49:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349009AbiCKPuh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Mar 2022 10:50:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347030AbiCKPuf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Mar 2022 10:50:35 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9244992859
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Mar 2022 07:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647013771;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fSU6dZRMQZcPZg2xb4qD008kHZwrahckFZUqi6hy1VA=;
        b=cglcQXY9q6s3X2A1wr2lwmvpq/WF/3qucMoLgqN/YcEHBpUUwN7pkFZ05NSKERCKXN40ER
        W6WOlPcMrFR7xqaoeyAvDSS25cgFQUwHQXjxV2FrqLjXGnAPHqGrX9uwjOqS83sURzXzay
        OsjgGX5XNoOyLI9roiJ4SrwavC7fUaE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-zIxJ1rpGORO5mx8BWjdPLg-1; Fri, 11 Mar 2022 10:49:30 -0500
X-MC-Unique: zIxJ1rpGORO5mx8BWjdPLg-1
Received: by mail-qv1-f71.google.com with SMTP id t18-20020a0cb712000000b004350812c194so7894682qvd.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Mar 2022 07:49:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fSU6dZRMQZcPZg2xb4qD008kHZwrahckFZUqi6hy1VA=;
        b=6wwrKFuEZoESpnAkOC/qYtaxCytOvUOGzmTZuRHcCDmEzjXYkqBFF9wMqvytj/4bVQ
         vQN7PysKGpXqsEjpvfDioyHSNk4yBIYA6iyooUjffdL4c+58H2VGPTDAJKFJvE5h7r00
         eOTl8Jf0pMboqvzwE9UstC9c5sDJMR6h4aBvsdOYvNFEdl53KqDhyOK4K50It3dzFEap
         H3lFCL1LlH5dLOnWn5pig5qmeAajurLWxjdXVDqFrttcP9FnHhQXEfST/VaQEyW6l3Oa
         ygTFtDgWI2eeAHlayNO1p6ZFJr7Rcg/RQDCFwwMx3D6dF7U0ZKhO3oCZ7hMR7RzJz9j9
         WKcw==
X-Gm-Message-State: AOAM530eUo5p4u6BLOtqvDE+1OtPy8I4tVE4zKC8d2f2WY0MGAR+YEvb
        CkJjWBL/3GH473AxGKZoNnTZwfAizrFuz3LrLJxHYJ0XBoxRD8kpKw16uqYY82QZ43fueZBRqkC
        SDcHsg7XfopIUodnRCKX0NDAiZQ==
X-Received: by 2002:a05:622a:1312:b0:2e1:aab3:4644 with SMTP id v18-20020a05622a131200b002e1aab34644mr7219609qtk.455.1647013769908;
        Fri, 11 Mar 2022 07:49:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6F8Dtq8kFUxxOA9O+1NF3f8ivmZCWHQHFo0nlnddB1/RhLyaemBEZc4pJUsPc5tJxSMnKyg==
X-Received: by 2002:a05:622a:1312:b0:2e1:aab3:4644 with SMTP id v18-20020a05622a131200b002e1aab34644mr7219589qtk.455.1647013769706;
        Fri, 11 Mar 2022 07:49:29 -0800 (PST)
Received: from xps13.. (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id z6-20020ae9c106000000b0067d3b9ef387sm3602719qki.28.2022.03.11.07.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 07:49:29 -0800 (PST)
From:   Brian Masney <bmasney@redhat.com>
To:     bjorn.andersson@linaro.org
Cc:     mani@kernel.org, dianders@chromium.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/2] ARM: qcom_defconfig: enable options for Qualcomm random number generator
Date:   Fri, 11 Mar 2022 10:49:18 -0500
Message-Id: <20220311154919.1797920-2-bmasney@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220311154919.1797920-1-bmasney@redhat.com>
References: <20220311154919.1797920-1-bmasney@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the driver for the Qualcomm random number generator and the
userspace crypto API.

This was a tested on a Nexus 5 phone (msm8974 SoC).

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 arch/arm/configs/qcom_defconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 9981566f2096..50e28a74c361 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -295,6 +295,13 @@ CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ASCII=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_UTF8=y
+CONFIG_CRYPTO_USER=m
+CONFIG_CRYPTO_USER_API=m
+CONFIG_CRYPTO_USER_API_HASH=m
+CONFIG_CRYPTO_USER_API_SKCIPHER=m
+CONFIG_CRYPTO_USER_API_AEAD=m
+CONFIG_CRYPTO_USER_API_RNG=m
+CONFIG_CRYPTO_DEV_QCOM_RNG=m
 CONFIG_DMA_CMA=y
 CONFIG_CMA_SIZE_MBYTES=64
 CONFIG_PRINTK_TIME=y
-- 
2.34.1

