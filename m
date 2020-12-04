Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55E4F2CF44A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Dec 2020 19:51:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbgLDSuC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Dec 2020 13:50:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbgLDSuC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Dec 2020 13:50:02 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF5ABC0613D1
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Dec 2020 10:49:21 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id b10so4364300pfo.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Dec 2020 10:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PFSkNt2eB1bxjiX+lVwIkceKuD94RAbAtiC1aV0R4/E=;
        b=NbN5Nr0R9z4L4DaGBh/C6fh4uIZs6jhT2Gcmo370DyKomn9ZeIGuB12k7a7zj5bVqB
         jWf+fG5wJI+XePaedt/tm+uTecVQxbg+IXrSnvM4WxXRx1vuswdTvaF0VDhwd5LXG6hQ
         X1kDqj9ZA88ButBXcOXIJMWiVSZ7Rrc+ZjdAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PFSkNt2eB1bxjiX+lVwIkceKuD94RAbAtiC1aV0R4/E=;
        b=cgfWqhmDSy2+EAZeyKnBWA9EXDyEf6emi/y9+BwYU4wD5Vk+siiqAN8CRSr4n8k9xm
         Bga6F8qyeGeVyvPa+5Z4lLKFe0KsAB43fD74PLAWSMViQAM2pUv+PqoaxHVAd2uV7iXS
         wZVenl01UvXB95nsqrddWQRR5PRbpMVn1SdjSZqMpuAJmxC2AGTQnO4bEZ1E+dad3VlE
         tgSnrbs5WuIONzgQRUwNhNzZVuJi/qz/1l7mKobipnEUBHc6zTKN02GL9XSf/tTw6gPq
         rlCgzydBbvNOEjZNXXSfyQZJFqZUBjBL8Q3IS5qqtQdy7VSj2svs2cpBgwadPGSnkB2L
         svuA==
X-Gm-Message-State: AOAM53070vbMtc+4E+aff/tv12hw4o9yUQtYf83+5013RtXWh/GEYqgF
        5HAgK096fOkP+Xq/oeS4GLQJ+A==
X-Google-Smtp-Source: ABdhPJxrT1HN8fz82haC77Xmupj7N5ivcmnhAf4h7MkM5VWdDgmgcwWaqB2y/krVv7VMwgeK/cS9Xg==
X-Received: by 2002:a63:4925:: with SMTP id w37mr8736839pga.64.1607107760997;
        Fri, 04 Dec 2020 10:49:20 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id e14sm4338826pgv.64.2020.12.04.10.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 10:49:20 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: Fix SD card vqmmc max voltage on sc7180-trogdor
Date:   Fri,  4 Dec 2020 10:49:02 -0800
Message-Id: <20201204104900.1.I0a4ac2c7f4d405431cf95eb7b7c36800660516ec@changeid>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It never makes sense to set the IO voltage of the SD card (vqmmc) to a
voltage that's higher than the voltage of the card's main power supply
(vmmc).  The card's main voltage is 2.952V on trogdor, so let's set
the max for the IO voltage to the same.

NOTE: On Linux, this is pretty much a no-op currently.  Linux already
makes an effort to match vqmmc with vmmc when running at "3.3" signal
voltage, so both before and after this change we end up running vqmmc
at 2.904V when talking to non-UHS cards.  It still seems cleaner to
make it a little more correct, though.

Also note: as per above, on Linux right now we end up running vqmmc as
2.904V even though vmmc is 2.952V.  This isn't super ideal but
shouldn't really hurt.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 8ed7dd39f6e3..d76200d2b373 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -509,7 +509,7 @@ pp1800_l5c: ldo5 {
 		vddpx_2:
 		ppvar_l6c: ldo6 {
 			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <3304000>;
+			regulator-max-microvolt = <2952000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-- 
2.29.2.576.ga3fc446d84-goog

