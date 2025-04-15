Return-Path: <linux-arm-msm+bounces-54423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B685FA89FE5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 15:48:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 618873B601D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 13:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30DAA1A262A;
	Tue, 15 Apr 2025 13:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oX5ttfKX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5320B18E1A
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 13:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744724883; cv=none; b=m27Y2S7mfEnOkSduzwnheJF38oqWaioTLePho3YU4CaaTM3TpFWfIBxRlaprqOe5APFMZaKjlGV6dFss/Qnn9ZzgJBTvoSABtnIPZQ6V95lbzYKUefAwacZMgp/FMasfXB6V4T1d981jP/TRzSM/I4kT7z5EK0aOB0OL8UfHUoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744724883; c=relaxed/simple;
	bh=cFvQGHACoZLdW6C7SjPAIpEiWAy3VkMr7aEysaz7yPc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AqSZQMGw/tADiSXfV02amyS4H0jzIiRxOCuv9JLHf3cTJj+kC/DFZTBOF5QJC6CZOv8Vq2TCgVG2Uwo1FnZNKgIMtfz88uqf8+jUZhGqFNNl0RkYiSgSBDZ0UigtTC4/lKC5S/xYIOkvLFAaJpLscyUjaUeOi4K5Pjx+Co7vdBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oX5ttfKX; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c2688619bso3648460f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 06:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744724878; x=1745329678; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CjWm1vrP1C7PVQoXnbYdSI6VRkWYMOCY+nIgNCUkSE8=;
        b=oX5ttfKXBO3Bfg1WTam1RVY/aDzEkxt2xBmhuVySSvwk+QApehT1gft7WXHQNOHoDo
         lsWbhbmuxH0dA7xodf3nWEt/wGTauKFA2/6w3FYy44gewwCH6kpjE3S5dAQ0i6IzNzV4
         243YwwKOkT15o7n8/5tvECQ+rZcviOjh5aW4nkfPX2ne4l0PfqmIqLgLEYCkcLzR91lg
         diFh4UFs9IDu5wALXIKMATW8mg7/IRtA0MQnc6cyV/ahGxP2XbO9lpEyNDAfr1kIC2t3
         GgAWfL6MJevyge8XhgP4nuiYXuRomEFM8nRJOx2TUhMu2m3Wkz5d8rsc/8Qw38JPTir0
         j3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744724878; x=1745329678;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CjWm1vrP1C7PVQoXnbYdSI6VRkWYMOCY+nIgNCUkSE8=;
        b=ZB0C5CnYaE+eE1Ed0jyPgECZjoXEZi93ntEOsrZRLE1TCJk6b0e3NnLjxa1Lex6MMi
         5IW7fAXiVAMoQ3W3JA269ycGP2wulKgl7fdTdi11FF1F5xWuE5O8XDz7+Y+5dNUW7sAx
         0J9v0JviDsVg5O4e1hhUA3gYA5NKrRx01SfuhfDzr5ZeRhJXKlh2Crwg2FZfONNmSe5+
         orZ8zhSbVVlYSJrD+V1l34xRmwb4Gyw3LTX0yaO9ohJVUrBUCC7oyMv7JMSFjGQCbtp1
         oCo85j/uVmFYYByGTif+Z86hAtrkcavcwqHmuXq0fasOlU7w2KCkMxBiiuUoHj+N0A8J
         cNAw==
X-Forwarded-Encrypted: i=1; AJvYcCVl4lz6eR1aBpH8fbCCIHDvYbob0dP/VWIb665ztErGr1L5tSKV58PYC/CBZusTSX4XTwL5Qk0FaPXxs3+T@vger.kernel.org
X-Gm-Message-State: AOJu0YxqUYJOdeyk/GFnOdKTOSqar2q5Go+LBlBx4PnDwTTms7FRmCQx
	vdXXb+5Uxs3YEpKosDaZPfhXafF7kPgQ5YFtB5CzFVLKGwhJj8I2aI4HvOJtyWQ=
X-Gm-Gg: ASbGnctK9zwBgjD9yzkWb7k05krpC8hr6rggk/hATKS3YeXJ+UMDUkbqhnak1ja02Yi
	LiJOy13hk+YM7FJIwFFXst+WqXIR5Euq2KAp7QweZsMFC7AztydmXbZgy1n5RVv0ywJUtpfAols
	DEXRe6lWHxCUhvIXcj5p/z26B8CdqA1DpFX8z3DVqDDIEXWmC5QW1GWqWbUL2bH6Y0cccJFEF9u
	QWrvDakRVeBFQdRX57jyIr+FUDyU2QANEA4+k2VGeUimJoyKuznwZAcyQ6Rp8RGbuWLsJihSt47
	NuME2tgVLh5496GHEyx71G5uHWnsuEQjUgIkQcMf9jkr8HoIsQ7G3xF8Fh5tyQ==
X-Google-Smtp-Source: AGHT+IGEfAdo3phUQuuKOO+WZb9/v6BtJYNP4UYJg58sg3B7+0a4zPQbHBBDzFdvAR0Q23fF1Dv5Nw==
X-Received: by 2002:a05:6000:430e:b0:390:fbba:e65e with SMTP id ffacd0b85a97d-39eaaeaa215mr12387809f8f.32.1744724878603;
        Tue, 15 Apr 2025 06:47:58 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2066d0fcsm210434195e9.19.2025.04.15.06.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:47:58 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v6 0/7] media: qcom: iris: add support for SM8650
Date: Tue, 15 Apr 2025 15:47:52 +0200
Message-Id: <20250415-topic-sm8x50-iris-v10-v6-0-8ad319094055@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIlj/mcC/4XPzQrCMAzA8VeRnq2k6cdaT76HeOi2TgO6SitFk
 b271YuKDI//QH4hd5ZDopDZenFnKRTKFMcaZrlg3cGP+8Cpr80QUAOi5pd4po7nk71q4JQo8yK
 AexSutd62qmlY3T2nMND15W53tQ+ULzHdXmeKeE7/iUVw4AJtGED3zhi9OdLoU1zFtGdPsuCbk
 TDLYGXa3mgvhw6cCz+MfDMKmjlGVsZIbdxgelDe/zDqk3FzjKqMgqCE0E6h/X5qmqYHJiXC9pA
 BAAA=
X-Change-ID: 20250225-topic-sm8x50-iris-v10-a219b8a8b477
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3599;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=cFvQGHACoZLdW6C7SjPAIpEiWAy3VkMr7aEysaz7yPc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn/mOK76oTQvkEWmjE12020fW8FfXKh6af68rA7J0s
 Lbyb74mJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/5jigAKCRB33NvayMhJ0ca5D/
 wPGlSZFo0zHEKtuhObuKGNzFDT2n1DgAA2aKfkODLDlsqzW2vLp5cYLiqGz2/RbbLuCKxSKhfUHesY
 s8yZr5BxFPQEe2T95cT4jxkcFB780+4eYiYMj6dtO/z82P0U+rnCs5PPlTzqNfKlNx4f0fS1eKjBI6
 IsH8QbPaCH2sPR+S+MEpVQd0I6R+2Ikn/qeQ1uYE9146Dfj7cOE+x3brapTRidglOCIU8lRKyy4zyX
 iaVs4KCFEkLHTJ4ehpN8UXbsis0GTL1dx08fwQ/IUfVLZlr5MFU/EykQzcwdQTzPB3eMR33XeyKF30
 VemKz6FlS8ngHO5AQRao8tJh68gXWeVnuOoopzjJ0Y79/woyeLhB2dysCjDVmeeUcCiAgENLAH915+
 Jt9LV9GQr7uvoi3+DvTGk3LurZ/SH7S72d71FI3BGlsnYdCd1QbQKgei+i+5RX+Zarfwho2ocUU9DQ
 osxVemVk2vkPBhwPTEUGmtYvh/lmvYBVrGUT3XPY8f5t1py96PvOVrQjMBBWikDfxseA7v6uPZ07uo
 fGRJLCyJypSyVh5wwkla98yECWBbnvetN/hgtrDNmmFqzQrWr1OH4R9kJlHxYnXt64A6X4C6EHD1R/
 L7c8BSNloc7h17bM08pTvksj/eni6uxbSHSauL/ixsDFoyDIQWTTZfJRlVKw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add support for the IRIS accelerator for the SM8650
platform, which uses the iris33 hardware.

Sm sm8650 SoC support also reorganizes slighly by renaming
the sm8550 plaform file to gen2, and move soc specific data
into headers.

The vpu33 requires a different reset & poweroff sequence
in order to properly get out of runtime suspend.

Based on the downstream implementation at:
- https://git.codelinaro.org/clo/la/platform/vendor/opensource/video-driver/
  branch video-kernel.lnx.4.0.r4-rel

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v6:
- Removed catalog files, renamed sm8550 soc file to gen2 platform file
- Moved SoC specific into soc specific headers when adding sm8650
- Rebased on next, fixed bindings
- Fixed errors reported by CI
- Link to v5: https://lore.kernel.org/all/20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org

Changes in v5:
- Reorganized into catalog, rebased sm8650 support on top
- Link to v4: https://lore.kernel.org/r/20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org

Changes in v4:
- collected tags
- un-split power_off in vpu3x
- removed useless function defines
- added back vpu3x disappeared rename commit
- Link to v3: https://lore.kernel.org/r/20250407-topic-sm8x50-iris-v10-v3-0-63569f6d04aa@linaro.org

Changes in v3:
- Collected review tags
- Removed bulky reset_controller ops
- Removed iris_vpu_power_off_controller split
- Link to v2: https://lore.kernel.org/r/20250305-topic-sm8x50-iris-v10-v2-0-bd65a3fc099e@linaro.org

Changes in v2:
- Collected bindings review
- Reworked rest handling by adding a secondary optional table to be used by controller poweroff
- Reworked power_off_controller to be reused and extended by vpu33 support
- Removed useless and unneeded vpu33 init
- Moved vpu33 into vpu3x files to reuse code from vpu3
- Moved sm8650 data table into sm8550
- Link to v1: https://lore.kernel.org/r/20250225-topic-sm8x50-iris-v10-v1-0-128ef05d9665@linaro.org

---
Neil Armstrong (7):
      dt-bindings: media: qcom,sm8550-iris: document SM8650 IRIS accelerator
      media: platform: qcom/iris: add power_off_controller to vpu_ops
      media: platform: qcom/iris: introduce optional controller_rst_tbl
      media: platform: qcom/iris: rename iris_vpu3 to iris_vpu3x
      media: platform: qcom/iris: add support for vpu33
      media: platform: qcom/iris: rename platform_sm8550 to platform_gen2
      media: platform: qcom/iris: add sm8650 support

 .../bindings/media/qcom,sm8550-iris.yaml           |  33 ++-
 drivers/media/platform/qcom/iris/Makefile          |   4 +-
 drivers/media/platform/qcom/iris/iris_core.h       |   2 +
 .../platform/qcom/iris/iris_platform_common.h      |   3 +
 ...iris_platform_sm8550.c => iris_platform_gen2.c} |  65 ++++-
 .../platform/qcom/iris/iris_platform_sm8550.h      |  11 +
 .../platform/qcom/iris/iris_platform_sm8650.h      |  13 +
 drivers/media/platform/qcom/iris/iris_probe.c      |  43 +++-
 drivers/media/platform/qcom/iris/iris_vpu2.c       |   1 +
 drivers/media/platform/qcom/iris/iris_vpu3.c       | 122 ---------
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 275 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |   4 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   3 +
 13 files changed, 434 insertions(+), 145 deletions(-)
---
base-commit: 84e171e5991bc3cb4a71a7755ba93391da22e838
change-id: 20250225-topic-sm8x50-iris-v10-a219b8a8b477

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


