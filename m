Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3194125657
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 23:13:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbfLRWNN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Dec 2019 17:13:13 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38252 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbfLRWNN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Dec 2019 17:13:13 -0500
Received: by mail-ot1-f67.google.com with SMTP id h20so4365493otn.5;
        Wed, 18 Dec 2019 14:13:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rI3WWPDTG8f4hp6ciK/onj/YhaLhgFmrBxyBXIrJLuc=;
        b=J2cFl4okTSADjJI2f3fYWHEIhDzjWT64hCA7tvWtj81TCd1/MWkluUwvbY4Oma82Me
         ydCdmABqX+lh00AJbmpUWDbnCGcyEOgBOjDQAEei1uzRiekrGHAUMrmTyk00zzbbtKtr
         M+78rdhelVmHDt+ij77O9b6JwUbN2WFiXpkDQ06vWTtcyM/rrjVNee01fKSz3Z8B29gR
         e7Zx0MstkGesUvtTHdMEB0jfUgWaYv64GvURYBPoRnzi4Dq6MAlvjWU33MKa7pn4qi9y
         DwTSMIEdwuvNMOP+/S2ET47MQ/BIEPCpfF/7c0V0iNmEUPiSCL9+h/M80+nWNC6i8xyd
         bluA==
X-Gm-Message-State: APjAAAU1EoVQTfsB7fQlCujZwDVNEPErH30T71uo5WXOC6PKFbx05XtP
        NAbR955Dnwqs4jpBcDf7Jg==
X-Google-Smtp-Source: APXvYqy3Y+DNZas+7C5PREmO+AePBLrmSYGx16wpsRSDrJLuqkNjf2exWPC5RAnKUh8l8Gs4LohMJA==
X-Received: by 2002:a9d:6b06:: with SMTP id g6mr5045060otp.93.1576707191756;
        Wed, 18 Dec 2019 14:13:11 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y6sm1279823oti.44.2019.12.18.14.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 14:13:11 -0800 (PST)
Date:   Wed, 18 Dec 2019 16:13:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-usb@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: qcom,dwc3: Convert USB DWC3
 bindings
Message-ID: <20191218221310.GA4624@bogus>
References: <1576474742-23409-1-git-send-email-sanm@codeaurora.org>
 <1576474742-23409-2-git-send-email-sanm@codeaurora.org>
 <CAD=FV=U48gdGHMbQ22M_59t6va2n41Zh1CDTqMJYpLCwiD35Mg@mail.gmail.com>
 <6d8c979f-daa3-3b40-f29c-cca5a2f8f1c8@codeaurora.org>
 <CAD=FV=UER4zt=z3XWEzNt5v2oe8V=z6Hb-Wm-2BzuWtuHmYg-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=UER4zt=z3XWEzNt5v2oe8V=z6Hb-Wm-2BzuWtuHmYg-A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 18, 2019 at 10:37:53AM -0800, Doug Anderson wrote:
> Hi,
> 
> On Wed, Dec 18, 2019 at 4:41 AM Sandeep Maheswaram (Temp)
> <sanm@codeaurora.org> wrote:
> > +  assigned-clock-rates:
> > +    description:
> > +      Should be 19.2MHz (19200000) for MOCK_UTMI_CLK
> > +      >=125MHz (125000000) for MASTER_CLK in SS mode
> > +      >=60MHz (60000000) for MASTER_CLK in HS mode
> > +    maxItems: 2
> >
> > You can still express some limits here even if we don't go all out
> > with the "oneOf".  AKA I think this is better:
> >
> > assigned-clock-rates:
> >   items:
> >     - const: 19200000
> >     - minimum: 60000000
> >       description: >= 60 MHz in HS mode, >= 125 MHz in SS mode
> >
> > Facing error when i add as above.
> > properties:assigned-clock-rates: {'items': [{'const': 19200000}, {'minimum': 60000000}]} is not valid under any of the given schemas
> > Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/usb/qcom,dwc3.example.dts' failed

Update dtschema and you should get a better error message now.

I believe the problem is we require both minimum and maximum to be 
specified or none. Maybe we should relax that, but OTOH I doubt 4GHz is 
valid.

Rob
