Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8DBC43A613
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 23:41:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233041AbhJYVoK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 17:44:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233020AbhJYVoJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 17:44:09 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E4E7C061220
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 14:41:46 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id l10-20020a056830154a00b00552b74d629aso16874630otp.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 14:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FGNc9Tx8g5/v6KFaaId5VnO2l2Gb29zLqsK+20u4jlQ=;
        b=cJ3SgI091BISPRXBiE8q+NoMzCMMO7TE3mUjnVUSZyyTM/2HdEVTjjMyq1UXYuMO/I
         9qbPtU9k5GfpLfM8F5+H9jcEfr/yhky4VTwQKbUFixO2j+WJbmYLLbSskU78vG9M67gX
         fEvF1LXQw9Avk5tv4b51z16nbHxwj5vIdMelwpLPvEfeK4GaaQHo9EdS/1qo7r/rwV2s
         FPDNv8jCkgsJnDCsSVlF2pUZ+2Eged6qJeAVqKkpDWh5KjAgHW0qvj7PcQd2taipNnoZ
         9qMAgV881ohcmD70JM1ccV+heo10pUPygClUkcx53B4MuxQl5H8u/jc/gnMlmfXu4YcC
         C8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FGNc9Tx8g5/v6KFaaId5VnO2l2Gb29zLqsK+20u4jlQ=;
        b=6BeNcyLa3llOrQNKg21xEW+8vtfuTTt8hSuuEl735v+TMIU4qzFi+2iJ/Ino7w4uY1
         u0YS0mDKzMKWzDwCJrQqiP86DY9HNU/huHmxpZ3u8Avw2cKm9sfRrDtZn4wz6nH6ZHjK
         wTekJR6BVDo8etMwJeXVW6ugeiZFOQLsG0U0zPQg/zIdI2nL76zWSbs+hEHQajX38RbT
         Tsy2g9Y/P4hvo3Om+b92AbKFOcrc4wawhLISIDMTEh6HQsV0NgixuHX+x3fTpqEJRkEO
         o8uiUdaqN+XAQ10QM4y0iAk0HDiZLo0hb0QdC6tltiG5k7Y/m3u+4w3sGIVAF5eIorNw
         mq0w==
X-Gm-Message-State: AOAM531f73iZ8xM60A+7rj38PxNt4Vqdk5aDBRO6YgybH1RvBHdFsFWT
        WUIwdvpXD5RV2/eeWvQm5Q8qbw==
X-Google-Smtp-Source: ABdhPJyLPL3Eu2q0jA6zGLKMIGyDySUIKVBTEKYYpx+QwwdzIq5OVLXZHPgZxZS1/B9VT/HVaxe4Ng==
X-Received: by 2002:a9d:704d:: with SMTP id x13mr15188704otj.4.1635198105567;
        Mon, 25 Oct 2021 14:41:45 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id s20sm4306440oiw.17.2021.10.25.14.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 14:41:45 -0700 (PDT)
Date:   Mon, 25 Oct 2021 14:43:23 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: qcom,dwc3: Add multi-pd
 bindings for dwc3 qcom
Message-ID: <YXck+xCJQBRGqTCw@ripper>
References: <1635152851-23660-1-git-send-email-quic_c_sanm@quicinc.com>
 <1635152851-23660-2-git-send-email-quic_c_sanm@quicinc.com>
 <YXcBK7zqny0s4gd4@ripper>
 <CAE-0n51k8TycXjEkH7rHYo0j7cYbKJOnOn1keVhx2yyTcBNnvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n51k8TycXjEkH7rHYo0j7cYbKJOnOn1keVhx2yyTcBNnvg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 25 Oct 13:17 PDT 2021, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2021-10-25 12:10:35)
> > On Mon 25 Oct 02:07 PDT 2021, Sandeep Maheswaram wrote:
> >
> > > Add multi pd bindings to set performance state for cx domain
> > > to maintain minimum corner voltage for USB clocks.
> > >
> > > Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> > > ---
> > > v2:
> > > Make cx domain mandatory.
> > >
> > >  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 8 +++++++-
> > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > > index 2bdaba0..fd595a8 100644
> > > --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > > @@ -42,7 +42,13 @@ properties:
> > >
> > >    power-domains:
> > >      description: specifies a phandle to PM domain provider node
> > > -    maxItems: 1
> > > +    minItems: 2
> > > +    items:
> > > +      - description: cx power domain
> > > +      - description: USB gdsc power domain
> > > +
> > > +  required-opps:
> > > +    description: specifies the performance state to power domain
> >
> > I'm still worried about the fact that we can't just rely on the USB GDSC
> > being a subdomin of CX in order to just "turn on" CX.
> >
> > Afaict accepting this path forward means that for any device that sits
> > in a GDSC power domain we will have to replicate this series for the
> > related driver.
> >
> 
> I suspect the problem is that it's not just "turn on" but wanting to
> turn it on and then set the performance state to some value based on the
> clk frequency.

I don't see an opp-table involved, just the required-opps for the
purpose of turning CX on a little bit more. Perhaps I'm missing
something here though.

> Maybe the simplest version of that could be supported
> somehow by having dev_pm_opp_set_rate() figure out that the 'level'
> applies to the parent power domain instead of the child one?

Having the performance_state request cascade up through the GDSC sounds
like a nice solution; I've not looked at the code to see if this is
feasible though.

> Or we may need to make another part of the OPP binding to indicate the
> relationship between the power domain and the OPP and the parent of
> the power domain.

I suspect this would be useful if a power-domain provider needs to
translate a performance_state into a different supply-performance_state.
Not sure if we have such case currently; these examples are all an
adjustable power-domain with "gating" subdomains.


PS. I think we have the same problem in the display subsystem, the
sub-blocks are powered by MDSS_GDSC, which is a subdomain of MMCX. We
trust the parent mdss node to keep the GDSC powered and specify MMCX as
the power-domain for the children, so that we can affect their levels by
respective opp-table.

Regards,
Bjorn
