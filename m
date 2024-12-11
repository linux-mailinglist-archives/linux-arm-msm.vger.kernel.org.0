Return-Path: <linux-arm-msm+bounces-41537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A99D9ED3C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 18:40:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6376616521E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 17:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 382D91FF1C5;
	Wed, 11 Dec 2024 17:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="URM0g8vs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FB21DE4C1;
	Wed, 11 Dec 2024 17:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733938828; cv=none; b=Y7NBuFlSfOjUpPpzYR4uEGkn+juUWHVqr/uZp+WH9e0/god1gorAc2jlemUimyv70x+9g8c44LEGdZUfNByECCzPhmyA7dqi+OdWYNlCSxHheU8pMJ+IiWi+Iu+axdnFxT5GMSSREyyOr2wSVQUzgRQAXyWlqEvB9wt27k+J3c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733938828; c=relaxed/simple;
	bh=nTPLx+F/uIjNlE3QmhI8zO7IqE2vvW6UobaEj+4tukI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fWDI+lQiL5dXMQxTc2rPuL5FcTt94mYgZ0k0x7d5c5Gpo839Z6eqTHMHWiOpGKzxDQZEPGLw6JLtZ/RtpY6/Qv3vaKX+HcZznXCYEMr5/Z/BnT9o27uR0AS4wgLefrEgyoeJBgxl96tHtO9DzxN8F9cbEbExkxELn/m423Jw2Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=URM0g8vs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6CCB2C4CED2;
	Wed, 11 Dec 2024 17:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733938827;
	bh=nTPLx+F/uIjNlE3QmhI8zO7IqE2vvW6UobaEj+4tukI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=URM0g8vs8XZcfUCbzk3fN6McQpepdX/K0nOU7YXdqpV4dv085eQMHdOEzZNkKaALk
	 pO5Yc6oK7hLDwrg+TrpBykxRh3UfUr6LBakvTB/o1Cbk61zWy43Vl/qnnGYBFJmkFs
	 ofjk79z06wd13/s6YbnEFxHXllGki/x2SNm4wvGGjCfqek6DZHfuBvH74uzYlFY4qH
	 ke45jtFiWeaWHb86WyXoFsRrnMVFT1eDi3qeqziATdrLcbkooEHupbkr4pXyrAwMFh
	 OfVJlzorcj9aISaYw21DebARucewOr/irFMc9dgMJoJ+LXSiug6CyybJULYQ5lGAqT
	 SbnrMQ6IJmZAg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D6BE7717D;
	Wed, 11 Dec 2024 17:40:27 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Subject: [PATCH 0/3] scsi: ufs: qcom: Suspend fixes
Date: Wed, 11 Dec 2024 23:10:15 +0530
Message-Id: <20241211-ufs-qcom-suspend-fix-v1-0-83ebbde76b1c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH/OWWcC/x2MSQqAMAwAvyI5GzB1Qf2KeJA2ag5WbagI4t8tH
 mdg5gHlIKzQZw8EvkRl9wkoz8Cuk18YxSUGU5iKDBHGWfG0+4Ya9WDvcJYb64Za7mzduK6ElB6
 Bk/63w/i+H+hB7tlmAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1691;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=nTPLx+F/uIjNlE3QmhI8zO7IqE2vvW6UobaEj+4tukI=;
 b=owGbwMvMwMUYOl/w2b+J574ynlZLYkiPPNf60/Tk6StscSpJE6I7pL7Fr73e7JXqOsstcGmq4
 Jo3b5gudjIaszAwcjHIiimypC911mr0OH1jSYT6dJhBrEwgUxi4OAVgImXf2H8xc0WrWzOuPzix
 Nl7GWiLB/0w8h/zzxC+fY/6ZZfx+4bqKaaX+bWEJHuPMRCejr9ssWLbpN07sK243+rQksmnH/co
 lTDWVUmnt674L2bVFKjw4cfQBowF//PS3m33KK7aZHTTXXrjj5GvjnEWmzjYcp6fbbsi8sv5P/y
 Ld3NsTWMXW/ynbd5nl5lT5Z6FKfKriHt+dU56xHbgcn7ZT6PPN9KDCBe39V6Q7Fp9NyjU93VD6g
 4NTcGW7gFZ/mZqs8ERDNV2pL47Ln4gZ9PDZNrH9U32kYC8Tc1NEgWH6qafnDFZdLb2dpZn1bmvU
 DO5YH4kirTO3TmxW+PnRPMI1MnhZimfYDiePOy5N9uJZAA==
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



