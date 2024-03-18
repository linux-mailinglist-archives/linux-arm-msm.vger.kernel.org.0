Return-Path: <linux-arm-msm+bounces-14364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F1F87E661
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 10:52:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74E1D1C21816
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 09:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818D32CCA0;
	Mon, 18 Mar 2024 09:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WmPFT7Gq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941C63610A
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 09:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710755520; cv=none; b=fGMrpWMSDVkuCdYRipV3E1Qdxw0djhjKyunP1ThEoVQ107URtkZC1wWbuEZJITwNfelQMnfzIj1xUsvhVpDnjonMjywfcsGE0SwiJYWuq9iCj1KLxsH/FXBcvYIr/9zDdzJZfgT7c2nPe//WbB4OcOCymR1z9jGyESaempSUnwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710755520; c=relaxed/simple;
	bh=PIfBWZ6wslpgmOaI5QqBZUbYKMOZbqTD0EQ38/257Fw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HI+lYEvRyYu+qduv1sB2h9Vd6Kqm+oFBtbpYoMuGUfGiB4FZHPs3b4fhHfubkQ+hVf2eO+Dv8iGUi5BCCaVhiwnCdahncxx6I43dUqWHmrLsDHANr160bBcn3z43FYFtBZantll8WnmwgcOtTEHvkqz0gGJSvE6KUe7ndFZOTtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WmPFT7Gq; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33e672e10cfso2059730f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 02:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710755517; x=1711360317; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bhpR8m1BKg/4ZqXCedQn8etISKen0k3LBbXkscAw5/o=;
        b=WmPFT7GqZqW3sb/5nxIY9suGNlEZwRFBeCpk30E1jo1sJ4xrHFlwVXZwapPX6OZN3l
         O+quCdone83eF8Gs3rckZ1wUqRZzUqCcKW8GDb3r8JlVym5+dBPp1Jj0fQGHGI3Bd2zT
         gTJmVmJ/J8zvMCorF0l7bhgiYsuWnW4F5KtZ/UMmtNDfg5u+aF9sOQIBIZ8uJqc2NTmS
         V6E/n4HkVtFtfk9gzypkg5H9daRwpAf3CTb3IG/FTFJFymkUm98+kw3So4VhoxujzpQI
         wI3VVMsoFv1CAmn27Od1qT3qfUdfq4ShCOL5IGX2yc9KEVUYpRnCrlkwe5jaJfFfnv+v
         nMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710755517; x=1711360317;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bhpR8m1BKg/4ZqXCedQn8etISKen0k3LBbXkscAw5/o=;
        b=cC54AcL9FwP4oOFHfnBAIZRgJaz2tDPwqBua7hKZHPtqoyJJapHGdcgFE1mk9TS1mD
         FZFKpShSNLNrbqCM6OY7MvGraTvko3Z/adf8xU60dCH42X6lYvMDdvC+wteyu3oSrkzq
         FekicvjyCFIV2KlGMkzylOa4g8k8U2BbuaoOREjnVBrpHatlYTCB+3HFyzpLHUryHWUd
         2KhHey//7rXoZnUME9UxvQonchFwGx8uffJg7H543WW8ZllE8NCvCWoQYv5MKasmfanW
         bsgbr2IjnpJHj7kzP/oqLhT03+DoUEOdm1kZ0Je4HDc1+uUpmwQ3XoZ2gBl9IQka57XH
         cMHw==
X-Gm-Message-State: AOJu0YxLQPxkKZC4qFDZjvEDyTpX3YB8UEGbz3Jc8Rak7Y5lmhFJWgxO
	7kj+wHoiqsyo/b8Dq6NQC8IjIOSFhLqTWkin1KliDzA+UxbG/1QFhBRdlNPZfPo=
X-Google-Smtp-Source: AGHT+IF4hqwhhN9ejGxakhVlgNcsc5fxhX/noA7MKMBWR+IsuUkU3u72avfLIQIRnp+t6eqhMuMs2g==
X-Received: by 2002:a05:6000:b50:b0:33e:d547:4318 with SMTP id dk16-20020a0560000b5000b0033ed5474318mr5844510wrb.47.1710755516824;
        Mon, 18 Mar 2024 02:51:56 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id bq22-20020a5d5a16000000b0033ebf702e17sm7514974wrb.21.2024.03.18.02.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 02:51:56 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/3] arm64: qcom: sm8650: add support for the SM8650-HDK
 board
Date: Mon, 18 Mar 2024 10:51:52 +0100
Message-Id: <20240318-topic-sm8650-upstream-hdk-v2-0-b63a5d45a784@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALgO+GUC/42NQQ6CMBBFr0Jm7Zi2AkFX3sOwaKYDTFRKpkg0h
 LtbOYHL95L//gqJVTjBpVhBeZEkcczgDgXQ4MeeUUJmcMaVxrkTznESwvRs6srga0qzsn/iEO7
 IzlIX6s4GbiDvJ+VO3nv71mYeJM1RP/vVYn/2n+pi0SAR+bqsKJyNvT5k9BqPUXtot237AlXgR
 JTDAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2194;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=PIfBWZ6wslpgmOaI5QqBZUbYKMOZbqTD0EQ38/257Fw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBl+A66PVCQkfCUV58DJMMXLdfhNUsK1ofUOI4Uimxs
 UAspql6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZfgOugAKCRB33NvayMhJ0Z6OD/
 9xGb36ZvV2cADpQDRDltw1IKUXo6WwBxRjHH/VFMcV4f77D61GjFNjGurrvkZlc+gTJzRNyGi6mYPg
 3Wbz5cjx1X6BnGwpQ420Qyir+OZGLT6YlpBgkXphaXz7/c2OShck+eFNOFSjRF8u19nAb+72vKyRHc
 kPrsbFG0f3B1eh0txyyEmXHEzzbczU5rvUGsb+CpQ0AXA6q4eayqMImX0Plc9u+5Vli/GGGUTij42Y
 DPzOnrv86Kp8M9+N1U4dmQ5HvfhvZhXqa3qVmQsBZA+jJzeC/xLVuBa2VYcD++UUCmc5RuVzaK8iR2
 85Z2Upv/V1lT1cbGDoJfmcsOlRxBFSgeERRClSji8EqFmADngJGsk1SG4dFf+SE5kpwQNzPcJw38/1
 fi4tgjUtU2fVXJKEXhO2i9thmk0v+y54+AmKYaREbixQ9JS59323p1VE39CfrAwNlBUGeqNsYMzI30
 ihvIBULQY3ikD0RO0oWoUbbQDJJxIqgJ4VBX7PVPVK6cfxMpLtonWCrshK+WHYFrjv0XYBYLSRLfYP
 MSDMQRn6U2ccYWtyo02RAAV53bq2ULntukQUpHTMEzt756tSzeiM/n6UDZXDwintPhTalqGD7HBVGA
 67lg+B3BPwGyK876TC/SOh6r0CZOadrHY1NsE5QE78JaITOcX+AkLH/Ctcqg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The SM8650-HDK is an embedded development platforms for the
Snapdragon 8 Gen 3 SoC aka SM8650, with the following features:
- Qualcomm SM8650 SoC
- 16GiB On-board LPDDR5
- On-board WiFi 7 + Bluetooth 5.3/BLE
- On-board UFS4.0
- M.2 Key B+M Gen3x2 PCIe Slot
- HDMI Output
- USB-C Connector with DP Almode & Audio Accessory mode
- Micro-SDCard Slot
- Audio Jack with Playback and Microphone
- 2 On-board Analog microphones
- 2 On-board Speakers
- 96Boards Compatible Low-Speed and High-Speed connectors [1]
- For Camera, Sensors and external Display cards
- Compatible with the Linaro Debug board [2]
- SIM Slot for Modem
- Debug connectors
- 6x On-Board LEDs

An optional Display Card kit can be connected on top,
an overlay is handled to add support for the DSI Display
and Touch Controller.

Product Page: [3]

Dependencies: None

[1] https://www.96boards.org/specifications/
[2] https://git.codelinaro.org/linaro/qcomlt/debugboard
[3] https://www.lantronix.com/products/snapdragon-8-gen-3-mobile-hardware-development-kit/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Fixed commit messages with links, and recently added product page URL
- Swapped i2c3/i2c6 nodes
- Moved pcie_1_phy_aux_clk under pcie1_phy
- Removed duplicate mdp_vsync pinctrl state
- Collected review & tested tags
- Link to v1: https://lore.kernel.org/r/20240223-topic-sm8650-upstream-hdk-v1-0-ccca645cd901@linaro.org

---
Neil Armstrong (3):
      dt-bindings: arm: qcom: Document the HDK8650 board
      arm64: dts: qcom: sm8650: add support for the SM8650-HDK board
      arch: arm64: dts: sm8650-hdk: add support for the Display Card overlay

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    5 +
 .../boot/dts/qcom/sm8650-hdk-display-card.dtso     |  144 +++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            | 1259 ++++++++++++++++++++
 4 files changed, 1409 insertions(+)
---
base-commit: 2e93f143ca010a5013528e1cfdc895f024fe8c21
change-id: 20240223-topic-sm8650-upstream-hdk-e21cfd6f1de8

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


