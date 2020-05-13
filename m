Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7AA41D1A90
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 18:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389526AbgEMQEr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 May 2020 12:04:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730984AbgEMQEq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 May 2020 12:04:46 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94104C061A0C
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2020 09:04:46 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id j21so7972896pgb.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2020 09:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=hJ5N61sE10eRL4DM+W4UrbBWatlxhnPhuPfpeLbYAOQ=;
        b=kiSqRdlAm/boKLbWTfEN2X8+EBqRaSVdoXYv9kJa02YIgbVYXvRF+59+Yv2XHKo8qi
         rBrpN0s6yx2dUyuMJKbhVZsqeCS3FoA02wD+Ts7ytX9iEqVPDClUmPSGVU+683k46TMz
         FwKWxLWqerz5HCZCdfAGZbw6Lk+DW+F98PsFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=hJ5N61sE10eRL4DM+W4UrbBWatlxhnPhuPfpeLbYAOQ=;
        b=C2y+NVD3rbuOfUProhdi6gRzHjQbeCZ2FbASR/fgz2V/fLbGV+NLevLoEPzKo5reJ+
         GUiPjM6EciaLZcCjEfiCrbif2rJxVBrgKumUut4Lwjm6DEt1371nlJRNMLBSBLGwVy7n
         zJ82LkvPr//qMY8Ams7pYxgEoRL+K1GAtiTf2CxyHtxIwZGUy9i5ra9wyXVe4a6ZCizh
         loFmG9R5rkpL3/0HwwvFsgwvue0mjJerAXiZCybuLNWziBGijxx52q1EiQsBmnVyDHzj
         iw2VBC1rp1e41sWdFr67WKjkWUVgssAEcXhahHI3wrqn0p0rxUg8fqsSQAfgU9UP2yEA
         ljbw==
X-Gm-Message-State: AOAM533Xy5eDI1vQbOW3eqcgzqFdagb4QG1g63bMyk9oHWnJOqLXG4lh
        +pxXKuW1rBRik1kPuybvMuLUNw==
X-Google-Smtp-Source: ABdhPJyPsTcFSIBk/DAHklhW1pcRIRaRaUU5QwbDE+nyHPm0ykX7G67oXsvcd4xplfYnljeDPtlE5w==
X-Received: by 2002:a62:7bcf:: with SMTP id w198mr44902pfc.226.1589385885999;
        Wed, 13 May 2020 09:04:45 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id h31sm16404422pjb.33.2020.05.13.09.04.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2020 09:04:45 -0700 (PDT)
Date:   Wed, 13 May 2020 09:04:43 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org>
Cc:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: qcom,dwc3: Convert USB DWC3
 bindings
Message-ID: <20200513160443.GK4525@google.com>
References: <1585206368-685-1-git-send-email-sanm@codeaurora.org>
 <1585206368-685-2-git-send-email-sanm@codeaurora.org>
 <20200404171700.GA10096@bogus>
 <5e2eb0a4-ed70-4212-fc70-6ee850507a7e@codeaurora.org>
 <5793ea62-7a73-789e-33d6-6b2fb37b376c@codeaurora.org>
 <20200423193923.GK199755@google.com>
 <64ce118c-2a8d-e16c-eed1-49350c8b07bc@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <64ce118c-2a8d-e16c-eed1-49350c8b07bc@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sandeep,

I would suggest to send v6 with the changes Rob and Stephen requested,
except for the 'assigned-clock-rate' constraints. A description instead
of the constraints is not ideal, but the constraints could be also be
added at a later time. Hopefully Rob can either ack with the description
or help to resolve the constraints issue.

Regards

Matthias

On Fri, May 08, 2020 at 11:52:52AM +0530, Sandeep Maheswaram (Temp) wrote:
> Hi Rob,
> 
> Any suggestions to solve this error in assigned-clock-rates
> 
> 
> Regards
> Sandeep
> 
> On 4/24/2020 1:09 AM, Matthias Kaehlcke wrote:
> > On Wed, Apr 15, 2020 at 02:23:29PM +0530, Sandeep Maheswaram (Temp) wrote:
> > > Hi Rob,
> > > 
> > > Any suggestions to solve this error in assigned-clock-rates
> > > On 4/6/2020 10:09 PM, Sandeep Maheswaram (Temp) wrote:
> > > > Hi Rob,
> > > > 
> > > > On 4/4/2020 10:47 PM, Rob Herring wrote:
> > > > > On Thu, Mar 26, 2020 at 12:36:07PM +0530, Sandeep Maheswaram wrote:
> > > > > > Convert USB DWC3 bindings to DT schema format using json-schema.
> > > > > > 
> > > > > > Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> > > > > > ---
> > > > > >    .../devicetree/bindings/usb/qcom,dwc3.txt          | 104
> > > > > > --------------
> > > > > >    .../devicetree/bindings/usb/qcom,dwc3.yaml         | 158
> > > > > > +++++++++++++++++++++
> > > > > >    2 files changed, 158 insertions(+), 104 deletions(-)
> > > > > >    delete mode 100644
> > > > > > Documentation/devicetree/bindings/usb/qcom,dwc3.txt
> > > > > >    create mode 100644
> > > > > > Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > > > > > diff --git
> > > > > > a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > > > > > b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > > > > > new file mode 100644
> > > > > > index 0000000..0f69475
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > ...
> > 
> > > > > > +    items:
> > > > > > +      - description: Must be 19.2MHz (19200000).
> > > > > Sounds like a constraint:
> > > > > 
> > > > > - const: 19200000
> > > > > 
> > > > > > +      - description: Must be >= 60 MHz in HS mode, >= 125 MHz
> > > > > > in SS mode.
> > > > > - minimum: 60000000
> > > > >     maximum: ?
> > > > Tried  as below but facing errors
> > > > 
> > > > assigned-clock-rates:
> > > >      items:
> > > >        - const: 19200000
> > > >        - minimum: 60000000
> > > >          maximum: 150000000
> > > > 
> > > > Errors
> > > > 
> > > > linux-next/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dt.yaml:
> > > > usb@a6f8800: assigned-clock-rates: Additional items are not allowed
> > > > ([150000000] was unexpected)
> > > > linux-next/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dt.yaml:
> > > > usb@a6f8800: assigned-clock-rates:0: [19200000] is too short
> > > > linux-next/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dt.yaml:
> > > > usb@a6f8800: assigned-clock-rates: [[19200000], [150000000]] is too long
> > judging from the error messages my uneducated guess is that the above rules for
> > assigned-clock-rates expect a single tuple of two elements, not two tuples with
> > a single element, i.e.
> > 
> > assigned-clock-rates = <19200000, 150000000>;
> > 
> >    instead of
> > 
> > assigned-clock-rates = <19200000>, <150000000>;
> > 
> > I experimented a bit but couldn't find the magic incantation to appease the
> > schema deities.
> > 
> > Rob, could you please help to distentangle this?
> > 
> > Thanks
> > 
> > Matthias
> 
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
> 
