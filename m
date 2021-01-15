Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E26D12F70B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 03:47:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732256AbhAOCr6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 21:47:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbhAOCr5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 21:47:57 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53EA5C061575
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 18:47:17 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id h205so11056815lfd.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 18:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tFcYvY2ENtMXf6GVcG4fJRL4gz7JxSFvMwOwpTMhUyA=;
        b=O5ZIrh3D217oGvjf/7Qoq3ulEbT+9mKy25D3Dh8Di9enONAZAwmsotd7V4AcT2IJ8X
         Y46/3nDz0oSMXASpIl2YryIu60xqP2bYih4sHSpr1F+nAoWQVsexQvxHz/z4XXsDN6hH
         maE7TcofZfigkiEc8l8uXOFBopDNjVN7gQsPwBjhtVUYhYOADp2zw/Oh7HtC74LFTjn8
         OJjIouemk4qCZm0vjSFa69gOhTkb6HTAQyxk0Xd5OqeJh+VFBqmMwJfN6ELet7tVNOVB
         9KvUU/ZHWGmciYT1QxjHaHqYKcdW4aCUIInH8SZDB3QK6QYGkiykwH0tnaTHtHqdpOGl
         vNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tFcYvY2ENtMXf6GVcG4fJRL4gz7JxSFvMwOwpTMhUyA=;
        b=dHr1cIGt04KLhUHvnze2pHMyPL+tMEOib+tuv2QIl1EsapzT6MZtmVssKCTt/Acr+V
         r8sJKZpydd1XZC9nAYcjAb8pUJ/9XIRqOZ9mfUND6j7mHaopkqtqJNSaCfybyrTDP8ZP
         pE6ySWxeJ7Y448jKRNsM1RxX/tFK/4ZqL07fedhva0GF65AjflH06M21+2/7+InqkB9k
         1DEFYM69zy9q6FnyHRokxYj9ylsrcoHqM+VIVynMXvl1Pe7xw37csFPD4QMndH6o0CRm
         Ajh0/PWKNB8ccaPWuaw9hC3t3hI3uQDost4cPP4dv54IsId1c657/IOEuJThdnqpW9YY
         PyFw==
X-Gm-Message-State: AOAM532nSzldbLhx9+ip6TqfC68/zwUQkL2FPBmRcAUXLMysWALEHAMG
        KFtpoxua7Ws153l1G9Q5BIipLQ==
X-Google-Smtp-Source: ABdhPJwfyXhtBrZ1dxytNj2UUC/YpSdsmLKCvKTtBLae1lzGwtJJ2rcRdEIQkNd4WmlsyzsNRxsYYw==
X-Received: by 2002:a19:2d44:: with SMTP id t4mr4289369lft.125.1610678835903;
        Thu, 14 Jan 2021 18:47:15 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.106])
        by smtp.gmail.com with ESMTPSA id p18sm732715lfh.34.2021.01.14.18.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 18:47:14 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] arm64: dts: qcom: qrb5165-rb5: add HDMI audio playback
Date:   Fri, 15 Jan 2021 05:47:13 +0300
Message-Id: <20210115024713.92574-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for audio output over the HDMI output using Tertiary I2S
and LT9611UXC DSI-to-HDMI bridge.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 89a1d60e93ad..7f7c2f90fdab 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -704,6 +704,7 @@ &sound {
 		"VA DMIC0", "vdd-micb",
 		"VA DMIC1", "vdd-micb",
 		"MM_DL1",  "MultiMedia1 Playback",
+		"MM_DL2",  "MultiMedia2 Playback",
 		"MultiMedia3 Capture", "MM_UL3";
 
 	mm1-dai-link {
@@ -713,6 +714,13 @@ cpu {
 		};
 	};
 
+	mm2-dai-link {
+		link-name = "MultiMedia2";
+		cpu {
+			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA2>;
+		};
+	};
+
 	mm3-dai-link {
 		link-name = "MultiMedia3";
 		cpu {
@@ -720,6 +728,21 @@ cpu {
 		};
 	};
 
+	hdmi-dai-link {
+		link-name = "HDMI Playback";
+		cpu {
+			sound-dai = <&q6afedai TERTIARY_MI2S_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai =  <&lt9611_codec 0>;
+		};
+	};
+
 	dma-dai-link {
 		link-name = "WSA Playback";
 		cpu {
-- 
2.29.2

