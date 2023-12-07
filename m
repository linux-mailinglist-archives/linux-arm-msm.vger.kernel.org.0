Return-Path: <linux-arm-msm+bounces-3716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C258088F4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 14:17:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 619AB1C20B9B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 13:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D9B23D0D8;
	Thu,  7 Dec 2023 13:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="poitjYO2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28F7410E3
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 05:16:54 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9fa2714e828so110148766b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 05:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701955012; x=1702559812; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6VKBYqm6SE1XYHjmHHc0jK2ohHeZYs4QKH10IKvZN/I=;
        b=poitjYO2E+mESZnDU8CZJD0+1BqxFLQp2++jyb1VXbdGbJxCcS7PDH3bB2GW00a8+s
         F5IVn5I2EjK3VeTYkeeUQkXrrO41Ath61DRruoN7UTRQOz4I00tXWSnnxENsoZHF0QtP
         WobDvjpA99dW1I+hrk1wJLAUgSCuK3xUBB+i79OGqe+yTu+W0FLfdY8JeR7OKTpg71Tn
         +HAIJ1fmBAfTYExQ8jJXsxBHXxYIaAZnp+/fyIhbg9sBR6UddGg5Cd2vgaqFstZWdW3H
         B0ALFejcUGmSWFi1ezhRimnF46ku6f+1PQDqFEGlFZkwPmr4a31UNW1oQJWzTCH3GeJ9
         ZPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701955012; x=1702559812;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6VKBYqm6SE1XYHjmHHc0jK2ohHeZYs4QKH10IKvZN/I=;
        b=rhW3h/1DqJ/WemGLNw3Baz9XtunobObQTF1extKI81jQuWxB3ylOsKryQOi2/e3XF5
         uGRd8gXzOM4VtCCA70nCJVwEaQPQRFSlYuwxheAjuMyoHBLJST9aR7dsMGTMcUqEMDq6
         73juL93afqExNkx1y0S8evw06n9LgWqSC760gfB4kYgQ0txfVWLQCJGXInMLdQ+SkLpg
         UtEn/8zbCkcPs5UJXcjk8TqxxNbIPnGuZEd0tv33BE9cVBkZU5C/a/bc06QpaXwBRIga
         GdlVb1aRWhHyWHTgAcpT3VKboTJ3tnw17Px/gRs7JYKnU7rhupGfs2gvpfmacahyTaue
         EgOQ==
X-Gm-Message-State: AOJu0YyBDhdzTcM6R9JlkqxLBPaJdICIu5cA/HtnxRGLOHyKR5CVYsI7
	QvYIOyPj9O6+ue8vM9mV+7m3mQ==
X-Google-Smtp-Source: AGHT+IFXgYRNsF6yo7Y71i+eutWsCukKu1a8B45Cgmn4nuuVkp6JLLtlTLX7lGjP+/ZZxXYQ6eDbUw==
X-Received: by 2002:a17:906:750:b0:a18:f82c:65d2 with SMTP id z16-20020a170906075000b00a18f82c65d2mr1857054ejb.34.1701955012648;
        Thu, 07 Dec 2023 05:16:52 -0800 (PST)
Received: from [127.0.1.1] ([82.79.186.233])
        by smtp.gmail.com with ESMTPSA id d8-20020a170906040800b00a1d01b11498sm815233eja.24.2023.12.07.05.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 05:16:52 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH 0/2] phy: qcom-qmp-combo: Add support for X1E80100 platform
Date: Thu, 07 Dec 2023 15:16:40 +0200
Message-Id: <20231201-x1e80100-phy-combo-v1-0-6938ec41f3ac@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALjFcWUC/x2NywrCMBAAf6Xs2YXsRnz9inhI0q1ZqElJUCql/
 +7icQaG2aBLU+lwGzZo8tGutRjQYYCUQ3kK6mgM7NgTO8KV5OLIOVzyF1N9xYrxOPoTT+zD+Qo
 WxtAFYwslZUvLe55NLk0mXf+n+2Pff/ikXol5AAAA
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=869; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=s4GzkpBy63ls0/GC+bO/Jon6jFkVJFj3LnWS88SNmWw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlccW66GJ1GLVxM1RU7ahVYYLf3+NiQzJwqK5er
 jZRiZ64PgmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZXHFugAKCRAbX0TJAJUV
 ViU1D/0Se05g3QmzM72AvPy/zM7pcAoEburUezIoMaeH6t5DNd345uisEPY2R++mMLydjVlSh/o
 GeR6ggFq5eGF415RwwnrZd3CXHe9wqYGKpW0R/wR4CRFn5t1jkD27rxI1WnK8361S9Oj6+Q4jXk
 A3H+OnwpKkJakVTr+JddwBy8sta1T8kpPnBBUSfJMN3KzR/X/1hwkt/uIOJnWyTDWGobaRban6k
 UGuRuJNWUjueF6XL2w5bfdSDUOLreqV7sh2iJSUR53ljk+n9iLQuDExvKPm71GPyzRuRbzgV6z6
 IVAogtCgxPvLwaPDseJUiUqiB69rCQ1XNSPhwWC+yZkVG8tZFRdj5Qk6bnghpqzskJ4Nou8P1TL
 O/rdhRIdU1HXwnndQQ5UIkZSR4lNzgWmvTH1jQWtMoEb7pBwlqEdieq2ONTxP0qijQqyvK+HfTb
 WAbNFbv7YJ/NzV6NnKUyL3tXJrkvasYOHVr800nWr1qFHmejIzS3rL+wpYQHZpcFMNhqOgmjgzP
 kY64D9bsjWwqrdYs2i456HUA5VEyTOA+ZPFNGkFtHehDJ2rxxRRVrtYgL/fyZXpjDn2jljIpuO2
 z/nfJ0I94V5ewsjq/jT8cl5a/LRgAdEZWwVSxgTvYseni5yiAueaq2I6xhgez+w3K0aGYrP+6Dh
 YZVoa/jKZALUdFA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

This patchset adds support for the USB/DP combo PHYs found on X1E80100
platform and documents its compatible string.

It depends on the v6 N4 register offsets added by the following patchset:  
https://lore.kernel.org/all/20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v3-0-dfd1c375ef61@linaro.org/

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Abel Vesa (2):
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Document X1E80100 compatible
      phy: qcom-qmp-combo: Add x1e80100 USB/DP combo phys

 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |   2 +
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 170 +++++++++++++++++++++
 2 files changed, 172 insertions(+)
---
base-commit: a2a7cea5da9065b9e34a8bf3275241c1129ebce0
change-id: 20231201-x1e80100-phy-combo-b4d362f23a79

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


