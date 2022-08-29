Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9CF35A5230
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Aug 2022 18:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbiH2Quv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Aug 2022 12:50:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbiH2Quo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Aug 2022 12:50:44 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17914726A3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Aug 2022 09:50:24 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id v5so2350810plo.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Aug 2022 09:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=nhn/w5h2jny0OsR9Iya6bJX/FfXt3qTgdH67oe8iCrw=;
        b=Xe1e4Nq/i7gkbY3ptMSC/LQQ9HFvyzIIhZ0blm+9Dy5QvOULptYN2Bx5jQRfGGudbK
         5jtt/GZy1OMN3NnY6PEQiMS2DBMOX3xv908rYMbgS/+QJD2gpizWJDeLN6ChkjxhPBNe
         e7J0NDRd7U96dHg8vsXWZgsLhsWF/m4lgHyfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=nhn/w5h2jny0OsR9Iya6bJX/FfXt3qTgdH67oe8iCrw=;
        b=mIZy35Il9fJCIdRsRcwlZUyfgWyjEtrk3yKXOgz+ibuGn4XmlcGsedo4QVp4xy8hKK
         YgHlIQsdRp/0dUwkWN7Mr+tpRniTuLL2ztddKA3lFd2O5GaRUCgi1SfOcozJkQSFHIN2
         q3MqkJcQBuG/q+qzNXtMPKWjm76FaT5WHiG411qUwLYXZm7g8bcjRkNzfYsu4nlQtS66
         PpwQcDX4u+1Jg46jEKtLm6eZ+aXd04f6zF1wtHDP06dok9mdhBFC/FOZmU9WiqJZ35Z7
         FLSPeTiTtI93xCFy78el7uf3QYQAuIumM+z75E8ZkaEOYf8ckht9RZMAaGcTsETQQs+Y
         h8Bw==
X-Gm-Message-State: ACgBeo3ncn4djjOx3vYBgxSjGLHI10m2eBkwy5DS1HErtto5I6QSrs/W
        w+Z5X8XFTHqkjD7/PLmFnAdr7Q==
X-Google-Smtp-Source: AA6agR69yrznAbc4gS1Ofi8dCrVzKMw/LDZ6plYxItqYU0dO2S2KPp/NgysrQjGpbzqjpYnTt7kkpQ==
X-Received: by 2002:a17:90a:cf01:b0:1fd:5bed:bf55 with SMTP id h1-20020a17090acf0100b001fd5bedbf55mr18532160pju.14.1661791823525;
        Mon, 29 Aug 2022 09:50:23 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:3a97:5017:7e33:8964])
        by smtp.gmail.com with ESMTPSA id l1-20020a170902f68100b001729db603bcsm7864238plg.126.2022.08.29.09.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 09:50:23 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Andrew Halaney <ahalaney@redhat.com>,
        Mark Brown <broonie@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] arm64: dts: qcom: sm8250-xperia-edo: Specify which LDO modes are allowed
Date:   Mon, 29 Aug 2022 09:49:51 -0700
Message-Id: <20220829094903.v2.5.Ie446d5183d8b1e9ec4e32228ca300e604e3315eb@changeid>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
In-Reply-To: <20220829164952.2672848-1-dianders@chromium.org>
References: <20220829164952.2672848-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---

(no changes since v1)

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

