Return-Path: <linux-arm-msm+bounces-15229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE93888C930
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 17:29:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44A393265DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 16:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC3B13CF9B;
	Tue, 26 Mar 2024 16:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yHNK6uxZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AED413CC41
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 16:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711470522; cv=none; b=YMeyrDr3rL2B+gZmBgDG5BS4XiGx+KXRd8VEPFhREtV34GvGAykNtv9SepsxXd51RBPN3PdEk8JgCNxZfFb9cwtkcSeXk/oxhfFrH9+01V2/7Ebqkhw7mJMQ3IOpSKNfD7tvk6qswVARd6WmImL3MIGNre+bZ3Bef4jlwNEUebs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711470522; c=relaxed/simple;
	bh=9rVzNTAAYXnMs7MfpROp5deA4r6Lb7fRQnEpmwvz2mE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BiTPt/LMFN0yQ70A7i8nttvGlrEvjqTSuOrerfz8JBbmCVr99c5LRCg75AIHrt64+gaezT3GQ5pSegfeGk9ffNR//stXb2CaXdoIlqr5+41oUYxEbafXL8o31AQxSd9nfjsg0E7BymBjXK9M19mmhrfgQ4PmV5HV/ZAUXfySq1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yHNK6uxZ; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a4dfe6564b6so7893166b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 09:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711470518; x=1712075318; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KkwALuuS9M9PSFBFc5tMoPkB9c/kjBr1oSlzVPQUlEY=;
        b=yHNK6uxZMVZMVyumFQwrzpryJjAN3jhnMBjveBoXvBAAerfFf+AXeT8F64BdlO/mG0
         /0rI5U3E6DGfRCp33c0OtJp99YloPIm0s0zTlRbRYyhggqvO2SGB8bQheTqZ5/XwbMzr
         yRdJQqCn7YW0lm4nLBazcHMDWzoOXRkM8xtUDjvSFA1sZ5Q//291NYiIJdE3U0yFpLnj
         0B1O7XtIwxW3Jhm7SAUBxaRJpOOMoaLHUReRoZUvrrYYrS1RrSo1vW3ol/fG4iiQq/uo
         fcFlNe9QWEFO/H8Mm7FKZ/Nn020RrSzjNvDIMN7/VlYU8Tb0LtMhCXUJnKdCFLJCtgwc
         g0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711470518; x=1712075318;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KkwALuuS9M9PSFBFc5tMoPkB9c/kjBr1oSlzVPQUlEY=;
        b=Sd6eUI8HJdT2gr+PiOJN/8MblVJDp0ILqQPbE5p284MgofWNCfmNEaKnQLxuOOP4KJ
         c44hhWlgmXDevZLz9EfydXQYy8U9eUl//sRE/1hgu/kD1xwtx04ybhGcBmbKjTp/2sng
         YRRm5aJzxtyTmG8XteW5F4942MTnQ8C5u9xoSNDyUKggBSpMUOTrLMw4SUh7G5PsmZVK
         I6fopIR3ZinbpxLumf267aEuj74Xtq5tmteJoetUYI/PzHDamcr02KJmBfTQNs2hviTX
         M+cqF48wgP0zH1gww60ww8P9Dy+rbML8LMxGAvpUah6GPb0Rq61pO16YqLjI/xQjtAlr
         dtGQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/gKKlL2sKFR94PGzuhHxJmzyxy5Z5zQv88WbzHnlnQTODLSzwIeyR3IpDps1OvOel+Tzxv1VK5SwA3tLo874YEL3p7O49zCkcKfI1pg==
X-Gm-Message-State: AOJu0Yz7vbtpB+0leC1i50J7z8jCvFZ7BFyO/UQ3pcONl7SjpLzWc0qY
	hEMuOq/+rtzOW4UaZGnMQAvHvhvAemXwou5RnjYo4XrXNEp1Xm5p2oVEd5ifNN0=
X-Google-Smtp-Source: AGHT+IEcH7pTTbGeIspwegoS3I/u7NOPY+bwy0qZb8nOgdyqit1sI00HJEdOMspKPg9tuxOOnF6kNQ==
X-Received: by 2002:a17:906:6b8e:b0:a46:e595:f357 with SMTP id l14-20020a1709066b8e00b00a46e595f357mr1356863ejr.9.1711470517578;
        Tue, 26 Mar 2024 09:28:37 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id x20-20020a170906b09400b00a469e55767dsm4375051ejy.214.2024.03.26.09.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 09:28:37 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH RESEND v6 0/5] spmi: pmic-arb: Add support for multiple
 buses
Date: Tue, 26 Mar 2024 18:28:15 +0200
Message-Id: <20240326-spmi-multi-master-support-v6-0-1c87d8306c5b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3091; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=9rVzNTAAYXnMs7MfpROp5deA4r6Lb7fRQnEpmwvz2mE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmAvepPDyVUfUUZtm4dfjOycr6Z/f5hn2kGVvuL
 4y6blOW/s2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZgL3qQAKCRAbX0TJAJUV
 VlGWD/4zH6HSPOmzf6bU+wWagDRlb7hDTO9LEmNfOrC300XKD3q+opYulhKcAOf6rtJwYEmQLps
 CJXZZY7zAYqqx6QqCKnr4pc+j3fJS8nqWrREhFRUSfbHIKUx+kBK0ByvSFmDahe3pu17mB8pD3o
 wxf6DzWELEAmYbyWy2RJUsCOLdgGeT3KL57UN8QW5YR1xkyofcd5VmRzjyTj5cvw3W3wQ/LS7nb
 D3VHmMrDOvK3gPqb6fUseLHNZg4obl5Qo0ycIaCIOKv4ociq+r0QIdc9wl9Upl/D0ak7AIR9DOr
 zlIQN/nSBfwDVO76kwUug8bbjdwPjLJwNimPjj276DFq6vNFD1tTYAkd/Vk/okWeAI1zAzVOcXB
 iCuGFyoDDol8lziqz78FTnA8oCQLbbwovo7218g1ZcWnfpvnZ6pBmNWeL1pwMuHlrQBLATFfuM5
 KjlQ2NqptcBjxaoT0c4oVeoxFQppIsIpy3YN54mfA/1G6ALJPJIUZMaA/Oilj9KFqummEA0Day5
 sFZt1DZoiGsm7D5q+4EIQ553xKvrsr+YFBhDpealgdVodYtQtq32nCAtkKFTNv/5lptT0+H8GbH
 1O5iWE1MUgyul1a4dK8oKy+s5QPbbyrf+M9KqyqvR/C3PYTKCFrGLDRDSMG6Fxvy4sQJ7z5AX3d
 loxohzcnadyQh+Q==
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
Abel Vesa (5):
      dt-bindings: spmi: Add X1E80100 SPMI PMIC ARB schema
      dt-bindings: spmi: Deprecate qcom,bus-id
      spmi: pmic-arb: Make the APID init a version operation
      spmi: pmic-arb: Make core resources acquiring a version operation
      spmi: pmic-arb: Add multi bus support

 .../bindings/spmi/qcom,spmi-pmic-arb.yaml          |   1 +
 .../bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml | 136 +++
 drivers/spmi/spmi-pmic-arb.c                       | 948 +++++++++++++--------
 3 files changed, 715 insertions(+), 370 deletions(-)
---
base-commit: 4893c639cc3659cefaa675bf1e59f4e7571afb5c
change-id: 20240207-spmi-multi-master-support-832a704b779b

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


