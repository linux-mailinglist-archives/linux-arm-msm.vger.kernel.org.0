Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B80E1DC1B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2020 23:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728227AbgETV7j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 May 2020 17:59:39 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:11067 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728183AbgETV7i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 May 2020 17:59:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590011978; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=3uYuYChDUZSVg5PdvAhch35HzgAV57/WwZiYWni9v5A=; b=ZHLnycp6/vtcEthhS177y4hrEwK081QbvsALTnAFDYIpNNoICorhIWT6/OlpDgu8fEGwA1cv
 vm9v46yTmTXvIH0XkhEOSfHtHBc0ubl41hs1p1wb5of6JVMipCLQRQJRt7+Vei2xoitpHhg4
 uEjW9ihBkDmYuWTA58vXfuXYMVw=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5ec5a83eeb073d5691184cf6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 20 May 2020 21:59:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 10257C433CB; Wed, 20 May 2020 21:59:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.8.150] (cpe-70-95-149-85.san.res.rr.com [70.95.149.85])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: asutoshd)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C3099C433C8;
        Wed, 20 May 2020 21:59:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C3099C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v4 2/2] scsi: ufs-qcom: enter and exit hibern8 during
 clock scaling
To:     Avri Altman <Avri.Altman@wdc.com>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "PedroM.Sousa@synopsys.com" <PedroM.Sousa@synopsys.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
Cc:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        open list <linux-kernel@vger.kernel.org>
References: <186237103353b5a79c3496e619fca894dbc78600.1589997078.git.asutoshd@codeaurora.org>
 <9b67c25eb7c0bf80075b36660aebdb3788207353.1589997078.git.asutoshd@codeaurora.org>
 <SN6PR04MB464071B647084B0EB111992DFCB60@SN6PR04MB4640.namprd04.prod.outlook.com>
From:   "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <f9425765-42fb-717b-e20c-fd57e310b882@codeaurora.org>
Date:   Wed, 20 May 2020 14:59:23 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <SN6PR04MB464071B647084B0EB111992DFCB60@SN6PR04MB4640.namprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Avri,

On 5/20/2020 2:33 PM, Avri Altman wrote:
> Hi,
> 
>>
>>
>> Qualcomm controller needs to be in hibern8 before scaling clocks.
>> This change puts the controller in hibern8 state before scaling
>> and brings it out after scaling of clocks.
>>
>> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> 
> I guess that your previous versions are pretty far back - ,
> I noticed a comment by Pedro, so you might want to resend this series.
> 
Ok.

> What happens if the pre-change is successful,
> but you are not getting to the post change because, e.g. ufshcd_set_clk_freq failed?
> 
I agree. Let me check this.

> Also, this piece of code is ~5 years old, so you might want to elaborate on how come hibernation is now needed.
> 
> Thanks,
> Avri
> 

Thanks for the review. Hibernation was needed since long actually.
I guess it was never pushed upstream.

Thanks,
-asd

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project
