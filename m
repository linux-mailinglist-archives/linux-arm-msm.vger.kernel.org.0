Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84B9926B998
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 04:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbgIPCCM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 22:02:12 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:51284 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgIPCCI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 22:02:08 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08FKANx4178551;
        Tue, 15 Sep 2020 20:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=gcorS1ohV2HzaNEnNQvgmVIGi0lw02APh5OvpZ6GEwQ=;
 b=wUIJTrn7z4E6t0j9pRUYfTED3tfZ8ZdKUTqt1I6K30lemasuOELL6aXHns7ucM2eb7DK
 vACmf4ofvfXIOGmXAFcYjMzQkMBR6NQzDzUWBZrQLHdF26ffyrt6UymT4XL+0HyfpvhR
 I8+o90tt1owooS2TpK9wZ07Vk3/FHeqZ07aswOVcDWW44udNHf6llY13mdzWuPA2hDow
 W62Qy3NhLuxPUeChdrU5JoreiTklFo6n7K7UpZJIKSuDcjfStg5KdvxSW2ebsIFgo9cS
 xCe5ATyu0lmUvXIhW5Fn1iqkIqcx3ExDSUFA0HJblqxkPEaDd6duYnW0pTKOPhdTNJKg VQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 33j91dh107-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 15 Sep 2020 20:16:48 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08FKEh1k181338;
        Tue, 15 Sep 2020 20:16:48 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 33h88yy88p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 15 Sep 2020 20:16:48 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08FKGhX9003049;
        Tue, 15 Sep 2020 20:16:44 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 15 Sep 2020 20:16:43 +0000
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
To:     "Bao D. Nguyen" <nguyenb@codeaurora.org>, cang@codeaurora.org,
        asutoshd@codeaurora.org, linux-scsi@vger.kernel.org
Cc:     "Martin K . Petersen" <martin.petersen@oracle.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bart Van Assche <bvanassche@acm.org>,
        open list <linux-kernel@vger.kernel.org>,
        Avri Altman <avri.altman@wdc.com>,
        Nitin Rawat <nitirawa@codeaurora.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        linux-arm-msm@vger.kernel.org, Bean Huo <beanhuo@micron.com>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH v1 1/1] scsi: ufshcd: Allow zero value setting to Auto-Hibernate Timer
Date:   Tue, 15 Sep 2020 16:16:28 -0400
Message-Id: <160020074001.8134.17106566926326678659.b4-ty@oracle.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <b141cfcd7998b8933635828b56fbb64f8ad4d175.1598661071.git.nguyenb@codeaurora.org>
References: <b141cfcd7998b8933635828b56fbb64f8ad4d175.1598661071.git.nguyenb@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9745 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=707 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009150158
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9745 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 mlxlogscore=722
 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009150157
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 28 Aug 2020 18:05:13 -0700, Bao D. Nguyen wrote:

> The zero value Auto-Hibernate Timer is a valid setting, and it
> indicates the Auto-Hibernate feature being disabled. Correctly
> support this setting. In addition, when this value is queried
> from sysfs, read from the host controller's register and return
> that value instead of using the RAM value.

Applied to 5.10/scsi-queue, thanks!

[1/1] scsi: ufshcd: Allow specifying an Auto-Hibernate Timer value of zero
      https://git.kernel.org/mkp/scsi/c/499f7a966092

-- 
Martin K. Petersen	Oracle Linux Engineering
