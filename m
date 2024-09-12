Return-Path: <linux-arm-msm+bounces-31591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D761976578
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 11:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FF481C23265
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 09:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD535192B68;
	Thu, 12 Sep 2024 09:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="srPxKL99"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27951990D2
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 09:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726133102; cv=none; b=rq/hCC5G36xtZDqvlk7UzG5NjaUL1ZuFhJe799sk6COaim2z3jucpNbNn13P+ndXV22XdOnn33GKjM+JAnKDZ4Oj0OiZYvwKNDfeswLbk+pmFMbVrgZLRBCIwNqoTici7LPo/Zawkn7RPF6t0EqZns0AJWEh4z7lV3RpiKuPjDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726133102; c=relaxed/simple;
	bh=NAzMHzuJWM8nH3OXunx4yush9WV1uVfllcYFBLZn6gQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DH3xpaktx3Y7ZvjUYj8eLV4P4/7NuYGDyzwQa2NFbo83SgeJufmVbCC+LNOGPGdIDMv/sXvsyIIqhjk0iNFQ1ZvixYhT48NOfTiYGsGI8XdN4Dbw3hwHoU+pXMfjNQ5hygNDgh+P5fnRqkuphVLJWQssuTYDKswCJ3FpVqVwESc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=srPxKL99; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53658f30749so866497e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 02:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726133099; x=1726737899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GpopKbBFXAHhWa9QLLG1ddO0QWw2hR2VGF0Wh9AlkY4=;
        b=srPxKL99NJpdvs+IG9Ze5NonWfUPXT0NtaLN1X2sHusnKGmc2UviYSFi58BBrrrhHE
         sG36jk/XWGRPe2za1e6XYfwqSCiyckSkmuJL4h7Tfx39l7z4aLS7+IEO6mWvUsRf9oiG
         CCgRZhPN8iIzCZPk66aIFpBiWdrxNUcJvtkyko4E26cQyyhCNNKVrc8q1vGo/p58/754
         It2m7bE6KDW0cN8RdGuc4lFo6OG3EYcBYgH2xmHkl9GS5uVImWpL2ARThYDsNFWTGleg
         3ybSqCTFRUZRMVhw4U8nyhjqJ/m5CuQfW8BDvkmAtYBkFsLF0YKOD/Xe7Lj24s514wDr
         +DDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726133099; x=1726737899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GpopKbBFXAHhWa9QLLG1ddO0QWw2hR2VGF0Wh9AlkY4=;
        b=d1to8QxgK3ZYtCCawQOJorvaK5JdkJEFUnRXl9ubNh6MtNSRQ9qUFk+r3XWFhG4+Um
         qSbv45wScw9QfqlBTEkrfm75Rrn7FmUEiX0nyAfbX//vMyqMuwIkWiIy/e/jVVirfChl
         DV4SbkalCSP0GL9JyAVcboIdaXXagJ1POKL83ZWE/Nf88LcoFFHzCaoMxLBIFlpECXIQ
         tXviVbyBw/RDXlhVfGRKoznQLCw0KU8AWt96g0yNGUrUoHXHH/etV7smjd7MhuQS2Hut
         jxnfUwNgdRvT/agw7M2GCsha3y5pfKFZfEsB6aYv/r1RtUiDjoLCh5uBLab95bUhAi/W
         t3nA==
X-Forwarded-Encrypted: i=1; AJvYcCUZn78f1EO9RD9JXkuqqHB5l1Ia55vHUtWDNxJeBcndeX8AaST/s5Rh6g4u4iUS2irS3agagomSWYtp8QWw@vger.kernel.org
X-Gm-Message-State: AOJu0YzXrPsPw7JOLuLDQnVRTg7Mmj5cSYoK0v962AGyBQhE6JDaVoC0
	bl05v67cOtUSZzYeId0zNYmfi4bCBwhiG2X7jAanWf7wZYv3gJgF9W4CsxOtpdw=
X-Google-Smtp-Source: AGHT+IG82jMyQ7wL5C8tk96NqAby3fRz9Y6tWyh4WnCQ6s7pnhi/1ZVHnnYOHdN50DZ+iFs8EdxxAQ==
X-Received: by 2002:a05:6512:a87:b0:52c:d626:77aa with SMTP id 2adb3069b0e04-53678ff4d11mr1182482e87.58.1726133097994;
        Thu, 12 Sep 2024 02:24:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f903bfasm1866919e87.206.2024.09.12.02.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 02:24:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [RFC] Qualcomm RB3 Gen2 WiFi firmware pull
Date: Thu, 12 Sep 2024 12:24:57 +0300
Message-Id: <20240912092457.1887906-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

I'm planning to send the following pull request to linux-firmware, adding WiFi
DSP firmware for the RB3 Gen2 board. However before doing that I wanted to
check if it's fine with all affected maintainers.

Qualcomm RB3 Gen2 board resets if it's used with the existing WCN6750 firmware,
most likely because of the differences in the TZ setup. This pull request adds
firmware specific to the qcm6490 / qcs6490 SoC family.


@Kalle, I understand that you cannot and won't fully support this firmware set.
As a preparation to adding these files I moved existing files to the sc7280/
subdir and pil-squashed them.  It is a generic preference to use a single MBN
file instead of MDT + Bnn files. The mdt_loader detects the format without
using the extension, handles the differences internally and doesn't require any
changes to the driver or to the DT.  Could you please ack such a change?


@Bjorn, @Konrad in the past we have pushed all WPSS / WiFi firmware to ath10k
and ath11k even if gets executed on the host.  I should have caught this while
reviewing DT changes.  This branch uses firmware name that isn't compatible
with the existing DT files.  Would you insist on adding compatibility symlink
or we'd better fix the DT files?

---

The following changes since commit 4a0367b33aeaa7fe1255a920d0e39f825b6985c1:

  Merge branch 'rtl8852b' into 'main' (2024-09-11 11:00:41 +0000)

are available in the Git repository at:

  https://gitlab.com/lumag/linux-firmware rb3gen2-wpss

for you to fetch changes up to fb8c67987c89b6f33fb787dfc6ff6e5e0f317f6d:

  ath11k: add device-specific firmware for QCM6490 boards (2024-09-12 11:58:57 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (2):
      ath11k: move WCN6750 firmware to the device-specific subdir
      ath11k: add device-specific firmware for QCM6490 boards

 WHENCE                                             |  18 ++++++++----------
 ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn              | Bin 0 -> 7734064 bytes
 ath11k/WCN6750/hw1.0/{wpss.b04 => sc7280/wpss.mbn} | Bin 5819999 -> 7463728 bytes
 ath11k/WCN6750/hw1.0/wpss.b00                      | Bin 340 -> 0 bytes
 ath11k/WCN6750/hw1.0/wpss.b01                      | Bin 6848 -> 0 bytes
 ath11k/WCN6750/hw1.0/wpss.b02                      | Bin 10300 -> 0 bytes
 ath11k/WCN6750/hw1.0/wpss.b03                      | Bin 4096 -> 0 bytes
 ath11k/WCN6750/hw1.0/wpss.b05                      | Bin 164332 -> 0 bytes
 ath11k/WCN6750/hw1.0/wpss.b06                      | Bin 266684 -> 0 bytes
 ath11k/WCN6750/hw1.0/wpss.b07                      | Bin 1176368 -> 0 bytes
 ath11k/WCN6750/hw1.0/wpss.b08                      |   0
 ath11k/WCN6750/hw1.0/wpss.mdt                      | Bin 7188 -> 0 bytes
 12 files changed, 8 insertions(+), 10 deletions(-)
 create mode 100644 ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn
 rename ath11k/WCN6750/hw1.0/{wpss.b04 => sc7280/wpss.mbn} (77%)
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b00
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b01
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b02
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b03
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b05
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b06
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b07
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b08
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.mdt

