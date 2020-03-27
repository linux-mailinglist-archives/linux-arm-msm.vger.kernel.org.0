Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAE62194ECA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2020 03:12:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727809AbgC0CL7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Mar 2020 22:11:59 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:56288 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727666AbgC0CL6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Mar 2020 22:11:58 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02R2A3Ao109633;
        Fri, 27 Mar 2020 02:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2020-01-29;
 bh=5bvarpOWWeLxkVz2dL6Qx21vldJ+hgFTiWHLxR5fkAw=;
 b=VmhSM0sgrgT40LeJyF4tp8kguA5KOOk5UlzBCZ9do+s7QhhjqUcKHIlIX63/jKv8i/Ed
 W3EEzAVOu4L4kUnfW2oAUR2KxBo/hkLF7DDLLbukmfmbvgtAmY8W00Fr1tkfw/JNbIQZ
 1FBhct/BXonCFVf/Sau6eYaJjrQKI5qjYNUqiMg3m3GAILVChL57KZ7lu3AwadbTP0jf
 RQ60sMt8CZUAu8LqmCPMnIzG9PIs4QhzXpKatahvdtkm6w0ywuuD1xYFybddlbQvDzI2
 8ybarv31OPqjcm63iMn6SD9NJANlOwkO+MNRzShXXZcqlgbh6bebTwLy9qC80/FhkKCm vQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 3014598nnu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 27 Mar 2020 02:11:46 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02R2BkmA166048;
        Fri, 27 Mar 2020 02:11:46 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 3003gn05pp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 27 Mar 2020 02:11:45 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02R2BTUp009843;
        Fri, 27 Mar 2020 02:11:29 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 26 Mar 2020 19:11:29 -0700
To:     Asutosh Das <asutoshd@codeaurora.org>
Cc:     cang@codeaurora.org, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org, Nitin Rawat <nitirawa@codeaurora.org>,
        linux-arm-msm@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Tomas Winkler <tomas.winkler@intel.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: Re: [<PATCH v1> 1/1] scsi: ufs: Resume ufs host before accessing ufs device
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <f712a4f7bdb0ae32e0d83634731e7aaa1b3a6cdd.1585009663.git.asutoshd@codeaurora.org>
Date:   Thu, 26 Mar 2020 22:11:26 -0400
In-Reply-To: <f712a4f7bdb0ae32e0d83634731e7aaa1b3a6cdd.1585009663.git.asutoshd@codeaurora.org>
        (Asutosh Das's message of "Tue, 24 Mar 2020 14:48:21 -0700")
Message-ID: <yq1tv2aeecx.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9572 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003270016
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9572 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0 spamscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003270015
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Asutosh,

> As a part of sysfs reading of descriptors/attributes/flags, query
> commands should only be executed when hba's power runtime status is
> active.  To guarantee this, add pm_runtime_get/put_sync() to those
> paths where query commands are sent.

Applied to 5.7/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
