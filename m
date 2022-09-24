Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72D075E8A6D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 11:01:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233645AbiIXJBY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 05:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233651AbiIXJBT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 05:01:19 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A21D280F66
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:01:18 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id j16so3667533lfg.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=IaDfU+x0iC4kL+CdCv83HsmEDgx86x9FOtM6hlVBCT8=;
        b=AiSA8IyJNysHCHCkQDMKGftRLp4tHcyimA83W/ywmDGTR+fjqztN7F4uwvWYa8qwF9
         FZjhTkdoQkGal+vfFV4V0RRaEkYrU0byugnZNvqiInO9cIjLeB/kO8f7QcCBUbZA5W4x
         VerAif7EbKyliXcUL8nF+R8mAfg681wLUQXAXPJcdbLJaPNzWhokn9MnxFkUd+SKQR7a
         OuoSDMaIb0ih56wq91CoWp9vK9riEtByOSLrMOWG2W7Rf7dJmjgOltvBaZy05udD7DqJ
         rL6lFWBq9FdciX0z63vQr3ky1/HVyDIPBv4uA2DMirEhttZC7zIT/9ZipESsUqyzwhIM
         uBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=IaDfU+x0iC4kL+CdCv83HsmEDgx86x9FOtM6hlVBCT8=;
        b=kC2yCwUUO8SgyAfYSRXW6LqYSMnu/XEpxxGxbxSsTASOvbMooEOsHY9/w0EpDfkVzS
         4pNY89PGPr7GYuQYKOOhlUncL+lQ6cwBhxxauHtfr0SqjNPk3mWJsA3atZNbIwba3IRz
         VcJw82ZP8tBd6Xqfsd9h1hzhymButMlTzAOMrNv2jJodwYu5q+yNwYPLJ7rcNZlIfKoY
         YmVtUQBgiRpB3mc6pPkYG4/2gNSUT1bbtP4uC1xvJBZ0u7Yg5Qt16IPky6GsP321ihcq
         OFNIcy50y47nNKO5EUd5uPnwGESiH7h8hjKhpIAxulwISLLXLyiRNaJOyog2GUxM52IZ
         78Rg==
X-Gm-Message-State: ACrzQf3AGQngk9UxpsB4w7PLEOJK+fAaHKKKTiifUVaqB90VpyjpP6es
        o3DyY4zQhD59a5ch34QaunAu8Q==
X-Google-Smtp-Source: AMsMyM7IMH8w7DvH2apzALsP2PVzcbjXMWiAMeWoc2qxzWkt697ecLVwzRl/Dro+1D8y9tqK8zA9tw==
X-Received: by 2002:a05:6512:3502:b0:496:272:6258 with SMTP id h2-20020a056512350200b0049602726258mr4540887lfs.429.1664010076737;
        Sat, 24 Sep 2022 02:01:16 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o4-20020a198c04000000b0049f54a976efsm1830024lfd.29.2022.09.24.02.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 02:01:16 -0700 (PDT)
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
Subject: [PATCH 9/9] arm64: dts: qcom: sm8250: change DSI PHY node name to generic one
Date:   Sat, 24 Sep 2022 12:01:08 +0300
Message-Id: <20220924090108.166934-10-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 5843e46a3164..e3ea39fcec13 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3592,7 +3592,7 @@ opp-358000000 {
 				};
 			};
 
-			dsi0_phy: dsi-phy@ae94400 {
+			dsi0_phy: phy@ae94400 {
 				compatible = "qcom,dsi-phy-7nm";
 				reg = <0 0x0ae94400 0 0x200>,
 				      <0 0x0ae94600 0 0x280>,
@@ -3665,7 +3665,7 @@ dsi1_out: endpoint {
 				};
 			};
 
-			dsi1_phy: dsi-phy@ae96400 {
+			dsi1_phy: phy@ae96400 {
 				compatible = "qcom,dsi-phy-7nm";
 				reg = <0 0x0ae96400 0 0x200>,
 				      <0 0x0ae96600 0 0x280>,
-- 
2.35.1

