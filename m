Return-Path: <linux-arm-msm+bounces-45479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C94AA15F68
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 01:55:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D87C1885DC5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 00:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9318E63CB;
	Sun, 19 Jan 2025 00:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZXnssyyG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6B3D2FF
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jan 2025 00:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737248101; cv=none; b=n7ObW20AV36K847lEEDvtUgSzwv8vvSMAI37neObnr37dTd9fS61x+s5St3MFxhztQl9mbaxxXV1j3e/oB7yJaY63DqHXsGt9rsqsrM7rrE1FAnA6i79ey/YbM/fPtAPrsVMfybfG9xZqMSNDjLzGlZvylEauKeMptmYAhMB5Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737248101; c=relaxed/simple;
	bh=VFtYwX07oZvHGxiVg/5uqQZa1Rz1XByvclsQUprLecg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ceEVCpClg0zcnGAArC8KwUtPXfHM6Z9J7iLePNQLAbxtWOuaovt830/dJKditwOzAR2DuCo8MqxwfxCk/O6SMEUTJ5R8gqUMrEm1eIezqGTrOgEyZSh7j7aQFkzUq8duNgx1cS71ZG4Z28g/2+pR2dfIXVth4k9Ea0lGrokr7TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZXnssyyG; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38634c35129so2698668f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jan 2025 16:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737248098; x=1737852898; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sPVy2TZ7nxNOnPzYmR2/3BBjXksk2FPEQABRuEps/hI=;
        b=ZXnssyyG9sM7nECFu5g+PTqS54/M93wzP/RPV96DF6Gh+KinkDtFeeu9YGnbJ0O2Pu
         +xxTxeB3LPYfIZycV9Sjf5Ih/ZvfayqkuO1LdCIJJnlR/h8FsG6st2so28xCkQiLzrOV
         ikqFe1kDd0lq3UrjMbfdood7PCHtHG+ncLuRJwq4hnIDHWSNRZ8BwLTTrKL0itYfELHH
         ImKkAKqp7IlzBh4QwRhFzE0yIRSmeBXGsYP7Rn4HxhzVMzWGn28l2Tyf6kueZ5gpruo5
         rY4E2NM1C2zK3QjzSpjAcl8IJcXYfLFrafOBaxalYb04rgWsUpAcaYDDOJTIUBOuqq5h
         qw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737248098; x=1737852898;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sPVy2TZ7nxNOnPzYmR2/3BBjXksk2FPEQABRuEps/hI=;
        b=PRpPWo/OpXivx5rjAUiXDktRLBC1dKEmps9WWRe7tAJNxwdu7TbypU7vZPzq/n4Vfv
         6lObHpf7tW8xV4TYP6xwD13KWyVAAzkbbNtp766rrYw/Mp0tCdN/HIAY7oGAPCQWo+d/
         TzEQf/fQJgezvcRIqSIqWYx2aQ73YQztiJfSKeH3NpWiXpL6KkigA6WaEU6/Mj4sQvOg
         8Y+Am4WyycdrvASPws/TVP3cy2uk9l4J/AfeaWFe4KhdPs2NV8pXy3w9mn8VSx8HvmAx
         N9y8PDT29UWhuiuyDfEwV3X3ndHN89yDQwj4RdZde2f8PAx8t3vZx31LCRU9Cv1NFOqc
         gYpA==
X-Forwarded-Encrypted: i=1; AJvYcCXy7vsVumEegpXWgC0kcFOI5rMRG+4xi0ZItZzDm2/jYaqz8n1h2F0DwRm37GNl+pBbk0F7iUD6hdtynV8s@vger.kernel.org
X-Gm-Message-State: AOJu0YyzL5d9EtOOedN6zerxO36z4OUxUyZVKaqtC6bWYAhwiE9zM+xF
	EONUtQsuZezXaVb1D9jrjD9jDZFd26H95McY4rbZoIJCilQy+yTKmcKu8d1mKXQ=
X-Gm-Gg: ASbGnctOX1vr2EhTACGRdIIcKkYXgzoGVkEheBA8hQfRiIA+eCW5n/FDwBwlfWaKfVh
	dTQzMUid3mYe+oZzy8GbF6wpn8vTLURO0eMqvkbF6kfrCbSNJFTtstrH0tFnj8ou369tZs0oU3s
	F56Rr/WIikwQ1Un/z64yjxa5b5ZVVbS/bpcf+Cn5OJuHUND6RS2oxxSiDU7x5JmMF4TRv1adnNI
	fS/DdODap09UiuUM4oNPZB8SfpcZ5X8PDUj6hxBmKNjirmKIhPBeYiSaxjsv3xuzNEOgh3j7lYs
	viM=
X-Google-Smtp-Source: AGHT+IGtOaL5Zt6V5dTGsVlWfUStNwZWdqma2iCttMpY56KqQ7XHBLD+8DWgwoEHOAJDPekrodr5Eg==
X-Received: by 2002:adf:fec5:0:b0:38a:88d0:18d6 with SMTP id ffacd0b85a97d-38bf58e8fa8mr4691530f8f.42.1737248097750;
        Sat, 18 Jan 2025 16:54:57 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322aa40sm6339241f8f.45.2025.01.18.16.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 16:54:56 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v4 0/4] Add dt-bindings and dtsi changes for CAMSS on
 x1e80100 silicon
Date: Sun, 19 Jan 2025 00:54:52 +0000
Message-Id: <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-0-c2964504131c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFxNjGcC/53NwUrEMBDG8VdZcnZkZppJqiffQzykmXQ3oK0kt
 VSWvrvZBRHxtB6/gfn9z6amklM1j4ezKWnNNc9TG/buYOIpTMcEWds2jGyJ6AEGC695+thgSts
 CbIEIqAddaoaNUo+ECDG81Qo9B9f5zil6Ng18L2nM2zX2/NL2KddlLp/X9kqX678yKwGCWPSiX
 kYn9ql9hjLfz+VoLp2Vf2xmf5PNzUY3qkrwKsPwx+6+bWlvfJPdNTsOzqmIMsb4y973/QuC+Ft
 InQEAAA==
X-Change-ID: 20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-82a63736d072
To: Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-33ea6

v4:
- Applies RB from Konrad
- Adds the second CCI I2C bus to CCI commit log description.
  I previously considered leaving out the always on pins but, decided
  to include them in the end and forgot to align the commit log.
- Alphabetises the camcc.h included in the dtsi. - Vlad
- Link to v3: https://lore.kernel.org/r/20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-0-cb66d55d20cc@linaro.org

v3:
- Fixes ordering of headers in dtsi - Vlad
- Changes camcc to always on - Vlad
- Applies RB as indicated - Krzysztof, Konrad
- Link to v2: https://lore.kernel.org/r/20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org

v2:

I've gone through each comment and implemented each suggestion since IMO
they were all good/correct comments.

Detail:

- Moves x1e80100 camcc to its own yaml - Krzysztof
- csid_wrapper comes first because it is the most relevant
  register set - configuring all CSID blocks subordinate to it - bod, Krzysztof
- Fixes missing commit log - Krz
- Updates to latest format established @ sc7280 - bod
- Includes CSID lite which I forgot to add @ v1 - Konrad, bod
- Replaces static ICC parameters with defines - Konrad
- Drops newlines between x and x-name - Konrad
- Drops redundant iommu extents - Konrad
- Leaves CAMERA_AHB_CLK as-is - Kronrad, Dmitry
  Link: https://lore.kernel.org/r/3f1a960f-062e-4c29-ae7d-126192f35a8b@oss.qualcomm.com
- Interrupt EDGE_RISING - Vladimir
- Implements suggested regulator names pending refactor to PHY API - Vladimir
- Drop slow_ahb_src clock - Vladimir

Link to v1:
https://lore.kernel.org/r/20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org

Working tree:
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/arm-laptop/wip/x1e80100-6.13-rc3

v1:

This series adds dt-bindings and dtsi for CAMSS on x1e80100.

The primary difference between x1e80100 and other platforms is a new VFE
and CSID pair at version 680.

Some minor driver churn will be required to support outside of the new VFE
and CSID blocks but nothing too major.

The CAMCC in this silicon requires two, not one power-domain requiring
either this fix I've proposed here or something similar:

https://lore.kernel.org/linux-arm-msm/bad60452-41b3-42fb-acba-5b7226226d2d@linaro.org/T/#t

That doesn't gate adoption of the binding description though.

A working tree in progress can be found here:
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/x1e80100-6.12-rc7+camss?ref_type=heads

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (4):
      dt-bindings: media: Add qcom,x1e80100-camss
      arm64: dts: qcom: x1e80100: Add CAMCC block definition
      arm64: dts: qcom: x1e80100: Add CCI definitions
      arm64: dts: qcom: x1e80100: Add CAMSS block definition

 .../bindings/media/qcom,x1e80100-camss.yaml        | 367 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 351 ++++++++++++++++++++
 2 files changed, 718 insertions(+)
---
base-commit: 0907e7fb35756464aa34c35d6abb02998418164b
change-id: 20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-82a63736d072

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


