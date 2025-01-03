Return-Path: <linux-arm-msm+bounces-43895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30975A00AA7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 15:38:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB60E3A4192
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 14:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03E3E1FA8D2;
	Fri,  3 Jan 2025 14:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pAv2UQR1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562851FA15D
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 14:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735915115; cv=none; b=bpGOKMFDL5GbhwLhl9QoK+92YgIGNkZY9xbZWrp+q3Wi1CBKxjtdIxyn6x5mORubaZPD4MFeHJbM8kC8wDmn7Y4Bjue65pVimA458juMjA5cnPkgzYNrmDKnYVQfZxCCdLXF8VUjxqV5F8gFvtJv2TrxTQSitVWPS2x5W741n7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735915115; c=relaxed/simple;
	bh=1Y+0PH31HMIIB/r+VQ1ADyawT75GYepX5T0fBwmVuQs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iEIAhScaz8LCqiJ9ZpsEH0JWxnDeF6pmiQH0oIB1Cr6hhgRjmqKUferilBRww8ckoTWdULjbOG9TweIdyAfwCzxbzYg6cKfCu/rALVbT75v73VFNhYMymSp/Aq0xVnhBO82uomBiwPVfFh+qvwq41PgLJOYjAQ7b+Q430n5WIAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pAv2UQR1; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385e87b25f0so8341508f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 06:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735915111; x=1736519911; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=znG6EiP7+LexAxITyxuokgw0IFZZFiG9gFOzUCnhuvc=;
        b=pAv2UQR14i07wiCYl0Jvof9eT00O27MzJLAPIlmd4+dbgxy2hUMQ0DbZeziP/4/g9B
         wDIsW4ol1FeTn6BrPWVJbz90vHsmNvPXvjCAV3/uMIdJS0bUCPj60iO3siiUQXolFCTG
         6i4ZMsGOJci7d15eLW3Y7gNN0PJo1ZQIaJim6oMnqk8+q3KbPFdJi4OYHLk9dcdLteCE
         az3LwHrXNr9TLHj2IdEVoUPKCLRpQ//wGHNaEJhYoAeKbZK+X0QPj+vmfiDLYiedxGoR
         jfg/81oF0G9iaf9CEkiBWSBaE4D/I9TyugvJGXprPInij2XDLH/8gm+8q4sgpgHjqJCo
         MyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735915111; x=1736519911;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=znG6EiP7+LexAxITyxuokgw0IFZZFiG9gFOzUCnhuvc=;
        b=CApIAlKGUNGp/iiK5e31Q7vdsh7BV0elKzKBnxiX4KnZiDSeQ6JGj6b9H1b9SfNZNj
         M2Z0X4QrvgtveU1yvxOfLmCnwt5CAAofr4nN3U2frqjrCaJfCCbkOGugWbOpQoZ/6+ps
         PGe9M8u3l15JMVkaTaQVBd6ij88ZEbnScbmmWAXy3jDVD0jZOidrzgC43AvVIWeSUh7o
         +Uc2QmXKf9c8VFbaeqlJfYuwK9nJ6bsnlFYQa2uv9F6SGAgjWMqsjjYyAKDz1ae0noQ8
         1gsHcuYRPmeYo8RdO1fur15ch6o5KjY9s1L7omPBO7pZ5e5mnE2p+YVaeqGAlIjAtqbi
         +bFA==
X-Gm-Message-State: AOJu0Yy7eRdcvy3lkDdBUI6zbNtEI8mF3IzGqTuJhzwuwd9cMdNcgcOn
	ppvQDVe5yKkljR9oH0pFShc6BbybBl5xws3TaX+Wx3BGH8xs8Vl1tr9zFi8BB68zYHobOtzcNq2
	b
X-Gm-Gg: ASbGncslC8DrckwVG9NZH60ZZp2wuY6EUwG4AP//iK1vI8xrehl2qK7dEKwULP7Qkbn
	H28T3/SkOFEDyUB7mNCD/stMVOgEZBX/ktjL7YCOX4V4Fqmn9HltNUpVLVaTZOVcFaecn0VdtxL
	fa2SNFv66tRcyhRWkJVetcpiOI53zljzJ6IV5IiKI1iNwAvrO+08FJY+lEcjo4v8JVJqzDSBtup
	Xv82/LWNQw43NwZNZODflAQpvk/Zf85w+jhw77js5Ns32NiSONH7TGZX11fk7sKCamqMu3mJIcB
	nQ==
X-Google-Smtp-Source: AGHT+IGbVMUUGLeKv4RCP5q0AuUwvJJg6UOzWTri9rwDpIXKghstZhvyHZ1PA4GPI+GUgfAxRtRUDQ==
X-Received: by 2002:a05:6000:1569:b0:386:3327:4f21 with SMTP id ffacd0b85a97d-38a22a648f7mr36876269f8f.27.1735915111557;
        Fri, 03 Jan 2025 06:38:31 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c846ca4sm41558404f8f.43.2025.01.03.06.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 06:38:31 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] arm64: dts: qcom: sm8650: rework CPU & GPU thermal
 zones
Date: Fri, 03 Jan 2025 15:38:25 +0100
Message-Id: <20250103-topic-sm8650-thermal-cpu-idle-v1-0-faa1f011ecd9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGH2d2cC/x3MWwqDMBBG4a3IPHcgo6Zot1J8CPFvM+AlJFoK4
 t4NPn5wOAdlJEWmV3VQwk+zrkuBPCrywS1fsI7FVJvaGjENb2tUz3nuntbwFpBmN7GPe+kmsEB
 66cT1LUYqj5jw0f/9fw/neQEgvAsSbwAAAA==
X-Change-ID: 20250103-topic-sm8650-thermal-cpu-idle-1e19181a94ed
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2382;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=1Y+0PH31HMIIB/r+VQ1ADyawT75GYepX5T0fBwmVuQs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnd/ZlptHTQ4I7vCTtJaQ1+rebpHcrqc7BlgBpFdoq
 BW3xUh+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ3f2ZQAKCRB33NvayMhJ0e/BEA
 CMSQJhK9QR3ImskFCxBnG2hMvaI8FofS98QA94aLLjWsl5P0zF3kIGoHvDUNTwhrv3lyJybPsdptfx
 2t5+MxnHq5PXp9OCYTZFm8sEu2uHcHTUesrF9ANgfZU07iRslHVuJ6KBxTVZgbBq97Ouovx79W46Q8
 3iXaMwMFbRMsREDZARSewYbF+Viux43yCLIn5XNK9Sqddvz38ecxJsWaoQbeS8OeuLpYXo7s603Dqa
 3n3Y6NtwAHSnB3RFCeJXi6wwk1cy2aVhu47kod18XVrna5YHCly3wE0N3TdQB1kW7rUJOLSYYbLxFl
 yFqsf1yN9x5xuqoY5Yn8K3y7HMwablL+cBJZN6A1iccncilRZIVpP9m+uBubq4PybSAfQAlsc/BP0I
 f3FcbwlZpw3I0hE2SKz4dvZ3Yx0gxJ1rNROJQoToPYV3mkXK1al0PTaw2tYSWfIpz3sE8HYhnNUK75
 ZIp2dsalLin9L2pjjoZRJO6/KyrmL1nx4WxKiWhNTmGMK4IRv0ZelzD0rXNHM1semVGqbrjNd2zM3m
 vPwAgqkrz3LlEooMO7Nk1kmtha0OsTT3oUZ+34KIZClpET+wbHbzcwspplmwhK+ih04EybQeXORqh3
 hbTX42QpML9qAtsZLPcivKyQReluLZQtcXyJNl4UmeNscvdlpsef0YDjEdng==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

On the SM8650 platform, the dynamic clock and voltage scaling (DCVS) for
the CPUs and GPU is handled by hardware & firmware using factory and
form-factor determined parameters in order to maximize frequency while
keeping the temperature way below the junction temperature where the SoC
would experience a thermal shutdown if not permanent damages.

On the other side, the High Level Ooperating System (HLOS), like Linux,
is able to adjust the CPU and GPU frequency using the internal SoC
temperature sensors (here tsens) and it's UP/LOW interrupts, but it
effectly does the same work twice in an less effective manner.

Let's take the Hardware & Firmware action in account and design the
thermal zones trip points and cooling devices mapping to use the HLOS
as a safety warant in case the platform experiences a temperature surge
to helpfully avoid a thermal shutdown and handle the scenario gracefully.

On the CPU side, the LMh hardware does the DCVS control loop, so
let's set higher trip points temperatures closer to the junction
and thermal shutdown temperatures and add some idle injection cooling
device with 100% duty cycle for each CPU that would act as emergency
action to avoid the thermal shutdown.

On the GPU side, the GPU Management Unit (GMU) acts as the DCVS
control loop, but since we can't perform idle injection, let's
also set higher trip points temperatures closer to the junction
and thermal shutdown temperatures to reduce the GPU frequency only
as an emergency action before the thermal shutdown.

Those 2 changes optimizes the thermal management design by avoiding
concurrent thermal management, calculations & avoidable interrupts
by moving the HLOS management to a last resort emergency if the
Hardware & Firmwares fails to avoid a thermal shutdown.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (2):
      arm64: dts: qcom: sm8650: setup cpu thermal with idle on high temperatures
      arm64: dts: qcom: sm8650: setup gpu thermal with higher temperatures

 arch/arm64/boot/dts/qcom/sm8650.dtsi | 322 ++++++++++++++++++++++++++---------
 1 file changed, 238 insertions(+), 84 deletions(-)
---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20250103-topic-sm8650-thermal-cpu-idle-1e19181a94ed

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


