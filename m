Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 749DE20246E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 16:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728340AbgFTOsi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Jun 2020 10:48:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728387AbgFTOsg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Jun 2020 10:48:36 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B38BC06174E;
        Sat, 20 Jun 2020 07:48:36 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id b6so12338541wrs.11;
        Sat, 20 Jun 2020 07:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PCYX+4y1d3sit7Cy0bnnSZ/0gVVWMuNbGae/R+4UFWY=;
        b=KI7Hid2+UGR8UrsUwGEY+cD1zAKNwD7P7JqaVeWeOTQKf3OxdjuYWKGcrTffN/3UJT
         S1uyHRedsJ4mXBYt6TjfMOiDlEhHa1BmaBJgmDMmJ0OzWMfkTHd6P4KUyil1HOUTo8Si
         gp6FNbW5yVuylNkL0oyFPDVRYrCajbkJCZTTu20EkaudGgFZeCDAySgIGwEZcpvDCnWP
         w1z4ZHMwzKf3r2nXh+dLaUqjtdz4F8e4kLIwRdbYJjVpOipMYMmofsYyKfysZ2fEhMN8
         ts3PE+uUeZv1XSjinYEoEGm/ZPD3w0HdKxhTPFRD395VhAnZ9qpsyuldiR4HXiYzFtBH
         Ic7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PCYX+4y1d3sit7Cy0bnnSZ/0gVVWMuNbGae/R+4UFWY=;
        b=sKguT8CrtSsqbwnn/r07KnYeM4mxBR5CBR9NY6Rfy1TZjJSp3YuNu99G7SIqFsJii1
         GB3Yo9JHncr41hWlLgLW/9/MbsFOHYUJwl3AYMd8d7V3aoVfSSyO/1x3JlYptd8xI9Ux
         oky/J87pIx/SVcdQiCdMFKKTFunIw1TwzRPej41+WV+mvjhFGcDt/QGCkL4Jrjo3Z7A5
         9BJ5cPMS7SkpV70KExSeh1ZL6pVFMSgtxNUjJseSWeDHjBr5LMgmmlfvGt35mw0F+Tgp
         urNCyJg2IpMHj0EaZVAFO9C5+bSXZPF1HyiXw56K17f17Q+JBbhJ2bpxlbq/ZJ/SkKnp
         1HNA==
X-Gm-Message-State: AOAM533/v+6mi0B7+nAH4JWuJwhqUs9HjJyHzWHmPFQckH833cdl5rQ6
        Wmu7NB+jAdy1fGJJPKL/mR4=
X-Google-Smtp-Source: ABdhPJx+fwpSJ7HchGBJIBA+lsOrCHBkLOyHiF8Zo7gXVFGhZy6xWwww2mi0w2zBqjv/B9twTy8tzw==
X-Received: by 2002:a05:6000:108c:: with SMTP id y12mr9205057wrw.88.1592664515423;
        Sat, 20 Jun 2020 07:48:35 -0700 (PDT)
Received: from localhost.localdomain (abae138.neoplus.adsl.tpnet.pl. [83.6.168.138])
        by smtp.googlemail.com with ESMTPSA id 63sm11928379wra.86.2020.06.20.07.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 07:48:35 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 13/21] arm64: dts: qcom: msm8994: Make comments C style
Date:   Sat, 20 Jun 2020 16:46:29 +0200
Message-Id: <20200620144639.335093-14-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200620144639.335093-1-konradybcio@gmail.com>
References: <20200620144639.335093-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index b1a3f1732d84..19c9ac30453e 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -1,6 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2013-2016, The Linux Foundation. All rights reserved.
- */
+/* Copyright (c) 2013-2016, The Linux Foundation. All rights reserved. */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-msm8994.h>
@@ -307,7 +306,7 @@ sdhc1: sdhci@f9824900 {
 
 	memory {
 		device_type = "memory";
-		// We expect the bootloader to fill in the reg
+		/* We expect the bootloader to fill in the reg */
 		reg = <0 0 0 0>;
 	};
 
-- 
2.27.0

