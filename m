Return-Path: <linux-arm-msm+bounces-21914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1198FE671
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 14:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 027BC1F23286
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 12:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940C3194AE0;
	Thu,  6 Jun 2024 12:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eNudmZPJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF41419580F
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 12:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717676781; cv=none; b=aHgAOrV1ZKXyazHe49//y84GfKClHiGU8XhkXO+dzU+wCtRZWd3luRUsF/4YdSACPEmslZG2I5tW4ZJnshqHrmiiu86/LZrngvEoFtBDRNxXTe+vkjsN0sj6wzHdKHSrfr1BsmzxV0kkvbzzWNhOxF9Je/f6eIPOu45Sj5QAtk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717676781; c=relaxed/simple;
	bh=igd2ZMr0xCbNbEsiWofsuTjgVc3ffaGh82okIEZzyM0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KFIQo5TcwXaQDn98qyl1e2YLPTtC8LEIMKKdDQbsYVQd+piVDCrHvwZ4AWrrpJNXTdnx1xJ20Ya7B62iikgvZbw7BeC9UnWEejWz6qPZi719N69JhARY6C3JpTWWlnYAMX2ju7+7su0DM/lhavl69R4sFPeVuzbzGRBeKXSitJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eNudmZPJ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4214aa43a66so10166365e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 05:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717676778; x=1718281578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FiI3m8vqYXd8PfuguZOQIaxz1AuCQiEaVMJX02AGxvE=;
        b=eNudmZPJTLkQnOQ24gt/Skk+1X5/sYUK0Oz0DoCYxfXoFEqMUP0EXp3iofTqpXQJN7
         wBf2iRCeppQwBRQpjwTisrVbqemfYvgjDFjy43atXNFWxs3Q6lGqitIJHr4yHDV3sMur
         iB+lLO5ZpKHZhnyawBNrEykxXi4quMk3u81iLPEyW2pFHdD6GufZXQDgEi03378X0Sg7
         AXdCJXbjYGqedFzgpzOvfSOUu4BMEgDlmERVRn2tW+U36DGYz1yN6ICbsaTBgcFg5yMz
         D4CeOaEIPVhltsCaXU4NNBYq0p9ufXJnJSn0zERf4u9HfI/wNSx+MZGxm7guYeNfbJJa
         kvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717676778; x=1718281578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FiI3m8vqYXd8PfuguZOQIaxz1AuCQiEaVMJX02AGxvE=;
        b=Z70tLE/D4gg+G1avEgLT7qEVS9VZea5LEPUIa1oHizMJoPhuCjTNU+pz6L3D7CbEpI
         KnkQvV9aA7WSmpZEqpBJnjPTrDpfNvqQDg+UGr6YzgsSxj79oeV4j6ZF5w8sQ5CcL+SE
         /vgV6I27X2/XVPFMNoEZ5rFtSDfHGKyAN3la8M8nDUmHoam6B4rkWWGrnxMbU4G5uSJV
         zj/djjcmy44MZO1zZPKXKW4vMIBwNArFJDgOdzsGztiYc7/Rh+iY1DE5twdPETYXBGwj
         kEjWazEpVD9J36SHpO+IE+fj5ls18NW5Sj/Y/Sdkk2PXbjOgMBwZPAQh+PvLBPZRRlJc
         cKYg==
X-Forwarded-Encrypted: i=1; AJvYcCW25ONG0rZMFvrgRDkOhnakqoWY3D/YTpmL5mlI1HjFGNIB/za+V03oEtr7ZQfjhBmDvQZPaU6IxTHLLfZXq+3zLMRBtx5D39r3eZPCow==
X-Gm-Message-State: AOJu0Yy9qpj/ySAFZnXlif6CdF5DHvNwgAgRZnv3eFUvPWKsMDJVW99G
	gye7LKzdaJj8uprisQHUBeCrmEv8sNAYaFQKbhxHRkw/G8OJByX6lAIbFEUKtAg=
X-Google-Smtp-Source: AGHT+IFnjkCpfDikXTbxZhi9pEfUqoheqQ3gc9c6YsNTpVYqcAirKQssG5EKsEz7UrcEhq9RGKfeOQ==
X-Received: by 2002:a05:600c:4c27:b0:421:29f2:8e4d with SMTP id 5b1f17b1804b1-421562cf261mr41990315e9.14.1717676778212;
        Thu, 06 Jun 2024 05:26:18 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4216412972fsm275325e9.47.2024.06.06.05.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 05:26:17 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	lgirdwood@gmail.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	krzk+dt@kernel.org,
	neil.armstrong@linaro.org,
	krzysztof.kozlowski@linaro.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 0/2] ASoC: codecs: lpass: add support for v2.5 rx macro
Date: Thu,  6 Jun 2024 13:25:57 +0100
Message-Id: <20240606122559.116698-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1039; i=srinivas.kandagatla@linaro.org; h=from:subject; bh=K1mJNZxOIlhm1uxG3APaaUP4eSPSxJUaQjy9GT5ncJw=; b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmYarX3/ZCfd3+897zKJBq147tlwsUVTmwyuPdF LcFsxioHEWJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZmGq1wAKCRB6of1ZxzRV Ny/TB/4v2jd5jJxptFB5xKmvnQoU8xf6CUtH8dTh82WLx7FLpAyrkguvQt3F0F+9Lnk3WU+iepf /Q7mJI0PJWgT8Zwc1tazHbXa57U/4tCbGeVNPaCQBIMmHxDCbXena98So/8/XujOaToMWWY+vKX HcY1Q9J6yOdoPGsLbWYO7Xn1N/RRrrnLLT9sTA4nlPYcZc38Zcm2UxQR59CnCFJigmh69NGuIdC 5ZJ3j3wSGrZUykiBgwrmdLcqPh0XuoS2KNvJU/8ULL6k89eYEwu9gozjJeADyCFyHjZheDihm0J oJqBImXFL7Yu1z2yR8oTYWr+oX6z8E8+zTFtpZ119oaQLe1I
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp; fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

This patchset adds support to reading codec version and also adds
support for v2.5 codec version in rx macro. 

LPASS 2.5 and up versions have changes in some of the rx blocks which
are required to get headset functional correctly.

Tested this on SM8450, X13s and x1e80100 crd.

This changes also fixes issue with sm8450, sm8550, sm8660 and x1e80100.

@Neil Armstrong  can you pl test it on sm8650

@Krzysztof Kozlowski can you pl test it on sm8550

Thanks,
Srini

Changes since v1:
 - renamed all 2_6 variables with 2.5
 - expanded checks for versions from 2.5 till 2.8

Srinivas Kandagatla (2):
  ASoC: codecs: lpass-macro: add helpers to get codec version
  ASoC: codec: lpass-rx-macro: add suppor for 2.5 codec version

 sound/soc/codecs/lpass-macro-common.c |  14 +
 sound/soc/codecs/lpass-macro-common.h |  35 ++
 sound/soc/codecs/lpass-rx-macro.c     | 565 +++++++++++++++++++-------
 sound/soc/codecs/lpass-va-macro.c     |  29 ++
 4 files changed, 488 insertions(+), 155 deletions(-)

-- 
2.21.0


