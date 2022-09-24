Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65A635E8A6A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 11:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233644AbiIXJBY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 05:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233646AbiIXJBS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 05:01:18 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0C0A87692
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:01:16 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id d42so3723902lfv.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=RKaMREXXqOL68I6N+y+TYA76CR+nfO5iIXlaX8/B/Dw=;
        b=igZmIfL79mdW17lR/C2YwLncV6t1ku0tWIMrp6HpBnlWkFtctSv6j/GWxaZaTkxHGd
         p2tMg4Sc1dKi0DmBdWY150BS31Hssr6vdxid8CbQ0hZSS3jBWPBsm/FHDDfYp7wJWMZ4
         /m/WwNwjEnPm4ncjCRFH6F4KKOS5DeH+h0o4dH3GjJ6bKPyZVlQHHV0TkrMQGV3H2rkn
         PkiaEP+sQUeWQr+Rxheebd/M3GczQJ0rW81qKVyCtYzug23kyL0Qn1f/y2YS42NvKh1F
         ssNxM6vfxbqIZBBREDkHSOLPqer0JFlCqA2bSi02q9evUFNpYRTsla4wcmXc1X2IEdQ8
         N6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=RKaMREXXqOL68I6N+y+TYA76CR+nfO5iIXlaX8/B/Dw=;
        b=X0k+QDtbfuRN0i1rLIWldiNru4NEy87S5w/BpDoEVTYXhjX7jmEv51IeDYq6B+aDx1
         V9P3PuhCNxvgYWA2sJn5auKGg/DVY45Bp3YqdveIHr+ysQvS7cWz21n0ZLvUz7RK2Jb5
         HzTawOehm3xGIaJe4tSwoKFnLiYcTWKHOhjaidkbE6O9Jp7fLEAN+G76HCDTUCAqHZfD
         dsO9gKOzYtWo0gtyjIb0mi+b5wmdclIVeVrTXT4p7QvabuYt8ZzvXGjvMADckgvTJP2/
         Mi6+LSnW7mMpFY7YjA7YuPJcd7aR/XmSEgOhC9ggotkGg18ej1MVg1jcsiyV1oUaMj9g
         8xHQ==
X-Gm-Message-State: ACrzQf2TbO9YER7cj/ibI65cPCDgy1oMiPjLkkwrw1SNclo5ntgKqbzj
        Y1ftxJkRyxW6mHa4Xtq4xkyORw==
X-Google-Smtp-Source: AMsMyM7queyoTFKENmEVrltMwdGmqrLcCMvduATdgv82zehPA2UC5zICXV4KkNJOsYg1/A1lep9W4A==
X-Received: by 2002:ac2:5cb9:0:b0:498:eb6f:740d with SMTP id e25-20020ac25cb9000000b00498eb6f740dmr4631460lfq.106.1664010075079;
        Sat, 24 Sep 2022 02:01:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o4-20020a198c04000000b0049f54a976efsm1830024lfd.29.2022.09.24.02.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 02:01:14 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 7/9] arm64: dts: qcom: sdm660: change DSI PHY node name to generic one
Date:   Sat, 24 Sep 2022 12:01:06 +0300
Message-Id: <20220924090108.166934-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
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

Change DSI PHY node names from custom 'dsi-phy' to the generic 'phy'.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index 43220af1b685..d102c7e25b79 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -213,7 +213,7 @@ dsi1_out: endpoint {
 		};
 	};
 
-	dsi1_phy: dsi-phy@c996400 {
+	dsi1_phy: phy@c996400 {
 		compatible = "qcom,dsi-phy-14nm-660";
 		reg = <0x0c996400 0x100>,
 				<0x0c996500 0x300>,
-- 
2.35.1

