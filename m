Return-Path: <linux-arm-msm+bounces-51161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FCAA5DDB5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 14:16:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 843BA168287
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 13:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7386024EF9A;
	Wed, 12 Mar 2025 13:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JyeQ9ipD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A784924A052
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 13:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741785275; cv=none; b=mkSMMCkyZJchX+Tdb2tv1xpEFoayQTUlnWo6xPkp8ROde8io1Xhdjyr4rWekpqjyLWjgbQy0aXa1YiPUqowIX7VvX5hbDiTAF09MswbsCjHpBLkbeofI6JBrwQbRrzzVQrYUm2XoA1z4Wryb/pSYV49F7JcEESmvM0Ekl39RmGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741785275; c=relaxed/simple;
	bh=nVhLu0AiCCxQH/soBCHuVFIETyl7UMc6C9vhLI8S8To=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uZTKQvbPEwpgUTYPeSOwISFGa9k2NX59LwHMnU2+IVv1lc7GYi3aYgRYttkV+tjcFU8SXXIPRQF7gMzXizMnOO3apubHG94VHD75GWMB6BwBPdGA1huV2LHoXc0Afsl9C/gwE6VnCsjpdWU3NNtj7hjF93NgFMy9DLgq3ew65Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JyeQ9ipD; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43ce4e47a85so5168855e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 06:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741785271; x=1742390071; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DjLNng74rhxdSjD2x2QVGFVe11P7mYgAEe28w7w2n8s=;
        b=JyeQ9ipD/n6d0mbr+URAaqyLKLaN0x0XiEE5JF4/crS90y49JlhjVayJsx23mJuNN/
         YfZFBq7tSNRY/2hp4b+sXoQKmsuyAkG4gX/d3x2CxIumuzJtZ4KPrP43/5BgZD/pgji2
         +azQ+AmbriK2cWxoEW0zECuKkzWVSA9dLNmnRPzleGVs7cIsx1Cgw6UzrE6bu/feoMhw
         0FJtK7xD5aEmvyMngS7CptnFkSsdNJ5U/CAzwOi8BGA2rH42O75tRmiiV4010bO68M+1
         8YlI+S4NWZqWwE2gSw4DE1md7ppzWluSfdIY0DmSbFgMleLQOQe4mdpmg712MoCxu0Hm
         8YvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741785271; x=1742390071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DjLNng74rhxdSjD2x2QVGFVe11P7mYgAEe28w7w2n8s=;
        b=h2d/8RRKPt31aX/GVXKYMt24el65gOyo2yMc6tWdXOIJrQwJPdxNTOc3P+aoWD7C1Q
         XKhWAw5eOAKB6KYOSv460/mQnHCBZwxCqLaBGtKVk2387hSjxAAUH5xbUTfm+fL/lB3b
         eXLOOpUsHdbA8eafcr6ykqRc5czAhB0U80gjZ2NZsz4+wqmi7sylOpUNOyNeRZkSC/Y0
         Qd3QeHZ+NKbNy6PeZEygjEtiQxTrmWSgWtH2OB4/WGxhHjTal9Irlq3Uu0z08dczEy18
         C+Ri8Ea/0Dg+TkrN5Ztc0lH+EG6gZw6khb/ogXFGv6jNbY7quU/mZpHMy+t4/M7OIEIl
         /lOg==
X-Gm-Message-State: AOJu0YwmL9WMNzUHGuJ8OxvIJVmkbBLe+uozft0aFy1pu5Zw9+Vn5OeH
	UBeAiGc0k+Vac157T8p8BIwrlFI3vUbd4sVD3TF8ZQ6op7tPzhVcm3ZUDkND4DY=
X-Gm-Gg: ASbGncvL6e7wA5HeRsGXq1dqtsHxbhJYeTiwnMzADtg05zipfHI5MVVYtFR+awKJrcv
	EgKxKs878qLDbSXjtXQShV+PML9XBoWwLmGkq2mB4UibkWD6jO6kWpmnHZbd2jm47ZYIj1yQng4
	3rY8Lrx1Gp6GhRLiIGL2/SMwhiAsZtNT8HAGPJfHfYJkiqxpqfqBYKQAzGVrjwDu0C0OGIcrkuG
	E7prsSOqTnvnLuDq/GtLAbdYBIIeML52SoMKStgrRx7KGxbfrTdOXZdztjA1MqO07D82S6sk7qK
	CLbYoteVomPKHHk8nSIosThNtwS0h89HNdNnnH7vE/fflc0nGcuaaBFC4yZOAlvqpOvnDw==
X-Google-Smtp-Source: AGHT+IFcSsyLGNx3jAp/L9UhztSEsOPv+d8/sK/Tt11tO+NPvboilTmw+z2ZYcBHFz91ri7g18BT2Q==
X-Received: by 2002:a05:600c:3b13:b0:439:9595:c8f4 with SMTP id 5b1f17b1804b1-43d01b8532bmr32868255e9.0.1741785270948;
        Wed, 12 Mar 2025 06:14:30 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a8c5cb4sm20966745e9.25.2025.03.12.06.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 06:14:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Mar 2025 14:13:59 +0100
Subject: [PATCH v4 3/3] arm64: dts: qcom: sm8750-qrd: Enable CDSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-b4-sm8750-cdsp-v4-3-4925d607cea6@linaro.org>
References: <20250312-b4-sm8750-cdsp-v4-0-4925d607cea6@linaro.org>
In-Reply-To: <20250312-b4-sm8750-cdsp-v4-0-4925d607cea6@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=884;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nVhLu0AiCCxQH/soBCHuVFIETyl7UMc6C9vhLI8S8To=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn0YilSFV4+rZ5EaoK/opYGJVAgzDMv7iJQ7lLG
 jidQ3zCxSyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ9GIpQAKCRDBN2bmhouD
 1+x7D/9jN0Ca6DwYjWyH0D5qLQb8Tkj7YuS6mOCPfgVelRiCelTICvyk1vJ7ytQ375n/ORFovgk
 rs7aEcTk7xOWiJyQmtapXkm1I8xvBjJHImz1YVbDa6RTte/713sk+2fRpC2IIgkX+OTgX2BZqGc
 yKztVdQNrkdo27pf2tpI7U+JWQAxlnu8003du56bdP8OSLKvruKQGcXH+AW0wWJwFYhUgMEuGnd
 u4keliH3NlL9RRGBVpywU2zYJ4oVkcT5KObo+PPOUQjrz5B7hoayGMhxVczhzEvwFQT94vb4BXc
 5QK0OujZLE2u1F78bSn3eLvC27D5xh7VB41P3u5oXMo3QiF8OZW5oqH48TZ5Iw97o4QDORezVSq
 Fi1QMl3CCLLNXAk1PQbWI/Xd7JwpE7RfKqqsEZfe+4OGCfRF1QBACYt3cj7jiLEgFDjVvDIoTbj
 NWHKqYCL0yrl9xYTxCDlsIshQmEsi7KgfF7RNHYoT0Bju4a3e7VUdC1tFFLOJOaE+dmOYjPGH20
 JgFPzjG8hrFPTA63tV6+Btl+Pd9xMfNnkYFVxNmoICErcNdnXdHLO8XiIqXyLJjS+Ff/C+UZXMs
 nzqI/cpnJZdV/sikSY9qHqIHRpgzWMDbrMh3jvpTMdy1NlMuBb02ay5Emix8nrwQF0DAey9mwIm
 EsMa1tFPkTmRN/A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Enable the CDSP on QRD8750 board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Not tested on QRD hardware.
---
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index 341774bb042ff88af8acf49c2f0ef14f9994dfc9..7f1d5d4e5b2813c59ea9dba2c57bee824f967481 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -789,6 +789,13 @@ &remoteproc_adsp {
 	status = "okay";
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/sm8750/cdsp.mbn",
+			"qcom/sm8750/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	/* reserved for secure world */
 	gpio-reserved-ranges = <36 4>, <74 1>;

-- 
2.43.0


