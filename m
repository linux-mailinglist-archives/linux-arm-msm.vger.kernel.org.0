Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8013D4B78F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Feb 2022 21:53:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239569AbiBORzT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 12:55:19 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235757AbiBORzT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 12:55:19 -0500
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ACEFFFF80
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 09:55:09 -0800 (PST)
Received: by mail-il1-x130.google.com with SMTP id d3so15421591ilr.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 09:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=11TTvYS0k6LfV7xNa4WvisJePciPnHEL/Fmk4Jio8z8=;
        b=YVwlmBEkCqlHds72W2w+Ed9UWX2W0ynjWOpTRpsb9s5aVJwsy2f6rrbyAKW+J1Kp1C
         KeBT2Io2ki5FzrhBGgcdXM/NKYi+KkaPKbJ+mfqBh4A5ygDXUhxw5OAi80283QibccE1
         XhL2vQCq4WOt4NhC0nHObNEEhCpKVGMdUybN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=11TTvYS0k6LfV7xNa4WvisJePciPnHEL/Fmk4Jio8z8=;
        b=daGlK9QiKG4m5zcsXCJKJHad5++7/ePMv9TWprKRRtdJfQ3qL9+tiR7D0lFIZCYQuP
         ke8cfCO/KC7eXQ/eJQGdi2hUk250qSmWvGrSRVydAWIH0IzwF0t/m3Gfn9xUvCwW7gh5
         dmGp1+SRX0pDHPU70sBnJMGj7uiSfjNV99HcISgLCVzWs7N4F2Nd5mjsL4LwPUKHCPNU
         H4JGvsIfuGyYvZ6f8pKXCam1XTWC3PgdASB1sA8k80XmuCSRiBxEI56kxJ+TD90pF1wy
         QrpVLfydDP3dPmuKxiz4pYFYfkvj1nczCArNxAgI8wJg6qm3YHwpqdZvu2PVqZCcc938
         Xh2Q==
X-Gm-Message-State: AOAM530u786j8T1Fv6ssT49hmJUWazqcBHEpKL5w3b6xNHJUxnmbtN7X
        aBOI8i7x/mwoFJfARkWhv5E6W2J4jbxFnQ==
X-Google-Smtp-Source: ABdhPJyEUXgDW2CegmArWIPlRMUMViuUcjzDyPZz6wxDwlUguELByQj/uZ33aZ9LNr0h+ocTcP1STw==
X-Received: by 2002:a05:6e02:1b0c:: with SMTP id i12mr158613ilv.78.1644947708520;
        Tue, 15 Feb 2022 09:55:08 -0800 (PST)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com. [209.85.166.174])
        by smtp.gmail.com with ESMTPSA id p16sm19483060ilm.85.2022.02.15.09.55.06
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Feb 2022 09:55:06 -0800 (PST)
Received: by mail-il1-f174.google.com with SMTP id c14so5823337ilm.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 09:55:06 -0800 (PST)
X-Received: by 2002:a05:6e02:1bed:: with SMTP id y13mr141154ilv.27.1644947705606;
 Tue, 15 Feb 2022 09:55:05 -0800 (PST)
MIME-Version: 1.0
References: <20220119204345.3769662-1-mka@chromium.org> <20220119124327.v20.5.Ie0d2c1214b767bb5551dd4cad38398bd40e4466f@changeid>
 <YgJMkFAxjazkUDZd@kroah.com> <YgLCswtX/0THkzXT@google.com>
In-Reply-To: <YgLCswtX/0THkzXT@google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 15 Feb 2022 09:54:54 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WMP8M5HTRNv9_scvrytbpE0iBdUack=XaHoypGNLJeVA@mail.gmail.com>
Message-ID: <CAD=FV=WMP8M5HTRNv9_scvrytbpE0iBdUack=XaHoypGNLJeVA@mail.gmail.com>
Subject: Re: [PATCH v20 5/5] arm64: dts: qcom: sc7180-trogdor: Add nodes for
 onboard USB hub
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Peter Chen <peter.chen@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Roger Quadros <rogerq@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Feb 8, 2022 at 11:21 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> On Tue, Feb 08, 2022 at 11:57:20AM +0100, Greg Kroah-Hartman wrote:
> > On Wed, Jan 19, 2022 at 12:43:45PM -0800, Matthias Kaehlcke wrote:
> > > Add nodes for the onboard USB hub on trogdor devices. Remove the
> > > 'always-on' property from the hub regulator, since the regulator
> > > is now managed by the onboard_usb_hub driver.
> > >
> > > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> >
> > No DT maintainer approval yet?  :(
>
> Bjorn usually just picks DT changes into the QCOM tree when they are
> ready, so I wouldn't interpret anything into the lack of an explicit
> Ack.

Right, so the expectation is that this patch wouldn't land through the
USB tree but would instead land through the Qualcomm tree, probably a
revision after the code lands in the USB tree to avoid dependency
problems.

-Doug
