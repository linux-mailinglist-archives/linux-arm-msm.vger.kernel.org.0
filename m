Return-Path: <linux-arm-msm+bounces-1467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A787F4325
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 11:04:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 404AC2813C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 10:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB4154BC9;
	Wed, 22 Nov 2023 10:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sBCC7xiN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3642212A
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 02:04:10 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-547e7de7b6fso1334656a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 02:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700647448; x=1701252248; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w7f1ry+FDQqkAZW/rR9a28DSHUlK9OY3DwH31gg9Q84=;
        b=sBCC7xiNkfyEG8JlnBE/0g0t7PulTT9t1ymXEDpuL78gflcB6u3WRe6NXck0C7O43U
         G65xD96m2/yx8eG39BodNbJ3bye040Ec1NbP67yLjS50io5AGsGWuHa7sfbTb4V2m+pO
         IyODIcJgZdcIJhsV5Njc9IqKDfy6CojpVEckqb94ut9XfSmjoTZEQiHmV/eiqkSG7WG4
         +jsuMqPLURly21xL1Vkb7BG+OAz3OgXWS8arvn1oOrp/pTHpqoLWlRvcEm4u3n/ZjDw6
         HTWqryItaXHoWqDpvpxRuBqzao130fUYECv6guih1Rsql2meC7v1t4wlfN0VPI7S+LkL
         5vUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700647448; x=1701252248;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w7f1ry+FDQqkAZW/rR9a28DSHUlK9OY3DwH31gg9Q84=;
        b=cFt+qUnE6Le32Lq5+W7BiC8+QCbAihWJiUL42+JQAQroksbUYmdNNLlp9GLUw8rO4C
         NAIfhFSfjRLwFezWyndYzJbOzcOZ/pyA7FBE+zvPcx2jh41sdNNUZbtOjR+9yRVV3N3f
         VNMV8NqJZtlxUnPsXUVk3e8pkYo5qEx/fToWqL7lWVRn74iJrYPv2++mgE95WXDbT460
         9HE1kdSAaw7Mv9pq8qoH5c9/WC01nK4sob1+oShrmZqRRU0vxot8G5zjAbmD+6qjQVzs
         ukpts+tav8TpOL+zvvQHvwRiABj9Y8xqh5SHhsVSwT8HiOGgSL17+8OSFYRHg8fIANPT
         jIRw==
X-Gm-Message-State: AOJu0Yx1v8X6veIawDn3S5WABJSlYU8uqVza0GzAnCZKSW2XsvdJ/5u3
	zkwNDrDL5I3GzstsvHHuIYejC0LlaUSXEW7WBIE=
X-Google-Smtp-Source: AGHT+IEgDMMola5hcl3sRGIjNkZchAYK9E5xjDjIMJIUVE72GkCxvOD3iYG8i8XcduQFgvMtPwfE7w==
X-Received: by 2002:a05:6402:341:b0:543:5dd9:a72 with SMTP id r1-20020a056402034100b005435dd90a72mr1795722edw.1.1700647448634;
        Wed, 22 Nov 2023 02:04:08 -0800 (PST)
Received: from [127.0.1.1] ([86.123.99.122])
        by smtp.gmail.com with ESMTPSA id o9-20020a509b09000000b0053deb97e8e6sm6110456edi.28.2023.11.22.02.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 02:04:08 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH 0/7] phy: qcom: Add register offsets for v6 and v7
Date: Wed, 22 Nov 2023 12:03:52 +0200
Message-Id: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-0-d9340d362664@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAjSXWUC/x2NQQ6CMBBFr0Jm7SR0DNh4FeOilKltUgp2oGoId
 7ea/M37i/d2EM6BBa7NDplLkDCnCurUgPUmPRjDWBmopbNSRLj4Dz43E+08TVj636jFcsHEL5y
 dE14FOx470lZr1xNU1WCEccgmWV9laYuxnktmF97/9u1+HF+P3xBriwAAAA==
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1529; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=7uNpWvfhMS/e7VHo0mKgiRBZNnLydquBiQsmtLr7VSc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlXdINHHIs4ath05z+8Hs8g1gW0X3hAEI4sNFPy
 +DU07jxd2eJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZV3SDQAKCRAbX0TJAJUV
 VlmPD/9x+2g6mcKduypmeUFwCUL0yc/3rSOtxmr7QHSCkyLIOWBeVRU+XUgyjhn/NxUW339dn7m
 4+5wgGSjhqibxtG2bG0fLHbRhwDTPG7lChFSCQf/oHqK5S4kDO+kSf1RYUgGPtWgD076y+I7/F7
 8e9t0OnbriPw015DPoxGz45pI5iA/vEDjm8GP9fLWJhZeREaI5dwv/gOp3emf2HxA0PjbnW2rnK
 +xv4qXmHpO4yBUF++OVCYwt5dguoHHUsHfy3a8Oljd/lkAZ3sAp85/X4Y09Az+y+/QxXuKIqe6O
 V0eHoM0Y7QruLAxmDZX6zq+jxVI75LIwbsFCcAfu93z9bjz6ZPgECyTZz8NRc8TQNkNujwIYMxd
 taSHQFu3A5a4+iaCwk7/TTkuuIAHAc/OCQKYpQOLhq+ZuhkD21KnDAp+nEeCWvQX5d7Nm3YsQmI
 Lhr485G4J1UvVb8LZ0Gn/WSUyJNaQ4JbwCnzr3FMo3Arb9wGl344U4d8Ol2z0osgMK4jgCIxRlc
 dlu+tKZfE4f9cOIAnj2Hmwqsi8Vf8FYZv6+65YNwsxonDxbGykgydbdpvkaeX1GlCvcZV1NX615
 AaG2kTM7WEV6dDZmX+IspFA1f8qL/zbCiv3N2c84tPhYTN8yxk1cgBhTUcSuRxqVJOHK76dsBYB
 AyvULfIMouyi2vA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

This patchset adds some missing register offsets for the v6 and v6.20,
as well as the new v7 ones. These register offsets are used by the
new Qualcomm Snapdragon X Elite (X1E80100) platform.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Abel Vesa (7):
      phy: qcom-qmp: qserdes-com: Add some more v6 register offsets
      phy: qcom-qmp: qserdes-txrx: Add some more v6.20 register offsets
      phy: qcom-qmp: pcs: Add v7 register offsets
      phy: qcom-qmp: pcs-usb: Add v7 register offsets
      phy: qcom-qmp: qserdes-com: Add v7 register offsets
      phy: qcom-qmp: qserdes-txrx: Add V6 N4 register offsets
      phy: qcom-qmp: qserdes-txrx: Add v7 register offsets

 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v7.h     | 31 ++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v7.h         | 28 +++++++
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h |  5 ++
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h | 86 ++++++++++++++++++++++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h    |  1 +
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_20.h |  4 +
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h | 51 +++++++++++++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h    | 78 ++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  6 ++
 9 files changed, 290 insertions(+)
---
base-commit: 07b677953b9dca02928be323e2db853511305fa9
change-id: 20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-5ed528c88f62

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


