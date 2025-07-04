Return-Path: <linux-arm-msm+bounces-63768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46268AF99C3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 19:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BE181CC093E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 17:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6CA02DEA8E;
	Fri,  4 Jul 2025 17:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ft2VgfiE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF602DEA8A;
	Fri,  4 Jul 2025 17:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751650577; cv=none; b=eGmd1Qhqr+Yh4VX+ZLEKZww8R8XtLdyx/9wG3XZxH5Kp69CTJd2plyE3nuZfTYsedTMBu/iSfUDDMVvmeYJ9QiimFp8lXVALJePMO+BDrje4hlUZYKOhKfRg/fcN4fqml4R5tc24N324OEB8h95yLeNg4Eh5inusnhNgpR+Fz9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751650577; c=relaxed/simple;
	bh=YEBPecvN+/+CzyYo7nYN0cP1XFT4QG7XKpKI4CPaGq0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TgMAtgfI8Lb66HHdYE4dF6TFChgWh8IfEQeu8k9J4VZfNfkc04bL1XjTACy8rvSxkXUHkfXj84Ljwa7/UXYfS34rClPob/Mgmzx5zKJXh5FiBW6xB1DSPjVdKNEShPgh/HuMe+XzeB63sF3TaDE1tR6kfIiDnw9HEiRlkPWIO8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ft2VgfiE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE4D6C4CEEE;
	Fri,  4 Jul 2025 17:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751650577;
	bh=YEBPecvN+/+CzyYo7nYN0cP1XFT4QG7XKpKI4CPaGq0=;
	h=From:Subject:Date:To:Cc:From;
	b=ft2VgfiEegPPZ9c2w2mnNeJIDEKZSYBczaC2FpJ5NNvFxCoMEXfA0P9bKWRHAlGHH
	 zCDqqAErJfoMG8hizrKuSRNbn3VqHIK0sxp+IxRcvH1AAglDujUTXsqo+I/eaZ5DUV
	 msMRiyPaFwt8rkzB/0dMCXcOJq8avdhvBAMuefuB5vzMrlLgVSTpn2YNGDy2b9jS5w
	 T/hRlgzidro77h7h74aCxkwujDh8cgOwI/5fcUHf1P9dbnjQpVZ2ZJRQesySsnqq5E
	 DFvWsTVwtDuZ/RE7sGoquCcCWc1bH0C4KNq7Y6DuCw4UNdFGH/1Qe9wYsmIJQ9sxvk
	 472DBKnQbUCkw==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [RFC/RFT PATCH 0/5] Clean up UFS(-qcom) MCQ situation
Date: Fri, 04 Jul 2025 19:36:08 +0200
Message-Id: <20250704-topic-qcom_ufs_mcq_cleanup-v1-0-c70d01b3d334@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAgRaGgC/x3MSwqAIBAA0KvErBPsH10lQmSaaqDUtCKI7p60f
 Jv3QCDPFKBLHvB0cWBrIrI0AVy0mUnwGA25zCvZyFIc1jGKHe2mzimoDXeFK2lzOlFQU2elJln
 rFmLgPE18/3k/vO8H/aXYsGwAAAA=
X-Change-ID: 20250704-topic-qcom_ufs_mcq_cleanup-3e7614ae06a8
To: Manivannan Sadhasivam <mani@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Asutosh Das <quic_asutoshd@quicinc.com>, 
 Bart Van Assche <bvanassche@acm.org>, 
 Stanley Chu <stanley.chu@mediatek.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Can Guo <quic_cang@quicinc.com>, Nitin Rawat <quic_nitirawa@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751650573; l=1343;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=YEBPecvN+/+CzyYo7nYN0cP1XFT4QG7XKpKI4CPaGq0=;
 b=w1Y00gKqqNBo7rsQJ2hO5Loxvywl8yMjuhjpuKoW3IikHg+X9MywHMMhUlfcy5WgqhvWg7z/I
 oPZ5nW6urgxBSENoC7uKNEpcnnSKzRn0ovIzd4G3PkteEhshKdhldSm
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The initial implementation was quite messy, including requesting
regions that do not really exist in hardware (or at least not in the
way they were described).

As we have no users (and the corresponding dt-bindings were never even
accepted), remove a whole lot of boilerplate code and clean up the
software's expectations.

Note that this revision does not fix the bindings defficiency yet.

Compile-tested only & not the best code I've written, but I'm looking
for feedback whether this approach is acceptable.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (5):
      ufs: ufs-qcom: Fix UFS base region name in MCQ case
      ufs: ufs-qcom: Remove inferred MCQ mappings
      ufs: ufs-qcom: Don't try to map inexistent regions
      ufs: ufs-qcom: Rename "mcq_sqd" to "mcq_opr"
      ufs: ufs-qcom: Kill ufshcd_res_info

 drivers/ufs/host/ufs-qcom.c      | 151 ++++++++++-----------------------------
 drivers/ufs/host/ufs-qcom.h      |   4 ++
 drivers/ufs/host/ufshcd-pltfrm.c |   4 +-
 include/ufs/ufshcd.h             |  26 +------
 4 files changed, 45 insertions(+), 140 deletions(-)
---
base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
change-id: 20250704-topic-qcom_ufs_mcq_cleanup-3e7614ae06a8

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


