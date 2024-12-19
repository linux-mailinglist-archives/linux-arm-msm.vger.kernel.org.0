Return-Path: <linux-arm-msm+bounces-42811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 796C39F80B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 17:51:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90EC6188B99F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 16:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B96E517A586;
	Thu, 19 Dec 2024 16:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Evy1K8wR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DD1146D6B;
	Thu, 19 Dec 2024 16:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734627057; cv=none; b=a7O+YI7KvrsHXvBTTRdFztWLVfy6sKilcCj0P29qd3yz0L/nFGDwQhD8cWOgHGlvekj8MUHoT+04zbgAvHnOAr5K12FHxGoCfSmiK1g3DLRjIQjJvIqz52MJtiAwTqayeEeiLwTuqp+IbT4y4GrhdDezgUqA1gG+THK+n6jOEC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734627057; c=relaxed/simple;
	bh=IiSx2c1rWCpopOjw7IUhmvQhktehYl5PNc2RgbhH8LM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VRAR4sqCAoyCvVrrZddPKCDjJ96/sJYFWBJ+qL62uyelJvkCVS8DeRibqVGDeN/f//cu1rvR/pRtU1rJKYSgopW2ux8RmaUzlm97V/G1J7KLW3vcTlu5xLt7QtP435uwuB3gcPSQuzJAf8NCrsqUVZMeK4KhBuDI1TK4b/OsIc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Evy1K8wR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 179EEC4CECE;
	Thu, 19 Dec 2024 16:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734627057;
	bh=IiSx2c1rWCpopOjw7IUhmvQhktehYl5PNc2RgbhH8LM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Evy1K8wRb8TvH3rHotl6L+hZW37cKJ60QMji8x9T772g6QLFxTz9MVnRKccYbOSzp
	 qR3Vj37JDaW2H2D8RRTeb9A18jm9SBDrsI01Ug6EuaWHP44FgWTQkgKdTCGtbWL7f7
	 XFsQ9yDPqXtuEDiIxfBRgIBYs37AwMvNwFfSY9jLyNDWtZE7yrZhaqzTTUma23ZDPG
	 Bl7nrG7OB/67hssxr2wOIe8HV2cZRk+GenuD8xQ3EC+HvL1kgnHMkLq9TJaum9cwOH
	 2yrnTHJhVpbarNeIEWrGamZfYfmTSZtKvubCOuCVpIyJGGLCmiUwwILzALlky7C5EQ
	 p7AYSjG6+BaSg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEECFE77184;
	Thu, 19 Dec 2024 16:50:56 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Subject: [PATCH v3 0/4] scsi: ufs: qcom: Suspend fixes
Date: Thu, 19 Dec 2024 22:20:40 +0530
Message-Id: <20241219-ufs-qcom-suspend-fix-v3-0-63c4b95a70b9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOBOZGcC/4XNQQ6CMBCF4auQrh3DtFDBlfcwLqAdoIm22EqjI
 dzdwkoXxuX/kvlmZoG8ocCO2cw8RROMsynELmNqaGxPYHRqxnNeIEeEqQtwV+4GYQojWQ2deUI
 psaJalVLXgqXT0VOaN/Z8ST2Y8HD+tX2JuK5/wIiQQyWobTUdZIvqdDW28W7vfM9WMfJPRfxQe
 FJQk1Saa4mF/FKWZXkDArZAGP8AAAA=
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>, 
 Nitin Rawat <quic_nitirawa@quicinc.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 stable@vger.kernel.org, Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2310;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=IiSx2c1rWCpopOjw7IUhmvQhktehYl5PNc2RgbhH8LM=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBnZE7pF0xR8u5j1AZQNq0a1iIPAASQkMD+7+21s
 TL6BvlQftOJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZ2RO6QAKCRBVnxHm/pHO
 9Y7xB/wJQUKBYCijZxDVSc4pOmjWd4WRh4wnXcK5J6+Xz6N3i1CNoFuu2JQGfbMx7vUQCgtzsjY
 H8GahM/OrQSw1LWp8tOJQ2idxcqLOYtj76lF/Z6vq97A3rF3O1XoNAS8nfh2aCemWnFx1CofxMy
 YbkPFly62g1yTOe1qboqc7FUjgiXtIAgH79y/RjrpKenhF7aY8ecLbn4kyWn7h+bjTkiGmNGOrW
 EScBBX7B36xE+ifj3bp8FHK8KrL2xkc5KcN6M6fYnrdcmtxwSX0XwMEsqwcCPoqVqqhzqUMKADH
 lfN0Hkcf5d3LO8chNNHB5Zdc5bVUSx+3n+dEeHB2Z1eG/ki4
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reply-To: manivannan.sadhasivam@linaro.org

Hi,

This series fixes the several suspend issues on Qcom platforms. Patch 1 fixes
the resume failure with spm_lvl=5 suspend on most of the Qcom platforms. For
this patch, I couldn't figure out the exact commit that caused the issue. So I
used the commit that introduced reinit support as a placeholder.

Patch 4 fixes the suspend issue on SM8550 and SM8650 platforms where UFS
PHY retention is not supported. Hence the default spm_lvl=3 suspend fails. So
this patch configures spm_lvl=5 as the default suspend level to force UFSHC/
device powerdown during suspend. This supersedes the previous series [1] that
tried to fix the issue in clock drivers.

This series is tested on Qcom SM8550 QRD, SM8650 QRD and Qcom RB5 boards.

[1] https://lore.kernel.org/linux-arm-msm/20241107-ufs-clk-fix-v1-0-6032ff22a052@linaro.org

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
Changes in v3:
- Added a patch that honors the runtime/system PM levels set by host drivers.
  Otherwise patch 4 doesn't have any effect. This was discovered with SM8650
  QRD.
- Collected tags
- Link to v2: https://lore.kernel.org/r/20241213-ufs-qcom-suspend-fix-v2-0-1de6cd2d6146@linaro.org

Changes in v2:
- Changed 'ufs_qcom_drvdata::quirks' type to 'enum ufshcd_quirks'
- Collected tags
- Link to v1: https://lore.kernel.org/r/20241211-ufs-qcom-suspend-fix-v1-0-83ebbde76b1c@linaro.org

---
Manivannan Sadhasivam (4):
      scsi: ufs: qcom: Power off the PHY if it was already powered on in ufs_qcom_power_up_sequence()
      scsi: ufs: core: Honor runtime/system PM levels if set by host controller drivers
      scsi: ufs: qcom: Allow passing platform specific OF data
      scsi: ufs: qcom: Power down the controller/device during system suspend for SM8550/SM8650 SoCs

 drivers/ufs/core/ufshcd-priv.h |  6 ------
 drivers/ufs/core/ufshcd.c      | 10 ++++++----
 drivers/ufs/host/ufs-qcom.c    | 31 +++++++++++++++++++------------
 drivers/ufs/host/ufs-qcom.h    |  5 +++++
 include/ufs/ufshcd.h           |  2 --
 5 files changed, 30 insertions(+), 24 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241211-ufs-qcom-suspend-fix-5618e9c56d93

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>



