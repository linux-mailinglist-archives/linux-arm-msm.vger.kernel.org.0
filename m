Return-Path: <linux-arm-msm+bounces-17745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B57248A8C65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 22:01:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73BC01F230A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 20:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A19F63839D;
	Wed, 17 Apr 2024 20:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cEPzllLk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7E02D03D
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 20:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713384085; cv=none; b=qJA2ko5BQ2bj/PsXBrJMaM7IWqMOXBPGJgswWUZ6zJWFcuW4IwayaDhlrV9kuqGBXV8TvNY1fMbK7qRJv+BerbdA3FmWIMGVKnikM/kYNLeU+d0fWZT/WJdv0KM2U/b9sxe7OBOJad62ssG2knHiZkhD5VCpG6Y523O+7MdRcw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713384085; c=relaxed/simple;
	bh=/39vaYwH6c7D7U1qbeYjMZX94n9RUUOZ4f2TEoJ2CdI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l+G33FQNb1mM47KD/7VanSORJOTyWKNFTBvqzBJ3x8pFVbh4n3NdQ/a82PM1PhkNsq98WHSyfC8dRlSdLA0RJZIJpyiYhcI1azAYqRRH2vEkCv3EKBXkRAJ2N+w6ZB4J4SDLU9TnkhZPHXGfsT0P4Br1bpRyRA313P6JHc97CAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cEPzllLk; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a526d381d2fso219269966b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 13:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713384081; x=1713988881; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mETcPG/0eQHUUp+Hu5ATZjovZfnlIP1p939gJWBqEiw=;
        b=cEPzllLk3XIks7EdMd/csJQrXBTUHtoQd+m3oM/CYj9jy+L2XNCQn1lueumIK644NL
         L7wrgc+6YxJOTipE5WHFo2GV9cg/hmKlWCojLu+t9en+m8r3Rk4Zo7VdilNY9w/jOgH6
         rZMkA9BwcVDYoq/BbZg8tMMQF5TqpdD5ATU6zv2ycrBoe1T+Q2AedhSgBamSD8piKly6
         +fBpyz+tVnyN0EvF4eH8QILzsFiwV/VZTAtgAhwQv82Ghff/3EBg2E1xzRyvDXcUoj29
         gfyhaYv19Q4qfAUzgfZ+1Fze7/IlzencqrIbSdax+3o+h8EgOgVuUt+CxRFW4VwLk58R
         3vvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713384081; x=1713988881;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mETcPG/0eQHUUp+Hu5ATZjovZfnlIP1p939gJWBqEiw=;
        b=myKspBy2BQfFjnB4CdozXum40nLpJW3pKP+hkwJicLq1zoWpIJ6+8hDdSSIR2fJa9n
         kPE0LR5OcYwkfMDQ4HIl9TonmXZy9nQY58tAd1+mMwX6R/emjA04jElyXO/0OmzCEjaZ
         fwur0EgcA/XeGbKTADW6d1IsGqxNSIOGdQ8yxQCEFC8nfbs85HuG4y3ATSi0MGvw5XGp
         P5CRaocJ+R/cGTkemkA+CVpHawUzCfUEAgO3wLLfMT8wg6GHagl8MvYqamw0WD3FK2ac
         UNovWUhfJ1ofocWuv7TvJ51G/S50pcwsJWMdupzHHT8cNktjF0D3/SsryguWAHIDPHjL
         WpsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWF2CARW2b34+fNH+zt0qqU0ieOAb5VdF1OHA1WsIBUop0d3G1JeMJeF25HHfM2Lt32JeiXqM5Y2HyoC8XrSZ9lQjFWQXdTDaUAhz2zLA==
X-Gm-Message-State: AOJu0YxhLLyFRIBdTOUaA2Qb5g4gM6lEa/zydyX/A1lroQM0dcBIvG0+
	UA9Dd9qHyxhJcaL+BJc3zgS2Ep+cOkxlFPRx3Dx0OVzhH4lfGNGA568jAmoL90k=
X-Google-Smtp-Source: AGHT+IF9Wmh+7ejD/UAY2mFCTzIVUie+eVGe4rIzky1QrvxATELJQL/cGxzZCmHlaaiUR/qNIfpGZg==
X-Received: by 2002:a17:906:c9c8:b0:a55:690b:b696 with SMTP id hk8-20020a170906c9c800b00a55690bb696mr130195ejb.9.1713384080443;
        Wed, 17 Apr 2024 13:01:20 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id gs6-20020a170906f18600b00a555ef55ab5sm939981ejb.218.2024.04.17.13.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 13:01:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v10 0/7] spmi: pmic-arb: Add support for multiple buses
Date: Wed, 17 Apr 2024 23:00:52 +0300
Message-Id: <20240417-spmi-multi-master-support-v10-0-5bc6d322e266@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHQqIGYC/43SwWrDMAwA0F8pOc9Dku3Y7mn/MXawHbs1tE2w0
 7BR+u9ze2lGwOwikEBPQujWlZBTKN1+d+tyWFJJ46UmCG+7zh/t5RBYGmqhIyABBIqV6ZzY+Xq
 aa7RlDpmV6zSNeWaak1UgnFLGdbV/yiGm7yf++VXzYyrzmH+esxZ8VP+jLsiA+SBV5IBexeHjl
 C42j+9jPnQPdqEVhbxFEUPmuEMgTr2BfkPxNSVaFK9bgbMBQgQRbdxQYkURtChRqcFr5F4r7az
 eUHJNYYuSleIkpbcCuQW3ofo1RS2qr5TzXARrZI+D3VDqRXEyLUpVSjkDpEmQ6P2G0i+q7tWi9
 PMZ+kgDCgtyeyuzppp/ZSoVLUr0yA1G/oe63++/IuR3FhwDAAA=
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
 Johan Hovold <johan@kernel.org>, David Collins <quic_collinsd@quicinc.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4975; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=/39vaYwH6c7D7U1qbeYjMZX94n9RUUOZ4f2TEoJ2CdI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmICp3qYoyP08TixYiL5Stz6cy5MqL8iInUv6n9
 QINj7CRQwqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZiAqdwAKCRAbX0TJAJUV
 VkD5D/9FFrSAxuVX/hX3nme1VUm/HaTI/UCVGqgqPMxqn/UtLZnJZAxCKmAXsJPHy5QN8h3O/AH
 V/byADRaqLhEeG+KhK936mlLyO9UFeY9LUxKV9m9kRzr6/Fb1J4dRpkRaqtsSjkwwkAmBG2q1Jz
 /JiE0DgN2gQhDGlwkegec6nM4t/8LTt3cxoopXTIDm9OjYEEs4oJoaMP/FO6/LlUxKomRV6ZD0I
 UO1Sp0wIHl637ZUJ0EN+ycLR/5chAvpiRAYtu1oWqEHedpa/vrU1aCz+vay0DUjbC1Svzb/ZGW9
 pkfQ9eras9BTWeQy07rb+9nwL550vduT68VR4V2A+TNR9F/VitLknskF7wQvx44AgEeO9vBocAp
 KjF1P4NQQOwqmuMF5EWeBrwOCm09bBfE2HFRt1uD9V1iBWSZJr/YZGr0J2mFSNO725duJXbi6o/
 NWPJSl/l+TCQkab4McrMboFvPbVytGy4R3B4YjJ1XrekiYM5/eGnjdi02Ig7Lg+zjIRsJD+mlwm
 F8ZjqUTv+Z8BY/JL44RgGT1lIxyTaPL4s1XH6VmcJoS74rn9TUlXcP/vK4y0RS9VXvabEDMf2Bx
 /sp0IwUM6wrApmVbcdxzyqkpB09kEX6CFjH0fzg6CeKEfnJP5c6n+mnOTQxSL7B6TWi6GLKhSwL
 0EHcGHdaKvNdLzQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

This patchset prepares for and adds support for 2 buses, which is supported
in HW starting with version 7. Until now, none of the currently
supported platforms in upstream have used the second bus. The X1E80100
platform, on the other hand, needs the second bus for the USB2.0 to work
as there are 3 SMB2360 PMICs which provide eUSB2 repeaters and they are
all found on the second bus.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v10:
- Updated the commit for the x1e80100 dedicated schema file to explain
  why the this platform specific compatible was used.
- Link to v9: https://lore.kernel.org/r/20240407-spmi-multi-master-support-v9-0-fa151c1391f3@linaro.org

Changes in v9:
- Use the proper number of buses on deregister, like David suggested
- Moved the lock from the arbiter to the bus, like David suggested
- Fixed type in schema file, pointed out by David
- Added Neil's R-b tag to patches #3, #6 and #7
- Link to v8: https://lore.kernel.org/r/20240402-spmi-multi-master-support-v8-0-ce6f2d14a058@linaro.org

Changes in v8:
- Added Neil's R-b tag to the 3rd patch
- Fixed compile warnings already existent by adding another patch
- Fixed compile warning about get_core_resources, reported by Neil
- Dropped and moved the spurious core removal changes, as suggested by Neil
- Link to v7: https://lore.kernel.org/r/20240329-spmi-multi-master-support-v7-0-7b902824246c@linaro.org

Changes in v7:
- This time really collected Krzysztof's R-b tags
- Added Neil's R-b tag to the 4th patch
- Split the multi bus patch into two separate patches, one for adding
  the bus object and one for the secondary bus, as per Neil's suggestion
- Fixed regression for single bus platforms triggered by casting to
  pmic_arb instead of bus in pmic_arb_non_data_cmd_v1
- Fixed bus object allocation by using ctrl drvdata instead
- Prefixed the spmi node property in x1e80100 schema with '^'
- Fixed struct and function documentation warnings reported by Neil

Changes in v6 (resend):
- Collected Krzysztof's R-b tags
- Link to v6: https://lore.kernel.org/r/20240222-spmi-multi-master-support-v6-0-bc34ea9561da@linaro.org

Changes in v6:
- Changed the compatible to platform specific (X1E80100) along with the
  schema. Fixed the spmi buses unit addresses and added the empty ranges
  property. Added missing properties to the spmi buses and the
  "unevaluatedProperties: false".
- Deprecated the "qcom,bus-id" in the legacy schema.
- Changed the driver to check for legacy compatible first
- Link to v5: https://lore.kernel.org/r/20240221-spmi-multi-master-support-v5-0-3255ca413a0b@linaro.org

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
Abel Vesa (7):
      dt-bindings: spmi: Add X1E80100 SPMI PMIC ARB schema
      dt-bindings: spmi: Deprecate qcom,bus-id
      spmi: pmic-arb: Fix some compile warnings about members not being described
      spmi: pmic-arb: Make the APID init a version operation
      spmi: pmic-arb: Make core resources acquiring a version operation
      spmi: pmic-arb: Register controller for bus instead of arbiter
      spmi: pmic-arb: Add multi bus support

 .../bindings/spmi/qcom,spmi-pmic-arb.yaml          |   1 +
 .../bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml | 136 +++
 drivers/spmi/spmi-pmic-arb.c                       | 964 +++++++++++++--------
 3 files changed, 728 insertions(+), 373 deletions(-)
---
base-commit: 4eab358930711bbeb85bf5ee267d0d42d3394c2c
change-id: 20240207-spmi-multi-master-support-832a704b779b

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


