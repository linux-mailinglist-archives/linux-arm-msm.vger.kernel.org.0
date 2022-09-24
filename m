Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8633B5E8A5F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 11:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233559AbiIXJBT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 05:01:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233600AbiIXJBO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 05:01:14 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7167A2316C
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:01:13 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id z25so3665191lfr.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=nt3ly742saM+ooy2Ge0k9OPYJi77YIE+XtYlPKoVPVg=;
        b=Nf17Hv9/3d1w81jq7zPO0FWbmZK4GzEhX7dmqdc5/r5cPKDzZkfsS5Bi0YM4AshXT1
         BLWEukG1bWL1CsoLv/EB9jFsDVtxnOlDDbeWc4wIIOJt3v6fvl9tRavquHJcoxfueOAq
         2L0titf2fN71Cs/uxQRM0ppqmeSTAflhrRFVSR2Lw6U/UAkaOurPMJHqA580SieKzY2N
         jP2q6Yso/tpd2d8VA/8NhWIpRMF9/Dgb2upzsFU52hwU86GQooX3FJhyK59rm6183jbB
         JuFYVeaJg1Ydf4wY46rqh6nr1elp/kS/3f5BFnKdkuZYumfSvglVnZIq7GZDQ7GsyK8G
         Gn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=nt3ly742saM+ooy2Ge0k9OPYJi77YIE+XtYlPKoVPVg=;
        b=Wmdbm5eG/x7g+b2KhZytDQI1aI/UeQkVr5j9+wzjmRgVuPlWtBxZQRpgC6ly9MaxyC
         3bfxMvfwSGSZjOJ1Kd1K78zB9KyV48VVSqS41g65whV1pC7iIms78yabiTIn9AjB0I0/
         0mQSTL/+4Fzxvy43g+aZqC1fLo524Nq2bVubVLixQrwz2hozzc7ba5kZba9me5pBDSWd
         VowbkdV41XYy4fzbuUElq1kPgLtp8pbc/GRt+glsLjiDEHOAMfLkNGPC1XWdzwqz+X/m
         JX2ivj/Y7SXTE5+wqhf5J/kUAvR5sMBPN7BmCnu5OscDvS1lsHRImbyDtTToWhnHUcxt
         4ezQ==
X-Gm-Message-State: ACrzQf0cR8KBoCuDMsrHXOtA1aLbd+JDMiNS6ynsp8HhOGT92GuRsJxa
        JYl7+8Wfp7W40eAjXYUEOl5SPw==
X-Google-Smtp-Source: AMsMyM60FADsIDDOHN8292FlkwEBPZbf0+dMJXtC4n9IjeEQDpyhczoExn9djzd1uQHEZs5rBDi0AA==
X-Received: by 2002:a05:6512:12c7:b0:49b:755d:fde5 with SMTP id p7-20020a05651212c700b0049b755dfde5mr4578773lfg.182.1664010071796;
        Sat, 24 Sep 2022 02:01:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o4-20020a198c04000000b0049f54a976efsm1830024lfd.29.2022.09.24.02.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 02:01:11 -0700 (PDT)
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
Subject: [PATCH 3/9] arm64: dts: qcom: msm8916: change DSI PHY node name to generic one
Date:   Sat, 24 Sep 2022 12:01:02 +0300
Message-Id: <20220924090108.166934-4-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 48bc2e09128d..9e0a5cb469c8 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1056,7 +1056,7 @@ dsi0_out: endpoint {
 				};
 			};
 
-			dsi_phy0: dsi-phy@1a98300 {
+			dsi_phy0: phy@1a98300 {
 				compatible = "qcom,dsi-phy-28nm-lp";
 				reg = <0x01a98300 0xd4>,
 				      <0x01a98500 0x280>,
-- 
2.35.1

