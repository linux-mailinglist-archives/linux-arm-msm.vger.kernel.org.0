Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAC8A6C6F16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Mar 2023 18:32:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232255AbjCWRcN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 13:32:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232506AbjCWRbt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 13:31:49 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E29C83645D
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 10:31:33 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id fy10-20020a17090b020a00b0023b4bcf0727so2820954pjb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 10:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679592693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0GSudvBlA2ChvW+1tK19vXmBXB0gm+MldtIhXHWk80=;
        b=f8MEMPhDfzoFegAhp/wfBqbHVIsGQ736bOmKQD+YQO8hYiVarK1C43+BZhyvyHDqb2
         qygRDuX5MFaxcnB+jTX/PyrCbyk3gwQ0pCf4mCgXPd54jUhyzslyhuPnUX3NjxMNenuD
         Vf4bdDfS4YeAdxNX5bBueM8Yuj7TfCR5AR4zM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679592693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e0GSudvBlA2ChvW+1tK19vXmBXB0gm+MldtIhXHWk80=;
        b=rdp2YNqz5EbixeqfVgS3267Q90GIbLQ3zeNnbpWtED6xZmQZ+ZQRnLtZQmQMAJjRG4
         zKRnoe+Vxh65eGVIJZUDZxl8fVKQqZKBwhuMC9eeKzSWrs6u9ik798+mfZM3Lx/EqGs8
         l9uzjdOsUnOBE1HCn3/DmAdUIT1BOzvbXzHuhh2mvXFh76UoVatv/90jWmAEVJuQjzDt
         UINUGaa+716DmrqmuXxlfTZRQH6pl5A8RDuW3TlKyPpBS7CaT7YECr0QMWfAgMsYxT/v
         jep+c2uFzV4Te1cVokRQFEeB46DHlJ93CLSWEECwAZmzRHWxTMsvs1NrdBJkiPWQQEEo
         Xi1Q==
X-Gm-Message-State: AO0yUKU/jNNnbP3adXGWu7f6mNDuAgaEx5c47zlAXldaY0IdrN5dhG5x
        QOz3evYD778bNRygVjR9GAXZLJG+XRNbFydzwgw=
X-Google-Smtp-Source: AK7set97Q7ByztaZI4dKAUikIP7l4jBgCdFB7n6RsJvEpYOdNT3MUl2aWbhj4bw3DASCvj3xaFJ0tg==
X-Received: by 2002:a05:6a20:718a:b0:d9:a792:8e3d with SMTP id s10-20020a056a20718a00b000d9a7928e3dmr349987pzb.30.1679592693514;
        Thu, 23 Mar 2023 10:31:33 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:16d3:ef20:206a:6521])
        by smtp.gmail.com with ESMTPSA id x13-20020a62fb0d000000b0061a6f4c1b2bsm12613546pfm.171.2023.03.23.10.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 10:31:32 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-gpio@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 11/14] arm64: dts: qcom: sdm845: Remove superfluous "input-enable"s from cheza
Date:   Thu, 23 Mar 2023 10:30:15 -0700
Message-Id: <20230323102605.11.Ia439c29517b1c0625325a54387b047f099d16425@changeid>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230323173019.3706069-1-dianders@chromium.org>
References: <20230323173019.3706069-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As talked about in the patch ("dt-bindings: pinctrl: qcom: tlmm should
use output-disable, not input-enable"), using "input-enable" in
pinctrl states for Qualcomm TLMM pinctrl devices was either
superfluous or there to disable a pin's output.

Looking at cheza
* ec_ap_int_l, h1_ap_int_odl: Superfluous. The pins will be configured
  as inputs automatically by the Linux GPIO subsystem (presumably the
  reference for other OSes using these device trees).
* bios_flash_wp_l: Superfluous. This pin is exposed to userspace
  through the kernel's GPIO API and will be configured automatically.

That means that in none of the cases for cheza did we need to change
"input-enable" to "output-disable" and we can just remove these
superfluous properties.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index f2b48241d15c..588165ee74b3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -1155,14 +1155,12 @@ ap_edp_bklten: ap-edp-bklten-state {
 	bios_flash_wp_r_l: bios-flash-wp-r-l-state {
 		pins = "gpio128";
 		function = "gpio";
-		input-enable;
 		bias-disable;
 	};
 
 	ec_ap_int_l: ec-ap-int-l-state {
 	       pins = "gpio122";
 	       function = "gpio";
-	       input-enable;
 	       bias-pull-up;
 	};
 
@@ -1190,7 +1188,6 @@ en_pp3300_dx_edp: en-pp3300-dx-edp-state {
 	h1_ap_int_odl: h1-ap-int-odl-state {
 		pins = "gpio129";
 		function = "gpio";
-		input-enable;
 		bias-pull-up;
 	};
 
-- 
2.40.0.348.gf938b09366-goog

