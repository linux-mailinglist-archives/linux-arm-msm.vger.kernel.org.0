Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD3E3AEF35
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2019 18:09:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436707AbfIJQJO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Sep 2019 12:09:14 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34905 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436700AbfIJQJJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Sep 2019 12:09:09 -0400
Received: by mail-pf1-f194.google.com with SMTP id 205so11805082pfw.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Sep 2019 09:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BXles0cH5YGr7OfqkOJ72KVG5DkMe0UjZVzH2kBE6hs=;
        b=T2zSyHcEiyCtbS8xoj/ECUACFJexd7ZGxA/Cwu1Ed2uaIIhPjEgfE8/61M2nZVJLBm
         naR6pG28QpnVsTp2W51i+6ULyNWT6kVyhO8VoOvzKVTHc5F2cwDTufQa4OF3FyYP04dk
         APV2Ac6LXoj1jxXRVHsGEBPoEuvTGMNcF+7Lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BXles0cH5YGr7OfqkOJ72KVG5DkMe0UjZVzH2kBE6hs=;
        b=Xrpe5jreoctj7e3aKp0w4grszdhoI1twNpPHfjoXJjzHvD96EvEhWlrtyYL2nfLKoV
         Y7Z1Qe6G5qINXVBM7H50ucTdiKvBIYxLonxV/budfQben4E8b84fl/GN8SMEdv3XimWv
         udbhtxNh1owScJW+1Q6PjlRFCs6fn18Ct9+WNKb5/lCyaE7EVt6rDK4M1RgapnRpNNqS
         aWLeBSOOIM2IoaXGCusICGO77zjAZTRYs3KOMXNsJwkfpPC4cf8e12VFXz6IlNxYL999
         9aRaBwx/TuxbPHbBBplw8qRXPYPwnxMqW7wug77cmTz9cb1y6kui4JGCaQ+VVwPT1/Os
         RKfw==
X-Gm-Message-State: APjAAAWa1e/C2kpHG3jj1h/w0rZHgD8GYRcDa/WwWdGRGO+yx+g9ygz3
        uksTtHI32UrLfdQo07HN1G2zeA==
X-Google-Smtp-Source: APXvYqwdWlZubSWHnT9D8yZ1LDDemTMKo+tmMy94vJ9+/SnQHMWaD5lO6RzbXotNH1LnwMd6vahwOA==
X-Received: by 2002:a65:4b89:: with SMTP id t9mr28326267pgq.55.1568131748161;
        Tue, 10 Sep 2019 09:09:08 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id em21sm106088pjb.31.2019.09.10.09.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2019 09:09:07 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Dan Williams <dan.j.williams@intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Evan Green <evgreen@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Will Deacon <will.deacon@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v3 4/5] arm64: Add support for arch_memremap_ro()
Date:   Tue, 10 Sep 2019 09:09:02 -0700
Message-Id: <20190910160903.65694-5-swboyd@chromium.org>
X-Mailer: git-send-email 2.23.0.162.g0b9fbb3734-goog
In-Reply-To: <20190910160903.65694-1-swboyd@chromium.org>
References: <20190910160903.65694-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Pass in PAGE_KERNEL_RO to the underlying IO mapping mechanism to get a
read-only mapping for the MEMREMAP_RO type of memory mappings that
memremap() supports.

Cc: Evan Green <evgreen@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Will Deacon <will.deacon@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/include/asm/io.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
index 7ed92626949d..c623e75d9152 100644
--- a/arch/arm64/include/asm/io.h
+++ b/arch/arm64/include/asm/io.h
@@ -172,6 +172,7 @@ extern void __iomem *ioremap_cache(phys_addr_t phys_addr, size_t size);
 #define ioremap_nocache(addr, size)	__ioremap((addr), (size), __pgprot(PROT_DEVICE_nGnRE))
 #define ioremap_wc(addr, size)		__ioremap((addr), (size), __pgprot(PROT_NORMAL_NC))
 #define ioremap_wt(addr, size)		__ioremap((addr), (size), __pgprot(PROT_DEVICE_nGnRE))
+#define arch_memremap_ro(addr, size)	__ioremap((addr), (size), PAGE_KERNEL_RO)
 #define iounmap				__iounmap
 
 /*
-- 
Sent by a computer through tubes

