Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3DA313956
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 17:26:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234372AbhBHQZd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 11:25:33 -0500
Received: from so15.mailgun.net ([198.61.254.15]:57558 "EHLO so15.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234338AbhBHQZY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 11:25:24 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612801500; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=NDr/HPHdjO2ZWUoJtkzsAUeh5iN7eMmJUDu+B2PEZ9Q=; b=u3dvI+c/jV3TJyFUcgSvo98PWZBVHQe2qdmqf4DHu4aMetL7R8SPPmSvzlm9I9hurEcMIlfL
 rEUSev2yELPeT/qhplVN7GMi71SU4/BAyR6jdpofEMlVdxn5FEwfcVAWc6PGWOJW1qRjACb8
 0z4jizf6pHrEQW3A6AOMt3nDnK8=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 602165b9e3df861f4b4e65e8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 08 Feb 2021 16:24:25
 GMT
Sender: asutoshd=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F3332C433ED; Mon,  8 Feb 2021 16:24:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from stor-presley.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: asutoshd)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EC716C433CA;
        Mon,  8 Feb 2021 16:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EC716C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Date:   Mon, 8 Feb 2021 08:24:22 -0800
From:   Asutosh Das <asutoshd@codeaurora.org>
To:     Avri Altman <Avri.Altman@wdc.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        Bart Van Assche <bvanassche@acm.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
Subject: Re: [RFC PATCH v2 0/2] Fix deadlock in ufs
Message-ID: <20210208162422.GL37557@stor-presley.qualcomm.com>
References: <84a182cc-de9c-4d6d-2193-3a44e4c88c8b@codeaurora.org>
 <20210201214802.GB420232@rowland.harvard.edu>
 <20210202205245.GA8444@stor-presley.qualcomm.com>
 <20210202220536.GA464234@rowland.harvard.edu>
 <20210204001354.GD37557@stor-presley.qualcomm.com>
 <20210204194831.GA567391@rowland.harvard.edu>
 <20210204211424.GH37557@stor-presley.qualcomm.com>
 <DM6PR04MB6575692524202EC91E2A5480FCB29@DM6PR04MB6575.namprd04.prod.outlook.com>
 <20210205161102.GJ37557@stor-presley.qualcomm.com>
 <DM6PR04MB65759417507BA054F8CAE86AFCB19@DM6PR04MB6575.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <DM6PR04MB65759417507BA054F8CAE86AFCB19@DM6PR04MB6575.namprd04.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Feb 06 2021 at 11:24 -0800, Avri Altman wrote:
>> >Regardless of your above proposal, as for the issues you were witnessing with
>> rpmb,
>> >That started this RFC in the first place, and the whole clearing uac series for
>> that matter:
>> > "In order to conduct FFU or RPMB operations, UFS needs to clear UNIT
>> ATTENTION condition...."
>> >
>> >Functionally, This was already done for the device wlun, and only added the
>> rpmb wlun.
>> >
>> >Now you are trying to solve stuff because the rpmb is not provisioned.
>> >a) There should be no relation between response to request-sense command,
>> > and if the key is programmed or not. And
>> >b) rpmb is accessed from user-space.  If it is not provisioned, it should
>> processed the error (-7)
>> >    and realize that by itself.  And also, It only makes sense that if needed,
>> >    the access sequence will include  the request-sense command.
>> >
>> >Therefore, IMHO, just reverting Randall commit (1918651f2d7e) and fixing
>> the user-space code
>> >Should suffice.
>> >
>> >Thanks,
>> >Avri
>> >
>> Hi Avri
>>
>> Thanks.
>>
>> I don't think reverting 1918651f2d7e would fix this.
>>
>> [   12.182750] ufshcd-qcom 1d84000.ufshc: ufshcd_suspend: Setting power
>> mode
>> [   12.190467] ufshcd-qcom 1d84000.ufshc: wlun_dev_clr_ua: 0 <-- uac wasn't
>> sent
>> [   12.196735] ufshcd-qcom 1d84000.ufshc: Sending ssu
>> [   12.202412] scsi 0:0:0:49488: Queue rpm status b4 ssu: 2 <- sdev_ufs_device
>> queue is suspended
>> [   12.208613] ufshcd-qcom 1d84000.ufshc: Wait for resume - <-- deadlock!
>>
>> The issue is sending any command to any lun which is registered for blk
>> runtime-pm in ufs host's suspend path would deadlock; since, it'd try to resume
>> the ufs host in the same suspend calling sequence.
>Did you managed to bisect the commit that caused the regression?
No - I didn't bisect.

>Is it in the series that Bart referred to?
>
Yes - the debug points to that.

>Thanks,
>Avri
