Return-Path: <linux-arm-msm+bounces-54931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C91A96743
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 13:25:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11646189D845
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 11:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A125927815A;
	Tue, 22 Apr 2025 11:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MvWbxX9q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA8E277035
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 11:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321141; cv=none; b=ApOWGQABFFMxnnZvtfxLHO/nEAk90PQR/kqKRg5vSTN7Cm9pBFzu92oUemGrnY4r22qCAhme8LuRkPkx5dFD97LeiLMrsVIhMjC4BYqFKhlxMfZqQmhDr8c5+CvmDesETTQ1VggU5wt4RWuj/bg2oTIbuBEJxE1q/2SKHyu5vK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321141; c=relaxed/simple;
	bh=mjcZIS1sSTOV3vBIaA/aDPuvoJjWXpCDTghUnSk+/1I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DIjOzuflfYIO4H2C4H4SW3E5bjpeQk0RPYswhfAFe4wRFJ5PwOq5KVablV/LBUwIsmOVke7kTgEKTImut0R/NSVe2n3A7cJ381yWHCAa6uAxETNr/0VlJOXn7zODYjI2JuOqtQEvgdhwMqKLuJvJNvG2hRrstae1L0a6JpVim2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MvWbxX9q; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-acbb48bad09so257946966b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 04:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321138; x=1745925938; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fe3P15Atc+bTSOXM06LPyzPgb3J7Ws1BpA/wm5ZQuHM=;
        b=MvWbxX9qflME7sftJS3+y51EYd5eCZdc0y9WEftxss4uZaMaUAhkLN8pVUf0EVQDVp
         boVQ/orjldID9vfm1trdNxeNO54rL53BSysH3Tpv0MBdVLxqIHPFgVaimcIhfNfZW7wT
         qyLuwPn99T3wdoy0GleOvgJrXmwvbb1hXBPKKb5UN6udMgAntJ/LzxzAia/vIzdoLGDh
         H0ruj1ePjlttQKHvC/kby8ggC/VGNyeKczWHzGTF8SBC75R34IjxxgIZFC1alMn7Zmyw
         WzWJCRov/PHmjkuwM8/66HLZXSd4vdVQGB0fSPL9PqW885ENVbGgAQQBI6cv7lZlaEEk
         P+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321138; x=1745925938;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fe3P15Atc+bTSOXM06LPyzPgb3J7Ws1BpA/wm5ZQuHM=;
        b=OTsbyRqegruBUMSFXSbM4n8JwpGgVAps8fxOgoJHZ0O7gQQp/CkfzFsNOm1mmA/9WL
         b76cnhPGnkn7a76vYC0HoADfCZKQghEAUGX1ZKh1hqqswaUmBgyf/87AMD/Klp+yR0vM
         lSpA1lZesD9CDoySHdSiAPiFRvH98E0AMU9rqciHpbRahXm/UsBJucB39JE+ywOzGXZc
         nwGDTt9QNPvJa5wpAJFt+5D+V1nnG1SBrLRy5ngaradB8PhCRRpqjqntVrzaqkw0tfs+
         edAzMjSPM7oT0cGgQKDiCz6lUvkhSn6KkkpbgRQUsU4tbUjW1D0Q6fjzwDpHVCWOFP0u
         FXzw==
X-Forwarded-Encrypted: i=1; AJvYcCW3k4C4TDx84EMlHRu87PRg9GJ+FLXDZgLfVnEz80Zl6HK9T76FYzP3LYe1JN8GQ9scOV7868dK9ma2aq/I@vger.kernel.org
X-Gm-Message-State: AOJu0YzW80/lWvZ7uObrNhLZN6GH79+egb7XpQi+QWzFUFQkWqGn2Ccm
	elW7oVk5ype1Yci11SPn9ptGAxP0JoOW3IatJgoaiQqfRLTK8Q5ueSepEKRZJyY=
X-Gm-Gg: ASbGncuDL5AQrmqBHgoxGqLg0CYsrZo/xwhdcELqxgmw0DSYzCRpQsKK8BBTeJ7JHIB
	emt6+f/+liHGSKqmCZK/j8OK+Qk+XJR6+LPOZorXJm3Kt2A9uZ73tChWG6ElaLKBWQntnL5dYuK
	2o31UJbl5OnKF8RL/+Z7Yi07bWVPIVQCAQkHwF6uBH0QBEhxaOz5weK2SNC/fEXxHS8a+ZSxPcO
	GA9QkxZEQn8BpBrMBu+jFVi5u/dWxdyYp1LSDCT0JMyIY74MoYBcufTlm/WiqT6/HRSqDCIJnuH
	0Q8tzcP5QUl6wmFc5o9BdrpyFiO/oBwW+HlGhB8=
X-Google-Smtp-Source: AGHT+IE9lW5g0YYInkFbQ5pngf6VKtN0ACE4saTnFH+bjEE/AkZ3cK9UlUfQkhNYOk92oXCpU/M3gg==
X-Received: by 2002:a17:907:3e9f:b0:ac7:ed72:3426 with SMTP id a640c23a62f3a-acb74d65adfmr1090219466b.40.1745321138071;
        Tue, 22 Apr 2025 04:25:38 -0700 (PDT)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef45784sm630692366b.129.2025.04.22.04.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:25:37 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v2 0/2] arm64: dts: x1e001de-devkit: USB retimers related
 fixes
Date: Tue, 22 Apr 2025 14:25:21 +0300
Message-Id: <20250422-x1e001de-devkit-dts-fix-retimer-gpios-v2-0-0129c4f2b6d7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKF8B2gC/5WNQQ6CMBBFr0K6dsxMUQKuvIdhAe0AE5WStmkwh
 LtbuYHL9/Pz3qYCe+GgbsWmPCcJ4uYM+lQoM3XzyCA2s9Kor1hSDSsxIlkGy+kpEWwMMMgKnqO
 82cO4iAvQs61LqpoLklHZtXjOp6PzaDNPEqLznyOb6Lf+W0gECGSw0UNVYo/m/pK58+7s/Kjaf
 d+/t/zWwdsAAAA=
X-Change-ID: 20250318-x1e001de-devkit-dts-fix-retimer-gpios-bed83169401c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1005; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=mjcZIS1sSTOV3vBIaA/aDPuvoJjWXpCDTghUnSk+/1I=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBoB3ypv5idLYFVDXUdPZ4YXrQTcWQbWsK+ZLCDM
 qmMFAuyb6KJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaAd8qQAKCRAbX0TJAJUV
 Vl0FD/9VwX0a0oaNmU3G2ewc/ieUXpKxf7dDVZUcVQxk8CTrClGkuHVFYYpbvHCOSdxGzlERTFt
 jmsj/jaOYZETTblFbbbKdtpQ400kL6FmQLecF1ODm5p3OSyMnUDdKDka4mhXzIaUNlXSIwGpLhY
 Iq/A5uNU23ygfwBewPXfmCvJN3jywDgVWFg6jtPNdmeJXyXckJVnpJxJKJSy2taURVrFwgrU7X2
 ai0i+U5Yo2Shj0goQgEvqkj3clh3jAvS/3Qifncpzr/p2bSHBySM0o61ibDEmsyvYPXjmcJ/J30
 4ZC7euxnnKsivwjljHAx4kvkQL5y/XG7/0J6sXem563VPjjdskgYolX0NseL3+xZqZeyWdBX1pn
 CnyZzsq+lkosE12EYIeiAWXDnvDqojCpZ9Q3zZtm5XDCHKDJq6r+AH5eW/Q4tk/L3l1dj32YVzu
 kkmPR1uXMkrFrN1D/M4PjPDPV6M4NjH/99eYmts0VIj5lGFupv9WawqThl/RyswNvKfmP+SXFmI
 pBENx9mBUBSxgelpK6NuXqfJM4NNj+3KAQ0yPK74QKFIk5fmbKliZ7NLq6Wb+SgBYFl9RT8J+uD
 OTwqA78c+nLkuRyopgfOBKlH7O9cVX7cXPBXYyiUiG9nJPXeRNRCMnM3uGH8MjN/2joDvBJKpZg
 SmTV2EAplmihTgQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

These fixes align all the USB retimer related nodes on the Devkit with the
CRD and T14s.

This patchset is based on Johan's:
https://lore.kernel.org/all/20250318074907.13903-1-johan+linaro@kernel.org/

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v2:
- Added space between voltage value and SI unit in comments, like Johan
  suggested.
- Picked up Konrad's R-b tags
- Link to v1: https://lore.kernel.org/r/20250318-x1e001de-devkit-dts-fix-retimer-gpios-v1-0-1c092f630b0c@linaro.org

---
Abel Vesa (2):
      arm64: dts: qcom: x1e001de-devkit: Describe USB retimers resets pin configs
      arm64: dts: qcom: x1e001de-devkit: Fix pin config for USB0 retimer vregs

 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 44 ++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)
---
base-commit: bc8aa6cdadcc00862f2b5720e5de2e17f696a081
change-id: 20250318-x1e001de-devkit-dts-fix-retimer-gpios-bed83169401c

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


