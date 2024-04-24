Return-Path: <linux-arm-msm+bounces-18410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0A08B05F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 11:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C4721C209DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 09:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C888F158D99;
	Wed, 24 Apr 2024 09:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E+iB7vqB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55571EF1A
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 09:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713950882; cv=none; b=MeoEVmQfj18h3nJSvJXn8mp5A2Lv2BqH0uG4n002otKIHrv/cwIiFZ+/nOXU2s74Q9xOOez2y87FZ4x5p4I7pzUHJu5y91pK0K2E2Y7CsYzTz2TLZ/6VFNnTxo80tECuZ7mBSz7WPM1rkL3Whgf7p3F7QBYif4hnsjSX71A2o8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713950882; c=relaxed/simple;
	bh=mLwS05dNwcW/ElrmPpDn8CNcIuAd5i6BGGcFDqJ+fnM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VqEdgVZLBvT1IlkjISIaWfzj3ZjkRLglQK4AB4sMxW9d+4oyYPjJ5DD+ZdfmvLYbdOYoT2OsR3LyL5U5TS3Er3u7vrhbS7RFkPr5BTCdFt6QCBOINWR+0810aMaws+BFYpEkqjHMaARALyctw8i3R73fMHj7YRvG0oozq7TqSio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E+iB7vqB; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2dcbcfe11f8so52805731fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 02:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713950879; x=1714555679; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ip0VHmZdh+xcFW/ASY2jXq9x8Dcr/PFVJGAwmDLam5Y=;
        b=E+iB7vqB2o6tqAOLR4toujgMsNH9OPOBmREXDBQFRE6Ib/q+GJj521fGL49G30WuB8
         FCCxEXUcprP5z/fxQsiAW9/v6unmO22dhqxAeJ7mkSyZsz/iwytMFV0EcFF7GVSxKUle
         7hCyPwNt/3I9wV3CfUD1H1DSoPck07kKHQxOkiTFbBNvx7V0TS5RjEJlvoetAfQbI+SC
         E3Lj9EJ6ew1ePfKoKgYJsI3jvugHfohiLxPMlIW8hnsgjO4yPm8YzZZrgHE1XjxeoKK9
         LgGYlhdyEixcTXkalUwX/jY8Se72tLurIBSVdODQZ/Nr/hqcF23lXytD4eNTgXIhYhvA
         3uuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713950879; x=1714555679;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ip0VHmZdh+xcFW/ASY2jXq9x8Dcr/PFVJGAwmDLam5Y=;
        b=hoBzvM43bislpR33NBUum7mrCfgp+uzaK29lUfP7X9efeMPet3ReG/mz+QiIRD/CPV
         E5H90V1l/pXB0DqVGp/ZaUOHAQ+GZq9aC34VXEttnOqGEHIbcX8dB3YZzYZ0CKnlYyEk
         aBVfioXmHX67bi0x9uPLOIbyfojEMLUrb9PMWrFhC8yNWycpbL83GmC+A9R70n34lSsY
         tac4rAmGUg7feZfGKZNg6jcWI5WfNXJobtj0dGlYPl/zgwwiJ6yUkijXzDFtzShndjRE
         mWEF9J4UEUUSbeoiB6s6m/7acOh5+gwP+e6RYabcd1yQb+8vA+xGxLeUcG0xA8+ZIVGp
         kZvQ==
X-Gm-Message-State: AOJu0Yx96NxiZVtiKTTQrAauBpKOsJuiPral/A/GRe20Fnj+CtTtTff/
	KmcYz3OY3R5WHfNb0WaSvQaX+s5VMYlrYUj2tTovhRlSRPQl0scJMAaaFWWHsCk=
X-Google-Smtp-Source: AGHT+IEzWyNmfcL0ESrs6hcUXc/a2rBo+HjGU7WuwduiB4fypJi3l19ZEzscf4gH2/z5Zjte1DqgAg==
X-Received: by 2002:a2e:7c05:0:b0:2da:9f24:44a8 with SMTP id x5-20020a2e7c05000000b002da9f2444a8mr1108908ljc.11.1713950879041;
        Wed, 24 Apr 2024 02:27:59 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a2e8442000000b002d8744903ebsm1916849ljh.68.2024.04.24.02.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 02:27:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v7 0/6] soc: qcom: add in-kernel pd-mapper implementation
Date: Wed, 24 Apr 2024 12:27:56 +0300
Message-Id: <20240424-qcom-pd-mapper-v7-0-05f7fc646e0f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJzQKGYC/3XOwWrEIBQF0F8ZXNegz6fGrvofpQtHzUTaxNSE0
 DDk32sGSlOkywvv3HfvZA45hpk8X+4khzXOMY0l6KcLcb0db4FGXzIBBsgE4/TTpYFOng52mkK
 mgYNXAB6tZ6SgKYcufj0KX99K7nI5X/oc7E+N4ACKMYGoG8EQhZKUUz/EJW/N1eZt7t/T+vIRR
 5tTk/LtqO3jvKS8PWaucJT/u2gFyqj0HCxruTeen6uOSas4e6y8KF61su0st467tvJ48rz+j8U
 DKm2cs9IBVl7+euSm8rL4IORVdS3qYEzl1ckDVF4V3xllpPaMA9N//L7v38GhWr/0AQAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Xilin Wu <wuxilin123@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4410;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mLwS05dNwcW/ElrmPpDn8CNcIuAd5i6BGGcFDqJ+fnM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmKNCd4zI4LD5jNj6H7BH7tL3H4kKac/FOaJvUa
 Z7C1UxjUSuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZijQnQAKCRCLPIo+Aiko
 1VPoB/96xkqauFGwjlOqxMwLHWwObbGIWDA3irTxtrvrug0yU/G4+jCQJixlvQ6qP24N1aWb9m9
 u40zS7PJ1gD9yu6zw0P2NhV4NA5pr41JNEUf8TYh1heceaZRtEeWhGg7dL7uZDYVVeD9Thuq7gW
 rEsmsCk3aSPaWQCWa3RayP4oXeZgtokQeQOIBOHcZoBRY3Q8zHBChXfFeZ6nefC1qdKPI2pd8UO
 /OF0urm/z6YWoLHNtuiYSUNVAYcoaDexjY8kZy3jajKYQ7a2L2Ea28Yzoo9yKMglivwbAVKvaMm
 7RlXXE65D4FkNnuPvrSHELE/bFfH1BGRS4k4eBMerP09xUv8
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

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-remoteproc@vger.kernel.org
Cc: Johan Hovold <johan+linaro@kernel.org>
Cc: Xilin Wu <wuxilin123@gmail.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
--

Changes in v7:
- Fixed modular build (Steev)
- Link to v6: https://lore.kernel.org/r/20240422-qcom-pd-mapper-v6-0-f96957d01207@linaro.org

Changes in v6:
- Reworked mutex to fix lockdep issue on deregistration
- Fixed dependencies between PD-mapper and remoteproc to fix modular
  builds (Krzysztof)
- Added EXPORT_SYMBOL_GPL to fix modular builds (Krzysztof)
- Fixed kerneldocs (Krzysztof)
- Removed extra pr_debug messages (Krzysztof)
- Fixed wcss build (Krzysztof)
- Added platforms which do not require protection domain mapping to
  silence the notice on those platforms
- Link to v5: https://lore.kernel.org/r/20240419-qcom-pd-mapper-v5-0-e35b6f847e99@linaro.org

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

 drivers/remoteproc/Kconfig          |   4 +
 drivers/remoteproc/qcom_q6v5_adsp.c |  11 +-
 drivers/remoteproc/qcom_q6v5_mss.c  |  10 +-
 drivers/remoteproc/qcom_q6v5_pas.c  |  12 +-
 drivers/remoteproc/qcom_q6v5_wcss.c |  12 +-
 drivers/soc/qcom/Kconfig            |  14 +
 drivers/soc/qcom/Makefile           |   2 +
 drivers/soc/qcom/pdr_interface.c    |   6 +-
 drivers/soc/qcom/pdr_internal.h     | 318 ++---------------
 drivers/soc/qcom/qcom_pd_mapper.c   | 656 ++++++++++++++++++++++++++++++++++++
 drivers/soc/qcom/qcom_pdr_msg.c     | 353 +++++++++++++++++++
 drivers/soc/qcom/qmi_interface.c    |  67 ++++
 include/linux/soc/qcom/pd_mapper.h  |  28 ++
 include/linux/soc/qcom/qmi.h        |   2 +
 14 files changed, 1193 insertions(+), 302 deletions(-)
---
base-commit: a59668a9397e7245b26e9be85d23f242ff757ae8
change-id: 20240301-qcom-pd-mapper-e12d622d4ad0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


