Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD2D8654401
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Dec 2022 16:14:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbiLVPNc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 10:13:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235321AbiLVPNa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 10:13:30 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 522046324
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 07:13:29 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id m29so3126152lfo.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 07:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BsplOjZZk6jYrcZE7Kta0cg+Ks+PMbJwwJfj8GcAeW0=;
        b=ast4Nrz7YxORKhN40P+Ez5LW8UGgXlMLlC1iJQD13/oFzi3lLPXnSaIeVVwYZKFihs
         VJBVacfTjYxiTPdVsXa1FC8piiREFipEtgftrMM0wuKVEivlWmnFRryp3OnichlLmSB5
         6TJ/uzm7oBiL/1efNIfm8hok9NBo6dCOdh3DvVFElTR+4wNv7q+6R0nO05PpffSXflxw
         kDuUdwoymYDyPoYGj4SEFCV+p/qtPQLsqwAcjaqsq6sd3Tc/t9V77q+XhIw3Cw4qUwUC
         9+ATpDaP2LJy8IWTFLv4YRTvZW6+Jgj3Ltu9KD51ZsC/g8rGBb67hV754r5H/426cQ6P
         nFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BsplOjZZk6jYrcZE7Kta0cg+Ks+PMbJwwJfj8GcAeW0=;
        b=CwLAnZo6/mDrUASReRYdThghz1Kosft8my9vwvV2zldOVF9W22IV+Jvd1aqA0rzfT9
         QGzo+8ZBJGt3rjsXNKB/20sIZKgz6okIMGGyXLrf/T2C61PbLOXyWTyBgvtqjaoy9BJG
         ZlC0jMQbbbrzPu3Bn75lK9AkxJ5PsAM15Ck79o2xU6ubikx1Yl6uAu6lEEN3X4XW1r23
         SXqT4dASxoNcnJhBTx5/YMKUdh3btzmHS5z7H9hoLUqLWIPqrKoCk1tAV4wHHFLgXanY
         ROtOyI4977eRGj93y6f7OylWj1s69mxh0en3eiF/+1qHygoyZuYoOP5AFtx3gW5fOHke
         Kfcg==
X-Gm-Message-State: AFqh2koMn9JhWzANNKs+Tpuv4tToxUw0yUcLck5Kv46pmCIMTcHK7oBz
        4oMAPOrtrgrUYXnLH30MaKgXNw==
X-Google-Smtp-Source: AMrXdXtAGIcM22Pv/wh7lusd95NUrVV+99PXgXzZE9TClKzIZglLq6CrMkyNlVDpSL5HqrPM7RYzSA==
X-Received: by 2002:a19:8c5a:0:b0:4b5:b2b1:69a9 with SMTP id i26-20020a198c5a000000b004b5b2b169a9mr1651016lfj.20.1671722007677;
        Thu, 22 Dec 2022 07:13:27 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k9-20020ac257c9000000b004947a12232bsm91269lfo.275.2022.12.22.07.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 07:13:27 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Joel Selvaraj <joelselvaraj.oss@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Caleb Connolly <caleb@connolly.tech>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v4 4/4] arm64: dts: qcom: sdm845: do not customize SPI0 pin drive/bias
Date:   Thu, 22 Dec 2022 16:13:19 +0100
Message-Id: <20221222151319.122398-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221222151319.122398-1-krzysztof.kozlowski@linaro.org>
References: <20221222151319.122398-1-krzysztof.kozlowski@linaro.org>
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

Each board should define pin drive/bias for used busses.  All boards
using SPI0 (db845c and cheza) already do it, so drop the bias/drive
strength from SoC DTSI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>

---

Cc: Doug Anderson <dianders@chromium.org>

Changes since v3:
1. Rb tag

Changes since v2:
1. New patch.
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index dcea535de9b7..cac70212cc2a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2785,8 +2785,6 @@ qup_i2c15_default: qup-i2c15-default-state {
 			qup_spi0_default: qup-spi0-default-state {
 				pins = "gpio0", "gpio1", "gpio2", "gpio3";
 				function = "qup0";
-				drive-strength = <6>;
-				bias-disable;
 			};
 
 			qup_spi1_default: qup-spi1-default-state {
-- 
2.34.1

