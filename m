Return-Path: <linux-arm-msm+bounces-17949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3548AAFEE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 16:00:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35762B21067
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 14:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 111AF85938;
	Fri, 19 Apr 2024 14:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bjLWtjfP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA0E12CDBF
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 14:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713535243; cv=none; b=a+h5JIph/7tkn6ATqAaRXqZP9HjU+mIBqN4D/EOIvbigOV2+9/0QAiNht32Xxxru7kX9FYut+4DLrcPxjG1A6kdgktq4uXZV9IUsQ1c/6klU33icsT/hnEaIR+ET5Jem41uiebySOWu6/1wm1bnwdy4tknlIlyeKPnhCHw5ph0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713535243; c=relaxed/simple;
	bh=l7N6ASxrZ38YuSMz6qA/eZMooJfxU7ZhuNOZz/NLgcY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PssGdDw7wHurL/idhqznF9fBt4MSeW4Jo5AgysBXBj/Bbkr/4sGnM5j8vByG3Hu6yZK2OzjLiBqiz3w/NlzW61QneVO+M3WPMpYQ6eLZ/ODIIT78jdXKryozC0WQRiwyo2TcAhoY5mY+MxG5Of9bfBvGdkAVc8Scsw9gtv8Ml2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bjLWtjfP; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-571b1434592so2173466a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 07:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713535239; x=1714140039; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g5wPyJOnscn7/bmZm3FUiNynltGBnoyqP1uNC+CACEM=;
        b=bjLWtjfPF38eq7BojOHmLxYvp3s/IJJ9JrsdfF4+BM3VJt5H5DLhh/PvHwPGgrLVKE
         +lN14W/Vb6gCxiFPVIBzKXHzYdxh9kmJaBN18yaJkmWED7l5599VzHy5fWtedH6LK4L6
         neWKds3PbuvWVkhtzBUo/wh72py2OONbutPQc2t/ZXcD24e6Pwxm3/RG9YI8narEBC30
         pL5zaPj3BTnKRY2T/pVCrrFxWp5HG/ciKDQKt2nfSNe98USPg02zIOhqfWMHPxVd+Xyx
         tjykZAmxxzBerMeFE7ZXJqqIax6QckZxZYHAJQ7xil0UqPBVd6948eZNEAjOoNPtnehv
         fc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713535239; x=1714140039;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g5wPyJOnscn7/bmZm3FUiNynltGBnoyqP1uNC+CACEM=;
        b=XQ3fs4Po9fvfF7KCGodjEDaX9Ty4nQkpmTKUkrJVPP4Od1DAcz20ut8TCHLvlmUOqZ
         QxgqEgQ0eaGrWXkKW7yPgMLn2ng2wcW2hoIj4ofYqf3oOTteMdk4lBENaTGoSDgBOfDv
         1vpm8kRCg4Ujix1fQS8YwnBxLzOJYFIzEm/7qesiUF9CF9bMWKu2AhC7mjhE7fP860U1
         ADNPnL2NZfTn9vWNBfEL4lStRj2+wP+1jdizMvEAL8si95ODyW74K7aZdSVZWXook2mr
         vDehURtfXBEFXyQW/al936mdGBRPXl3dZ2i4iuJZAL/703qqH+DPspWVwSgZMMnbuuz7
         5ULg==
X-Gm-Message-State: AOJu0YxXG8hwIME21q3JfVZf0Jgrh+/1E+wKdUhVoPhxYGNSm6Q/CMjX
	brTjwxT8fWnwFJgcNmCt8JM6yzOnYjt94Iot/eshuNgUOFoChWlWh/Y6aAlHhgh50jYFZZ+3SFj
	s
X-Google-Smtp-Source: AGHT+IHBv7ovelFmceheBn3++B9RHjpEoPkivXx9ESlejRWHgJRSm/WizPdoOFzRvlcNiCbA1CYjAg==
X-Received: by 2002:a17:906:fb86:b0:a52:6b12:3078 with SMTP id lr6-20020a170906fb8600b00a526b123078mr1563548ejb.55.1713535239307;
        Fri, 19 Apr 2024 07:00:39 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id qy1-20020a170907688100b00a558be8bc03sm532390ejc.150.2024.04.19.07.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 07:00:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v5 0/6] soc: qcom: add in-kernel pd-mapper implementation
Date: Fri, 19 Apr 2024 17:00:28 +0300
Message-Id: <20240419-qcom-pd-mapper-v5-0-e35b6f847e99@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPx4ImYC/3WO0WrEIBBFf2XxuQYdRzfbp/5H2QerZiNtYjoG2
 bDk32sWCimhjwfmnLkPlgPFkNnr6cEolJhjGivolxNzvR1vgUdfmYEAFEpI/u3SwCfPBztNgXi
 Q4A2AR+sFq9JEoYv3Z/D9Wrmjej73FOxvRkkAI4RCPDdKICqjueR+iDMtzYelJfefqbx9xdFSa
 hLdtmwf85xoec4ssMX/XVSAC669BCta6S9e7lPbpKL2Ph58VX3T6raz0jrp2oOPO18e/2P1Ac3
 54pzVDvCPv67rD1CSP+B0AQAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Johan Hovold <johan+linaro@kernel.org>, Xilin Wu <wuxilin123@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3603;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=l7N6ASxrZ38YuSMz6qA/eZMooJfxU7ZhuNOZz/NLgcY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmInkE0PPVOx6slUNeqhiSNKojgG9PUEV/3EP+R
 XrNQYz1DTWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZiJ5BAAKCRCLPIo+Aiko
 1d0yB/9/z0CGpK4Yv+6JCef+TbLXe8tpKa80IEzqnCQ7tUJ5Z2fAWbFCQg7QzhaCJqvi3CMefp1
 tmUZdhQ/QEqG+Jx21+3xHDNOPIrtEE8jkj2YYPLcAn5KZMgQrR+DupeJ6VZRSYLGvkdfAHhxL8B
 7IZMziAcjitjA+Mwvl6gOHoe6EYeAskqYELsq/fC0Gfb2qe7aaCDofuIwAOb+Ikr4TOr24lTHPm
 15TaIYLsB1FGwKxaq7m/rnpNxiL5opEXOqrTgV4tRs0MSas/S5kBBJqRukw72LJ8NhEGJAQtwk6
 mPh9MIGUSz49qrr98U0CdgNd/yqiS+80q9MmLnlNQKS6mOia
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Protection domain mapper is a QMI service providing mapping between
'protection domains' and services supported / allowed in these domains.
For example such mapping is required for loading of the WiFi firmware or
for properly starting up the UCSI / altmode / battery manager support.

The existing userspace implementation has several issue. It doesn't play
well with CONFIG_EXTRA_FIRMWARE, it doesn't reread the JSON files if the
firmware location is changed (or if the firmware was not available at
the time pd-mapper was started but the corresponding directory is
mounted later), etc.

However this configuration is largely static and common between
different platforms. Provide in-kernel service implementing static
per-platform data.

Unlike previous revisions of the patchset, this iteration uses static
configuration per platform, rather than building it dynamically from the
list of DSPs being started.

--
2.39.2

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-remoteproc@vger.kernel.org
Cc: Johan Hovold <johan+linaro@kernel.org>
Cc: Xilin Wu <wuxilin123@gmail.com>

Changes in v5:
- pdr: drop lock in pdr_register_listener, list_lock is already held (Chris Lew)
- pd_mapper: reworked to provide static configuration per platform
  (Bjorn)
- Link to v4: https://lore.kernel.org/r/20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org

Changes in v4:
- Fixed missing chunk, reenabled kfree in qmi_del_server (Konrad)
- Added configuration for sm6350 (Thanks to Luca)
- Removed RFC tag (Konrad)
- Link to v3: https://lore.kernel.org/r/20240304-qcom-pd-mapper-v3-0-6858fa1ac1c8@linaro.org

Changes in RFC v3:
- Send start / stop notifications when PD-mapper domain list is changed
- Reworked the way PD-mapper treats protection domains, register all of
  them in a single batch
- Added SC7180 domains configuration based on TCL Book 14 GO
- Link to v2: https://lore.kernel.org/r/20240301-qcom-pd-mapper-v2-0-5d12a081d9d1@linaro.org

Changes in RFC v2:
- Swapped num_domains / domains (Konrad)
- Fixed an issue with battery not working on sc8280xp
- Added missing configuration for QCS404

---
Dmitry Baryshkov (6):
      soc: qcom: pdr: protect locator_addr with the main mutex
      soc: qcom: pdr: fix parsing of domains lists
      soc: qcom: pdr: extract PDR message marshalling data
      soc: qcom: qmi: add a way to remove running service
      soc: qcom: add pd-mapper implementation
      remoteproc: qcom: enable in-kernel PD mapper

 drivers/remoteproc/qcom_q6v5_adsp.c |  11 +-
 drivers/remoteproc/qcom_q6v5_mss.c  |  10 +-
 drivers/remoteproc/qcom_q6v5_pas.c  |  12 +-
 drivers/remoteproc/qcom_q6v5_wcss.c |  11 +-
 drivers/soc/qcom/Kconfig            |  15 +
 drivers/soc/qcom/Makefile           |   2 +
 drivers/soc/qcom/pdr_interface.c    |   6 +-
 drivers/soc/qcom/pdr_internal.h     | 318 ++----------------
 drivers/soc/qcom/qcom_pd_mapper.c   | 632 ++++++++++++++++++++++++++++++++++++
 drivers/soc/qcom/qcom_pdr_msg.c     | 349 ++++++++++++++++++++
 drivers/soc/qcom/qmi_interface.c    |  67 ++++
 include/linux/soc/qcom/pd_mapper.h  |  28 ++
 include/linux/soc/qcom/qmi.h        |   2 +
 13 files changed, 1161 insertions(+), 302 deletions(-)
---
base-commit: 7b4f2bc91c15fdcf948bb2d9741a9d7d54303f8d
change-id: 20240301-qcom-pd-mapper-e12d622d4ad0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


