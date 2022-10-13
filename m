Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBFF55FDDB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Oct 2022 17:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbiJMP43 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Oct 2022 11:56:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbiJMP41 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Oct 2022 11:56:27 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C3CECC830
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Oct 2022 08:56:26 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id o67so1520539qvo.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Oct 2022 08:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+GrD2PrV67UCcsk4Pt7+1kDoXwEsRN5rKhHYf0ad34=;
        b=et3GbpP1oeXGYPRlPyaevePbl6W3ecrIY3gkxK1UJhCweRfBuNGA2W1UMEIZ1vDsxf
         CdLB0MOly9yoFRIRMpdQdRMvOVb9vVFVGSikngN5PC7Z9qk8FNUBMCphLBrM7HAREos7
         SuTOKfNiPS0Jg+JX/yEGZEK75cF9TE4YloE8JF6LM8Lmff4+hZOV/UswDwkgIk0vjBig
         8y96M6l4e3aKwHPVleZWyFrgNHT2mz/y2J61x+J+TMm93w2QaE9O/0Lq4tj9QwRVlgLU
         RThHIK8Oh+aK3EGBm/pYIz0WWL7ang6UG4eUBcQ8zC5C2YUKEHJE14iVzEgf9NTkzLtU
         eHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+GrD2PrV67UCcsk4Pt7+1kDoXwEsRN5rKhHYf0ad34=;
        b=mqqS+EJpbjevaFO2TxY08Kud5Jat/MH/X1j9uaCR/LkUwcMr0kPlETuMqD6ZZ9IhWm
         yLE5OT6fW/LC9xFNinq2vFSGKxK//glu8UbfJCYo/x+I9Q673qqJ5tL9/TQICJkyiNai
         w+44EGv4j2lKKD2cI4+QOxds9iTVFuwZtSnkAqP6XwNk/NsIGjAA966ttKxRflFaX8T6
         GfNMlNcvKCZ/OMQNSWG3m/ORGX2sLamEkgX+y3dhL5IGDHRcoW0xaBCwQnHF+NnaP2ej
         LSJecDaXEQohGXovCcroTYT7cUeVAaQga2eyOVzA3XhUKlSrqppK4V94am4ZUAYdX49i
         +dPg==
X-Gm-Message-State: ACrzQf1q06uEaa6bevTbzclswzpDmkrX/LwHkd884deaBw32G2WGkJy0
        FDQ2viY086jg/7qhVH7SlzTjzw==
X-Google-Smtp-Source: AMsMyM63NiWTHbyLDuAOn0Cb3ag3YgZOt0hJXOnrZUPSiR4/sTaduzc14OF/dJ1LBV0GowuWHaDE5Q==
X-Received: by 2002:a05:6214:2464:b0:4b3:6cce:9860 with SMTP id im4-20020a056214246400b004b36cce9860mr499889qvb.120.1665676585351;
        Thu, 13 Oct 2022 08:56:25 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id u6-20020a05620a0c4600b006cec8001bf4sm65280qki.26.2022.10.13.08.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 08:56:24 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/4] ARM: dts: qcom: ipq4018-jalapeno: Add SoC compatible
Date:   Thu, 13 Oct 2022 11:54:18 -0400
Message-Id: <20221013155418.47577-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221013155418.47577-1-krzysztof.kozlowski@linaro.org>
References: <20221013155418.47577-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add qcom,ipq4018 compatible fallback for the SoC.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-ipq4018-jalapeno.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-ipq4018-jalapeno.dts b/arch/arm/boot/dts/qcom-ipq4018-jalapeno.dts
index 394412619894..365fbac417fd 100644
--- a/arch/arm/boot/dts/qcom-ipq4018-jalapeno.dts
+++ b/arch/arm/boot/dts/qcom-ipq4018-jalapeno.dts
@@ -7,7 +7,7 @@
 
 / {
 	model = "8devices Jalapeno";
-	compatible = "8dev,jalapeno";
+	compatible = "8dev,jalapeno", "qcom,ipq4018";
 };
 
 &tlmm {
-- 
2.34.1

