Return-Path: <linux-arm-msm+bounces-26890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7B2939FEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 13:30:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 676441F23188
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 11:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED5315383D;
	Tue, 23 Jul 2024 11:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FernzsGF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965A7153506
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 11:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721734118; cv=none; b=HOO3neDbqjF/FhLfugCqip6+IWQgFFBmJQIQN5ZsixQ0RXD/kHPZsgfD8LPFs3Htuw78/U2mlB3W6WchISNgb93+MhPferNMahgII4+T9ZG91oVRlgh03PUHTYZWYNobBoyCsyQOrx3g7C0ExCkZBRY/ymz+zzOk1cS0dv0TT0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721734118; c=relaxed/simple;
	bh=a2+EUYLCKOR6NIoaXmWAu4yyImuZlx1mXeql8U/eW/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jImCEOiRfwyYnA5cu6dwe03L8O2jNCodds3HKKEUsNv+Ej9WoZSQev3tXz5By2keKcQyNikGiWMXUXATjfu5BQjhczFyLQ9Xs+aQ6FihY/7j4YokCHIe/YeRk7WVRAdMAB+PONErZO3KCk5og2+lrnYdzjwEVR+eFck+fP4WQmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FernzsGF; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52efba36802so3570160e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 04:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721734115; x=1722338915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XN/Oo60J4+8zWx2Epgt9MKJ7ZsIFjkw3WX6j9IKX2Lw=;
        b=FernzsGFk2zF3s2aJ6If4HcmCytCWPDSPdyUgsn1RZwo4dsq9yG8igM3ZVhTPHTKbH
         v4+697O9JL8RPKMOrIITPgt8cxCGpX6eBw7bZ8Cyxt1rtzAmjcqVEqvS2HhJFIxCOijK
         mgutb0T7ECVMiFLfMX3NxeQU9JArfUHqd5A2vs108KeApb/8zIygTWU/7B2txntsDb16
         el5jy/vB+znTLyMrtTSAWHDdYErnYIBPFR6gfIBA+tY4AxNa/iJp9WZuQGJEeP4JvPNI
         77A6u/B72f2wMUsOG2+w1L/8irdj0LgTfkwKfFdciqyICrPZ5UFoCaQc4w1MUc2e9+f+
         b8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721734115; x=1722338915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XN/Oo60J4+8zWx2Epgt9MKJ7ZsIFjkw3WX6j9IKX2Lw=;
        b=VW9ybwz/M+jC+coSvnLuIzUxHUM99loUObl4pEfRpgmNMSAjS3TB7hV9sn5ygzS0s3
         x3xK98S+MF86bG01Gm51yy3zbARXDdXfHsL8VlLy7YTX3K47okdDv0PH1r7SkNTY9RWm
         tEbWNonLqXtC9bilhwMDx6Wj7z1BmKnDCS6EGGgbalLftc/yjECaINY9fkV4quY/ynnQ
         1bXWRvg5yul4eAubvnREmyNVz5GRVL0G6wlUrMGYBnci8Vcr8uO9uZ0T++C7JAdWnlkj
         XF0RVCib1ItFnw+nBAhCUZmPsI9KjMqhwQ6uWWcqHFSXPzuOtU3gFDCifIHqGjvF3rap
         Ns1g==
X-Forwarded-Encrypted: i=1; AJvYcCX5t19cCajz+TCDZJ2g86JnjFt1YVmsShVs1KFx/Xh/LnmsWZXBcht8OPhcZ0s9X6oWHDRlVxJzMm9cel8Qc1eGUOP1sdYZeNZy0FsK6g==
X-Gm-Message-State: AOJu0Yw0tKsV08pIoFSWHIBb/j90rfPBVBnrluAmn1+YQXndKNoTgYIp
	O4bjz2vadYS5RzZc5VSUy+dbw6KEEDsq2aGx9J2uya+1Tqfn1+6W6OvSwrgV8oTgDIYqT0Zf3tG
	H
X-Google-Smtp-Source: AGHT+IHZ4SNX1IJU61aqbqXVevwcuxn0D9/W7HRDjcseUylz31yjbfbqoDGMI9sbBMgOUf8EpK5u+g==
X-Received: by 2002:a05:6512:3090:b0:52c:f3fa:86c with SMTP id 2adb3069b0e04-52efb63e08dmr8512771e87.18.1721734114948;
        Tue, 23 Jul 2024 04:28:34 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52f01552b43sm950871e87.286.2024.07.23.04.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 04:28:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 23 Jul 2024 14:28:32 +0300
Subject: [PATCH v2 5/5] arm64: dts: qcom: msm8998-lenovo-miix-630: add WiFi
 calibration variant
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240723-miix630-support-v2-5-7d98f6047a17@linaro.org>
References: <20240723-miix630-support-v2-0-7d98f6047a17@linaro.org>
In-Reply-To: <20240723-miix630-support-v2-0-7d98f6047a17@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kalle Valo <kvalo@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=886;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=a2+EUYLCKOR6NIoaXmWAu4yyImuZlx1mXeql8U/eW/E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmn5PeXU3cP3R+6Uo//wauRJbqC6lUYsQdY7gJE
 gBk4EHA8+eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZp+T3gAKCRCLPIo+Aiko
 1T3IB/0e7XlZ2Mcy9jHD5ogSshyFXiLctVclq8+dfud05oRBRI4QOirixONwAE7kZMNWdXSdj3A
 1WHg74uaLerSnoOKZDdfshc0CKPFknK0Gc1bMk+cVty2QL3SUYYSXfJP4yOJVYiwCOyttTudMpM
 0D3+iKD5542lOWtGk6n0P+D9EMoGve1g+FqC9ey8q2bEH2Qk59AnTe5nIHZ+YXrtoQyxKq5OiF2
 zLzZYqGDUnst/ZyDKNKR6atcZYHxHaPdTweZ55iRWoYR3/H7vpAOOQMi4JWU87YHfiJOlz+mt/V
 qgTRb7hP+Ji0pikqkzl6EDQjnDCSYaX8bLtjWuIMfa4gBwGn
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

As most other board Miix uses board-id = 0xff, so define calibration
variant to distinguish it from other devices with the same chip_id.

qmi chip_id 0x30214 chip_family 0x4001 board_id 0xff soc_id 0x40010002

Cc: Kalle Valo <kvalo@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
index fad5f390171a..901f6ac0084d 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
@@ -99,3 +99,7 @@ i2c5_hid_active: i2c5-hid-active-state {
 		drive-strength = <2>;
 	};
 };
+
+&wifi {
+	qcom,ath10k-calibration-variant = "Lenovo_Miix630";
+};

-- 
2.39.2


