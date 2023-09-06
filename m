Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18E57793A43
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 12:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238070AbjIFKsH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 06:48:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237657AbjIFKsF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 06:48:05 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BA17173F
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 03:47:52 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-52713d2c606so5016940a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 03:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693997271; x=1694602071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QgR/jPB/GUGc6I43GU0pzk5t42vb7u4l9vCLqw6lfZw=;
        b=p1OnmeuA6s8zkktOzo3RbhmbbPHauM45ZfLPNA7LKL+EydlPOW8i3Ruw5G+A85cGck
         xGD2acngUd7VCstG5Iz/a+niiB/DYa73ZKmkcfHVZkfjl8g7ip3YFcvDYtIgRe9zKism
         eZvY4HfPY+FCM5yrz34JQovcf0RsKbnHviGWUSy6t8dZbixth9c14HrUaxOdBhAksne1
         caVxzyD25PguSOKff4Lbhsz9r31aBAS6U85fcIu4TerHSjLX+FigTTTufhWKEcqSzEuX
         7ic85MkL10zYB0zZUiW+2Aai6Ju/imdFthwERhQ8IN4kpsMW2IgX4LgZeTadgea9eUrD
         O0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693997271; x=1694602071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QgR/jPB/GUGc6I43GU0pzk5t42vb7u4l9vCLqw6lfZw=;
        b=kkaCsTrHdv5SGVmtOL7oBxChjHzSkGas01Cig3vzfMFCXcTW8trion+qLkgmjGN3QS
         wEomtMpMYGN+MkHU/jINO0qAfI3NO4hE4/B+EmNvZ9S/uyK/2l95Py4EK5GV5CHau9uC
         6TsA6bg8Re/qnsWYKiNXTRgwe6z74UBu4eOM2gqGfwXbkV8ElcXTCM+oZh+FSE5pGQVa
         IjyPVyZpWQuX6EqoWIdIjnYjwZuNr3avIIYnBv8X1KHW0ZzTlLl97O1rJ1+BBCP2IdRP
         NOz7wTAWVmws5ymn0CHjOiRddB8muIieTnE0fYH9oFoV+dMK+4X8mVxEwXrUvosW6+MP
         RhzA==
X-Gm-Message-State: AOJu0Yw27W/fktwTuHaPKSEtwSbnwlfNC/fFoC0ki2aPChtEmUky6+Pt
        BdMRVIlWnGnbTljhdYXIbzs5QA==
X-Google-Smtp-Source: AGHT+IFDWTldFH2gbJsnpXbHmeRWZG8NVl45/DMIdtHbXHmP9iJY9kYZCyFSIuVwp/HS/TFsThIsdA==
X-Received: by 2002:a17:907:75cd:b0:9a1:df30:e150 with SMTP id jl13-20020a17090775cd00b009a1df30e150mr1776935ejc.68.1693997270544;
        Wed, 06 Sep 2023 03:47:50 -0700 (PDT)
Received: from krzk-bin.. (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id e7-20020a170906248700b0099cc15f09a0sm8791163ejb.55.2023.09.06.03.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 03:47:50 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/6] arm64: dts: qcom: sm8450-qrd: add UFS host controller supply
Date:   Wed,  6 Sep 2023 12:47:42 +0200
Message-Id: <20230906104744.163479-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230906104744.163479-1-krzysztof.kozlowski@linaro.org>
References: <20230906104744.163479-1-krzysztof.kozlowski@linaro.org>
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

According to schematics the L9B regulator supplies VCCQ (already in DTS)
and the UFS controller pads (VDD_PX10, missing vdd-hba).  Add the
missing supply for full hardware description, even though it should not
have functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
index 37479327707f..c7d05945aa51 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
@@ -443,6 +443,7 @@ &ufs_mem_hc {
 	vcc-max-microamp = <1100000>;
 	vccq-supply = <&vreg_l9b_1p2>;
 	vccq-max-microamp = <1200000>;
+	vdd-hba-supply = <&vreg_l9b_1p2>;
 };
 
 &ufs_mem_phy {
-- 
2.34.1

