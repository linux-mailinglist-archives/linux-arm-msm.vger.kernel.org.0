Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD1B96711AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 04:17:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjARDRZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 22:17:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjARDRY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 22:17:24 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C32F54FCC9
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 19:17:23 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id az20so60983933ejc.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 19:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/H38JSzifnwb7zs7IwlqqhUAxLsg6bbjCNQsPXDmKcE=;
        b=S0/ecNIzhjTqJgJqGM+ySaF6GeNHGO8yws1sSR6cc7Ib9iXESkQKGsW76Dqwh9iCyp
         tRTW7/INysF97pqqsUKJtO5uI0t3P0ZmSyTB71y5X+AqQzPsUXgZrLs8g8a4CipLeJaC
         fsOszYgN+a6MHL0ffagmo3soqCFqy8Tcb7sIDT7JVD/2m0Ex0tnNQmRJIqGx4phmoLbA
         I/s6vSXGkhLcmR6LqbYkbxb5C8wzIfgkU43rprmR2K4N1W/pvuouV4cpq1uzgDPbuwsf
         ThXncM7jshb96QVbTUEf4hacGvPCySHCwmir0uhRXZ4ugy2rXQxoMzXST5IHgF32GsBq
         77yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/H38JSzifnwb7zs7IwlqqhUAxLsg6bbjCNQsPXDmKcE=;
        b=BkmGMvdIQ0c3hpIee5uVW7xcg6EvUJsA3dYjM3rdihU6CzM0uRgD64cQM9OH6TlHpR
         q7oQy1M3XSRfep/dQHpiSjrgtSy/sRTM1uRop3Q6ZYJ2kDkQVT3bz5oWpa1k7zbG0YZ3
         W2ATXywfM5SW0M6/3iZt3cORNhktvLGlSnZMCrvzjT6Dtv5P+vnDY+jU7govNgCmz8Tb
         5v0Rk+Iio4ozFBkS+wsuDRJveYrNdJEkgBWRHe36HZTG8a1Xs7ZS9M7ZhcqU1iOBQ4Fi
         jlkQCntP8UnwTlBquMEOW51F7s5P2xelCXcvdEzJAuP2pZjjzGvq7F/3gtZV4GFC5QzW
         hNvw==
X-Gm-Message-State: AFqh2koF9wB56WU7UwvlNB3HwNGvwtsd3PF1JEl/taJTB2CJpo74phkD
        Wj/zPlR+ZN9zJGlB46RsTO1bUA==
X-Google-Smtp-Source: AMrXdXuy/67RMVL67giu9fCmAhYbyAzLaNrTa0UAmfawO033JlwKiwAoZZcOuajvnq1/pBuotkybbQ==
X-Received: by 2002:a17:907:a092:b0:85a:4230:756c with SMTP id hu18-20020a170907a09200b0085a4230756cmr5522046ejc.59.1674011842388;
        Tue, 17 Jan 2023 19:17:22 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 2-20020a170906210200b00876479361edsm535639ejt.149.2023.01.17.19.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 19:17:22 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 3/4] arm64: dts: qcom: sc8280xp-crd: drop #sound-dai-cells from eDP node
Date:   Wed, 18 Jan 2023 05:17:17 +0200
Message-Id: <20230118031718.1714861-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118031718.1714861-1-dmitry.baryshkov@linaro.org>
References: <20230118031718.1714861-1-dmitry.baryshkov@linaro.org>
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

The eDP device doesn't provide sound DAI. Drop corresponding property
from the eDP node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index 4e92dc28e2ce..a3b9c9d0a94d 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -253,6 +253,7 @@ &mdss0 {
 
 &mdss0_dp3 {
 	compatible = "qcom,sc8280xp-edp";
+	/delete-property/ #sound-dai-cells;
 
 	data-lanes = <0 1 2 3>;
 
-- 
2.39.0

