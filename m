Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C2FC20747B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 15:29:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389513AbgFXN2L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 09:28:11 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:47144 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390974AbgFXN2C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 09:28:02 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05ODRs5W109583;
        Wed, 24 Jun 2020 13:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=j6/7W4tb/N2hxcHDBOkkKqKNz+kQYnpwjPfAfmGIR+0=;
 b=JUSj3YuQhJoqS24c/nVq29ZA8v8k8nVOEckl+GVYCaFzN9mqvVkb9oN99MBGmmWUmP4k
 hpnkf6cqtbvlW7E+QpK7YvdR7zAEs5PZ5OrYLXCquqR3H4NZiY9gzZi01bpgtyc1bPvk
 unV5heD/2mtauAnY1h06byUVmvyecl6hHAlCEDS4t0X8mPsT6a+QyssaYzd4j0t5+IYs
 WhczVIVRqSHw/K8QZrb8Mem1lG+ouiQhZDGj3HXAvlOxOOGKiKM/mvx32rcFdiCf2Qu1
 qjdMYmdJAMETEOrT5AZmXPLcTwjJP62IJ+VREyls2g9iHUi3AUqQ8us4dd637GXDnlIh 9g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 31uusttuf6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 24 Jun 2020 13:27:54 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05ODNqvw059673;
        Wed, 24 Jun 2020 13:27:53 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 31uuqyr5dm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 24 Jun 2020 13:27:53 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 05ODRpOX026733;
        Wed, 24 Jun 2020 13:27:52 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 24 Jun 2020 13:27:51 +0000
Date:   Wed, 24 Jun 2020 16:27:44 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Andy Gross <agross@kernel.org>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] tty: serial: qcom_geni_serial: Clean up an ARRAY_SIZE() vs
 sizeof()
Message-ID: <20200624132744.GD9972@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9661 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006240097
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9661 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0
 cotscore=-2147483648 malwarescore=0 mlxscore=0 clxscore=1011
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006240097
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The ARRAY_SIZE() is the number of elements but we want the number of
bytes so sizeof() is more appropriate.  Fortunately, it's the same
thing here because this is an array of u8 so this doesn't change
runtime.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 457c0bf8cbf8..1ed3d354e16d 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -718,7 +718,7 @@ static void qcom_geni_serial_handle_tx(struct uart_port *uport, bool done,
 		u8 buf[sizeof(u32)];
 		int c;
 
-		memset(buf, 0, ARRAY_SIZE(buf));
+		memset(buf, 0, sizeof(buf));
 		tx_bytes = min_t(size_t, remaining, port->tx_bytes_pw);
 
 		for (c = 0; c < tx_bytes ; c++) {
-- 
2.27.0

