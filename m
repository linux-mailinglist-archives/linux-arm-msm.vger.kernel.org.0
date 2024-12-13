Return-Path: <linux-arm-msm+bounces-42034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0849F0E13
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 14:56:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0821167E1B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 13:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B4781E0DB5;
	Fri, 13 Dec 2024 13:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AFlXtQFS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82591E049E;
	Fri, 13 Dec 2024 13:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734098017; cv=none; b=c0HjVsmkTHYQ2sbkC41fdnlhEnqN6S5kNcuxSsyiFD5SAgl+PSSJjwPvcFHd0yVNElJ0RcyXVRuvFfVUrcXEHPc8VmvFlF69jM4gDEE8z/7HJvXi4RBESOq7Rw/9NZBjTAeivy1lQAzoXLdA1VQQzBjXz4sjT/GKO2t6StbhzSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734098017; c=relaxed/simple;
	bh=fIuJ9Ysk9gL+ewa+bZt/zoZBjAsb6V7Ms7TdivTupdo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NgC217vtyTnHck9t/fcWB+Sh5muhaDQ6KW4yllV4eyInklkPOmgIeah11np/9ftr8D5MakCq8QkmYtQ/roTjig6QMJbCAZkTRlP5LMexuFnAe/NM6Z0qVKHyHVrMobT+youyPXPE7hayUyvwU9NshS94HVm+DMNOUPidY44FuLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AFlXtQFS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67264C4CED0;
	Fri, 13 Dec 2024 13:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734098016;
	bh=fIuJ9Ysk9gL+ewa+bZt/zoZBjAsb6V7Ms7TdivTupdo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=AFlXtQFSpaUAKVfh0o1xkhyDkn6F9lsIJQNY+WJUVsYDo5V1zgp1HApaaRysltKrH
	 /ZZKD1Sx8yNk8MRov/oiFlGkCzFBtxDukZh2Q1DjeFUZR31l/k4MjLlMN+HMnAw5QA
	 aRsPzpfVGwC/Wn1F7dMyC3BgRdPexm5U4QCVzD2V43HPBDWW0E7aX/ERKfEpw2Ed3q
	 iGJByceDJG/b2Qo2lIAqaSkgOn0RXtJxch3pk2DvpWmvYUey/OKAPNYpy8gNNTidd1
	 Q2Qa67PGMrY15Gw9wxlxP0LYNgfZySuZc/3rCBJAJaA8bf5X1UmzvAWa2zgHmXvBzO
	 FWrzhBvM+UhbA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DFE0E7717D;
	Fri, 13 Dec 2024 13:53:36 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Subject: [PATCH v2 0/3] scsi: ufs: qcom: Suspend fixes
Date: Fri, 13 Dec 2024 19:23:28 +0530
Message-Id: <20241213-ufs-qcom-suspend-fix-v2-0-1de6cd2d6146@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFg8XGcC/4WNQQ6CMBBFr0K6dgxTBMGV9zAsaDvAJNpiR4iGc
 HcrF3D5XvLfX5VQZBJ1yVYVaWHh4BPoQ6bs2PmBgF1ipXN9Qo0Icy/wtOEBMstE3kHPbygrrKm
 xZeWaQqXpFCnpPXtrE48srxA/+8uCP/snuCDkUBdkjKNzZdBe7+y7GI4hDqrdtu0LZeQanrkAA
 AA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1899;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=fIuJ9Ysk9gL+ewa+bZt/zoZBjAsb6V7Ms7TdivTupdo=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBnXDxb3KcXOghNgIpuuCcdfyVgKGCwAcCekf5fQ
 LpHRst7b0+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZ1w8WwAKCRBVnxHm/pHO
 9XY3B/wLzUP0NCGuuYLBOLe0RaLeeWkLOene69s5naQb3jmGe58IDnTYvyusrK3iC9RyYFpamGq
 M1PPlvCjuWcFa51KtKvdjISqMc37XqBZfe7qzsyJCtz1srHqbgOx0jkvQYuKFU1NLEWTx2jE3J0
 XjBA6biHVHcRjbHFs5XzuoIOih19uMmv0ADGM2pVtADUVPNhtH4WaAx/25EGpQW5ppuOmLBSaSw
 9VNNN8EPEH3ePwu+vODoYmbFjeabB7R03o1knI4nHBgjvB5qyxWznWAvd8WNi3IMZlpJhwk1GSb
 5i+8p0FNF2dp2mM+SNHREjKelzyJWLTvQy1tTtvIrOzlcGqx
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

Patch 3 fixes the suspend issue on SM8550 and SM8650 platforms where UFS
PHY retention is not supported. Hence the default spm_lvl=3 suspend fails. So
this patch configures spm_lvl=5 as the default suspend level to force UFSHC/
device powerdown during suspend. This supersedes the previous series [1] that
tried to fix the issue in clock drivers.

This series is tested on Qcom SM8550 MTP and Qcom RB5 boards.

[1] https://lore.kernel.org/linux-arm-msm/20241107-ufs-clk-fix-v1-0-6032ff22a052@linaro.org

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
Changes in v2:
- Changed 'ufs_qcom_drvdata::quirks' type to 'enum ufshcd_quirks'
- Collected tags
- Link to v1: https://lore.kernel.org/r/20241211-ufs-qcom-suspend-fix-v1-0-83ebbde76b1c@linaro.org

---
Manivannan Sadhasivam (3):
      scsi: ufs: qcom: Power off the PHY if it was already powered on in ufs_qcom_power_up_sequence()
      scsi: ufs: qcom: Allow passing platform specific OF data
      scsi: ufs: qcom: Power down the controller/device during system suspend for SM8550/SM8650 SoCs

 drivers/ufs/core/ufshcd-priv.h |  6 ------
 drivers/ufs/core/ufshcd.c      |  1 -
 drivers/ufs/host/ufs-qcom.c    | 31 +++++++++++++++++++------------
 drivers/ufs/host/ufs-qcom.h    |  5 +++++
 include/ufs/ufshcd.h           |  2 --
 5 files changed, 24 insertions(+), 21 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241211-ufs-qcom-suspend-fix-5618e9c56d93

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>



