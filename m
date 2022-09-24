Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3E45E8A66
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 11:01:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233664AbiIXJBX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 05:01:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233637AbiIXJBR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 05:01:17 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAC1D814C0
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:01:15 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id d42so3723869lfv.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=j581I6y16QMywUJd42oZyyiZPcAlNY9LHk2IDMp3gZc=;
        b=slZKdNCcjMHPjl8dcAYUaKBJqkK+HCbSBlMRoNW2Ymp7RhVe4254AvD+Qg9YuNhvnN
         ieZR0R9X9SP9YGkUg29J1B/KfoMa92sPDDbBN+4Wd/2ssGQ+uDB/NAwjREHRU/rEqdbc
         Fu2nGMHJCIso2oPmgNlg2BzUEJjcqO7aMKCZwor64Sm0oNlSjkMOs2pvaB3CE06GoelW
         7nZyvSHQ4dg6YNbg6r8MTWgLie7MY8HoniH0n2H9jGvTryKHn3YjPqaFVUBwF7oyJNBD
         F508jjMKtoK91OjjWzCCdqTda8RCip/zVDSGCwD0bGL5JHrTxElmCHRGTdCZVgcGmRPO
         Rh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=j581I6y16QMywUJd42oZyyiZPcAlNY9LHk2IDMp3gZc=;
        b=s30SNvqwfFJA2/V4CJgofgwVGlG+SXuRBr7n8pMIB0kfXLcAxUcqDwRo3ye6N3wTsC
         tH5lfWdMIQxhZzPdLGDeXhDb6ljybZIYu14oUbptmwV1lmrj9u9l0hZlnL+H1DO351HU
         TrR6leIO6pMQHsXrg2PRSqWaoEueceNOv6A1MPQrpyHaRtCmh2GfUq1MPahW7i+8KMaA
         KCTsC86FJlNS61xtRmmJW2JfbLKhZnOSy4NAhtpeAdh4b++PDXdFDoozBFu4SrPvXJMW
         WaCgyoQp8JtaxZHei6iDGqgnK2M3WvTRQnOZqrWPN6tCZnNrKKqjBJshulrEFudelkR0
         o/BQ==
X-Gm-Message-State: ACrzQf27HTWd6bsDtV3y/ZqfNsALL6asSLdVmJDiCITNIeOFmzrvMzmj
        5H1aEiCqVelkrfTf0XcBnISmzCgMFX8T3Q==
X-Google-Smtp-Source: AMsMyM5C2pctjkWXizfCG6OsPX445JfO6ygaicYDxuyS/bluikTiXUG3Gkw2+vDF0QHKQ4A8xa/0Nw==
X-Received: by 2002:a05:6512:3b8d:b0:499:b113:865f with SMTP id g13-20020a0565123b8d00b00499b113865fmr4654473lfv.505.1664010074265;
        Sat, 24 Sep 2022 02:01:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o4-20020a198c04000000b0049f54a976efsm1830024lfd.29.2022.09.24.02.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 02:01:13 -0700 (PDT)
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
Subject: [PATCH 6/9] arm64: dts: qcom: sdm630: change DSI PHY node name to generic one
Date:   Sat, 24 Sep 2022 12:01:05 +0300
Message-Id: <20220924090108.166934-7-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 1bc9091cad2a..dc83329689a1 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1633,7 +1633,7 @@ dsi0_out: endpoint {
 				};
 			};
 
-			dsi0_phy: dsi-phy@c994400 {
+			dsi0_phy: phy@c994400 {
 				compatible = "qcom,dsi-phy-14nm-660";
 				reg = <0x0c994400 0x100>,
 				      <0x0c994500 0x300>,
-- 
2.35.1

