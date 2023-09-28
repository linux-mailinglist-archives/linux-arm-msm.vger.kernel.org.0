Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 305387B1975
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 13:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231952AbjI1LEP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 07:04:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231904AbjI1LEC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 07:04:02 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B4C910D4
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:03:43 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50306b2920dso15232842e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695899021; x=1696503821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nM3zUCrkzzZCM+Nf4nmXa6grbgv8Ay5KiASe8iKB7nE=;
        b=IS6mT8MfCf6Z4Fvxlqkf6YWQ2Up1OUFlacYSkYBlLtVd3caG1aGEM9iaR49lG6TDFR
         lHfa6WGtZ9o3WgLA7mSbaz83uJDfpE2S7mAtk3cRQLhqEpgTqizGmohPf5+N46R8sErs
         mzYWY9uPv7aRJ+luisw7FrgEAz5G+s5E/lYPyBRmQ0KagCXi32kangIW8JnXvv5eeQL4
         d9ZkmsuLEB28UJWN7Q3MsuXweEDaXuh0OPD2b2Dn+qcc4B9XmevmdZJE06DpAtDoCQ8B
         DW6zjDFn+0q/5CWPiM7Qbh933vYq4zx4mv7Q2FpGQjWQZHwKnZ61YCJw37QG7l/Jy8/d
         QONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695899021; x=1696503821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nM3zUCrkzzZCM+Nf4nmXa6grbgv8Ay5KiASe8iKB7nE=;
        b=cY26cNl94Uuuw4ZZ5S8bVgZrPCNLcjag5BaOEmiIZcI0UMhBAJGmGYeJIFNNxRkJNd
         tDXevuPXEBjfPaBo9mCaPoEsEz5aAlRRi1hmxxGJYyqPR5ezcIA/q8vgpdVHBCrRgWyt
         dPoyZk5Jqh2i9QoPUKbcOtbrrq+ezXKgWt/the+EyrxsVZGu2h8ZMArHMmCPKH3fMsPY
         2c33mYttluE2eZnyWG4BNcgAk7AW1jo3izfZzs6hfOFlOHNUPz08FuGIxqMdDhctRiVE
         P3QWQB1Yh8H9xPeJEd4damIjqrZexNi4ptzOTef+nw6c1BNie0IeGKCBToB4OaVhhjcu
         OY/A==
X-Gm-Message-State: AOJu0Ywx++9uLEGVcup1Az0cX+r9FRaOyP89nbr4WrDNNjgDmB+/swF2
        DmXI2bUJvVA4RoKmv/Yt43W2x5wOyuTpYos8WFXZqw==
X-Google-Smtp-Source: AGHT+IFeAKIYLEsj38kkkIwMz3KG8kRAlKVmJCP9F1oSvae03EQ7fsBURNMp6loK29neRwT8lDJL1Q==
X-Received: by 2002:a05:6512:3056:b0:4ff:9a91:6b73 with SMTP id b22-20020a056512305600b004ff9a916b73mr799362lfb.17.1695899021157;
        Thu, 28 Sep 2023 04:03:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a056512040200b005030a35019dsm3052953lfk.178.2023.09.28.04.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:03:40 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v6 35/36] ARM: dts: qcom: ipq8064: drop qcom, prefix from SSBI node name
Date:   Thu, 28 Sep 2023 14:03:08 +0300
Message-Id: <20230928110309.1212221-36-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
References: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Device tree node names should not use vendor prefix, they contain a
generic name of the device. Drop the qcom, prefix from the SSBI node
name.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
index 6198f42f6a9c..c3677440b786 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
@@ -366,7 +366,7 @@ rpmcc: clock-controller {
 			};
 		};
 
-		qcom,ssbi@500000 {
+		ssbi@500000 {
 			compatible = "qcom,ssbi";
 			reg = <0x00500000 0x1000>;
 			qcom,controller-type = "pmic-arbiter";
-- 
2.39.2

