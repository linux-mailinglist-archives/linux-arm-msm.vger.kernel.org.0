Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E25E3506017
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 01:10:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234354AbiDRXMp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Apr 2022 19:12:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234386AbiDRXMn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Apr 2022 19:12:43 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F2771CB35
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 16:10:02 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id c190-20020a1c35c7000000b0038e37907b5bso430450wma.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 16:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ma+BI04gWQ/Gx/6CZ1w2tfFPMhM4LqfFZ+0ix0uokDc=;
        b=sn995jmC9GwrvezwLe/wPpk9HKgCzMu5unxZVJSGWlsh/1sppWsfFVyua1x9Fvx4wE
         Oc5RAzmQUO3zAYbmoX8dB3yNfj1M7std5yQURF1F9EhdLwnPa092GMOh+kBnRowY3CDP
         0F6z/T4dLsYimB4ety6yryRzZkb9SEotDufFbwGdTlltEDE3Myk1mQ55SOa1dQYYXKxK
         e+qnBmVu+oYLqMLeghYG0LkA25MJlcXDjRoeJq0upgCiaXbBPL9VU93yXxVzyE7gY4zU
         dUSrMmi7f+9C+z2CW8jqc1CLn6/iFf8L04whaEFD4+kpQKSC4PAii3sjz0hevbJ9PE4g
         9yBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ma+BI04gWQ/Gx/6CZ1w2tfFPMhM4LqfFZ+0ix0uokDc=;
        b=nQ3F2Q2xCGAhBTanMIZ+0my+2YXks4y4LWvPhCCS7Ya7NLNND/ru++TgDJtOLfo0my
         zCTbJeurBurfeUR4OJAb2nNFFmAzfyQoUDgYEdonigbE7dD3EaMmi5HAFY6Agi+10fXv
         itWB/4pMd9DqK+dRSKB1WG5ExLoVhltpXnkLDW53KQnzWslAoX5kq7Fio82ZwTk1izhW
         4MCuZGIqA2wFTUF9YGsATQ4RzZazguDwmfjRsLPH9oHcMEIf/IkAnWkXV+SWltKQBQyr
         SGNarMexcJ49+ECjwz4giZkYP0rHprQSCpKiovLbGMnobu5uqKK5mCRCBfHxa2y4Ju6o
         CrKA==
X-Gm-Message-State: AOAM531LtaALNka6ckIfZf8mdhM5l3uzJKP1+TWIPiShO7K144p3ixhJ
        vZqkNXN3qNhbH1D0TFWKpTmEsA==
X-Google-Smtp-Source: ABdhPJxZoakdFldpRtcq6a2ls92ZkmEbJCnPj7ftc/9xkMmnC+iEseDaL40CILgi9S2lK4t9TpdYxA==
X-Received: by 2002:a05:600c:4ecb:b0:392:88ed:1ef9 with SMTP id g11-20020a05600c4ecb00b0039288ed1ef9mr13078107wmq.68.1650323401217;
        Mon, 18 Apr 2022 16:10:01 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id f14-20020a5d568e000000b00207ae498882sm11187567wrv.32.2022.04.18.16.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 16:10:00 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     srinivas.kandagatla@linaro.org, robh+dt@kernel.org,
        krzk+dt@kernel.org
Cc:     alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH 2/2] arm64: dts: qcom: Fix apq8016 compat string to match yaml
Date:   Tue, 19 Apr 2022 00:09:56 +0100
Message-Id: <20220418230956.3059563-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220418230956.3059563-1-bryan.odonoghue@linaro.org>
References: <20220418230956.3059563-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The documented yaml compat string for the apq8016 is
"qcom,apq8016-lpass-cpu" not "qcom,lpass-cpu-apq8016". Looking at the other
lpass compat strings the general form is "qcom,socnum-lpass-cpu".

We need to fix both the driver and dts to match.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index e34963505e07..452cdfbf8ef9 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1392,7 +1392,7 @@ sound: sound@7702000 {
 
 		lpass: audio-controller@7708000 {
 			status = "disabled";
-			compatible = "qcom,lpass-cpu-apq8016";
+			compatible = "qcom,apq8016-lpass-cpu";
 
 			/*
 			 * Note: Unlike the name would suggest, the SEC_I2S_CLK
-- 
2.35.1

