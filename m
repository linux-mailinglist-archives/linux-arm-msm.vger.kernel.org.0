Return-Path: <linux-arm-msm+bounces-28735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFAF9541A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 08:25:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3187E283B14
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 06:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF04D84A3F;
	Fri, 16 Aug 2024 06:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mX9uY6AA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2BD84A2B;
	Fri, 16 Aug 2024 06:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723789513; cv=none; b=XkaCOHRPKfA+BInZi+XJ7Q4HGXJ35YoM7R4TUvq8NALifWv/ujP3lt25PTqKZJGman2AzxnxaYkUtIBtNw4HgWYz7N8rdQfimhZCZwRtSmNwxhWqnm9iVy6iEkVUfrRq/FuuXkR8nteANsdjflcgM+xjz87B/Jv9b5ZnsJsJ+aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723789513; c=relaxed/simple;
	bh=j24GEDJCnKKDhHy6+RSpTUWeG0bpq/+BqdmeI6YLZn4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ts8eyjIRPzo+CCgQ6dK6atplTZJdqL6RUMOcChmOIPVw3IIJrgOBvrO0YFsTDhyIuNRcs20g4Cjpo8V/JdEEv2wfREeAGagN4IEARxmYpUf4IUzjdSRaJvS2QzPJc19GzU7Ze83tTEe/ziXpd4Y1bIMjijh5UrSimOGnJrhdHVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mX9uY6AA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A003C32782;
	Fri, 16 Aug 2024 06:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723789513;
	bh=j24GEDJCnKKDhHy6+RSpTUWeG0bpq/+BqdmeI6YLZn4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=mX9uY6AAQT3AUyhWAlh4/HDp7Q7JfhYmDR5X3/BTpxF7PzHAc0rWF1HHRVWKdfaQI
	 NsMIl9YLQGYG9PAw1V25+pXjdG67i+j/1KVEYU1wdy2ZV+8frJi2t2TWst9NmvAbFg
	 1pQ0dxLk6Maq+ArYxG69VeV4lnVuJwHpPlWeqdsAlFoRlG0Ncn66H3OqDSganmf1aE
	 w/lxH3/AUviMDzo+ER1vWJ/Wdr3yw6wqUMEGzaq0Mg210/j3jfwRlBL9ZBROFRDrIy
	 bzngPwmai2IJv63hDlLvzu9flcU+e5evVEVEpWaRyFBdnzo2uVPwHC1BoOuWRIyo1Q
	 rYBDk4L7aybOQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0DE7C531DC;
	Fri, 16 Aug 2024 06:25:12 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Subject: [PATCH v3 0/2] ufs: qcom: Fix probe failure on SM8550 SoC due to
 broken LSDBS field
Date: Fri, 16 Aug 2024 11:55:09 +0530
Message-Id: <20240816-ufs-bug-fix-v3-0-e6fe0e18e2a3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMXwvmYC/22MQQ7CIBAAv2L2LAYoCHryH8YD2KXdxBQDlmia/
 l3ak008ziQzE2RMhBnOuwkSFsoUhwrNfgf33g0dMmorg+RScSsUG0NmfuxYoDdTSprgufD2yKE
 Wz4RVr7frrXJP+RXTZ50Xsdj/nyIYZxq9OrU6GG3E5UGDS/EQUwfLqMjfWG9jWWPfmMYFh9bas
 Innef4CGgeA0OQAAAA=
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Kyoungrul Kim <k831.kim@samsung.com>, 
 Amit Pundir <amit.pundir@linaro.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1401;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=j24GEDJCnKKDhHy6+RSpTUWeG0bpq/+BqdmeI6YLZn4=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmvvDG3izCG4Aa4sIaF9MGmyp4+eBt4PIJ3zbzq
 Kt240kMDlGJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZr7wxgAKCRBVnxHm/pHO
 9c2wB/9LY1wbsfKqBJFfhbFYqm85l2kz0QHzdTnHH3r370AEFKpjXDPutaU74fUl3fjleZrXY9a
 K5SbpRidW+agu3ggKsJRoTCVTKS3BWGAmtGyrebpBEnrYx6cd9634+ipEi79puvqXXH0RYqjxvt
 IbQgCu+fz+Tc9D3Kq8KV0WGdfHrAG6OxBoJ4Orn5XCSVpBRsuhaOtoN48rjxKdSXS+4E0FwK1Ra
 MY7tOvUs3oquLZ/AnYnSdyP+LzLb5gQCn26ai0FtVcAk9xpPJTMlU0eZTyg4GkIdRpb2rO8BWXJ
 1a1S7oxN431YYc1x9SQpQtQu6/fNPK7Fico8eyKIumpR0DOI
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
Changes in v3:
- Dropped the patch that renamed LSDB field
- Changed the comment for the quirk and also fixed the UFSHCI version in
  description
- Collected review tag
- Link to v2: https://lore.kernel.org/r/20240815-ufs-bug-fix-v2-0-b373afae888f@linaro.org

Changes in v2:
- Changed SDBS to LSDBS as per the final version of UFSHCI 4.0 spec
- Moved the quirk check to assignment
- Used correct fixes tag in patch 3/3
- Added tested-by tags
- Link to v1: https://lore.kernel.org/r/20240814-ufs-bug-fix-v1-0-5eb49d5f7571@linaro.org

---
Manivannan Sadhasivam (2):
      ufs: core: Add a quirk for handling broken LSDBS field in controller capabilities register
      ufs: qcom: Add UFSHCD_QUIRK_BROKEN_LSDBS_CAP for SM8550 SoC

 drivers/ufs/core/ufshcd.c   | 6 +++++-
 drivers/ufs/host/ufs-qcom.c | 6 +++++-
 include/ufs/ufshcd.h        | 8 ++++++++
 3 files changed, 18 insertions(+), 2 deletions(-)
---
base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
change-id: 20240814-ufs-bug-fix-4427fb01b860

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>



