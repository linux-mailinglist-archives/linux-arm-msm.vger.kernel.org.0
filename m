Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B50E20678E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 00:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388834AbgFWWsi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 18:48:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388806AbgFWWse (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 18:48:34 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 914E3C061796;
        Tue, 23 Jun 2020 15:48:34 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id g75so352324wme.5;
        Tue, 23 Jun 2020 15:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6ZeWSgHa0mxwXsK/LO1CPNj7HNd9ZLAV4Wg1yjgbjbM=;
        b=Vdu3LynR3Fn0cNEwwsmPb2T5tZm3RX5EfJgAeZbKtUTiQEJgPm+82RM0RjJ96wGwSO
         q1fuhPxDABu8z/R26X1H3EPZWA/7kNtMM+4eMiiJBgxVb7Wt38r1+Vqf0Wec/nLGT0aj
         QZcrSOFiNvXh1ddpQDgfCRH7/uxg6mGYqLCF3zuJfgZfW7qyDBnmI+4SRiXsy0hk92sB
         kDlq8o4Ayasd7ycOF0/dLoRRV20VddaH2qCnIBr8FkEVCXpXXbvDdjZuDMnkyQZsSfg9
         xMbC3ao5Y+0fyRyvBxjp3WiQtdgmwE7+IZLiD/ukGa1lkDdUwydZe2aUvBzezkT96XR9
         3dyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6ZeWSgHa0mxwXsK/LO1CPNj7HNd9ZLAV4Wg1yjgbjbM=;
        b=YMn1r5Z9FxtdiHxdVzpcIFzkWkwV1EjmKiKIwnABiRtYbnrZIIrFu/kzNNT7N7QTjJ
         Gel4cDcbRPTNzPe2Nu4c0AOIXYs2K83su+/S/3+VfVKiJeLu9DXtXff9+zWGJZ+0AFxd
         FcRp1RP3UqqzfWaoJLKagsdn4EqdaxbTBT6N7Hs0xcWqYFe726pwy1EfLfFXWA/55IPI
         zN/JFlOciIoFFeTZ+2E72kTAlSzc6PdIs1kI3/Ygvi3dyb6rkgQbtVwkdxHz8bLbUo7G
         Zz8kQsaNwS+5Ahygq0hoAMoFuoCe6ZzvnZxZXJuv0VTd7b6YANnU/4OU4Uuy+/NkbU6O
         3XuA==
X-Gm-Message-State: AOAM533Ct6o5cZzhiJyM/eqSiK/xABJK0BfKpdq9q8Qo1KYBUF6DywGY
        Tt5vLzCj04exg1mFoFhHFFs=
X-Google-Smtp-Source: ABdhPJxo+GFsN4ILeQa4HMVKKl98MYgYO30vjn/GMb7KY4tRDgpmfbAXwTc6XeV4eEeiBLdQ7gKfGg==
X-Received: by 2002:a1c:ed17:: with SMTP id l23mr27897964wmh.73.1592952513350;
        Tue, 23 Jun 2020 15:48:33 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id g144sm5671179wme.2.2020.06.23.15.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 15:48:33 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/12] arm64: dts: qcom: msm8994: Add SCM node
Date:   Wed, 24 Jun 2020 00:48:05 +0200
Message-Id: <20200623224813.297077-7-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623224813.297077-1-konradybcio@gmail.com>
References: <20200623224813.297077-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index f989530ffa90..838ffc0d9c16 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -142,6 +142,12 @@ core3 {
 		};
 	};
 
+	firmware {
+		scm {
+			compatible = "qcom,scm-msm8992";
+		};
+	};
+
 	memory {
 		device_type = "memory";
 		/* We expect the bootloader to fill in the reg */
-- 
2.27.0

