Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 886B53592BC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 05:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233207AbhDIDNS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 23:13:18 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:49934 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233157AbhDIDNQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 23:13:16 -0400
Received: from epcas3p3.samsung.com (unknown [182.195.41.21])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20210409031302epoutp0323b6053d0115fd8fcf5b897d4ffac37e~0EgXmX9TO0796607966epoutp03U
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Apr 2021 03:13:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20210409031302epoutp0323b6053d0115fd8fcf5b897d4ffac37e~0EgXmX9TO0796607966epoutp03U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1617937982;
        bh=W56ar/RkCbAlY+agUi8Yd9X8F+LYYJguXbtIXgcqiOQ=;
        h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
        b=lvHAhB/BpIhDUT8TU0bQMtmC2glwg547zywjiFMmBxt7zSbZEWfMSgxzfuiQ0STOv
         uBCL/WfpDKgQrGkb0rVKtKiBkGkFdVtiPr2hA/sY9w1K+1WZpZDl1LJaPqzmgLr+Mj
         BU7OGSEtDwJD3c9V5o2xsyUWlkHSoOwVO2V1A3gk=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas3p4.samsung.com (KnoxPortal) with ESMTP id
        20210409031301epcas3p472d94ea873f2bd32cf6e09b8e8913909~0EgWzy-Xa3080730807epcas3p48;
        Fri,  9 Apr 2021 03:13:01 +0000 (GMT)
Received: from epcpadp4 (unknown [182.195.40.18]) by epsnrtp4.localdomain
        (Postfix) with ESMTP id 4FGjqx4pV3z4x9Q1; Fri,  9 Apr 2021 03:13:01 +0000
        (GMT)
Mime-Version: 1.0
Subject: RE: [PATCH v17 1/2] scsi: ufs: Enable power management for wlun
Reply-To: daejun7.park@samsung.com
Sender: Daejun Park <daejun7.park@samsung.com>
From:   Daejun Park <daejun7.park@samsung.com>
To:     "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
CC:     Asutosh Das <asutoshd@codeaurora.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        ALIM AKHTAR <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Bean Huo <beanhuo@micron.com>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Yue Hu <huyue2@yulong.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Satya Tangirala <satyat@google.com>,
        open list <linux-kernel@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <1b3d53dad245a7166f3f67a4c65f3a731e6600b3.1617893198.git.asutoshd@codeaurora.org>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <1891546521.01617937981650.JavaMail.epsvc@epcpadp4>
Date:   Fri, 09 Apr 2021 11:27:31 +0900
X-CMS-MailID: 20210409022731epcms2p117b1a94665375910a2f9b6265acdb0fb
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20210408145007epcas2p1accfbd653b2e1318b2722c1f5661c1e0
References: <1b3d53dad245a7166f3f67a4c65f3a731e6600b3.1617893198.git.asutoshd@codeaurora.org>
        <cover.1617893198.git.asutoshd@codeaurora.org>
        <CGME20210408145007epcas2p1accfbd653b2e1318b2722c1f5661c1e0@epcms2p1>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Asutosh Das,

>During runtime-suspend of ufs host, the scsi devices are
>already suspended and so are the queues associated with them.
>But the ufs host sends SSU (START_STOP_UNIT) to wlun
>during its runtime-suspend.
>During the process blk_queue_enter checks if the queue is not in
>suspended state. If so, it waits for the queue to resume, and never
>comes out of it.
>The commit
>(d55d15a33: scsi: block: Do not accept any requests while suspended)
>adds the check if the queue is in suspended state in blk_queue_enter().
> 
>Call trace:
> __switch_to+0x174/0x2c4
> __schedule+0x478/0x764
> schedule+0x9c/0xe0
> blk_queue_enter+0x158/0x228
> blk_mq_alloc_request+0x40/0xa4
> blk_get_request+0x2c/0x70
> __scsi_execute+0x60/0x1c4
> ufshcd_set_dev_pwr_mode+0x124/0x1e4
> ufshcd_suspend+0x208/0x83c
> ufshcd_runtime_suspend+0x40/0x154
> ufshcd_pltfrm_runtime_suspend+0x14/0x20
> pm_generic_runtime_suspend+0x28/0x3c
> __rpm_callback+0x80/0x2a4
> rpm_suspend+0x308/0x614
> rpm_idle+0x158/0x228
> pm_runtime_work+0x84/0xac
> process_one_work+0x1f0/0x470
> worker_thread+0x26c/0x4c8
> kthread+0x13c/0x320
> ret_from_fork+0x10/0x18
> 
>Fix this by registering ufs device wlun as a scsi driver and
>registering it for block runtime-pm. Also make this as a
>supplier for all other luns. That way, this device wlun
>suspends after all the consumers and resumes after
>hba resumes.
> 
>Co-developed-by: Can Guo <cang@codeaurora.org>
>Signed-off-by: Can Guo <cang@codeaurora.org>
>Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
>---
> drivers/scsi/ufs/cdns-pltfrm.c     |   2 +
> drivers/scsi/ufs/tc-dwc-g210-pci.c |   2 +
> drivers/scsi/ufs/ufs-debugfs.c     |   6 +-
> drivers/scsi/ufs/ufs-debugfs.h     |   2 +-
> drivers/scsi/ufs/ufs-exynos.c      |   2 +
> drivers/scsi/ufs/ufs-hisi.c        |   2 +
> drivers/scsi/ufs/ufs-mediatek.c    |  12 +-
> drivers/scsi/ufs/ufs-qcom.c        |   2 +
> drivers/scsi/ufs/ufs_bsg.c         |   6 +-
> drivers/scsi/ufs/ufshcd-pci.c      |  36 +--
> drivers/scsi/ufs/ufshcd.c          | 642 ++++++++++++++++++++++++++-----------
> drivers/scsi/ufs/ufshcd.h          |   6 +
> include/trace/events/ufs.h         |  20 ++
> 13 files changed, 509 insertions(+), 231 deletions(-)

In this patch, you changed pm_runtime_{get, put}_sync to scsi_autopm_{get, put}_device.
But, scsi_autopm_get_device() calls pm_runtime_put_sync() in case of error
of pm_runtime_get_sync(). So, pm_runtime_put_sync() can be called twice if
scsi_autopm_get_device has error.

Thanks,
Daejun

