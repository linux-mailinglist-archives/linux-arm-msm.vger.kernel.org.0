Return-Path: <linux-arm-msm+bounces-24350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 203BE919745
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 21:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDC741F231ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 19:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741E11922DE;
	Wed, 26 Jun 2024 19:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RXHzNd1h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C164191499
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 19:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719429164; cv=none; b=lxl6G87ICsNMAdmACm+KC644TaxRLuzRLwgxFGN5tNhBBOmAI39LA93Es7EY4MyNXKHXPHfkX7R2UYCUNyLLhoxtcQNDDRrI8cN4kWDQLarpT1a2y9/n2mnbeUNGNTEThB2lBvjwa6PmLtHRWZicAORV7Aipwxcs1rHUI13YYG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719429164; c=relaxed/simple;
	bh=u2SDf7fYGpc3E0DhCbMR56gaPqX/IPfUMmRhQjk5K4c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FoQTYdwHxljjrkn+hzsmWAgiTkBEQoe6RCnFd7shYW8QT7oaohlY+72pKFWluS0yxvaETkzODCRCNKKJ2iS4YTTnzC0zA1lqlh4q71gcFthhsgWVhr3ejxBPMr5ETXHaGKsCEXH1hCijgj02kBJ5BxT/SEGQSuwP/5z2VE4r4GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RXHzNd1h; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ed5ac077f5so14907991fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 12:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719429159; x=1720033959; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fBaZ29rBHA0IbizvOuiU1ifvZy32PfYnRdTmhCFJeeY=;
        b=RXHzNd1hjy7gc9xHnCu5e+DN5Xfg62u9nCrLI8Nvn0Ve1VevVurugiatygeFenyR0P
         QUmYNOXGIcpMlb5qlX07HNvhbttcoZorCq6V9rt4nuIUr9Ogph0g55iemrYep4PUtugy
         Buq9Ohs62s1kh4AOZYpOhb30jsYf7bPPxDl+X3c+4k73ja9P4EZP17sl6x/5GZT0afK3
         3mj2OY9aYrUmJG22CL85YVDXpMJdOurujifXDGnhSfC0liqChmlVFRhIA8CXjTAgoNIV
         VHPMRp8TQp1PnqtXSqpYf0xVzBYFj6fQ2zWV23M3Cg9eGMWLoywLzjMHdmxnxtGR5Etl
         8Gow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719429159; x=1720033959;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fBaZ29rBHA0IbizvOuiU1ifvZy32PfYnRdTmhCFJeeY=;
        b=ifSBDTm7BLHJIhgKkavfxUIN9bz47x62Rbh/wnZySwNltW31yJuUsucmWq186ve39L
         qZM1YuZOyFjbDYQ5V9/Gdyr+QZLnqQaTxoNhbMhr9JRqGfRp3AzvGc7egwXNjW0DHv/V
         u1Eqr7kAB7dukmqpq56PjLkPSj1O9u1ljq9kTYgtKh5KIN7J5+We07nGBFlf8BGhNvzW
         FU0/Jpd2QZOXXRxjoHKHg6gtz1kJvkVezHFL0adTYG/C1IACtcs4+jY1iCxvwnWibAlP
         1JS2nbgaLtegL43iub35AF9HtPchrfpTp3Nmz3coY2SLohjSwlQ9tvDubTYrvXI5r/4h
         j3kQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFW3gYHsylrp44myupm+goAWfZ1vS7riKr1pC9Yy61wn3w6WXHow6x0sMs79s46s4EYVQsmYyQaSqew6CcUyv9ZWHcFdmfIf9q979mBA==
X-Gm-Message-State: AOJu0YxJTV76q3DuCez1C6CThkWSjCH6VdM1FMFB1TIPbyXAFHUouT+S
	KZOc4xcc1CWPovjxZ3RqwXk6un26dnPLHUejVSlS7bh0U4wZyj2T3Y7QiMio3G4=
X-Google-Smtp-Source: AGHT+IHt8X0oQPttO5mD+BLMd02xe27Ttt47+NYZAlKzFcgo1uJcEXeR11B1YvqMZXGK8ElWADnPyg==
X-Received: by 2002:a2e:8690:0:b0:2ec:50c5:a43a with SMTP id 38308e7fff4ca-2ec593c149cmr70988991fa.8.1719429159401;
        Wed, 26 Jun 2024 12:12:39 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec5ef9d5fbsm9737091fa.136.2024.06.26.12.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 12:12:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/2] qcom: fix missing dependencies for the QCOM_PD_MAPPER
Date: Wed, 26 Jun 2024 22:12:36 +0300
Message-Id: <20240626-qcom-pd-mapper-fix-deps-v1-0-644678dc4663@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACVofGYC/x2MwQrDIBAFfyXsuQsq1kJ/JfQQ9CXZg2ajUArBf
 4/0OAwzFzVUQaP3dFHFV5ocZYB9TBT3pWxgSYPJGedNcIHPeGTWxHlRReVVfpygjW1cTfCAf9k
 njVorhvuf50/vN8ZRMLZpAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Chris Lew <quic_clew@quicinc.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=630;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=u2SDf7fYGpc3E0DhCbMR56gaPqX/IPfUMmRhQjk5K4c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmfGgmBMoPQseeSdH65m03cqcpEypmIOZ7nWkuo
 zJG7Rv7U7yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnxoJgAKCRCLPIo+Aiko
 1YDZB/9Ue0R33VS4KT+7ba72CxUZxuRwcF18ZHN40gIdk+M+In6AjdrZ1QESoJ9v1m3w+wZouBX
 WHECfjbAUlTsJKao1JO1n9GvRK8qECSn3dK9/0NCjMUga6jguT7o//poHIpJonJG6NU3w9qcoHP
 SgK8VNJKjcDjB+XDsDWc3+rkKY17/YsUFL6vMKMrNs3tMUNVq61w9cAdyr2uXc5Id/YVp67uTbJ
 1lPt2XvS2a2KQZZ22LsuL0UtcE+RN6Y4ch6mHxICGpVVyGVzijDAsoiklKOEo/0KZbLp5i3Pdu3
 PKrC27tNp12nLxQIc2BUpHn6rLyWrOMr+iTthixttq9SXJ0o
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

While refactoring pd-mapper to use auxiliary bus for the PD mapper
instantiation I forgot to select the bus in Kconfig entries. Fix it now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (2):
      soc: qcom: add missing pd-mapper dependencies
      remoteproc: qcom: select AUXILIARY_BUS

 drivers/remoteproc/Kconfig | 1 +
 drivers/soc/qcom/Kconfig   | 2 ++
 2 files changed, 3 insertions(+)
---
base-commit: b07e1e375f6389b6715b9aca590da17039bcd447
change-id: 20240626-qcom-pd-mapper-fix-deps-1cf064ee4715

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


