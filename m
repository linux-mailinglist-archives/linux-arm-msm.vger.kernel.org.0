Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CE0A33CC2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Mar 2021 04:40:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234107AbhCPDje (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 23:39:34 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:13541 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbhCPDjG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 23:39:06 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DzzVJ5ZSczPjqN;
        Tue, 16 Mar 2021 11:36:40 +0800 (CST)
Received: from k03.huawei.com (10.67.174.111) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Tue, 16 Mar 2021 11:38:53 +0800
From:   He Fengqing <hefengqing@huawei.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <hefengqing@huawei.com>
Subject: [PATCH] drivers: usb: Fix a typo in dwc3-qcom.c
Date:   Tue, 16 Mar 2021 04:14:30 +0000
Message-ID: <20210316041430.2203546-1-hefengqing@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.67.174.111]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch fix a spelling typo in dwc3-qcom.c

Signed-off-by: He Fengqing <hefengqing@huawei.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index fcaf04483ad0..5149dea68a5c 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -235,7 +235,7 @@ static int dwc3_qcom_interconnect_disable(struct dwc3_qcom *qcom)
 
 /**
  * dwc3_qcom_interconnect_init() - Get interconnect path handles
- * and set bandwidhth.
+ * and set bandwidth.
  * @qcom:			Pointer to the concerned usb core.
  *
  */
-- 
2.25.1

