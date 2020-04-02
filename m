Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 326B919CD58
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2020 01:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390100AbgDBXIg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 19:08:36 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:36518 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732600AbgDBXIf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 19:08:35 -0400
Received: by mail-ot1-f65.google.com with SMTP id l23so5398339otf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2020 16:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QQeb3TySrXKWjqdpdystZzrLdZhobbR4wczMyxU9daE=;
        b=NJH8mUDyS4vydKm8ozgwIwBIN0a+isHGLQhu1Xa7KlLuolkz3lTRHWLGbQWqH3DraZ
         GVKcNeq10kJshsCpCmD1ur2WOCalb70yJRRqscOw6we52/btmA03mOpNDeepRwaZoCKx
         dJnRiSXTU6iVG2WpqT5DIUkzfttiDahvRrN9Ewboh/gzEwIivf1ZemL3a2CfwUbgyEk+
         2hChBjqqFqpMhYxoe+FEq53Gsdh4f2ziNfFkSadQSpgWvqL+EBX+bXP8uMgyvWFIYFUI
         90w2wzB44wDQeY7nCWytwHwPOT1gRiQLyRCC3DnFQq2w4RQ2VwXqZVzPKsRGfmhCuw6R
         MIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QQeb3TySrXKWjqdpdystZzrLdZhobbR4wczMyxU9daE=;
        b=PzAZUvzafsCcsK5c2bMy8quNqxjublgSiT1o4C1BjrIjMQJ4t/1z3w/qdMu2JT1a0i
         HDh2S4uPVhuaIIUWJfHDLW6DOaTqHgT+WfuOcbbgIUiAHzWHkLdrT3OyvKBsN/GV9wFK
         g6JP5+k2h73aYIxYZ5+xbZ5v7UrUOf2LpGWnKtmz7oRUAOuPI8coZJttgNkeBwerHVFF
         7cdtb6aeKuy0ow3XdzKSe4YFmjC3kNtmjgQyCcqtpx7MwvlvSupfJpLmAPNf5gRE0+P/
         gNUOk5JxrK7j+6Aok522IwyB0gbafex4JMyR1wWprj501YHEe93ZFwmsWxBK+bsFAbf4
         ndzg==
X-Gm-Message-State: AGi0Pua2FvsJnUiYVMdtvHq6t3j9X/Y5CnDyVmdC78oNsPK5gQk1eb/k
        OQZGZRhrEV9RB5o9i7snfk6GQLG0zfTdEZq4rptJOA==
X-Google-Smtp-Source: APiQypLZA26Q+M0Ymf7b40RsmQRLEnKqmqg5on5PqLiHU2wifOGb73iVFhOLTaxXIGxQBRFM25QTMqgRbY3IyGi8mMM=
X-Received: by 2002:a9d:344:: with SMTP id 62mr4591686otv.102.1585868913011;
 Thu, 02 Apr 2020 16:08:33 -0700 (PDT)
MIME-Version: 1.0
References: <CANcMJZCr646jav3h14K0xV=ANMxXg=U20wvSB546qrLX3TECBg@mail.gmail.com>
 <20200402223723.7150-1-john.stultz@linaro.org> <CAD=FV=VGT75c4_ErQAJgNtcCd2Jzv0A2KpfEkS637GqOhamj9Q@mail.gmail.com>
In-Reply-To: <CAD=FV=VGT75c4_ErQAJgNtcCd2Jzv0A2KpfEkS637GqOhamj9Q@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 2 Apr 2020 16:08:21 -0700
Message-ID: <CALAqxLXfd+7Wc79_XWRv8cKLFu+MpM1w9e3byx9z5bXSdTemLg@mail.gmail.com>
Subject: Re: [PATCH] phy: qcom-qusb2: Re add "qcom,sdm845-qusb2-phy" compat string
To:     Doug Anderson <dianders@chromium.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 2, 2020 at 3:56 PM Doug Anderson <dianders@chromium.org> wrote:
>
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

No, no out of tree dts.  The usage is already in tree:
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/sdm845.dtsi#n2389


> While we can land your patch if someone needs it for supporting an
> out-of-tree dts, it gives people supporting future SoCs the idea that
> they need to add themselves to this table too.  That's now discouraged
> unless there's a specific quirk that needs to be handled just for this
> SoC.

My understanding with dts bindings is that they are effectively an
ABI. While maybe it makes sense to deprecate the
"qcom,sdm845-qusb2-phy" string in the Documentation to avoid new
users, I'd think we'd want to keep the support in the driver as we
aren't supposed to have tight coupling between the DTB and kernel (at
least for official bindings).

Granted, I've not gotten much experience with boards that were fully
upstream and thus didn't have an eternally evolving dts file that had
to be kept in sync with the kernel, so in practice either solution
does work for me, but in theory it seems like we should at least
pretend these things are stable. :)

thanks
-john
