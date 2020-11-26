Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB7962C4CF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 02:56:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731908AbgKZBzE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Nov 2020 20:55:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732193AbgKZBzE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Nov 2020 20:55:04 -0500
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2605C061A52
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2020 17:55:03 -0800 (PST)
Received: by mail-io1-xd44.google.com with SMTP id t8so284078iov.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2020 17:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JZPNRoMYLuNJx5R1MzdfuSOABELG2lesyMBvmWbGMxg=;
        b=Y83xQoxY42o2AGkyqw94yGwRvU6beQuwKDAcwuN3u4isJP4Z7zYsx7skmLeypkJOWX
         EZOMMtaPcZAvibDIKIZhDWTEqRlf/pVYptAQ+GjPZbBjlF6mXJKCdXtE0px7pLbScmAp
         taGqxTIHGTNmm/P/8Hj72fRoO1vF3ptvBoKrXbYQpUZnqAbITSALDHbNKlVNNT0yfZgC
         1C0pkPlJWBI5g1h2FYTslK9cSFvTWav54/L87IEocaxGYoSxUuT0hUs1fzXg4IaQ0rQH
         ha9AWWvJUWbwrlJoP03aSZUKYpVpMVcmz2iwWlhp1j3f8GQjDxpyIVSeX9yYa+SrQNlV
         O0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JZPNRoMYLuNJx5R1MzdfuSOABELG2lesyMBvmWbGMxg=;
        b=SPemUECTDGt4Aeu+IaW1V36ta/ZrO4Cr2zpvvETJh8ZzKwZ9NoXi+FMseh7S1U4u7O
         ZSGUvoOaCjic3sZnLFt9BaPevC0swbKWHjUKUC7nAs8ZKAj4d/t4BAbIYET6eahtA5Be
         uamWncegEyjSkxYW2yxxqYAnyBiPo61ETJ6YdumHpUk02YrLwn4QJc4trq3Jc8Uii3l5
         vnJ2VLYWf9hm0gnWfPh8thr70B99PGQIc3H1rzFlEWE9CXrtYE3GhaHnackj7vlErbTL
         cwjEVTaWKlBLdT1ySdlEdDl1yLwwyGrBHC1+F/2pGWDu31qHuaxw+Knz5n0g1PN0Sc6A
         7uKA==
X-Gm-Message-State: AOAM533DQih2UnMXG5WPAJiHTxmVgsw6WkHmfkpFARdM1aOuLBR5fJ05
        DrIMdpj2VxkQ6WYZeJL3K0NXqA==
X-Google-Smtp-Source: ABdhPJwroJ+IBdUoOfNghJSRcYSl3w+fPGFUXL0KylB1fx8E+KtTa9F5FZDZPY30Rg0cHlbHEOoDeg==
X-Received: by 2002:a6b:8e4e:: with SMTP id q75mr509341iod.183.1606355703385;
        Wed, 25 Nov 2020 17:55:03 -0800 (PST)
Received: from beast.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id r17sm1714907ioj.5.2020.11.25.17.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 17:55:02 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: sdm845: use GIC_SPI for IPA interrupts
Date:   Wed, 25 Nov 2020 19:54:57 -0600
Message-Id: <20201126015457.6557-4-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201126015457.6557-1-elder@linaro.org>
References: <20201126015457.6557-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use GIC_SPI rather than 0 in the specifiers for the two ARM GIC
interrupts used by IPA.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 957ee80704e74..256a698745ac2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2152,8 +2152,8 @@
 				    "ipa-shared",
 				    "gsi";
 
-			interrupts-extended = <&intc 0 311 IRQ_TYPE_EDGE_RISING>,
-					      <&intc 0 432 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 311 IRQ_TYPE_EDGE_RISING>,
+					      <&intc GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>,
 					      <&ipa_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
 					      <&ipa_smp2p_in 1 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "ipa",
-- 
2.20.1

