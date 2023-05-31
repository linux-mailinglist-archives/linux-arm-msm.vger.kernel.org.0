Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64E727172ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 03:16:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233991AbjEaBQe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 21:16:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231545AbjEaBQb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 21:16:31 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92FB2C9
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 18:16:30 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f4f8b94c06so4037339e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 18:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685495790; x=1688087790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMjfTjBGLXw7IVGJ+nf3D2GY7OrsoBlL/iS2L0XV7Gg=;
        b=L2y9SosxlrvjTJV08OVlHfoKIFH8OYw/2e1GHpt/X4EnbV7B2efpHW6QmmDcxwaTkJ
         fpAYDGJqQf8cR8nwAKabkw8ViN7KGUuVYTMuvTicYdQLU10sGinB5Ir3jyco7dzSudKn
         oS4jpfIOCPvra6GLJzvZyF4hiu65ZtHoViTK3fSmyuIgca7OzHaJXzHqxkdw0Qr9kZz6
         tgv20+oQuibZRUp6R9Pk6s397oqZX22aodbAMJn1+ITd3Z3leM57nczySsZ7plImg/c7
         pa8XA4zhDRh2gZnymXGM5joOdAtCgJjUpk3OkMnNlCBCbE2ve8u5aoHZEPXn28uxd62E
         by4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685495790; x=1688087790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TMjfTjBGLXw7IVGJ+nf3D2GY7OrsoBlL/iS2L0XV7Gg=;
        b=imHh1s7h73It1YiF/lpzauUSkWOEFKLla2rzWOfeXIVxEJc4f2Nitslf6y8+VWve4V
         Nkg/LYbbb3nXwmXzYPwXONmArpJl50gN3FkRoGKJ25bShwNX4Uy9ZIqO+mKcvMzK1UoI
         UADltGRJoEmtAowRRDSVuB3oX4hEWerm9NzQLtXbOl0i2J9YvAnzFkYpXtzuH8hYS8dm
         LLidGV5cSoCQjP+uvvc8vyj5Tef/Mzfg+kk53n3EeyYAnXjfk59oLY3Sgm5tR2GqOU6o
         xAU4x+LGscQbjKN9jRXc3cnI+XNWi2TcGM/ICR1HdAFFqx3jQlf3wHVlLvuADCyyxKnG
         7V2g==
X-Gm-Message-State: AC+VfDzhG5c15SauTdHKB12Fb/+2k8OwqJCkgLCIb3G/AWKP802i69T6
        6jbXrfnzQWUtlUA/KnULH2Fa+hLa4cInlgX4LVQ=
X-Google-Smtp-Source: ACHHUZ55BaJYIc4njdOwvXBII52zDTIe044DyjKXnOIF1/7xd4yIAgtkCGycTitBWBg75Wafnfw5aw==
X-Received: by 2002:a19:5502:0:b0:4f3:8c0d:41c3 with SMTP id n2-20020a195502000000b004f38c0d41c3mr1765898lfe.6.1685495790172;
        Tue, 30 May 2023 18:16:30 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id v24-20020ac25618000000b004f3787d8006sm505640lfd.128.2023.05.30.18.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 18:16:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 03/14] arm64: dts: qcom: sm8450-hdk: remove useless enablement of mdss_mdp
Date:   Wed, 31 May 2023 04:16:12 +0300
Message-Id: <20230531011623.3808538-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531011623.3808538-1-dmitry.baryshkov@linaro.org>
References: <20230531011623.3808538-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The MDP/DPU device is not disabled by default, so there is not point in
enabling it in the board DTS file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index d5aeb7319776..bc4c125d1832 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -568,10 +568,6 @@ mdss_dp0_out: endpoint {
 	};
 };
 
-&mdss_mdp {
-	status = "okay";
-};
-
 &pcie0 {
 	status = "okay";
 	max-link-speed = <2>;
-- 
2.39.2

