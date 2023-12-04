Return-Path: <linux-arm-msm+bounces-3259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7988033EE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 14:08:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08C33B208A5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 13:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C97F25115;
	Mon,  4 Dec 2023 13:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KPPmZZYc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79317FE
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 05:07:55 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40bda47c489so23828355e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 05:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701695274; x=1702300074; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0SVyYW6HMoNCW9ahkMqcZ8lqPYY7XQP+vwUVqyb0ygQ=;
        b=KPPmZZYcsw8U0DuoQoljmYBpgiG2P6hv8sddWj3Mh26hUyr8DcsMPoBsPYMrvWsK8a
         lMqhKDJbJ/81bncJGfNLbCwhdD15DtXjpanQWYU6uSsUcguN4LabUzUxv0PmTw5CmwFz
         R0NvrIUiK/CmRX4/u3MzTlBsDVD+2lvnADmwg/bIQ2xQHLyM/aBSHmv6IRn8W8K345oM
         oCdUQQkdZKMP7fMF5geVyEKXvyNISTpIycH6J2h6cpLkypixD9MI/R8G+QfXCVn7h42H
         ciAfyV2XsQdAMb5V4EfIzc8Urukvputr/IuqF53vh/HMfqGGefN6q30ACru1KWf6+gKo
         IE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701695274; x=1702300074;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0SVyYW6HMoNCW9ahkMqcZ8lqPYY7XQP+vwUVqyb0ygQ=;
        b=ew1nkH0YTN8nvLTR322rJRSp2/7QH10LKzCF5lrK/m8mj6d6xvFJOPGOVA3W/XlwfI
         caNEYH/2inMX4WmfAtr5m7Jaqa3UysRhfwfXrtNylXEuDsXDlV1grcwcmUFtitQV1l/6
         KVvyYkla9yTkLZLItbIx8MGHiNj0iy/lVwWsQ3iB8f4yipRuC1i5QpBkUCyTAQ6NTkoq
         C+tQRd346MJ18XXVFs23inSUeNLXi6jqhKCJ3tPCaNR9QsSq2jL4Al1QRcFGacK0p2Dc
         BCeskTtvjHFk0UggBg9y7nBJgEukZzBPw3gEl8Tgu8S1yAxMSoMh6uTfU14tX7WWl5gp
         emVA==
X-Gm-Message-State: AOJu0YxSsS8Cvwbj8IwocGzqXzwgjXtOtbOB52/xk1wJ+KNkDhRjcSN1
	SMrVH17hIHi//Dsq533KPFM3Ag==
X-Google-Smtp-Source: AGHT+IFecRLXQz2AHpn4bOjQGLLjyAvR2s143US6vjsmmDLeqWRurF3VWG48Mt2S0ySIM+ApD18afw==
X-Received: by 2002:a05:600c:224d:b0:40b:625a:d8e3 with SMTP id a13-20020a05600c224d00b0040b625ad8e3mr2289968wmm.150.1701695273863;
        Mon, 04 Dec 2023 05:07:53 -0800 (PST)
Received: from [127.0.1.1] ([82.77.85.67])
        by smtp.gmail.com with ESMTPSA id n10-20020a05600c4f8a00b004053e9276easm18494166wmq.32.2023.12.04.05.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 05:07:53 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v2 0/7] phy: qcom: Add register offsets for v6 and v7
Date: Mon, 04 Dec 2023 15:07:34 +0200
Message-Id: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v2-0-21956ae0c5c3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABbPbWUC/5WOQQ6DIBREr2JY9zf4VWq76j0aF6gfJVGwoLTGe
 PeiN2gymzeLN7MxT06TZ49kY46C9tqaCHhJWNNL0xHoNjJDjlmaIsLUr/Be5NDYcYQgjiCHcAN
 DH7BKeZo9FNQWWDZlqQSyqKqlJ6idNE0fZWYZhlhOjpT+ntuvKnKv/Wzdel4J6dH+uRpS4NDes
 5y3mUAh8uegjXT2al3Hqn3ff+UlirbuAAAA
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2164; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=N6WiaC0IuCi1ECGstgxOqRPHVLNEYuAK33Yhs193vd0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlbc8a+atua4Lv+IhEVqXjoaDuE/uoIZkAhn068
 61kaInVsWGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZW3PGgAKCRAbX0TJAJUV
 VonNEACr2PgUXJehYKPOc5JHpLfUGKTohkTStQ7f3xzwujMXpEqaIPe7zESp+SG2LuXlxVbub5E
 hu0MuM6ijQn5cHpMKaONrx0KM+doV6S8YTTUD1KpSoD4Wzd2bJZNT8MC+ySv+01beK/MBQNjf6Q
 KOJsQ22iBsPBV+SiYQfTm13ZctYSSkLkjH1ErZwGYv4I6FAELt9odz7Qs4LNn6U6RuDITsaC83u
 gn0EN8dhZInHslNtX5A0YHoozPjBRFyXoumDcnuA7TruqkyTAwlaDJSJ1aMclvziKf3zgPNGqpy
 BsPgYDMya9tq9SwmA4pEkwHCymggVXva/rpswV88qafjmoohIQd8Rfr8d45HOY9N8dXKbLx/ev7
 7NBSwUVNmkqBa5UV6D/ko1wZFmLbVIGR0t3xdpEKpzzpYECu+jlTDAIJjiBK+imvsfgxjDYbacY
 b9IjRdK9Nz5sjMXHrbgIRTXZ6VnHjQPO0uRrJfgWyJm6Khj/6e60jhGVxJgEEhOOBIWYEPzuLG/
 lkmhyplPar2fsQKu+95UqQ6Dud27lVpBUbpWksI0/6poeXFsqqQRnDBpVZ+ZbAa2e2mE7Aat/Fq
 Ipfpli+F8EtrTiXpul0KjavmxRdAqh3cdN/V2O9ao2MD1kT4nuH/69LagOUF9dwFoP3k/Ik3QoV
 T1UOVVaxWs8XhLw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

This patchset adds some missing register offsets for the v6 and v6.20,
as well as the new v7 ones. These register offsets are used by the
new Qualcomm Snapdragon X Elite (X1E80100) platform.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
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

 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v7.h     | 15 ++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v7.h         | 28 +++++++
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h |  5 ++
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h | 86 ++++++++++++++++++++++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h    |  1 +
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_20.h |  4 +
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h | 51 +++++++++++++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h    | 78 ++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  6 ++
 9 files changed, 274 insertions(+)
---
base-commit: 629a3b49f3f957e975253c54846090b8d5ed2e9b
change-id: 20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-5ed528c88f62

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


