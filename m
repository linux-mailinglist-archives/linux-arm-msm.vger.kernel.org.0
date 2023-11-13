Return-Path: <linux-arm-msm+bounces-548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F1D7E9859
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 09:56:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B427280ABE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 08:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7301865D;
	Mon, 13 Nov 2023 08:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Ku1rR5Zh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88701863B
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 08:56:35 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9C201709
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 00:56:33 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9d10972e63eso612529266b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 00:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1699865792; x=1700470592; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CynjfYwQt6yEjM2yMQy6bc2CWbjcfVhAVfgPHtrn8R0=;
        b=Ku1rR5ZhiViLtyprrjrTUYU/pwAIWbiBblbUoveMhq0Gav3fTkKl40O+0oo/8bL0jc
         hxTI9TzpJR7T8iq8UsTLKOzYdL5SfuKmdEZEzbLN6x12RRg3hUnVuizptErlSJUnE0Ec
         eXLTX+bBN0VO2pYUlv1+PPb0EyvJITBtq/rRfZSZZxtLkQjPDHdMHhoWnw3ff9Ggkf4X
         dEeyMTVuSb4JqzCriVzWxYBDxn1iXtMhfFsZskRfel4dGpoqO/HrlgYfzCa8wwVGlZCw
         aJLx+mesUN9M1/NmAQ7bdJTntxpI5jqQIBrn03aGD+5zQGUXhbdEyhFM2hRMUiMg625X
         o99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699865792; x=1700470592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CynjfYwQt6yEjM2yMQy6bc2CWbjcfVhAVfgPHtrn8R0=;
        b=URsD/u7ieWDQN8YnRLr4Z3ACtAjlUQ7Nh8J49Ai08KnPOHvTpHOFDfBLrLPPbhYm+o
         Aj/hWfkERIhwec3xXYDFKGs6qr2np7Q1i3tFYAGAczqLLXJu2VkTeIguB2I5QljvPW/B
         6AKZv6z7swB9T2XU8SdyXwGHqKVfoLEz0JLOMFn6u1IJg2Tl35DtuZ7fcbmsx2kl0rvD
         Oft9xzsItUBa0G3GaTWkl9S/6aFrXzaoURAqtywQ0MVsInzbpV3J+cgmkNeqDKrKkPlt
         qNW7dVoX2fx6C3gFKo2EZMnlBuZWwOxVVOpnSrxJQbAIU92NHHbdP/8CWGcwBo/f9fTb
         FipQ==
X-Gm-Message-State: AOJu0Yy7PlgzCPJeJE3pkwB3U0esWfEx9+q5wy+5LnPwMWLim6oiZl9Y
	I8A+CSMOsTC7dmf9076UCFDn9w==
X-Google-Smtp-Source: AGHT+IE+1B70iakds+oKGTWbH2CVf5IC+VLEh7U7CdAMgRj38n4ZGWVR76woo6mU73f3DDL36Oe23w==
X-Received: by 2002:a17:907:76d0:b0:9ae:7502:7d30 with SMTP id kf16-20020a17090776d000b009ae75027d30mr3389089ejc.57.1699865792415;
        Mon, 13 Nov 2023 00:56:32 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu (k10064.upc-k.chello.nl. [62.108.10.64])
        by smtp.gmail.com with ESMTPSA id kk22-20020a170907767600b009c758b6cdefsm3673538ejc.128.2023.11.13.00.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 00:56:32 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 13 Nov 2023 09:56:21 +0100
Subject: [PATCH v2 10/11] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable
 various remoteprocs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231113-sc7280-remoteprocs-v2-10-e5c5fd5268a7@fairphone.com>
References: <20231113-sc7280-remoteprocs-v2-0-e5c5fd5268a7@fairphone.com>
In-Reply-To: <20231113-sc7280-remoteprocs-v2-0-e5c5fd5268a7@fairphone.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4

Enable the ADSP, CDSP, MPSS and WPSS that are found on the SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 77ba05b77d68..307062c1a0cb 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -470,6 +470,26 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/qcm6490/fairphone5/adsp.mbn";
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/qcm6490/fairphone5/cdsp.mbn";
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/qcm6490/fairphone5/modem.mbn";
+	status = "okay";
+};
+
+&remoteproc_wpss {
+	firmware-name = "qcom/qcm6490/fairphone5/wpss.mbn";
+	status = "okay";
+};
+
 &sdc2_clk {
 	drive-strength = <16>;
 	bias-disable;

-- 
2.42.1


