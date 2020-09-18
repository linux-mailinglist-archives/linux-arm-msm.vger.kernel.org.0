Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05334270484
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Sep 2020 21:02:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726159AbgIRTB7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Sep 2020 15:01:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:56430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726115AbgIRTB6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Sep 2020 15:01:58 -0400
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AE02222208;
        Fri, 18 Sep 2020 19:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600455717;
        bh=rS84A/OaBg23yNAtPTq3plT5X3kOb7286omQM12f1Fk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=lBQ48smIRQIhIDWuplFGl2mJEcnYqMPakqetKj4pW2yatfyCMH9c1wXgyli7z/ZWn
         d39s0E0thPumFHv24BQtFlkwIcPw+9x6/8zHIf3wONcRQKvVaYgCAcAnNhkzELO5Ha
         C8pkBB5efZA4/zZ+GSLRZGH835T6n/Un3UenVLJ8=
Received: by mail-ot1-f42.google.com with SMTP id q21so6340787ota.8;
        Fri, 18 Sep 2020 12:01:57 -0700 (PDT)
X-Gm-Message-State: AOAM531Jb/tm6KXclqaZDWkbJ2BJma/eMT9KBJlFxRdIktggCP9VRyLt
        pW+AkTVm6W0i660/j08UDyysUqQET85EG6fMwA==
X-Google-Smtp-Source: ABdhPJy5SRe4iLnIuK1LSlYLAhKMK7cdeAyXWOah9n6KqXUDNjHoxqZWwPaLaSunMfwZS1MlOrEAELY5ORhtsHG4Pek=
X-Received: by 2002:a9d:6ada:: with SMTP id m26mr10145370otq.192.1600455716990;
 Fri, 18 Sep 2020 12:01:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1598939393.git.nguyenb@codeaurora.org> <0a9d395dc38433501f9652a9236856d0ac840b77.1598939393.git.nguyenb@codeaurora.org>
 <20200914183505.GA357@bogus> <d332e61cea4fef237507f1404efa724a@codeaurora.org>
In-Reply-To: <d332e61cea4fef237507f1404efa724a@codeaurora.org>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 18 Sep 2020 13:01:45 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+YV-GjAhVVHtgNz6xFR=bEgSwWKY+QGixRQJ5Ov75pag@mail.gmail.com>
Message-ID: <CAL_Jsq+YV-GjAhVVHtgNz6xFR=bEgSwWKY+QGixRQJ5Ov75pag@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] scsi: dt-bindings: ufs: Add vcc-voltage-level for UFS
To:     "Bao D. Nguyen" <nguyenb@codeaurora.org>
Cc:     Can Guo <cang@codeaurora.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        SCSI <linux-scsi@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Avri Altman <Avri.Altman@wdc.com>,
        Vinod Koul <vkoul@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 15, 2020 at 2:10 AM <nguyenb@codeaurora.org> wrote:
>
> On 2020-09-14 11:35, Rob Herring wrote:
> > On Mon, Aug 31, 2020 at 11:00:47PM -0700, Bao D. Nguyen wrote:
> >> UFS's specifications supports a range of Vcc operating
> >> voltage levels. Add documentation for the UFS's Vcc voltage
> >> levels setting.
> >>
> >> Signed-off-by: Can Guo <cang@codeaurora.org>
> >> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> >> Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
> >> ---
> >>  Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> >> b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> >> index 415ccdd..7257b32 100644
> >> --- a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> >> +++ b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> >> @@ -23,6 +23,8 @@ Optional properties:
> >>                            with "phys" attribute, provides phandle to
> >> UFS PHY node
> >>  - vdd-hba-supply        : phandle to UFS host controller supply
> >> regulator node
> >>  - vcc-supply            : phandle to VCC supply regulator node
> >> +- vcc-voltage-level     : specifies voltage levels for VCC supply.
> >> +                          Should be specified in pairs (min, max),
> >> units uV.
> >
> > The expectation is the regulator pointed to by 'vcc-supply' has the
> > voltage constraints. Those constraints are supposed to be the board
> > constraints, not the regulator operating design constraints. If that
> > doesn't work for your case, then it should be addressed in a common way
> > for the regulator binding.
> The UFS regulator has a min_uV and max_uV limits. Currently, the min and
> max are hardcoded
> to UFS2.1 Spec allowed values of 2.7V and 3.6V respectively.
> With this change, I am trying to fix a couple issues:
> 1. The 2.7V min value only applies to UFS2.1 devices. with UFS3.0+
> devices, the VCC min should be 2.4V.
> Hardcoding the min_uV to 2.7V does not work for UFS3.0+ devices.

Don't you know the device version attached and can adjust the voltage
based on that? Or you have to set the voltage first?

> 2. Allow users to select a different Vcc voltage within the allowed
> range.
> Using the min value, the UFS device is operating at marginal Vcc
> voltage.
> In addition the PMIC and the board designs may add some variables
> especially at extreme
> temperatures. We observe stability issues when using the min Vcc
> voltage.

Again, we have standard regulator properties for this already that you
can tune per board.

Rob
