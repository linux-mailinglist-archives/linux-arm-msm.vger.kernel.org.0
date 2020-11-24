Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 968E92C1CB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 05:31:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728724AbgKXEbQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 23:31:16 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:46510 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726039AbgKXEbP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 23:31:15 -0500
X-Greylist: delayed 4971 seconds by postgrey-1.27 at vger.kernel.org; Mon, 23 Nov 2020 23:31:15 EST
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AO35Mfo028996;
        Tue, 24 Nov 2020 03:08:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : mime-version :
 content-type; s=corp-2020-01-29;
 bh=z+f2roqdjBDs+WQyM/1a5Y3zBTJyjDhmrmR83masnk0=;
 b=hWFXiO6gcOSz46PjoHdM1dL60J56No4x+5x6KFB/O67KhMWylP4eiDGqzpZDhGUx31Vm
 dy54l/JvjXsCVrMc9ycrDWGMzLXJKcd+Kv2O47Cyt//jr7A+k9O6r9xEyW0a9dKJ3tEt
 AeHzWO4jJm+xZ7O3UHtChhn9z5HRZu+WwG8C1KuOU3Mj67N/1/IBZsZlqvl6MgKVKX+V
 0K0c9KhENZZ4QTe39h6vSXAq/Tie7wsv2INS+C8edpmUQDAzt9dqcSKDQ9ukZev9kNdN
 4R5zjbuINpNrC8DtKNP2kZo9SlT9dkWIzaFNi4xMMd34db8GbT3ESTWQvR6ov8g54t8c 1Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 34xtaqkvmv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Nov 2020 03:08:10 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AO2xcLF132902;
        Tue, 24 Nov 2020 03:08:09 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 34yx8j8yen-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 24 Nov 2020 03:08:09 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AO3866r011202;
        Tue, 24 Nov 2020 03:08:06 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 23 Nov 2020 19:08:06 -0800
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Can Guo <cang@codeaurora.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Bean Huo <beanhuo@micron.com>, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] scsi: ufs: Adjust logic in common ADAPT helper
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1eekjo3jm.fsf@ca-mkp.ca.oracle.com>
References: <20201121044810.507288-1-bjorn.andersson@linaro.org>
Date:   Mon, 23 Nov 2020 22:08:03 -0500
In-Reply-To: <20201121044810.507288-1-bjorn.andersson@linaro.org> (Bjorn
        Andersson's message of "Fri, 20 Nov 2020 20:48:10 -0800")
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9814 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 suspectscore=1
 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011240017
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9814 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 phishscore=0
 mlxlogscore=999 clxscore=1011 suspectscore=1 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011240017
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Bjorn,

> The introduction of ufshcd_dme_configure_adapt() refactored out
> duplication from the Mediatek and Qualcomm drivers.

Applied to 5.11/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
