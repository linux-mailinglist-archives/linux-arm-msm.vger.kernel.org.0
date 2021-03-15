Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 131E333C7DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 21:40:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231966AbhCOUj6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 16:39:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232758AbhCOUjk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 16:39:40 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61AFFC061762
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 13:39:40 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id q12so5424284plr.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 13:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dO0IpY4eNf90HXjdWjmKTVkYdLkZaDxwV02yAEYmvs0=;
        b=EHBh/IIvcyAmVR2clNnd1OoJKlhkoZh/7PoomhbR0cM8OiqY+L1gYfrYT6zIgWHUWb
         x+QejVdG6nDz+PbeNjYg0MtMIms+/ysrG1CQdX4xqSR/TdKFWkpd2TQBWI2FryUmCT6G
         62YYgFf/E+4O3r5M+kIPyEDeojwRw5xNoyD6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dO0IpY4eNf90HXjdWjmKTVkYdLkZaDxwV02yAEYmvs0=;
        b=L594teJ8UXI9M0HhTE3PEMovs4/K6W2u/U2a4Ih4vZab24pDrRmA7eQ3ZygOk7GY44
         a7QXhW7Iwr4BAv+jXwlH8UfMT4PZhAMv048pxxIOUKazXbqhMtCVnrHASeje+5aTi2h+
         h1EBMV938bf4CNkCbE69lPW7khElx861dYrwdZg7FgKR6RUFFIRDRtPTgQrcBkhEF7Xh
         YySF4u+vsbBaW8xtgwb11BnS38jrr/HEMVNHtkSA1XpDAC3SdDfskDocFS2nr3cUIzFQ
         MF9eGC3JaeQ14cJarrTudWyCn1XQx3c1tbv7I4UuncWCNaObAoH38R0thJnJfyPnlMwo
         9Etg==
X-Gm-Message-State: AOAM533GSpB9ogjiGZO0zUlaLLKp30F/3ZJRr/xldjX1tFEdQhNwbW2F
        4iORPnDe+MRUzfGAs1M48RVBHw==
X-Google-Smtp-Source: ABdhPJxMRTNLkPsulbJ8SSe7uQCh5WZJ6jghJu9UWXiC6Pw8T5ormTtJMtnn1YQj+58FQfI78d5vEg==
X-Received: by 2002:a17:903:3053:b029:e6:5cde:bef with SMTP id u19-20020a1709033053b02900e65cde0befmr13068425pla.81.1615840780021;
        Mon, 15 Mar 2021 13:39:40 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:14ce:2d12:6a1f:f42])
        by smtp.gmail.com with ESMTPSA id bb24sm510619pjb.5.2021.03.15.13.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 13:39:39 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Ajit Pandey <ajitp@codeaurora.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: qcom: Add "dmic_clk_en" + sound model for sc7180-trogdor-pompom
Date:   Mon, 15 Mar 2021 13:39:31 -0700
Message-Id: <20210315133924.v2.2.If218189eff613a6c48ba12d75fad992377d8f181@changeid>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210315133924.v2.1.I601a051cad7cfd0923e55b69ef7e5748910a6096@changeid>
References: <20210315133924.v2.1.I601a051cad7cfd0923e55b69ef7e5748910a6096@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Match what's downstream for this board.

Cc: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc: Ajit Pandey <ajitp@codeaurora.org>
Cc: Judy Hsiao <judyhsiao@chromium.org>
Cc: Cheng-Yi Chiang <cychiang@chromium.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This applies atop the patch (arm64: dts: qcom: sc7180-trogdor: Add
lpass dai link for I2S driver") [1].

[1] https://lore.kernel.org/r/20210313054654.11693-2-srivasam@codeaurora.org/

(no changes since v1)

 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
index d253a08f6fc8..622b5f1b88a2 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
@@ -139,6 +139,13 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&sound {
+	model = "sc7180-rt5682-max98357a-2mic";
+	pinctrl-names = "default";
+	pinctrl-0 = <&dmic_sel>;
+	dmic-gpios = <&tlmm 86 GPIO_ACTIVE_HIGH>;
+};
+
 &usb_c1 {
 	status = "disabled";
 };
-- 
2.31.0.rc2.261.g7f71774620-goog

