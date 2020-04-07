Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB9D1A0EB4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2020 15:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728721AbgDGN4T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 09:56:19 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:49028 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728573AbgDGN4T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 09:56:19 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 037DtP1C186684;
        Tue, 7 Apr 2020 13:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=TRyJaQVfPlFV0aSfQSERfDGLFVG2sUDj/7/3QhRVzqE=;
 b=Y2dPVSP1Nip4b+q34ZuNMBPTHRF7+k0OykV+QyXZFpDoxfNnZsYubpw9TFeJCCEycYT3
 x+roDHkE4g6rFcdeFnUS5mBaxqWoeK8vG4xGbseRqLKrjsjiF+i25onTTSyXA5Ssx0iW
 8qVB0EWDxTeXq9UKtSYWoFcBUTZku7z53H/t9TXJ0+yXh3QadGoqq5eujE/V3qA2Uvua
 0n1suxc4EUoJf9XYBI2qXQW7DQzq4Jrvo8Vkl0KYIztAPW3foqxMeCMCJ9F1ey6W/DPV
 zXfK+gxAKbty6lgbSkYRHIe/tsWAJV3XSApIYxFGpGuEMeEtWIwBHRc+HlSKLnyUUTrV JA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 308ffdb50y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 07 Apr 2020 13:56:17 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 037DqVGh165864;
        Tue, 7 Apr 2020 13:56:17 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 30839tebvb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 07 Apr 2020 13:56:16 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 037DuFCm027913;
        Tue, 7 Apr 2020 13:56:15 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 07 Apr 2020 06:56:15 -0700
Date:   Tue, 7 Apr 2020 16:56:08 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     manivannan.sadhasivam@linaro.org
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [bug report] bus: mhi: core: Add support for data transfer
Message-ID: <20200407135608.GA109647@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9583 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=666 bulkscore=0 suspectscore=3 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004070121
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9583 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3 priorityscore=1501
 impostorscore=0 malwarescore=0 mlxlogscore=727 lowpriorityscore=0
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

	drivers/bus/mhi/core/main.c:1093 mhi_gen_tre()
	warn: bitwise AND condition is false here

drivers/bus/mhi/core/main.c
  1088  
  1089          ret = mhi_cntrl->map_single(mhi_cntrl, buf_info);
  1090          if (ret)
  1091                  return ret;
  1092  
  1093          eob = !!(flags & MHI_EOB);
                                 ^^^^^^^
This is zero.  Was BIT(0) intended?

  1094          eot = !!(flags & MHI_EOT);
  1095          chain = !!(flags & MHI_CHAIN);
  1096          bei = !!(mhi_chan->intmod);
  1097  
  1098          mhi_tre = tre_ring->wp;
  1099          mhi_tre->ptr = MHI_TRE_DATA_PTR(buf_info->p_addr);

regards,
dan carpenter
