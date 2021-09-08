Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 792DE403E1F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Sep 2021 19:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352397AbhIHRIx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Sep 2021 13:08:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352378AbhIHRIw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Sep 2021 13:08:52 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 820A5C0613C1
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Sep 2021 10:07:44 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id v2so3947444oie.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Sep 2021 10:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=E4tOgOt4yehd+aPYxD2GXw5G5+5COCK1/J0EptH+YuM=;
        b=Lht57q8kyiusHO0ElOuT7VBKg0czz5rVv5T1bwBy1eW+n36Goac9gNjuGKDhChI4YJ
         RPStEbU3JJZyI9dlyEj6Gux9JD6JN+eVM9NorAt/IYbkqldVFrg8QCm/Hy3xuoD+azpW
         fplHX1drC2ZWwHDISq4dmbnpo5txAGI9d4RmjbYN8XZD78JFPdmCg/FDQBoGJ0C/kdae
         2lTFQKTBWnR0eSqHd4yn2ENxhHvyv0t3Fw9ic103ZEWsSn7WvhT858fodmzp7SQfrdel
         IqoTvSfxrYkFVVhZmSdV2ZYSATA1qIIuFzuCrFVy5rLDENRwgR9eDTVXUKyXTkk2wpeJ
         lOMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=E4tOgOt4yehd+aPYxD2GXw5G5+5COCK1/J0EptH+YuM=;
        b=BSiHSskn99fWEOl7D3cV1w14WPbMIPUK+wScDInxDRR2CE7BKx5LCz2GHDuu69MSau
         KQZvpm0jkf0v2xS/daJjFRUw5mWMiyPxOPsI049JR3krjli63hSdqfIxaOx+drmV3gWZ
         PGH5gfnpSei9JhwfJ7teSzrt89ntWZiimPQTLJh00NOyYThnmvbo5obEgST2Py5J0DFK
         Ykpxf0dN7hlJhg3MA9DQlYm4CXO2lGAy4DvXYXOH5kViTE0CTJn8230E7MR4tij+uWwl
         6ariagXLlzSjTIusk9lmj8SmrFlqoetqlwuswnzEZzInjUfdMf98zcfiPtK26wsAjCPP
         jldg==
X-Gm-Message-State: AOAM531iNZMrE0R+PK0hK1+G7UqGka+fU2bA1ejISlsumZv8JSX7+4lv
        RkX/wlknqBlKlwS5HXElAnkoxnt6uwYAig==
X-Google-Smtp-Source: ABdhPJxbfp3uV4sVKN/yboHL2W/8Wr9ZjBACTTJiR6MFAPHCagAUyXDvUVboRobIZ68QRCxTKhTaEA==
X-Received: by 2002:aca:3b85:: with SMTP id i127mr3157888oia.28.1631120863614;
        Wed, 08 Sep 2021 10:07:43 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h17sm544947otl.74.2021.09.08.10.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 10:07:43 -0700 (PDT)
Date:   Wed, 8 Sep 2021 10:08:41 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     skakit@codeaurora.org, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, swboyd@chromium.org,
        kgunda@codeaurora.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: pm8350c: Add pwm support
Message-ID: <YTjuGVOmzkTot8z1@ripper>
References: <1630924867-4663-1-git-send-email-skakit@codeaurora.org>
 <1630924867-4663-4-git-send-email-skakit@codeaurora.org>
 <YTeskY7kXsdmvGPp@google.com>
 <b10e5f36fb0216a4c951d752f5103099@codeaurora.org>
 <YTjW9LAGhTuszoa4@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YTjW9LAGhTuszoa4@google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 08 Sep 08:29 PDT 2021, Matthias Kaehlcke wrote:

> On Wed, Sep 08, 2021 at 02:37:39PM +0530, skakit@codeaurora.org wrote:
> > On 2021-09-07 23:46, Matthias Kaehlcke wrote:
> > > On Mon, Sep 06, 2021 at 04:11:07PM +0530, satya priya wrote:
> > > > Add pwm support for PM8350C pmic.
> > > > 
> > > > Signed-off-by: satya priya <skakit@codeaurora.org>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/pm8350c.dtsi | 6 ++++++
> > > >  1 file changed, 6 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> > > > b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> > > > index e1b75ae..ecdae55 100644
> > > > --- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> > > > @@ -29,6 +29,12 @@
> > > >  			interrupt-controller;
> > > >  			#interrupt-cells = <2>;
> > > >  		};
> > > > +
> > > > +		pm8350c_pwm4: pwm {
> > > 
> > > What does the '4' represent, an internal channel number? It should
> > > probably be omitted if the PM8350 only has a single output PWM
> > > port.
> > > 
> > 
> > pm8350c has four PWMs, but I think we can drop the '4' here.
> 
> Why is only one PWM exposed if the PMIC has for of them? Why number 4
> and not one of the others?

The node should represent all 4 channels, which ones the board uses is
captured in how they are bound to other clients - or defines as LEDs by
additional child nodes.

Regards,
Bjorn
