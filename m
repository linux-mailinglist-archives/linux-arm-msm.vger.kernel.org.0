Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 293005A1716
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Aug 2022 18:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243225AbiHYQn5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Aug 2022 12:43:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243178AbiHYQnS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Aug 2022 12:43:18 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57181BC100
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 09:42:43 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id pm13so11950614pjb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 09:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=0DBKrfU7DKgiI1KvvX+nAyw8m6/xO7rbgXWQBFaRlQ0=;
        b=Szgb9TcjMgWUBloz/Bd70+z+Ca4DwaJwdHfO79Q4ccB7TeuASUY6ak87QH11edK4Ar
         ZhDZbV9bFwyl+XMz2l9Thhddo/w3Bg6h/HLOPzZ8JGBeK1RmCoB7HbjSgexqN/rI1uVS
         uBDsyK14RegRz4UTjO/Jd1zv1isEVpQUNOkd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=0DBKrfU7DKgiI1KvvX+nAyw8m6/xO7rbgXWQBFaRlQ0=;
        b=HY8wtnab0ObEIdrhDQvZV4TosfDDtdA6UHXRdS0P8QLcp7Fk4J5YO6qISsLow6XMJO
         G+mqMD1980muNHwR22PcMS8cX7xg162NwNBfeCpI2OdAtIgxMSOImOBb0cU0ok/bQgtf
         OzjX7hQheEJxNVBEbHK4fmR6UAOUqGq61QQ7pFTTe/2MBo90wK8sxQ/M4bXSmHFF5zTM
         Z6oJpySoK9dPMzMn25anxtegcPYuRdkXLpuc4iG0L+nSnJtcy+PJ8u97Kxe9kit9ERkg
         vgnPPDtJUy211WOvnACi+lwS0dNJhbLlb5q6x3cctcMn1pydPJ1xTRXRKVw/vts3+x50
         9fiQ==
X-Gm-Message-State: ACgBeo1A683IYBXOy8ES4IWHp1ZLEX6lwaR2fDGsyfoP2hb/iDK7qIxs
        sClU7M3TQwajcc7Rb03XH2as+A==
X-Google-Smtp-Source: AA6agR48VwQ1Xt0g/fUB0eDVNvZ2JmBrdgqoaBEuMTjDRP86CaSN8IWRrY57abEO3okNsLrgA9tilg==
X-Received: by 2002:a17:90b:3c82:b0:1fb:8ef:5ddb with SMTP id pv2-20020a17090b3c8200b001fb08ef5ddbmr14404195pjb.11.1661445762064;
        Thu, 25 Aug 2022 09:42:42 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:b7f2:d739:e847:6e53])
        by smtp.gmail.com with ESMTPSA id y13-20020a17090a154d00b001f2ef3c7956sm3775799pja.25.2022.08.25.09.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 09:42:41 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andrew Halaney <ahalaney@redhat.com>,
        Mark Brown <broonie@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] arm64: dts: qcom: sm8250-xperia-edo: Specify which LDO modes are allowed
Date:   Thu, 25 Aug 2022 09:42:04 -0700
Message-Id: <20220825094155.6.Ie446d5183d8b1e9ec4e32228ca300e604e3315eb@changeid>
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

Fixes: 69cdb97ef652 ("arm64: dts: qcom: sm8250: Add support for SONY Xperia 1 II / 5 II (Edo platform)")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
index 549e0a2aa9fe..5428aab3058d 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
@@ -317,6 +317,9 @@ vreg_l6c_2p9: ldo6 {
 			regulator-max-microvolt = <2960000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 			regulator-allow-set-load;
+			regulator-allowed-modes =
+			    <RPMH_REGULATOR_MODE_LPM
+			     RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l7c_2p85: ldo7 {
@@ -339,6 +342,9 @@ vreg_l9c_2p9: ldo9 {
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

