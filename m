Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A6932F76E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 11:43:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727205AbhAOKl4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 05:41:56 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:36489 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbhAOKlz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 05:41:55 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610707296; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=kFrYQpPYNOC5TAgQ7nxo/oRkgxMVqlCmLX0urW7tDBM=; b=YHGMAQ22+mRxqdA6tAk/RLE0LZ9RDBoM84i0amKzuHN1U4Eg3yc2R2hlUDcnuAJcp2MxbL6D
 +C6MRWt7RVBRsxUzOseyo93FX22utaxHwhxk5EniA/eYD/gm+R86k3o0UaIFfgjJBKjSrVxS
 bwl9xSBclWUo+4Hv61L12T0NvsE=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6001713e75e5c01cba60671c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 15 Jan 2021 10:41:02
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EB5BFC433CA; Fri, 15 Jan 2021 10:41:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D219EC433CA;
        Fri, 15 Jan 2021 10:41:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D219EC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
From:   Jack Pham <jackp@codeaurora.org>
To:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Wesley Cheng <wcheng@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jack Pham <jackp@codeaurora.org>
Subject: [PATCH 0/4] SM8350 USB and dt-bindings updates
Date:   Fri, 15 Jan 2021 02:40:43 -0800
Message-Id: <20210115104047.3460-1-jackp@codeaurora.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds support for the SM8350 USB PHY to the QMP PHY driver
as well as adds the documentation for the QMP, SNPS PHY and DWC3
controller bindings. This also adds the bindings for SM8150 and SM8250
to the same docs which had not been added previously even though they
are in use now.

Jack Pham (4):
  phy: qcom-qmp: Add SM8350 USB QMP PHYs
  dt-bindings: phy: qcom,qmp: Add SM8150, SM8250 and SM8350 USB PHY
    bindings
  dt-bindings: phy: qcom,usb-snps-femto-v2: Add SM8250 and SM8350
    bindings
  dt-bindings: usb: qcom,dwc3: Add bindings for SM8150, SM8250, SM8350

 .../devicetree/bindings/phy/qcom,qmp-phy.yaml |  67 ++++++
 .../bindings/phy/qcom,usb-snps-femto-v2.yaml  |   2 +
 .../devicetree/bindings/usb/qcom,dwc3.yaml    |   3 +
 drivers/phy/qualcomm/phy-qcom-qmp.c           | 209 ++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           | 100 +++++++++
 5 files changed, 381 insertions(+)

-- 
2.24.0

