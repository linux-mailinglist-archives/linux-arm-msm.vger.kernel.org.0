Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EE5B31CF26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Feb 2021 18:38:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230469AbhBPRhZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Feb 2021 12:37:25 -0500
Received: from z11.mailgun.us ([104.130.96.11]:12878 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230436AbhBPRhV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Feb 2021 12:37:21 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613497017; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=fkRbx/bVroOWweuzoO/X7+7MoIKD1jrElbt9ifzl6zE=; b=jZL7FA1bvDX3LdEoL/TaA+vIYVM+K4x5geIH4esnIyCT2TIg+FkY0U+p1AsoZNWc737B1D75
 estcLMcBnStgWEsJJo5Ursl4iSrHTYTrhfs5kbc/xL++xKv5ceh4cjvv3EQoLVIAnrp3+q3f
 tIlm63WSSIzKzXtglzml2X/P+LQ=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 602c02b606bddda9df2192eb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Feb 2021 17:36:54
 GMT
Sender: asutoshd=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2B975C43467; Tue, 16 Feb 2021 17:36:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from stor-presley.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: asutoshd)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6BA6FC433C6;
        Tue, 16 Feb 2021 17:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6BA6FC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Date:   Tue, 16 Feb 2021 09:36:46 -0800
From:   Asutosh Das <asutoshd@codeaurora.org>
To:     Avri Altman <Avri.Altman@wdc.com>
Cc:     "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Satya Tangirala <satyat@google.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v3 1/1] scsi: ufs: Enable power management for wlun
Message-ID: <20210216173646.GA35819@stor-presley.qualcomm.com>
References: <cover.1613070911.git.asutoshd@codeaurora.org>
 <eed327cdace40d1e1d706da5b0fa64ea4ee99422.1613070912.git.asutoshd@codeaurora.org>
 <DM6PR04MB65758E0EBF4171FD6E1CF0CFFC8A9@DM6PR04MB6575.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <DM6PR04MB65758E0EBF4171FD6E1CF0CFFC8A9@DM6PR04MB6575.namprd04.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Feb 13 2021 at 13:37 -0800, Avri Altman wrote:
>> +       } else {
>Is it possible to get here?
>Scsi_scan_host is called only after successful add_wluns

It looks so.
scsi 0:0:0:49488: Link setup for lun - ufshcd_setup_links
[...]
Call trace:
dump_backtrace+0x0/0x1d4
show_stack+0x18/0x24
dump_stack+0xc4/0x144
ufshcd_setup_links+0xd8/0x100
ufshcd_slave_alloc+0x134/0x1a0
scsi_alloc_sdev+0x1c0/0x230
scsi_probe_and_add_lun+0xc0/0xd48
__scsi_add_device+0xc0/0x138
ufshcd_scsi_add_wlus+0x30/0x1c0
ufshcd_async_scan+0x58/0x240
async_run_entry_fn+0x48/0x128
process_one_work+0x1f0/0x470
worker_thread+0x26c/0x4c8
kthread+0x13c/0x320
ret_from_fork+0x10/0x18

>
>> +               /* device wlun is probed */
>> +               hba->luns_avail--;
>> +       }
>> +}
>> +
>
>
>>
>>  /**
>> @@ -7254,6 +7312,14 @@ static int ufshcd_scsi_add_wlus(struct ufs_hba
>> *hba)
>>                 goto out;
>>         }
>>         ufshcd_blk_pm_runtime_init(hba->sdev_ufs_device);
>> +       /*
>> +        * A pm_runtime_put_sync is invoked when this device enables
>> blk_pm_runtime
>> +        * & would suspend the device-wlun upon timer expiry.
>> +        * But suspending device wlun _may_ put the ufs device in the pre-defined
>> +        * low power mode (SSU <rpm_lvl>). Probing of other luns may fail then.
>> +        * Don't allow this suspend until all the luns have been probed.
>Maybe add one more sentence: see pm_runtime_mark_last_busy in ufshcd_setup_links
Done.

>
>
>
>> -       ufshcd_clear_ua_wluns(hba);
>Are there any callers left to ufshcd_clear_ua_wluns?
>Can it be removed?
Let me check.

>
>> +       if (hba->wlun_dev_clr_ua)
>> +               ufshcd_clear_ua_wlun(hba, UFS_UPIU_UFS_DEVICE_WLUN);
>>
>>         cmd[4] = pwr_mode << 4;
