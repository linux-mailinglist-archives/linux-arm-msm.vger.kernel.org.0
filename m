Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D856E5F12A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 21:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232284AbiI3Ta5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 15:30:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232116AbiI3TaW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 15:30:22 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4826332B87
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 12:30:08 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id b6so5794529ljr.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 12:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=rQBh9mrZMQXa4Wxb/syFmouoGZGa2l4WN/58xgtqFuw=;
        b=tdxerNTbi/LoJQJG41IsuEg9ghPRZMjzMrKeqnpnPcy8Th9n0bwZekC1cAsVPgVYnr
         F2eGILN/Ldn+EaCsK+c0xbgdiIu+53TgSbxeJwCn3pphw+yyuxzC68/++nfFM3s+hqre
         9zHhNNjKpJTJ/VqzQ0uE1wsDZc0XbuTO2o9g6MItoWdGyPF766aTXVqUHNr4tguBcymL
         2U+OEGTk/bjPcEebKKiypFxlgUOmW7GLMUlTVUJ0m5IU19BRhv9OmxV+K1Hd5j+F63Qn
         ICD64TlgDZdFwmscXQZevlgjL8PSQrL+gaMHEF56S/Sf8HybNlcnsJTL9pydbXWrXD9h
         UKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=rQBh9mrZMQXa4Wxb/syFmouoGZGa2l4WN/58xgtqFuw=;
        b=RozQ0AeeXw+UfMZoiYglt6Uy6A4kUTGmXYoEzv3hnkTJ3A+NifTwGGVE/xBhjIiwq9
         t+utVunn5cVn83xwq2FaRJS3gyz66/nPnwtOjLSafeCDoV//y+DkPbF91TunR1u7wqZo
         xixbC4fD+k2YJuohEdOi+V37fIe0tVVhXivO471vB7BLzw+MSzWTRBxT+EpNeTqL4yQG
         acUipUX2c0acTq++sPyUhAwRqlvoY3UH44yoz7T1sIY40mBSJXlbp8S2Eq5v0Arw8J5e
         fbqfLPUUcRbj4CwQYJGdyykXSspQXHVTbXy1fjLFwVONsq/GsEUxv3M6IPez83MOyvbz
         fchA==
X-Gm-Message-State: ACrzQf12GskN5FRGSL76ZWoK5C0cqoPCjWa9P86Y5iycswGS+pJz9OI7
        /Ms8HgqC+8peuis8KIV/J26AYQ==
X-Google-Smtp-Source: AMsMyM4ZxoXwchKyNuf0WX40+oHXmtG03nDufsx5D/QesjCFD+EFYs/PaoiXZFlKCaHSRlDCF9kQ/A==
X-Received: by 2002:a2e:9d88:0:b0:26a:95c1:218f with SMTP id c8-20020a2e9d88000000b0026a95c1218fmr3266021ljj.223.1664566206637;
        Fri, 30 Sep 2022 12:30:06 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b0049f9799d349sm393603lfb.187.2022.09.30.12.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 12:30:06 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 09/16] arm64: dts: qcom: sm6125-sony-xperia: add missing SD CD GPIO functions
Date:   Fri, 30 Sep 2022 21:29:47 +0200
Message-Id: <20220930192954.242546-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930192954.242546-1-krzysztof.kozlowski@linaro.org>
References: <20220930192954.242546-1-krzysztof.kozlowski@linaro.org>
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

Add default GPIO function to SD card detect pins on SM6125 Sony Xperia,
as required by bindings:

  qcom/sm6125-sony-xperia-seine-pdx201.dtb: pinctrl@500000: sdc2-off-state: 'oneOf' conditional failed, one must be fixed:
    'pins' is a required property
    'function' is a required property
    'clk-pins', 'cmd-pins', 'data-pins', 'sd-cd-pins' do not match any of the regexes: 'pinctrl-[0-9]+'

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
index 6a8b88cc4385..9af4b76fa6d7 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
@@ -89,6 +89,7 @@ &hsusb_phy1 {
 &sdc2_off_state {
 	sd-cd-pins {
 		pins = "gpio98";
+		function = "gpio";
 		drive-strength = <2>;
 		bias-disable;
 	};
@@ -97,6 +98,7 @@ sd-cd-pins {
 &sdc2_on_state {
 	sd-cd-pins {
 		pins = "gpio98";
+		function = "gpio";
 		drive-strength = <2>;
 		bias-pull-up;
 	};
-- 
2.34.1

