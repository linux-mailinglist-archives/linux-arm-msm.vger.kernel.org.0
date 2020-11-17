Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 234E52B58E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Nov 2020 05:41:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbgKQEjy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 23:39:54 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:39960 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbgKQEjy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 23:39:54 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AH4dZCx061348;
        Tue, 17 Nov 2020 04:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : mime-version :
 content-type; s=corp-2020-01-29;
 bh=iV1Irdy90TGwIWuxZ6c5UvhhF2Z8YiIYRS9pUssI4no=;
 b=f7y8oGGtskCozgw+tDQQvezLP72gOEmxAdsGwLVXSYsFM5UVujwfQGjgogALo7GXp8QO
 FYcI0GPSOrKzWG33tVVUCcT5lm4YA+l4lhMEAsD/3eqy460pKUUY1Pj7/NBRCewqbdWh
 hFny6zmEu+e4Sc9p8rvpyB8cewOaW6U9wIo1m7hff3CGP49yL237VJDOD1AZ33xxP7+2
 tFpb51xdn5/dFonRGX6YaNWkVof5tiXy28hG1oulQ9rL5ycIAXk12OzKGOPRrUDG+KhC
 YJAF+81xQhxyLW0wmUYG/GzsLjpV/kTy9yZ4FO84i6uZMpqM84qfz+HuihHrV3E/nd4c Rg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 34t7vn0eq4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 17 Nov 2020 04:39:50 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AH4UV5k022361;
        Tue, 17 Nov 2020 04:37:50 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 34ts5vjmw3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 17 Nov 2020 04:37:50 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AH4bncb008422;
        Tue, 17 Nov 2020 04:37:49 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 16 Nov 2020 20:37:48 -0800
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Satya Tangirala <satyat@google.com>
Subject: Re: [PATCH] scsi: ufs-qcom: only select QCOM_SCM if SCSI_UFS_CRYPTO
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1h7po4mzw.fsf@ca-mkp.ca.oracle.com>
References: <20201114004754.235378-1-ebiggers@kernel.org>
Date:   Mon, 16 Nov 2020 23:37:47 -0500
In-Reply-To: <20201114004754.235378-1-ebiggers@kernel.org> (Eric Biggers's
        message of "Fri, 13 Nov 2020 16:47:54 -0800")
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9807 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 phishscore=0
 suspectscore=1 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=892
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011170033
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9807 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=922 suspectscore=1
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011170034
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Eric,

> QCOM_SCM is only needed to make the qcom_scm_*() calls in
> ufs-qcom-ice.c, which is only compiled when SCSI_UFS_CRYPTO=y.  So
> don't unnecessarily enable QCOM_SCM when SCSI_UFS_CRYPTO=n.

Applied to 5.11/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
