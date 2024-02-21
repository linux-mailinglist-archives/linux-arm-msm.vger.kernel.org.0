Return-Path: <linux-arm-msm+bounces-12040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED13B85D850
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 13:52:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4D4A2848CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 12:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B976995F;
	Wed, 21 Feb 2024 12:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eBPLNFWm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F5C6995B
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 12:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708519973; cv=none; b=mgFgcoJq4kPedwTaTlHCz0oYjqf6yvvcz2DavyB6fA+va24Wuw1axCFILTXvU8ihWd7eoujwzd5mfZLWA3+AW0snEWYm7ajykofDtIIyhDcoUlrXMUgXO716+yUtF933QuIBPiKWgxsqvwl0M4KjHpOxxx57/z/lZyFMdOCBuKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708519973; c=relaxed/simple;
	bh=Q34MGmLpDzn2sDXIy+KyEQYaT3QoNxwJZUKti5Td7pk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=py4hakKKHiwH+8DSXTMvooybQDf9W9s+BsMCMQOhB7adfEC935uqShndZUd3YznyBFIv22lZ6WiHpkgCG1TdOw3CSpqONli9R5+hCM/CRptO+kOpvvzMARAUWVi5quBKabxhNL64lnn0SIPXkEP2YufIrUvNcWdRYNQWBME1f+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eBPLNFWm; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a3e7ce7dac9so420329466b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 04:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708519969; x=1709124769; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yU16TocWugH7F4lfHsPz28YesZel7rWXS48tKsMAJ5g=;
        b=eBPLNFWm4rD9lVjMiW+7kd5QTNT1xfZFz2ooHtG7eX25n3uTP74R7OrU839LtvvaA+
         f/mSBRESXjZAmOXGBn/GyyS+I+QMKh9gh9OA1KMaY66fECP7p6MU98NGOmstiork3dEx
         tGspTTjvmSRCwxORDAJzWFCcfY8Cc/kF9AJd0gszk3FoF8+edjTIUA9TCvPjmbOCYJ7c
         +l5++W6XrINzNomJWbsdyrHy0FM4HiNtyK3Kdzw/9U4wlm+PygL7Ef0Hvys7fbeckANE
         2eed08BX+TDD+4dDTqVtv9Fhi9vkgtDh+Pc9ltlmYBoCLUvu7tGUIVuGifFLZLA/3M+B
         GIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708519969; x=1709124769;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yU16TocWugH7F4lfHsPz28YesZel7rWXS48tKsMAJ5g=;
        b=IdkeTp7LrBUY0SW6OO52Fnzq+VJoDi9NA4sx5sBCSsUL86xUSeaD9PDEQ8Pbp98lUb
         NrDJwkWr0FGxVfAYEXS8FIBh8peJbsH2LG2eYy5T3vy2QcJQ20c6vMpuG0wZMU4ah27Y
         3a9Utuoxy5jgUdDj1KuEKXdndY3t0pKDvIS1NVuxt5qz+GGimB4j9q0i18W6dhD9J370
         BemoVIj0+0/8AfCIxM03YpNpDhmRvJxngOE5DEU/hTmWbeTSIDitjvhDvBwhLBTVYhHh
         PMIcRryPC8UKgRCnWFRhipb+bmHXIEkijsVDvlbqDtBL3/22qr8wEnfqVt8OdGQPpFxF
         gFHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNsPxOr7ZmPm/L0WnyNE2a34Kjy7hqUDujZ9dH+dxLzc+7P6/UrH90tO/1b316EcAR/IevqnRmTKEYNZlYhFNxxTTMTSdVfe44xbiLVA==
X-Gm-Message-State: AOJu0YyszXDFj5AWeyGPDwgflVLMgUwgZls97B1SnPYDhjdg7nHlk+pO
	r0WDKMNdrMtpGrS1GgzL4BnhlJ6XYcZiBzbX6dB46mkIhaneRjLIJecNA/cR6Ok=
X-Google-Smtp-Source: AGHT+IFcB2F2zitmluQ/uveI8ML8aEnCYgJw0KcvTusx9XgiFPDOV8i9/APzWecwPwmV0bI5C/T6gg==
X-Received: by 2002:a17:906:d78b:b0:a3e:bd4e:c87e with SMTP id pj11-20020a170906d78b00b00a3ebd4ec87emr7103630ejb.36.1708519969563;
        Wed, 21 Feb 2024 04:52:49 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id tl23-20020a170907c31700b00a3da5bf34absm4930392ejc.207.2024.02.21.04.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 04:52:49 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v5 0/4] spmi: pmic-arb: Add support for multiple buses
Date: Wed, 21 Feb 2024 14:52:36 +0200
Message-Id: <20240221-spmi-multi-master-support-v5-0-3255ca413a0b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABTy1WUC/43OwWrDMAwG4FcpPk9Dlt3a7WnvMXqwHbk1tHGw0
 9BR8u5ze8oohF0Ev+D/pIeoXBJXcdg8ROEp1ZT7FrYfGxHOrj8xpK5lQUgaCQ3U4ZrgeruMbbo
 6coF6G4ZcRrCKnEHtjdl70fpD4ZjuL/v72PI51TGXn9epST63/1EnCQiBtyYqlMHE7uuSelfyZ
 y4n8WQnWlBSrVEEErzyEknRbo+7N0otKb1GqfYVesfIEXV08Y3SC4pwjdKN6oKVKlhjvbN/qHm
 efwE5yJ1JpAEAAA==
To: Stephen Boyd <sboyd@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2489; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=Q34MGmLpDzn2sDXIy+KyEQYaT3QoNxwJZUKti5Td7pk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl1fIWhbMbxfrM0al5B9dNOsjis3EumNU0q+W3M
 w9TeiNRFgWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZdXyFgAKCRAbX0TJAJUV
 VgSeEAC8iMXfJrtVgyn4QtEOKV6l5nLLS/EAEzrn513ua+9qM9RzXwshMgMJylvTBc43IGLTMGY
 vGJX/W0O/tcgtzs2qx7PrngIdAtMp1h/deuF0bXr1M3Xb9fdePoiqXWD/hdziP1bGezL2tmig54
 A4UIEMMDedGCpDANSB9v3wlU7db7p7Y51YR5ufCUZ/fmPK696jAzzhCQ3Cycrh616hEnAAsFI1i
 n+EShGTjGsK4b5WZqeJBwuIFSdfKcvjQvR888qXn9Un2oNstYd2h51vu1IMFcE5OnMXLk2enK8K
 0knFZycXr5LuSv3m9Tt0uyxCBmAXG7tpd8u3IplcoPNEZ8LhPA6UihTMfrGC9bjRPe76gC+dYqp
 4GI07UuYE+Hv4V2ZMpkz1bXnJ3rlZ0+AnvPT5PHluNJt3M0R0q3riT3fez/EK8ftPKt54fvgSs+
 tVPG1YkoPcfHSk880GeVWAZajciPviQlpXekRFArhuHq3Urg2SUhXMtsaZNTPX/xzhuRh+Feibh
 jkFrx67gs3KcrT2xCmu2FmsKHQQa27Y+TstufqB0Ex1eQbNxy8lwEPdFDZ8vZiuqGjgfX9Bmkkn
 r2d8PBO3uMVhVjNVdiIHabM0/iYfW4+5mwSWmovnNb2LfwXKrLBUV2Qgv5l+KIqDVFc1hiGlMx8
 fM5ifTQUbAw7q5w==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

This RFC prepares for and adds support for 2 buses, which is supported
in HW starting with version 7. Until now, none of the currently
supported platforms in upstream have used the second bus. The X1E80100
platform, on the other hand, needs the second bus for the USB2.0 to work
as there are 3 SMB2360 PMICs which provide eUSB2 repeaters and they are
all found on the second bus.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v5:
- Dropped the RFC as there aren't any concerns about the approach anymore
- Dropped the unused dev and res variables from pmic_arb_get_obsrvr_chnls_v2
- Link to v4: https://lore.kernel.org/r/20240220-spmi-multi-master-support-v4-0-dc813c878ba8@linaro.org

Changes in v4:
- Fixed comment above pmic_arb_init_apid_v7 by dropping the extra "bus" word
- Swicthed to devm_platform_ioremap_resource_byname for obsrvr and chnls.
  The core remains with platform_get_resource_byname as we need the core size.
- Dropped comment from probe related to the need of platform_get_resource_byname
  as it not true anymore.
- Dropped the qcom,bus-id optional property.
- Link to v3: https://lore.kernel.org/r/20240214-spmi-multi-master-support-v3-0-0bae0ef04faf@linaro.org

Changes in v3:
- Split the change into 3 separate patches. First 2 patches are moving
  apid init and core resources into version specific ops. Third one is
  adding the support for 2 buses and dedicated compatible.
- Added separate bindings patch
- Link to v2: https://lore.kernel.org/r/20240213-spmi-multi-master-support-v2-1-b3b102326906@linaro.org

Changes in v2:
- Reworked it so that it registers a spmi controller for each bus
  rather than relying on the generic framework to pass on the bus
  (master) id.
- Link to v1: https://lore.kernel.org/r/20240207-spmi-multi-master-support-v1-0-ce57f301c7fd@linaro.org

---
Abel Vesa (4):
      dt-bindings: spmi: Add PMIC ARB v7 schema
      spmi: pmic-arb: Make the APID init a version operation
      spmi: pmic-arb: Make core resources acquiring a version operation
      spmi: pmic-arb: Add multi bus support

 .../bindings/spmi/qcom,spmi-pmic-arb-v7.yaml       | 119 +++
 drivers/spmi/spmi-pmic-arb.c                       | 949 +++++++++++++--------
 2 files changed, 698 insertions(+), 370 deletions(-)
---
base-commit: 4893c639cc3659cefaa675bf1e59f4e7571afb5c
change-id: 20240207-spmi-multi-master-support-832a704b779b

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


