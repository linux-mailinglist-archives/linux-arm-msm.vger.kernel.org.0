Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5D8F36E3D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2019 10:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726835AbfFFINw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jun 2019 04:13:52 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40340 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726805AbfFFINw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jun 2019 04:13:52 -0400
Received: by mail-wr1-f66.google.com with SMTP id p11so1374036wre.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2019 01:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=UnQLiliA9hI58ulfyIL2yz7hhigga6zrAzxyol2dLNE=;
        b=z4hzjFCbFqwFKL09Hre/pqSOd1NHQo1UJPD/QW2XoBU76xxZ8Gu0H7eDrg80J8rxbX
         cTvior4wLNVKmgN81/I1SRGJn1ggF59jF79CYFN6ZcPhbyHoqGEglfvedTdHhvZAQqF2
         kttDD+8IwvsbmpHP+5hUxTOYp/r2K0V682hwgholcAoufCG+wrADMF3tru9LESqyp0xx
         9wpKgJM4f1X74lIl7uejXt0H/cf5by50ds5IHPt5tojJn+6IG9BejQLT9FQB2d7q6S/t
         N8/pVarA1+tJ7X7pWW1+ZdRYGEGmm7S3/48sdje+rbRBJijhUC/POaB/+OMPbPd7HqIg
         JAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=UnQLiliA9hI58ulfyIL2yz7hhigga6zrAzxyol2dLNE=;
        b=XwWySEsF8Vjtte+ftK5rM1dwgT5IH65mJeqlhsoz+glIz7kn8x6sAy1eHSOhWdr8Rt
         VdvhbUYKOLP82lB/WCpPAfoiK+asJKpCxN34rAVkAX++iJXFeaDpiPdtEWCTElIs5/Jz
         asiDWGp67lX3SgCj+wXm3wbC3MR/y0yT5TA9j8NGaGyQSTJAQS8jAEuZQVbkY55Mq4N/
         048gsKRvr08KwCU+58bjnPaj1icl09k2NzsdzwhWI7TF9FN98mSRDnz/28hhN0QPdBFJ
         ifbWRKtbPLucfB3vnXSaLA4P2TUBWSYfJBvXrOkE9x9rrXyBWVLlHHYDGBDghaX46wgY
         V04A==
X-Gm-Message-State: APjAAAVgCBN12lkC8ip7PyVMarQb0SS7FxcWxZ9vG0Q41EMHreXalL07
        05MBEWKbFWMFUkvSVfZ909N33A==
X-Google-Smtp-Source: APXvYqwGcntH0CmW8TUnbK2LoTFyM+Ubibw+J5+wzkcPqiSEriQIeC1GyMpDNyAPD5L10m+wu5id0A==
X-Received: by 2002:a5d:6644:: with SMTP id f4mr11942866wrw.51.1559808830905;
        Thu, 06 Jun 2019 01:13:50 -0700 (PDT)
Received: from dell ([2.31.167.229])
        by smtp.gmail.com with ESMTPSA id r9sm1195097wrq.0.2019.06.06.01.13.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jun 2019 01:13:50 -0700 (PDT)
Date:   Thu, 6 Jun 2019 09:13:48 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, robh+dt@kernel.org,
        mark.rutland@arm.com, agross@kernel.org, david.brown@linaro.org,
        dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, hdegoede@redhat.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: Add Lenovo Miix 630
Message-ID: <20190606081348.GB4797@dell>
References: <20190423160543.9922-1-jeffrey.l.hugo@gmail.com>
 <20190423160616.10017-1-jeffrey.l.hugo@gmail.com>
 <20190606055034.GA4797@dell>
 <20190606072601.GT22737@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190606072601.GT22737@tuxbook-pro>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 06 Jun 2019, Bjorn Andersson wrote:

> On Wed 05 Jun 22:50 PDT 2019, Lee Jones wrote:
> 
> > On Tue, 23 Apr 2019, Jeffrey Hugo wrote:
> > 
> > > This adds the initial DT for the Lenovo Miix 630 laptop.  Supported
> > > functionality includes USB (host), microSD-card, keyboard, and trackpad.
> > > 
> > > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/Makefile             |   1 +
> > >  .../boot/dts/qcom/msm8998-clamshell.dtsi      | 278 ++++++++++++++++++
> > >  .../boot/dts/qcom/msm8998-lenovo-miix-630.dts |  30 ++
> > 
> > What's happening with this patch?
> > 
> 
> The thermal-zones are wrong, but I'm okay with an incremental patch for
> that...

I guess it would take you about 10 seconds to whip those out when
merging?

> > It's been on the list a while now.  I'm waiting for it to be accepted,
> > since there are patches I wish to submit which are based on it.
> > 
> > Who is responsible for merging these?
> 
> ...so I've just been waiting for a conclusion on the HID patch before I
> could pick this up.

Aren't they orthogonal? 

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
