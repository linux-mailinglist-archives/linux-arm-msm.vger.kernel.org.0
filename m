Return-Path: <linux-arm-msm+bounces-13830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 440038783D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 16:35:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 679E61C21A8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 15:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B21346441;
	Mon, 11 Mar 2024 15:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cEV1ftR1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB4845BEC
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 15:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710171250; cv=none; b=u/r6RVzCd5WKAO5m+VdYs10CGdb6Yfx5XAc3gy5xrxFYkhaADLscPzKZmKoFEyzqY2yeM5NnW1uMBjYHcXg4d0frqT1eeegRpqFm5I+A4elDeGdaxO8atY4brDKx07lw1wHcybiMRfQM0NYcUbOL5QXRtx4u6x1GiFQ1yrQ6vBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710171250; c=relaxed/simple;
	bh=7kqBNtfx6lIwF60EpRwXt+XaKDawOaf8TAqcx1ZW3XU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IiLmoCwy0VnFV+xgx8BgQ6ly2sV6K7oo1rQAPOJ8DK+EtonoCkkAQ5JzPQm/pSDa5Xrt9vR6jtaE/yeN8Anp1IHsvBXXqxP5bYXhncPQ5MunGIRQ1+BqErqLvfaqwiNDwFmBm9CRYoDPeQKCtosASSxYDvP6XXOmw4KtT6NIjQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cEV1ftR1; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d4141c4438so69457351fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 08:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710171245; x=1710776045; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EuvVhSqYQtbd+x2pvlKBbX9KuWQ3HlQnOsqYU3ihujw=;
        b=cEV1ftR1HjULiInQIa8GsOTGQ3KlEppaKuGHcwZaKEoS5DtxBQzRQEJL5xmdi/1CnA
         MuZxYHUvheUTEZkCgojoZ3OzY6lUVdryT9NwSZy2HQRDz6f3zvU1HL5v8P7MehygDjyT
         Z6H/czb2cXv1/hc2beQuiKI7lLRpZH8+j0BJbhzPV7fuTyo3G4ol2yHrAadrNnIh7/rs
         HSwom7YMlo4pSBtSnUxFv2yn9QF7BbW70riDmrHqAP0JStKeRpheFOGh4ZcoWdkpzsno
         wUEWFc0y0/tTxA4vLSM2hiH4W9IPfbhYaO3MEO0FRUE1o0wsARrvhOZURBNFE9zaLDLz
         q3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710171245; x=1710776045;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EuvVhSqYQtbd+x2pvlKBbX9KuWQ3HlQnOsqYU3ihujw=;
        b=Tw4yRCcuNUbPeDHorEXsKkvMf81QtMF9GkCOZ6UTZ05L0nkDTf/HaN1TOrnHkcspOR
         Ev5XzeZx1FySBxNhl+7NCSp3lQqHhDdxBONpU/8KkY1cxuhHRn8Jn9f0JYg8WTKoyfQU
         XyEY0IlpDAM9KO4gy21VlUpBlxBK7IWtOYHoECD8r2MfbMhhP4nKpSX/+VGRKbj6ZesP
         02sBuoPfGfqbEbXVdEUJYeG2jnyH7ex3B1pCaqKTUAlZ/Be3z5Y5bSfrFX/C+k/J/IS+
         fbM/bKSJ2Luc7A2GyDLquDG/388xYuwfpf8KyzQqSto0NfcsoPV1cZbaLxq+I19uBwFT
         oLZQ==
X-Gm-Message-State: AOJu0Ywo6v9a1QNvDTB7F8oNZe43Tvrve5QA7SrScFdEdvbEDxcvmuWo
	AaaTTCVuhHCVoPTKj9HetKqgcgNy4UjKddPmmzy74FN9We5sEa3urgo+dFnAeYg=
X-Google-Smtp-Source: AGHT+IHJpWIhc3w3AYdaaAYbNDPo7Ls4gi18lO7Hq1clNu/2BaRFnUw+gcx17T5pu6qTSiWgURkbVw==
X-Received: by 2002:a2e:9946:0:b0:2d3:17e6:3b3f with SMTP id r6-20020a2e9946000000b002d317e63b3fmr4683480ljj.39.1710171245024;
        Mon, 11 Mar 2024 08:34:05 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q19-20020a2e9153000000b002d449f736ddsm119294ljg.0.2024.03.11.08.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 08:34:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 0/7] soc: qcom: add in-kernel pd-mapper implementation
Date: Mon, 11 Mar 2024 17:34:00 +0200
Message-Id: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGkk72UC/3WOQWrDMBBFrxK07pjRSHbdrHKP0sXUkmPR2nJGR
 tQE3z1yIJBSunzw3+NfVfISfFLHw1WJzyGFOBWwLwfVDTydPQRXWBGSRYMaLl0cYXYw8jx7Aa/
 JNUTOskNVpFl8H37uwfePwr2U+TKI50fGaKIG0Vj7Whm01jQ1aHBjWGStPlnWNHzFfPoOE0uso
 pz37BDSEmW938y0x/99lAkQaqeJsdXuzenn1H4pm2ff/vFN8Zu2bnvW3Omu/eVv23YDBWreUjQ
 BAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3113;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7kqBNtfx6lIwF60EpRwXt+XaKDawOaf8TAqcx1ZW3XU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+p7leyjbkWPLk/Ujzc7+10xVDT4QNCElLllHzOLBC7vm
 qU4+e+JTkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBM5PwP9r/yRzx2u1Xcd7ZX
 5TsbVmh5wFLj+uuLPRun3A6VbXr96PNyt4eWehPTF9R8+//pIOeNbGdTPpaXbF+leNO7Ztpt3vM
 nINnJT5BfMqVw82SZaiN3lbNR4alHj56wc/ft4HVqjO6yjUwSbU2xXfWAy+Jp6kTRd2YyzMs50u
 YpGC54tSLx0MPjwRMe752U3Wz9Lrw65OY6O+8S8dyrua19q48f1Eu/P435YcJWTRe1Lr1ki2vn4
 gOOrtnX5la9JHaKiz2f5uqTquuDFr/7rX3NXSs+4mR4Bm+lJFOf1C2NvzYJ0VI3wk7GnbRXK5dT
 UphUUcji4ik7QeFu5CdRrTUPVzMzbFaYndua5Hfe+Od9AA==
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
 drivers/remoteproc/qcom_q6v5_pas.c  | 502 ++++++++++++++++++++++++++++++------
 drivers/soc/qcom/Kconfig            |  10 +
 drivers/soc/qcom/Makefile           |   2 +
 drivers/soc/qcom/pdr_interface.c    |   6 +-
 drivers/soc/qcom/qcom_pdm.c         | 346 +++++++++++++++++++++++++
 drivers/soc/qcom/qcom_pdm_msg.c     | 188 ++++++++++++++
 drivers/soc/qcom/qcom_pdm_msg.h     |  66 +++++
 drivers/soc/qcom/qmi_interface.c    |  67 +++++
 include/linux/soc/qcom/pd_mapper.h  |  39 +++
 include/linux/soc/qcom/qmi.h        |   2 +
 13 files changed, 1302 insertions(+), 91 deletions(-)
---
base-commit: 1843e16d2df9d98427ef8045589571749d627cf7
change-id: 20240301-qcom-pd-mapper-e12d622d4ad0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


