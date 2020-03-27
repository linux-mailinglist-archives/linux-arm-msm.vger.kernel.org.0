Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD421194ED3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2020 03:18:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbgC0CSy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Mar 2020 22:18:54 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:50604 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbgC0CSy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Mar 2020 22:18:54 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02R2DWZ6096017;
        Fri, 27 Mar 2020 02:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2020-01-29;
 bh=43NvStvLq04JtR29R4pxXPqQtDwsNcSwQ6zn2BbVKPg=;
 b=K5Rm0L6h2oRhC/5KmyMpIQJkGGMsDyBh/7WIawFt87fkXhUN/0ONdPhgNtscTCZIjH63
 BGhgO3Am424NUVhHEfOFzTR8uEdk4Z9t7oe0rUMlGTUkh3mmEHzD72zd6G7RNLHTRtT/
 +sXRoOHCH4e6hrzougia9/PMb0lMn1hSn5jgxxejXTRWK/dCqQ+12BVx1sqkFo/k8w4s
 NOK4tY11xVn8TpXkrJ5IsVw0q+JY/EBE3c3lR0+DeObi28Ugz2E9feJAo3SIK2oMQjYL
 iG/WYi6O46ES9jey+rqa/02LmQaqj1vpXOfo6eISVYxTje6YasWdDphtBtq9Kq6OGnUn Xw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 2ywavmjxs6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 27 Mar 2020 02:18:51 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02R2GdUp020280;
        Fri, 27 Mar 2020 02:18:50 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 30073f6gby-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 27 Mar 2020 02:18:50 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02R2Int8025663;
        Fri, 27 Mar 2020 02:18:49 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 26 Mar 2020 19:18:48 -0700
To:     Asutosh Das <asutoshd@codeaurora.org>
Cc:     Avri.Altman@wdc.com, cang@codeaurora.org,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 0/3] UFS Clock Scaling fixes and enhancements
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <cover.1585160616.git.asutoshd@codeaurora.org>
Date:   Thu, 26 Mar 2020 22:18:46 -0400
In-Reply-To: <cover.1585160616.git.asutoshd@codeaurora.org> (Asutosh Das's
        message of "Wed, 25 Mar 2020 11:28:59 -0700")
Message-ID: <yq1mu82ee0p.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9572 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=967 adultscore=0
 suspectscore=0 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003270017
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9572 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003270016
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Asutosh,

> Enhancements to clock-scaling parameters.  Few bug fixes to
> clock-scaling.

Applied to 5.7/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
