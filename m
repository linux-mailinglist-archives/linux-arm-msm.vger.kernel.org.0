Return-Path: <linux-arm-msm+bounces-53417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C245BA7E47A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 17:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 413D81884483
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 15:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49B871FCFDF;
	Mon,  7 Apr 2025 15:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d6AN9Lx1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7061FBEB3
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Apr 2025 15:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039464; cv=none; b=H43WCuA/lwpCg8XTyKqxOQ0YgWR6pO59PUC7pU9ujNNYV4vdm+Jijow20NkUz21nE/HgGWOslajufWlbSzk5QfV6PaULNlE4CtuDYt6Vir6szX6kYbLS3GkqeAdIyH1Rgqj2o4RS7E0CrQdlwlguaPFMM9Yb9EwzR+8o/TPXebQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039464; c=relaxed/simple;
	bh=novHWt+IckjAs5RJ2jD+LBtvgjcjFIwSENHUX6qFjac=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=N62wvUmP4lqOwWdRca2OqQDUYdrCpuajcusyHPuqjW9JBL6g//DfhG5vQboe+9merdoD10gmIq1gIjD4JkfUw99om/LskD7GqwFD87L+CWqwy9wwpxZTGck3dyorjtX/ILQFLPwO3gGqjf9Br5VtgADhlnaLBTSsOrQ4gkhR2VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d6AN9Lx1; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c1ee0fd43so3826154f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Apr 2025 08:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744039460; x=1744644260; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRyv1eDw0Lky20FVBeh4eYv1yzrcMiBb0PQDIU5MYBI=;
        b=d6AN9Lx1kJpeB4Uxkh/7SXsA+wk/p5UEvtkirnIE/4vfuPe4QWV2s4Ws2oatiQ/FHY
         O/i9VrSAZITbh4hTaroZKFaSzKpwFxOOCjPFCSEzTxFe+CE+JZoPDymlV3X4F7GDENM6
         FdWyqmUWuCMdo8CT/M0rp46354CRihp5PqS+akHuUYBbcKjyxpPG1w4sS6ii35vy1ziq
         4BWI0rxTeRKbAUSoqAvVdWE0YXkFu/fVUJqUcIp06e7b9R8q5UZz3oZozB0Ua3EGwWYS
         LmGvgG/T8ysa1uF9mmBipcbjS+lxP9ADbpW4EOSl7WOaqHecsS8AIaafC1gweo1T1QCL
         0Icw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744039460; x=1744644260;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRyv1eDw0Lky20FVBeh4eYv1yzrcMiBb0PQDIU5MYBI=;
        b=PfuSV72JjuoOWpL+hpbC3OOhm45Phr6jS0sqbfQmcOKx4p/jbZzNxIrlgHkoPWi2aB
         L/7cWgWw9hhbgBAP3cWr749/JxohO9582qWhTYWD1vN1cVVmoH5Q/hkz9wS7iyojsSCZ
         f11sDGEw+8AcDhlrhTSAOa60Ctmj+kFb7ffb5Fh3RqsTpGVF5wrca7oF7pf2FqHXOkWw
         TelUCpdM5AbhVybVpzcbB+mKECFXawHrWVC33P5GsqxWViDpgBVh6sWasAbil1GrPtxe
         U6hhAZNqlgn8J4RxEXPUcKgffEVdQglZH40C6+6e0DYX37OcfXhHmT1gmSwHwR6g4yvC
         GOHw==
X-Forwarded-Encrypted: i=1; AJvYcCWpu3aV+tn0VXMHBaKOnO7UtJA/Qr45jXrQrd/nhd2fSOeWo0TnHUz8eg7ogjDjlf9dQ/cJM6Gsn/dPKYoq@vger.kernel.org
X-Gm-Message-State: AOJu0YxlEFhLJl15cuFC7qORIo+RIbfAE8xDdw03JTlw9PUtlV0KGPWz
	w2uOZeF0rXd5+rfqKd1xM0KL4W38JTci8QNek7xF9wfmA0F1dwxa/zeA/x3XeVU=
X-Gm-Gg: ASbGncuxewyJTh3VclC2Gprci+Xnpzx5d/kmcf6/vKh2hIjUv7jtd9uvxqgBt2Nf4ch
	UNU6WPDYrsibPGDyvHNUK+yL+GlFVITfpYN7vbt4nlTB461+DhvcCsKEfHzVfUxwJJx3QaAVe40
	Tzcgh4cbj56mxNlE3Wblc4FP/JOy//Blf/tcuadX60awij7xlsZJVkU04BHVGclMIw5a9naqcVU
	44SxlQEWgxVpo6E1t5kIBn0hpCvgXgXDCJlWdSGelEogHmsZDSRoY71NbZ7gUO94cMrsjzb6LX0
	BV54rKn+cWRG00uOobA77Gi8M0KvvrhgWtN1ipEIEM6pRwxeZ3tlISoyHtUd+4xlhg==
X-Google-Smtp-Source: AGHT+IFazXkdO5dDlRtZHa1gkMWXjDdGfMUMZBCjZ4nH7fqNCJsJp+Np6eSWi5wD/pQ2AlF0gHZP1A==
X-Received: by 2002:a05:6000:4282:b0:39a:c9b3:e1d7 with SMTP id ffacd0b85a97d-39cba93ca51mr10971257f8f.29.1744039460252;
        Mon, 07 Apr 2025 08:24:20 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b42besm12212001f8f.41.2025.04.07.08.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:24:19 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 0/5] media: qcom: iris: add support for SM8650
Date: Mon, 07 Apr 2025 17:24:12 +0200
Message-Id: <20250407-topic-sm8x50-iris-v10-v3-0-63569f6d04aa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABzu82cC/4XNQQ6CMBCF4auYrh0zHSwUV97DuChQYBKlpCUNh
 nB3Cxvjwrj8XzLfLCJYzzaIy2ER3kYO7IYU2fEg6t4MnQVuUgtCUkikYHIj1xCeelYI7DlAlAi
 GZFlpo6tzUYh0O3rb8ry7t3vqnsPk/Gt/E+W2/hOjBARJ2raomjLP1fXBg/Hu5HwnNjLSh8nwJ
 0OJqZpcmaytsSztF7Ou6xvHld81AgEAAA==
X-Change-ID: 20250225-topic-sm8x50-iris-v10-a219b8a8b477
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2440;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=novHWt+IckjAs5RJ2jD+LBtvgjcjFIwSENHUX6qFjac=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn8+4hiolf24bSQ+z1DduOnKmTyUM00q5JAx3da1TS
 dOKJOjmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/PuIQAKCRB33NvayMhJ0ZRTD/
 9/06gUrIeHJ91T0T7T+XymVksrJ7soK17CdlZikUBc9hb2OIO3IM0whrtPln8PNN6dpxwy0QwBwsGs
 j91lYs8Ch2L96Z9FYUqPRvHOjPu/iyvq8m1UombjG79k2nr+EUpcv+CTqEGi/oDP8EVR6lqDTM0Edf
 Jrn78YiwqJQe4Hgxeln4MGJyzmE2rBCAOLj7mbIlX0tncnFa9MqUHOdtrg1x+kPva3Yem7fnQZ/Zd0
 +TEn8kIFLj3ngEIBQX2pO0YtQwiTpICgfZkucnq2wAXY1g5V1E8GzOX+8OAZKg/taKBB/7bpkuQa7H
 ycuiPFf8aldlgUPmlenwuOXEEYwy1jsrIU4932w0BRKn2J73KxCFWz+g9W5UN22q5ksXTo8zcDxbDO
 3dR2rGJjf+o6WIuthETfS7v6tMqjKlItf+gonZaKU3iPMegcpUjueicct/xDl/ks3VQLFb6+aQo9eE
 Mg5y+efg66PCnSrgZxWkmftUVNUroFh3ZrFVQtaxsXUFGSyeCQG2JUmEEVeifHMOXbO7mzhHHZ4JgM
 QHc6nBVNaa/eGTt2c2g4v4cz46SQrqPDVqm+CJ+7EWlkuuECs9lRHga/HnGhNay1Ty5gDLmsXpyYzp
 IBX00DXPR4ICGM3qLs1B6E9dxyjHPVR5lSitzH/dTS1jwlBTxA2wHEGUQs9w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add support for the IRIS accelerator for the SM8650
platform, which uses the iris33 hardware.

The vpu33 requires a different reset & poweroff sequence
in order to properly get out of runtime suspend.

Based on the downstream implementation at:
- https://git.codelinaro.org/clo/la/platform/vendor/opensource/video-driver/
  branch video-kernel.lnx.4.0.r4-rel

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
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
Neil Armstrong (5):
      dt-bindings: media: qcom,sm8550-iris: document SM8650 IRIS accelerator
      media: platform: qcom/iris: add power_off_controller to vpu_ops
      media: platform: qcom/iris: introduce optional controller_rst_tbl
      media: platform: qcom/iris: rename iris_vpu3 to iris_vpu3x
      media: platform: qcom/iris: add sm8650 support

 .../bindings/media/qcom,sm8550-iris.yaml           |  33 ++-
 drivers/media/platform/qcom/iris/Makefile          |   2 +-
 drivers/media/platform/qcom/iris/iris_core.h       |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   3 +
 .../platform/qcom/iris/iris_platform_sm8550.c      |  64 +++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  43 +++-
 drivers/media/platform/qcom/iris/iris_vpu2.c       |   1 +
 drivers/media/platform/qcom/iris/iris_vpu3.c       | 122 ---------
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 277 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |   4 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   5 +
 11 files changed, 413 insertions(+), 142 deletions(-)
---
base-commit: 0d6ed9e013fcc33da9676ed870454d2a014a5aee
change-id: 20250225-topic-sm8x50-iris-v10-a219b8a8b477

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


