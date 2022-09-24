Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 442675E8A5C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 11:01:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233537AbiIXJBR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 05:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233586AbiIXJBN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 05:01:13 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB49C82D17
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:01:12 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id l12so2376503ljg.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=FKcY1W2Ufu4JQ+EqVO+YLggZ5mqT/tMoi3A2zFkedZs=;
        b=yZJaMhxaPJo4r627Rn6s4nMcD41MKDee1L3BsWTtncHRxn5ZTZr3BM4LUpeGvuRXHF
         c7jbIbhScCYQ/IyeQQIi555e3/zxLJfMeIYphevQc+hrSnQt8ucehLHvAQMnkW6Cit/f
         BCq3i8dycNUgkD1EfLGVZmEpXsnXQOzvfZxthl8kYSMnFOZJHEzVvg9GRKwo1/prA0Z7
         boqHCIhn+9T4nid6lOMl7guDE5y9P8/DDK/W8+RYyZWU5fWrD/qQdvrtumhrnHDtugr8
         6Mm1JHYTfRTLluzCxOIvXYuRmHi8trU3dVHjjwUZMIIOqkiIMAeKPK6/lms23nipfs+G
         sMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=FKcY1W2Ufu4JQ+EqVO+YLggZ5mqT/tMoi3A2zFkedZs=;
        b=n2eiZGf0fo1w0U89XM5INqizmQw746ncYKWnuFSkqq7vppkvzv2nVw83WL/uJwtg2p
         M9l/c35KUKEcF1qnFttWA61CYfJv7EHvcel9YQA7hZ5cgolkIl5uHDQNhxn/weef3yNd
         m0ffvkZqlBZt1EHz1rAjAxSYCtUOT1QFX0SVbLtH1n3npdq5ZVzc0XIk/wzd+PWn1kki
         fpQ0TVrkX3t8duqt195s5jpHQDyhdcuGH1bI/SRf89XtkT+kqkXDqYR+xeAuIjaYs1/8
         IqZlOfS2OrTjXFqaLFr6iW1dzNkhQEWvJuKzmEAEwfjpR9oOX1VeLt8qtE8JX8DAfnKo
         QMpg==
X-Gm-Message-State: ACrzQf1FroWdrBLeOwK/NaVdrtMIJGYcqe5fQFnFKuhAy1/YnAwQOBSz
        T5rnyXAkDC8oOJIplvRh4+W4xA==
X-Google-Smtp-Source: AMsMyM7AxAAPiM/Ww6ae46+DM5Wk7Im+j6bfpj+Qj3AphHulNwU6t4DL2hz90rvjxRvxcugR7lgPjg==
X-Received: by 2002:a2e:b8c9:0:b0:26c:27c7:cb69 with SMTP id s9-20020a2eb8c9000000b0026c27c7cb69mr4178869ljp.37.1664010071077;
        Sat, 24 Sep 2022 02:01:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o4-20020a198c04000000b0049f54a976efsm1830024lfd.29.2022.09.24.02.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 02:01:10 -0700 (PDT)
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
Subject: [PATCH 2/9] ARM: dts: qcom-msm8974: change DSI PHY node name to generic one
Date:   Sat, 24 Sep 2022 12:01:01 +0300
Message-Id: <20220924090108.166934-3-dmitry.baryshkov@linaro.org>
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
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 8baca2a77717..d3a7de42f693 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1592,7 +1592,7 @@ dsi0_out: endpoint {
 				};
 			};
 
-			dsi0_phy: dsi-phy@fd922a00 {
+			dsi0_phy: phy@fd922a00 {
 				compatible = "qcom,dsi-phy-28nm-hpm";
 				reg = <0xfd922a00 0xd4>,
 				      <0xfd922b00 0x280>,
-- 
2.35.1

