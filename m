Return-Path: <linux-arm-msm+bounces-2887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D1F800C92
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 14:51:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0BCA8B21304
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 13:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D898B3B78F;
	Fri,  1 Dec 2023 13:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lIYhwuqH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52FE2170B
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 05:50:51 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40b2ddab817so20393665e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 05:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701438650; x=1702043450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=imJHbpmpHY3lf2HGbu59sinv7Vyx+tVX/+ka8ggTt3w=;
        b=lIYhwuqHhy4lM4pLaug/o4gq0SROltztZHZbcbsj3GvX7+eS4WA/vkfhkG1CZ7WUJ/
         oAu/4xR9oSRTZsqYMYTRQ5756DbrPcoQtx0Hmiau0MLrhNnXFEzHsxAhMxtqNSDD/pgv
         N5SuMyLK1O647aXfjvOiWCvVkspCPHeWKGZCiNY+dGVVD+28Zpnj9N5MumGL/G8R5lny
         U9k1kmxf6wi+JxYGRYc2Z4EvzhH9Uhh86QGrA5eKeiEDAgR7DF50GQK/duNTlqMUcesd
         4hiUZ04StkkgnvOrYnMdBc3bSIl+B3MKoiWnLW93OT4e4WJ2fAI+ncstHaHfGQpnUy9H
         AroA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701438650; x=1702043450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=imJHbpmpHY3lf2HGbu59sinv7Vyx+tVX/+ka8ggTt3w=;
        b=rR+5nWtSQCF8XVBO6XOQHHsFHJ6jnvlBEYI80M8ksD8jTYH1k4PGApU1S4qdhC+yC9
         /NNLswZcObNSe9i+z5em0iWirTJjljBJZhPpMNpxSt9ZGjSdBTg/Eymd9X7lXTgjCEf/
         rJNO+VuLLxuktggM/d0Vn47/oGkqyUd87+kok78hA5BPlvRwVBP4mzNJF1ra65HQz/dh
         KxeyzCMyxK4J47mwRi7KHyLMbwOgSGFdnMHVe1Y1rPZZZyDpyt8Cah/LKBTCJhk3u8Un
         vNquK5IS8Hcp/+jIpyTfm5G0XX4Z1+wumSZwHYqyp8CwQI3qzCTkLpq1yJWpPKyhmcb6
         E3mA==
X-Gm-Message-State: AOJu0YzGIOlccFaPHFR2fFypnsKhbpN6JXTYoxgySvByJadHEpXk/pB4
	k9p2DUQU0IzSkJfOCJ3eGtdt8g==
X-Google-Smtp-Source: AGHT+IEkg0ZFPXx0Eods1z6IJk2FLNB94rGE+9E2agLMYm58uuLqxXcavq5Jwr1g0gswx6fiRirHyg==
X-Received: by 2002:a05:600c:5129:b0:407:7ea1:e9a4 with SMTP id o41-20020a05600c512900b004077ea1e9a4mr417596wms.5.1701438649582;
        Fri, 01 Dec 2023 05:50:49 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id s8-20020a05600c45c800b00405c7591b09sm5539942wmo.35.2023.12.01.05.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 05:50:49 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 01 Dec 2023 14:50:42 +0100
Subject: [PATCH 2/2] arm64: dts: qcom: sm8650-qrd: enable IPA
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231201-topic-sm8650-upstream-ipa-v1-2-7e8cf7200cd2@linaro.org>
References: <20231201-topic-sm8650-upstream-ipa-v1-0-7e8cf7200cd2@linaro.org>
In-Reply-To: <20231201-topic-sm8650-upstream-ipa-v1-0-7e8cf7200cd2@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@linaro.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=733;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=SO5EMPj5/4o5z1qixmP8r0h1as0YkIYfBDEdRiT4avc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlaeS2L0/ufnYtbrqHX19JToqOQlT0/ABu76Q3Poux
 rdLZ//iJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZWnktgAKCRB33NvayMhJ0VxaD/
 9TtFzJYHvVHWCl1or/AgZW5fHbryWqzg+TgkVYO1tthLoCMV9hxWJT+ndKEW8xwf6HpdnC3DK7G/Cm
 bSQEmrN1ElIAGYYQo8iytbDRXADUbyV2aEi6B+xf6eGf9XpuTkrAfTzGfJCWWPQF8V4W5uino3UYEq
 hM5hFwninBNa9lM5P48vNsOWvRqmxpR4yR6u6jU13+souV8+YfNC6xnAxjiYjZPOFvUCrMg1BO1T+t
 FGt97mKWL2AgGmf0fEyMxada0aB9OzFtzDHW1c6PkRI0ZbTj1bgpu5RLb7q/NGABQ0tRUnxFChijjK
 iH9Zr3lWusYNJk/eZDSbYDkshtiRXYE1hUlr4HndrNUsFwnnrcPidv1jjdZo7MrulySR+eu7Wp4VdX
 dFUYfovIimhZlj1EEn98xxjHA1Ckhqyd3qIwGLVXSonNNfWl+IyPSHoRWrbC4cIHEGFFv1PYs57qrx
 gQgv3vB6gtpSD7AdpMZzQtFAQ6G8obNBb0ncIvbOoJRTl3H/zcpam3knWHv0h03F4/5/TsvWG3rKst
 Hq5yhouOPVhei9mT9f8X5c4/+pwMvBq/iaxkrGeLtnV3omVqXS68GjSd6JzsK1me8g9KkUnE11nL2U
 61lrHX+z86pnYQA/NkbYKwdaqOaZaRlR6fJmxTBIIO6Hs3ZvQL5JGrEI5psQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Enable IPA on the SM8650 QRD.  The GSI firmware on this platform is
loaded by the AP.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index e69ae61b6111..592a67a47c78 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -446,6 +446,13 @@ &gpi_dma1 {
 	status = "okay";
 };
 
+&ipa {
+	qcom,gsi-loader = "self";
+	memory-region = <&ipa_fw_mem>;
+	firmware-name = "qcom/sm8650/ipa_fws.mbn";
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.34.1


