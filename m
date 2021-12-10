Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2C194705E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Dec 2021 17:38:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240000AbhLJQlb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Dec 2021 11:41:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235195AbhLJQlZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Dec 2021 11:41:25 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55A68C0617A1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Dec 2021 08:37:50 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id 14so10985158ioe.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Dec 2021 08:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n3CDcI54wXBndnATfaMcGfwDIMzZa57DanUaHDpclF8=;
        b=dsMAFy5prSCCxT2IzDIZiNSdPbgM5oi8w1R3G8KQ4QwfXmYwx/EVGIR5RV+lPoFZcl
         Qt94CzE5UZmng7MfvHRq+bnMemzdYy2G2InDx3SrPwnBnXMvbKIi4/kHJmQrFVEsqZgY
         mml9FRqHGen/TMuZo1tgICRl/dY3Oty7w6s07/CawJqDRl2PFn0WNCh+rcraJxGCMoio
         8hgTBL3D8UDOoP8DMl8TyUxqtEQsP6FuwaOBq2UjQ/UhufaK9OKk4us9Cl+6q9k7JZta
         4JGZf0IJ6fkng8PZLm13+bFU/khGtnOnt8dwk+OUhDTk9u3KxCAg0WP7ZoqBAV5+V3AR
         29Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n3CDcI54wXBndnATfaMcGfwDIMzZa57DanUaHDpclF8=;
        b=cASxEFjdA7BuC/LAKOBRsSi3ikY3Z1FtZ0EUl01lI98A8cI3u0+97ul4i1WYYjTUvd
         qr7MCAZ3kDyCHymbRYD7d9xpnByiikjYECHEqK2Eiym0us4jCO3zzVorfpENV0Fj0+/m
         wCYwF+0QdHBhdyBVkWtjoaea0n6qZNweLjgixqgEP6gTjHG9Y5TwlNTP78SdQSNkax7n
         +7bmep2jUvQ+SQ0zvLjzaauRgTdi5VyIsO0JNoR5EZu37FmpJuzAjRb8b/0JsriOJ+oh
         P/ti/ncI3X7xy0R8gwooCvwT1KNY24ySjw1TzTrV6DAsNTxWkBjzY+bsCL+6V5VYyO2L
         Y5yw==
X-Gm-Message-State: AOAM530N713F+gBrmU4HgIqlsOqbM6I5h4MkHUn1VM8AQpbD1mm//NAT
        u3M7Wjt7bb9XrUPhMcc5oSZs6wdwMWeVKk9V
X-Google-Smtp-Source: ABdhPJyDjPrJ+8imAtwL8PhNmfvMqc+00VzvlMSpFrD6KD0SLWbNB945FeVUe+D+kI2liCwA8FtErg==
X-Received: by 2002:a05:6602:2a4d:: with SMTP id k13mr19245303iov.133.1639154269726;
        Fri, 10 Dec 2021 08:37:49 -0800 (PST)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id p14sm2232642iod.38.2021.12.10.08.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 08:37:49 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     david@ixit.cz, manivannan.sadhasivam@linaro.org,
        jponduru@codeaurora.org, avuyyuru@codeaurora.org,
        bjorn.andersson@linaro.org, cpratapa@codeaurora.org,
        subashab@codeaurora.org, evgreen@chromium.org, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/2] ARM: dts: qcom: sdx55: fix IPA interconnect definitions
Date:   Fri, 10 Dec 2021 10:37:44 -0600
Message-Id: <20211210163745.34748-2-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211210163745.34748-1-elder@linaro.org>
References: <20211210163745.34748-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The first two interconnects defined for IPA on the SDX55 SoC are
really two parts of what should be represented as a single path
between IPA and system memory.

Fix this by combining the "memory-a" and "memory-b" interconnects
into a single "memory" interconnect.

Reported-by: David Heidelberg <david@ixit.cz>
Tested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Alex Elder <elder@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index 44526ad9d210b..eee2f63b9bbab 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -333,12 +333,10 @@ ipa: ipa@1e40000 {
 			clocks = <&rpmhcc RPMH_IPA_CLK>;
 			clock-names = "core";
 
-			interconnects = <&system_noc MASTER_IPA &system_noc SLAVE_SNOC_MEM_NOC_GC>,
-					<&mem_noc MASTER_SNOC_GC_MEM_NOC &mc_virt SLAVE_EBI_CH0>,
+			interconnects = <&system_noc MASTER_IPA &mc_virt SLAVE_EBI_CH0>,
 					<&system_noc MASTER_IPA &system_noc SLAVE_OCIMEM>,
 					<&mem_noc MASTER_AMPSS_M0 &system_noc SLAVE_IPA_CFG>;
-			interconnect-names = "memory-a",
-					     "memory-b",
+			interconnect-names = "memory",
 					     "imem",
 					     "config";
 
-- 
2.32.0

