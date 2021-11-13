Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 057CD44F1AA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Nov 2021 06:54:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbhKMF5V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Nov 2021 00:57:21 -0500
Received: from smtpbg127.qq.com ([109.244.180.96]:38479 "EHLO smtpbg.qq.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229487AbhKMF5N (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Nov 2021 00:57:13 -0500
X-QQ-mid: bizesmtp45t1636782849t9o9xcuq
Received: from localhost.localdomain (unknown [125.69.41.88])
        by esmtp6.qq.com (ESMTP) with 
        id ; Sat, 13 Nov 2021 13:54:06 +0800 (CST)
X-QQ-SSF: 01000000000000C0F000C00A0000000
X-QQ-FEAT: L6rHWLmoHCItUu55IwoZIMoD1g78HOTasIjmHf0nGt1cX/qeqjugVLWaJ4dUZ
        X7r+ck8prpVH/O4REzs4c4pBtFfRBD8GoYg3KbqxWDdD0Eg1D65rSND+awCpgicviWINd8m
        Zz+RbMqIgQmSR/pQuSgGYRt4yqUQIheNTPe2FVqP3lEpRmZs8APdzE4okN8HI7/wXvRGxJZ
        yCS6or7BmSOoX9j5syxZtTgz2BQCrJUD1w9YNmoaologKNEAY08e47vwBSW6TvZ8CUceEGz
        KuubXQfOCkqmFlVxAE6tsYn9fk5nHN1qn6jeFQ2QX31qtDNgUxV3LLvHkEK9thJW1QCP+O1
        XAosP0oGZ/baKf11drLGlv5zr6MaIpSzMv1w2JA
X-QQ-GoodBg: 0
From:   Jason Wang <wangborong@cdjrlc.com>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jason Wang <wangborong@cdjrlc.com>
Subject: [PATCH] soc: qcom: qmi: Fix a typo in a comment
Date:   Sat, 13 Nov 2021 13:53:58 +0800
Message-Id: <20211113055358.206533-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The double word `client' in a comment is repeated, thus one of
them should be removed.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 drivers/soc/qcom/qmi_interface.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qmi_interface.c b/drivers/soc/qcom/qmi_interface.c
index 1a03eaa38c46..c8c4c730b135 100644
--- a/drivers/soc/qcom/qmi_interface.c
+++ b/drivers/soc/qcom/qmi_interface.c
@@ -96,7 +96,7 @@ static void qmi_recv_del_server(struct qmi_handle *qmi,
  * @node:	id of the dying node
  *
  * Signals the client that all previously registered services on this node are
- * now gone and then calls the bye callback to allow the client client further
+ * now gone and then calls the bye callback to allow the client further
  * cleaning up resources associated with this remote.
  */
 static void qmi_recv_bye(struct qmi_handle *qmi,
-- 
2.33.0

