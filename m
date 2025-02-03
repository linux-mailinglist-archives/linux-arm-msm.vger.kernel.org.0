Return-Path: <linux-arm-msm+bounces-46748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB8CA25AC2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 14:23:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19904164EA6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 13:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77E0E2054F4;
	Mon,  3 Feb 2025 13:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PxHgEq+6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56729204F92
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 13:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738589005; cv=none; b=NwB8ns6axIn27D6x5Glj9sI6cU+rqFb7EmMfVhLvZ5eU+NQ8W8Ae2OzR0ccq67vmIIRvpTZ7Bfi9DyZju0pVnMNzIC692p6TPsWqDVvfZz8Q0fDFuhZvf9UvbH1OSrMhGXAz0TvkcDjB9E+X2+V0CsDDMmEC91WhyKJM3X5cBZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738589005; c=relaxed/simple;
	bh=cQrv2SqpUl7InSRqNh2aggA1ZtzP147tm85RdAJwW4E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KhCe9hu+PiqocF4Int5LHvWExD70hMkjjLMFRILJs/mv+vjBP6ZOArHVmA0hEo/MdLCzXQPnDdh7u8RMftJYoTdDVyUDxmOFfWm9Htu4d6lAw7SrvfvhUObBtnB5o4ZEg9jQhm3hQVf5Ld2lw4YttUmGYoNhNvGU5ITgVGvaz5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PxHgEq+6; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436202dd730so31117715e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 05:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738589001; x=1739193801; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SidIMQ+TcWPZhwjq7NYPUDFpmffy0JRNbe4lk/zAxYI=;
        b=PxHgEq+6gDCeq0NSCtcqPCyNR4jOFl/XRmzaNKRtynAzQVU4S49+VAIChl2o4W1z/L
         g/7drXY/kHZFXhjdYQzn0fo1fOKRiQIgfS19AyBpmEGcFy34JBVwrfvBj6fDmUkjPO+1
         mPh0DH1l55dJZjEon5Jpbo4gl1dq7jhvytwJGqmJEsfUQZVwrAGWRUESTwKRW9ObY8xA
         pfQtoPr/trPWYsQ4mXiCG12HgfuBVujwCjcbcGvDqbmStGRW3jeSFcyrMEX1RDme3ac8
         kOVBJQc3Ls1+Y6KpWE7W5/9ovIk3V1OswEm1bFi+AzTqikOhx1RHHvWVwVNtr+fM+q4k
         vt6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738589001; x=1739193801;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SidIMQ+TcWPZhwjq7NYPUDFpmffy0JRNbe4lk/zAxYI=;
        b=wmd4gFSxGwqEIHw2QsC36VYuKSHPMRyRRyHbYdOvcbuPG0FZV540TH9TYwmFrB86cC
         KZI/4hC6wS1+j8/TvhSAj/+CTL4shBkpIcDtIbthE3g/KzyUyFHyC+lkJAWLy2hnZbAd
         yKREmoz0qdczWNHJGdgH+cD2EsN2eHMNcTEhLgAulhaRFf8l3GcsoJ8belu02VXty/hO
         IP0Xz46JxiIUmHjAw5NQ4IndS8vo0UEPKzD1GjJUoCTSis2/YQcwWSpGr2yUHTe1E2ng
         ewe1qTlDLaDCClDvP7QF3FWn92WdAxvdGR7VpeaMYMbBBs8O+y4ENq1VgTBw23k095ag
         Naag==
X-Gm-Message-State: AOJu0Yy9s0UCp2uLseCGWoL4rjh+sA3XA1pu0qiPycebKhQEnRddp1wA
	zscfk0MyQK4zZJckdvJ6IOMh0QQEHb1XDaC7QkVW4zm/t2fjG275awxKxvY8QFg=
X-Gm-Gg: ASbGncvS8XisC25ilizVXJhIJKOoOz6bralvWwLn4vk6RB3DYg7pRz8t0VluI5UcIil
	SeUBpJMcJneRGyHfSugiP6CVm1VqBShaLG9o8X3z3FZ4/RO9kFrfrIN+d34ztqGabKFak6Jb/a8
	KsAOrWcdHsGLqHp48kKjpnWK7PRAdlP6MU6wd35YSMTN0Kkw4nXzYq0Op6FYVPSLcZ7zwOT3bKV
	IiKqdhT8UBJkjZi7JXjY1+EqVCHs4WmY/93rxKVL/OWkjoyAeNX6FKaTWiiW9WxAt4BC/jVr4a3
	47DxUB8iaIq1O0ChkP5sstnwltuOhlRR3TDZ
X-Google-Smtp-Source: AGHT+IFL7lwZPaISIj1WLpf269+Pu5E33d6YUEVqcrc6nTOi1M6k0m9WUT3F6CqNiFcb7IdjyRkzYQ==
X-Received: by 2002:a05:600c:4e52:b0:434:9dfe:20e6 with SMTP id 5b1f17b1804b1-438dc3fc2b0mr182747655e9.23.1738589001477;
        Mon, 03 Feb 2025 05:23:21 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ece21sm12570858f8f.20.2025.02.03.05.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 05:23:21 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v4 0/4] arm64: dts: qcom: sm8650: rework CPU & GPU thermal
 zones
Date: Mon, 03 Feb 2025 14:23:16 +0100
Message-Id: <20250203-topic-sm8650-thermal-cpu-idle-v4-0-65e35f307301@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAETDoGcC/43NTQ6CMBCG4auQrq3plN+68h7GxUAHaIKUtEg0h
 LtbWGFc4PL9MnlmZp6cIc8u0cwcTcYb24dIThGrWuwb4kaHZlLIVICI+WgHU3H/KLJU8LEl98C
 OV8Mz3HXEgUBBAagS0iwYg6PavDb/dg/dGj9a997eTbCu/8oTcMFrRKgFAFVaXTvTo7Nn6xq20
 pPccSCOOBm4NC9y1LnCsix/uHjHSXXExYHLJJaAWSJUob+4ZVk+v3wwy2kBAAA=
X-Change-ID: 20250103-topic-sm8650-thermal-cpu-idle-1e19181a94ed
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3113;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=cQrv2SqpUl7InSRqNh2aggA1ZtzP147tm85RdAJwW4E=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnoMNGt+5dpbHKnfldK7Gfxb8F3+lEtWQFff1cel8l
 qH82eROJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ6DDRgAKCRB33NvayMhJ0eSEEA
 CHxvS4lrhCgZK28ztPFBV9weW0ZVwFjj3NEt8vSMx74bbpmLMoMjqDIBxpVIdQCdCJGdopbYmtuGWE
 VR63POYKSsXSfW26nzqQgoWzol6QHEmfUhBPT8WXmVPbosckJIPcjYPoODmKiZtoB9obrtjCvcbRkJ
 c3el6JsriIUAHfPAIiz2DHAP5j1/5nCdjAirJ17yairhuYcHHC34pSLowaqrGg1ICoqz7hEHTsfwSB
 YCnghG7FhylYlmVyrbwuGYVnPXB4CLYBguvyQtidZ4hnqaRSrB6qDBGiobzeTKkAsWVvSQXiFe9Ll4
 pEUq6IaRhDBNBXkk/9ksc8chmEM0ijj2cCwqlrraJOR8smbZSeEb66e1x880vOq47S5T1TTyMePfLT
 ir6C0B73yBfipaZ7hR3l25DScDHwDHVSqYk5VOFHIXmcT0swSRKSbhZlNC+1S9OeMPXjq4Ibuc14Mf
 g8kMwWRhwhuu8uN930kh6SnQ+Q0jdGRq/87oHLu+1Tn8UiRSTEyEHDt3XivzYOGS4q6MHfqtoVnZPO
 Zd7NOlL0Rf1qNXZ0uKSrbfuyZTX73tIWfdLRgJ4dEYQc9YBG1DTvEJmPVwnZqToB9yXiFmEr65FDXw
 DhvHfKuWySlQfgnyREe5DuCf9+jN0Ldi0J+5gSiyJ27BZf7YWl4OIxNWtPpA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

On the SM8650 platform, the dynamic clock and voltage scaling (DCVS) for
the CPUs is handled by hardware & firmware using factory and
form-factor determined parameters in order to maximize frequency while
keeping the temperature way below the junction temperature where the SoC
would experience a thermal shutdown if not permanent damages.

On the other side, the High Level Ooperating System (HLOS), like Linux,
is able to adjust the CPU and GPU frequency using the internal SoC
temperature sensors (here tsens) and it's UP/LOW interrupts, but it
effectly does the same work twice for CPU in an less effective manner.

Let's take the CPU Hardware & Firmware action in account and design the
thermal zones trip points and cooling devices mapping to use the HLOS
as a safety warant in case the platform experiences a temperature surge
to helpfully avoid a thermal shutdown and handle the scenario gracefully.

On the CPU side, the LMh hardware does the DCVS control loop, so
only keep the critical trip point that would do a software system
reboot as an emergency action to avoid the thermal shutdown.

On the GPU side, the GPU can achieve much higher temperature,
update the trip point with the downstream implementation as a
reference.

Those 2 changes optimizes the thermal management design by avoiding
concurrent thermal management, calculations & avoidable interrupts
for CPU, and allows us to use reach higher OPPs for the GPUs and
squeeze more performances in both cases.

While we're at it, also harmonize the remaining thermal blocks
by using 110C as hot trip point, and 115 as critical trip point,
and remove the unneeded polling-delay-passive properties.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v4:
- Also uniformize the other thermal blocks, using 110 as hot, 115 as critical
- Also remove the uneeded polling-delay-passive
- Link to v3: https://lore.kernel.org/r/20250129-topic-sm8650-thermal-cpu-idle-v3-0-62ab1a64098d@linaro.org

Changes in v3:
- The GMU doesn't handle temperature, remove it from all texts, just bump the temps
- Link to v2: https://lore.kernel.org/r/20250110-topic-sm8650-thermal-cpu-idle-v2-0-5787ad79abbb@linaro.org

Changes in v2:
- Drop idle injection
- only keep critical trip points
- reword commmit msg and cover letter
- Link to v1: https://lore.kernel.org/r/20250103-topic-sm8650-thermal-cpu-idle-v1-0-faa1f011ecd9@linaro.org

---
Neil Armstrong (4):
      arm64: dts: qcom: sm8650: drop cpu thermal passive trip points
      arm64: dts: qcom: sm8650: setup gpu thermal with higher temperatures
      arm64: dts: qcom: sm8650: harmonize all unregulated thermal trip points
      arm64: dts: qcom: sm8650: drop remaining polling-delay-passive properties

 arch/arm64/boot/dts/qcom/sm8650.dtsi | 430 ++++++++++-------------------------
 1 file changed, 117 insertions(+), 313 deletions(-)
---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20250103-topic-sm8650-thermal-cpu-idle-1e19181a94ed

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


