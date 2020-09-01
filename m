Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24A182587C3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 08:01:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbgIAGBY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 02:01:24 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:14238 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726283AbgIAGBX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 02:01:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598940083; h=References: In-Reply-To: References:
 In-Reply-To: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=AteWpHSbFk1S1IfMSH+QeUOwe9NNI3v5yOM9S0tfHwM=; b=kvleLdIXPRE/lNGKJgOrxyiOjOjyd+DCtrBEu42obqZstSph/BKNpmEWhvFo+vNkWo0HXgeu
 1nfAlZSxTbJxSFvpUJ+F/tYdTvszHy6/U/w0txIRvjvxPX0LY4Jjm56GH18bKkwVJPKN2DEU
 V5R0FrSyqR6AyB9NI1mPe/g5Z+4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f4de39cd7b4e26913631e60 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 01 Sep 2020 06:01:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5C7E3C43387; Tue,  1 Sep 2020 06:01:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from pacamara-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: nguyenb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 52B43C433CA;
        Tue,  1 Sep 2020 06:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 52B43C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=nguyenb@codeaurora.org
From:   "Bao D. Nguyen" <nguyenb@codeaurora.org>
To:     cang@codeaurora.org, asutoshd@codeaurora.org,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Cc:     "Bao D. Nguyen" <nguyenb@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Avri Altman <Avri.Altman@wdc.com>,
        Vinod Koul <vkoul@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1 1/2] scsi: dt-bindings: ufs: Add vcc-voltage-level for UFS
Date:   Mon, 31 Aug 2020 23:00:47 -0700
Message-Id: <0a9d395dc38433501f9652a9236856d0ac840b77.1598939393.git.nguyenb@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1598939393.git.nguyenb@codeaurora.org>
References: <cover.1598939393.git.nguyenb@codeaurora.org>
In-Reply-To: <cover.1598939393.git.nguyenb@codeaurora.org>
References: <cover.1598939393.git.nguyenb@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

UFS's specifications supports a range of Vcc operating
voltage levels. Add documentation for the UFS's Vcc voltage
levels setting.

Signed-off-by: Can Guo <cang@codeaurora.org>
Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
---
 Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
index 415ccdd..7257b32 100644
--- a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
+++ b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
@@ -23,6 +23,8 @@ Optional properties:
                           with "phys" attribute, provides phandle to UFS PHY node
 - vdd-hba-supply        : phandle to UFS host controller supply regulator node
 - vcc-supply            : phandle to VCC supply regulator node
+- vcc-voltage-level     : specifies voltage levels for VCC supply.
+                          Should be specified in pairs (min, max), units uV.
 - vccq-supply           : phandle to VCCQ supply regulator node
 - vccq2-supply          : phandle to VCCQ2 supply regulator node
 - vcc-supply-1p8        : For embedded UFS devices, valid VCC range is 1.7-1.95V
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

