Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1D44AC939
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Sep 2019 22:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727012AbfIGUhn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Sep 2019 16:37:43 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:52896 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727309AbfIGUhn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Sep 2019 16:37:43 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x87KZchF144523;
        Sat, 7 Sep 2019 20:37:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2019-08-05;
 bh=YjoYw3aQzOWr1pqzH2/6HQy6mfi6IVme6e+omNqyU9o=;
 b=AncImTwiwXWZjexz9fR5bTtFlcO7TtfBrY88sPYHoQr9g5MrUMUrbB8E6fCFVU4dMXGa
 ViSD/TLp2DGr6QGRKnY/ff/gpI1so8Use74WTo6fTXlMoG0gqqlgZtd6DdzNVy6nceYh
 VtpZr5SAefZTGsKOmRT5nTLmtfyJHvmlPZ3o/hhvK2Rb3vqs1+8TFISeq0c8jALN7vEZ
 /Puxw7egmyjeHvgXAbohxrjwaNLA4uTPw5cvMZcl0njqcThzXk1GhDhdHUQ6vG73hlsl
 aBtqKKCneqH3yE93V7bgvDqGXdYlSsnTksx6J5H4zA5Blo9GEfsitVMK6jDLmsIYdqQ4 ow== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 2uvkp3r07n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 07 Sep 2019 20:37:27 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x87KXdk0136776;
        Sat, 7 Sep 2019 20:37:27 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 2uv3wjmjra-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 07 Sep 2019 20:37:27 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x87KbPb9011835;
        Sat, 7 Sep 2019 20:37:25 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sat, 07 Sep 2019 13:37:24 -0700
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Bean Huo <beanhuo@micron.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 0/3] Qualcomm UFS device reset support
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20190828191756.24312-1-bjorn.andersson@linaro.org>
Date:   Sat, 07 Sep 2019 16:37:21 -0400
In-Reply-To: <20190828191756.24312-1-bjorn.andersson@linaro.org> (Bjorn
        Andersson's message of "Wed, 28 Aug 2019 12:17:53 -0700")
Message-ID: <yq1d0gbkflq.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9373 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=872
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909070224
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9373 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=934 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909070224
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Bjorn,

> This series adds a new ufs vops to allow platform specific methods for
> resetting an attached UFS device, then implements this for the
> Qualcomm driver.  This reset seems to be necessary for the majority of
> Dragonboard845c devices.

Applied to 5.4/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
