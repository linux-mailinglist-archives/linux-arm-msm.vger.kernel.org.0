Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E94A4236E3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 06:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbhJFEOR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 00:14:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230358AbhJFEON (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 00:14:13 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4E78C061755
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 21:12:21 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id g62-20020a9d2dc4000000b0054752cfbc59so1620151otb.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 21:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JeqQPQlkPMyybH7Ylv9LL4C+2+30wYTv9mWLfCOyW68=;
        b=XEjeIZfNuBmJTMi6wtAtetYggf2aHs3GPhHg1KwJz1egGXL5njhCRw3DDPgbsH7cJv
         OUWOA1oOvi2LLIVGnWT3wGH+TmJA95TyM0M6gC2kao6MWJu+bZzC5cnO84s06z3CI1AA
         XVvMCCFyDHcpCO8U8QelLmZi7fD9CRI8OYcPo6qSRxfBbT/AxB2YjYAxUJ6hV57S0w7A
         tv9MugLiCri9LD2ijJPmIfSvtHSZYv6q8bsMiyIMxl6jokP6DoYrt1m4hdtVohghtVTl
         EEr+bbftzq4eN6V4Bov3juUBbxPCEkxk4V/sQTSbb+6ENfzMeMK65PcTxz1DE8SImzIX
         +iKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JeqQPQlkPMyybH7Ylv9LL4C+2+30wYTv9mWLfCOyW68=;
        b=Qw3wKq9dBg7pzdJXDs8AT0JXRyJqJo+ch1w9dr0sUdBF7nJws1TzqMouC+2qBmeM8l
         cpHES/i1D9/gGPo2W+M7Upw6KvptQKjFBcm5bhEkndEFSgpz/DCBWimAj3KcFmzYLLVx
         1oK5XsvwHXxeinqsw4atdoO4OvmbtDcxnE2Q+VhJTGWPI9Z1AcGUJ6exy+AX7vwOlg7U
         G8CRMDhdyBbL/mh8Y1F8lSGWlStaAaB19CZ3ccYDleOuMb5QKQHDdKKmn3xTClmwFIeu
         nCQhuI25+FMgT5GVZqNfBJOR7GbmC3HM9rB3ULUr2oaPkFBf3344R8jrszqDIIQldxln
         e40w==
X-Gm-Message-State: AOAM533Kw0msSE3SDnoTJxJIy0M5Bf2pOdLtwov3Pri/9HoPlIF5hTAq
        CrlkBvkbo/uFTo6wuqXUYhxOIw==
X-Google-Smtp-Source: ABdhPJx/5egmLBcK43fNwucfO1oEx4RaFxVzQH0A8+50zHcH+LenRxckCdmVbnSpKpPJhWTVbKHZbA==
X-Received: by 2002:a9d:12c8:: with SMTP id g66mr276609otg.7.1633493541062;
        Tue, 05 Oct 2021 21:12:21 -0700 (PDT)
Received: from yoga ([2600:1700:a0:3dc8:c84c:8eff:fe1e:256f])
        by smtp.gmail.com with ESMTPSA id u12sm4009329otq.20.2021.10.05.21.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 21:12:20 -0700 (PDT)
Date:   Tue, 5 Oct 2021 23:12:18 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe Kleine-K?nig <u.kleine-koenig@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pwm@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: Re: [PATCH v9 1/2] dt-bindings: leds: Add Qualcomm Light Pulse
 Generator binding
Message-ID: <YV0iIlTra++r9dL0@yoga>
References: <20210623035039.772660-1-bjorn.andersson@linaro.org>
 <YToluIBXlNJEFhcb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YToluIBXlNJEFhcb@google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 09 Sep 10:18 CDT 2021, Matthias Kaehlcke wrote:

> On Tue, Jun 22, 2021 at 08:50:38PM -0700, Bjorn Andersson wrote:
[..]
> > +  - |
> > +    #include <dt-bindings/leds/common.h>
> > +
> > +    lpg {
> > +      compatible = "qcom,pmi8994-lpg";
> > +
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +
> > +      qcom,power-source = <1>;
> > +
> > +      multi-led {
> > +        color = <LED_COLOR_ID_RGB>;
> > +        function = LED_FUNCTION_STATUS;
> > +
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        led@1 {
> > +          reg = <1>;
> > +          color = <LED_COLOR_ID_RED>;
> > +        };
> > +
> > +        led@2 {
> > +          reg = <2>;
> > +          color = <LED_COLOR_ID_GREEN>;
> > +        };
> > +
> > +        led@3 {
> > +          reg = <3>;
> > +          color = <LED_COLOR_ID_BLUE>;
> > +        };
> > +      };
> > +    };
> > +  - |
> > +    lpg {
> 
> nit: should the node be named 'lpg-pwm'?
> 
> IIUC a PMIC .dtsi could have both a 'lpg' and a 'lpg-pwm' node, even though
> only one of them can be enabled at any time.
> 

No, there's only the one "LPG", with N channels. The lpg exposes a pwm
chip and the child nodes may describe LEDs connected to the channels.
So this example is the configuration where there's no LEDs attached.

The compatible is "pwm", because the PM8916 lacks the pattern and RGB
blocks that makes up the LPG - and is hence named "PWM" in the datasheet
instead. So perhaps the example should be generically named "pwm"
instead.

In all other PMICs I know of the hardware block is named "lpg".

Regards,
Bjorn

> > +      compatible = "qcom,pm8916-pwm";
> > +      #pwm-cells = <2>;
> > +    };
