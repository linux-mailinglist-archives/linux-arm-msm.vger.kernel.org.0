Return-Path: <linux-arm-msm+bounces-15663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0013189138D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 07:16:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1392287FA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 06:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2BF44C8B;
	Fri, 29 Mar 2024 06:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sRoNSO/f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1FD446C5
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 06:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711692946; cv=none; b=DJzsxENBMwriCjxoxwTJyAnEFY/I99BHyqPlgK5jBM3ezXFqbn+iM6dRX+5Dx+zMmROo4ZzPjtzj0Epeco5UJshAjp+JNkWbu5E1HC5ejonRS6m0A89Rq035fPFfyyEMLgATwieV9+Rju+OtIIX4Qa3Mj8LUImCmCoLeoP79dmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711692946; c=relaxed/simple;
	bh=8VURQvqHgElRal01VCxfreaQz0r2PHAENWmGfuWdnwM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kKU+UYbYrA1fAYfpTpkjbCST5cKkgwiwYYsWV6GfYN7FjT+4gyUjZQJLiMpkaFUGP2e3cS+1hyntpg35fXOLJCvlLn5+B8Axm+Vb0fYudMKleZgAHMDU9j7cwTeEgR9EGeSLw6yIzG9n522VZj4Nz6gNJbTPB5L8/8+C3Xe8afY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sRoNSO/f; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d715638540so5079111fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 23:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711692942; x=1712297742; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=05Jl4TFSpb/J8CtWryAsZpfPiC+ue5/NnEIfTzyep7k=;
        b=sRoNSO/fXXJAjtvkQsI0IKyp39eOGq68vDSffte8enPYryfrN1W+LWB3aXWXJf8rLx
         dMs9A0uqqjyIHNb+ZX+MteeRovGYn98jZP4gPmwaEhAQUZ2EJdicvWifIvX6QQJnwwXK
         NTzhhhMBJVZ6jXrsKknm43NgEL/Asyrcj5bWKGZnRO+XfR3rPvLPZT5U271thzJOQv4/
         kr5uqG9+Bzu+KahePmWWwuD4d9L3iHIuM9FVCU4S4h1Riv1MP8ddROgSiO/22MKtdCGv
         qZfTI/NEkxiA8ZfTJoNAMxq2lTHpWo8BmQLtEfUbHL8BSOdkCTmiA75MVdGg8lN7qyEz
         lspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711692942; x=1712297742;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=05Jl4TFSpb/J8CtWryAsZpfPiC+ue5/NnEIfTzyep7k=;
        b=j1DeJ8BLwQFNPg8u/65OcOOIyTsgEpqwBlAf88ctIM4D5zzjZsPOfN89HLf3PF6CA7
         qOXmeUbRHK5dDjAAKkk1W04pewV38yCnyRfqllrluAJKe1/qDZdcfWHFgLhA5K4LRH6z
         /bRyRhO2m7PxGo0fYit3DOCzHg4RN3keHFq8msgRU8Ajl0FempcfqLb10nXEwqX/bdSZ
         3Ibbup9O7xlEyi60O9vF6Q6RjtwPVtofTHgyUycSBXSrrteuDoTJjDH83pQxmmPtTXNx
         zH0DCIw0m7dm6rGLdMxIv48pF3KSR824Z5Wo+8uN4u0riy1KbV+CWRCy4DeClHY89V5u
         vmiA==
X-Forwarded-Encrypted: i=1; AJvYcCUcIIG0o6iEh1unPneG3D7Jz7nwsIPVTwhGFkgxlFAQ0n21/asphEoTXVIzb2RvcVQgN5Bb+5E17hlLgj6oaoMzqxIyMGtfyxgZ9E5y1A==
X-Gm-Message-State: AOJu0YzFQfMkDaKg+K9K3boZhtb3UhqxTp4u1C+0VdWnc9Gukq91mh1d
	Lu51j5G0IR/0kpK3cVNMx2hy/WZ/3QHc5/hI3b0q5zF1EdCiw+im0cNR9pcAORk=
X-Google-Smtp-Source: AGHT+IHLh1rQm4JDYo541UPTjfWuEUYCmhHfq4ITPbkH3yhAEStET4DvT5V8s1Z4B8T3T5epbcWM8A==
X-Received: by 2002:a2e:300d:0:b0:2d2:3fac:5fc7 with SMTP id w13-20020a2e300d000000b002d23fac5fc7mr576677ljw.45.1711692942298;
        Thu, 28 Mar 2024 23:15:42 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k17-20020a05651c0a1100b002d6cdee339csm494539ljq.103.2024.03.28.23.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 23:15:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 00/11] usb: typec: ucsi: fix several issues manifesting
 on Qualcomm platforms
Date: Fri, 29 Mar 2024 08:15:32 +0200
Message-Id: <20240329-qcom-ucsi-fixes-v2-0-0f5d37ed04db@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIVcBmYC/2WNzQ6CMBCEX4Xs2TVLqQU9+R6GQ/+ETZRqq0RD+
 u5WEk8ev5l8MwskH9knOFQLRD9z4jAVEJsK7KinwSO7wiBISGpqgXcbrvi0ifHML59Q7drOiUY
 ZRQaKdYt+LYp06guPnB4hvteDuf6mv63mb2uukbCVbk/WyE4THS886Ri2IQ7Q55w/toKCzq8AA
 AA=
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2134;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8VURQvqHgElRal01VCxfreaQz0r2PHAENWmGfuWdnwM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxpbTDfb5wuq60M9NET4LrG0XZ+0xn6NQ0ZJ45F53e9cm
 J605p3oZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEfFey/9MuylKZUr9+XaaT
 sPMFnS8tYq3i0oo1XiIyn6/ucDxtGNLwz2VNkZ1U2Im5CZras+6suy96dZZEtLj2xLhuI725855
 ttTjv8MTgx5MJTzhjeOpeWNeWPnmjsSTp6/75QbP+PI+b8T3H4oumWaC8v2xi4bLJNrEB1SXlls
 dXPv7x9GWzW5joHS3xfsVrkS3ssZ9cItL5Llxi3ebleZh1Yej6kpDLNWsmaKk6cGSUsDemiih+m
 pWquDBgZVvJ7hdzjuptDr6sGjvf7b/hjZecSmanjvD2nkx46PnTM9GSXWRV7aOPz7eui9OwMwuc
 nWpzrcLYvOPIhzk5iQueGAvyNe44Xsx8qME5QOFKrwE/AA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Fix several issues discovered while debugging UCSI implementation on
Qualcomm platforms (ucsi_glink). With these patches I was able to
get a working Type-C port managament implementation. Tested on SC8280XP
(Lenovo X13s laptop), SM8350-HDK. Lightly tested on SC8180X Primus devices.

Depends: [1], [2], [3]

[1] https://lore.kernel.org/all/20240315171836.343830-2-jthies@google.com/
[2] https://lore.kernel.org/linux-usb/20240320073927.1641788-1-lk@c--e.de/
[3] https://lore.kernel.org/linux-usb/20240327224554.1772525-1-lk@c--e.de/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Added a quirk to delay GET_PDOS / PD registration on Qualcomm platforms (Johan)
- Enabled UCSI on sc8180x after running the tests on the hardware
- Dropped the ACK_CC patches, replaced by dependency on Christian's
  series
- Link to v1: https://lore.kernel.org/r/20240313-qcom-ucsi-fixes-v1-0-74d90cb48a00@linaro.org

---
Dmitry Baryshkov (11):
      usb: typec: ucsi: allow non-partner GET_PDOS for Qualcomm devices
      usb: typec: ucsi: limit the UCSI_NO_PARTNER_PDOS even further
      usb: typec: ucsi: properly register partner's PD device
      usb: typec: ucsi: always register a link to USB PD device
      usb: typec: ucsi: simplify partner's PD caps registration
      usb: typec: ucsi: extract code to read PD caps
      usb: typec: ucsi: support delaying GET_PDOS for device
      usb: typec: ucsi_glink: rework quirks implementation
      usb: typec: ucsi_glink: enable the UCSI_DELAY_DEVICE_PDOS quirk
      soc: qcom: pmic_glink: reenable UCSI on sc8280xp
      soc: qcom: pmic_glink: enable UCSI on sc8180x

 drivers/soc/qcom/pmic_glink.c       |   5 --
 drivers/usb/typec/ucsi/ucsi.c       | 139 ++++++++++++++++--------------------
 drivers/usb/typec/ucsi/ucsi.h       |   1 +
 drivers/usb/typec/ucsi/ucsi_glink.c |  17 +++--
 4 files changed, 74 insertions(+), 88 deletions(-)
---
base-commit: 845042eeeaca808537b4dd6e1de3f19a0d747fa1
change-id: 20240312-qcom-ucsi-fixes-6578d236b60b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


