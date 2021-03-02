Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D188732B2EE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Mar 2021 04:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242552AbhCCBQW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Mar 2021 20:16:22 -0500
Received: from z11.mailgun.us ([104.130.96.11]:58140 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1580062AbhCBRWz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Mar 2021 12:22:55 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614705725; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=i6HWitAvfuibUOrEhE9hWqjcYM7rHuJywCh3nQMG6cA=; b=P75gxfee+KISkKX+PZOFiiOXExoVsZKAIrb60kOGrIpSWi/2M+lVQlcDcVfpyZzmA7jaLXx7
 OxFCLiIkhHrjD16hLyzxb22RZnJVqij+na/mKSQo01eTCaX/AxS4HbNyJiQr/qBLtJLb+iui
 eTwNWuKCAJHyt7AHHVfzmXNy61Y=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 603e65bf4fd7814d5f8c7565 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Mar 2021 16:20:15
 GMT
Sender: asutoshd=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BC0CCC4346F; Tue,  2 Mar 2021 16:20:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from stor-presley.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: asutoshd)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1E9ACC433C6;
        Tue,  2 Mar 2021 16:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1E9ACC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Date:   Tue, 2 Mar 2021 08:20:10 -0800
From:   Asutosh Das <asutoshd@codeaurora.org>
To:     Adrian Hunter <adrian.hunter@intel.com>
Cc:     cang@codeaurora.org, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
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
        Kiwoong Kim <kwmad.kim@samsung.com>,
        Bean Huo <beanhuo@micron.com>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Satya Tangirala <satyat@google.com>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." 
        <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v9 1/2] scsi: ufs: Enable power management for wlun
Message-ID: <20210302162010.GH12147@stor-presley.qualcomm.com>
References: <cover.1614655058.git.asutoshd@codeaurora.org>
 <b291bb65fadc9c828cbcb4ffb81cfa1ee47b82be.1614655058.git.asutoshd@codeaurora.org>
 <d17e52e0-cb50-50ee-accb-458b318014e5@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <d17e52e0-cb50-50ee-accb-458b318014e5@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 02 2021 at 06:14 -0800, Adrian Hunter wrote:
>On 2/03/21 5:21 am, Asutosh Das wrote:
>> During runtime-suspend of ufs host, the scsi devices are
>> already suspended and so are the queues associated with them.
>> But the ufs host sends SSU to wlun during its runtime-suspend.
>> During the process blk_queue_enter checks if the queue is not in
>> suspended state. If so, it waits for the queue to resume, and never
>> comes out of it.
>> The commit
>> (d55d15a33: scsi: block: Do not accept any requests while suspended)
>> adds the check if the queue is in suspended state in blk_queue_enter().
>>
>> Call trace:
>>  __switch_to+0x174/0x2c4
>>  __schedule+0x478/0x764
>>  schedule+0x9c/0xe0
>>  blk_queue_enter+0x158/0x228
>>  blk_mq_alloc_request+0x40/0xa4
>>  blk_get_request+0x2c/0x70
>>  __scsi_execute+0x60/0x1c4
>>  ufshcd_set_dev_pwr_mode+0x124/0x1e4
>>  ufshcd_suspend+0x208/0x83c
>>  ufshcd_runtime_suspend+0x40/0x154
>>  ufshcd_pltfrm_runtime_suspend+0x14/0x20
>>  pm_generic_runtime_suspend+0x28/0x3c
>>  __rpm_callback+0x80/0x2a4
>>  rpm_suspend+0x308/0x614
>>  rpm_idle+0x158/0x228
>>  pm_runtime_work+0x84/0xac
>>  process_one_work+0x1f0/0x470
>>  worker_thread+0x26c/0x4c8
>>  kthread+0x13c/0x320
>>  ret_from_fork+0x10/0x18
>>
>> Fix this by registering ufs device wlun as a scsi driver and
>> registering it for block runtime-pm. Also make this as a
>> supplier for all other luns. That way, this device wlun
>> suspends after all the consumers and resumes after
>> hba resumes.
>>
>> Co-developed-by: Can Guo <cang@codeaurora.org>
>> Signed-off-by: Can Guo <cang@codeaurora.org>
>> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
>> ---
>
>Now we need either to move the suspend/resume vops from
>ufshcd_suspend/resume to __ufshcd_wl_suspend/resume, assuming that
>would work for existing implementations of those callbacks,
>or otherwise create new vops ->wl_suspend() / ->wl_resume(), and
>then split the existing implementations of those callbacks.
>
>ufs_intel_resume() now needs to be invoked from __ufshcd_wl_resume().
>I am not sure about the others:
>
>	exynos_ufs_suspend()
>	exynos_ufs_resume()
>	ufs_hisi_suspend()
>	ufs_hisi_resume()
>	ufs_mtk_suspend()
>	ufs_mtk_resume()
>	ufs_qcom_suspend()
>	ufs_qcom_resume()
>

Thanks. I'll change this in the next version.

-asd
