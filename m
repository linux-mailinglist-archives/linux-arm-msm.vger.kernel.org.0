Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E1C1189874
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2020 10:48:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726933AbgCRJsB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Mar 2020 05:48:01 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:52106 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726786AbgCRJsB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Mar 2020 05:48:01 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02I9cpI5079251;
        Wed, 18 Mar 2020 09:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=mNiBsc3ccmxXW4TUucRB5ax7Pch8UQ2P6Tuk5AciZMw=;
 b=wnJFJvsy1LT1pWAd3aqFzKgSFchXJ2PU0EIiryAuzEI/ARa5eS1jW3N3vZEZLi/kPkoi
 YvVju2iwMqTC/W79TyabOubzyuSDhuh8hmaJj0VBHjFbp5c0NHF9MJ1B2WqAjK/3evYr
 kDE/Idpdiw5Uz+1es4wEw6ul0sXNV9dnX2EH2XIp/hMsTAyjMVIXTCL7sNKE0WgWkSJV
 7SWiLpuTW5dPCHXYqqTo5b/m/z1RW39DO3arIIzMzzxdAmUHttlw2XEfOpd6Q5ZsJ9s7
 ycnMVP/sznifWv6R/PYsvEKR9k2dOg1lTnIPbf0qRpfnmaG5QAulo6DNiMG/dsRZOgjJ VA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 2yrq7m1gv8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 18 Mar 2020 09:47:57 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02I9MU7O186581;
        Wed, 18 Mar 2020 09:47:57 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 2ys9013vtc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 18 Mar 2020 09:47:57 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 02I9luXH026936;
        Wed, 18 Mar 2020 09:47:56 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 18 Mar 2020 02:47:55 -0700
Date:   Wed, 18 Mar 2020 12:47:50 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     sibis@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org
Subject: [bug report] soc: qcom: Introduce Protection Domain Restart helpers
Message-ID: <20200318094750.GA4617@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9563 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=3
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003180048
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9563 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 suspectscore=3
 adultscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1011
 malwarescore=0 mlxscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003180048
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Sibi Sankar,

The patch fbe639b44a82: "soc: qcom: Introduce Protection Domain
Restart helpers" from Mar 12, 2020, leads to the following static
checker warning:

	drivers/soc/qcom/pdr_interface.c:158 pdr_register_listener()
	warn: impossible condition '(resp.curr_state < (-((~0 >> 1)) - 1)) => (s32min-s32max < s32min)'

drivers/soc/qcom/pdr_interface.c
   145          ret = qmi_txn_wait(&txn, 5 * HZ);
   146          if (ret < 0) {
   147                  pr_err("PDR: %s register listener txn wait failed: %d\n",
   148                         pds->service_path, ret);
   149                  return ret;
   150          }
   151  
   152          if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
   153                  pr_err("PDR: %s register listener failed: 0x%x\n",
   154                         pds->service_path, resp.resp.error);
   155                  return ret;
   156          }
   157  
   158          if ((int)resp.curr_state < INT_MIN || (int)resp.curr_state > INT_MAX)
                    ^^^^                              ^^^^
These are casted to int so they can't be outside of int range.

   159                  pr_err("PDR: %s notification state invalid: 0x%x\n",
   160                         pds->service_path, resp.curr_state);
   161  
   162          pds->state = resp.curr_state;
   163  
   164          return 0;
   165  }

regards,
dan carpenter
