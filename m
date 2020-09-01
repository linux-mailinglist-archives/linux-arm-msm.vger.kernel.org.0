Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D1F02587BE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 08:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbgIAGBS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 02:01:18 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:29941 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726050AbgIAGBR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 02:01:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598940077; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=le+g3EpVzD21W5YW/7mFqX4zFB4SyVrz0QgT9U+v6CE=; b=IITA7Ankmr9Ex7rjvXyKwcvudbZQ68UZuK4y24CqjRhaBnUFedWOgabUEExeluGR1gBiJcFW
 GPDoMeJ9RoUDVebKjyOLQq0AUvyCEYc0DGFu8v+Xk1VJVnRKMxHYcsVuIbgZcDtovQwklFdP
 dqCJYZzc18PKTFC/B86skNs0UV0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f4de3999bdf68cc03d04f18 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 01 Sep 2020 06:00:57
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 66BB9C43387; Tue,  1 Sep 2020 06:00:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from pacamara-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: nguyenb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DD6CCC433C6;
        Tue,  1 Sep 2020 06:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DD6CCC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=nguyenb@codeaurora.org
From:   "Bao D. Nguyen" <nguyenb@codeaurora.org>
To:     cang@codeaurora.org, asutoshd@codeaurora.org,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Cc:     "Bao D. Nguyen" <nguyenb@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 0/2] Supports Reading UFS's Vcc Voltage Levels from DT
Date:   Mon, 31 Aug 2020 23:00:46 -0700
Message-Id: <cover.1598939393.git.nguyenb@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

UFS's specification supports a range of Vcc operating voltages.
Allows selecting the UFS Vcc operating voltage levels by reading
the UFS's vcc-voltage-level in the device tree.

Bao D. Nguyen (2):
  scsi: dt-bindings: ufs: Add vcc-voltage-level for UFS
  scsi: ufs: Support reading UFS's Vcc voltage from device tree

 Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt |  2 ++
 drivers/scsi/ufs/ufshcd-pltfrm.c                        | 15 ++++++++++++---
 2 files changed, 14 insertions(+), 3 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

