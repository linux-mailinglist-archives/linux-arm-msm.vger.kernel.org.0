Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 206FE12655E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2019 16:04:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbfLSPE4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 10:04:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:34056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726751AbfLSPE4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 10:04:56 -0500
Received: from localhost.localdomain (unknown [122.178.234.230])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B62052146E;
        Thu, 19 Dec 2019 15:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576767895;
        bh=/jIJKRnEIRzADB+RxPN791tm3kyqzX+a1DLwuevFZ7M=;
        h=From:To:Cc:Subject:Date:From;
        b=BMXRjLs9bcJNPqA2N/nqnKpymFOPar4bw17p3XcMevhfdkVOpffQCpscvwUIEHKTj
         HPQwI8MJx1RFnd7a7eGxlw7bADumAc6mW8fHzY64Sh6ZvzuKg27t61LDib6RNkEX8i
         Z4ZNn1/oI13PmKvemfdxe/klbakiCL16Vvthir1A=
From:   Vinod Koul <vkoul@kernel.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Can Guo <cang@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] phy: qcom-qmp: Fixes and updates for sm8150
Date:   Thu, 19 Dec 2019 20:34:29 +0530
Message-Id: <20191219150433.2785427-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5.5-rc1 we have seen regression on UFS phy on 8998 and SM8150. As
suggested by Can increasing the timeout helps so we increase the phy init
timeout and that fixes the issue for 8998.  The patch 1 should be applied
to fixes for 5.5

For SM8150 we need additional SW reset so add additional SW reset and
configure if flag is defined, while at it do small updates to Use register
defines and remove duplicate powerdown write.

Vinod Koul (4):
  phy: qcom-qmp: Increase the phy init timeout
  phy: qcom-qmp: Use register defines
  phy: qcom-qmp: Add optional SW reset
  phy: qcom-qmp: remove duplicate powerdown write

 drivers/phy/qualcomm/phy-qcom-qmp.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

-- 
2.23.0

