Return-Path: <linux-arm-msm+bounces-51148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E92A5DCFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 13:45:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF41A189B02C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 12:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B497247DF0;
	Wed, 12 Mar 2025 12:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EVqGMg5Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA94245018
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 12:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741783503; cv=none; b=hVqY30LKcoTyn6yE/vugZAeH3YFcNBxiZ9/eY1TKf305cuZ7GoUPicY80UE6w7iEKTwwH/XJKaKtJo75DJ0/0c2RX0Bfl2H6aeNvPPALS5jmiUUlzPmICCwvrQORHHDZn+n1d+sXdUhV6X4r0T+E3W3FufpFQZmei4dhixAZWZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741783503; c=relaxed/simple;
	bh=zkWxc58AATnS1F39ut/pLhdJJwwAOHmg2qN754Tuyu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CZHqq/mMpZAEOxZMwYo4VptFlfUOsDIsRILDypUkabdypZZYX25DPicBN+7jKlFGYSvuSmULNKRxRGuKFBCCE5Tob4yLK/NprQlO+ChnJfSfkBbrBTQzYaGKI6pSwVEuaQpkbwtich58SuZLHImMF4z0xduKEVInShrXgAdpFec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EVqGMg5Q; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac1df33123cso90553766b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 05:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741783500; x=1742388300; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LXN2WSGs1UrSQsfS8ukQuBeuOIY0VTA+DMr2dFmybQ0=;
        b=EVqGMg5QVWtql+EPvWu6Ij+3NCHjTYpY8EXaBSQewzO8ccKI2bIcGQWoWs7GvyZn+/
         uy8X6RygsrjLVbRt4YTblGBO/AVArNQ7IiGNg/Ix4pFMlYCldoF0aBFQDbv+qImsZ2g0
         9Z648wHXjwlEKoTjm+/gokmITK8tGpdJZ0oIOaLzA4xGNtFfF6uztGEec+U4681QzlLb
         r9XLI4fx7FoOmEXmrFuqqoHBFA1fh2EsRUus6QkFkuohvQv+zdTnrS7cTsny6uz/hU7X
         I2695SlX4pMonth/KIkPKZgCKasIV7mGNmar8r6yDpV1vQ3uQ4JNyTG9gQbX0PdoIRJA
         PQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741783500; x=1742388300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXN2WSGs1UrSQsfS8ukQuBeuOIY0VTA+DMr2dFmybQ0=;
        b=e37zq+EXUtryK5RDzYR6VDtK/fID4O1NH532Do99ZXNd6T1Qrr8Dgcpy62nJaCE5xj
         vsTu43sx0KwPRHKpIE9/QfKHXFtZ/X5AwgcZvWsnAB9vI6XFKtazwgYf3bQoH00yScOv
         +YQXzMGamzPYY28GOrQWwWJqp1JVJmrhLtL/M8ZjaQohNlSsfcKosUL7j/q0UVddkbsD
         CHlO2yLwXPdnzhJbhirp2RP78N3H7BFpw4YZo6vbiPHuCdKIrA0Q++5fDpei1vrzafnn
         QXNtHkh6zr21b6jV0FT1C8dluq2HYiCbr06BJ+p5NXwnIFVT3ij+ImaGT3jU0MuU20Cz
         PHGw==
X-Gm-Message-State: AOJu0YwrofTwZ1t/8Crr1t7AntEEHhAdunNgZoweDVDH5Y2Ju38S6qlF
	QnAd1bJFtGlvryCQto+rX8YoOzJQLS7HYKka6+3AS1H2sjAJvhp4M0PkRf9l/Io=
X-Gm-Gg: ASbGnctLw7pwkMO5a7N0hoOWeJNbj8w7UP0h4o0yZJkL0NwcaBA/T73v3/UAEVx+20m
	p4tFMfUg5Nwdem0CWYhydD9VY5fzhEn9m7DyCiPP5xemqFVY7EK9Gpo+HrDZGs0BT2TqqWP4hmo
	YT0uO4+aVdyDRMM/R4r4VpBSwd7fSXGCbGK2/PMEaT4XKo7SbeIugIsWuKfKH3dCyiIFLtoSZKQ
	f4xMJBVnqqn9UARDvkDN2vKENtT77UGjMjDaiwFxh4P4qvuCfk6EKaksDJyzm+Z1oxwYBHbH510
	8UAf1hXTswAdxhVm4Z7dVXuf3gcFMIv3oQxmpQ7QpyzKLkxXYVzbnOCxisA=
X-Google-Smtp-Source: AGHT+IG//gmKFakH68Ym/u3UkfwwsrWj7SdGCVuyLc0MN8ESyV97CBxEak/W1PVtI8h1AjIZxo4YlQ==
X-Received: by 2002:a17:906:a897:b0:ac2:e2bf:d440 with SMTP id a640c23a62f3a-ac2e2bfdee6mr107408666b.0.1741783500350;
        Wed, 12 Mar 2025 05:45:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac287653d1esm628955866b.125.2025.03.12.05.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 05:44:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Mar 2025 13:44:47 +0100
Subject: [PATCH v3 3/4] arm64: dts: qcom: sm8750-mtp: Enable ADSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-sm8750-audio-v3-3-40fbb3e53f95@linaro.org>
References: <20250312-sm8750-audio-v3-0-40fbb3e53f95@linaro.org>
In-Reply-To: <20250312-sm8750-audio-v3-0-40fbb3e53f95@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Melody Olvera <quic_molvera@quicinc.com>, 
 Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=938;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=zkWxc58AATnS1F39ut/pLhdJJwwAOHmg2qN754Tuyu0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn0YHE/hTjAZYMfM+NkZjUgCK9460wjNdgvUqhO
 a2CjG4cI32JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ9GBxAAKCRDBN2bmhouD
 1xikD/0TthD4Yfmt58JlYe3XUGpZFidBfbVRGCIn9eUTuOujGKMu9j2HJOmg+L4tWEa9LQ85Ul/
 zOPy2as7Uq9DaHFlCSrvEdupqpzQ2jzePLEVAgJvrmPnrstvH0IQ5tzkJBjPWN5RhY31f1u8mo/
 NOYL0b/eOJ+tX577x0Jht0BwOHwp/At/vdQ/x6qBimYpLNoZ/Qib2Hh1R4xZgCiYu+OxNBMWN4K
 T7P2y9VHZbRKD69T7i86Qo9OA4Q8DC+p25COCiuopZfO3Aq8M9c7/JoT1IweoE2WYc+S8KPUdvZ
 K3HloKshov11RW9JMrVMlrag2xmxlkTUlFwuvqSeXCBYCmxlvlWKFquTnIFm9wzhf9Jhgv1cYrK
 WKIvrd8iONmsd5rtKlXU/hZrJb/bdrILor8iCu887cUUHblthBDA8xcHdPdkJU5NRQIMQ1exzGy
 Q0Onn4KeH58jlGIeRjgYlNHzBevpwucyyq0KEz17G2AO7Hn0lIqTx+/HnFWyWbSgAxnnaHQROgJ
 TiX5ahzjESym2fHGnF3YC4fwgorefrspGTqKJF3tUFI//pznxYXI2cccRmYQCKvMt3Aa2mhzqsh
 FksV5Yenr8dGvTQ89UQlGbfRUrrx0QGkCYc9bA2wUbYCM6ILLKoB5lk5mhqy9ZlCLP+k649q32K
 WzWyM9eggZvGxdA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Enable ADSP on MTP8750 board.

Reviewed-by: Melody Olvera <quic_molvera@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Firmware release will follow up later.
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 9e3aacad7bdab6848e86f8e45e04907e1c752a07..8eeed7f2f7766326cfc7830002768087e9783b9b 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -784,6 +784,13 @@ &qupv3_1 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/sm8750/adsp.mbn",
+			"qcom/sm8750/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	/* reserved for secure world */
 	gpio-reserved-ranges = <36 4>, <74 1>;

-- 
2.43.0


