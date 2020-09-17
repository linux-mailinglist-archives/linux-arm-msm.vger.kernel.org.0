Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5499826D11F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Sep 2020 04:29:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726093AbgIQC3i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 22:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbgIQC3h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 22:29:37 -0400
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 498A0C061351
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 19:29:37 -0700 (PDT)
Received: by mail-oo1-xc41.google.com with SMTP id g26so192559ooa.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 19:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VE5n3jGn2FvmnuiKIkLlfMO4cq4htPGZqkOIyp7oCTk=;
        b=hR2nePbgnTCUSqe41FcHVgNm6Xjz7Zcw43IyQiS21NSCRJrlVvCvgXCGKY+F16FJ/s
         JvtIF9bPYtgc+XzhdG1AsItCFVfZL8eNSdQZnJtJztmCrTvdiuFRUwhVQJrf3EHb4Exg
         TbdUZWZ13gZ6yAqUVIj6VR+oPYAHBpPuD9kfvPH7tpKx54iQW8pOi3aw1D7ll99udSB+
         WvK7Vtcqsd2QFjYl90EpyOXrWUNhSHGWTPaSbp+/HIqUfdl5vM9jd+FuP7CUF/clPBu6
         dpANmsKilhkPW5hKKW9R/IL6BQQf50CljJqXlVAxo+DWHLiTzOkJEgqQB4tPcgDS1LTA
         g9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VE5n3jGn2FvmnuiKIkLlfMO4cq4htPGZqkOIyp7oCTk=;
        b=TF8s7NYZNgETUeny1cgF38hVquErqD37G/rPSi/5brE45dFNQdpGi1wd7dTS13Eomb
         zWRTgcTbBI2ZWdCwXQrY5wqdYV84le97/MBMEztrJSpZyAl0DwspHOf6BKXlOKTXhl1C
         Rb+twVIJX+l0+Q6d9NyNKeE8D7iyRvF0nT7BZZQv6kuH1t/HicB85NgXoswMNb70QcOq
         3A2n7wMwavJS5wwxHQdddYX3tvcKUzPNp4uwZ+ahkNKG5zgUPlNz1kyUxlzgnOsJiSiD
         9lZkMVmt7FuqW1Kr22vL6QViwxl75+VZEwZZsbc26N88YK1af0t802bvikZMppgrP+cD
         Coog==
X-Gm-Message-State: AOAM531bNMMMrGTyYf24Jno/q4hy7DV2rjO0lY9JimslXFF9+vpC+R+S
        0fC7UIsC4hreimaejG+JDwe9wpRTjjeEeFM+
X-Google-Smtp-Source: ABdhPJzJXURfl4y3VSIHVzz+sPBmYwpGpspEgIn+LJcsthzHcADKcaXDgK8YmNFE3yaluddQ3frHJg==
X-Received: by 2002:a4a:5d84:: with SMTP id w126mr17892143ooa.1.1600309776351;
        Wed, 16 Sep 2020 19:29:36 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:7cad:6eff:fec8:37e4])
        by smtp.gmail.com with ESMTPSA id a22sm5143467oie.13.2020.09.16.19.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 19:29:35 -0700 (PDT)
Date:   Wed, 16 Sep 2020 21:29:31 -0500
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
Message-ID: <20200917022931.GK1893@yoga>
References: <5c9d6f76303bbe5188bf839b2ea5e5bf530e7281.1598923023.git.nguyenb@codeaurora.org>
 <20200915025401.GD471@uller>
 <a8c851744fcaee205fc7a58db8f747fa@codeaurora.org>
 <20200915133729.GD670377@yoga>
 <6e36f0a315c13429bdad1ce704cbe878@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e36f0a315c13429bdad1ce704cbe878@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 16 Sep 19:53 CDT 2020, nguyenb@codeaurora.org wrote:

> On 2020-09-15 06:37, Bjorn Andersson wrote:
> > On Tue 15 Sep 03:49 CDT 2020, nguyenb@codeaurora.org wrote:
> > 
> > > On 2020-09-14 19:54, Bjorn Andersson wrote:
> > > > On Tue 01 Sep 01:19 UTC 2020, Bao D. Nguyen wrote:
> > > >
> > > > > UFS version 3.0 and later devices require Vcc and Vccq power supplies
> > > > > with Vccq2 being optional. While earlier UFS version 2.0 and 2.1
> > > > > devices, the Vcc and Vccq2 are required with Vccq being optional.
> > > > > Check the required power supplies used by the device
> > > > > and set the device's supported Icc level properly.
> > > > >
> > > > > Signed-off-by: Can Guo <cang@codeaurora.org>
> > > > > Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> > > > > Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
> > > > > ---
> > > > >  drivers/scsi/ufs/ufshcd.c | 5 +++--
> > > > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> > > > > index 06e2439..fdd1d3e 100644
> > > > > --- a/drivers/scsi/ufs/ufshcd.c
> > > > > +++ b/drivers/scsi/ufs/ufshcd.c
> > > > > @@ -6845,8 +6845,9 @@ static u32
> > > > > ufshcd_find_max_sup_active_icc_level(struct ufs_hba *hba,
> > > > >  {
> > > > >  	u32 icc_level = 0;
> > > > >
> > > > > -	if (!hba->vreg_info.vcc || !hba->vreg_info.vccq ||
> > > > > -						!hba->vreg_info.vccq2) {
> > > > > +	if (!hba->vreg_info.vcc ||
> > > >
> > > > How did you test this?
> > > >
> > > > devm_regulator_get() never returns NULL, so afaict this conditional will
> > > > never be taken with either the old or new version of the code.
> > > Thanks for your comment. The call flow is as follows:
> > > ufshcd_pltfrm_init->ufshcd_parse_regulator_info->ufshcd_populate_vreg
> > > In the ufshcd_populate_vreg() function, it looks for DT entries
> > > "%s-supply"
> > > For UFS3.0+ devices, "vccq2-supply" is optional, so the vendor may
> > > choose
> > > not to provide vccq2-supply in the DT.
> > > As a result, a NULL is returned to hba->vreg_info.vccq2.
> > > Same for UFS2.0 and UFS2.1 devices, a NULL may be returned to
> > > hba->vreg_info.vccq if vccq-supply is not provided in the DT.
> > > The current code only checks for !hba->vreg_info.vccq OR
> > > !hba->vreg_info.vccq2. It will skip the setting for icc_level
> > > if either vccq or vccq2 is not provided in the DT.
> > > >
> > 
> > Thanks for the pointers, I now see that the there will only be struct
> > ufs_vreg objects allocated for the items that has an associated
> > %s-supply.
> > 
> > FYI, the idiomatic way to handle optional regulators is to use
> > regulator_get_optional(), which will return -ENODEV for regulators not
> > specified.
> Thanks for the regulator_get_optional() suggestion. Do you have a strong
> opinion about
> using regulator_get_optional() or would my proposal be ok? With
> regulator_get_optional(),
> we need to make 3 calls and check each result while the current
> implementation is also reliable
> simple quick check for NULL without any potential problem.
> 

I think the changes to the conditional that you're proposing in this
patch is reasonable.

Regards,
Bjorn

> Thanks,
> Bao
> > 
> > Regards,
> > Bjorn
> > 
> > > > Regards,
> > > > Bjorn
> > > >
> > > > > +		(!hba->vreg_info.vccq && hba->dev_info.wspecversion >= 0x300) ||
> > > > > +		(!hba->vreg_info.vccq2 && hba->dev_info.wspecversion < 0x300)) {
> > > > >  		dev_err(hba->dev,
> > > > >  			"%s: Regulator capability was not set, actvIccLevel=%d",
> > > > >  							__func__, icc_level);
> > > > > --
> > > > > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
> > > > > Forum,
> > > > > a Linux Foundation Collaborative Project
> > > > >
