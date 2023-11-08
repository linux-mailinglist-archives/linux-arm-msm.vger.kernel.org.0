Return-Path: <linux-arm-msm+bounces-198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB167E5CB0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 18:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA56E28130E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 17:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94B5532C78;
	Wed,  8 Nov 2023 17:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="cbdcb6A0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6899E32C6A;
	Wed,  8 Nov 2023 17:50:37 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BE3B1FF9;
	Wed,  8 Nov 2023 09:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2CnUQaTGxqUvfFdrUxE6AYsi+03ONnUHcjpsmARcoik=; b=cbdcb6A0LgGbNuTHg5tioFn0ou
	O1goK9pUJoJelWf+WKFfm71/r9WUsSki7Wt/iOAdn5ZBFlym7uaI6ff9LGA7li0OSjb9CjFtdEK+f
	JgT3U1dIhXIjCimR9f3rq1KHsCHRDCye0++3l0UKK8zk2BHf1tNHwTfO1SUjlqixd/a9XYbLLX4Zm
	FbOw7EaXyCvT0U0WMC5qIKZcMsU/MfdDk7WezRNgssFvbd6P5M6xqRvRu6dS931tFeNYLR6GD/Jxn
	jxw5hIpijBsQIn0VEbMO9hxXg1Xo3FzTkiS4yFy215MuXnIcffG0lrJU7kvGuxfqgvtc1bHxrXiLh
	VoEAMuCA==;
Received: from i73190.upc-i.chello.nl ([62.195.73.190] helo=[192.168.68.111])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1r0mhF-000vX4-8p; Wed, 08 Nov 2023 18:50:33 +0100
From: Nia Espera <nespera@igalia.com>
Date: Wed, 08 Nov 2023 18:50:27 +0100
Subject: [PATCH v3 3/6] arm64: dts: qcom: pm8350k: Remove hanging
 whitespace
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231108-nia-sm8350-for-upstream-v3-3-18a024b5c74c@igalia.com>
References: <20231108-nia-sm8350-for-upstream-v3-0-18a024b5c74c@igalia.com>
In-Reply-To: <20231108-nia-sm8350-for-upstream-v3-0-18a024b5c74c@igalia.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Vinod Koul <vkoul@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org, Rob <Me@orbit.sh>, 
 Clayton Craft <clayton@igalia.com>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, Nia Espera <nespera@igalia.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=682; i=nespera@igalia.com;
 h=from:subject:message-id; bh=0RUB7KOCa+Dyd4ytet9GLCvRq0z08dzAK+GEyion9dw=;
 b=owEB7QES/pANAwAIAfIkzsI3VuKtAcsmYgBlS8pkSa+LkTVCCp7ia3T4NAXd2TvwQr8n1w3g6
 lhcPdEdjcGJAbMEAAEIAB0WIQSBPDomug3slDJEnubyJM7CN1birQUCZUvKZAAKCRDyJM7CN1bi
 rbQAC/0bU9DMocAQJ485pS6Cgu3+vWo8Bv9BjANYYfMSFSoVyF0UjfT41SDmxrp2lwTHdzdUvb5
 jxE3AU5S4RVFIrwdJkUsmyBu2fmdp3SkAq/Qg4TUXR6uB2dioi7QTIMQeYBkIEBwjJQIHQgVpoy
 +3dMVHPED3NbFnHzDvcP/lfI4c7K0qJtfJSiuLu1Y0LXQdePBNTZtw5a4SBbxi8QvI9f+wNdbNg
 xR/HuuOEvyMbqqjv1jtJ+4r50tv/XABnA0nwtorZECJu0rxOy9seWOraIgnLF4BB3Hl78KvISGl
 /zm4MGsFwvB4pGS4xThCuEY8UW3gxzEiwHZn1bBt5I9nWPZKhaLywA9oeIiP+ObFocfZiB8cY+H
 a26RuPZkerUQRoM2yAEGnpLsJ5EALRqVwqdPliE8NPAEAu73Zzp7Wv7NTWAgAGIPQC+bCaJnu95
 Ha1VMXM9JaFwJAfkYAZCfG1CaCV/ri44j4KpzHHMo92iXXBpRS4dq7Kc4gb9VcSl4rZ7w=
X-Developer-Key: i=nespera@igalia.com; a=openpgp;
 fpr=813C3A26BA0DEC9432449EE6F224CEC23756E2AD

pmk8350 has a random tab character inserted, so remove it.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Nia Espera <nespera@igalia.com>
---
 arch/arm64/boot/dts/qcom/pmk8350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pmk8350.dtsi b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
index 1eb74017062d..f0ed15458dd7 100644
--- a/arch/arm64/boot/dts/qcom/pmk8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
@@ -22,7 +22,7 @@ reboot-mode {
 		mode-bootloader = <0x02>;
 	};
 };
-	
+
 &spmi_bus {
 	pmk8350: pmic@PMK8350_SID {
 		compatible = "qcom,pmk8350", "qcom,spmi-pmic";

-- 
2.42.1


