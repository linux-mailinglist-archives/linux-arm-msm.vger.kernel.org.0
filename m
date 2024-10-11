Return-Path: <linux-arm-msm+bounces-34015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5AB999C7A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 08:16:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA9891F22D06
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 06:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC191CCB4E;
	Fri, 11 Oct 2024 06:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ea0IsOX4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EBC328B6
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 06:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728627373; cv=none; b=f9tN/ItaSrfIl7TIsa6VPp5rW7lk2NIKXW9JhbQyHqnMgUthONgWlITkGPXON7XlUN6u63Cwq6Q7DwlgvhJaMtCPR+YrGNftJ9ETKcIHn2j+kfn2ti6bycci+gNV3e6RbZyBuJ6EHZHDp0rDsKnmV5Epui3JYnn3uBxMQ0JX504=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728627373; c=relaxed/simple;
	bh=IleL7FQhMUGmuKRpzA5K47kGlw8Ud8u4RSrGewh4+Do=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NrLwyPz6niBx2/9uaN3d+9X2RhuQj76z21yerhQhO11qn0QSyim4G1sGzv/0uPlScJlGfSSh6UiU58D61kVwmDdReDYs3aoUzCnngiE2GF2xiG1Gb9zni/wSrKJWHxRGvnDWrSD0TZ4fvZU6a00R9z2SZBguhbepZOsMBBtrN0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ea0IsOX4; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539d0929f20so856510e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 23:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728627370; x=1729232170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+zztn8OGm5T9Dev73bEcKrvo8yczZXjOdvebFEeUvOQ=;
        b=ea0IsOX4AUWdQE4X/OfCaCoSA2wCm/kK3nlus47BKPwDblYEWnPnVMKE93S0JB6u8c
         2sGey0Y2kDDWtIfNAza4g6pok0D7+lGavbcbNcywAnDqPOqUuMoBLHGu7D0GIi4nXnU4
         6IeOx2c0Lnt4nTmo77dwsqOJI3GrGOjpAoqKxKJrRWQnfrs25vaEm9w5ZzVJcELuMMRH
         zoQNszKJOZ8whGnXRxy8RUZjyWd4rFjEC9S75yHw+RqZ4AOCOw4doEpAxQd4OA86orTD
         ++uPDf+lVhLPuxUo8TtDwqz9xvHG9Ri+Euz8cNDe09aK+tQpW+zvSi11Ge4A+3aGideL
         x+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728627370; x=1729232170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+zztn8OGm5T9Dev73bEcKrvo8yczZXjOdvebFEeUvOQ=;
        b=JuwvnQAI2X+bfZWdF6n7c/OMXSkkp2oJdmqrPS4tGruYObnnwhJRkfqzkWzUTRXx4b
         zxQMfLxYlMgipFvsojPgur3gojPh77SAad2cVbPqnPB/b236dbmpPAdAGMnfsjxka1dd
         3fCbSBgEsbRGvBd1ef0AYrIhk11NMk5sE22bZsGx+tB1PTlqw3fOiwdwH3MgzYyGdPKu
         Z6UqyKU34IUv8dkxfbAR6FXnR2Q1eZVDrZJtKxTzJ5+2U83lU/A7FiEchhfXCS+XbaSK
         ZGuLaTtIOCDeiXsgYDH1+gfFC0QP2dGp00I7GWOVwfOUqEeAyABoDg6gzOEbzJM5EUqV
         Yb2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVxJEKyBpmPjqq6qOcCwwXRX/aLErV6+PqGyaADxgOe3PBEFVKqjB6L3IqXPPX2CLXSGTJm0MHOMlzN1318@vger.kernel.org
X-Gm-Message-State: AOJu0YyT5ZfFAy5Eqh7RBbcpO7zBmlnr3sWsJdmxFs/qb9Btw7Z5ABId
	tgpg2F9WEKNOKsx9jGSqT4vbQkrwNPRxYoDndR1QNPR4qI5ZfnsRo2mLuL6UEXs=
X-Google-Smtp-Source: AGHT+IGc7gwTinuZHuGbc8LwJ5A7daFk3nc9VI9bk/hUTAkqi5rsZF98BxeF52XkN+XPoNa2N5quuA==
X-Received: by 2002:a05:6512:3a96:b0:536:7ba7:496d with SMTP id 2adb3069b0e04-539d6e555efmr477576e87.11.1728627369655;
        Thu, 10 Oct 2024 23:16:09 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb6c8613sm496309e87.74.2024.10.10.23.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 23:16:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-firmware@kernel.org
Cc: ath11k@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [RFC PULL] ath11k: move WCN6750 firmware to the device-specific subdir
Date: Fri, 11 Oct 2024 09:16:06 +0300
Message-Id: <20241011061606.1612918-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The firmware under ath11k/WCN6750 can not be utilized on other devices using
WCN6750 to provide WiFi (e.g. on the Qualcomm RB3 gen2 board).  This is an
attempt to propose a solution by moving the file into device-specifig subdir.
Other platforms can place firmware files in other subdirs, depending on the
SoC.

Note, while performing the move I also propose squashing the firmware file.
This is the practice recommended by the msm platform maintainers for the DSP
firmware (not to mention that it also saves us from the extra symlinks). If
Kalle, ath11k maintainer, objects, I will keep the firmware in the split form.

For now this is an RFC in order to gather opinion form respective platform and
driver maintainers.

----------------------------------------------------------------

The following changes since commit d55315295cccf8ce5dc288a74d75cf09b8063cfc:

  Merge branch 'superm1/qci-patches' into 'main' (2024-10-10 19:11:13 +0000)

are available in the Git repository at:

  https://gitlab.com/lumag/linux-firmware wcn6750-device-specific

for you to fetch changes up to abe8c109a2b4c422b627335d124473734c8790d8:

  ath11k: move WCN6750 firmware to the device-specific subdir (2024-10-10 22:26:20 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (1):
      ath11k: move WCN6750 firmware to the device-specific subdir

 WHENCE                                             |  12 ++----------
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
 11 files changed, 2 insertions(+), 10 deletions(-)
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

