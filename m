Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D2D051583B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Apr 2022 00:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381392AbiD2WO1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 18:14:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381377AbiD2WOZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 18:14:25 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83801DCAB0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 15:11:04 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id k2so12426623wrd.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 15:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZsVi2vdwtOwGHEsduLeBsYH1a8quXWrNoG55MUiyKvU=;
        b=tXCGQNeZg2fybcmPrV9S+7vmvJ1Mh7kbdzhKPArdbp145NjkFB+0L+s48K95apj0fQ
         ja/5h34eyQhcsdC/DmBzovrWaxz85kA2QiWjcDVJkrny2oB+Bp9bdyQm+8ZCA3OOmK6a
         E6uZy/U2Z+YkOgiFTCNzYEOw/isG63QvvEkLf9ry4/0nUDiki7Ith7yJxSD+CVYkje2a
         1lOXw6JaWPUS5PpEPHLb3Q1oI5Dyo3dq82r4hLUcWOrVPw9zB6OLJS5HaK/MUIG5bg84
         La0OoNPf70MKIdpVlM7xssvMJE2i/DYWV+P5ca0b9Cpb/bGMPPtD52+erQTVlXDsZvs+
         iTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZsVi2vdwtOwGHEsduLeBsYH1a8quXWrNoG55MUiyKvU=;
        b=73Avir1MK0scC+AQX/zqvpvuXpSEJYjwwZ6Sao1FGk+aT2sNXFvXIfQ2SMycyq+D9t
         5d5Okf2oQsBhRUf9I5Qf/xDV1yQpmmLAlE3dyQiTfi50Pn3XeV7q8aSS+LDIFQja1CoP
         FEn6r/+IcrT7FEBJKF7hCmwMilDX7KY2hWVE3ClirGTC+o1AtmY+1SOxf5gzioZ20mS+
         1s9f8sbJxjxzBQpJOJJw3mVAePYi2yhIVp0v4cCxFlJQWa7J2nRHZjIJvSWKxrsImw9D
         d46610bbWWsK4LouyKPXCDS5rj7GJaaXTsS7zvhzl1HmA/b3xbV4txc2dBhQkHK2xNVl
         s19Q==
X-Gm-Message-State: AOAM532N3iOksl0q+Fu1FTexSwoY7M+I2ClP4w7Km+ORpI8vQtr+YG+0
        3p2zy1G3dBS1fio0DWcWZjXG+g==
X-Google-Smtp-Source: ABdhPJxHgZhAsngRwx8HBT2XVVHfhVYRR0+YIUabOWzqOJo3+lk66DkR3a1w/hVQjgiLod2H9fnZng==
X-Received: by 2002:a5d:6088:0:b0:20a:e81e:c76a with SMTP id w8-20020a5d6088000000b0020ae81ec76amr840209wrt.182.1651270263144;
        Fri, 29 Apr 2022 15:11:03 -0700 (PDT)
Received: from localhost.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id q7-20020a1cf307000000b003942a244ebfsm291985wmq.4.2022.04.29.15.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 15:11:02 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     caleb.connolly@linaro.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Jami Kettunen <jami.kettunen@somainline.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH v14 07/10] arm64: dts: qcom: sdm845-oneplus: enable rradc
Date:   Fri, 29 Apr 2022 23:09:02 +0100
Message-Id: <20220429220904.137297-8-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220429220904.137297-1-caleb.connolly@linaro.org>
References: <20220429220904.137297-1-caleb.connolly@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the RRADC for the OnePlus 6.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 07b729f9fec5..9c91ddc766af 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -461,6 +461,10 @@ pinconf {
 	};
 };
 
+&pmi8998_rradc {
+	status = "okay";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
-- 
2.36.0

