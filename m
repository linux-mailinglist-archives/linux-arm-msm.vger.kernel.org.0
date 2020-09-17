Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D48926D052
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Sep 2020 03:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbgIQBAF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 21:00:05 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:25754 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726130AbgIQBAD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 21:00:03 -0400
X-Greylist: delayed 311 seconds by postgrey-1.27 at vger.kernel.org; Wed, 16 Sep 2020 21:00:02 EDT
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600304395; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=fVudm0/lgiiKwjiWJ16VOu7Farkh1dx277bHuq90WXc=;
 b=N6XJJfFa1WiFwdzYr0lzfRSxTDRmbCkQ7ILHGHh0z1fiT4tEKakk/vGlBJgkADc26P+Rtx9Z
 hA14J6mIuXd78kHkhzE6c3gQph3NT8c6zeFFKBkHc88VrS9jw9hBDG9OXIntd2Dq8OoBSoOY
 dWz8Td3xE21HuIiEBhExNiNYOs0=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f62b3944ab73023a7f6fd9d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Sep 2020 00:53:40
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 35E1EC433F0; Thu, 17 Sep 2020 00:53:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: nguyenb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DCB40C433C8;
        Thu, 17 Sep 2020 00:53:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 16 Sep 2020 17:53:37 -0700
From:   nguyenb@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     cang@codeaurora.org, asutoshd@codeaurora.org,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Bart Van Assche <bvanassche@acm.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/1] scsi: ufshcd: Properly set the device Icc Level
In-Reply-To: <20200915133729.GD670377@yoga>
References: <5c9d6f76303bbe5188bf839b2ea5e5bf530e7281.1598923023.git.nguyenb@codeaurora.org>
 <20200915025401.GD471@uller>
 <a8c851744fcaee205fc7a58db8f747fa@codeaurora.org>
 <20200915133729.GD670377@yoga>
Message-ID: <6e36f0a315c13429bdad1ce704cbe878@codeaurora.org>
X-Sender: nguyenb@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-15 06:37, Bjorn Andersson wrote:
> On Tue 15 Sep 03:49 CDT 2020, nguyenb@codeaurora.org wrote:
> 
>> On 2020-09-14 19:54, Bjorn Andersson wrote:
>> > On Tue 01 Sep 01:19 UTC 2020, Bao D. Nguyen wrote:
>> >
>> > > UFS version 3.0 and later devices require Vcc and Vccq power supplies
>> > > with Vccq2 being optional. While earlier UFS version 2.0 and 2.1
>> > > devices, the Vcc and Vccq2 are required with Vccq being optional.
>> > > Check the required power supplies used by the device
>> > > and set the device's supported Icc level properly.
>> > >
>> > > Signed-off-by: Can Guo <cang@codeaurora.org>
>> > > Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
>> > > Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
>> > > ---
>> > >  drivers/scsi/ufs/ufshcd.c | 5 +++--
>> > >  1 file changed, 3 insertions(+), 2 deletions(-)
>> > >
>> > > diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
>> > > index 06e2439..fdd1d3e 100644
>> > > --- a/drivers/scsi/ufs/ufshcd.c
>> > > +++ b/drivers/scsi/ufs/ufshcd.c
>> > > @@ -6845,8 +6845,9 @@ static u32
>> > > ufshcd_find_max_sup_active_icc_level(struct ufs_hba *hba,
>> > >  {
>> > >  	u32 icc_level = 0;
>> > >
>> > > -	if (!hba->vreg_info.vcc || !hba->vreg_info.vccq ||
>> > > -						!hba->vreg_info.vccq2) {
>> > > +	if (!hba->vreg_info.vcc ||
>> >
>> > How did you test this?
>> >
>> > devm_regulator_get() never returns NULL, so afaict this conditional will
>> > never be taken with either the old or new version of the code.
>> Thanks for your comment. The call flow is as follows:
>> ufshcd_pltfrm_init->ufshcd_parse_regulator_info->ufshcd_populate_vreg
>> In the ufshcd_populate_vreg() function, it looks for DT entries 
>> "%s-supply"
>> For UFS3.0+ devices, "vccq2-supply" is optional, so the vendor may 
>> choose
>> not to provide vccq2-supply in the DT.
>> As a result, a NULL is returned to hba->vreg_info.vccq2.
>> Same for UFS2.0 and UFS2.1 devices, a NULL may be returned to
>> hba->vreg_info.vccq if vccq-supply is not provided in the DT.
>> The current code only checks for !hba->vreg_info.vccq OR
>> !hba->vreg_info.vccq2. It will skip the setting for icc_level
>> if either vccq or vccq2 is not provided in the DT.
>> >
> 
> Thanks for the pointers, I now see that the there will only be struct
> ufs_vreg objects allocated for the items that has an associated
> %s-supply.
> 
> FYI, the idiomatic way to handle optional regulators is to use
> regulator_get_optional(), which will return -ENODEV for regulators not
> specified.
Thanks for the regulator_get_optional() suggestion. Do you have a strong 
opinion about
using regulator_get_optional() or would my proposal be ok? With 
regulator_get_optional(),
we need to make 3 calls and check each result while the current 
implementation is also reliable
simple quick check for NULL without any potential problem.

Thanks,
Bao
> 
> Regards,
> Bjorn
> 
>> > Regards,
>> > Bjorn
>> >
>> > > +		(!hba->vreg_info.vccq && hba->dev_info.wspecversion >= 0x300) ||
>> > > +		(!hba->vreg_info.vccq2 && hba->dev_info.wspecversion < 0x300)) {
>> > >  		dev_err(hba->dev,
>> > >  			"%s: Regulator capability was not set, actvIccLevel=%d",
>> > >  							__func__, icc_level);
>> > > --
>> > > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
>> > > Forum,
>> > > a Linux Foundation Collaborative Project
>> > >
