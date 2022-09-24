Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FEC95E8A69
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 11:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233635AbiIXJBX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 05:01:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233642AbiIXJBS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 05:01:18 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3AD1870B5
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:01:16 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id b24so2391169ljk.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=OnDsANKSvA70i+JsQIe4TNZbXQvnl7esF1EhWeKPkA8=;
        b=R712gjXK3EYz4All+iX6C7YPUwMeIKjscHrlnkzhc6w9QXpTqyWIk8jFo0kVuI0Prz
         zR2VIQEnyiogeXSNVb+vm06qTY/mVvRxXXmKMJWE0CgFxoq0W3VLmUe76D9tZW2750st
         auTULiJ/iY3/FSFTQE7dx/hqSIDlfOhjUDEFguNPe3we1t8CLl9HAv4VrFOfRsdqvL+l
         Cu/4BWE+TbvnHTJDbb+PdRgPY69Olpktr43nFrVVjPYU70tD2bTW2xuxZ4RmUqrFBqa7
         SVn4YFMYmN2Aaa3k7PGFJLmp2i1NHJkDl1+Jjxty8ihbNeN36RyfklZyEY8JB08YGPfK
         wYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=OnDsANKSvA70i+JsQIe4TNZbXQvnl7esF1EhWeKPkA8=;
        b=pjA6xeXKaZGVLgaR+svHlY9HTd1RNNzFKTGoBXrLHN/3te8l3ScekX0RNsO0osa4We
         c+9+YDfUXnuyjpAiHIOdwaKNVi4pCjxBSTLiwU4olbe2dvtOimk2pdUrLuvrFi0x86X8
         DI9tk+csBjNVGAXw+qj1OQpMM7r68G6tFNBRXO5/OEHGxb7Th4FTQ/2PcGkIBb6J/kmR
         b0vf4frifeyJpnlUT56TYtRtc8s4aGs2OhuGm030ArFarvQbjkEa/9xiku4n2Qw9bivU
         qbpG7uijkAqo5bfy2EoZLZePqCbGBZ1wRzNmUfSDT6Kt+WjYo7OREgEVclWWC47FSc5H
         cqZA==
X-Gm-Message-State: ACrzQf3xIE8Xy/6buEIS4bZLuNG3LdRNsRX9MfIwmoCYJXpL8GpPhdTT
        swtmQhf+DyOOlTdx6v6CZrUQkQ==
X-Google-Smtp-Source: AMsMyM75fwOz2p6pVgvnnexlXeIj4rYayWRp/1bI/Abr+vqH39iYqBxTF2pqVKwlmjn8WS76IBmH5g==
X-Received: by 2002:a2e:9954:0:b0:26c:5555:b121 with SMTP id r20-20020a2e9954000000b0026c5555b121mr4252741ljj.280.1664010075865;
        Sat, 24 Sep 2022 02:01:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o4-20020a198c04000000b0049f54a976efsm1830024lfd.29.2022.09.24.02.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 02:01:15 -0700 (PDT)
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
Subject: [PATCH 8/9] arm64: dts: qcom: sdm845: change DSI PHY node name to generic one
Date:   Sat, 24 Sep 2022 12:01:07 +0300
Message-Id: <20220924090108.166934-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
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

Change DSI PHY node names from custom 'dsi-phy' to the generic 'phy'.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index f0e286715d1b..df6427ba2284 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4537,7 +4537,7 @@ dsi0_out: endpoint {
 				};
 			};
 
-			dsi0_phy: dsi-phy@ae94400 {
+			dsi0_phy: phy@ae94400 {
 				compatible = "qcom,dsi-phy-10nm";
 				reg = <0 0x0ae94400 0 0x200>,
 				      <0 0x0ae94600 0 0x280>,
@@ -4609,7 +4609,7 @@ dsi1_out: endpoint {
 				};
 			};
 
-			dsi1_phy: dsi-phy@ae96400 {
+			dsi1_phy: phy@ae96400 {
 				compatible = "qcom,dsi-phy-10nm";
 				reg = <0 0x0ae96400 0 0x200>,
 				      <0 0x0ae96600 0 0x280>,
-- 
2.35.1

