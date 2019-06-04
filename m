Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30507352EA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2019 00:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbfFDW7e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jun 2019 18:59:34 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39800 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbfFDW7e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jun 2019 18:59:34 -0400
Received: by mail-pf1-f195.google.com with SMTP id j2so13596692pfe.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2019 15:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2x/6dym/wJBwbh6+t1lbnKjE5x4RtuWi4gD3SnKAZ30=;
        b=fUIpItUeGWs1El53UJTO7arimX5f3Q03oxlhM+LZSQLk4f6jC2FOWuIuPU9n/R57ij
         16itbc1GNd5Fwvqse0VWcvJ1zSc/Nyrz3xNBw0omDrhYOE8hZnUWXqiYI9uzvf+DKG1x
         uD0JAbnEK0mc5kl08VQQlocHVrp0YaLZacv8LOUyfghzIWBa+BdCCQSO7qMV7R8kM2Xk
         Cv5VhmRdZxiVFaNtoNzVMRKe+zba1WEYtBrG+roxg3ObtJbg6CSaxU65iBmRWUTMW89T
         OjlxEmpv4swHEg2CjiB6qrzbfHR8luEd63JZjBJiFsNXVy8hYy2RhixCC+ESPcdZShQL
         KDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2x/6dym/wJBwbh6+t1lbnKjE5x4RtuWi4gD3SnKAZ30=;
        b=NM/x3SWfaVEzlzF+qWf2X5gGV/XXrJfEnDRUuBzUg/RLX+o4CeLkxQFPV9wzk0v8zL
         Newh5nscIOnCFsR2ss4lciWsff/uPEh7h6wOOA35uHVBmmm1ZYi0I+35HcuwF7OJvBJV
         r+JNNjaK1xgKfxKZWHWZ7T+/UPpTWSqbo7CVR1YU88rvUOlKog9LZGWnw/MkJA77fm1+
         AKaI/iw+PBN0qyWTZ/42ynns/J0vITBO1Yqj0Wtps2C6M2a6sDFsQP4AoKqp+BdHs7sE
         42SJ24DZw6EpY5/T3kb01oVnQQxcUEXLbDQu8/LC3ISC4ESFX6Rf2OjZgdGC5WW26YZG
         7BbQ==
X-Gm-Message-State: APjAAAVVfmj/QGXFuB6N/8q97Ksw2GrTm4RL2QflCjOVqTF6mD3pwq5w
        OPqdGq0yF1J4Mh8CiYC0qiPJAA==
X-Google-Smtp-Source: APXvYqzbo4KgZDKcMiTV0gkusEc5LPCSwW5uOvd6fOEYHvt+CGXxRongSvJFzcSbuwCyj3K6py6hDQ==
X-Received: by 2002:aa7:9256:: with SMTP id 22mr28183848pfp.69.1559689173725;
        Tue, 04 Jun 2019 15:59:33 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a21sm9754032pjh.10.2019.06.04.15.59.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2019 15:59:33 -0700 (PDT)
Date:   Tue, 4 Jun 2019 15:59:31 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>, vivek.gautam@codeaurora.org
Cc:     Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH] arm64: dts: sdm845: Add iommus property to qup1
Message-ID: <20190604225931.GG4814@minitux>
References: <20190604222939.195471-1-swboyd@chromium.org>
 <20190604223700.GE4814@minitux>
 <5cf6f4bb.1c69fb81.c39da.5496@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cf6f4bb.1c69fb81.c39da.5496@mx.google.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 04 Jun 15:46 PDT 2019, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2019-06-04 15:37:00)
> > On Tue 04 Jun 15:29 PDT 2019, Stephen Boyd wrote:
> > 
> > > The SMMU that sits in front of the QUP needs to be programmed properly
> > > so that the i2c geni driver can allocate DMA descriptors. Failure to do
> > > this leads to faults when using devices such as an i2c touchscreen where
> > > the transaction is larger than 32 bytes and we use a DMA buffer.
> > > 
> > 
> > I'm pretty sure I've run into this problem, but before we marked the
> > smmu bypass_disable and as such didn't get the fault, thanks.
> > 
> > >  arm-smmu 15000000.iommu: Unexpected global fault, this could be serious
> > >  arm-smmu 15000000.iommu:         GFSR 0x00000002, GFSYNR0 0x00000002, GFSYNR1 0x000006c0, GFSYNR2 0x00000000
> > > 
> > > Add the right SID and mask so this works.
> > > 
> > > Cc: Sibi Sankar <sibis@codeaurora.org>
> > > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > index fcb93300ca62..2e57e861e17c 100644
> > > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > @@ -900,6 +900,7 @@
> > >                       #address-cells = <2>;
> > >                       #size-cells = <2>;
> > >                       ranges;
> > > +                     iommus = <&apps_smmu 0x6c0 0x3>;
> > 
> > According to the docs this stream belongs to TZ, the HLOS stream should
> > be 0x6c3.
> 
> Aye, I saw this line in the downstream kernel but it doesn't work for
> me. If I specify <&apps_smmu 0x6c3 0x0> it still blows up. I wonder if
> my firmware perhaps is missing some initialization here to make the QUP
> operate in HLOS mode? Otherwise, I thought that the 0x3 at the end was
> the mask and so it should be split off to the second cell in the DT
> specifier but that seemed a little weird.
> 

Both 0x3 and 0x6c3 are documented as the actual HLOS stream id, with
mask of 0x0. 

Looping in Vivek as well.

Regards,
Bjorn
