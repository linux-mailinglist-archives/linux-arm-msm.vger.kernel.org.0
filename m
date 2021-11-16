Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDA16452FAB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 12:02:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234465AbhKPLFB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 06:05:01 -0500
Received: from m43-7.mailgun.net ([69.72.43.7]:49925 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234545AbhKPLFB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 06:05:01 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637060522; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Wt/HjrcdB9QYwp3Rr18jUECoJIJBfzCHQYUTqCg6wzA=; b=coArI5jvraSCk9JLTIiZtwJZEn3JeO/ybQU4N2OjqXP6v8Mif+iqnnnrOKs2xTd2ddawpATW
 H0dtS3BqOIRUDDOs07/IkHkXsxzdpn5+3x05WXwGmZEg7dtgRBCRGAsq9KNNpMsAWPNDsbJQ
 orUxQfJhPEbnXVB6VMjzg5+07x8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 61938fa94db4233966bb7417 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Nov 2021 11:02:01
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 65B6CC43618; Tue, 16 Nov 2021 11:02:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from pmaliset-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 14EA0C4338F;
        Tue, 16 Nov 2021 11:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 14EA0C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Prasad Malisetty <pmaliset@codeaurora.org>
To:     swboyd@chromium.org, agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, manivannan.sadhasivam@linaro.org,
        robh+dt@kernel.org, mka@chromium.org, lorenzo.pieralisi@arm.com,
        svarbanov@mm-sol.com, bhelgaas@google.com
Cc:     Prasad Malisetty <pmaliset@codeaurora.org>
Subject: [PATCH v3 0/2] Add PCIe clock DT entries for SC7280
Date:   Tue, 16 Nov 2021 16:31:45 +0530
Message-Id: <1637060508-30375-1-git-send-email-pmaliset@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes Added in v3:
	
	* Seperated v2 patch as two patches. One patch is for 
	  Fixing incorrect clock name and another patch is for
	  Adding PCIe clock handle for SC7280.

	* Added fixes patch for interrup-map parent address cells 
	  For SC7280.

Prasad Malisetty (2):
  arm64: dts: qcom: sc7280: Fix incorrect clock name
  arm64: dts: qcom: sc7280: Add pcie clock support

 arch/arm64/boot/dts/qcom/sc7280.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

