Return-Path: <linux-arm-msm+bounces-28581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B5F9528D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 07:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89D461F2480C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 05:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4465A145A0C;
	Thu, 15 Aug 2024 05:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QNULd7Ym"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164373F9FB;
	Thu, 15 Aug 2024 05:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723699021; cv=none; b=SLvame5GCjnzlkscsdMHgPXmVY9/fAJNMZz5fFc6A9KdolzN6M5y9ANKRqd/H/WLPaYjCZHFL3selEfsZTKSuEEKbVUsTnyyhdZb3jx/zISV6r8oR+zO4pmMsEgwjV9pA+0q8M9l1H4qHULI0Yu+WDxspsPCKnRmVsXHsXKhfp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723699021; c=relaxed/simple;
	bh=/khdo0My3G+swuccfI6ySQc7yVQu776veJ6unGUnbVA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pJPZzDw4uO4If3QTvSWOJHYzTNVbrypZ5CyMIeBcA1PjSv03cnaHcDIJclGRcJqJ+7N0yvmC6iZBgRvVLvMXwRrzwQZUG+e1723+boFCfjHM14M2rHHSuuiCnHqKpX9A2irlmznEawC/7B5NBVCnV7wAG8dLiEkuzen2SJ1xZp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QNULd7Ym; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9255BC4AF0A;
	Thu, 15 Aug 2024 05:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723699020;
	bh=/khdo0My3G+swuccfI6ySQc7yVQu776veJ6unGUnbVA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=QNULd7YmtR7VUcRdCWwHCsJOEOuxEWIFHr9MYoPthFaP6bsPH39XYNIJakAe35+XP
	 49CW8ExD2oK3oQxuX2yiMOHRuyjwlJjD+dxasfUHV6x19pLuJqx14a1M7Oov8ffQgs
	 Fx4ZNJYTr8rQnM0spaJNv+qT3cNIV4BFaI4KFcXJ4pmoheY71pa/BhNS0ycrP+M0FR
	 rBt6G8qhW3d/aRjQl0Qh7JdFw3tVCdMIlIFBAsEJOyQKZxlLl0O/04iNgAW+UWPQLC
	 zsEKpJzxNt3zdiwrcNd1EpI0kn40MGy6AKHg4/diZ6zDV8Ji6fjp+KW08d+/Yk9VlP
	 TKR8wry6fye6g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B61C3DA7F;
	Thu, 15 Aug 2024 05:17:00 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Subject: [PATCH v2 0/3] ufs: qcom: Fix probe failure on SM8550 SoC due to
 broken LSDBS field
Date: Thu, 15 Aug 2024 10:46:55 +0530
Message-Id: <20240815-ufs-bug-fix-v2-0-b373afae888f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEePvWYC/22MQQ7CIBAAv9Ls2TVAQKon/2F6KHahmxgwYBtNw
 9/Fnj3OJDMbFMpMBS7dBplWLpxiA3Xo4D6PMRDy1BiUUFr0UuPiC7oloOc3aq2sd0K6/iSgFc9
 MTe+329B45vJK+bPPV/mz/z+rRIGGnD5Pxltj5fXBcczpmHKAodb6BRhIAo+nAAAA
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Kyoungrul Kim <k831.kim@samsung.com>, 
 Amit Pundir <amit.pundir@linaro.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1250;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=/khdo0My3G+swuccfI6ySQc7yVQu776veJ6unGUnbVA=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmvY9JRRIr3klzE2+LW0sbg+9HwwUTKNVwST3Vs
 06Qf8uV06qJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZr2PSQAKCRBVnxHm/pHO
 9bEUCACDNJnn8YxXYv6i8vQzD1bpRkK6pgb3wLXk8j+UWlxvt2N3OkvVH3CHPtngsFUnetodsPu
 z82+ZHIvhP+trg03GWRVQcw0H/Ut7h6XLdBrTYflttlXmbAbMT4u+SrvJXinWiopuP6GtdYSJEI
 Q4OwiVv+iohmkLoXW0fwaIJySkcxVWnt7m5P/XqvdHrC2PNu7CbJniq9EK4Y999ypS900urGfz7
 5B9/R/DY89cg9iI+CJt3z55Dl6BcCoK8Ir7XGhAeUNpcaA7pbPomQuFl9XsJjmvvDvGkNbd0Q7g
 TJh1C8wdQjh7LEWOiMlKX9vbROnxOB5RB9h64RTvSLVrrvs8
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reply-To: manivannan.sadhasivam@linaro.org

Hi,

This series fixes the probe failure on the Qcom SM8550 SoC due to the broken
LSDBS field in the host controller capabilities register.

Please consider this series for v6.11 as it fixes a regression.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
Changes in v2:
- Changed SDBS to LSDBS as per the final version of UFSHCI 4.0 spec
- Moved the quirk check to assignment
- Used correct fixes tag in patch 3/3
- Added tested-by tags
- Link to v1: https://lore.kernel.org/r/20240814-ufs-bug-fix-v1-0-5eb49d5f7571@linaro.org

---
Manivannan Sadhasivam (3):
      ufs: core: Rename LSDB to LSDBS to reflect the UFSHCI 4.0 spec
      ufs: core: Add a quirk for handling broken LSDBS field in controller capabilities register
      ufs: qcom: Add UFSHCD_QUIRK_BROKEN_LSDBS_CAP for SM8550 SoC

 drivers/ufs/core/ufshcd.c   | 10 +++++++---
 drivers/ufs/host/ufs-qcom.c |  6 +++++-
 include/ufs/ufshcd.h        |  9 ++++++++-
 include/ufs/ufshci.h        |  2 +-
 4 files changed, 21 insertions(+), 6 deletions(-)
---
base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
change-id: 20240814-ufs-bug-fix-4427fb01b860

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>



