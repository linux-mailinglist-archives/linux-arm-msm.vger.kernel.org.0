Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A1AD32D6B6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 16:34:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233745AbhCDPdI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 10:33:08 -0500
Received: from z11.mailgun.us ([104.130.96.11]:49111 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234913AbhCDPdG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 10:33:06 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614871962; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=yw6X0hE3R/LaSfjE+hVC/k0iGKiHH/AiRqtO+CmPa8M=; b=mbTW1o69pxKVTdvJzla6TeLIh9yN/fUAcl0ivnzOywN4Dr3tHDCxYyu3vbAUjhK52ZIx1cOv
 zX/JnDdiyEX4KL0/FXs+AwMZK1XatLlMh7UehRRiBPykEE6dsxOVi0xvmLxeMxp+xmGzu6jX
 5U2pPUHXWKFSlFzXM8cTtCkxnZ8=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6040fd772a5e6d1bfa9e1bb2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 04 Mar 2021 15:32:07
 GMT
Sender: asutoshd=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 213A5C43465; Thu,  4 Mar 2021 15:32:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from stor-presley.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: asutoshd)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C0A27C43461;
        Thu,  4 Mar 2021 15:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C0A27C43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Date:   Thu, 4 Mar 2021 07:32:04 -0800
From:   Asutosh Das <asutoshd@codeaurora.org>
To:     Adrian Hunter <adrian.hunter@intel.com>
Cc:     cang@codeaurora.org, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Nitin Rawat <nitirawa@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 2/2] ufs: sysfs: Resume the proper scsi device
Message-ID: <20210304153204.GI12147@stor-presley.qualcomm.com>
References: <cover.1614725302.git.asutoshd@codeaurora.org>
 <5d7c0cd1ff4bc5295015244f057d252fe9040993.1614725302.git.asutoshd@codeaurora.org>
 <9edf7047-4845-5bb5-3307-fa6e11e5c923@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <9edf7047-4845-5bb5-3307-fa6e11e5c923@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Mar 04 2021 at 23:45 -0800, Adrian Hunter wrote:
>On 3/03/21 12:52 am, Asutosh Das wrote:
>> Resumes the actual scsi device the unit descriptor of which
>> is being accessed instead of the hba alone.
>
>Since "scsi: ufs: ufs-debugfs: Add user-defined exception_event_mask"
>is now in linux-next, a similar change is needed for ufs-debugfs.c.
>Probably best it is a separate patch though.
>
Ok Sure, I'll push a separate patch.
If there're not any other concerns, please can you ack these changes.

Thanks,
-asd
