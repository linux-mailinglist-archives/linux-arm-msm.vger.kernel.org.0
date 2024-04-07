Return-Path: <linux-arm-msm+bounces-16686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 788E989B2D4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Apr 2024 18:23:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 057D71F22413
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Apr 2024 16:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99801225A8;
	Sun,  7 Apr 2024 16:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OdUPMdU4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F763A1BC
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Apr 2024 16:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712507024; cv=none; b=nO3B10GbucplG1ZSuOEO19acb6ST966ml/Bn4EKxYurs1U2HlbWZqPKPvb1m5KXwHJRj9Y9gVhGlPBV4OdDQqrliHKY/aZ76o0CkJBNf7hCdbhWRxPUOnyc9zEnMZAhZ1JWzm7cBbi5GQn+fXzgAzzrPu8iHeAPRAc4YDS37Tpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712507024; c=relaxed/simple;
	bh=6q63pSnhy6J2Sr6QSskYSjoSl2pYXtfJQJp23ed/YYY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YWWmMeyJyN3fDBYHjeOAWREfmB1OyJ/h7+3E9rAvQTJRxPN3hP61sQDBItJiY/JoJzMmP5k4zNO3CHvdXK1oEpeJL6Yw7gbKrq39Ws9mKxh4thYh2jPqDc0McL7Me7BKzBcKP36pFjoigu+JopdgFWGczVAXPFeVd28bQIXCIKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OdUPMdU4; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a4644bde1d4so514539666b.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Apr 2024 09:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712507021; x=1713111821; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RoyDltWihBKIzrhhfRZNvpBdWOALrOH+RVXfhsGRse8=;
        b=OdUPMdU4QXJA0WA5PooAlffkxBE/MrlVagkhwqoz4h97GkpJfI46vbZSHEhjUGqjIL
         bG82sKD04f+mFhF196OAj0WZ2ePUFNU06ksXM2aTjUGJbd7Ecqx9ZxJ6Jgf8Pg7u82hU
         ir00BEOpbgh4BCGdsqREt+Lam0vYIbTfcQ5Gm4B9oxyx0mBPsZe1ImiYZP+F+lHGGtaA
         w1XAPYf5Ah2QmDdwuNOIl4S/w1a89/RZwbRYSYffmfN3SGyUifSDQ9fYNDLJaoIiq0Vx
         Hw32M/BN9fqHc1nEUlzvYCuZk93bAnci2d4OF4p//6lHJL9F1O+DKDPtmF2QszZu5FXK
         /jRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712507021; x=1713111821;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RoyDltWihBKIzrhhfRZNvpBdWOALrOH+RVXfhsGRse8=;
        b=Qw1eNUXgocxLGrUIIj5E9MUP9S0RbtemckAP8WE56AoXM+JjSUjY1tnuCNSjC3iSTb
         hA+5ve09ueNbLgl/1zp8RaeKIq+JK5osL1pX27Fd9k956LcKG6emTaoLGu/Jtr0VqnUe
         MjtrH6JFimyKcfVrwXb0nyyqJJCBegIRkmYauELKAN7TfpveF1YILUsuisdSQrrVw6oE
         lDkDvtLdB2d5IEg1j4inIO04FHPe8tR9ZJvbBkwaCwUw/EbnB0NEdYUxALMyS0qgBEmc
         U2wRFfXwSaAf6j3DPzdO3B3JpEQ9+sZ4pjJ36z1mbnfqp1S5E7ku+pyfqA65dktT0tj/
         fOBA==
X-Forwarded-Encrypted: i=1; AJvYcCWp3EKlYW5YTrf3R3PQC0zZen0Vbp8YLeMBZjmH5Gg10Ep6/4fVWOpkczH2Fd/iPg7JgGFt/SbGs970pshe89ByAOTNIPTpvu3MLSRZwg==
X-Gm-Message-State: AOJu0Yzt8WUaaYk6leHhmXFsYBM56k9NIzdEFacrGQBCeGSlDshyR9kW
	LyxKkX2OSU1aEs7efVkbpVVd2t7cAjnDS5j0oKSLAhF+c9XoJfXMHcKv6QXS3Zk=
X-Google-Smtp-Source: AGHT+IGvtq6B6DgJjFpXiyD9utmhbjeYTJB/ZFXF/IunsqChQiIhkDhZ23IBmIeDJKt/RGcF7yglcg==
X-Received: by 2002:a17:906:6813:b0:a51:aed0:cbc with SMTP id k19-20020a170906681300b00a51aed00cbcmr3002874ejr.15.1712507020510;
        Sun, 07 Apr 2024 09:23:40 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id qs28-20020a170906459c00b00a51bed388a4sm1811626ejc.139.2024.04.07.09.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 09:23:40 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v9 0/7] spmi: pmic-arb: Add support for multiple buses
Date: Sun, 07 Apr 2024 19:23:20 +0300
Message-Id: <20240407-spmi-multi-master-support-v9-0-fa151c1391f3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHjIEmYC/43S32rDIBQG8FcpXs9xPP5Nr/YeYxdqtBXaJmgaN
 krefTY3zQjIboRPOD8/5DxICTmFQo6HB8lhTiUNtxq6twPxZ3s7BZr6mgkCCkDQtIzXRK/3y1R
 PW6aQabmP45AnajhaDcJp3TlS58ccYvpe7c+vms+pTEP+WZ+a2fP2P+rMKFAfpI4cmNex/7ikm
 83D+5BP5MnOuKEYb1FIGXXcMUCOqgO1o/iWEi2K11bgbIAQQUQbd5TYUAgtSlSq94Zxb7Rx1uw
 ouaVYi5KV4iilt4JxC25HqS2FLUpVynkugu2kYr3dUfpFcexalK6Udh2gQYFC+R1lXlTt1aLMu
 gwqYs+EBfn3r5Zl+QU+Lacv0AIAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4724; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=6q63pSnhy6J2Sr6QSskYSjoSl2pYXtfJQJp23ed/YYY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmEsh9w7TRJLDY7EA+ru9fb2gPOEpYg/1MEqV+U
 9S0i6N3Eb+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZhLIfQAKCRAbX0TJAJUV
 VjvFD/4tbOMo4zLbPuYKkIt0zkVEijfvI2ky2BJD7dhVNV5QqC5Fntl1UNwARGMP1k8QyMx6IE1
 zF/wXLh6U1hUeZY11qQ63hJlbOGYyDKjtNZCmUpdpi2IbfwRe32B+eJBrldjqgJIaty4By01wlk
 vqLK5oTEoZZyv0+EUxYSKgZIId57Bd7mIsS1hmlPX6rfNqbPC6epcTN3cmMA81h1ccAVDejXTAD
 shKxF6NyyoLG3odqWZQ4kMfR6BU0IoaGVpylzlkILyAnvjQQli8G7gGOSJ/v8CwyomkOb/CiCQz
 eM8Lee/y/whzE6PPJBnYV0eUv4+GBf7p9iIr8cKWQxUCxiuYp+u6IUwAu3um+kQRWPSabLQbPdh
 91HWCvyCVf/7Q9xJL00+c65Uu6k8n+RPKRLfDQd56KnFLKPbBk3bPvSdtSefrLmVM0y4TSXG5dC
 eX7aFVXs3ikVpkKXbNrqRdjaJhssyao6NTaMcMX3tNbN8IwUPStFQ8nShN0Gr4UmwHmn9dixym0
 eHDG2bPu6BERKSsmSO1J34n8I+/Ygjbst1dNZX8u/WEoRKIA6YhbF0E3Pa3Pf7PoRQAhL93LNlg
 IB7y19nkISyFEHEj33N1/ZHip+nVE5YrPCMleib8V3VFOTFBZLq3fF2JfSlb2bvXBHqzFucbC7y
 38TcUiD7D1l8AyQ==
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
base-commit: 8568bb2ccc278f344e6ac44af6ed010a90aa88dc
change-id: 20240207-spmi-multi-master-support-832a704b779b

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


