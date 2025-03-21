Return-Path: <linux-arm-msm+bounces-52209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44049A6BD6A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 15:45:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA61D188A124
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 14:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4BFA1D79A0;
	Fri, 21 Mar 2025 14:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="NIhgSJe0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D038E1922F6
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 14:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742568351; cv=none; b=t/g+iNXH6zMyfc2ChL3+iKI1LZmvBUegbbXa639Ar+LuTPt4lq2eTz+qGqbLs0ruD9MMz2DzuJHi7XncN9JXG0eMPAtXXoXfjE2KHRI93ZByOwwm2FV/QCi/seBXkHSa30JxW4yli3LsuBCjIfMJrP5R5PsIDXWUZ4tuEsVdJ2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742568351; c=relaxed/simple;
	bh=0k4WlE/9Tyqofqq6qU4Rq2nzt306TPjVYhaNxs0Bvcs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Jmp77iMe0PPeNjc6cocDeAz+XIqI1lT6r0ORbPN5LXB1b/ZfQqBcfQVlbxLiDw7Kl14UOiZU2bXo4FqK3KjuHtnaBo4SE/9dIXm5lPe7X8BYjub/hdQb07CqAv/M5e67qedooJtsjfqcOEDGMSlwYSsdBV8YZohauCKwTSmyu8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=NIhgSJe0; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab78e6edb99so319573566b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 07:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1742568348; x=1743173148; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UfREiEIegsjqq2j/Wuwqi5NQffLWKjGNHk3ynXc28wY=;
        b=NIhgSJe0xnaf5jKCrMK6BSd/D305UgFcyZWpz2rODjKRvWY/LVKabDP5NufS4q8DQP
         HhMQxKdx9bNlng21gmeUj8ayfmnxRJ6V/SwuDqvE+m5E1CbJdYOmjdVHSaGxVhLDAjsI
         TyDoCfIrLgnJ0PcAD/s5R7gR2GFxwKO4VsaL7AoJLLMy6zwrxN87vBj2jn3NXVHIcRTj
         pUaYOBTQ5JsZWCJSopidjlZR/SrPY1t0HUR+ErwHMgdQB8rhH3Qa49aHflUAwFFTIzwZ
         J5A7CsxZymW8XRsSdBigvmODl52Q5zjwp58hqVLHtlejyLq5rdkJbU5HGIWGgDX/h7+z
         5MYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742568348; x=1743173148;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UfREiEIegsjqq2j/Wuwqi5NQffLWKjGNHk3ynXc28wY=;
        b=uq9NN4/KGAdgIgYENU3AjVX1IPi1/DuOkLeamigjm7A7rMI24C0ajI0VYhsl3rw2JB
         SIUHOmcsexG8xBi6cBEX6eqwxpggqYyDugbkU/WVoI44cu0No3gLLfJO28Ql0Su71jVM
         rcLUUOe0cBVVyBj8b7jmrGZpoLpdrGcbK/YyCLZ8eFQuH4MUmNp+YXHAZrxFJkRfxvRz
         rtiZPwR3ZrywCSNRfzgbFP9hyPiMkDeCjIx9/k1ZvE5U6uehcRneuz8/hG9HWIynqANw
         zzlihA31DEP27Sgg2udXMR2v/jZsvH6yYvFGMNoG6X5wMcQqrVIcZQtUaV+fR2bgoXUT
         rvyg==
X-Forwarded-Encrypted: i=1; AJvYcCWPs0TwKbG6ThDBBpLaAQzqiRXLow8U01UzKplikBxEmeP78A9WE7GS5ZPjTUJlkuFJkj8uQPUU74DOB5TF@vger.kernel.org
X-Gm-Message-State: AOJu0YxMcOT1Dpq12JWUXX8LuJpWknhcTz5JhDWU27mzfx8tExGl7R65
	8v8yrH6FbB2SeO/64wCsqorlGywNrKWSwdiRJ6JXlTVdzwAzoyYEKQ05FdLWUIk=
X-Gm-Gg: ASbGnct5U7FjL8fj6Tyjb8rkpmXO5i3qRNUB0QIQE6NZn0vw3SfJsuFusEIcoUD6O8a
	wjvjFco89Vy/OR8WasCYjG7lys4LIXFu7B9ZJlR4qZixMGc65ao+PqXLM1znXrsWrKGFIT1nnBw
	e6N9ouA6UeQ04X5vc08in/uvfkjGADFWsSjswgeWADYwtC3QNqrSWzaUoF3jBpVWCQb6DSoE8dE
	lfw5aLukx+CEtiFtGC+LXlPYU2UEpO8mPqiv1qU8k0dNC0IL3jV69aPdMF/BrbBdOsm7xrqUPQ8
	H83KxCQGL5CNBFYIMHyWASmP0tNErpB+YG3mXZEQ+H2qQnoUbULrIF4jnHvrTUgbBw/qtC2ZQb5
	o+m2Ibps9x3MLfm4P7w==
X-Google-Smtp-Source: AGHT+IG5MlM9CgB175VZ3Vc4RH0qB2s7BEDKyYcPQFBlPYs47o+HPbEy2dUQI25i+CYb4c4VAAdkLQ==
X-Received: by 2002:a17:907:ba0c:b0:ac0:6e7d:cd0b with SMTP id a640c23a62f3a-ac3f2268607mr442093266b.34.1742568347928;
        Fri, 21 Mar 2025 07:45:47 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efb648acsm168092466b.98.2025.03.21.07.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:45:47 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Add video clock controller for SM6350
Date: Fri, 21 Mar 2025 15:44:58 +0100
Message-Id: <20250321-sm6350-videocc-v1-0-c5ce1f1483ee@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGp73WcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYyND3eJcM2NTA92yzJTU/ORkXbPU5JQky8QkI3NTMyWgpoKi1LTMCrC
 B0bG1tQB8vXnyYAAAAA==
X-Change-ID: 20250321-sm6350-videocc-6ecdb9ab2756
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

The driver for the SM6350 videocc has been lying around in some branches
of my git tree for a long time, let's upstream it. It doesn't get any
better by letting it age!

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Konrad Dybcio (2):
      dt-bindings: clock: add SM6350 QCOM video clock bindings
      clk: qcom: Add video clock controller driver for SM6350

Luca Weiss (1):
      arm64: dts: qcom: sm6350: Add video clock controller

 .../devicetree/bindings/clock/qcom,videocc.yaml    |  20 ++
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |  14 +
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/videocc-sm6350.c                  | 355 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,sm6350-videocc.h    |  27 ++
 6 files changed, 426 insertions(+)
---
base-commit: 73b8c1dbc2508188e383023080ce6a582ff5f279
change-id: 20250321-sm6350-videocc-6ecdb9ab2756

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


