Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12A3E7172EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 03:16:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233942AbjEaBQf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 21:16:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233779AbjEaBQd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 21:16:33 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD73CF3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 18:16:30 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f3b9c88af8so6122425e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 18:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685495789; x=1688087789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMZeiPIi7TP7gXho3St6dgJ9AasXrJTL2jtP8YLAFi0=;
        b=iJES3Hzzswvmk70tOV0eW4Fc+P3sx1muEyTLXZc06JlECYGjtynQoDvtOKbikmotV/
         nO+NbhRgkTn3Tpod3kP8JfWxkCFvhpduXtSFVuwq+8HC3IAKuI5Ssj+IQGlDa9gzznqf
         jefY8EkqDE4rmVBnAPpUAEx984rAd+r7UlQ6hb96Fe3cWBC7bA6UJp1VUNKvkyY+6eMo
         f4yxGIZTj5f6yxB7jr1RKayQgL1evZv/fZsoh+2gB8y705u98bPa9wbt+SEuHhpXy0UZ
         uYQn7KvfPnY4rh2UiJ99ugCfU89/NZQTspL6fe/OgKLy902w/EMLPsiMopiPaWVkCfep
         cv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685495789; x=1688087789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMZeiPIi7TP7gXho3St6dgJ9AasXrJTL2jtP8YLAFi0=;
        b=Ei88hjp++Puzh1hrScCl0YOP9T+zErtvLVMQIefRS9u6CkaRVYVdz5vrOacuZPm3Q8
         6z6lKB0BNjNQKIRqMFAE8S4BH3hm/nfMZqkh/Y6Gp4/+1wlige16ykYyW6FlwnVLzppW
         rq9ixf6YDmrBysjxaP3HQmFiZyJsnjGCQAV9PoqrhqFH24FGfd1r9L4dUhDeUhT6X28O
         M02lL6QIxPjD9dgNnF2I2wE5BtUPI7xL5vFQ2/MOrH7ZDFp+6/s6JWTcDAxWbLnKtOuj
         ENJ1q+/VPpyAFonmU7SubHPFKjppGKS07kSRveVBP61TTdvIMPtPYIn2wfYRcmehRbrO
         I3OQ==
X-Gm-Message-State: AC+VfDyPVxQPzViRDu2fKoXvLZ0Ly6ubPz22V+tD/5Kyfzhmumxx49T6
        QUSM0B0tW2JCv4QcAXF2PSuogg==
X-Google-Smtp-Source: ACHHUZ44SFqHBtOb4DQtt+L0gX+v2ZLGih7vIXIy0lsFJCCVeHyJoe4PDY/ARDZGUg4dr9Oipl+AxQ==
X-Received: by 2002:a05:6512:64:b0:4f4:cb4c:36e5 with SMTP id i4-20020a056512006400b004f4cb4c36e5mr1635744lfo.29.1685495787676;
        Tue, 30 May 2023 18:16:27 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id v24-20020ac25618000000b004f3787d8006sm505640lfd.128.2023.05.30.18.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 18:16:26 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 02/14] arm64: dts: qcom: sm8350-hdk: remove useless enablement of mdss_mdp
Date:   Wed, 31 May 2023 04:16:11 +0300
Message-Id: <20230531011623.3808538-3-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index d3788bd72ac3..61dd9663fabe 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -424,10 +424,6 @@ mdss_dp0_out: endpoint {
 	};
 };
 
-&mdss_mdp {
-	status = "okay";
-};
-
 &mpss {
 	status = "okay";
 	firmware-name = "qcom/sm8350/modem.mbn";
-- 
2.39.2

