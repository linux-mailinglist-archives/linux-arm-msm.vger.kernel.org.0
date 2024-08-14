Return-Path: <linux-arm-msm+bounces-28533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B99259520D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 19:15:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54CFCB2475F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 17:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899351BB6B6;
	Wed, 14 Aug 2024 17:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HZjypFem"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2991B3F25;
	Wed, 14 Aug 2024 17:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723655738; cv=none; b=H6X5t3oFSMLhoSHI9yUr9cRyIVL9YTBHYnM+mY7chqkF/cab3nTfh8hbgayiQ8sVL0KJhVEBwQMmKyc/v/LZn6/By0SB1FdBZFko5uiX79L7zcbKsq4ilRWkICl2ryt5vWGpjOJUSZDbd6s4DfTm84+cm+q7qN7ecIyvFBU3Pnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723655738; c=relaxed/simple;
	bh=sXb5Xiro8MMMUjfccTn033XzuQ3HAuq5W9g4P6QXTk8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NYaekdvTx6exbDhvtDnbmJA0spWNLNVe478OgfrKd51Dz1To4THzWV9sjrnag+5X2nQAXsDlQs28AYhJn9WkgdIZvt2gS+zTNGdVZnJBmMCgoe16RHnLbzcn+FSGUe1BNPZxuhWwtTLlvXJ/DnYzhErPguq4HBtk50aHnh4tYrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HZjypFem; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF52DC116B1;
	Wed, 14 Aug 2024 17:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723655737;
	bh=sXb5Xiro8MMMUjfccTn033XzuQ3HAuq5W9g4P6QXTk8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=HZjypFemT5Z5YmJZjyhzlu50fcggdiSH2vtETae0qYhf463slYMEbaXkj45sxHQwm
	 UTXOf2Iak+TNUDc6hqC7JsluJ0XGhdsusPqaxIQ+Hm4JTNDTVc3/twwJw0hl7LK292
	 VEZKXUijhpjfQ1eFeac9llMc//tWIKKs4yXWgOSNAsi/+CwRFHPYXmSCchJ/i4k71e
	 7/I5AOtHXiSIkciRqRZFf7pwlrKdIBxxSMi9MBdRtWHxuXjKqSvxqIcTXaxb4QE0pA
	 +wjjAX/kllSuNS8nIukdFHLZGIwjXeS0Qa1LjNeBNUneI/D0G4n+jVVjl4KJ7rcN4h
	 YxhRrYb4ftzRg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7346C3DA4A;
	Wed, 14 Aug 2024 17:15:37 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Subject: [PATCH 0/3] ufs: qcom: Fix probe failure on SM8550 SoC due to
 broken SDBS field
Date: Wed, 14 Aug 2024 22:45:33 +0530
Message-Id: <20240814-ufs-bug-fix-v1-0-5eb49d5f7571@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADXmvGYC/x2MQQqAIBAAvyJ7bkFFSvpKdMhabS8WihGIf086z
 sBMhUyJKcMsKiR6OPMVO6hBwH5uMRDy0Rm01EZaZbD4jK4E9PyiMXryTipnRwm9uBN1/d+WtbU
 P2w4f2l0AAAA=
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Kyoungrul Kim <k831.kim@samsung.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=956;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=sXb5Xiro8MMMUjfccTn033XzuQ3HAuq5W9g4P6QXTk8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmvOY3Y4kE4h7MJI+1mE7wM5BWinEHEnY30bAO1
 JR4NLH8tHuJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZrzmNwAKCRBVnxHm/pHO
 9VfjB/kBuingfo75GYcDWtJsbTxQ8j/onH8QYvbibmGzRHAml3/DzbaPypmohIdpNgaHW73xZXt
 ZQmAqMKbEB5zFYVNKV+u34ZfOUMhQYk8EdZ2PiUyZ3zl6pDjWfnaiV8mGP8BIwzA4p+6dVVl2af
 Vg35XadJNM5UE4RhmL5mktH8zH8OZUiE554CUeNUFyzQaqsobt57t4Lixj3qPYhTHKalt3YhRpN
 LLppR5EwxVNNKaCJKq/Y+aCyTlXMnBp0MPXD0UcxCm/kDnjCMuP/b6uQ72CWxTWkLzPXZPFPK6o
 vnN8PCVsZozTjeWA6ynB+gj3JfqACyYow4yp31RStcBiWH1N
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reply-To: manivannan.sadhasivam@linaro.org

Hi,

This series fixes the probe failure on the Qcom SM8550 SoC due to the broken
SDBS field in the host controller capabilities register.

Please consider this series for v6.11 as it fixes a regression.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
Manivannan Sadhasivam (3):
      ufs: core: Rename LSDB to SDBS to reflect the UFSHCI 4.0 spec
      ufs: core: Add a quirk for handling broken SDBS field in controller capabilities register
      ufs: qcom: Add UFSHCD_QUIRK_BROKEN_SDBS_CAP for SM8550 SoC

 drivers/ufs/core/ufshcd.c   | 9 +++++----
 drivers/ufs/host/ufs-qcom.c | 6 +++++-
 include/ufs/ufshcd.h        | 9 ++++++++-
 include/ufs/ufshci.h        | 2 +-
 4 files changed, 19 insertions(+), 7 deletions(-)
---
base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
change-id: 20240814-ufs-bug-fix-4427fb01b860

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>



