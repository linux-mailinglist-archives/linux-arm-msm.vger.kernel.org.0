Return-Path: <linux-arm-msm+bounces-11838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB8485BCB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 13:59:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A0151F20E9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 12:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D94269E0B;
	Tue, 20 Feb 2024 12:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bk/m0D0d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D85D69DE4
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 12:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708433980; cv=none; b=k5Xo8Rqarn7bTgVNr+ba96oTdf0RbzwaLcjjTOEph5umJJnz00duEvarrhuM9eabF64/XidUaJfbMVhKxCRBeW1+JCO8JbAwmEJ6ORHRwpIZyiSsLu8Nhhjbcs5v1luPRAJ/mwyGOx8R2ncDEXsiYFuOt1xi0NIY53+rcgWIz80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708433980; c=relaxed/simple;
	bh=4kaUomWdFKTMnYewnlbW8ksZWZl5gVePGgFlT/90Ucw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=agyc3l/yMrt7cEizz3QU4LDygn0miFraDaMQHo5HUql4jobR8bJj5991yZ5C7JOxaoYWxVCCgK+pwYUJFmJr+hB4f1ckdEt8n/CFdfB6tEeHS9Qmy8yrABIrlR99nug59f2SFiwocpDuo9w4auQx2A1ZSGexs8vf32x7MQ50YkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bk/m0D0d; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a3ee69976c9so145136466b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 04:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708433977; x=1709038777; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s+jWLQZPWAIdbIYTCxMRCQCGWqDgnyzVf1WiIb5Hkco=;
        b=Bk/m0D0d8fm4dHw9cb3+N+vFHYm0B3oSOJ6anw+aVu9gmsg5FKTY+eSAkAP3Zl/0vR
         vSo+6FRO7AAnTYKcN7i6eCQedj7KbZ7xd6UuIZTTNmrOEquHZE3B8TNQhuMBQrOi7XO6
         p8iBg2lmMqo6PDQjrvf2kcxzePMvEXxQN7PgxVy8hO5oXqqh3lc9G9r5JzEB9SNrfR4q
         eJAh5CU/CCvHyhTcGoRwen1xcCcOdZ27L9HOlwZ7WaNsbYOg7EQQWJzu8v1ZjhcqNv5C
         4eeRa5rOzUs/A4rDWDxnMJgjzjuMttxXSvIvQe750u0kFyopC5sF5fg21nGxQ9xXyCGY
         S1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708433977; x=1709038777;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+jWLQZPWAIdbIYTCxMRCQCGWqDgnyzVf1WiIb5Hkco=;
        b=oCIdNGAzRaUA6aQR2fD9/4HOU4dt6RXp0YFtYdTF8MtJz5AA/oy8Ls5zLmGkoc5z3v
         0CZgM7KN6BmIDLVKBE7OsHdNeHPCUrqBqXBJiVhz+mLLiD9Cjt6m1/43C7vRF9AbWcbQ
         EXupFaxbhPFQzVt2nGeesS6/jf3FMTWutvdh+/jv/+1KNGhcNypRa0qaLpum4gQLvMxI
         1xrHL2yvEQ7oduvgZdCFp6PLIhQ2BGkV6LZMK442/wruQ4bIfiDipRPDpt9WJ1yGgQyh
         avjvYolQI9HyRtzzx0n6SaOmKQlAQSm2aAmqF8G7KyVRVch1ui3FyKk7E4JTqZ3OuDV2
         8pfw==
X-Forwarded-Encrypted: i=1; AJvYcCUv46u4l8LP0PCJANxpgPynrKO08KYxY4YE0kVrQgJvlTBryqpP7fEXD8NpG4HpB0ATREKT+ifx3/Zmf+OwZl3rdlvS2FRw7dNrTtpCuw==
X-Gm-Message-State: AOJu0YzGbMLoVunbWPLNTd1r4sFiAqDTkfpCqnU9kUa6ZkEwYH/79Rug
	rTO317xSI4Q+iG4wN01k7yeL2HWQEgcW1KyWARmWrCptcXFzyKnLs59X4gPHdNkLpgDhi0h3lQ6
	r
X-Google-Smtp-Source: AGHT+IGlmYaZY8dt7KP0Glwqbfa+qcbUIyMwpyJuJ1u3Zgl/t2BTHzGE3BEksImNAO5ykN7Wg/l3HA==
X-Received: by 2002:a17:906:bc8d:b0:a3e:6628:f70f with SMTP id lv13-20020a170906bc8d00b00a3e6628f70fmr3998963ejb.55.1708433976812;
        Tue, 20 Feb 2024 04:59:36 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id rf23-20020a1709076a1700b00a3ce36ce4f9sm3948802ejc.83.2024.02.20.04.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 04:59:36 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH RFC v4 0/4] spmi: pmic-arb: Add support for multiple buses
Date: Tue, 20 Feb 2024 14:59:20 +0200
Message-Id: <20240220-spmi-multi-master-support-v4-0-dc813c878ba8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACii1GUC/43OzQrCMAwH8FeRno2kH1rnSRB8AK/iod3SrTDX0
 c6hyN7dspMiiJfAPyG/5MkSRU+J7RZPFmn0yYcuB7VcsLIxXU3gq5yZQKFQoIbUXz1cb+2Qq0k
 DRUi3vg9xgK0URqOyWheW5f0+kvP32T6z0/HALrnZ+DSE+JjvjXwe/UGPHBBKWmsnkZfaVfvWd
 yaGVYj1zI7ijeLyFyWAg5WWo5BiU+Dmi5LvlPpFyfwVWkNIDpUz7oOapukF2ag4j14BAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2213; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=4kaUomWdFKTMnYewnlbW8ksZWZl5gVePGgFlT/90Ucw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl1KIuXSH5UMGSA81CQbo8VMYCmVJwJzeoi106z
 O0yLBTZvWGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZdSiLgAKCRAbX0TJAJUV
 Vh64D/9KA3g4aKNkyzLJfGpz/zWGhefbVTp3yqRNrZP4g+nMZkOm5oo1rqX1Y1a/QjaVijo7p8g
 870BF7ezB/UvwM6jfLZdWwDcKnJaHxHFKMVXYCMqlZVCgK6HokTp9ITYiOk4Q72F28jvFPgWvm2
 RbZKjI1hSDDnp9Yn7PsDS4c7BAOkJU/piefh/Krltgjs4jVTjKi7oa9TU8jh4+oTuerOL35nvxc
 p8yAcD/zxVBqv9IVpseLSjE0baZ7xV5pArTf3RKt6fisEcL0pC9adRLs98gKWIgmnC72s1TCwFu
 QnX+uwTntjlp43v+ufmFp43XJbjj4mncJC0H4Yi/ek3OCPSnfuh1owkE2iHe/6IJznVsVbgDtdN
 sIzz9xE0dsqpbRQexP4gZODy6YYpBGCzIXRC69dNwb3WpXc0wboBU9lRikNfLR0g5cBbNX3lLiV
 BzRG+qAWvbpNwdfc1//7zt0zjQmY9f64QTiYyEAQ9NA+6Svm0J1F8JJ5eo/7XNz3X5GDxmyd0Eb
 iVTWRKg+9HyVSWbMZmFWf2j8jfO1nK03PjhD0htQEiJhwdFhEVSt+D/2AT6ooPErrbLRkYv6aCx
 fPVWABAGmCxlZqxyry7WbfWKWNzVW/dt2oeD25MOMYQ44LFSWGOSMbC12mRiVWQ9WYjMIztQ+8e
 bBLylOZoBR4fGcg==
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
 drivers/spmi/spmi-pmic-arb.c                       | 951 +++++++++++++--------
 2 files changed, 700 insertions(+), 370 deletions(-)
---
base-commit: 2d5c7b7eb345249cb34d42cbc2b97b4c57ea944e
change-id: 20240207-spmi-multi-master-support-832a704b779b

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


