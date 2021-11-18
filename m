Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 384D64562B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 19:43:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231542AbhKRSqC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 13:46:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231391AbhKRSqC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 13:46:02 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF43FC06173E
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Nov 2021 10:43:01 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id x131so6900992pfc.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Nov 2021 10:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=G1EliypIjbcEW6Z/ACxlA6Dj3vusWb8JvXLauTtA8Ec=;
        b=V9/M+IhlXdHtPJLjRhHrJbqffe02jTBUk7q5gB83KwHpUfj5QsJbsdlm5bz3sseFcU
         oS17QB0ghrBpj+QsgVZFjFeloINmuY+zbug5uCrkkEgT5e6Y7kabv3EraLL+joLtPaMN
         kA8ov8LmyVfvTOTHSgKCIK0Lw0rxgHcPfl8Zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=G1EliypIjbcEW6Z/ACxlA6Dj3vusWb8JvXLauTtA8Ec=;
        b=545Alw31KYn8L7sa4GaSr8mqOaERmgcwtIqKcrur81Gwa1avVw/EpWkDsSZbnO5zJH
         0O8Vsv/qoacxfPDu1Y250uNLHAoVZyb87+VlrH/1lfG3VEdvJvmb7tMTxc05fSdGDe+z
         vB3sUFQ6CetLvcJhUxVzQyRuncRYqqQ0Bs5W0FO98CtttZylHOaRg2Buu/tQwTJmEtI/
         5tr7DAn0MkuJErFsaRQHyvgyJif6womBH/kf3Iv/SWcnHe2sFFYZ7Ii0VLC3QYAI212C
         BBCxvAGM7AgkK/LBswTqdlN+VEkRE5HXOPSdSiI0iLY2v+Xd5mSb9xDmOu8JuIz1gNtd
         bmnA==
X-Gm-Message-State: AOAM532mbuQwaoa42ykIcwHF0fLai17qG0lCL+BNPzioHzAMs/hTTW2N
        hgv2NFcVeJE7OQBqUiSQJQ4mmw==
X-Google-Smtp-Source: ABdhPJyjhcSmjkykFR9rtVJUgw5bfN+1UgOk97VaGwkkIZiiD0BiGOV4YRXSRFWZWEBsG+gxTFspJw==
X-Received: by 2002:a63:80c6:: with SMTP id j189mr12585818pgd.200.1637260981486;
        Thu, 18 Nov 2021 10:43:01 -0800 (PST)
Received: from localhost ([2620:15c:202:201:8ceb:c68a:21af:bebe])
        by smtp.gmail.com with UTF8SMTPSA id f21sm352939pfc.85.2021.11.18.10.43.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 10:43:01 -0800 (PST)
Date:   Thu, 18 Nov 2021 10:43:00 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Peter Chen <peter.chen@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Roger Quadros <rogerq@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Bastien Nocera <hadess@hadess.net>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v17 4/7] arm64: dts: qcom: sc7180-trogdor: Add nodes for
 onboard USB hub
Message-ID: <YZaetDjIyFZPuO6J@google.com>
References: <20211116200739.924401-1-mka@chromium.org>
 <20211116120642.v17.4.Ie0d2c1214b767bb5551dd4cad38398bd40e4466f@changeid>
 <CAD=FV=WK3uHJTehMxWiA56L5Ly8UqjmCKnJtXBut2aOYEV6C4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=WK3uHJTehMxWiA56L5Ly8UqjmCKnJtXBut2aOYEV6C4g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 17, 2021 at 04:03:10PM -0800, Doug Anderson wrote:
> Hi,
> 
> On Tue, Nov 16, 2021 at 12:07 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > Add nodes for the onboard USB hub on trogdor devices. Remove the
> > 'always-on' property from the hub regulator, since the regulator
> > is now managed by the onboard_usb_hub driver.
> >
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> >
> > Changes in v17:
> > - none
> >
> > Changes in v16:
> > - none
> >
> > Changes in v15:
> > - none
> >
> > Changes in v14:
> > - none
> >
> > Changes in v13:
> > - none
> >
> > Changes in v12:
> > - none
> >
> > Changes in v11:
> > - rebased on qcom/arm64-for-5.14 (with the rest of the series)
> >
> > Changes in v10:
> > - keep 'regulator-boot-on' property
> > - updated commit message
> >
> > Changes in v9:
> > - none
> >
> > Changes in v8:
> > - none
> >
> > Changes in v7:
> > - rebased on qcom/arm64-for-5.13 (with the rest of the series)
> >
> > Changes in v6:
> > - added 'companion-hub' entry to both USB devices
> > - added 'vdd-supply' also to hub@2
> >
> > Changes in v5:
> > - patch added to the series
> >
> >  .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts | 19 ++++++++-----------
> >  .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts | 12 +++++-------
> >  .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts | 19 ++++++++-----------
> >  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 19 ++++++++++++++++++-
> >  4 files changed, 39 insertions(+), 30 deletions(-)
> 
> sc7180-trogdor-pompom-r1.dts is missing? It seems to need similar
> fixups to the early lazor/trogdor borads.

ack, also needs to be done for pompom rev1, thanks for pointing that out!
