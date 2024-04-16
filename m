Return-Path: <linux-arm-msm+bounces-17529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 941E88A60E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 04:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46BB6282AD0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 02:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34C1110A14;
	Tue, 16 Apr 2024 02:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zkUHihq/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70ED7E546
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 02:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713234057; cv=none; b=mBYWen6SMwPMr5IGjLIzGU53rxMdNZGCzWdmkTgCHxzcmi9LmZvQezY7aKW/QrwdDromDEP813jzfXT/BG9zh1fG9L+jIYmPBWv9bYrzTLrEpJ5N7fiT6oon5Ko/PZS6u77uHuRSeiCGH0bisO3MivmFPKpwnn9uUigSRDB05SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713234057; c=relaxed/simple;
	bh=I6m2M+8GekB9Ra+iG3eKclLpfI1M2HDrEBoYGhILldA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=j/zFrIr7tS9sMOlKXBHoR2F6osAbm0KhBOPpCE5Cu3rqKdatyONyHQMEQmo93aoTMli6+KW53p8f7D9M5qsUrmcyS//cVWoQq2+DrKvreos/HMUGx5zYUddXSonTA7wEzdgc7vj/gwdm1rJw8RT8eNsgTgC3IRV3DWgg2cUviwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zkUHihq/; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-516d756eb74so4675296e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 19:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713234054; x=1713838854; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=31Zi/BCGo17+6WL9U+yMAfsapL3UhLlQ6swNbqDLj4U=;
        b=zkUHihq/qhpHfQalp7GecvDPMulMGY8BACVR7lozX8LETEvu0foLdL14HbpkahLFIH
         R9drF4yyoVHQ26r95nuwsp07Za/zc223w6QPy3WMQ2fIjZAHqchPKA5SdBwCpZZOKNBc
         8uQ3U+AgtjUSL6FC32wdxeh2Gm2u4PFroD7ZvQGp6Yu013q9tj7OTZFRe0vCg4i91HGi
         XaVFsFvKLzCWC5o0kV+CFg0e654Of1blIYlrhbg1Fau/jZgj62ZtGTWc17QwbKiTRAgP
         F36l+Lxs+pOGAt5zIZ/nTqPO1NLLY8YB+as5wMK4gCpy/hQatU6ZaxFX4En8suuVqr8e
         EKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713234054; x=1713838854;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=31Zi/BCGo17+6WL9U+yMAfsapL3UhLlQ6swNbqDLj4U=;
        b=BD6yjLBxN+fHKPHcIKSn2MvOHSFyKedVWXRGt5OuWIaEXs0xWaH09zP3zypV15Erut
         6xEEoLjIpUBIhiywOHhcMA3oivevr3GphQB+f1XL7+mUwMFy7SQXrT8p8JCQfNbNZzAs
         kjhDb4kdhx9sJLBMxnYMzYU2cpVeO/uHgOmHcckerzQvDQv6HhouAvHEr/2kYfTNMzSh
         c8bgB/C+uK8XWGRbI+ndUq68aMBvu1WArQypJe7C+xcvh2MXNa2CLO3BtOhrV3MGOmrv
         V+f6QDvGJ1X96ShgjGkgSu/YCPO+ocB5Cn0WPlLNkV4R1ONYdQvuxWripCUJdXezxIlW
         MLpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqNFYZYQP6iqlPUwQM0RJYA3S2nMR5wjGSFBtJJyvEF+3DqwC4d51piJ8JYfMcZwf5tvW8oNsOPiIau9I8DtC/imEGUCPNP2OEZq9OhA==
X-Gm-Message-State: AOJu0YxGUOdQU58B5KvmDAvY4GsZo5SFEb7NuhFXS8kufYyxHNT5kw7G
	QcgVLVvncuyWaIu1C9BaKRNSOtTCGmz3BlmxD1ZjUow8zhCE+CwXadBWM2CRJBQ=
X-Google-Smtp-Source: AGHT+IGg2XVY2pkXFF64W+aZzzMeOONtNpRSHuTRqOBIPJ3cw3XhH807g35lb7b4mCe4u3AVMKJyLg==
X-Received: by 2002:ac2:4430:0:b0:518:bd37:b27d with SMTP id w16-20020ac24430000000b00518bd37b27dmr3765414lfl.67.1713234053565;
        Mon, 15 Apr 2024 19:20:53 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id bi30-20020a0565120e9e00b0051925dd92dbsm27716lfb.214.2024.04.15.19.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 19:20:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/8] usb: typec: ucsi: glink: merge in altmode support
Date: Tue, 16 Apr 2024 05:20:49 +0300
Message-Id: <20240416-ucsi-glink-altmode-v1-0-890db00877ac@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIHgHWYC/x3MTQqAIBBA4avErBswE/q5SrQwHWuoLLQiiO6et
 PwW7z0QKTBFaLMHAl0cefMJRZ6BmbQfCdkmgxRSCSVqPE1kHBf2M+rlWDdLKJvS2MGVshIGUrg
 Hcnz/065/3w/lmAepZAAAAA==
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2221;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=I6m2M+8GekB9Ra+iG3eKclLpfI1M2HDrEBoYGhILldA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmHeCDxYYHr6DhuHF5Rx3H3UF3NZQ+UU0xJXKpG
 Djr2ZkkgkyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZh3ggwAKCRCLPIo+Aiko
 1cFvCACGUL3X5X657gbpGTVoM+fio/lBRG69Mp83UZWFjhSsTHLhtxOJ+1Pqt7GTpOVV9O0zMWX
 tXvrDXLDMuXJeA2bKmjfvqGLy0ye5PJttVLMeZJxrw6ynFo7rGrwfwGHlpunB4MIQk8UztvztrX
 H6TAuPebI9j6kGlYeXGrMcdGImjUi1HGDBExqy7vIAJpz2ntPKRd3zKvhcugQ7Tg1zX42bi8YX9
 JKGws/XC1UW8lznI877kckpaK/XIT71um7Hl5V+wLAsbZH85XEJF8wofi4fXdqXjae+otr3EuM8
 4q5EEIiPvt5qFPX9NbNoN+IHUzfvZYqcTXuhqwnUM5tbCugF
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

PMIC GLINK platforms handle the altmode support via OOB messages rather
than by fully following the UCSI standard. Currently altmode handling is
implemented in a separate driver, which has to duplicate significant
part of the USB-C stack to control USB-C muxes, switches and retimers.
Also this potentially introduces race conditions, since both UCSI and
pmic-glink-altmode will drive those components. Last but not least,
there is no connection betnween the altmode's aux-hpd-bridge and
corresponding typec_port instance.

Merge the pmic-glink-altmode driver into the ucsi-glink, streamling the
altmode support for Qualcomm platforms.

Depends: https://lore.kernel.org/linux-usb/20240411-ucsi-orient-aware-v2-0-d4b1cb22a33f@linaro.org/

Merge strategy: since the series involves both UCSI and soc/qcom
drivers, I'd kindly ask to ack merging the whole patchset through the
USB tree.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (8):
      usb: typec: Handle retimers in typec_set_mode()
      usb: typec: altmode: add low level altmode configuration helper
      usb: typec: ucsi: glink: check message data sizes
      usb: typec: ucsi: glink: use le32 for message data
      usb: typec: ucsi: glink: simplify notification handling
      usb: typec: ucsi: add ucsi_registered() callback
      usb: typec: ucsi: glink: merge pmic_glink_altmode driver
      soc: qcom: pmic-glink: drop separate altmode driver support

 drivers/soc/qcom/Makefile             |   1 -
 drivers/soc/qcom/pmic_glink.c         |  15 +-
 drivers/soc/qcom/pmic_glink_altmode.c | 546 ------------------------------
 drivers/usb/typec/bus.c               |  34 ++
 drivers/usb/typec/class.c             |   9 +-
 drivers/usb/typec/ucsi/ucsi.c         |   3 +
 drivers/usb/typec/ucsi/ucsi.h         |   2 +
 drivers/usb/typec/ucsi/ucsi_glink.c   | 615 +++++++++++++++++++++++++++++++---
 include/linux/usb/typec_altmode.h     |   3 +
 9 files changed, 619 insertions(+), 609 deletions(-)
---
base-commit: 7f3fd687151a552038967f31993f1bc7e447b99e
change-id: 20240408-ucsi-glink-altmode-293cdbf3270c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


