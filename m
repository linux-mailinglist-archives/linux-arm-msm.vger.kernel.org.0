Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE7D19CD68
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2020 01:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387919AbgDBXSr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 19:18:47 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38355 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731842AbgDBXSp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 19:18:45 -0400
Received: by mail-pg1-f193.google.com with SMTP id x7so2580317pgh.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2020 16:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hRNopbGVH3Ptzrk/4MigR6ROi/adYHKfTDbekJj0Qcw=;
        b=OVTTLbqfhamXMqXPgwu6x5Mo38O93HBEbTvyjst4xdirc50oDR9GO3KFQQV+0NQVvN
         +nghNBkNzsB3y4VN5jq2ZOluhiZCr7VZUabHsiEeBGUofT7BrZPUsXupRGWCsa2D6P+d
         6xsC5oXEnkeA7ZUhceQ914ZtS3D4p9TatXJnbWhd+7A7VNOCMvfkH0qv0Tq5aoBXLk1h
         4a+lfPYyBy9IiXf9KiE6MQkpIFUrl1Sg3hkFxrnJOuyRh7/TUzJezaYAIMgG+MX6uk1I
         z39i6CS69q7Kpj9bGwYw2vCnnw4ZHKx1Tz21/NC+K6wmYN9Vnn8LQ7ayBTqAZm1rf+u/
         glkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hRNopbGVH3Ptzrk/4MigR6ROi/adYHKfTDbekJj0Qcw=;
        b=kY5higir+vrNLqE1vBh8yg0ATjelZQJePxbUSFNOQAPzrKVXMJOVBIc0iA6TnWsvYR
         w+wKfKXisjWK0HCyhiONbV8TBh/RFsA7yBcPymHNEufIAsJkv4oAaPedmXQzLB4XSomz
         /eYWi/ZAUuxIy5UDgLZIj2IP8A0qFT7veuGv/gptYfawjDhkI4ocRrWazgeAKMDfr6Z6
         0rk23gy6nKXl3qfGQRoEMDNHoGeBOz03ILFDkA4qtZjMh2Aw5GnpY1D9xoj6ntxepWV9
         Bl6IT+9PbH2ed19hr0YM63rAXYbgSlk1Zew/2aFHWpRuSCJFu2kejc3Hs4fvNdUv8Ov7
         VKFA==
X-Gm-Message-State: AGi0PuZ+j36NlYu+CVy125i+v+s9WqsI+fJCO2Ejxh8GlnetPhQe+wsf
        y5OEH+gR9OYIzV4Ytz3Na745ug==
X-Google-Smtp-Source: APiQypI7H+r1Eg5xc73T+t+fbfyInBtijzZTZim9htzlxz42ZqZLdPFt4zBC8Pp5SoJ45JlVVHugEg==
X-Received: by 2002:a63:e56:: with SMTP id 22mr5520736pgo.173.1585869523780;
        Thu, 02 Apr 2020 16:18:43 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id m9sm4436895pff.93.2020.04.02.16.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 16:18:43 -0700 (PDT)
Date:   Thu, 2 Apr 2020 16:18:40 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH] phy: qcom-qusb2: Re add "qcom,sdm845-qusb2-phy" compat
 string
Message-ID: <20200402231840.GA327102@minitux>
References: <CANcMJZCr646jav3h14K0xV=ANMxXg=U20wvSB546qrLX3TECBg@mail.gmail.com>
 <20200402223723.7150-1-john.stultz@linaro.org>
 <CAD=FV=VGT75c4_ErQAJgNtcCd2Jzv0A2KpfEkS637GqOhamj9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=VGT75c4_ErQAJgNtcCd2Jzv0A2KpfEkS637GqOhamj9Q@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 02 Apr 15:56 PDT 2020, Doug Anderson wrote:

> Hi,
> 
> On Thu, Apr 2, 2020 at 3:37 PM John Stultz <john.stultz@linaro.org> wrote:
> >
> > In commit 8fe75cd4cddf ("phy: qcom-qusb2: Add generic QUSB2 V2
> > PHY support"), the change was made to add "qcom,qusb2-v2-phy"
> > as a generic compat string. However the change also removed
> > the "qcom,sdm845-qusb2-phy" compat string, which is documented
> > in the binding and already in use.
> >
> > This patch re-adds the "qcom,sdm845-qusb2-phy" compat string
> > which allows the driver to continue to work with existing dts
> > entries such as found on the db845c.
> >
> > Cc: Andy Gross <agross@kernel.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Doug Anderson <dianders@chromium.org>
> > Cc: Manu Gautam <mgautam@codeaurora.org>
> > Cc: Sandeep Maheswaram <sanm@codeaurora.org>
> > Cc: Matthias Kaehlcke <mka@chromium.org>
> > Cc: Stephen Boyd <swboyd@chromium.org>
> > Cc: Kishon Vijay Abraham I <kishon@ti.com>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Fixes: 8fe75cd4cddf ("phy: qcom-qusb2: Add generic QUSB2 V2 PHY support")
> > Reported-by: YongQin Liu <yongqin.liu@linaro.org>
> > Signed-off-by: John Stultz <john.stultz@linaro.org>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qusb2.c | 3 +++
> >  1 file changed, 3 insertions(+)
> 
> Do you have an out-of-tree dts file?  If not, I'd prefer that the fix
> was for this patch to land instead:
> 
> https://lore.kernel.org/r/1583747589-17267-9-git-send-email-sanm@codeaurora.org
> 
> While we can land your patch if someone needs it for supporting an
> out-of-tree dts, it gives people supporting future SoCs the idea that
> they need to add themselves to this table too.  That's now discouraged
> unless there's a specific quirk that needs to be handled just for this
> SoC.
> 

Afaict the compatible has been in use in the upstream sdm845.dtsi since
v4.20 and we do have an outspoken rule that we don't break backwards
compatibility with existing DTBs.

There are cases where it makes sense to break this rule, e.g. to fix
something that's clearly broken, but I don't see that this is such a
case.

Regards,
Bjorn
