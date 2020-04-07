Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A6E61A0EBC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2020 15:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728482AbgDGN6K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 09:58:10 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:50884 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728810AbgDGN6K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 09:58:10 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 037DtPkP186660;
        Tue, 7 Apr 2020 13:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=mg4/XD7WoDPLaJOrqkBL8YG6iVCvm86JgEE3p+ykzbo=;
 b=jCi89ZTLy1v7YhbdGkfTWvmi99fnfmxT90UHO2RLbHbB6rP3t5kL5y5hOWR//PiFFZ7E
 Tk7kfpu+9PM7Zq5FTSyHRhB9wpfU3lI2tMgveBc0webLHErA30AV/nh6AyNaUR6G//hX
 toiENu4EPoFy/2TheQWZn8QHPlA6ACq27cTkPaL5Tsb1Dd96g5mF8wPgSY6HyVNXPh4R
 fDdTM5JR7ISXIgNjxAEuRdppgwbYjhTJIg/0SjRkvYk84Nvy9Mj72Hw8+KbmR1WxcQW2
 91HlzsW6wfphbYaafBJBEwXCK1nwberGth7lig8umsLwh82MdvxlpJsPI7lKW3/84e6r Lg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 308ffdb5cc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 07 Apr 2020 13:58:08 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 037DrHgX044889;
        Tue, 7 Apr 2020 13:56:07 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 3073qg48qa-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 07 Apr 2020 13:56:07 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 037Du6fM028755;
        Tue, 7 Apr 2020 13:56:07 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 07 Apr 2020 06:56:06 -0700
Date:   Tue, 7 Apr 2020 16:55:59 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     manivannan.sadhasivam@linaro.org
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [bug report] bus: mhi: core: Add support for data transfer
Message-ID: <20200407135559.GA109574@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9583 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 mlxlogscore=998
 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=3
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004070121
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9583 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3 priorityscore=1501
 impostorscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004070121
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Manivannan Sadhasivam,

The patch 189ff97cca53: "bus: mhi: core: Add support for data
transfer" from Feb 20, 2020, leads to the following static checker
warning:

	drivers/bus/mhi/core/main.c:1153 mhi_queue_buf()
	error: double locked 'mhi_chan->lock' (orig line 1110)

drivers/bus/mhi/core/main.c
  1142          }
  1143  
  1144          /* Toggle wake to exit out of M2 */
  1145          mhi_cntrl->wake_toggle(mhi_cntrl);
  1146  
  1147          if (mhi_chan->dir == DMA_TO_DEVICE)
  1148                  atomic_inc(&mhi_cntrl->pending_pkts);
  1149  
  1150          if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl))) {
  1151                  unsigned long flags;
  1152  
  1153                  read_lock_irqsave(&mhi_chan->lock, flags);
                                          ^^^^^^^^^^^^^^^
The caller is already holding this lock.

  1154                  mhi_ring_chan_db(mhi_cntrl, mhi_chan);
  1155                  read_unlock_irqrestore(&mhi_chan->lock, flags);
  1156          }
  1157  
  1158          read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
  1159  
  1160          return 0;
  1161  }
  1162  EXPORT_SYMBOL_GPL(mhi_queue_buf);

regards,
dan carpenter
