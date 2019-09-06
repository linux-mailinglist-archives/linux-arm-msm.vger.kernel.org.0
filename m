Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF046ABF53
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2019 20:25:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392348AbfIFSZf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Sep 2019 14:25:35 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:32856 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390378AbfIFSZe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Sep 2019 14:25:34 -0400
Received: by mail-pg1-f193.google.com with SMTP id n190so3950497pgn.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Sep 2019 11:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=hi4I00yzrvjyDfq4Sb0LtZ///vr5wch4QIwVVeeu58U=;
        b=tgPNLCytwqi6Eg7kgmztBs/cNpNh9cxkPtPcpl5lRVJoPELYoaUwQ8Mv9YiWOTwGw3
         IzabFz5Bg5srMnqvFJ3uIt/IkEwDZktKRRfbIaTjZfIaVW6612RjMfe2d8YgKEELbgXS
         ghlp9nGO078teOa1dpUSBFq0kz9UYTvqT9Bh5pEbnq4/HtDVEUELnm0enHbVVbYiUny2
         5fXqfXoMKFX6naNJRRmm1V2w1xubXFvNZtIJQSH5TD4O9+L4nKJWyd4a2p5Pyg89EuaN
         lPcLDOlfnHWx5N5AkcKJIRYPZzeSzZNnyOYT1eMGJkr6eRrDGLB7bqILDTeYo6aPqRiY
         B2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=hi4I00yzrvjyDfq4Sb0LtZ///vr5wch4QIwVVeeu58U=;
        b=jWwvgk6wp8RNlohAJoT90z0hfZQHgNKv1ACgTZukor2EAxEE2MgyiIfv4V57cXwhc5
         EoiqJ5zjaYV0hAj0USWYfvXYbgRfIG2iZiUzolIYWgGT+ESrJQpQ9rV2klisrvm8AMmj
         WBSEBds7WP1aceUtZOAlWRcxC1R8Jsv4ywsC9AKyXb/AE9qpKD6hYku/RWgAoT7NkJxR
         u50/wGEQi5rFs6JonYkwlGtqRtnb+Dlc/LDNfiQIuVJ18aKlbTljceGm6X1WfzIDIllx
         tCr09eDiZemik5JB5alPO9nComB9ACtl1M/jD6ktoJmWrXXjEOoPd9Yc3mBCcs8XL/fu
         Nmrw==
X-Gm-Message-State: APjAAAWNftjoa+gz+YhGFwQAq4dZi6NQZdzMMaJvvNDsaDl2DbU+bpbY
        p1/9J984LU6uVmSbnLQvIzMudA==
X-Google-Smtp-Source: APXvYqyeiG+qz99HWZk7tAxTHFq2pCo/5SMXlzP6RqwmzOV6EmB6TEiXu9iDoH0GK5MAewVwnReY8A==
X-Received: by 2002:a65:62cd:: with SMTP id m13mr9076178pgv.437.1567794333735;
        Fri, 06 Sep 2019 11:25:33 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j18sm7684471pfh.70.2019.09.06.11.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2019 11:25:33 -0700 (PDT)
Date:   Fri, 6 Sep 2019 11:25:30 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Jack Pham <jackp@codeaurora.org>,
        Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>,
        robh@kernel.org, andy.gross@linaro.org, shawn.guo@linaro.org,
        gregkh@linuxfoundation.org, mark.rutland@arm.com, kishon@ti.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, khasim.mohammed@linaro.org
Subject: Re: [PATCH v4 3/4] dt-bindings: Add Qualcomm USB SuperSpeed PHY
 bindings
Message-ID: <20190906182530.GD11938@tuxbook-pro>
References: <5d694878.1c69fb81.5f13b.ec4f@mx.google.com>
 <20190830164520.GK26807@tuxbook-pro>
 <5d696ad2.1c69fb81.977ea.39e5@mx.google.com>
 <f3584f38-dabc-7e7a-d1cb-84c80ed26215@linaro.org>
 <20190903173924.GB9754@jackp-linux.qualcomm.com>
 <5d6edee5.1c69fb81.a3896.1d05@mx.google.com>
 <20190903233410.GQ26807@tuxbook-pro>
 <c9481b7d-4805-25c6-f40f-9cbfc40afc93@linaro.org>
 <20190905175802.GA19599@jackp-linux.qualcomm.com>
 <5d71edf5.1c69fb81.1f307.fdd6@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5d71edf5.1c69fb81.1f307.fdd6@mx.google.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 05 Sep 22:26 PDT 2019, Stephen Boyd wrote:

> Quoting Jack Pham (2019-09-05 10:58:02)
> > Hi Jorge, Bjorn,
> > 
> > On Thu, Sep 05, 2019 at 09:18:57AM +0200, Jorge Ramirez wrote:
> > > On 9/4/19 01:34, Bjorn Andersson wrote:
> > > > On Tue 03 Sep 14:45 PDT 2019, Stephen Boyd wrote:
> > > >> that would need an of_regulator_get() sort of API that can get the
> > > >> regulator out of there? Or to make the connector into a struct device
> > > >> that can get the regulator out per some generic connector driver and
> > > >> then pass it through to the USB controller when it asks for it. Maybe
> > > >> try to prototype that out?
> > > >>
> > > > 
> > > > The examples given in the DT bindings describes the connector as a child
> > > > of a PMIC, with of_graph somehow tying it to the various inputs. But in
> > > > these examples vbus is handled by implicitly inside the MFD, where
> > > > extcon is informed about the plug event they toggle vbus as well.
> > > > 
> > > > In our case we have a extcon-usb-gpio to detect mode, which per Jorge's
> > > > proposal will trickle down to the PHY and become a regulator calls on
> > > > either some external regulator or more typically one of the chargers in
> > > > the system.
> > 
> > Interesting you mention extcon-usb-gpio. I thought extcon at least from
> > bindings perspective is passé now. Maybe this is what you need (just
> > landed in usb-next):
> > 
> > usb: common: add USB GPIO based connection detection driver
> > https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=4602f3bff2669012c1147eecfe74c121765f5c56
> > 
> > dt-bindings: usb: add binding for USB GPIO based connection detection driver
> > https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=f651c73e71f53f65e9846677d79d8e120452b59f
> > 
> > Fortunately this new driver might check the right boxes for you:
> > - usb connector binding
> > - ID detect GPIO
> > - vbus-supply regulator
> > 
> > With that, I think you can also keep the connector subnode out of the
> > SSPHY node well, and similarly get rid of the vbus toggle handling from
> > the PHY driver.
> > 
> > The big thing missing now is that this driver replaces extcon
> > completely, so we'll need handling in dwc3/dwc3-qcom to retrieve the
> > role switch state to know when host mode is entered. I saw this a while
> > back but don't think it got picked up:
> > 
> > https://patchwork.kernel.org/patch/10909981/
> > 
> 
> Yes this looks like the approach that should be taken. One question
> though, is this a micro-b connector or a type-c connector on the board?
> I thought it was a type-c, so then this USB gpio based connection driver
> isn't an exact fit?
> 

For this particular case it's a type c connector, but the port
controller is operated completely passively (and there's no PD or DP
involved), so the GPIO based approach seems like a good fit.

Regards,
Bjorn
