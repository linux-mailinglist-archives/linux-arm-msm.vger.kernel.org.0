Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA9022A764F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 05:22:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbgKEEWS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Nov 2020 23:22:18 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:59062 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726225AbgKEEWS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Nov 2020 23:22:18 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A54Jh4m146131;
        Thu, 5 Nov 2020 04:21:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=Q/Zxvd8Y2ETDhPysP3vR7GgbkKkwEG1Cl5eXaCf/fe8=;
 b=xzBkHHw7LXUkd0oDkDaZx33aT+UMvLcF3XsZBEmSc6gdJTky7+BxLaq5trrunXYiwZnJ
 BfBvjOWewoWvXsJ7b2x4XfTaQXdGwWpbC2L/QtVd8hoVkYTjRuIIfGXAUpgKXHH2Vd8l
 MHGHq/0J3qj+UDyQIwFWXSoFJiPYPzHPhu3fHV7kAbgWlrrteh6Q/9cQJtC1bljKUezj
 i63C878rWpa2SUjTF57R9PKApvCS1pOj2O9hiWnan1F7tzS9x71UFMe/6bBxz/CrD5Ds
 crX3r+pLQEsyNM0cSQP7tfq4sS4QZpAuEIWah+OCBd/P08e+e4phLd4Pb5dGuEXA5z1g eg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 34hhvchya2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 05 Nov 2020 04:21:57 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A54Kkhn020897;
        Thu, 5 Nov 2020 04:21:57 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 34hw0m0e9k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 05 Nov 2020 04:21:57 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0A54Lo4M017180;
        Thu, 5 Nov 2020 04:21:50 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 04 Nov 2020 20:21:50 -0800
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
To:     cang@codeaurora.org, Asutosh Das <asutoshd@codeaurora.org>,
        linux-scsi@vger.kernel.org
Cc:     "Martin K . Petersen" <martin.petersen@oracle.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        linux-arm-msm@vger.kernel.org,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Bart Van Assche <bvanassche@acm.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Satya Tangirala <satyat@google.com>,
        Bean Huo <beanhuo@micron.com>
Subject: Re: [PATCH v2 1/2] scsi: ufs: Put hba into LPM during clk gating
Date:   Wed,  4 Nov 2020 23:21:45 -0500
Message-Id: <160455005256.26277.2812826866099587703.b4-ty@oracle.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <52198e70bff750632740d78678a815256d697e43.1603825776.git.asutoshd@codeaurora.org>
References: <52198e70bff750632740d78678a815256d697e43.1603825776.git.asutoshd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9795 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011050030
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9795 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 bulkscore=0 phishscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011050030
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 27 Oct 2020 12:10:36 -0700, Asutosh Das wrote:

> During clock gating, after clocks are disabled,
> put hba into LPM to save more power.

Applied to 5.11/scsi-queue, thanks!

[1/2] scsi: ufs: Put HBA into LPM during clk gating
      https://git.kernel.org/mkp/scsi/c/dd7143e27cb7
[2/2] scsi: ufs: qcom: Enable aggressive power collapse for ufs HBA
      https://git.kernel.org/mkp/scsi/c/61906fd465c0

-- 
Martin K. Petersen	Oracle Linux Engineering
