Return-Path: <linux-arm-msm+bounces-64572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8A4B01C76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 14:58:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01D8F17CBC0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 12:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE39C2D3226;
	Fri, 11 Jul 2025 12:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xkPZujKA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEA72D23AD
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 12:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752238683; cv=none; b=inIt7pHr5xg4vbR8QIsJHOlTIDOcqcihuqkdswwzP0hKMR86BedFYvk3TeQiANLppouH+f5PIQ9iO5VwTOWWY+xtpwmNhUOyye/OvOHlbj4tXEWxnsFJ6jWhe5HWSfgjh4xzMwOvRnC6dJFsFPSvkxGRncX0UihBeoT//2CP/Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752238683; c=relaxed/simple;
	bh=rRoRVwkvxaUZkAAhYjg/8ZcIpdvj3L5NEjayK2VBBXE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Mta5c5RDRXpb2NUMs6tAWEWPdpA8dqEFM/hoYfoZU/m1xZwQW1JMeVdPch+IN7YEWjRhvuBYYlXv0/qveGAasb0isSyvNslVx5MEn5hXqx8u0L2K+ODQ3NZA7WZhs7/8FqUULB1h7qYpOh1VOAvihWtneuReYOmn9F1C8oe0YvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xkPZujKA; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4550709f2c1so4263995e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 05:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752238679; x=1752843479; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uZ5zM+DTmwrYIPXpI1BKYyy0xjpK32sCOCJpD1MfVv8=;
        b=xkPZujKAYtwOTb+Oa8g50/i391NXOU0LaxsGKX2pp2q53visDWTQPShw6kehMIQ6n/
         /6pwXkLQZW2muXKGEG1zLKc8rn8WNR+YhXHQ2iH44uKDjhxul1IcAHB4NCorL5DO/GyD
         AV4Ki++LkgKvYoa6QX+NNe/14moZEiZ6PtlgOQ0bkUXowfqxksie3gFqM2/9gVI3Ahhs
         OvL2M9mr0gVx8YBa71eJV0ua7/4k06uVhkXF+lflxbSEgAL5dzLvDqdBvwjqjhQm8811
         +CnB2Yu7mGBc8BmsaX3JwCwfc0evGGrL5AUwG5eCLpPet3nC8wXLuksAgRfxLotnNvuC
         V9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752238679; x=1752843479;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uZ5zM+DTmwrYIPXpI1BKYyy0xjpK32sCOCJpD1MfVv8=;
        b=wya7lkIII8wY6cDbBiIN0TcqrE5lITZBulBjqwMLKapZsZijGNYkqH+IhawzyhvdPT
         7b6di/hx2ALqUT2+eqowuIrqE1iwUOlsEqPA5fl+xDrRFmJXWiGc5Tc5M23UBQuROWAO
         e523yqrEHRaQOP/VaqasHG/JeYsnOaixycz0QuNCklSrNDU+gyN2owHEMyYs+2Nsz0W9
         Dw9+TRq7lbtKeKfxipxPTJr8cIRE8SVcb8Zj6Y992Lm2S7DKWQI/wPjsBCDY8CKauCC1
         3k6TDIT2BlNdhondj8RK+gyqF5xG7Ap/LuvuF+CraymLSS/8WQ80/V5OJo9NGO2KUj7v
         D13Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7te/eNU3xIHieRyHCxRJLP8GvhjKQYxqJi0fEoBbzNQ6IoxT/3ARG0IQAryuSy9RnK4Cvvp43W9f8YnTQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6wMTUX2XnDPrRUkzO9J8BaTE6hQV9iyOFMAsl/F9ZNFRa96e/
	ccneieQPzvQLWkaDwKGnFWnowNzc9aaIWbI1gMjXGQW6e1QUtK4Iaryn3VYDf+/nOts=
X-Gm-Gg: ASbGncsQVUimnZsCP6pIh/2qidBcm2CiqY0GLJAAS8dZSnkU47ix0D3lJORP27sJxUA
	X6mcd+NQO+g70as1g8VQrwJvlIsnWY0SIdN32g3lY+5cC0lc79lmeM3lGpQBMgrSCVRB2TcVI3c
	rJpA5fQGmssqWi41v5kWzAsicBDELWcshMc825r9SariGCevcyv5bDGC1J+RpWhm+Ohe+Ih4dGL
	qPw8ALiL989QM2tZ89q6d7zMs0eSPjE7egs/FuMMmilQhiGsxbn2XxhLpWOPEcyEZrpZMmfWryL
	RsWqOaGyI4tyd0VvCIhCAVpAgNrMbvie6pQROA385KitKAEpr2HTMCGceSfUbIl0ah1lv9+Oj8J
	r6Bf2qPHhoAHPRctZPCzcxr/kuO1024nLPehmQojmlUMKMTF+wAda8ssxIBQ/jsjl
X-Google-Smtp-Source: AGHT+IEUq/5bGbwiREGh264NYbx5DrGMTp2/wSMofQxQTSNbZqSB9Hh1AJ7e4PoHCHmrz0RHJdHYEw==
X-Received: by 2002:adf:fc11:0:b0:3b3:a6d1:6b57 with SMTP id ffacd0b85a97d-3b5f18d96e8mr2396041f8f.44.1752238678778;
        Fri, 11 Jul 2025 05:57:58 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc1f70sm4373648f8f.27.2025.07.11.05.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 05:57:58 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v7 00/15] Add dt-bindings and dtsi changes for CAMSS on
 x1e80100 silicon
Date: Fri, 11 Jul 2025 13:57:52 +0100
Message-Id: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFAKcWgC/52NzQ6CMBAGX4X07Jr+A558D+OhlAJNlJoWSQ3h3
 V046VGP8212ZiHJRe8SORULiW72yYcRoTwUxA5m7B34FplwyhUVTEAj4ebHZ4bR5Qm4AioA53Z
 KHjJzFWWUgjX3lIApqrtSNk0rDEHhI7rO5z12uSIPPk0hvvb2rLb1r8yMR6iktrXRshamOuOni
 eEYYk+2zqw/3fInt0a3a23DbWcF4/zLva7rG36V1hRBAQAA
X-Change-ID: 20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-1506f74bbd3a
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8060;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=rRoRVwkvxaUZkAAhYjg/8ZcIpdvj3L5NEjayK2VBBXE=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBocQpSnpShpbK/cZuLnZlXx+DM1rFsmL5HAdBuV
 QcEnAw6K+OJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaHEKUgAKCRAicTuzoY3I
 OjLyEACYnTcJxnWeZHdKRmpOrZWwcWeNTyCJ/StiYPbFDF7bL2H3aSvGXU5Hzh4gLFXV8nKjh4E
 psCdc+ppdf6vpWd1JH4X+UlQEjc239H/MVfmvOEkQhMsDIu8XnW+PypqpInpKiuA2Yjd54zncNX
 6QRiCBoCqE/16LOVJ8FJNquTNllksWnktXmlbeJc7XvPZfAxhZjiMVfMrZZ2kP9UjikimsKgeoC
 eCPxc0h1iy8pMrq2rQxmhWRpzfQvwD3ekTE3qMOMa06WHJRc8cmi34G6y81gNq4BOHTETqAwJyN
 BzHNQCqWFN3CjnxVYVqNjIyMNfNJwIiiLlUU1+fsfnzjngkmuwD8cvE0F+dzCWF6a84gApjiQiq
 CJgN8BJWe80AKmJza4CvAHzhRu3e65iFTMXpCk8AdR3Vm/LMd/ojxvoz0HYhOzvcRwO3+1/8gdY
 JzeZYZBgjVVBkbMAjNkTQ4RRuV3J5haNtSoZwMyHkcWqIhTcApOkjSJsVpWEnk8kQcb9LpLC8BO
 8gvXeD2D4nlYCJU3xQaickZNFrS1tLFxU0N8dHKGaSzTSCp50fHTazT9EFU0kPPJdc7oTtcUDt3
 yn2WtQUPu5BQp6Fm/Sb+jr60goo0Z2PcXdTMe+/9WcslyJeCXaHEA4xdDGLDC39Q0Ky3wPSe5Q0
 a1vOENPkGZ1MQSw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

v7:

- Reimagine the PHYs as individual nodes.
  A v1 of the schmea and driver for the CSI PHY has been published with
  some review feedback from Rob Herring and Konrad Dybcio

  https://lore.kernel.org/r/20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org

  Both the clock name changes from Rob and OPP changes suggested by Konrad
  are _not_ yet present in this submission however stipulating to those
  changes, I think publishing this v7 of the CAMSS/DT changes is warranted.

  Its important to publish a whole view of changes for reviewers without
  necessarily munging everything together in one sprawling series.

  TL;DR I moved the PHY driver to its own series review comments there
  are not reflected here yet but "shouldn't" have a big impact here.

- Having separate nodes in the DT for the PHYS allows for switching on PHYs
  as we do for just about every other PHYs.
  &csiphyX {
      status = "okay";
  };

  We just list phys = <> in the core dtsi and enable the PHYs we want in
  the platform dts.

- The level of code change in CAMSS itself turns out to be quite small.
  Adding the PHY structure to the CSIPHY device
  Differentiating the existing camss.c -> camss-csiphy.c init functions
  A few new function pointers to facilitate parallel support of legacy
  and new PHY interfaces.

- A key goal of this updated series is both to introduce a new PHY method
  to CAMSS but to do it _only_ for a new SoC while taking care to ensure
  that legacy CAMSS-PHY and legacy DT ABI continues to work.

  This is a key point coming from the DT people which I've slowly imbibed
  and hopefully succeeded in implementing.

- In addition to the CRD both T14s and Slim7x are supported.
  I have the Inspirion14 working and the XPS but since we haven't landed
  the Inspirion upstream yet, I've chosen to hold off on the XPS too.

- There is another proposal on the list to make PHY devices as sub-devices
  
  I believe having those separate like most of our other PHYs
  is the more appropriate way to go.

  Similarly there is less code change to the CAMSS driver with this change.

  Finally I believe we should contine to have endpoints go from the sensor
  to CAMSS not the PHY as CAMSS' CSI decoder is the consumer of the data
  not the PHY.

- Working tree: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/x1e80100-6.16-rcX-dell-inspiron14-camss-ov02c10-ov02e10-audio-iris-phy-v3
- Link to v6: https://lore.kernel.org/r/20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org

v6:
- Removes 'A phandle to an OPP node describing' per Krzysztof's comment
  on patch #1
- Drops Fixes: from patch #1 - Krzysztof
- The ordering of opp description MXC and MMXC is kept as it matches the
  power-domain ordering - Krzysztof/bod
- Link to v5: https://lore.kernel.org/r/20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-0-846c9a6493a8@linaro.org

v5:
- Picks up a Fixes: that is a valid precursor for this series - Vlad
- Applies RB from Vlad
- Drops "cam" prefix in interconnect names - Krzysztof/Vlad
- Amends sorting of regs, clocks consistent with recent 8550 - Depeng/Vlad
- Link to v4: https://lore.kernel.org/r/20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-0-c2964504131c@linaro.org

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
Bryan O'Donoghue (15):
      dt-bindings: media: qcom,x1e80100-camss: Assign correct main register bank to first address
      dt-bindings: media: qcom,x1e80100-camss: Convert from inline PHY definitions to PHY handles
      media: qcom: camss: Add legacy_phy flag to SoC definition structures
      media: qcom: camss: Add support for PHY API devices
      media: qcom: camss: Drop legacy PHY descriptions from x1e
      arm64: dts: qcom: x1e80100: Add CAMCC block definition
      arm64: dts: qcom: x1e80100: Add CCI definitions
      arm64: dts: qcom: x1e80100: Add MIPI CSI PHY nodes
      arm64: dts: qcom: x1e80100: Add CAMSS block definition
      arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD pmic,id=m regulators
      arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB sensor on CSIPHY4
      arm64: dts: qcom: x1e80100-t14s: Add pm8010 camera PMIC with voltage levels for IR and RGB camera
      arm64: dts: qcom: x1e80100-t14s: Add on ov02c10 RGB sensor on CSIPHY4
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add pm8010 camera PMIC with voltage levels for IR and RGB camera
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add OV02E10 RGB sensor on CSIPHY4

 .../bindings/media/qcom,x1e80100-camss.yaml        |  92 ++---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               | 108 ++++++
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 138 +++++++
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 130 +++++++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 413 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/Kconfig          |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.c   | 157 +++++++-
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   7 +
 drivers/media/platform/qcom/camss/camss.c          |  94 +++--
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 10 files changed, 1016 insertions(+), 125 deletions(-)
---
base-commit: abc18a3c34b4c110faa2052146a6a0a8d454ccc6
change-id: 20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-1506f74bbd3a

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


