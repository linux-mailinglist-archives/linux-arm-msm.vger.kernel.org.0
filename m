Return-Path: <linux-arm-msm+bounces-9088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C829842D22
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 20:43:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 477BC285AC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 19:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C2569D36;
	Tue, 30 Jan 2024 19:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P6nZjW2W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529D217F0
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 19:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706643778; cv=none; b=POq1tyGeIivrBqGK5Ghk+qr6u9eCDcEZsiwqCgxu/QdgZh9dMThOekJT16UipWIWEFtoH0GBfg5+fj4jszvBAr0lzLdLaJvIU8cLmOFGiZ3Gn8uQD7czvsA3k9l8v77JCwwEAi7C8JcGMpwqIdAmApL3jNYhLPATtTwg93hXM/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706643778; c=relaxed/simple;
	bh=8Z5BmS24X5tLLWjTuRpodf6heaUgSKvg43jPQHOk2A4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DGW9Zkt4Nydz6rRPZenFEw6UhadyH7YQONTyNETen2zxstttLq8SqRuOs2nel0R7yt689GKSxXAZDoQZZ9qz3L4ryHW4c5/mNIVwQoddVnlVFDFa7PNiQtWdQe4A4Z84vNzaSSykWAHyvZ3ce4yjk65iTR9n+ubtmBnYGWbRuaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P6nZjW2W; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51114557c77so2760736e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 11:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706643774; x=1707248574; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xZZ/IjAGrG4aEkz2PzCtESz3DMt0HbnwCgbZRXQA31Y=;
        b=P6nZjW2WJYEKK0G6tpTfLvBcmi8kWpg7Z4nrM73XfphvTH5FOMFyOaxSZuPIFsAtFV
         AXvNpftpo++qosWHkNrOebPZKPakcHnJ8ALclDMWy/NitMh0q4Jrh7iW77HbCCulwJLo
         TYuDnt2obf3OOru4JObFWRdoNec83vwod1f3xeklhHu1Ej8HE+23V8BLTDATxUnn6JFI
         BdSbDhxhAIGR8ruf2MokaSfv4kuzlq5rGatXl1t96Q1NH818qGzjuNv9IZ+H0pkKMNGS
         nCyFO2Q0bBZPW/TqPpiQkBz/yflgcbU0HC03xdQtwNborjT1Cs9qgw88a8ldjrDMkiF6
         HXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706643774; x=1707248574;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xZZ/IjAGrG4aEkz2PzCtESz3DMt0HbnwCgbZRXQA31Y=;
        b=X4H+7BWGhhbgSeVzT/3Qkr3SizhKkxox5JJHgS9wUY7cTo2cwkKl/9AlKB4I5Mgk95
         qCZY+Kju9G5JHKGm428ll2fmKdrofu6+W13mZ2JqGQaBpaIKciex8kt6Ddk6vTnHKWsf
         PsliqCQfxaQmqTXE+RDWohlsdd/pfA/YHiMzdwBTxf0Gopdmj1DaftRr1hJUorGUYn7V
         U1L+fkJHKpooUzOlMyQSg/eDxUZP3/oVVbcAzf1RvGjts8DBXw8rE5JyUUAvbZBGmNYR
         qEE7RxcFbORZQmT9SGQRy3O+CV5eM3OjEOUnRYROGe3wLDOokOH/IjRS9t7gzh7b5DM6
         Y6bg==
X-Gm-Message-State: AOJu0Yx3TjNSBGWO10Xebh/T5QPRbfDJEqsJHZVbveIH3rmybEo+5FuR
	cMpTokxpqZ+VaXsOoYygekoi4aEZCobdybJwwONHUfjB2PJME23BAKdyfgxL7FY=
X-Google-Smtp-Source: AGHT+IEPaXx6yRdNg9tDN1gAk1OvOK3B2JGlk8/T8ofgyC5zYLJ5dH11E/iIDDtNMPNGSUIpH40jRw==
X-Received: by 2002:a19:7609:0:b0:511:1b3b:c45 with SMTP id c9-20020a197609000000b005111b3b0c45mr1759529lff.1.1706643774363;
        Tue, 30 Jan 2024 11:42:54 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU+9C1V7WhIrefpiX6/NLamAInAce0JJmGvLsV73Ms18xDld7IOp51XQOMpplBWyX+zSUNqHJL4OxGwv++7vO7mFNHK+3SFUzC0nopz/nv+BBiFD4UWmlAbSK/VcqTimdUUToaMPiTn4N35ZAK2sTj7P3OxCrg35h3zDO6PEx5+YQE3kK0VcZqRvQb7D7EwtQAuTzkW6RATPGE+P3hW+gBxhV4+cRbMd5wZ+0QzYNzK47mGzAqI9XnNiMKMoYc5ItCaJJi17nUihE/V9uDYFDsXtTzTvl+yyNasM2tVM4o0y4mw/Q5bdxgdmFZhZAD2iIR1pjEU/F//061GwG/34oOTYtSyAF3CExh0doU/YhikD9GfgvHBAi+9uIad9m/lkkdAyu5ZucKVOo1kQaHg59bsL9ma3bW4lfyS+3BJQRz/M4scE6eP
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j16-20020ac253b0000000b0051021a9febdsm1552145lfh.153.2024.01.30.11.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 11:42:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/4] arm64: dts: qcom: qrb2210-rb1: enable Type-C support
Date: Tue, 30 Jan 2024 21:42:51 +0200
Message-Id: <20240130-pm4125-typec-v1-0-e8d0097e2991@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADtRuWUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDQ0Nz3YJcE0MjU92SyoLUZF0LCwODFMtkA8vE1GQloJaCotS0zAqwcdG
 xtbUAa9Yd814AAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1241;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8Z5BmS24X5tLLWjTuRpodf6heaUgSKvg43jPQHOk2A4=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+rOQJv/MwrY7a5e4FJksnq4ycNbY89Eo5ebbwlV+71SU
 F2vYH6qk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATmc7N/j/BxSjw1/TG3luH
 k/vv8l/ySvqSe+2Um+DalIS/v+7Zt7TbBFz8I8Z0946ZvcjnK2lWy7wyT4QuTH/5zSF6eo67Ou/
 GPduDNq68q8snocZyZemsfQ4Va08kXNHcUc7qkHBIt65sXasiz7yUBGkpUbnOG3y8Mm0XNnAZfy
 vr+Ki1bHuCnsl5F8+r/AmeCqcZCuQ+G0zzWfAwRV4vqXh2w6vce5EGm2/ZrZh/1rY28agJS5CzY
 avsqrp5BS4hjYJxYrKGmU2VKhuVV0mIT7A+azxPoGe6j/jVs31q+eorMo63vNrCICj/jel7iMDc
 h4crXF9EJVxYseK9/bQTUzntfZ9LLSg+ubW/ItEn4s5MAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Reuse Type-C support implemented for the PMI632 PMIC (found on Qualcomm
Robotics RB2 platform) and implement Type-C handling for the Qualcomm
Robotics RB1 platform.

Dependencies: [1]

[1] https://lore.kernel.org/linux-arm-msm/20240130-pmi632-typec-v3-0-b05fe44f0a51@linaro.org/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (4):
      dt-bindings: regulator: qcom,usb-vbus-regulator: add support for PM4125
      dt-bindings: usb: qcom,pmic-typec: add support for the PM4125 block
      arm64: dts: qcom: pm4125: define USB-C related blocks
      arm64: dts: qcom: qrb2210-rb1: enable USB-C port handling

 .../regulator/qcom,usb-vbus-regulator.yaml         |  1 +
 .../devicetree/bindings/usb/qcom,pmic-typec.yaml   | 13 +++--
 arch/arm64/boot/dts/qcom/pm4125.dtsi               | 30 +++++++++++
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              | 42 +++++++++++++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 60 +++++++++++++++++++---
 5 files changed, 135 insertions(+), 11 deletions(-)
---
base-commit: 246311c88c992ed675141212cbf19ebe6d11cad5
change-id: 20240117-pm4125-typec-8800d9c09aec

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


