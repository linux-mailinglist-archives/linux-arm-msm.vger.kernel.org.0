Return-Path: <linux-arm-msm+bounces-6541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDD7825BB7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jan 2024 21:39:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E17E91F2416E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jan 2024 20:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DA7820310;
	Fri,  5 Jan 2024 20:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hwR3NPCz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D122D059
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jan 2024 20:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40d76fefd6bso16906595e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jan 2024 12:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704487151; x=1705091951; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CUvhbp1vrlSO3B3no127g/8Plmrc4jTzNiIeG+FMCGU=;
        b=hwR3NPCzvJEJKMUFAB5wIWYTqxIHddY/lQ4mP7DY2DdC47lpYjPrYlK86eq5N3RNcS
         T578NtldM9haCijB/26GniTf9yppouVOojYRaBXLPK8Hw40Pwf8WHLub5l+q16JdDN7R
         zsDYL7iGOs+BX4Vue3ojrnBNR+393/ezykIco4KfJmyzjED6QbBvym3jKYO3pPkcdLBO
         D228Dv1SgB2L/75CqFXYDPBIaZryc8yO1NwIRqjegGDiQrCa7n4WyJCtQLKUepsdPJ/u
         GwtwP420bqSZKbrVgmE1EGN6AXwguaZJhdSvbrM/pSMApOJeSCYiUw3rfQR0kn/pkk2n
         BH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704487151; x=1705091951;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CUvhbp1vrlSO3B3no127g/8Plmrc4jTzNiIeG+FMCGU=;
        b=GDm+RWjp6H/lcV3UuNwssDOehTU9swEgpo/9ENouNYA9Ni8YjQw+DY1hi7dBqLwiLK
         7A4rXatQ8ibSbrujjqGvQ+TUTcuZGCAgQcaq2/fXepHWu5i8S3p4n3B3/TlAC10nVatU
         9t7w3MtoeQC+vL/QfZs1AqCglDysGMamQCAJ+XbA9kPhGXAIVsoAhALR1hh7H4plg8oa
         ieqnsiCEONWHEubvpkH7Je0MgrLrBYrqznQvQltMHzK/LBvMDCCApcuxSOF9RyouAH72
         nqQ8EtZLdtCm2kbLE8ToE4nY0CcvOpIT3Bfnv78msNLq+236ByxmmTyvITu4dnBp7oXD
         iCVg==
X-Gm-Message-State: AOJu0YwKDhjCgBjBzT4Q9nDjv4oRCpI7sYdMg/DPpLxRpVRUJoijkSvs
	ym3k5DnINFpA7CJZTLr1hXKTnL/2Xt0blQ==
X-Google-Smtp-Source: AGHT+IFQ+G9s/mU4uIzKfd4L9U+1AGEkYS1QNHCxc6B5GoZ1kfJSUHc11iQzacUHXmxgvCwlvHpITw==
X-Received: by 2002:a05:600c:1d97:b0:40e:3518:ba7c with SMTP id p23-20020a05600c1d9700b0040e3518ba7cmr19322wms.71.1704487150759;
        Fri, 05 Jan 2024 12:39:10 -0800 (PST)
Received: from [127.0.1.1] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id hn3-20020a05600ca38300b0040e398f8cafsm2283890wmb.31.2024.01.05.12.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 12:39:10 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 0/4] arm64: dts: qcom: sc8280xp: Add CAMSS core dtsi
 support
Date: Fri, 05 Jan 2024 20:39:04 +0000
Message-Id: <20240105-linux-next-24-01-02-sc8280xp-camss-core-dtsi-v2-0-7a57b8b07398@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOhomGUC/5WNQQ6CMBBFr0K6dkxbENCV9zAsxjLAJEpJB0kN4
 e5WEg/g8v2f/9+qhAKTqEu2qkALC/sxgT1kyg049gTcJlZW20IbbeHB4yvCSHEGW4A2kDJxta1
 1nMDhUwScDwTtLAy2yjWeuoq6c63S5RSo47jrbk3igWX24b3bF/NNf6L8P9GSasA7OsQyx3Npr
 mmOwR996FWzbdsHunqTpOkAAAA=
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13-dev-4e032

This series adds the yaml, CAMSS and CCI dts definitions for the sc8280xp.

4 x CCI master busses
4 x VFE
4 x VFE Lite
4 x CSID
4 x CSIPHY

Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-24-01-02-sc8280xp-camss-core-dtsi

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Changes in v2:
- This series depends on "clk: qcom: camcc-sc8280xp: Add sc8280xp CAMCC"
  in linux-next. - Rob, Krzysztof, dts Robot
- Drops cci_src clock - Konrad
- Adds sc8280xp-cci - Konrad

Link to v1: https://lore.kernel.org/r/20240103-linux-next-24-01-02-sc8280xp-camss-core-dtsi-v1-0-abacaa63a961@linaro.org
Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-24-01-02-sc8280xp-camss-core-dtsi-v2

---
Bryan O'Donoghue (4):
      dt-bindings: i2c: qcom-cci: Document sc8280xp compatible
      media: dt-bindings: media: camss: Add qcom,sc8280xp-camss binding
      arm64: dts: qcom: sc8280xp: camss: Add CCI definitions
      arm64: dts: qcom: sc8280xp: camss: Add CAMSS block definition

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |  19 +
 .../bindings/media/qcom,sc8280xp-camss.yaml        | 512 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 555 +++++++++++++++++++++
 3 files changed, 1086 insertions(+)
---
base-commit: ab0b3e6ef50d305278b1971891cf1d82ab050b35
change-id: 20240102-linux-next-24-01-02-sc8280xp-camss-core-dtsi-2730a5f7ef98

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


