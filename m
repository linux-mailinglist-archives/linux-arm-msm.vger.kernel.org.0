Return-Path: <linux-arm-msm+bounces-11088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5385E855485
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 22:14:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77D861C21F35
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 21:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E093613DBBC;
	Wed, 14 Feb 2024 21:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SIFlWJXs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DFB41C71
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 21:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707945243; cv=none; b=VDPL2zdQKrJSDAPSAbl3pvTjqvq+C23lDiErLYhjBj9vhmbseclwfpg4JiUxz5UfPzJPclUyFr4WS9ceFDGVCxKmeCkCmJzp88+68Df1myyzf6pABN28xoylo6d/1kDwqVcN2yb0u7IdMpUy76CvIfT8OJ1o9FHBBrSpYR6czV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707945243; c=relaxed/simple;
	bh=IACw7KMcWVisJNVv/9M8BMcs6sAOl9OEQL2J1N0ez8g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NdT/NeYvVGAK09Mxpp2Mv8+avIDcmt4ik27g4MLR/9kIihn6qxfZModG5OvWrPKtqFPdJPnGpNrGsJBMQqLUdJH8DCZjrrTjfzyWmyJlTF7Y2+ciKzZ/BzqR5fMPoOSpl5TikGFFQAIX0O9gE6vto2jYaeSrfaJwBOxIWrqUwuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SIFlWJXs; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a30f7c9574eso17016166b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 13:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707945240; x=1708550040; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fvj5uw7QbenybDHCLaJHTEMXDIGnFZ9H+LRfmuRvVXE=;
        b=SIFlWJXs0EoHk+tyEbzvGq0cdNm1z2X9pViUjSx8K1qBypCke3rPecVVpRZ+TP+cAx
         9QArfpOVEYL1x1xow5IPuYaOcmhoASTwWr9wXo0i7FQeFwJeg1wz1DwhofAM3zCRnFbG
         Tp0bth17YIXMO2qMrfAx6oKEfy0+pfIGzIrFdTmCHEvY5V6/8miPUg9hwe+v00KyaxRT
         OL5TX6HiCDbdFyPjDAKcMmsGpQOAAc2nP2G5JVctav3PgQzztfsKSynu665hydLq1GK5
         Zu5apb8mOSQ38OHDfBfYZQ4/nLo9APClIp4dTPk71ac94z/xh8hs7fuJT2j7sI4ji73A
         Jxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707945240; x=1708550040;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fvj5uw7QbenybDHCLaJHTEMXDIGnFZ9H+LRfmuRvVXE=;
        b=tp3QLspnE5QO5vBuCFhwC1tjdwOwC/q3AXhEqWtDY7y+fbUwzWEJ/BcEpGa+1/crrt
         lFxk8cQid6dmpEaVrCbOnhQD3Mv+JXY9/Vqs5+AT4WRXQfMUKpzJoHywCu2+ZLMygM5g
         I+tQcVjRTY0r/SCDFTcfw3AlBB96fhHYxUW22sPO9/Dq0KW0wdLrfj6P/5QtzLmbzdp7
         6qxUYlLTF+3B6xTvbvFYmpzkC3q/46BZNWtDoHn2dNHfDuqeC0hBvR9BIYoN3uY+Awzl
         IOC1N/8k2+HNCDmKkmHMrvCNJIR6l35hQqzH0JPdhML5Ob6VCpN8WNomLsXzGeaAhTQP
         Y+MQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNACc5THaPm1n1mIOimDFhAJ+lh8wpZ+Fx1UDbJli9qvpxjkO3MOoDheBcyPJRFVn+LH+pCEiSMZj3bEP+TA3qtlQTYGQsKwMrm6OBYw==
X-Gm-Message-State: AOJu0YztTEBiTf9Chxify1y2Qcx80iKXOBvP9r7HDia6sUtjUoVKaCav
	i9fjI6zlEnSnCjRmYQcwHm9MHeShQBerU9sDSGVsdE4fo12YAO6BDYXhBzn/rUM=
X-Google-Smtp-Source: AGHT+IEshxCe9h92dXHRhhELvUU8nvv2IO+Or5Eq8ER/XHd1CxZ/osf78IndNBAnN+2h6ZNmpchPBQ==
X-Received: by 2002:a17:906:3b0b:b0:a3d:407a:d270 with SMTP id g11-20020a1709063b0b00b00a3d407ad270mr1773296ejf.71.1707945240118;
        Wed, 14 Feb 2024 13:14:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVUUtxBbZ4xOCWIIiBuUka3IHzQRTxkhbwtSe59/R7kG46dv77j6lQQIJFGG+FjQH9qMXIXZklD2dBX/ptB/c6dMkcz19UVdEGKh6yuob5teE75pbY0jMYZQlc3rPS6qRkpTuaNfMglHzpWS1vK8RmAB34i9kklIEyyxo+LzOWz+KJz8+LTzhrG2G7tHXvx9I7V3Gh+q8ByJAzZNTTt0B18GE0BRnJcdaoxQCzKb7ZMrLmTqqbGIbkMMnSJLiCDHJdWfRTWeHLR7Dsc3K8dVonc3YoigaO2CAv0CqEvjopRahEKUik0YmCjOxKQVn9cCwOw/3Nv6pJr7nOWZmwJBxpr+gcjOcKnnVIuS00zgovV0PzG5qCW5SVogR7XnRMYlHa4AorRBHjta5EVzFLg8K5oqK5bP6+ISpkPH9OFFy/d8Z1QfXjR9ZmGqHMTwUiJdzEkusDGK1BPodzMWcSgydzQXuD7NuhHtA+rI/djO+3x2G0wRncJMIPbV9FLgixiUxzyNOp+lKw=
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id lj8-20020a170907188800b00a3d22f53210sm1457661ejc.188.2024.02.14.13.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 13:13:59 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH RFC v3 0/4] spmi: pmic-arb: Add support for multiple buses
Date: Wed, 14 Feb 2024 23:13:45 +0200
Message-Id: <20240214-spmi-multi-master-support-v3-0-0bae0ef04faf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAktzWUC/43NTQrCMBAF4KuUrB3JT22sK0HwAG7FRdKmbaBtQ
 pIGpfTuhqx0I24G3jzmmxV55bTy6FSsyKmovTZzCmxXoGYQc69AtykjimmJKebg7aRhWsaQpvB
 BOfCLtcYFODIqOC4l57VE6d461elntu/odr2gR1oO2gfjXvlfJLn6g44EMDTqwDuGScO79jzqW
 TizN67PbKQfFGG/KAoEJJMEU0arGldf1LZtb3sfhL0TAQAA
To: Stephen Boyd <sboyd@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1702; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=IACw7KMcWVisJNVv/9M8BMcs6sAOl9OEQL2J1N0ez8g=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlzS0KmRl9SRbfymQtKRJt3TaVzG4PtPDrk12mx
 VVLVrxaDHOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZc0tCgAKCRAbX0TJAJUV
 VvwcD/9/eewiKANIY++vvCSQKHTeAsK6/BWHgZLOBtXv8It3S7cuwCVdZGI1pwgA8zdY8UtzKrX
 XXfvQ16NYKhgW5cGqHhX9YHYqK0jla3EHwYP5p1FPkJhK3M8ERewnaY4FzPqM1Ua3Kselb5fSpK
 ttpEuOObuF2SyXJUVO9lvlyeRc/QxszK2f8so6evN7j8nVi9EDW3Kl0oN3IjR+3u//X2P2VIXQD
 zhmLll2dLLdafN+loISJ6z4fTxz5ML3EBY7IVcPJwdd7WCHZfOPv8cDZEhsUNuOqJveYoXg16Mz
 noTnRYPzmbtmETUw3pDt0sMnZsTVEHCLncgVYtLChRdzO0rLS8/OSMFrwkvTjgL7AtB9NuXsqCA
 uplStRuKZjSVNwwKh1S67bAqKcBN5V+aBG3R25vaMIgsKCmWl2Rq4qcjrhm9KS83KQs7x1U3wOm
 XyT6n0DvlDvSdASyqOVPd8ru8oJWO4pgosQ3ZONxntUOs3IjCLUy2TUKP5k63jvQsYi+/flLsBu
 t95kdXqc1szgbY7Fs+wuX59e8bkUZtazkl6GIDVD4X4CADQtwwckeT3oiuehhY40SuJbWGVpGiu
 X9+YWYt4MJhLXOyT9HSGPIoq8lT8iuwwK1NZf+zpUpths6g1K9wAz1fU91LkewQ8IXQy+CfPf/h
 ecAzlXpyrMI625w==
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
 drivers/spmi/spmi-pmic-arb.c                       | 956 +++++++++++++--------
 2 files changed, 712 insertions(+), 363 deletions(-)
---
base-commit: 2c3b09aac00d7835023bbc4473ee06696be64fa8
change-id: 20240207-spmi-multi-master-support-832a704b779b

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


