Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC5226A68B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 15:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbgIONtm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 09:49:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726747AbgIONsb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 09:48:31 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44B20C061A2B
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 06:37:34 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id n2so3897234oij.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 06:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ttARGbDHmVnJ0g6Br9D8cEVRotoN7PzoX1uzLIImtD4=;
        b=P4iMu1hRBC5Lq/Gsju/uOwqOCm78IqbBrXKblX1kH+6k5Kbezqh1Wq6Gh+8GjYG3Gf
         E/c6KaLLnzqGlL6bcou+LtU65EFYrQyZhY02LU2ksp5T8r1mmsNsfaeXZnO5975n7rnE
         kY9NpNAjXndInQBjmq/FC14J8665OALEqcHkeQU9dI2tjzSeITtyr7+hSQVkxAimoso3
         4ilRgwsf0k2QRNQeY1qVuDCjCGCetlOHAY+a9bH7T2r7hxwPAd87Job/JFPNb4c7Dmp2
         /zmn4o+qH/iaooeHCY3kqOFyT1fbUoYdbKXs4D9erDo1LgH9JEH51s10XA7gGi4zOWfP
         1j7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ttARGbDHmVnJ0g6Br9D8cEVRotoN7PzoX1uzLIImtD4=;
        b=LfUlDfS/D12NwnNamOYplnjc7n6cawqgeBtZev34HKiGBXX6uQeSUeO7EJq3UTsdJH
         sUzdl6tLsDt9+fTWTotfpv/jTPn5A8ZmPvmW3dK8RagygTXW25JCabPTfHdfP02QBthZ
         n8UI+CSLN4pwVIset8Bv3ylnEU7m8vZoW28guYxgY/LvOZOUCqV970tkDVnO0JwtOXjk
         psXzP0FwqjWDQNkpsvjNeHjva/TT6qFu0orUJ3TAUk8BTFMurS+l728Qg1XjZoLMHU/M
         O7yvAGD9lF7JJbkAFGFQ2sJaZnObA/dy2UIKFbBJG1s5VGfx428TUZ+B8gBQQHH7Ql1w
         6uwA==
X-Gm-Message-State: AOAM531Dvzdrp1i13Z2xg9Umi/jtyo+FaX/zvJ85hZ5CoFGAs/RdYeM0
        X/UbVaYpFhiIuC6zkKc/bq2t4mSstnaqub5M
X-Google-Smtp-Source: ABdhPJxisvq6caWh5L4EG6TGFxDpwY6jGGBJ+sNGZgHWBV118w2EVtYOtdNF6lKC5Rac05XL7IXV6A==
X-Received: by 2002:a05:6808:a05:: with SMTP id n5mr3418167oij.154.1600177053525;
        Tue, 15 Sep 2020 06:37:33 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
        by smtp.gmail.com with ESMTPSA id 91sm1156918ott.55.2020.09.15.06.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 06:37:32 -0700 (PDT)
Date:   Tue, 15 Sep 2020 08:37:29 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     nguyenb@codeaurora.org
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
Message-ID: <20200915133729.GD670377@yoga>
References: <5c9d6f76303bbe5188bf839b2ea5e5bf530e7281.1598923023.git.nguyenb@codeaurora.org>
 <20200915025401.GD471@uller>
 <a8c851744fcaee205fc7a58db8f747fa@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8c851744fcaee205fc7a58db8f747fa@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 15 Sep 03:49 CDT 2020, nguyenb@codeaurora.org wrote:

> On 2020-09-14 19:54, Bjorn Andersson wrote:
> > On Tue 01 Sep 01:19 UTC 2020, Bao D. Nguyen wrote:
> > 
> > > UFS version 3.0 and later devices require Vcc and Vccq power supplies
> > > with Vccq2 being optional. While earlier UFS version 2.0 and 2.1
> > > devices, the Vcc and Vccq2 are required with Vccq being optional.
> > > Check the required power supplies used by the device
> > > and set the device's supported Icc level properly.
> > > 
> > > Signed-off-by: Can Guo <cang@codeaurora.org>
> > > Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> > > Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
> > > ---
> > >  drivers/scsi/ufs/ufshcd.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> > > index 06e2439..fdd1d3e 100644
> > > --- a/drivers/scsi/ufs/ufshcd.c
> > > +++ b/drivers/scsi/ufs/ufshcd.c
> > > @@ -6845,8 +6845,9 @@ static u32
> > > ufshcd_find_max_sup_active_icc_level(struct ufs_hba *hba,
> > >  {
> > >  	u32 icc_level = 0;
> > > 
> > > -	if (!hba->vreg_info.vcc || !hba->vreg_info.vccq ||
> > > -						!hba->vreg_info.vccq2) {
> > > +	if (!hba->vreg_info.vcc ||
> > 
> > How did you test this?
> > 
> > devm_regulator_get() never returns NULL, so afaict this conditional will
> > never be taken with either the old or new version of the code.
> Thanks for your comment. The call flow is as follows:
> ufshcd_pltfrm_init->ufshcd_parse_regulator_info->ufshcd_populate_vreg
> In the ufshcd_populate_vreg() function, it looks for DT entries "%s-supply"
> For UFS3.0+ devices, "vccq2-supply" is optional, so the vendor may choose
> not to provide vccq2-supply in the DT.
> As a result, a NULL is returned to hba->vreg_info.vccq2.
> Same for UFS2.0 and UFS2.1 devices, a NULL may be returned to
> hba->vreg_info.vccq if vccq-supply is not provided in the DT.
> The current code only checks for !hba->vreg_info.vccq OR
> !hba->vreg_info.vccq2. It will skip the setting for icc_level
> if either vccq or vccq2 is not provided in the DT.
> > 

Thanks for the pointers, I now see that the there will only be struct
ufs_vreg objects allocated for the items that has an associated
%s-supply.

FYI, the idiomatic way to handle optional regulators is to use
regulator_get_optional(), which will return -ENODEV for regulators not
specified.

Regards,
Bjorn

> > Regards,
> > Bjorn
> > 
> > > +		(!hba->vreg_info.vccq && hba->dev_info.wspecversion >= 0x300) ||
> > > +		(!hba->vreg_info.vccq2 && hba->dev_info.wspecversion < 0x300)) {
> > >  		dev_err(hba->dev,
> > >  			"%s: Regulator capability was not set, actvIccLevel=%d",
> > >  							__func__, icc_level);
> > > --
> > > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
> > > Forum,
> > > a Linux Foundation Collaborative Project
> > > 
