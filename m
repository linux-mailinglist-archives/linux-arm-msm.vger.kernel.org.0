Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD3A13556CB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 16:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345251AbhDFOjt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 10:39:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345258AbhDFOjs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 10:39:48 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A82D1C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Apr 2021 07:39:40 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id h3-20020a4ae8c30000b02901b68b39e2d3so3731276ooe.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Apr 2021 07:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SRyPzsqsdJlb7LqXJpW1Z3pRz6tNOGdEzx0ikbl3jmk=;
        b=pcAppa5LRlPGGSq9lVQoD+vG2GK6gyKj+w4WvOodLIUzQCO1d/TIZB/pL2Guh582Nf
         CUtA48BjiUgNYjx7xTz2CkDCBJ5EhBOSfIZgbtXdQfO9uWq1UwxgGI9zdZ/f2SoqCgan
         tejeFcdbbv4h0aCRSucacORYQZlCJfawM+OCDtVGrFKngtq9Z+WK8vkNxaraLa152baW
         rEhpedySbDXH84Kd3m+/ISbT2L+vjdsRLzPb1gkKukXqPcYFxeXxHDCYnyMOmWn4y15E
         JU5Bv7/OpWqFRsTi2QRkeeGtxqVZiqYoILods+dxPYaAKyFYofBB6ulImke7U+oznE9k
         dNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SRyPzsqsdJlb7LqXJpW1Z3pRz6tNOGdEzx0ikbl3jmk=;
        b=hWCDD9pMN3IYQ8Nx4533LRnxYSwWdX30F9W3YaFhR4wsLPXRvEhYeWtagNRWQwqPuL
         ne+PJZV/XGyZR8hoIEXGBLyjY+LbqD5/eVDiECwYKo6NxxXb3en7S82bso3XejNzDJwI
         ++z3tRlk+YLYzLIZ0VWyD7jcOaVDTmL598+0I45rnGmHxEqMsdDOmDNWN8kYwJomKqc+
         jtW2+qzOaGgHRnvLqN+kzsuRLU0fgmHyCY6+5hUhTCNpGeGiqvUwzPpDBUTzuwqWNfPf
         WbeVytNUS81CXL3aQ9Cqo1DwFpuz96UOqulvlurQTeoqdwc9/4ogRfav9Rsa3LO9UTv6
         TDQg==
X-Gm-Message-State: AOAM532qUjULRnfEf9t25ZqD2h2Z+oOJh8SPdGfl4nZ3xEREun87JGF7
        GW6q3X7T142qDDk8+oE3umhYtA==
X-Google-Smtp-Source: ABdhPJwoJ5uCxDIhReUtSSo2xdTRYUTzgyTwfk6apJTctrqGEO/A1pVTE1dsz1o//sXa5pighIZFGQ==
X-Received: by 2002:a4a:3901:: with SMTP id m1mr26957013ooa.60.1617719980017;
        Tue, 06 Apr 2021 07:39:40 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w14sm4712125ots.39.2021.04.06.07.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 07:39:39 -0700 (PDT)
Date:   Tue, 6 Apr 2021 09:39:38 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: sdm845-db845c: make firmware filenames
 follow linux-firmware
Message-ID: <YGxyqrm09A8NSkWg@builder.lan>
References: <20210318201405.2244723-1-dmitry.baryshkov@linaro.org>
 <97f37835-a543-c0b1-4497-b093ce182155@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97f37835-a543-c0b1-4497-b093ce182155@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 06 Apr 09:27 CDT 2021, Dmitry Baryshkov wrote:

> Hi Bjorn,
> 
> On 18/03/2021 23:14, Dmitry Baryshkov wrote:
> > Cange aDSP and cDSP firmware filenames to follow filenames merged into
> > linux-firmware tree. Switch from split .mdt files to merged .mbn files.
> 
> Any chance of getting this into 5.13?
> 

I've picked this up and will send another set of pull requests this
week, hopefully soc@ will accept them.

Thanks,
Bjorn

> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> > index c4ac6f5dc008..b36a002c654a 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> > @@ -244,7 +244,7 @@ vph_pwr: vph-pwr-regulator {
> >   &adsp_pas {
> >   	status = "okay";
> > -	firmware-name = "qcom/sdm845/adsp.mdt";
> > +	firmware-name = "qcom/sdm845/adsp.mbn";
> >   };
> >   &apps_rsc {
> > @@ -390,7 +390,7 @@ vreg_bob: bob {
> >   &cdsp_pas {
> >   	status = "okay";
> > -	firmware-name = "qcom/sdm845/cdsp.mdt";
> > +	firmware-name = "qcom/sdm845/cdsp.mbn";
> >   };
> >   &dsi0 {
> > 
> 
> 
> -- 
> With best wishes
> Dmitry
