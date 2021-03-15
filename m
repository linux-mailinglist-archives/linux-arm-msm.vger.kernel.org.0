Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF83733C7B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 21:25:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230016AbhCOUY3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 16:24:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230201AbhCOUYM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 16:24:12 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F5F9C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 13:23:56 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id b23so7313672pfo.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 13:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SumgLXEEDiSse0N2r2wNeP3SJpvgrBBQ9pGbicCVAEs=;
        b=TARURj7INPTeCxkYuNlc1Lt1LfxS4mpXImb01jpqC0RkGoV9RYZhPtDsnVFI/7eTmH
         GTVMBKlCtuHrSW/ir5AxzAs64HJv6PIa5kw3kAYJPCdpxf+W1+te+o3IwP79unkrBJ9b
         SFtbI3RWWDym7d+KyWBRa8M77ilbej639GpSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SumgLXEEDiSse0N2r2wNeP3SJpvgrBBQ9pGbicCVAEs=;
        b=q6BZcHZOrFqT0FYuAArMLeu8zueIJuOB1bmH9jt7r8r8EmKQMxuREFk6lPOqZ3kU6V
         CUg0UsW2Mlvamgob+1c5fiDfnIzTVA20fXBc/bijSbvXiy3YWrDUluPnhHzlBZWzK+H6
         bsLIRGrdYIUA177rdyJxOJmwcRdQdRJaUeeuZXS0wZJrevHKKYgW0JAeAXhDPwvZqP0h
         iQe20k15mOoYTgDrALZTp2BW1mLS1C8BpsqMWHNYmPjtbCejQf0Dohh2jTriLuQdharr
         nHB+/rnd8U8dn0uNVXca/KNYSYgSw9CyfcDiD1SmsCVzwxqE5zslefxXGcLz9drkc02v
         uIaQ==
X-Gm-Message-State: AOAM531GdpLpR/4Z4N0wiXvoG9uYjD0Tz4QD4TR2LyIqqF/FZUqOgRv7
        brlbgbhG1EPP1hiyczh4zvB31A==
X-Google-Smtp-Source: ABdhPJy36KHDbtO5vnkZ/gY0V3nJT3eoSZdw94j+JhPppm60Jbxdyx5Jq9uOCangxZCVttxxGhPROA==
X-Received: by 2002:a63:f11:: with SMTP id e17mr777453pgl.296.1615839836202;
        Mon, 15 Mar 2021 13:23:56 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:14ce:2d12:6a1f:f42])
        by smtp.gmail.com with ESMTPSA id i17sm15614361pfq.135.2021.03.15.13.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 13:23:55 -0700 (PDT)
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
Subject: [PATCH 2/2] arm64: dts: qcom: Add "dmic_clk_en" + sound model for sc7180-trogdor-pompom
Date:   Mon, 15 Mar 2021 13:23:19 -0700
Message-Id: <20210315132256.2.If218189eff613a6c48ba12d75fad992377d8f181@changeid>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210315132256.1.I601a051cad7cfd0923e55b69ef7e5748910a6096@changeid>
References: <20210315132256.1.I601a051cad7cfd0923e55b69ef7e5748910a6096@changeid>
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

