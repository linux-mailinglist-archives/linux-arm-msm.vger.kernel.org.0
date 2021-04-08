Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE02358AF6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 19:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232656AbhDHRKP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 13:10:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232666AbhDHRKL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 13:10:11 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 538EDC061762
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Apr 2021 10:09:57 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id o123so2310803pfb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Apr 2021 10:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CUOMofHjk38C1yfeP5pPsHggdprA8rEZ0lTypJr6+M8=;
        b=yWgRNh7J7cBViL6JLdnkdqw8iGZS46SCIu+PO+DkowazbZDUlejMriOOooCbgCeSdX
         6XALehGHmutYM9y/0Z5sRrVAOrMNcjpgLgvKQdvT4ROo0dloHV1iLbQXuwOeW9KD1M89
         mEGrQ2LxCwvGtmkHwzPSmsRD50CVqPlvoR23Jbn+WOhGVUeNxYKsPN1IHzFBNhRb91yq
         Cdh3GHVcCaTqB1KZy9fOoZYbqnLYSkeVmFVZL4Vlb/3ocJ6ZmxV8YB7LXchWfJavCyFi
         3E2ANHzcXRWHPTxeDDzzeP06GsZMeWBtn4UH6baMTRt0dsz4DgIPOKc92UIwWJFY46wK
         rluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CUOMofHjk38C1yfeP5pPsHggdprA8rEZ0lTypJr6+M8=;
        b=uESZpa9xmLl8uDg0YdijVOOnfgz51J7BJOpmC7Nzu2wWAKS1htElc/57lIbd28Sjgp
         anemc+4SvOdwgQjWe54BxRyWy2mSShBl+Yma/YqFz25c4TAeCCHaAli/NnB5heSF3xFu
         mS5TWgYBAQAqSxXiFFtIajwRYDz/I62shgGFOAueIqv8RbLLELWwQYBi0LeXb4vjjdIl
         6WBX911tOl1TjzJutLqidQ6yNVA8eK22SIJrJEHEa3hneY0ha8RuGEjjNks3Z/HmJ+0K
         uWACXoOV4Zd7MKaEB+qVr76ujqETW/r/NMT7sGpAjxeZeQCdzEGnhxpgYjPgUU4veiy8
         oOag==
X-Gm-Message-State: AOAM531dWlhExQdf2pJNc1sasHQLWr78vSAxHi/Z44RMRwOT9XTGkNfc
        aTnDWE73VDFxfJ8CHM/e1of+
X-Google-Smtp-Source: ABdhPJy/DNdUcOGFNWsbdCkw3U8Gw+pvB33hKgLoiskXN8DX//TkDYgakNYqoXovVhXjfcElFo4aqw==
X-Received: by 2002:a63:a62:: with SMTP id z34mr4196042pgk.189.1617901796877;
        Thu, 08 Apr 2021 10:09:56 -0700 (PDT)
Received: from localhost.localdomain ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id a191sm57921pfa.115.2021.04.08.10.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 10:09:56 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 5/7] ARM: configs: qcom_defconfig: Enable SDX55 interconnect driver
Date:   Thu,  8 Apr 2021 22:39:28 +0530
Message-Id: <20210408170930.91834-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210408170930.91834-1-manivannan.sadhasivam@linaro.org>
References: <20210408170930.91834-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable interconnect driver for SDX55 platform to manage the interconnect
providers.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/configs/qcom_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 695612829503..5955aeb0646e 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -277,6 +277,7 @@ CONFIG_QCOM_QFPROM=y
 CONFIG_INTERCONNECT=y
 CONFIG_INTERCONNECT_QCOM=y
 CONFIG_INTERCONNECT_QCOM_MSM8974=m
+CONFIG_INTERCONNECT_QCOM_SDX55=m
 CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT3_FS=y
-- 
2.25.1

