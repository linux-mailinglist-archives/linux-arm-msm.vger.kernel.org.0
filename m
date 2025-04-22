Return-Path: <linux-arm-msm+bounces-54922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 834F8A966D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 13:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56429189F339
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 11:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B27219317;
	Tue, 22 Apr 2025 11:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NwHEIMze"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EF3275861
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 11:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745319858; cv=none; b=BojpjcxnCiIkQjFMhvmACCaIwxS/JYtt83HbwnoYXlxZUk8nzAjM4xrloYEsxDqnCp6Lglr8g2vRCy9LjpmBEX4vP0J82hrKke2S1Om3LlzsEwx5p0lFoAtLtrRJ6PzJFY4DUURJ0+yImz26iPrvWg8+ck+czh08JWmxw+1nIg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745319858; c=relaxed/simple;
	bh=uV6ujamVStXpEvao7zFqfEA0uxJwBaOVhk8e6yHSv8Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VyhYbhTXs0OV9bAXK7y6aCN/mQBHyzbwxq5K++5+aVBHKidebr6AYMGpmcT4kXexXzHFnpsTfFl4xE5ZkFHIe18U3di1KhA8Fj3UurCWCMG3O/iow3v0Kb3nzV1DreIVKUFkLIXbg8x3Nf0J76WETTcRCMa4LLoPNiH62eoIEV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NwHEIMze; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43d0782d787so35530495e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 04:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745319854; x=1745924654; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=stczcmLF4CwDu8wpHpVgUDiohWhx/z3wF2KWIWtxeUA=;
        b=NwHEIMzebIozlxCGTqBCIZz/uRx6uhsCEVE1CwXfyrf5JAWF4WOE/XbGW1JXvFPUaJ
         QF4LWqRYYFd1tqTfn21oVIDpV9bLt0bIGEtJV78Jm7PeKWvZn9ULMD4ws6JKeUbTVc2s
         b7Zdiovx9rETsB/fGHWsmcaWWfNGr7VrUp//gyV/oIxesDDq1fezCkLbDtVq32ZtN9BY
         ZQA3ttW2SONVq3e2lPjgfyx0hLihApxZPDOZGst8DnwFFoRUqEs0IXUbs2AN76LEzTSE
         e9v0s1DWeFSn8kDtW170eEz+D5Ex50sU1iQ3c9plfDNtzZLT7v7jcscFLsoAsste8IZz
         SU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745319854; x=1745924654;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stczcmLF4CwDu8wpHpVgUDiohWhx/z3wF2KWIWtxeUA=;
        b=tO1PHCN0UBUcRPek9hiSyeVihR3KXXNZ6x34/gzIM7ygrFzgYxOAow4WV8P1EMArT2
         GIDNdJfS22Hn1fSCtiPmZ2bURv8xAymy2s02P2AZqDLw+ydYy16PePxiXf3ZmiSAnvMw
         WjgmuQoJxgorrqHPjrbuW6upWKy7FwpddHDZD2+TmOG5E1YsPXabkl91tI4hevD1Rg3W
         vHFrBMk5HVr297TQCh77LDDxCKvRAfxkY5M1Qfft80lYv3pEfyq9KRafB4UzOcexonf9
         op0puft+QsrVz68N0en+Mq4PbVRMhd3lrPwAV6daf19SPlX4nRMbo2SdxW8EQUdKR3F5
         WEHg==
X-Forwarded-Encrypted: i=1; AJvYcCUBKDuRXH8KaC6CtvSXUNe5gd27ETd2w9RfWSng8GGX54OwmijVyCrygYCZdHWGdjdWsM1J7zkgWz6Y1kQ9@vger.kernel.org
X-Gm-Message-State: AOJu0YyNeeHI8l7AN9AJoig5iPYubR4OCMPeBuSFD3GUL8Cay6859CF/
	3TkH8epnZtOViot0xGHrvJGsS30KtubgcnTe8bIBnUBNl8wdjup8TsF+rhKeT/w=
X-Gm-Gg: ASbGncs8oZ1riQ+Z8xlNmuQmMj4pgo6WQ0qh82yY/3QkS2V3INmfampqkqZm608g9HZ
	d6krprQd3VWPGKmPVR87NeiCPvHnwj96tyhvOuq+CqLRdyNvLamcOvoqyHKR6hfOMEZJhQc+r/t
	wLF3BRO1F0QsdzpUb+0SJRBVdzVxg0IXbd3kmGSfZryd+fFISrlcyuq4bFhPCaKCC9WyNco/uUY
	VN4J49DRkuDtr8aOzSoJ7ybzNKSAKgk2FYpP7+7KffNDtvJOeaxq0Gm8UMeVkOyu7T7HsQ5oeVf
	qUKnfEqHjKQXmY5wE9s9bVtjEAd8jki4nuKqMMVwBIM21FxPqtexNvppqPgDdbiK4g==
X-Google-Smtp-Source: AGHT+IH2uZN2Zbzw3YJ2WJTh6/sZb1U2AgQZkrjJhlf1vz4G/pbKrEq84c6eL9i7fbiSyw55mnPV5A==
X-Received: by 2002:a05:600c:1e1b:b0:43d:22d9:4b8e with SMTP id 5b1f17b1804b1-4406ab93fb0mr172402695e9.10.1745319853872;
        Tue, 22 Apr 2025 04:04:13 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:8847:e39a:2a2f:e614])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5acddfsm169609725e9.15.2025.04.22.04.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:04:13 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH v2 0/6] arm64: dts: qcom: msm8916/39: Cleanup/fix UART
 console pinctrl
Date: Tue, 22 Apr 2025 13:03:47 +0200
Message-Id: <20250422-msm8916-console-pinctrl-v2-0-f345b7a53c91@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJN3B2gC/3WNywqDMBBFf0Vm3ZQkPmi66n8UF9GMOqCJTCS0i
 P/eVOiyy3PgnrtDRCaMcC92YEwUKfgM+lJAP1k/oiCXGbTUtayUEktcbkY1og8+hhnFSr7feBa
 yMYPT2nboHOT1yjjQ6yw/28wTxS3w+zxK6mt/zfpvMykhhVWuLNEaU3XmMZO3HK6BR2iP4/gA0
 pSsg78AAAA=
X-Change-ID: 20250411-msm8916-console-pinctrl-069fd22abedd
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sam Day <me@samcday.com>, Casey Connolly <casey.connolly@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2

At the moment, msm8916/39.dtsi have two inconsistent UART pinctrl templates
that are used by all the boards:

 - &blsp_uart1_default configures all 4 pins (TX, RX, CTS, RTS), some
   boards then limit this to just TX and RX
 - &blsp_uart2_default only configures 2 pins (TX, RX), even though UART2
   also supports CTS/RTS

It's difficult to define a generic pinctrl template for all UART use cases,
since they are quite different in practice. The main use case for most of
the boards is the UART debug console. Unfortunately, the current generic
pinctrl template doesn't work well for that either:

 - We need bias-pull-up for the RX pin to avoid potential garbage at
   runtime when the console UART is not connected, but this may be
   unneeded, unexpected or even unwanted for other UART use cases.

 - U-Boot needs to know which pinctrl to apply during early boot stages, so
   we should specify "bootph-all" for the console UART pinctrl. It doesn't
   make sense to apply this for other UART use cases.

The solution proposed in this series is to abandon the idea that one
generic pinctrl template can fit for all the UART use cases. Instead, add a
new pinctrl specific to the very common console use case, and move the few
other UART use cases directly to the board-specific DT files. This ensures
that people are forced to consider what exactly their UART use case needs
when porting new boards.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Changes in v2:
- Add new line between tx-pins/rx-pins in PATCH 2 (Konrad)
- Squash patches 5,6,8.0 and 7,8.1 (one patch for 8916/8939 dropping the
  generic UART pinctrl templates) (Konrad)
- Link to v1: https://lore.kernel.org/r/20250415-msm8916-console-pinctrl-v1-0-a1d33ea994b9@linaro.org

---
Stephan Gerhold (6):
      arm64: dts: qcom: msm8916/39: Move UART pinctrl to board files
      arm64: dts: qcom: msm8916/39: Introduce new UART console pinctrl
      arm64: dts: qcom: msm8919/39: Use UART2 console pinctrl where appropriate
      arm64: dts: qcom: msm8916-motorola: Use UART1 console pinctrl
      arm64: dts: qcom: msm8916: Drop generic UART pinctrl templates
      arm64: dts: qcom: msm8939: Drop generic UART pinctrl templates

 arch/arm64/boot/dts/qcom/apq8016-sbc.dts           | 21 +++++++++
 .../boot/dts/qcom/apq8016-schneider-hmibsc.dts     | 41 ++++++++++++++--
 arch/arm64/boot/dts/qcom/apq8039-t2.dts            | 28 +++++++----
 arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts   |  3 ++
 .../boot/dts/qcom/msm8916-alcatel-idol347.dts      |  3 ++
 arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts     |  3 ++
 arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts |  3 ++
 arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts     |  3 ++
 arch/arm64/boot/dts/qcom/msm8916-lg-c50.dts        |  3 ++
 arch/arm64/boot/dts/qcom/msm8916-lg-m216.dts       |  3 ++
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts      |  3 ++
 .../boot/dts/qcom/msm8916-longcheer-l8910.dts      |  3 ++
 .../boot/dts/qcom/msm8916-motorola-common.dtsi     | 11 ++---
 arch/arm64/boot/dts/qcom/msm8916-mtp.dts           |  3 ++
 .../dts/qcom/msm8916-samsung-a2015-common.dtsi     |  3 ++
 .../dts/qcom/msm8916-samsung-fortuna-common.dtsi   |  3 ++
 .../boot/dts/qcom/msm8916-samsung-gt5-common.dtsi  |  3 ++
 .../boot/dts/qcom/msm8916-samsung-j5-common.dtsi   |  3 ++
 .../boot/dts/qcom/msm8916-samsung-serranove.dts    |  3 ++
 arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi          |  3 ++
 .../boot/dts/qcom/msm8916-wingtech-wt865x8.dtsi    |  3 ++
 .../boot/dts/qcom/msm8916-wingtech-wt88047.dts     |  3 ++
 arch/arm64/boot/dts/qcom/msm8916.dtsi              | 55 ++++++++++++++--------
 arch/arm64/boot/dts/qcom/msm8939-huawei-kiwi.dts   |  3 ++
 .../boot/dts/qcom/msm8939-longcheer-l9100.dts      |  3 ++
 arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dts    |  3 ++
 .../boot/dts/qcom/msm8939-wingtech-wt82918.dtsi    |  3 ++
 arch/arm64/boot/dts/qcom/msm8939.dtsi              | 54 +++++++++++++--------
 28 files changed, 217 insertions(+), 59 deletions(-)
---
base-commit: 39155a896925c3af2156ad61e821aa9fa5a1dbdb
change-id: 20250411-msm8916-console-pinctrl-069fd22abedd

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>


