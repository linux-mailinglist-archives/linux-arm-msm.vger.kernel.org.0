Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 958A73E08D6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Aug 2021 21:29:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232110AbhHDT3Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Aug 2021 15:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231224AbhHDT3P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Aug 2021 15:29:15 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1DDAC0613D5
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Aug 2021 12:29:02 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id r16-20020a0568304190b02904f26cead745so2292203otu.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Aug 2021 12:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=auFQAqlgCrKWrcj2wTgyCwrQ8LuB5Vgp2FCt8uNfzBY=;
        b=Rcy2g/ksuJPuFWN319M4hTbby/3rxVhxL1dfpT2Pr0Qxmcn5yV0FX/bqKuEAhOz28O
         SkzEmjRMJnQFG9JjqqYbQsbkUaZEyOoYd3qQ3GbLsC3ZQrjS9fOwb9WIlsva2A98PgvO
         t12A8iFaXMuBJ65Lo585POu2DbcmD06dXv5ACLKrNLmdSn12mx/wY7pQgGFABqwTbVsX
         Yb5zSuCQM7W7X/2vNVM3R9evc/F2y1Niq2u6oecm0IfFYDcP94zK5izamKau/MXMZ+fR
         XbQflCG3HZVutMjpPtTv9r5y7xsdbuKlirka9xaJAoAMC7QLt30COi5XIuOYntJQ6ekR
         RVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=auFQAqlgCrKWrcj2wTgyCwrQ8LuB5Vgp2FCt8uNfzBY=;
        b=DVVdNhjRKnFSQA6Jlf18STBjPg0Eh7NMgfBWLcO2oerjoIZVgkJbKSXfTdrnt38joU
         FUlq/cI4sgcQC76zFG099K9nrWPlimVjez8JL2YTrqd2SpOkADOlmfltBuEmpmiEgOBl
         rvT3TIbEOg8CHGN8Vh9uDzZ+tDWY63/YzHbVR3MK2DND8y/IFFLuG75KqWFO4VjQWN4+
         4i9qzH+kZN/iV7qJiXYEvS+lh4s2XKC8BLsEB/j6vr5P8rOkKYaewSNc1HT5WDYAxnS6
         LNsUElzCJO4mg8B/+ENJ+UFn2Tfl9DVzhahROwfjmZclUyWBHkIhV29JCM650uYaYbvK
         GTJg==
X-Gm-Message-State: AOAM532aY0KhT/xD0W70cslbvC+YMmYpD71pu6jJaoQFG2WVxUOP6P0+
        Gj8rIkIt7JNDA+HXJKNRqGhR2CbLRvEHqw==
X-Google-Smtp-Source: ABdhPJztWHJvrr5MpjusvGtLLS0KDH1rGm6g2Dc2IdWXeFlCnEYhTsi/QSA21kCKx5j06NDLCjZuuA==
X-Received: by 2002:a9d:62d4:: with SMTP id z20mr918565otk.305.1628105342003;
        Wed, 04 Aug 2021 12:29:02 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t24sm544509otq.66.2021.08.04.12.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 12:29:01 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, konrad.dybcio@somainline.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: defconfig: Enable Qualcomm MSM8996 CPU clock driver
Date:   Wed,  4 Aug 2021 12:30:42 -0700
Message-Id: <20210804193042.1155398-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The MSM8996 supports CPU frequency scaling, so enable the clock driver
for this.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c7cf0d1ad34e..3bf6f8a86aae 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -974,6 +974,7 @@ CONFIG_TI_SCI_CLK=y
 CONFIG_COMMON_CLK_QCOM=y
 CONFIG_QCOM_A53PLL=y
 CONFIG_QCOM_CLK_APCS_MSM8916=y
+CONFIG_QCOM_CLK_APCC_MSM8996=y
 CONFIG_QCOM_CLK_SMD_RPM=y
 CONFIG_QCOM_CLK_RPMH=y
 CONFIG_IPQ_GCC_8074=y
-- 
2.29.2

