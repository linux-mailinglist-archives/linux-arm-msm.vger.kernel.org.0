Return-Path: <linux-arm-msm+bounces-3685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC51D80877A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 13:19:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 191FD1C21357
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 12:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 171B239AF9;
	Thu,  7 Dec 2023 12:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hi5fR52e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08C8DDD
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 04:19:37 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a1ca24776c3so395037066b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 04:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701951575; x=1702556375; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UkIHYUvRBALFNq0yZBkoDW4A6Xngi3bw5KTNzzylyoM=;
        b=Hi5fR52eM1kghCLlTDL9eQZ0bXk4GGyxXoBlttwLwYVVIgL7nQuK8Rb5dmqC0yzo/p
         7WB7T70SDaSR7n/eEw4+HfLydexzluhle5mBsPigEYRWm9h9DM6+tVJxw3W3ARfeUP8y
         iCCeUMUOBWVT0lKCrgdCFu7LvDRlf29RxFELLhHS47ToAKxk77Xafv2yK+pOGtQgRxPS
         KBiED8FlPiIg8/DA1Bj4mhsPO1fnOvoHYY15CkviYVI+n5ukVoLy0eIZBegcFOSQAGEr
         sQT2XejWTWO444jHMZasrvXof3uXTKSMVtqr1ucjEzIGT/kyHwyF/TkFc7FYmoSEL8vg
         XmpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701951575; x=1702556375;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UkIHYUvRBALFNq0yZBkoDW4A6Xngi3bw5KTNzzylyoM=;
        b=u4YFe8H0vjFciXowm4nP552rmP5sDJkwcRazypcuMJSNA8TKH8GvAztg4cn868m7u/
         LgTGSZNd1oLL5RWpiHV/d5MGWNQ0yhBSvZ2ZY3r7DYpQ6VXv2LWaCMrUH6isF2WGIIZC
         jRHy68ZR6RLJ8Ez+RvlhLrthEQkT9uu7DXwMLblFyByG37oI+w4VRFeknS40QOzRnJDj
         pXdBq5pqdCCQYssco46INvY6KUFF4xJFN7OiAxAcxIoIzpc1PUdKzGaPipLZHgM9SY4W
         btrgFrrSKJ8DSMZ6L9phrpeciVDw+NSMRqXJrUs046fG35ZKr1ETsI1DgWzE8cCqfb6q
         XxFQ==
X-Gm-Message-State: AOJu0YwVW9Od0JQ+zf2dLip1C4iPo3J6gA7geAnv4zB00ffw26mnd8qt
	ld6z05QjGxDRGBQoGmfSVEqR9i0AFztYcssoXU4=
X-Google-Smtp-Source: AGHT+IHrRLkmfjjGTvklEAKWkf38LirPV0giNGNAsHn5IyN6dVCAR5UtmjCFlV7drVANhwFQBhbaCA==
X-Received: by 2002:a17:906:5353:b0:a1e:842d:ccd5 with SMTP id j19-20020a170906535300b00a1e842dccd5mr1177133ejo.48.1701951575192;
        Thu, 07 Dec 2023 04:19:35 -0800 (PST)
Received: from [127.0.1.1] ([82.79.186.233])
        by smtp.gmail.com with ESMTPSA id f24-20020a170906c09800b00a1e814b7155sm761394ejz.62.2023.12.07.04.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 04:19:34 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v3 0/7] phy: qcom: Add register offsets for v6 and v7
Date: Thu, 07 Dec 2023 14:19:09 +0200
Message-Id: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v3-0-dfd1c375ef61@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD24cWUC/52OQQ7CIBBFr2JYOwaGFltX3sO4QDq1JC1UaFFje
 nepO5eazOb9xXvzYpGCpcgOmxcLlGy03mWQ2w0znXZXAttkZshRCoEIY/eE26x744cBkloPOaQ
 9OLqDb9tIU4SSmhIrU1WtQpZVFx0JLkE702WZm/s+j2Og1j4+7dM5c2fj5MPz80oS6/pjNQng0
 NSy4I1UqFRx7K3Twe98uLK1kPAfK2YrirpUmrgpjfyyLsvyBg6EhRJEAQAA
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2422; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=mB2W6KYDvq8TrXhXBcEaJwg/nTqyORBrvBrPqSlnHwc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlcbhFn9IOc3pVcyuGjmrlGfBAO41cuSuXYY+e/
 kDSOqEnaSOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZXG4RQAKCRAbX0TJAJUV
 VkGCEACCWpfyOZB/VhvyT92GwvmniwF/RQJMjhbj1qMeLzfBGwuI9cJ+/sm0wH/R4gRRXIiJLsY
 Kz46ZiBdPtR8pgVzaWVK3cYVZVOJmXhlss0ZjJOdi1+UY0oFx1HAmeJ3q+4bcOmT+UoyHODnVjA
 /1F25IKfz1e2YZ+MEGV0bJbmptJC2+KIJOQihyePXu9MHhAunqUKhjCxjlUczEWlX8XOCLDZsVw
 LYoHQGPpXJ73S7XNzyhT6arWIE59loKhyhzbvp2vpryWcNnQKFMfBRg6FGbfLkIppl0ldAgSllr
 iC6dh1fufpjj6lf3qeIswJo8iqqkWbZHczgXwnQyOfKKtuxr2db/719oie57VUZxovMCCYqjysC
 jGwR7vjlhbhDq/YuG1g6aFoVa/zJaZMRcpGEqCQjJ4JkOHalCYagNbi7QrOIXT85HZV9INaFe/Y
 GY+uE7Ph4tz9MioGJc05IAarGZXiZzi2087AVdk4/rA3mqRjP8LwTbalumnbIc6QcGyIy5+aOT+
 jIFuNQZOUF/2P3MZBtk3grQrosioOniHe1Y0+1bQESS74opmJaboHf2m1NtPvKM+rnoA9lvJCwB
 1+hS6obOkSE7TYF+MKbQPjz9Rfjxrf90ZNgT//+2Pi9WKkZKUcOB3mZ6TzngWjNaNmxZbrluH+V
 ElxjR7Lbf71dLug==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

This patchset adds some missing register offsets for the v6 and v6.20,
as well as the new v7 ones. These register offsets are used by the
new Qualcomm Snapdragon X Elite (X1E80100) platform.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v3:
- Added in some more missing v7 register offsets (needed by the usb3 uni phy driver)
- Added Dmitry's R-b tag to patch 7
- Link to v2: https://lore.kernel.org/r/20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v2-0-21956ae0c5c3@linaro.org

Changes in v2:
- added Dmitry's R-b tag to patches no. 1, 2 and 6
- dropped the duplicates of PCS v7 offsets from USB PCS v7 header, like Dmitry suggested
- fixed comment to suggest v7 (instead of v6) in qserdes com v7 and pcs
  v7 header files, like Dmitry suggested
- renamed PCS v7 RX_CONFIG to CDR_RESET_TIME, which is the correct name
- dropped the "_USB" substring from the include guard of phy-qcom-qmp-qserdes-txrx-v7.h
- reordered the SO_GAIN_RATE_2 offset in the phy-qcom-qmp-qserdes-txrx-v6_20.h 
- Link to v1: https://lore.kernel.org/r/20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-0-d9340d362664@linaro.org

---
Abel Vesa (7):
      phy: qcom-qmp: qserdes-com: Add some more v6 register offsets
      phy: qcom-qmp: qserdes-txrx: Add some more v6.20 register offsets
      phy: qcom-qmp: pcs: Add v7 register offsets
      phy: qcom-qmp: pcs-usb: Add v7 register offsets
      phy: qcom-qmp: qserdes-com: Add v7 register offsets
      phy: qcom-qmp: qserdes-txrx: Add V6 N4 register offsets
      phy: qcom-qmp: qserdes-txrx: Add v7 register offsets

 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v7.h     | 17 +++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v7.h         | 32 ++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h |  5 ++
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h | 87 ++++++++++++++++++++++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h    |  1 +
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_20.h |  4 +
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h | 51 +++++++++++++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h    | 78 +++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  6 ++
 9 files changed, 281 insertions(+)
---
base-commit: 629a3b49f3f957e975253c54846090b8d5ed2e9b
change-id: 20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-5ed528c88f62

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


