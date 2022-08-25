Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6E305A171B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Aug 2022 18:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243242AbiHYQnr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Aug 2022 12:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243168AbiHYQnO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Aug 2022 12:43:14 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1F38BBA6D
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 09:42:41 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id r15-20020a17090a1bcf00b001fabf42a11cso5663910pjr.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 09:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=1iSoarUuZghqoZ9BO4yPvK2wOsr6euij1iIMl2wEkF0=;
        b=dn9VNFyC2mvOz+uMJuyG2QsZ4uQ6N4cyWaWpG+hO49Ft6/ndiFximzKeHO9zu4fbRz
         ymcUzje6WLdgRFROIJWbgW4Yd6SHWZDIlrnl9z76xFLv/FmImwYLoWxHdWak/dhQZJyL
         ggYcbDzlkl+gP7fcgc9DKYHT+wayT1BUILgxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=1iSoarUuZghqoZ9BO4yPvK2wOsr6euij1iIMl2wEkF0=;
        b=RARxLjPXgbzak2RQBqLcHd3EcZkSIc11w+9+85WqNtOH+Ow42+OXJdNjBA+ETN5Rj5
         UbaH2XZiBkBW6qgsdcN9LS9QSXhTVdue5qGGKz5jrMtjf2/2IBaNpKzap+LvCmayXN2a
         OndWB/P1rIfDbGZp5CyNzjMtK3TenGodDd+hqm7Du+DC4UEUAL09AMKQt2rFT/soZTk1
         H+VVwjbaDx/sFjM1xC3ITr8TW4PfMNFSUa6GapJB40NOUYuFXm+PjbIN50uykWY/Za36
         QHGyiC78m69qEVpvHqhmfIpOw4zTfsJf6FnZ/NxqWJhqlTu9vmuHkvBPYW+rGtonS9th
         djLQ==
X-Gm-Message-State: ACgBeo2/z9Gu98VPP9SbEf0cBU/SEj1OWtkoeeJrcJiCh9QPPh440YAD
        Cmpk9Q0G/FwJSZCnrY0fvWB5XQ==
X-Google-Smtp-Source: AA6agR6gIvPcI+zjJol/aTiQLzWV37Iywk46MfGMUttZNyfnd9mNkax4MDZzVRrO2F1uXUjDuZxTfw==
X-Received: by 2002:a17:902:c40e:b0:172:dee4:882e with SMTP id k14-20020a170902c40e00b00172dee4882emr4472238plk.11.1661445759868;
        Thu, 25 Aug 2022 09:42:39 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:b7f2:d739:e847:6e53])
        by smtp.gmail.com with ESMTPSA id y13-20020a17090a154d00b001f2ef3c7956sm3775799pja.25.2022.08.25.09.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 09:42:39 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andrew Halaney <ahalaney@redhat.com>,
        Mark Brown <broonie@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] arm64: dts: qcom: sm8150-xperia-kumano: Specify which LDO modes are allowed
Date:   Thu, 25 Aug 2022 09:42:03 -0700
Message-Id: <20220825094155.5.I51d60414a42ba9e3008e208d60a04c9ffc425fa7@changeid>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
In-Reply-To: <20220825164205.4060647-1-dianders@chromium.org>
References: <20220825164205.4060647-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This board uses RPMH, specifies "regulator-allow-set-load" for LDOs,
but doesn't specify any modes with "regulator-allowed-modes".

Prior to commit efb0cb50c427 ("regulator: qcom-rpmh: Implement
get_optimum_mode(), not set_load()") the above meant that we were able
to set either LPM or HPM mode. After that commit (and fixes [1]) we'll
be stuck at the initial mode. Discussion of this has resulted in the
decision that the old dts files were wrong and should be fixed to
fully restore old functionality.

Let's re-enable the old functionality by fixing the dts.

[1] https://lore.kernel.org/r/20220824142229.RFT.v2.2.I6f77860e5cd98bf5c67208fa9edda4a08847c304@changeid

Fixes: d0a6ce59ea4e ("arm64: dts: qcom: sm8150: Add support for SONY Xperia 1 / 5 (Kumano platform)")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi b/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
index 014fe3a31548..fb6e5a140c9f 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
@@ -348,6 +348,9 @@ vreg_l6c_2p9: ldo6 {
 			regulator-max-microvolt = <2960000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 			regulator-allow-set-load;
+			regulator-allowed-modes =
+			    <RPMH_REGULATOR_MODE_LPM
+			     RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l7c_3p0: ldo7 {
@@ -367,6 +370,9 @@ vreg_l9c_2p9: ldo9 {
 			regulator-max-microvolt = <2960000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 			regulator-allow-set-load;
+			regulator-allowed-modes =
+			    <RPMH_REGULATOR_MODE_LPM
+			     RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l10c_3p3: ldo10 {
-- 
2.37.2.672.g94769d06f0-goog

