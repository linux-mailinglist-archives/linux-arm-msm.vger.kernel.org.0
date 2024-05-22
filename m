Return-Path: <linux-arm-msm+bounces-20209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0948CC03E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 13:30:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FC421C21D7D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 11:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D328175B;
	Wed, 22 May 2024 11:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ppKeuQOg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FF538DD3
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 11:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716377412; cv=none; b=iXooYGA+88OVvrIlNN1x6QplKFsDgLHWT5IIvu0hPtqagxw/gWATm+pgdhuZTBs7aZw/ZDIms85Xifg1sOwqVYQe4So2XMCUEXVRGtDgKi4OXNaDEnHN9I83F1eoCiLWwQnyCvkSK854b310RdUucyT9ZFCK/W8BRcMUwJWQmSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716377412; c=relaxed/simple;
	bh=bRrRWdcT1vEQ/NkN7+6mhIfe7t/y2q9qD8PTe3O9S/I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G1X5oFKs033/2akRO/ww3U/bUQp4Shs+INFivAHH6TSAUTZzP3pg4f1PNsbkMfi9niX9/5DE9sascT43dQxJBC8ux2yRvmf+jg+VLKsQEP+uj2Co73Z4B3HAcFScSNTwid01pvn6bw7yUTTuOVcD77KhalwKe5SXOJ7xGUtLeoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ppKeuQOg; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a59b81d087aso933997866b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 04:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716377409; x=1716982209; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hq4L2X2KWQEpJApjySQzZvtfrY/x0TDF4kT6FwZYzPM=;
        b=ppKeuQOgjEp+N4igWsekMRBEoUK0ivuPq6ItFdCjrhggclkjtnKKVpaMQMlOzLUy/a
         MRq+UVtuASKE9wSFcpvwPi6z/76lG7nmATRWRpTIu93E1Wwm6vvoP8OLepqajWyvZLQF
         P8eprUsbYtT4SLG576ooO1WMPCLMYOSzcnXh09BASQFNNS2d7fOGGpqLnmQ3V9dRnuoN
         v1CqQuoosqmgW36YeUIyAWsi6dDVnsVsiRBn8sbwAPRXhrmP/jLRptqKJwJGsI0v7wEi
         jXe5gQq7XCRMbVT18MwnmV+XDDlwjVBHw0OO3eKuMNjYLy/kdENAOjhoilndTbMCrEaf
         9Oyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716377409; x=1716982209;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hq4L2X2KWQEpJApjySQzZvtfrY/x0TDF4kT6FwZYzPM=;
        b=HTbDI4wuSaRY5Mymu8Ibrj9AXBkqbTyZm9UhB9SwxomHPOIHINMBU2NN1ALis0hp34
         Nw7gx0fzoC6xoigu/daYmb7epnOrHJJ6qjBvdJvuqYwa3HhGy56ejFXI8VGS0LViLRKN
         3d3oGPDYvnYzRcyLvruXeVl1EX/zKdc9HwunATd7Yvzv7zQf7q6bFFGE99q4t7tx6mHD
         FXMYysGBR2tRWXrSgshJrcO2nZh/a4x3RvNoV7HWOaI4wTaE/DKhbyHSITiqvIO+2knR
         vTjPoS7clSBaCyadAyRwguL7itvAIsYGsUjaiLCprXYWy4i6crFpzahR9euzELgXO0Wf
         ZsWA==
X-Gm-Message-State: AOJu0YxcxWVJtDtQ5YCUjwVTrZx5np0DFbvYhK5dJf84aBmgf8MUlGk5
	v/34ZVIKCrSoGpxi6J3DRPcSrTKsbyiS2Uz8xQcYP20SeM+p9GlWG6S50WOVaFQ=
X-Google-Smtp-Source: AGHT+IEkOqOZ+PmlgG3pPNruELWYRYHJ49f5/J0ysA4MlrgNX2XFOiAUfem8CdDZEHZl04/Kc/jveg==
X-Received: by 2002:a17:906:c17:b0:a59:edbc:193d with SMTP id a640c23a62f3a-a62281e1a9cmr156921466b.55.1716377408960;
        Wed, 22 May 2024 04:30:08 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:f41:c55:53ae:4d0a:75f4:a9ea:5025])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b01652sm1768363066b.167.2024.05.22.04.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 04:30:08 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/2] PMC8380 PMIC pinctrl
Date: Wed, 22 May 2024 13:30:03 +0200
Message-Id: <20240522-topic-pmc8380_gpio-v1-0-7298afa9e181@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADvXTWYC/x3MQQqAIBBA0avErBN0LJGuEhFhU80iFY0IpLsnL
 d/i/wKZElOGoSmQ6ObMwVeotgF3LH4nwWs1oMRO9ojiCpGdiKez2sp5jxwEmVVLa9RmDUINY6K
 Nn386Tu/7AQt2P0pkAAAA
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
Konrad Dybcio (2):
      dt-bindings: pinctrl: qcom,pmic-gpio: Document PMC8380
      pinctrl: qcom: spmi: Add PMC8380

 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 1 +
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c                      | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: 8314289a8d50a4e05d8ece1ae0445a3b57bb4d3b
change-id: 20240522-topic-pmc8380_gpio-e6d30861f862

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


