Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07AE646A53
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2019 22:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727484AbfFNUhZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jun 2019 16:37:25 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33878 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727660AbfFNUhX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jun 2019 16:37:23 -0400
Received: by mail-pl1-f195.google.com with SMTP id i2so1466502plt.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2019 13:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ctzVWLxLHqItydbbPUXjVh0gv8n1U7GRnaTqF8ILaog=;
        b=BDM1M+271IQoGfkSDrl85T8Rg7KP/lRKJEOPCJCfChPITi0i6Zs3pcycaA0GBFCgll
         ZQD1tlZUFKuxGUoqIjPaF/Qk+ZU199aERuJ0yHM5V4ez2VXIdzvl/L2iaeThCLAIVS2b
         DdSbS6oQg5U5nGMrQ1vc6prTrvy5arXwJE6ZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ctzVWLxLHqItydbbPUXjVh0gv8n1U7GRnaTqF8ILaog=;
        b=Wn8VF5oQdFouE9BLPo4tOYcDRGFzCsAbZFTTYgrMKxUTwRj7Y2MAgm44z6oknUPYSB
         52qT209X+Ye4cuFDwRczOTj2ETTLADNLjQpyE4nVN+bnK453TLUw0pNNwfdiKzoNEEe+
         HG53ZQNXpLpLggt7JiPDphxH9Q/mq/6UXzqJJrhPKvwWvTGdNWsaYp31fTpl1yH8ez0l
         FsxjknDpVOsJY8Es4tCohxYe7BqT1JelrlBpEJPqOzBEJ7xKVppmFVicIPEPSnsH7DRe
         KgRfqW5Zw8SBm6NvkAXQfzF7orkj0TprpEyDNbr40u9Emcc1pQAJPCQvNRw/ud3Pe0xi
         FdEA==
X-Gm-Message-State: APjAAAVpNjbLbis4KZ2izoOmvYl40sgLXTOJiiTl2eL9fKNpZ7HmL5M8
        Ux6ntptBVa4u4j5V4wlTOhVCZA==
X-Google-Smtp-Source: APXvYqw21FhItxYFfLoN4gG820hTamDRhMvYBgFH74z4L0jEESW79mOUdZTsiokL1tAuHIASvtvreQ==
X-Received: by 2002:a17:902:f204:: with SMTP id gn4mr77051069plb.3.1560544642914;
        Fri, 14 Jun 2019 13:37:22 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id x5sm3673187pjp.21.2019.06.14.13.37.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 13:37:22 -0700 (PDT)
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
Subject: [PATCH v2 4/5] arm64: Add support for arch_memremap_ro()
Date:   Fri, 14 Jun 2019 13:37:16 -0700
Message-Id: <20190614203717.75479-5-swboyd@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190614203717.75479-1-swboyd@chromium.org>
References: <20190614203717.75479-1-swboyd@chromium.org>
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
index b807cb9b517d..cc33f4c8647b 100644
--- a/arch/arm64/include/asm/io.h
+++ b/arch/arm64/include/asm/io.h
@@ -183,6 +183,7 @@ extern void __iomem *ioremap_cache(phys_addr_t phys_addr, size_t size);
 #define ioremap_nocache(addr, size)	__ioremap((addr), (size), __pgprot(PROT_DEVICE_nGnRE))
 #define ioremap_wc(addr, size)		__ioremap((addr), (size), __pgprot(PROT_NORMAL_NC))
 #define ioremap_wt(addr, size)		__ioremap((addr), (size), __pgprot(PROT_DEVICE_nGnRE))
+#define arch_memremap_ro(addr, size)	__ioremap((addr), (size), PAGE_KERNEL_RO)
 #define iounmap				__iounmap
 
 /*
-- 
Sent by a computer through tubes

