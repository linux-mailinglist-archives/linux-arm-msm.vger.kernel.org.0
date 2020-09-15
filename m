Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 933E926AC16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 20:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727631AbgIOSgb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 14:36:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727963AbgIOSgG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 14:36:06 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F072C06178B
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 11:36:06 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id v54so3976352qtj.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 11:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GgZ/I9dmFcrJX4+Gcxzi1wWr8Iu40sI3TTgomrtpN/0=;
        b=z8MJShO7zBTWm3yVC0Q2B1jLLQdjAl69a3uv6ayRBTCgRBwaOGvRCejJjlUYVvyhob
         C515IoetU9yk0QA2QzTSEYI4Hy2csIlbO98uYArEQ6vGBlBIbqumJWE2bDSdNtbbnFfa
         xinHnfJDeLSD/ldAg/WkI/U1uzw0rPtga9bJMz0WJ3ZKr8XLEKd/ILfjhZMJO5pHuE9D
         7Z0c368zo5Yl2zKPJWdR7WllBb1d6b0Y+72fA1aDPG2oEFTTRcSfyZhk8vYo5TmyiUXE
         787sDu5TyHgeDTHlhSsP6+59QdthTLl8S+QMi1DiSFc37jUvJIFJI2HNWsbPZls0YKJ/
         Xr4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GgZ/I9dmFcrJX4+Gcxzi1wWr8Iu40sI3TTgomrtpN/0=;
        b=Vz9TYSwwxnonAM87S8Tlhv053CPru2d9NFFjkc9rpLPIsgcMfpey/2x+WqRmsYef6P
         YtgTZDcG/EvYfS1ingNAOCPt3b3dUwXr/pPJIuoMgMFWVbmdWhRZXIFBX1iDzwQNrZdI
         JtfNBq7OI+z/+g/E2CRHZJl0M5dmyAq6DuHHHNl6hY1bfQvVXBP5TE8THtTmMo9CFrRt
         NlBzBBtCMM5x3hXjdInNx1WhG4gyZIWZHNoVT5rYwg0g6sLGOAfNXSwhIm+wZmr70fBT
         sSqfpqZ96vZysAB/QE6Eeofp3SrPkB57y98/7K1ZFQFnbSYGRSyp0wKIwFHG5C2zDOEv
         tT9w==
X-Gm-Message-State: AOAM532Xi8CYlCq1Az1UceMbslb7i76r+v7MI77BsZZInf3rmemHKeuq
        tn42yNfLjhoKyb07QYMI8ljlnA==
X-Google-Smtp-Source: ABdhPJwfFRNQG2gODIPTVtMLkOKyS7JO8o2XcPk3uqPJDEyfwQbbtxIUkzEh4rOiUD1Yglft+jg0VQ==
X-Received: by 2002:ac8:1e07:: with SMTP id n7mr270166qtl.156.1600194965114;
        Tue, 15 Sep 2020 11:36:05 -0700 (PDT)
Received: from uller (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
        by smtp.gmail.com with ESMTPSA id v18sm16726433qtq.15.2020.09.15.11.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 11:36:04 -0700 (PDT)
Date:   Tue, 15 Sep 2020 18:36:02 +0000
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     nguyenb@codeaurora.org
Cc:     cang@codeaurora.org, asutoshd@codeaurora.org,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Avri Altman <Avri.Altman@wdc.com>,
        Vinod Koul <vkoul@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] scsi: dt-bindings: ufs: Add vcc-voltage-level for
 UFS
Message-ID: <20200915183602.GK478@uller>
References: <cover.1598939393.git.nguyenb@codeaurora.org>
 <0a9d395dc38433501f9652a9236856d0ac840b77.1598939393.git.nguyenb@codeaurora.org>
 <20200915044154.GB670377@yoga>
 <748d238a3d9e53834a498c6f37f9f3c9@codeaurora.org>
 <20200915134335.GE670377@yoga>
 <e39516da0d94a4046edbcfb48b665f82@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e39516da0d94a4046edbcfb48b665f82@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 15 Sep 16:47 UTC 2020, nguyenb@codeaurora.org wrote:

> On 2020-09-15 06:43, Bjorn Andersson wrote:
> > On Tue 15 Sep 03:14 CDT 2020, nguyenb@codeaurora.org wrote:
> > 
> > > On 2020-09-14 21:41, Bjorn Andersson wrote:
> > > > On Tue 01 Sep 01:00 CDT 2020, Bao D. Nguyen wrote:
> > > >
> > > > > UFS's specifications supports a range of Vcc operating
> > > > > voltage levels. Add documentation for the UFS's Vcc voltage
> > > > > levels setting.
> > > > >
> > > > > Signed-off-by: Can Guo <cang@codeaurora.org>
> > > > > Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> > > > > Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
> > > > > ---
> > > > >  Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt | 2 ++
> > > > >  1 file changed, 2 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> > > > > b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> > > > > index 415ccdd..7257b32 100644
> > > > > --- a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> > > > > +++ b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> > > > > @@ -23,6 +23,8 @@ Optional properties:
> > > > >                            with "phys" attribute, provides phandle
> > > > > to UFS PHY node
> > > > >  - vdd-hba-supply        : phandle to UFS host controller supply
> > > > > regulator node
> > > > >  - vcc-supply            : phandle to VCC supply regulator node
> > > > > +- vcc-voltage-level     : specifies voltage levels for VCC supply.
> > > > > +                          Should be specified in pairs (min, max),
> > > > > units uV.
> > > >
> > > > What exactly are these pairs representing?
> > > The pair is the min and max Vcc voltage request to the PMIC chip.
> > > As a result, the regulator output voltage would only be in this range.
> > > 
> > 
> > If you have static min/max voltage constraints for a device on a
> > particular board the right way to handle this is to adjust the board's
> > regulator-min-microvolt and regulator-max-microvolt accordingly - and
> > not call regulator_set_voltage() from the river at all.
> > 
> > In other words, you shouldn't add this new property to describe
> > something already described in the node vcc-supply points to.
> > 
> > Regards,
> > Bjorn
> Thank you all for your comments. The current driver hardcoding 2.7V Vcc min
> voltage
> does not work for UFS3.0+ devices according to the UFS device JEDEC spec.
> However, we will
> try to address it in a different way.
> 

Right, but what I'm saying is that you should remove the
regulator_set_voltage() call from the driver and rely on the device's
dts, in which case you won't have this problem.

Thanks,
Bjorn

> Regards,
> Bao
> 
> > 
> > > >
> > > > Is this supposed to be 3 pairs of (min,max) for vcc, vcc and vccq2 to be
> > > > passed into a regulator_set_voltage() for each regulator?
> > > Yes, that's right. I should include the other power supplies in this
> > > change
> > > as well.
> > > >
> > > > Or are these some sort of "operating points" for the vcc-supply?
> > > >
> > > > Regards,
> > > > Bjorn
> > > >
> > > > >  - vccq-supply           : phandle to VCCQ supply regulator node
> > > > >  - vccq2-supply          : phandle to VCCQ2 supply regulator node
> > > > >  - vcc-supply-1p8        : For embedded UFS devices, valid VCC range
> > > > > is 1.7-1.95V
> > > > > --
> > > > > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
> > > > > Forum,
> > > > > a Linux Foundation Collaborative Project
> > > > >
