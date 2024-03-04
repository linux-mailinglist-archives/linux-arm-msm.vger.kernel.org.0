Return-Path: <linux-arm-msm+bounces-13271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A47E98707E1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 18:03:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 334AE1F23654
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 17:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C1C25FDC6;
	Mon,  4 Mar 2024 17:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aPLeJCU2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FA65CDDD
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Mar 2024 17:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709571821; cv=none; b=fu3C6gLBJjN7gVppW/hdY7yrBxqsqBDypS5ZZEg0hpYQ19HkVEQmDxZ+zWiwWZFRSMEpxuupmoOPwz4EOyRa4eAWlTS5sKhennl8UkVycEz3qEp1mEAlzxiHfkl6EwziL7zrgcU+3OMAehMy88n3Azy/voVWdEp7aRS4eWtDnUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709571821; c=relaxed/simple;
	bh=ANAydXu4c0ljbBL0qjh57m/M8kf5qgt9E2bgy1sHqQE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DwakFfCpJ+kWGsgA7ERMxnyXbtGSvyDqM4h61VWh/mKUqbj5+QDn3v/BxRZqJLEO5/mkUp7031cbLhzcTPkS7WGiiBkRIHOAoYdvnLyLSlGecIcXSIKW9+zUUGHh3tPhQjGBzCz21quHBV+NeAIFEOojlnmi4Uwm0/r1Zz2w1aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aPLeJCU2; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5131c48055cso4681549e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Mar 2024 09:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709571816; x=1710176616; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eLhGSoksmlOw+50H5krG/zZLsVk+rKNq+hDEzHmuXFk=;
        b=aPLeJCU2e0PC/5LQxqYLy3f5BaXdDkl+FKQ2Bb+oSMCUm1MR1MX07jH8su9YWRg0QL
         kfo0EgsBDLIJrf7nclJvDDG9VSOYdXBp1zhVf28AETrmGgUBJWFMSWl8VO/eTTaI/4UQ
         Rgj50BV7sIi/3aQwTTSvueOvhQSDybJulf9zY6gV9D6WCD5nDuErclwnJTCcQ9e/AmMt
         j8xtN2WZCmk/JjHTKS+hMe/ECqnnmrwaYjl+DAPy+aH1rdvZGuaCnjIFFh4osmJu566g
         DwqAY/bjAkiD4lluKcfwy86HNirwNLK35vNJzRjtEVqftnE0CyBtuoCI6tJnmoYB/r2T
         S3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709571816; x=1710176616;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eLhGSoksmlOw+50H5krG/zZLsVk+rKNq+hDEzHmuXFk=;
        b=G0ecPSOoqDDlTShGhxEy5gYc6CQTBiC+PdlEgBvl+hYIj88RDP7FQMHlEv2JflqzhD
         ZBZq0hCtQ6ePuG7W2HaeP0jA1P/sY9Ak3+N/AZiNb73IS4kvrfhsCFiIRug3NDQZC36q
         h+LHWcMNZhGpnj00DqRACjzlKxyelDtdveYVpW0CSIpRgY5/M/bHkCUBV9CaM6OBVCbb
         lilNhXNSsupbxRG1ud2/QqYfH0fgkfCJAi0jYHfLPCebYYxFZ2pBfw6CyVe0nvBPMKdH
         bA3T8W5qB4RIpPHTAcqyK858Alm6obYLIJuafWDP/PpCPnut6feCAvDUXkLH+RHFzfHQ
         kBnQ==
X-Gm-Message-State: AOJu0YyzZu3xnFMjyTInVDwzYeIqGPVmDd19EXaK7wEVb06I2lf3QzRX
	jxYTkRqNp6rg5pOjqck7iMAFcf7QR9mYxdnmsaQ5JeZU3rRYq6a/yfH6ogkb1lg=
X-Google-Smtp-Source: AGHT+IHkmsf1d/sVdsbBt+io4baeOvtVUtTLGXZnsoj0OybcrJuJlEz1Yn473NRRwBxLWh9/VM9odQ==
X-Received: by 2002:a05:6512:3f2a:b0:513:472c:1f50 with SMTP id y42-20020a0565123f2a00b00513472c1f50mr2710732lfa.52.1709571816199;
        Mon, 04 Mar 2024 09:03:36 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id dx12-20020a0565122c0c00b005132441e07fsm1809151lfb.0.2024.03.04.09.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 09:03:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH RFC v3 0/7] soc: qcom: add in-kernel pd-mapper
 implementation
Date: Mon, 04 Mar 2024 19:03:30 +0200
Message-Id: <20240304-qcom-pd-mapper-v3-0-6858fa1ac1c8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOL+5WUC/3WOwWrDMBBEfyXonDWrlew2PRUC+YBcgw9KVolFY
 stZGRNj/O9VDYFeepyBefNmlbwEn9TXZlbix5BC7HIw2426NK67eQicsyIkiwY1PC+xhZ6hdX3
 vBbwmrojYOkaVR734a3itwJM6HvaqzuVV8mZoxLs3y2iiCtFY+1EYtNZUJWjgNgwyFWcnU2ruc
 fx+hM5JLKLcftlNSEOUaXUdaX34T2skQChZk8NPzTvWf1H1siw/vU5EpfkAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2852;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ANAydXu4c0ljbBL0qjh57m/M8kf5qgt9E2bgy1sHqQE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl5f7mEk5M1N4s5bn/I7Jg1kyYuWrvdVeneIEB/
 OilEdb1VomJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZeX+5gAKCRCLPIo+Aiko
 1QVGCACCy46QGFXy6/VcKxF+/duHHXwXPL/sDP2dcwsu+zNndqHGdr7mtFiM7pGkXCEX6r1j2AB
 P3CHM6YlpJvD9GfLogPpYJDw1859yZ8En1TtUcpxuhMSh6tOJsD2vqp5j+91m4UDchvJJjfovnH
 VdbpcO2PvD6dWunAkBBD6jdaj65IFGzB7BkySNq37+owtvRS729Yj9dSnoKQvUl9O6tJuS5tIYB
 52IKdjc1vrBY16OdmGXcg7Glx5zhEO1obX/k2kYUo6PBawtokT/WEjm/++gewf8utKo6St7LFQI
 gUTYzcz0SYH8FImlP3Or/PDJ8gcwcKmBm3KUb5fFn8UiPkQv
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

NOTE: this is an RFC / RFT, the domain mapping data might be inaccurate
(especially for SM6xxx and SC7xxx platforms), which is reflected by
several TODO and FIXME comments in the code.

--
2.39.2

---
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
Dmitry Baryshkov (7):
      soc: qcom: pdr: protect locator_addr with the main mutex
      soc: qcom: qmi: add a way to remove running service
      soc: qcom: add pd-mapper implementation
      remoteproc: qcom: pas: correct data indentation
      remoteproc: qcom: adsp: add configuration for in-kernel pdm
      remoteproc: qcom: mss: add configuration for in-kernel pdm
      remoteproc: qcom: pas: add configuration for in-kernel pdm

 drivers/remoteproc/Kconfig          |   3 +
 drivers/remoteproc/qcom_q6v5_adsp.c |  82 +++++-
 drivers/remoteproc/qcom_q6v5_mss.c  |  80 +++++-
 drivers/remoteproc/qcom_q6v5_pas.c  | 546 ++++++++++++++++++++++++++++++------
 drivers/soc/qcom/Kconfig            |  10 +
 drivers/soc/qcom/Makefile           |   2 +
 drivers/soc/qcom/pdr_interface.c    |   6 +-
 drivers/soc/qcom/qcom_pdm.c         | 346 +++++++++++++++++++++++
 drivers/soc/qcom/qcom_pdm_msg.c     | 188 +++++++++++++
 drivers/soc/qcom/qcom_pdm_msg.h     |  66 +++++
 drivers/soc/qcom/qmi_interface.c    |  67 +++++
 include/linux/soc/qcom/pd_mapper.h  |  39 +++
 include/linux/soc/qcom/qmi.h        |   2 +
 13 files changed, 1348 insertions(+), 89 deletions(-)
---
base-commit: 67908bf6954b7635d33760ff6dfc189fc26ccc89
change-id: 20240301-qcom-pd-mapper-e12d622d4ad0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


