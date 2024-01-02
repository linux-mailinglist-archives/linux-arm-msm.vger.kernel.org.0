Return-Path: <linux-arm-msm+bounces-6234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E52F821CA7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 14:35:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B67EFB21EE2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 13:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DB6C11189;
	Tue,  2 Jan 2024 13:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bun7XMr0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588F71078D
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jan 2024 13:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-55676f1faa9so911067a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jan 2024 05:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704202459; x=1704807259; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wuoEJSWwfzteBKTnr2vmlGDQ9FisX2m34oTdwWC5S9s=;
        b=bun7XMr0b++V6l8s1liY/Oe/QjsSW6lYkDUJs393ehSC+9fV6JKbPomfojI83PHHBB
         qMmJFsKs7SKecg4kk89bibU/c20chYLkctD4DZBQL3VBUKS9YPHngmaxPLfHNLPbw01j
         BTtgcS5FTbG5H+JBhWrDF7LexENrJETDngIAugLYAc+I0b8eyAR58sIp1sylsWMHonxa
         WIdpuNeVpOyxhr9b9bjyXDgWU7lqEJVTGNjra3oIQU940C3+YjnerqreW1eyZ0jjJ9Em
         Sluu2dyB8ckErzwpz7atPw+TQZitMt7rzo/suuuVslVGjkQJ+zZDCPvsmRpwIH48ZIRV
         lPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704202459; x=1704807259;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wuoEJSWwfzteBKTnr2vmlGDQ9FisX2m34oTdwWC5S9s=;
        b=TgFM+3Y+Zl9BKdf4kAyemK/bCFMzVVwRpSW1HXg7aC9BdyYV4N1EVZwmcHuQDgap8E
         wcybqoFsFC2ydnNg5ej0JHfWaFpek/UetyCTTqNxuajuvJDnpJVZaaenvsL4bZn1y7it
         P9XCNscuMAMDmTpvx1+eDDLFYoM3Xsd1A0EgJD72LJy7k0u9Xp7NVBp+4cHEjr2WwLVx
         UDWP7OdTHMF96l6FdRpXbZJLjis+GoaJzUaNmnqbrFRcOXpdGxvXaMCQawwTqGDdCpaz
         7kVzBDHk/OSffkB9Cn/zyBeMDq2s/B26pryJqf7N2mJHCejgTTfxbzA2E51iGKrybhq6
         vE1g==
X-Gm-Message-State: AOJu0YwZqqQ9QLpBtTtWfx4FaaeOsPVkEjvOdasoklY5b5nqyORsQ807
	GzlyXRAvnS+ervZGZNvPtlel/UQwH/YhFWCqO7SXU5YoWPI=
X-Google-Smtp-Source: AGHT+IEHYZ75cpzIphUtCjKwfgwxchy4tlmdfx8je2CFeJ0ftCRdyy+Y4vqBBumYMULOGhUKk4JgtA==
X-Received: by 2002:a17:906:80d1:b0:a26:88d4:b477 with SMTP id a17-20020a17090680d100b00a2688d4b477mr7612906ejx.111.1704202459486;
        Tue, 02 Jan 2024 05:34:19 -0800 (PST)
Received: from [10.167.154.1] (178235179036.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.36])
        by smtp.gmail.com with ESMTPSA id u23-20020a170906109700b00a26af5717e9sm10950923eju.42.2024.01.02.05.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 05:34:19 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 00/12] Hook up GPU cooling on most qcom arm64 platforms
Date: Tue, 02 Jan 2024 14:34:04 +0100
Message-Id: <20240102-topic-gpu_cooling-v1-0-fda30c57e353@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM0QlGUC/x2NywrDIBAAfyXsuQsqesmvlFJ8bMyCrKJNCYT8e
 6XHGRjmgkGdacC6XNDpy4OrTNCPBeLuJRNymgxGGau0MvipjSPmdrxjrYUlo3Yu2WSDcppgdsE
 PwtC9xH2WcpQyZeu08fkfPV/3/QMlVyb5eAAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704202458; l=1877;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=53vSZT1Dd/Mxvm/Bn+OuQbRaGVINCbyj46vPqA4scLI=;
 b=qoeCWR7dyWsqsQ36X3iVKL9MGM04ERuZIxBsvvFakKdb1maRQHCpgbgF80an0kn1+A62pIQTR
 OtS6ufKn6tTDx+SjmD2hZIxKoYHqpTf3V3vpYWyhExrIIDS35nsH9vu
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

It's been years since Adreno has been registered as a cooling device,
yet only so many platforms had the correct DT setup for it. This series
attempts to hook it up on most supported snapdragons.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (12):
      arm64: dts: qcom: msm8916: Hook up GPU cooling device
      arm64: dts: qcom: msm8939: Hook up GPU cooling device
      arm64: dts: qcom: sc8180x: Hook up GPU cooling device
      arm64: dts: qcom: sdm845: Hook up GPU cooling device
      arm64: dts: qcom: sm6115: Hook up GPU cooling device
      arm64: dts: qcom: sm6115: Mark GPU @ 125C critical
      arm64: dts: qcom: sm8150: Hook up GPU cooling device
      arm64: dts: qcom: sm8250: Hook up GPU cooling device
      arm64: dts: qcom: sm8350: Hook up GPU cooling device
      arm64: dts: qcom: sm8450: Hook up GPU cooling device
      arm64: dts: qcom: sm8550: Hook up GPU cooling device
      arm64: dts: qcom: sdm630: Hook up GPU cooling device

 arch/arm64/boot/dts/qcom/msm8916.dtsi |  9 ++++++
 arch/arm64/boot/dts/qcom/msm8939.dtsi |  9 ++++++
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 20 ++++++++++--
 arch/arm64/boot/dts/qcom/sdm630.dtsi  |  9 ++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi  | 19 ++++++++++--
 arch/arm64/boot/dts/qcom/sm6115.dtsi  | 13 ++++++--
 arch/arm64/boot/dts/qcom/sm8150.dtsi  | 19 ++++++++++--
 arch/arm64/boot/dts/qcom/sm8250.dtsi  | 19 ++++++++++--
 arch/arm64/boot/dts/qcom/sm8350.dtsi  | 19 ++++++++++--
 arch/arm64/boot/dts/qcom/sm8450.dtsi  | 19 ++++++++++--
 arch/arm64/boot/dts/qcom/sm8550.dtsi  | 57 +++++++++++++++++++++++++++++++++++
 11 files changed, 198 insertions(+), 14 deletions(-)
---
base-commit: ab0b3e6ef50d305278b1971891cf1d82ab050b35
change-id: 20240102-topic-gpu_cooling-155d4d4b051e

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


