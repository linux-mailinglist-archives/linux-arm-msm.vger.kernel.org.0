Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5B659543A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2019 04:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729048AbfHTCSo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Aug 2019 22:18:44 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:54912 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728800AbfHTCSo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Aug 2019 22:18:44 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7K2DWtX171795;
        Tue, 20 Aug 2019 02:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2019-08-05;
 bh=R+nxC1vu9PBhn++2Hg2NA4TXwbUz28rvlXSnl4sXdTw=;
 b=HHkuKEs5980cxQoZMFy3Hbtfo6mCf08NEx46RNDlVlMtxalqpDYRtUB19HxS7y1Y+mvj
 nyNesSp95ZvHodPRzNh9m+BTHwGMqfBssziJj0WwQx1X3T7yuHXvs1T9DLssHibz3QS/
 C6TqY7ooUGhxk7MSfskq9IWihyTkm1bgk+fg92lkKwjOfLdscq58Kk83EiM91XtSmDwy
 4ze+axSkMtnSyUqM4OWZbw4VQ12flpyI+B5VVVeHTNGabc0CTFkLcT1iaIVIWIIRwceg
 1PAYWR+xIiXQYjFZAqEkZK0bDouCbQb2j45200mn4+h5tprkg+LyofZ1ROgiQmoWX3xK xA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 2ue9hpb124-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 20 Aug 2019 02:18:35 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7K2IU4i172601;
        Tue, 20 Aug 2019 02:18:34 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 2ug2681ryy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 20 Aug 2019 02:18:34 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x7K2IL74008866;
        Tue, 20 Aug 2019 02:18:21 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 19 Aug 2019 19:18:21 -0700
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     agross@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        pedrom.sousa@synopsys.com, jejb@linux.ibm.com,
        martin.peterson@oracle.com, linux-scsi@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] scsi: ufs-qcom: Make structure ufs_hba_qcom_vops constant
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20190819075557.1547-1-nishkadg.linux@gmail.com>
Date:   Mon, 19 Aug 2019 22:18:18 -0400
In-Reply-To: <20190819075557.1547-1-nishkadg.linux@gmail.com> (Nishka
        Dasgupta's message of "Mon, 19 Aug 2019 13:25:57 +0530")
Message-ID: <yq1zhk4y3yt.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9354 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908200019
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9354 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908200018
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Nishka,

> Static structure ufs_hba_qcom_vops, of type ufs_hba_variant_ops, is used
> only once, when it is passed as the second argument to function
> ufshcd_pltfrm_init(). In the definition of ufshcd_pltfrm_init(), its
> second parameter (corresponding to ufs_hba_qcom_vops) is declared as
> constant. Hence declare ufs_hba_qcom_vops itself constant as well to
> protect it from unintended modification.
> Issue found with Coccinelle.

Applied to 5.4/scsi-queue, thanks.

-- 
Martin K. Petersen	Oracle Linux Engineering
