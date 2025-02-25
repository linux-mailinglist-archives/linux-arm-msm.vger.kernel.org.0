Return-Path: <linux-arm-msm+bounces-49227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4777FA438E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 10:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82606179AF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 09:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A141A2661A1;
	Tue, 25 Feb 2025 09:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vVchH0s5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8228D263C7C
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 09:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740474321; cv=none; b=K+L1usGopI2Xf97uNaLeRClTDLM7Qa9aJwyNP6muADb2uJ0RFxopAWla8H4/Gv9+493+TO+sOnTbnB1X3SCESlla7435+uT5gZaBL7YcljXZjg6Ff/r7u3FfMccI3R5FqRkePH9ME264PyIzqO7EKk7yylxQ9ci1u9GW4lMllTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740474321; c=relaxed/simple;
	bh=LWZm3qxOUw3fitXbbaWTsu2JiZ5EMZfR2LJDHZNP51k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jyUck9Q6Ql8HGMqN2MeE8nNXkt4Yhg1YVAHCR1MbSTWOVlIRRG+2Vartn6QGU3kNSOQuVmx03yT3GM0KQc7XSfhT1nELLXHIDnTu5T2/IqFaDrfmwJCktUzv8EVYdCPVn6ravKjAUC7hQnGnQfmgMDtDvd+2Tybm241rLOhYsPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vVchH0s5; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38f1e8efe84so1886552f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 01:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740474318; x=1741079118; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wwPYgop4hULDaYUF/JcCRqqdpLFOGbL0rjLbDvH553g=;
        b=vVchH0s5nblLPTgKQMJO/yzqERDtZUtpLLPDjdRI0rYX8i6W/urSrxE4LgsmRTLtyA
         xrmFabJbONDM2A4JFq7mGDlen/ZBIMEm4ELssPiRW+KORrhOS//ZZMM6S0Rg/NXSnwxs
         R5JqImPZZKNRk8DBnEupclS4xj337iuAl5h0Gv66XEo7mAXzkQyuxuLam32p9/5UTobn
         Kmhxun1wzJoLzZrvrq/ui/tSMda6xc436CSSCtJ1Nyp+3R21bBEcpq8CSTE0ZiVJ7hMY
         Zhb7z4s52d6VGm2p4//70+G/zjGTLBl1zlsSBZEKZiEMb8O40RbVSvZOOmOusObKNOfE
         Hwgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740474318; x=1741079118;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wwPYgop4hULDaYUF/JcCRqqdpLFOGbL0rjLbDvH553g=;
        b=ZgKU63kbrVO940DZYqg+qtBOsvi4MajKN9DllkTRRurV34y3tPdYIYmJpl9pWBWz1Y
         VOp2YdJG+TE31jNsy6MeqphGbbgOoO7jL5aF5urvgo17S+xp4vkgD5saLojdYWcFhmaE
         KMQweZhu/bj9zb3glf02mLMZneA6zvQImhDU6HAlRdjrac+B4rFrkeoYGz9r8FkZ6EkK
         +xN0tPtArXufzsUp8yaiLwKLthljB+ESSOVb/2Bl0Is9dOedmlsK78V9oXCNvs0Escg9
         b8jbI/LKlrQnzizGFUURr6X812OMhjgEo65o2YtezwvMZjn/eYOn1PMDs02j6t17cvLi
         YLyA==
X-Gm-Message-State: AOJu0Yx27ErDoa4mB8YbvaTHH5+52KapcvDrVDeFhzWLK6U8cC4AwfPn
	tdhqB8I+Xh03ToR6TZGsgiuA8ygx5YM1pxC6nYnwky5IErCsg9EixfzP1dTrLMc=
X-Gm-Gg: ASbGncsBFeo/5TsUdwJ35tb+xHpjptrvFm+v1x6sPRO8PMZuUpWKXrRfZWgh5wZ3sUh
	+YWnVPjqqhW96jKjNDj/wx1bQ6e/hGZr51J3KW9/8vZ/ASht0kr7z3yAHqPt1O7/aHmAeEiSUe5
	9S1cYPPUibhMcNfye0jTka9aqk4CE4z2mR0QpsIQ6qSVQhCwp+7GZNd9d5pArIC9lCLbxtQLWc+
	xFPCCRc9gpthqvwIiIe4d/jYveSORX4RxL5Fgah8lc5bnXys6t06iTz2raRjcadyxS5MqNANZea
	GU9a8iUa9+RD2QX9brDtXkPVGmQiwOTUiO2AM9fy1RfEzmw=
X-Google-Smtp-Source: AGHT+IEEOAMHJtTh9A7UnsNCkf+awn98CeW+x9MzjDDROY5cvK9I7y+Ghubo1xqkoT5BOeZsJ2kCWg==
X-Received: by 2002:adf:e7c7:0:b0:38f:309c:2c5f with SMTP id ffacd0b85a97d-38f6f085f21mr9216442f8f.34.1740474317834;
        Tue, 25 Feb 2025 01:05:17 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd86c93bsm1573540f8f.26.2025.02.25.01.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:05:17 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/4] media: qcom: iris: add support for SM8650
Date: Tue, 25 Feb 2025 10:05:08 +0100
Message-Id: <20250225-topic-sm8x50-iris-v10-v1-0-128ef05d9665@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMSHvWcC/x3MPQqAMAxA4atIZgNtsFi9ijhUjZrBHxqRgnh3i
 +M3vPeAchRWaIsHIt+icuwZtixgXMO+MMqUDWTIGSKH13HKiLr55AxKFMXbGgxkm8EHP1R1Dbk
 9I8+S/m/Xv+8HjbvaYmcAAAA=
X-Change-ID: 20250225-topic-sm8x50-iris-v10-a219b8a8b477
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1621;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=LWZm3qxOUw3fitXbbaWTsu2JiZ5EMZfR2LJDHZNP51k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnvYfL9d0m3GtptH/raw/Nj0mRgdU+dGYg0VUAAxMN
 V/HKUjSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ72HywAKCRB33NvayMhJ0bYID/
 9dO9wSJsdpJvsCAi8Et8yNY/PfEJAU766vwxZx4nUpVDqDjelnL4qbhSEUMwYizMXM+B9lyIeg0m1e
 LuKlcri9s/nEnLHujqI9wzXc5mcGbDn0KvoCtMtIjg1bels/QfSpTNXdJXTKfre/5XsTX3wtg6WOlF
 qn98wUxqAQHfQrgWFh2LuO97meulSzwsbph/EweNAhVzBBheXGPC+5a1wBspcTDyKJ4UP51XXaRfDY
 EAJs06RpScdtwhk1Ls4xwEJFvn+TZyE3OyT1hLzvdqnyynwobQ35sTK0LFkSJktjECrHS+nnvPST/3
 uWz3tDKqoGhBVWBfZQYQ0ksDKYPCteK17LvpxD5fB2DD44V919R59H66PrDRT38JObxGPYdNtVD3+k
 zOnaXRPRXDG8fT9UkyEn+P6k97fkb9q3k2BcffAME3BElt8vVk/R17tzdMFeM2IjNcxu3YNlrjaLPi
 FUWM628BYTWCJVZsvi8rV8JMhF4dTcCvJAcuB+NDxCdrv486rv9ukemqUAUvuBXp2f2MZPKx4mfnTT
 ri7WZp+a8/pehCu7s5CykpNkGVTAUc6qzqkroRqF+OgDkVmJm5+lR62D62odob1IC+lhjhSEYjxsSw
 ikohUb++XtjIvP673umb0zFousBzDp6nnLvW4nOPBOTV5yLGka9Z5KUS235Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add support for the IRIS accelerator for the SM8650
platform, which uses the iris33 hardware.

The vpu33 requires a different reset & poweroff sequence
in order to properly get out of runtime suspend.

Based on the downstream implementation at:
- https://git.codelinaro.org/clo/la/platform/vendor/opensource/video-driver/
  branch video-kernel.lnx.4.0.r4-rel

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (4):
      dt-bindings: media: qcom,sm8550-iris: document SM8650 IRIS accelerator
      media: platform: qcom/iris: add reset_controller & power_off_controller to vpu_ops
      media: platform: qcom/iris: add support for vpu33
      media: platform: qcom/iris: add sm8650 support

 .../bindings/media/qcom,sm8550-iris.yaml           |  33 ++-
 drivers/media/platform/qcom/iris/Makefile          |   2 +
 .../platform/qcom/iris/iris_platform_common.h      |   1 +
 .../platform/qcom/iris/iris_platform_sm8650.c      | 266 +++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 drivers/media/platform/qcom/iris/iris_vpu2.c       |   2 +
 drivers/media/platform/qcom/iris/iris_vpu3.c       |   2 +
 drivers/media/platform/qcom/iris/iris_vpu33.c      | 315 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  14 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   5 +
 10 files changed, 635 insertions(+), 9 deletions(-)
---
base-commit: e2e6906b4ed2aae7441754b28db63dc7ce84d779
change-id: 20250225-topic-sm8x50-iris-v10-a219b8a8b477

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


