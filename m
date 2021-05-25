Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64D3E3906D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 18:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233149AbhEYQqG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 12:46:06 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:13825 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233232AbhEYQqF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 12:46:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621961075; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=MSK+0MFz2qCFARcKpE7NkQqP5Tr+sTVIlGaMvOiEARk=; b=BELofAnIX/DB0NKEHKVkHk73uXbqcZgNgB/ZcWhES/yfr/n1Rqsbp2rbHPvbApHF2I8jmnXR
 Uu46qEFMWeh9461p5rkWOOfh7Esb+d3BLCiXj0a6rc7J4eQiMaEVmy2Kvhj6OVQ8t/Wnat45
 3ToJcv7k7VIro3Ux7eGKY2duz40=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60ad2970c229adfeff48d70a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 25 May 2021 16:44:32
 GMT
Sender: asutoshd=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7FD60C43143; Tue, 25 May 2021 16:44:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.8.168] (cpe-70-95-149-85.san.res.rr.com [70.95.149.85])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: asutoshd)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9FD4DC433F1;
        Tue, 25 May 2021 16:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9FD4DC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v4 2/2] scsi: ufs-qcom: enter and exit hibern8 during
 clock scaling
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Avri Altman <Avri.Altman@wdc.com>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "PedroM.Sousa@synopsys.com" <PedroM.Sousa@synopsys.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        open list <linux-kernel@vger.kernel.org>
References: <186237103353b5a79c3496e619fca894dbc78600.1589997078.git.asutoshd@codeaurora.org>
 <9b67c25eb7c0bf80075b36660aebdb3788207353.1589997078.git.asutoshd@codeaurora.org>
 <SN6PR04MB464071B647084B0EB111992DFCB60@SN6PR04MB4640.namprd04.prod.outlook.com>
 <f9425765-42fb-717b-e20c-fd57e310b882@codeaurora.org>
 <CAF2Aj3gpMhPf8dF7cxcW0AhwGmGtf=LbO6HPB0u3FxudWTBcoQ@mail.gmail.com>
From:   "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <daf42576-3b58-1645-c068-115355c0c494@codeaurora.org>
Date:   Tue, 25 May 2021 09:44:29 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAF2Aj3gpMhPf8dF7cxcW0AhwGmGtf=LbO6HPB0u3FxudWTBcoQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/25/2021 12:57 AM, Lee Jones wrote:
> On Wed, 20 May 2020 at 22:59, Asutosh Das (asd) <asutoshd@codeaurora.org 
> <mailto:asutoshd@codeaurora.org>> wrote:
> 
>     Hi Avri,
> 
>     On 5/20/2020 2:33 PM, Avri Altman wrote:
>      > Hi,
>      >
>      >>
>      >>
>      >> Qualcomm controller needs to be in hibern8 before scaling clocks.
>      >> This change puts the controller in hibern8 state before scaling
>      >> and brings it out after scaling of clocks.
>      >>
>      >> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org
>     <mailto:asutoshd@codeaurora.org>>
>      >
>      > I guess that your previous versions are pretty far back - ,
>      > I noticed a comment by Pedro, so you might want to resend this
>     series.
>      >
>     Ok.
> 
>      > What happens if the pre-change is successful,
>      > but you are not getting to the post change because, e.g.
>     ufshcd_set_clk_freq failed?
>      >
>     I agree. Let me check this.
> 
>      > Also, this piece of code is ~5 years old, so you might want to
>     elaborate on how come hibernation is now needed.
>      >
>      > Thanks,
>      > Avri
>      >
> 
>     Thanks for the review. Hibernation was needed since long actually.
>     I guess it was never pushed upstream.
> 
> 
> Good morning Asd,
> 
> Any luck with getting this upstream?
> 
> Looks like this was the last submission.
> 
> Did something change?  Is this no longer required?
> 
Hi Lee
This slipped away. I may not get to this soon.
I'd prefer to drop it for now and come back to it when I've some time.

Thanks,
-asd

> -- 
> Lee Jones [李琼斯]
> Linaro Services Senior Technical Lead
> Linaro.org │ Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project
