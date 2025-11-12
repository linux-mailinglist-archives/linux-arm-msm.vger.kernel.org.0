Return-Path: <linux-arm-msm+bounces-81458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB44C5300C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 16:25:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26EBD4277D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 15:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B36F3350D77;
	Wed, 12 Nov 2025 15:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IK+epNR8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0CF350A1F
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 15:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762959775; cv=none; b=pXe8u71yEvVZfL+21zJTIJZIhFUntZkZTaimj5jdtiBV0eXYbmERkdyzXcij3xzchWHL7mCU4T/2wJ5wVjxFbY+9fUYrT1VTq3h6oXxxNaMTGGxDHo3qtTBq13bbHxyMTvoGMoTFZ8ubhSkr8ucMVWgU8PN8jzjzQntDfu/u9mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762959775; c=relaxed/simple;
	bh=HE5YbcsNS4jmWAOg2lcXsIcrJZ7BYruxpSyyrBzFsXs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pow2kFjuiR4PSvs5OToVKgKKHKLsZLHai2IodsoCRMMhMOm6/AfX+qDxU/EN8pToxPeeKKOhaljcwtAofYGrbUvudCiYOW9wCHHnLTTGKYoNkexsauSCGfsHJJz6M584dmSFCt/uY7btqTQU1t92LH+9z6wWp7T7l14EmLTVKF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IK+epNR8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47776c366ccso459325e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 07:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762959772; x=1763564572; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RYC+gren7S/DsrpYA960+3xoMWr2GIngvSyf9LyJ6j4=;
        b=IK+epNR8QzUgBp+2vQwIb7UbA26WDuZEknyxK+3RwtSM2GBd18bA+oZw8kfG9qgVU9
         gCXWeEffD0Md/PDCEnv2qNWvkw2KTujE9kB/4wkwGNJvbue/9uEMRU8T5uU3tvJPROf1
         uEy4+QWbk3ijQTCvl2WJu4aJXNEeWCUezJ3cFmSPqCVUc5oGKUKZNS7Jw3Nx3Chex+ha
         6S0XFFDdNs/cTHx5Zx/ewgeH0r9Z1+6vi5Qe9O+1mjTfHRf3udsDeCnpPRBGAZ55VM4k
         vROGayjT6gM5fEudJ5YG5Wz9jbWxkmTAk5J4mjDBh8HFYteNCSxd+J/KwL2EY+/TefMy
         tJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762959772; x=1763564572;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYC+gren7S/DsrpYA960+3xoMWr2GIngvSyf9LyJ6j4=;
        b=Qj6a9XzKRswLclInHXefavftok9gEN29oKKjGTiscviihnLYgLkaF1oNGEvbWgSozK
         CGhhmeNLY25F4KOVyrA5ihHwRW8gQc25i9+OPuy17QtR+Y152xh+ZT4IOGRFpIFQvb+4
         6oegnclML5stQXYt2S/a9mz7ZXEoPbVJwMWORYAhj3Y5eWWwBUbv3YEvVw8AEN5RXpC2
         nSgMmXr4PTgHisBghkjYpcoljrKVs+uDBe0ouoilYyHFCrHj0VhJk6iZwdEmHRuqEArF
         5qRoXEZql4niFmS/8pmjt6IUU2isqMBHmCC2jCEDj1dT8ytVz7/Qg8u6/ORwhTkat98n
         RSsQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2PIuydxQjU16qFD1rJD68u/xk3t19CBMHZeVbEK9vM3+h0FZqrb/aEoNcd8sU180FumPgZO4jwnLCbee5@vger.kernel.org
X-Gm-Message-State: AOJu0YzOpwjEvJkHUEA2g8d+zxE9oYsojds53k/Rkxt0ldDuSNFxAhlo
	mukmRBseoHFe8KXhkjkqOh8HN9sWY6kYlCppm2/G311K2v2AXxPlGIpGP5ibA6uJ72M=
X-Gm-Gg: ASbGncsLpSv2/u0jt5aaMiNBsxbAXwlwm1iupeLN/ICap+rYu8FmZJeLv+iAX3LAVEX
	w5k9HRMSnd6sTXvJYV6Thg/7L4zZd3gpkUYPBcYUJcNtM2uK9/w1s/cvnhRVqZI8VqePh3pHCgT
	rIxUL0wKBDdzxF5/nfSbe0xB3Gdn6exnGhPNH1X2n4uM2tlR6QhiufG8+jrIQ1E5WAQ3VTvO5hp
	w1Xfb6hgnq65Qgw8U9uZMQucxZE+RBLH2kgnO0dqdVFQzehJVGHVAS9Jg0T48+yMGPhnIxLZeMI
	srvqxSYB8ozAjcXcjEgriWAY32ANspnNz9yzOs6O5WsVwTSfspiiW9rvwJmLvE99uz2RWtzNY7S
	X1jiPMmrwJKY8uVFFzcnqKFaUlMBgOYRgfGKw4rKfRlQMjn1mWF1RVOPp+o4aG052Y+W0gUSJ7R
	kbySnk0XdWdTJsgDt2Ry8Hn1sQRHQ=
X-Google-Smtp-Source: AGHT+IETzVE2VKwqFVH1XqBJLCkHBsPLTIoU5dTY0nKMzwvieSfZCkPkcXhxokoy2+Ls8Ec6/kdKEA==
X-Received: by 2002:a05:600c:1f8c:b0:46e:36f9:c57e with SMTP id 5b1f17b1804b1-477871f41e5mr15998705e9.5.1762959771899;
        Wed, 12 Nov 2025 07:02:51 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477889be9a1sm15134355e9.6.2025.11.12.07.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:02:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/4] arm64: dts: qcom: sm8750: Enable display
Date: Wed, 12 Nov 2025 16:02:37 +0100
Message-Id: <20251112-sm8750-display-dts-v2-0-d1567c583821@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI2hFGkC/32NQQ6CMBBFr0Jm7ZjSFkFW3sOwqNDCJEhxikRCu
 LsVF+5cvpf891cIlskGKJMV2M4UyA8R5CGBujNDa5GayCCFzISWGsO9yDOBDYWxNws2U0Ctc50
 ro5RzDuJwZOvotUev1ZfZPp6xPf1kR2HyvOzHc/qxfz/mFAWe3E3K2pwzp4pLT4Nhf/TcQrVt2
 xt8m3kkygAAAA==
X-Change-ID: 20250424-sm8750-display-dts-447473a33fff
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan@quicinc.com>, 
 Abhinav Kumar <abhinavk@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1126;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=HE5YbcsNS4jmWAOg2lcXsIcrJZ7BYruxpSyyrBzFsXs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpFKGT5cy9NK5gxIgGywCJpipAZUKlUKDYxSuhI
 cDAIMtSLfyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRShkwAKCRDBN2bmhouD
 1wxqD/wJPdhcDm9HXftoluK3u74i3UK5rzoGpCJcl6yQf66ihGOIdOjzSPnqYy4SzLS0NloclHs
 YDE6uzrOBhk1I0s9urDir12aFvuMkN9Ad32MK56L1qMO7OvPgW0BHAsnz2/C68Ygi3+n8FsTCm5
 AzmPtP22zbosvBEjOefRhB7Rf1ZOSFef+M5T+pfX38pRUfcDYocj4bW3wdA1k+0cH1sDk1NABL6
 KX3UBSgtsVgPhc/2C37oNF4SRSankZhQGkWocOUFSu3b3uHQvEOR9lfN4VSKsQ0ZOTXIVYOpJDq
 gq4lib2EoPHc5GHQ1wY8caOw0v0PgmZXCtpr0PErv3A0lOu7yqEOPuH7meBUEdLEhkGGWIliCGf
 JmVmXgwpCpO1jDkPko9+/maU5kI88WtmNMaIyiYRPxmLbTTOdVqdW4KUfywPrxgIQls31MJqgEB
 105WD59TnYU6PswyqyRxxi9nAAOLDiuz7h1Kz2t4H/dySk40TAijJCnJBVqN0XbQStdI5aAzzcd
 uYCNgQBdDTznD5c9kAjIgi7eRyadq2xxS2hf6T3eKI6p4Pi8OfoF7c1KMu3ET6YVSVvsaTa/9ds
 4jbMK6rZH78WaObRdL2Q4cwt4HU/o/wDzNjbaNKb2hZIVUXEbRdAr3+Rck8nJYyRgeL3xdmfZKo
 sOeuVzp3Uf6So+g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Changes in v2:
- Add Rb tags
- Re-order nodes/sort by unit address
- Add low_svs_d1 opps for DSI and DPU
- Add DP Pixel1 clock (they were added to other targets as well, also
  Abel pointed it out)
- Some context changes due to dependency changes/merging
- Link to v1: https://lore.kernel.org/r/20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org

All dependencies, including bindings, were merged, so this can be applied.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      arm64: dts: qcom: sm8750: Add display (MDSS) with Display CC
      arm64: dts: qcom: sm8750-mtp: Enable display
      arm64: dts: qcom: sm8750-mtp: Enable USB headset and Type-C altmode
      arm64: dts: qcom: sm8750-mtp: Enable DisplayPort over USB

 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 125 +++++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 439 ++++++++++++++++++++++++++++++++
 2 files changed, 564 insertions(+)
---
base-commit: a8ba620487d1fa78a0b1f96622f0167d37c99054
change-id: 20250424-sm8750-display-dts-447473a33fff

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


