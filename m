Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 114B9E4767
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2019 11:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393215AbfJYJe3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Oct 2019 05:34:29 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:55002 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730207AbfJYJe3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Oct 2019 05:34:29 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 5DC944AADF4BD93F2232;
        Fri, 25 Oct 2019 17:34:27 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Fri, 25 Oct 2019
 17:34:17 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <agross@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] clk: qcom: remove unneeded semicolon
Date:   Fri, 25 Oct 2019 17:33:32 +0800
Message-ID: <20191025093332.27592-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

remove unneeded semicolon.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/clk/qcom/clk-rcg2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index b98b81e..99c4bfa 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -206,7 +206,7 @@ static int _freq_tbl_determine_rate(struct clk_hw *hw, const struct freq_tbl *f,
 		break;
 	default:
 		return -EINVAL;
-	};
+	}
 
 	if (!f)
 		return -EINVAL;
@@ -319,7 +319,7 @@ static int __clk_rcg2_set_rate(struct clk_hw *hw, unsigned long rate,
 		break;
 	default:
 		return -EINVAL;
-	};
+	}
 
 	if (!f)
 		return -EINVAL;
-- 
2.7.4


