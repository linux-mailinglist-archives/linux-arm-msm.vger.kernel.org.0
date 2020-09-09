Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E90D2624B9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Sep 2020 04:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbgIICET (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 22:04:19 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:36448 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726489AbgIICER (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 22:04:17 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0891xvwb146266;
        Wed, 9 Sep 2020 02:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : mime-version :
 content-type; s=corp-2020-01-29;
 bh=CwfXHWSMExojBrq5MqRUji39v4s5dmscJT5bDf3eIaE=;
 b=bPuFdKyAJyZ9Qv4n/FAvjk3aRivD4LICe2rh7PDBMKCWaRKJYJ8Yxc4CgxqqiVImTRjS
 QMcPCzmeJWmToiu2bJiEc/gO1D+FHIVTetCNzGwUvE+wX3tJjiRnxxdQ8pCyr6YqKkJi
 34NZg6oSxAaYOFU3QqYgqxSV9c4YwY1JNFoZz/ShNt/EbT8yTGMAAvkKkZgw13utHP+j
 mSiZyvndSK16VXCD/jP0iZCpShr/jRw5CD+T/ZVsZW6Y43zMl4ahDABxNkTSX5oSShPj
 HPuRomtPmQPErcKP6b86CwJ53X1M7wz2xkyfsQEhLlTM8TmxItwq8Vd1AyI45V21us3C 9Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 33c3amxt9j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 09 Sep 2020 02:03:59 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08921SwF176092;
        Wed, 9 Sep 2020 02:03:58 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 33cmerwwf1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 09 Sep 2020 02:03:58 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08923tIT009003;
        Wed, 9 Sep 2020 02:03:55 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 08 Sep 2020 19:03:54 -0700
To:     "Bao D. Nguyen" <nguyenb@codeaurora.org>
Cc:     cang@codeaurora.org, asutoshd@codeaurora.org,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Nitin Rawat <nitirawa@codeaurora.org>,
        Bean Huo <beanhuo@micron.com>,
        Bart Van Assche <bvanassche@acm.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH v1 1/1] scsi: ufshcd: Allow zero value setting to
 Auto-Hibernate Timer
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1ft7r670z.fsf@ca-mkp.ca.oracle.com>
References: <b141cfcd7998b8933635828b56fbb64f8ad4d175.1598661071.git.nguyenb@codeaurora.org>
Date:   Tue, 08 Sep 2020 22:03:51 -0400
In-Reply-To: <b141cfcd7998b8933635828b56fbb64f8ad4d175.1598661071.git.nguyenb@codeaurora.org>
        (Bao D. Nguyen's message of "Fri, 28 Aug 2020 18:05:13 -0700")
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9738 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=1 adultscore=0
 bulkscore=0 phishscore=0 malwarescore=0 mlxlogscore=752 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009090017
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9738 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 priorityscore=1501
 clxscore=1011 bulkscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=759 suspectscore=1 adultscore=0 mlxscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009090017
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Bao,

> The zero value Auto-Hibernate Timer is a valid setting, and it
> indicates the Auto-Hibernate feature being disabled. Correctly support
> this setting. In addition, when this value is queried from sysfs, read
> from the host controller's register and return that value instead of
> using the RAM value.

Applied to my 5.10 staging tree. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
