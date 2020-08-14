Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19371244BE3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Aug 2020 17:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbgHNPWQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Aug 2020 11:22:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbgHNPWI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Aug 2020 11:22:08 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42799C061384;
        Fri, 14 Aug 2020 08:22:08 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id v22so7115889edy.0;
        Fri, 14 Aug 2020 08:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/ih4Rf1fys+3V3bYHR06uQQ/6JimIUcju77eK2mx+a8=;
        b=apTCCIIRtZJe2OdaK+cQWlkqeq7lOBkdmQTPxItcxLC6M+Vo5BLbKn6pZ9e+jaQsqa
         8CDuxHy5HatIbPaA3sCOEBU9t7p/tw/EENH+l3aweoCdjEJk1ql/ftuS3TC/uHGugyab
         gDHiF/+J46W5IhqopoYvXMKepADIyPp6BtDu9wL+OcU5pT4oR6x2RqLwnOuCuleJQYK5
         d4I6OQ8TgFP45auoSFoojgG9O1ESDEJrV50lDb2pxTnpk8mLU/sphA71i4+nRQmrPuqm
         NRDmHjz8aiZhJubhHLLNKE2M2F/bJ1qFMGckEzPLiYdzWbbXA/2wBc5pn1s8rsiZg0lz
         fswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/ih4Rf1fys+3V3bYHR06uQQ/6JimIUcju77eK2mx+a8=;
        b=J1Q3aFUgCqNKIu2DU1aifDAC6NJPBZ5y/5xy6aAxOh8IXgO9d2wg014pazFE60qLN5
         PC/HqUk5S94SkouJ3nuYvU0yTg/ES5xaZ9BDfo6MDODZLIT7qQ6CWt/UgttND5e5yYc5
         xszCY7ouT8AwUc70RDxnqAZHCSDvbTYN5kwFHVxti9RzNGSaDQgb9giQ8P1W2m21dNvj
         Wh85F+CAAAzThQbZgTyafyaSVItDw9XaCOnR7QdKdmNBnDOxK5hm1InMzXIttMyj6GWg
         KBQ6zHjrgmWz76DLAtMDNWhCdGNBuZ7uKHLHIZlx5Cws+r8zeds0I+mJ1CJDNGnOt1Ed
         TKXw==
X-Gm-Message-State: AOAM532K8ypgRxmFra9yXD1ANHeJCWRNMaqZBZ57VnFKDXY370cVBsEy
        TKhGaXpcy6OETcFIiLSlOqU=
X-Google-Smtp-Source: ABdhPJw2WN3FXSBnT1ya0PnsO1C+XaduTRHZBOS2jAUmuI6LT40u+WhxoEh+VkXqMPZKMZpAA6mvqg==
X-Received: by 2002:a05:6402:1c09:: with SMTP id ck9mr2807701edb.74.1597418527065;
        Fri, 14 Aug 2020 08:22:07 -0700 (PDT)
Received: from localhost.localdomain (abag79.neoplus.adsl.tpnet.pl. [83.6.170.79])
        by smtp.googlemail.com with ESMTPSA id e8sm6087974edy.68.2020.08.14.08.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2020 08:22:06 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/2] [-next] arm64: dts: qcom: kitakami: Enable qcom,full-pwr-cycle on SDHCI1
Date:   Fri, 14 Aug 2020 17:22:00 +0200
Message-Id: <20200814152201.254010-2-konradybcio@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814152201.254010-1-konradybcio@gmail.com>
References: <20200814152201.254010-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is required to prevent permanent eMMC damage.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
index 30cb3aa7d734..eb806d1e4454 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
@@ -439,6 +439,8 @@ &sdhc1 {
 	 * vmmc-supply = <&pm8994_l20>;
 	 * vqmmc-supply = <&pm8994_s4>;
 	 */
+
+	qcom,full-pwr-cycle;
 };
 
 &sdhc2 {
-- 
2.28.0

