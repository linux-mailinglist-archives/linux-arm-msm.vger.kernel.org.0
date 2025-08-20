Return-Path: <linux-arm-msm+bounces-69983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC302B2DEFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 16:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E8B61C80053
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 14:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291BD26E6E6;
	Wed, 20 Aug 2025 14:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N6HT4GkD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA19267F59
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 14:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755699165; cv=none; b=XFRXMqIbt6nSrHCTiQeXDmMvWFZSY+CAOU09x0VdgVkGLV5eyhheGPAmH/SHLEPsOXcHcYtZm7cbpK3c4hxax6CJ4/s5kpDl/5qcrgqxVdNv6XDZeaJx1pXadHV4Op7PzlvDYAyHOKVOWQ/ZaVFSLjwuoEaMH/J9srOxNoIxTGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755699165; c=relaxed/simple;
	bh=H/RTJDY9eM1acY1XItQorh6/fncB7JYm4MnQAbwNEWM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iRToKkS8yiSFfnEcWSpwq8ka4bYx1i1I7ecY5Eo3b8wtHR+DWlR4GrmXXZSHuKX6Bq2tYRWJvMwQRs/s5/R/Bks/k1aQUk5Bq4BIrPvPmkMWjOqF0epP45K9O89Bp5weoY10Rto5TR32TvZ9K7b2dO+/VAzaMk3XX5oAy1cvEYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N6HT4GkD; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afdf393978eso9551766b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 07:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755699160; x=1756303960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6DicCiRUfEBKSVE+lWissFYluUrOy+BhCrrkg8D9e0s=;
        b=N6HT4GkDW6x50HId1dhpzKCUm2ciomRMESX0PQAX1wpKK6kHNPJ4PaZtuD1Cfy+tcH
         D0CyHuBKDVu3ODxVb4agi8canKH6mpO67BbyJl8+l9OEmcJ9RUG7kYymw8dKlj4N6VZU
         pJyD9RvmjPUHVQB+woJIIRI8FzUctB/SyfXGG0asbKTTi3GaG62mqi24elFON58BtK4h
         S9hJS7pZskzCQ3kaIBssM9Lartj2QkAoLPJnEBaNRiCBSn1UYQasfPAj6+CGZ9dTfKNi
         B/jfKPvLRlon+wTEDXjHUQLsFKi1CYG9GM9LEOJzW0noAa0nd2X0fT5iBZYFGqgIIqlT
         Nkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755699160; x=1756303960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6DicCiRUfEBKSVE+lWissFYluUrOy+BhCrrkg8D9e0s=;
        b=B/baD8thkCh0n3SgDIAIkES703h57YiXJjrI00N2AU3hgAdEJAbyLwkPMcchAb5BpM
         0dWhnqmyltyMpi/wUHjJmilydqFM1nRdHq2UytwCratP51rYqZphEo81Ht2XOQGR6YwG
         nrzwto/TY2Lxyt1SXwHmQWDKbnTO9mGSHTC1Q11VMGhQEQ2o7x0kJRBHz0yHqP6VCjXa
         j1/TElkNRu9gh2HyVSkJ1+3/0xolu9nlIvyLdHJ0R6xXl6JrA+S+mv6beNnhueysdICk
         T5C+opp2Pkrj0iZ3no+Uw9GHCSEPqGz6D6H3p8t9g1zJQmiRZ1mexV67V/x0ZVZhC6AK
         H4RA==
X-Forwarded-Encrypted: i=1; AJvYcCVAw+VPK4tfehveprmpNwH3k4sJxlCY1lKbPf7LLTjWJCzsO8XS+30e3KbWA0E5brRSf4FMwjTF2lfxPqYv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1koEAKIUVgc4wUEOyHyii7NkLjKHK79EfZN8CJbrqdWFioz/X
	zAOwmjCRkq09AIH+ixuDLze7OksXZxvYT4rUwAHn0MMkvdfORszH190RaM1mQOePf3E=
X-Gm-Gg: ASbGncuIBh7530DYfH3NAwOsI4V5KnzMez9QPx0vyGQQanhkeKAnwwlGtGPbTLYM1Bo
	JZAgYTTc4VCQwryi5OnVviUnWEjudUi4opUL8tJ2sjza6VqUfnQeSo19CBCqS+IcCi57FMoZIuJ
	8rnr43zs9uX9CPf+P8gUhvO2Zhtvgqwgf7417yZeJOOXYlxWRIrY6LCouAcs94QIeRgiejkeFwl
	9foiGeQpguJpNq5uxGe4mUQD7sIY1zSs4buLUdL45UB3Qfz+JLZg1DucJ4RmkelMNBofQPvJtTi
	AK2lR15s2JIOhGxoUAJvspCcwGTbR1YbzrxDpUaMtpZOWpKLwCo9W82eZNwgBz9DHAYkgdSiBSo
	poBetlkx7J4W66sW/f5twYcPfbPYB1HM4gg==
X-Google-Smtp-Source: AGHT+IFqzeaOsHYkCFi/BajZxPmhBjlCcFnmT90BtcmwpVY7GgK8f0nIWHXUb+iwDk/ynDENIjdTXg==
X-Received: by 2002:a17:907:72ce:b0:afc:ebfd:c285 with SMTP id a640c23a62f3a-afdf0099fbemr145741866b.1.1755699159726;
        Wed, 20 Aug 2025 07:12:39 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded4796ddsm186181866b.55.2025.08.20.07.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 07:12:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sm8750-mtp: Add speaker Soundwire port mapping
Date: Wed, 20 Aug 2025 16:12:34 +0200
Message-ID: <20250820141233.216713-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1495; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=H/RTJDY9eM1acY1XItQorh6/fncB7JYm4MnQAbwNEWM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopdfRWuX0u0X8hZ2BPrL0udyUeXVspH2Ux0Uuh
 flmJ8NRBGmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKXX0QAKCRDBN2bmhouD
 16q9D/9uVUFTPBjlyNVgd54pqVKud6L/UpgtrUwAaKJpF3y3vYUQoVMQUNLyz23vUue0om/LiEp
 nMKrCDF4tDiQiuNEHkmidSRPzXnNsyZXkjxgZ9dizGmQ3/sQQ35s0iaUyvTwuLXZazKa+Ritlab
 tAhL/Jk/smDckQ1X9zIFfzLtbzdyjhmw8ZpLUZRqnt8mIqsd7HrQqGjzOEp0hYmza8mCAbmpfn8
 sWrzclE3RtCureai1hRCNWpjwHWpUFpeaa3J4lY+1x38f/Q/aKaVJtOrrsc6ioX13UKxaQU7P6H
 v+8VcUUG3ETqNhij49+9BFSsh8w0sfK42JkKZbXikJyCUw5MM8pLlv25n3znZhOKkDABM85layq
 YXk5QW/Ka/EGhoTFS8OCaha/Az7OQFD0UNQLkmDEPnKU2O6YGSgtZBveQV1UI3pzfmihfHKwtXo
 fv8PwzHkO1hrbUFLo9PJ0gc3GarUYo3qiQrHQceFg+jA9nRX6rpV2sM8ZeEgvyovYRPbj4429TF
 /Z4BORZBp0euajixvfqCEeywBi0F+Extfxd2LFAW1NHk0mapHFs7f6+3DYvPWHtgFjvwd71A++s
 tkwwa4LFtcxoAlw74kw9d55lYGq+y6P9HSzuz7MoMyNxpTAwiUr4usrGNG6F9TFZPgTLwR8/q3y w5HsiS9EGRYcGjQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Add appropriate mappings of Soundwire ports of WSA883x speaker
to correctly map the Speaker ports to the WSA macro ports.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 75cfbb510be5..946ba53fe63a 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -938,6 +938,13 @@ left_spkr: speaker@0,1 {
 		sound-name-prefix = "SpkrLeft";
 		#thermal-sensor-cells = <0>;
 		vdd-supply = <&vreg_l15b_1p8>;
+		/*
+		 * WSA8835 Port 1 (DAC)     <=> SWR0 Port 1 (SPKR_L)
+		 * WSA8835 Port 2 (COMP)    <=> SWR0 Port 2 (SPKR_L_COMP)
+		 * WSA8835 Port 3 (BOOST)   <=> SWR0 Port 3 (SPKR_L_BOOST)
+		 * WSA8835 Port 4 (VISENSE) <=> SWR0 Port 10 (SPKR_L_VI)
+		 */
+		qcom,port-mapping = <1 2 3 10>;
 	};
 
 	/* WSA883x, right/back speaker */
@@ -951,6 +958,13 @@ right_spkr: speaker@0,2 {
 		sound-name-prefix = "SpkrRight";
 		#thermal-sensor-cells = <0>;
 		vdd-supply = <&vreg_l15b_1p8>;
+		/*
+		 * WSA8835 Port 1 (DAC)     <=> SWR0 Port 4 (SPKR_R)
+		 * WSA8835 Port 2 (COMP)    <=> SWR0 Port 5 (SPKR_R_COMP)
+		 * WSA8835 Port 3 (BOOST)   <=> SWR0 Port 6 (SPKR_R_BOOST)
+		 * WSA8835 Port 4 (VISENSE) <=> SWR0 Port 11 (SPKR_R_VI)
+		 */
+		qcom,port-mapping = <4 5 6 11>;
 	};
 };
 
-- 
2.48.1


