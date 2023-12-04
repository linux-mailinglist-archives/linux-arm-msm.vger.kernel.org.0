Return-Path: <linux-arm-msm+bounces-3291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8065E803568
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 14:50:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BBE0281014
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 13:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0982C2556D;
	Mon,  4 Dec 2023 13:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QO+9BzVp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC0EEFD
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 05:50:39 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-332c0c32d19so4110727f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 05:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701697838; x=1702302638; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eAuYi+CP8FnDvl1/9mJlyIJtR24fsmGGBMNOB1G00HM=;
        b=QO+9BzVpqrgcAjVH4KIBQzTyMMLF05hN0BF5rJdBHwKyGOL/OduoeIkO+yEwBQya/v
         W3oUSG6IElhRfBABlyn1gpL5GP8IvC+DI/b94pK3lJqAo+Vwfl/0iknXVbxpOr99PYRv
         qiQfLwdSUQ+iPq55YyeGABMd3HxfyU765rfT8DrzDe9OYBXcJbhna9IYBPUrmQ4jo8CM
         i8+Rd84tRK19j4uULeuMrcoISxM3G8AwTbJFTWY6r8e2a7fAKNdp6Pa5w/n4KVDNb1Vy
         tAW4OnyeYDoob15RFsCA+adxNUGMtcca/3tqdXdQpGL2ezFI9TrcTZf1ir3t4VFl1Z8q
         1MxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701697838; x=1702302638;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eAuYi+CP8FnDvl1/9mJlyIJtR24fsmGGBMNOB1G00HM=;
        b=n0t8MboA38uCy1PwSgarC1lbLaAG2ID/w/tBLc2bUjnqWvwjGvQt4f/WDHIvaTC+VQ
         CCsz0bXbYhai73n+0VTGw38s9XySfftwbm7TluUqE76GqlSMp5V7g+n7nbP38O5F1doX
         6r9CtJjD6FnbZJcY0lo8QDMFN19B02bxuPJ4ziQJcxoJF5Plzh7Abju1YgpIblI1b9vu
         YiC45lCeX4kYHIk9kbEweeGxwjsUhhy+k/iTjR9IWJLfZISqNnrKtnyAP5K/LCv64x/t
         CmtyDGuipFYChdr77P84INeZ5CxEmNKIumSoat6OHU+r8zyFPq4JlmmuBgSRmx/gLJtw
         SoZw==
X-Gm-Message-State: AOJu0YxcJMfV+YrS66AgFdD8q1BiUPXlm5N9p/rNwoegFF3FJs69OrbP
	joc50ffBoEBw2W53R5DLw6Q7Zg==
X-Google-Smtp-Source: AGHT+IGi4e3DED/9yTz6CQ5jSU6WrggjZ7YH99yV7/7tpCLqmYsyGhKNkD/u/aBxbEgr9z5+byR+qA==
X-Received: by 2002:a05:6000:110f:b0:333:39c1:b7b8 with SMTP id z15-20020a056000110f00b0033339c1b7b8mr1872523wrw.119.1701697838164;
        Mon, 04 Dec 2023 05:50:38 -0800 (PST)
Received: from [127.0.1.1] ([82.77.85.67])
        by smtp.gmail.com with ESMTPSA id w12-20020a5d680c000000b003333e09990dsm5908553wru.8.2023.12.04.05.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 05:50:37 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v2 0/2] phy: qcom: qmp-usb: Add support for X1E80100 USB3
 PHY
Date: Mon, 04 Dec 2023 15:50:26 +0200
Message-Id: <20231122-phy-qualcomm-usb3-uniphy-x1e80100-v2-0-1a3e1d98564e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACLZbWUC/5WOSw6DIBRFt9Iw7mv41FQ76j4aB4AoL0GwUIzGu
 PeiO+jwnME9dyPJRDSJPC8biWbGhMEX4NcL0Vb6wQB2hQmnXDDGOUx2hU+WTodxhJyUgOzxkAs
 zNWWUQvMQuq551TDTk7KjZDKgovTaliWfnStyiqbH5Qy/28IW0zfE9fwxs8P+k5wZUBB9pTrOR
 Vep+8uhlzHcQhxIu+/7DzIw7tzoAAAA
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1186; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=bq12H4LhIOP0hqLRSHiVZk4lQQxtWa9RmciRWDla0xI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlbdkkc7kZeVKqZ0M198ktPur8uAhz993joSY47
 DXYu62EB0KJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZW3ZJAAKCRAbX0TJAJUV
 VhBfEADEHcWM3kW6D8c+Ye+Sr62piQRou48rb7TvAxtP/L9wDjU6rfaiVE9LwMdbIjNnhQl4r5x
 Ff3W/FlqdXLJWIbdhQZRpllk/9eF4i/pZvlnMEjDS8/3OwZAu5D7ehkkpfGifQk+Gu+O2IbxLQU
 ++NK/ailb4Q7f8o2asuHlXxz52W4u25LaikRAF+X6qivYSeST45h39h9HS1opv4jag4wWwX3vUT
 mJv5DpERnIAD0T62EoJauFqnQj9NnmeaNuZOtSrzELJbfUsYlV5JEmOrkN5eS/H/1GsYRJXfGXa
 oa9wNVRJ0n5MzniPh5Gv4hZZQOQmJLTKXHgBIVYiuTt0aW7wnflbWRJJ6HOLNeYxWI8naz6U/PS
 i7pzBfiSdgDhmTurwES5ZREOtzAGiD60z0qMMSnP24I7KDJhiN7xAGuH+fEqrnCH9D4IW5D6Qwp
 nEZ/7zdsqo6QCKE1HsRjL8IBzkI4c5DcMulonTj9AEy5RLKoUSU98QII/Z/0fj5KweISJ2O6/xK
 wqy/DiCdJPdLLMDvh7GIltFEph+iXcqFLE7K8BaY3YMILlWpPW6Tljp4NoiLrAyRM11FtYqp9wM
 YRdtF/cUb9HFiG2o7eTJ6/Ddk65qGYK/MmX5VhZ5FwgHFc1iG6jNTlwwImL16x89qoTrQFBLd14
 3UIbFGLJtAFUaiQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

This patchset adds support for USB3 PHYs instances found on X1E80100.
It depends on the v7 register offsets added by the following patchset:

https://lore.kernel.org/all/20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-0-d9340d362664@linaro.org/

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v2:
- Added qmp_usb_offsets_v7, as Dmitry suggested
- Properly sorted the init tables, cfg struct and compatible entry, as
  suggested by Johan
- Add entries to allOf section in the schema, as suggested by Krzysztof
- Link to v1: https://lore.kernel.org/r/20231122-phy-qualcomm-usb3-uniphy-x1e80100-v1-0-3f5bd223d5b4@linaro.org

---
Abel Vesa (2):
      dt-bindings: phy: qcom,sc8280xp-qmp-usb3-uni: Add X1E80100 USB PHY binding
      phy: qcom-qmp-usb: Add Qualcomm X1E80100 USB3 PHY support

 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        |   3 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c            | 160 +++++++++++++++++++++
 2 files changed, 163 insertions(+)
---
base-commit: cf0b28e02cfac455b54f1a29fe907931d2b0bb9d
change-id: 20231122-phy-qualcomm-usb3-uniphy-x1e80100-973c882591ef

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


