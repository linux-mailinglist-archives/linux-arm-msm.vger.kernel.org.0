Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 504C64B045
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2019 04:57:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729042AbfFSC50 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 22:57:26 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:42672 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbfFSC50 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 22:57:26 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5J2mvxB063861;
        Wed, 19 Jun 2019 02:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2018-07-02;
 bh=jOw2OdivlqkkGBM0Pa1lRxjpLqeeu3++qv7MZf0yotc=;
 b=uCOy5cIQ0+DHvEuvHOzF2o3VVdQD8a8oYwmMScOnE8ueSHNvOMxtUCbOjY3dkEOyQ7uc
 mpY1t9Snub/olPyosCfiy5Vhkq7IEfInuSf8G5NWhQVYXsUVYGchVJjvu7KgTRJu3tzY
 Ht52ASqKjr7GqEsGjsF3UWnq+uLs43PdArRbadBuddHoV6l4d8Hf3v8gKUMq6bg5f/FS
 Sk/7HdKDMuOdWKRL6HiGnWbt+3lFaOn/KwbdfrzedHmpTuowUeHLVpvcHV2ir9pdukWw
 p6vjQjFwthwslzJ33gModuxx2arm+vFpZcuEsbLiYgAzurBwJk0yTaohb4uhQlsBQ6V0 8A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 2t78098qmn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 19 Jun 2019 02:57:13 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5J2uXQE104616;
        Wed, 19 Jun 2019 02:57:13 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 2t77ynjw1r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 19 Jun 2019 02:57:12 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5J2vA4T016828;
        Wed, 19 Jun 2019 02:57:10 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 18 Jun 2019 19:57:09 -0700
To:     Lee Jones <lee.jones@linaro.org>
Cc:     agross@kernel.org, david.brown@linaro.org, alim.akhtar@samsung.com,
        avri.altman@wdc.com, pedrom.sousa@synopsys.com, jejb@linux.ibm.com,
        martin.petersen@oracle.com, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, ard.biesheuvel@linaro.org,
        jlhugo@gmail.com, bjorn.andersson@linaro.org
Subject: Re: [PATCH 1/1] scsi: ufs-qcom: Add support for platforms booting ACPI
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20190617115454.3226-1-lee.jones@linaro.org>
Date:   Tue, 18 Jun 2019 22:57:06 -0400
In-Reply-To: <20190617115454.3226-1-lee.jones@linaro.org> (Lee Jones's message
        of "Mon, 17 Jun 2019 12:54:54 +0100")
Message-ID: <yq1zhmeuvst.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9292 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=836
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906190021
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9292 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=888 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906190021
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Lee,

> New Qualcomm AArch64 based laptops are now available which use UFS
> as their primary data storage medium.  These devices are supplied
> with ACPI support out of the box.  This patch ensures the Qualcomm
> UFS driver will be bound when the "QCOM24A5" H/W device is
> advertised as present.

Applied to 5.3/scsi-queue. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
