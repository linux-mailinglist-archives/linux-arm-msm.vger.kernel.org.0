Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC7F8202455
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 16:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728364AbgFTOsV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Jun 2020 10:48:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728348AbgFTOsQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Jun 2020 10:48:16 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DC8DC06174E;
        Sat, 20 Jun 2020 07:48:16 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id g10so10911863wmh.4;
        Sat, 20 Jun 2020 07:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5QBFLdNPnq+Qfa+k76IKoOZK33SWyXuGFD7NQgeZQzk=;
        b=F5qP6dFhmxwp+W/R/YGMI4Ae7wBgy5ztNWzGkNfpcDpS527jJyVPCkALByOxPk+ORI
         AUADGyNB1lynXwd3rqI8cnyBvapvlcv6oSj1swMv4RJKZIiqqwDpvEhYmGbAVgm+OZGA
         6MCLczOEq0w205tBS0u2RZ2cT2+M/5CV+Xz/7ZHctSqz7MKmDV8+J0MvpM5AFF84s9CE
         vpkK8F7YH+Tv0Ji4lhOb45lRz+jPSIiEuWKPzPx3UfmP0gHfs/08uSWVqH2XlZeI/Sgq
         pIlnMd80LVOPef5LISYdznMA+nXcFnL+wo0LOaX7LLOQFJHZ/quJbeYdEkoziJwfcaIs
         ZDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5QBFLdNPnq+Qfa+k76IKoOZK33SWyXuGFD7NQgeZQzk=;
        b=XfISIDmCPPtX+2ynQ4b//z7VT3PdtVSo5Ok0jxY1TKzCQaCW83yzRzovRjw2BIF83s
         bjrRChvSA6f9YFL6qMMzeqY6EDb55zb46crhxbKRkelQ7t0WSY/Zepuq9/4abw1tJ/AU
         Wigb90g01FKs3/U0joC087c+icKFNWAh3Anzy4mgruDfiNKm/XuXCP865PrXS9pxOB3U
         4ExnYQ7OBW03oPJrzyARPocBVa8W80sThs0s3ELZEL/6SiKhQtJCqHDdS8uB2PQ6Glr+
         Bk0A8Z39jrfyNYHqp3C7fWlb/Suxj8J8Vy/QMZdZy1WQ6k2fKXfyy+z76cCO8JvgsrdA
         WA5Q==
X-Gm-Message-State: AOAM5317cmw6QQofoG+3lU7Wsbq+BUr6ocFSGu+rhgjPvzYEVzkFvB7L
        0vIGC7wx09sA0FOSRmmEkF0=
X-Google-Smtp-Source: ABdhPJy7140U3HXRbr7bMNKYjSf2UUwJaFxPG5rDtjrQKVmTtWryGCy7RTeF59XPpqftQO+Lhs71DQ==
X-Received: by 2002:a1c:98cc:: with SMTP id a195mr8989696wme.89.1592664495042;
        Sat, 20 Jun 2020 07:48:15 -0700 (PDT)
Received: from localhost.localdomain (abae138.neoplus.adsl.tpnet.pl. [83.6.168.138])
        by smtp.googlemail.com with ESMTPSA id 63sm11928379wra.86.2020.06.20.07.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 07:48:14 -0700 (PDT)
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
Subject: [PATCH 07/21] arm64: dts: qcom: msm8994: Add apcs node
Date:   Sat, 20 Jun 2020 16:46:23 +0200
Message-Id: <20200620144639.335093-8-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200620144639.335093-1-konradybcio@gmail.com>
References: <20200620144639.335093-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add apcs node so that we can enable SMD RPM

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 0a6d637fbbba..8853559f755d 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -269,6 +269,11 @@ gcc: clock-controller@fc400000 {
 			#power-domain-cells = <1>;
 			reg = <0xfc400000 0x2000>;
 		};
+
+		apcs: syscon@f900d000 {
+			compatible = "syscon";
+			reg = <0xf900d000 0x2000>;
+		};
 	};
 
 	memory {
-- 
2.27.0

