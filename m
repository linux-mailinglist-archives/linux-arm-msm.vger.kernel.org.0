Return-Path: <linux-arm-msm+bounces-2487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 606D27FD9C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 15:41:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12F76281FD4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 14:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1ADA32C8A;
	Wed, 29 Nov 2023 14:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tF8eLQM4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C236D63
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 06:41:05 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a00a9d677fcso922141466b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 06:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701268864; x=1701873664; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LMoxKGnJmIGZfkHJ0E+5YEBeUlZH7zeNhRCLk2Cz1pw=;
        b=tF8eLQM4U8+pXxKVhYrxrejm+W2m43XveXmFIomUv4/TeZZ0mlHgJKU5ovES90X5dU
         wpQsSJzpWq8xX155b4jPpSNsRvZKKlN6TtlzTYa0c0tTA+l0Yumw4ee4EE+x2TtBVv94
         WodZjZhfFpcQae2eFWhRTeYiGpe3JqvL/Aw6xWdf4CP4ZBhqnats2fkeLEEgELC+Y2Xb
         PsxalQNmHbGJCFWigslGTqTpciitPu/AoF4ir6ePsHVKGh3y6K2phrrHLGSQKEPBR5Bh
         fLAt7x6Iie/2QfPXSZU0yzhQGXGpfzausOqXmTmrKfjANTfjuUtbvR2VJTqUuIbR+gcr
         Vm9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701268864; x=1701873664;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LMoxKGnJmIGZfkHJ0E+5YEBeUlZH7zeNhRCLk2Cz1pw=;
        b=VvnlBe/9AsuulGxVv025RJY5oewz5s5jUkTz9vauEW+2+mWOVrywBNhN88ZD5YvsYA
         f9fZCu3eD8BBgcJofpTFt8SvqRN2iPzl0WkV9N2n4Jil8wY/ap8SAq72habiBa5oHBO6
         h//H2Ns4xKlOokDowZAW157gwoYXH0eeRNRtcFXBEJoCzAT5P9vWavNEC4vyURaz20Ib
         HxpftdHul4fVAafkqklgBgtELgX+sQ5u2JL0yBtLEN3NpcOdA0alybCVvHu8EIWzuscN
         5zg5p+WKewDe6Iq5YmXHWqcC99DYe2Cy3wyIflWO4oACPtbwvcCqJlwJFHf/4CvhNAgz
         zyFw==
X-Gm-Message-State: AOJu0Yxp/adcFsrsCTMaKvEXwDg5ihuKZPHppU/F6TtePo+e+xPIG1bl
	ScBH8m/4JECon6PIaDnLhK0e88OFgTebYPNMSBw=
X-Google-Smtp-Source: AGHT+IHtZWKqnALRv6XH1XM5IA6QLLyVhZAx/wZiqDeiiFlMfoihiNp0TV6mitiWZ5KIYlWQk9GYNQ==
X-Received: by 2002:a17:906:d4:b0:9e3:fbab:e091 with SMTP id 20-20020a17090600d400b009e3fbabe091mr12145976eji.15.1701268863769;
        Wed, 29 Nov 2023 06:41:03 -0800 (PST)
Received: from [10.167.154.1] (178235187166.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.166])
        by smtp.gmail.com with ESMTPSA id s21-20020a170906285500b00a0179ebc25esm7965638ejc.85.2023.11.29.06.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 06:41:03 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v3 0/2] SM6115 interconnect
Date: Wed, 29 Nov 2023 15:41:00 +0100
Message-Id: <20231125-topic-6115icc-v3-0-bd8907b8cfd7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHxNZ2UC/32NQQ6DIBQFr2JYl4aPQaUr79F0AQj6EwMGLGljv
 HvRXRftcl4y8zaSbESbyK3aSLQZEwZfoL5UxEzKj5biUJhwxmsALugaFjS0ARBoDFXQtU7ITir
 XkuJolSzVUXkzFcs/57mMS7QOX+fJ/VF4wrSG+D4/Mxzrr3wGyqhTAgzTQjRG9jN6FcM1xJEcq
 cz/6rzojRyYGCTrWtBf+r7vHyViF6v/AAAA
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Georgi Djakov <djakov@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701268861; l=1565;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=MX9IDohAdLeqrMZe7B3DDkmX0lHf4lB2uYiaw1SW1iI=;
 b=OQFeRKLny/MJaXzmEndsYyPc+1Zg5UKcwChXoiOM1rPKhb7G7Qo2sxFd3mDWMClZEUOK45MsZ
 jbSpN+PPraNCeA2X3rpfb/AkGQgLfXPwIRFsepcN7/xfsSzn9pUk43z
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

As it says on the can.

Georgi, Bjorn, can we please set up an immutable branch with the bindings?

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v3:
- Actually define clock-names before using it in conditional blocks (oops)
- Link to v2: https://lore.kernel.org/r/20231125-topic-6115icc-v2-0-69d05d90871b@linaro.org

Changes in v2:
bindings:
- Remove unnecessary '|' after description:
- sort property definitions in a manner that resembles their proper ordering
- define clock{s/-names} before using them in conditional blocks
- drop unnecessary allOf:
- move unevaluatedProperties after the conditional blocks
- disallow clock{s,-names} when unnecessary
- fix up the example
C:
- Apply my own fixup (ebi channel configuration)
- Link to v1: https://lore.kernel.org/r/20231125-topic-6115icc-v1-0-fa51c0b556c9@linaro.org

---
Konrad Dybcio (2):
      dt-bindings: interconnect: Add Qualcomm SM6115 NoC
      interconnect: qcom: Add SM6115 interconnect provider driver

 .../bindings/interconnect/qcom,sm6115.yaml         |  152 +++
 drivers/interconnect/qcom/Kconfig                  |    9 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/sm6115.c                 | 1427 ++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,sm6115.h     |  111 ++
 5 files changed, 1701 insertions(+)
---
base-commit: 48bbaf8b793e0770798519f8ee1ea2908ff0943a
change-id: 20231125-topic-6115icc-a187f5989af7

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


