Return-Path: <linux-arm-msm+bounces-20429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7378CECF8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 01:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1AAD282A03
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 23:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A60314532E;
	Fri, 24 May 2024 23:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p62/M8bq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD3B85934
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2024 23:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716593854; cv=none; b=JUF1OXKh1s0FFZ2yeoUzKnv7guD+xNJRKhG0A40nhIv/myEI4gDcZ9B+mCG5gF2cCJ42DVNhDfunnQu2KNEJO/+xasvn4ZeLYH8QbMPAiToZ+5ay0MalpFXJuUHoqwnxh3gqgO+POJbfPbRbhWz6UJEuVmcpKWj3zt+wID/qExQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716593854; c=relaxed/simple;
	bh=JflTLH918455b/UulNgm7hAclN0c2bENLU63KxD2kD4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TBjcMeMFU1TRK5uOFXLJLOmhUKKrxe8hn0mkS11O2MOygx6R/cLgTM/jBw6Uy92MbMz7SM8pp+H0tAYdXR85VaahDp+rA3YIaay1Nhso0jovb1r/ImBVzRJMtNhYqPwwB1Ub7YUXJpAv99WZaeJia7BXrC50ioVEJW5ZdRX/IwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p62/M8bq; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-354fb2d8f51so1797666f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2024 16:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716593851; x=1717198651; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NlfoWRsou0FGSAU+bRIZe3/8khkmJp6TNl2qzTYp4WU=;
        b=p62/M8bqiw+FXFtETOXYMWxqhn+VKlEzbEsETO9q+07ilVpgspvlRPV1iFfttI8u1f
         48KCp3n0B3ULuUI6FCra9hw72pNmSvWmqFNEwsmaZ5z8UpUvp8POJ3/7kdBzcyP85ovS
         W137+bADq5MiZWzn5W9DdnEO8zr1aYem9Wk7FIYuwumaeLCu3/3SB0yX6o3OYCPYWRmT
         l4zMTpmG2FBkPHuTdIFpJGGWbuqkRuVk8s/LXpTIW32duR85R+obGlaeuGzFIr7poBHQ
         T8CGm4sO0wP6yFDhwFbgQWfq0MhytDp/wI6rjuPsVIpcokAYANu0FB9FWChOB867BBSO
         1xJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716593851; x=1717198651;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NlfoWRsou0FGSAU+bRIZe3/8khkmJp6TNl2qzTYp4WU=;
        b=s5u92cxKxWIgHspjqWfF+RFiLMsuSEOMNwQbk5t1ApQ+RF2U2qQUBiN2uYefFVNPgm
         585FyqxS5xSbfFfYuK5W5JaWatT3VyGQBgZjV6KIv4UndP5qCzAp6gzgJY+xh60r92bZ
         ANFxFO6+WKtKX8hpFONNQoU0ZaGcU3P6VAebyrWKwlGi+wK9VHflnZgXzzbNJjMyd9jC
         HWRNvNRwQ3Hc9FfgiZuNeb3mcERvFrT7HCJtamcK8/1KBWZNnkawev+FW7OlSJjh209W
         7OUn/YsxlRHuBCpxE+9QlTMkvhDJGLlPL88mCOXeG8YRHK61Bt7QUO3gcWk72aO9EOI8
         NNiw==
X-Gm-Message-State: AOJu0Yz6NyvVVQL7lko+n5ZpuPEiDxaiX4OjpB2iw2TESIS5LjG0qXyz
	H0h2GnRJuVoE80FuwqSNYQlivVdklLbV3Cgsg/zytORx/rxek5SED4M5FntAVUw=
X-Google-Smtp-Source: AGHT+IHp/7fVQoSDDRZK62VLrQPVjXx7HLE+bPisvOuROu6qqrD/CTxst4QM9J4x5BskJua1Fbqmjw==
X-Received: by 2002:a5d:504d:0:b0:354:f168:9862 with SMTP id ffacd0b85a97d-355221273fbmr2746662f8f.0.1716593851065;
        Fri, 24 May 2024 16:37:31 -0700 (PDT)
Received: from [127.0.1.1] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c938815sm189475466b.78.2024.05.24.16.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 16:37:30 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/2] PMC8380 PMIC pinctrl
Date: Sat, 25 May 2024 01:37:27 +0200
Message-Id: <20240525-topic-pmc8380_gpio-v2-0-2de50cb28ac1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALckUWYC/32NQQrCMBBFr1JmbSSZakxdeQ8pEtppOqBJSEpRS
 u5u7AFcvgf//Q0yJaYM12aDRCtnDr4CHhoYZusdCR4rA0o8yTOiWELkQcTXYFojHy5yEKTHVhq
 tJqMR6jAmmvi9R+995ZnzEtJn/1jVz/7NrUpIccHO2Ml2pIy6PdnbFI4hOehLKV/QwKoTtQAAA
 A==
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev

nothing special, just some boilerplate

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
- Restrict # of GPIO line names (bindings)
- Link to v1: https://lore.kernel.org/r/20240522-topic-pmc8380_gpio-v1-0-7298afa9e181@linaro.org

---
Konrad Dybcio (2):
      dt-bindings: pinctrl: qcom,pmic-gpio: Document PMC8380
      pinctrl: qcom: spmi: Add PMC8380

 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 2 ++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c                      | 1 +
 2 files changed, 3 insertions(+)
---
base-commit: 8314289a8d50a4e05d8ece1ae0445a3b57bb4d3b
change-id: 20240522-topic-pmc8380_gpio-e6d30861f862

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


