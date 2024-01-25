Return-Path: <linux-arm-msm+bounces-8280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA0A83C857
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 17:43:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A26911C225D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 16:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18CCE12FF98;
	Thu, 25 Jan 2024 16:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kwi/yQ9/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4ED9130E5A
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 16:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706200977; cv=none; b=si6QD/mp2c55R9jbHlIIFjAR72jpUH+yF4HN014ajs3A45u0VxkaM8qpI3UzDX7BjTSb2OR3nTo2cDeIJhjJGA9lWZQt83fzf+NcoDBuJrVHrNg6nUtjVdy8SoL2XRORgrLu5vEueSxFXtWm6tnrFAZyQWbmn+fUsNL/Oo2oOA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706200977; c=relaxed/simple;
	bh=8FlUAYV0p0Hs9/yKUI+wz2YaT+GWCAARd/3llgD8Z0o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C6A0xbHh/OUuTY2omlXcw4hVtiK+inc2um8iYYtHPIHWfih4CKQAjmVBR3SiudFyjFQyd3jKeLNanOHaFS7Tn2M4H7GfVRH6X1qoE5GaL9SASufC9eUG+uNNJMn6og3TXzs3kFejm9GP1NuljIBbs6onrztSMz1GbrWwlO7yaP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kwi/yQ9/; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-53fa455cd94so3539316a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 08:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706200975; x=1706805775; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HW8KVIWPvb9RNP/RwAD0mzXVj1bYagG9oDeU8ueoS0E=;
        b=kwi/yQ9/L8SgSnHwxDc+YmQNQPdODnFpmx1/xmp3QxHkClICh1xcwwwhN1i3y1UvWd
         8uP882kGXUEboR3us8+EUU7ElUmrwp4U1qiUfLAglLqQlFoMEyxYkIsuoRN7EJb19aat
         cnZPv+gZVzStQHlJMBAAOrdZebTKcSf1yBd1RptJMrtlr2vwH28nDNF/ISzSDxCLKPrI
         hXji+etH1vgraTKAP9It026sOldV760ytphOxbezhsssW+9p5sTtEmnUsRuXk+XpMgl7
         9ZJzfkU3ZgEfdPisFDLYVjLZy4AFS0oBa0gghIKXNtGkARajpIX3BzbY23pDXCQiM1cm
         +3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706200975; x=1706805775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HW8KVIWPvb9RNP/RwAD0mzXVj1bYagG9oDeU8ueoS0E=;
        b=Qb/3WMdLVzgdOr65wHhwKDPbUsoZEzN1tdmmDrye1sqdqzPncGzApBESpDShKj31OW
         aajqnPS4qFZpjlbe1eN/pFjoWaBlLe2F6eGKMAGJyprB77spyotqA/o0gnJLe9SYYVoP
         WKj8k9IF1ObGGcVbMQL/+J5Wfn1/MCJI8cW27YhKkNC2i7kXvs2dXrhQCe1DrgPBCH9E
         0DJAWqWYdWLM/s3KVIL18nKViuAtDcEJ9oLhcYD6sNxM+GFJf453oOA86BcJwX95+ICe
         MqJ1N7AExOGcz+0vU6ljJAOUT6c/z2fNAjkD1r67gOCayEGBogdayBTmh6jtmhRXvXNl
         0Fhw==
X-Gm-Message-State: AOJu0YzH6NKfbjEGqXszZn8MyRmoLIb/TYgURiIsobnXvIZ16lmHbkR7
	00c3/3gYk14Wsv+1P+tEUZ9cPhkJXgvBrk2CWfSi03YmX6PM+dkpfKsUR2f+45s=
X-Google-Smtp-Source: AGHT+IGv+bm0MrgPVzsYpMj5FuNOOYvH6ACHIPweMQLlA7IaqFyVTMiqNs34Q8k7JE+cNROnK1gOmg==
X-Received: by 2002:a17:90a:de96:b0:290:44c7:96e8 with SMTP id n22-20020a17090ade9600b0029044c796e8mr1052303pjv.93.1706200975096;
        Thu, 25 Jan 2024 08:42:55 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id u15-20020a17090ac88f00b0028c89122f8asm1769170pjt.6.2024.01.25.08.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 08:42:54 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 25 Jan 2024 17:42:42 +0100
Subject: [PATCH 2/3] arm64: dts: qcom: sm8650-mtp: add Audio sound card
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240125-topic-sm8650-upstream-audio-dt-v1-2-c24d23ae5763@linaro.org>
References: <20240125-topic-sm8650-upstream-audio-dt-v1-0-c24d23ae5763@linaro.org>
In-Reply-To: <20240125-topic-sm8650-upstream-audio-dt-v1-0-c24d23ae5763@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=8FlUAYV0p0Hs9/yKUI+wz2YaT+GWCAARd/3llgD8Z0o=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlso+FxBZdlhNgMVaTGjGaEisz1j+jr9VFtXIyARuh
 8OBDTE2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZbKPhQAKCRB33NvayMhJ0fnkD/
 9/Jm1GOPyM73Qp9AzGkEha2x1ZU9pmvKPvwz+B0cU2UQkQI5MH7O0XxMA/mlHCzsbFWcY9Zg7GqK0P
 Tw7nOzbg6Vo+S5JmWj9g+YoJiwX5Uxvi5OsH4q8L5sF1WGOlAiNVUIWu/UP2uVA1OV6oL8EVfyGWSB
 OBEkJ25ICDg1WxzHZw7kDk3Q1S9zOnSS+CiizOnHDqsa5SWzToR/Bh5K1aRAsXaxHZJfO2fVHOty1I
 s/DopaeH4BwXW3hQSn4B/C8ONzylaoyAGXTwlK99Ks8xztErSq21NFZenz7zPnIYJQzpvJIsxK7raK
 gltBjG0cmVMx6krGd8weNSxT2NWYHAXQvAXqIl0VTCZZZpUhk59LSVUa2BTlq8OmSxvaf6i1+agfzx
 vpnuiMu10q2nwTxAf0eIJVwli1RpgFow17xtwOefAfVM4rSlnbpjeWmFzCPjA3oE9/JEUJKsOE/sIZ
 M7VleI00zWIm9d0eoYf6hNJBCVvnGvsbEQs9T7aVSyUGmMfRlQHTGDzEtqTDD3NEOD1zVI2A3Pyn3d
 5Yta+5nciyX7Z0DzpOFBJ5HplZTNIWaooeEqU3kwEQ9nN4FJ00nwEnQP7CQLDW0xX2HaAH8FnKhHEL
 1uVVuxuMEg2UrMmjl+YkUXK2u8oJJoPS6JzEcL3+Gx/wyAVqkxT2u8dmgAVQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the sound card of SM8650-MTP board with the routing for Speakers.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index be133a3d5cbe..d2ec0cfecba9 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -66,6 +66,29 @@ pmic_glink_ss_in: endpoint {
 		};
 	};
 
+	sound {
+		compatible = "qcom,sm8650-sndcard", "qcom,sm8450-sndcard";
+		model = "SM8650-MTP";
+		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
+				"SpkrRight IN", "WSA_SPK2 OUT";
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&left_spkr>, <&right_spkr>, <&swr0 0>, <&lpass_wsamacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 

-- 
2.34.1


