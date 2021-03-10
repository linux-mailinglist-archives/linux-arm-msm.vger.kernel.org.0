Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7BCB334197
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 16:34:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231790AbhCJPeW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 10:34:22 -0500
Received: from mail1.protonmail.ch ([185.70.40.18]:49202 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232940AbhCJPeB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 10:34:01 -0500
Date:   Wed, 10 Mar 2021 15:33:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1615390439;
        bh=VAaoHzPUuviXWZuHpXivJNsABEQ935p5HTpQ7ZaoB2w=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=qKSsMc2qCKrxizjwbUZwIWkQS+QnQBp7n0S5VJFfOGNTZ5dpJBQSJY0rG7cDe5k7C
         +WJtx+iGnLxPO4hBfnY1HYUcAHiLGs7po/br+0Ohvq8Ko1d3r9TGxCMSler1fTuUXi
         FoHtHVQZQvPMWMVvf+Ku52tSx+8bIGBzDtrbvtEQ=
To:     caleb@connolly.tech, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ejb@linux.ibm.com, stanley.chu@mediatek.com, cang@codeaurora.org,
        beanhuo@micron.com, jaegeuk@kernel.org, asutoshd@codeaurora.org,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH v3 2/3] scsi: ufs: qcom: use ufshci_version function
Message-ID: <20210310153215.371227-3-caleb@connolly.tech>
In-Reply-To: <20210310153215.371227-1-caleb@connolly.tech>
References: <20210310153215.371227-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Replace the UFSHCI_VERSION_xy macros.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 drivers/scsi/ufs/ufs-qcom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index f97d7b0ae3b6..2d54dce0eeda 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -809,9 +809,9 @@ static u32 ufs_qcom_get_ufs_hci_version(struct ufs_hba =
*hba)
 =09struct ufs_qcom_host *host =3D ufshcd_get_variant(hba);
=20
 =09if (host->hw_ver.major =3D=3D 0x1)
-=09=09return UFSHCI_VERSION_11;
+=09=09return ufshci_version(1, 1);
 =09else
-=09=09return UFSHCI_VERSION_20;
+=09=09return ufshci_version(2, 0);
 }
=20
 /**
--=20
2.29.2


