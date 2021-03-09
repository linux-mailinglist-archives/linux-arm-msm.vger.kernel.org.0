Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A6CD332483
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Mar 2021 12:56:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbhCILz1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Mar 2021 06:55:27 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131]:45786 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbhCILzS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Mar 2021 06:55:18 -0500
Date:   Tue, 09 Mar 2021 11:55:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1615290916;
        bh=VAaoHzPUuviXWZuHpXivJNsABEQ935p5HTpQ7ZaoB2w=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=qNXClnM7sU1Zna0Jl+6S/Fl/ZQzw22kdzuprFtmzzwtcj9PQWUev6tICt2R4yCBv7
         UZjzcBlV88lGdVAj05iFQ9XHzMjYbrUC2724b1smet0oWqfbq/TGiTw6aUmlrz8A8L
         kehRn1eRykeuB9AiAHHSDDmcrS6ZbnBhWzDeXl4o=
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
Subject: [PATCH v2 2/3] scsi: ufs: qcom: use ufshci_version function
Message-ID: <20210309115336.117206-3-caleb@connolly.tech>
In-Reply-To: <20210309115336.117206-1-caleb@connolly.tech>
References: <20210309115336.117206-1-caleb@connolly.tech>
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


