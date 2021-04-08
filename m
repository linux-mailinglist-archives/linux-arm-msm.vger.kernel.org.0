Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E3B4357AE3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 05:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbhDHDsP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 23:48:15 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:38067 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbhDHDsO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 23:48:14 -0400
Received: from epcas3p1.samsung.com (unknown [182.195.41.19])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20210408034802epoutp01869ae8b5eea9bba960f8b421254cc9d4~zxVo-q-BZ2876828768epoutp01G
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Apr 2021 03:48:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20210408034802epoutp01869ae8b5eea9bba960f8b421254cc9d4~zxVo-q-BZ2876828768epoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1617853682;
        bh=9fGWhB+v9isEydrW5hTeP0L3q8QLyyS/uf5D/3S4w2s=;
        h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
        b=WYa/F7WOwIriGIIZWQa7PLoAQSWZw/h/iNm2R0xyu3wInkNqbkvQ3UlBXzlI/BVep
         bdBQorHvknQTpYrbYJHrtaSG3n7CzW7sQNSV+eSrZNCpY9m7IhYJXRx0GPv0e5oI4A
         O3K6QnDDRwE8GJVdTAyFZIcqrLHoHRLTco2WCJv4=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas3p4.samsung.com (KnoxPortal) with ESMTP id
        20210408034801epcas3p4bb2b24f6fb915bd6a0353feb079e95ac~zxVoMnzSu0757807578epcas3p4h;
        Thu,  8 Apr 2021 03:48:01 +0000 (GMT)
Received: from epcpadp4 (unknown [182.195.40.18]) by epsnrtp4.localdomain
        (Postfix) with ESMTP id 4FG6fn4jfMz4x9Pq; Thu,  8 Apr 2021 03:48:01 +0000
        (GMT)
Mime-Version: 1.0
Subject: RE: [PATCH v16 1/2] scsi: ufs: Enable power management for wlun
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
        Yue Hu <huyue2@yulong.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Satya Tangirala <satyat@google.com>,
        open list <linux-kernel@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <7be92c0bc3e5f07d5e17bd3b78c01496686ef31e.1617818557.git.asutoshd@codeaurora.org>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <2038148563.21617853681644.JavaMail.epsvc@epcpadp4>
Date:   Thu, 08 Apr 2021 12:43:52 +0900
X-CMS-MailID: 20210408034352epcms2p4187835e84c3282cb60e17258007ba145
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20210407180927epcas2p480eb9ff12823e1740e4188497c3a11ca
References: <7be92c0bc3e5f07d5e17bd3b78c01496686ef31e.1617818557.git.asutoshd@codeaurora.org>
        <cover.1617818557.git.asutoshd@codeaurora.org>
        <CGME20210407180927epcas2p480eb9ff12823e1740e4188497c3a11ca@epcms2p4>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Asutosh Das,

>+static inline bool is_rpmb_wlun(struct scsi_device *sdev)
>+{
>+        return (sdev->lun == ufshcd_upiu_wlun_to_scsi_wlun(UFS_UPIU_RPMB_WLUN));
>+}
>+
>+static inline bool is_device_wlun(struct scsi_device *sdev)
>+{
>+        return (sdev->lun ==
>+                ufshcd_upiu_wlun_to_scsi_wlun(UFS_UPIU_UFS_DEVICE_WLUN));
>+}
>+
> static void ufshcd_init_lrb(struct ufs_hba *hba, struct ufshcd_lrb *lrb, int i)
> {
>         struct utp_transfer_cmd_desc *cmd_descp = hba->ucdl_base_addr;
>@@ -4099,11 +4113,11 @@ void ufshcd_auto_hibern8_update(struct ufs_hba *hba, u32 ahit)
>         spin_unlock_irqrestore(hba->host->host_lock, flags);
> 
>         if (update && !pm_runtime_suspended(hba->dev)) {

Could it be changed hba->sdev_ufs_device->sdev_gendev instead of hba->dev?

Thanks,
Daejun
