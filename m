Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 528231BBE1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 14:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgD1MsK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Apr 2020 08:48:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726793AbgD1MsK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Apr 2020 08:48:10 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 038D8C03C1AC
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2020 05:48:09 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id e26so32379470otr.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2020 05:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gIMUGicgwmIFtnYG9N3fQPjEXkbOpiDE/URudlFOW5s=;
        b=dUDumjdTIlGGpNmZYXHngArdwQWCCtin2qUEkmCJQtwAgVH3K5XgViZI81wZ44IjG7
         Zq9hacLuuX3LoskBpPXvwEKqsb+nyh8KlA22O07jpgEn9K3uC6ACaKAN8PKic/lPqIH3
         aGuwroFwfXlxdyxjbX0M5ZO8aNaVayipg4ovDBY1QrVdSeb7pZN8F9XkXds1YomIXvTY
         YmfpZJC7mu05HAL4WFjKaNy2UHPs3FQx9op/si0XAJd964b+EV57407V2UZmA/ay/P77
         xLf+QNzD7vJnw4QY7Rt6Ymk3pNiAJ9KUWkKYygNBJf6EbhdoOzp+JfBNNHOfuB1A5awb
         aYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gIMUGicgwmIFtnYG9N3fQPjEXkbOpiDE/URudlFOW5s=;
        b=n6H7kh3BNWSthRz+uEDYEKQ0KqWyDtkriA3vt08eCnjPHN3nyB17BTpvCB2gZlk5Sg
         LkCG4ge3VoI+CYHuov9KcoxPMWLpCb00aUJXutE0phbfjTH8ZBqJN/+H2pW32EHlOlYh
         4QNIvY0YQSRRZ9BcnY6Nv0stxgxjjKf0vXRghyVSy5VD/UdEjUzmaqeqeYZRe7mWn3Uu
         X5gJd3wgns2W1o+euilxanL9wGRCzJzLyHKp2XoUbFKngAiyBKPNTcbVblUmZVLr5aW5
         rrRZQ+QPei2w8VZ4T41LgZTXqt1tXcvqglASBXUSFwi6eb49ipQmp9En9nXuz5x88qNr
         Dr6A==
X-Gm-Message-State: AGi0PuaO1O4g0xSfVQc13t8KsKyqDI9xy04J9YAmclhkRgiSJwhp4rMe
        r4jeg8ncPrl0EXLt5jQzjFEsHfsMqk2MujaXRTmrWV/piSc=
X-Google-Smtp-Source: APiQypJfEP180kCuws7+abjZcT8dPX9zxxKNlOozz0+TthkUItgt4+ccPZriFdCypuPgxcXtg9LpjV+6NqVW8gqrIFU=
X-Received: by 2002:a05:6830:13d4:: with SMTP id e20mr22370151otq.66.1588078089294;
 Tue, 28 Apr 2020 05:48:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200401163542.83278-1-robert.marko@sartura.hr> <20200427164514.GQ56386@vkoul-mobl.Dlink>
In-Reply-To: <20200427164514.GQ56386@vkoul-mobl.Dlink>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Tue, 28 Apr 2020 14:47:58 +0200
Message-ID: <CA+HBbNHT7bOM68zBGAHO0Pi9WrBc244Qewwe5JV7fNhNUGPZ4Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] phy: add driver for Qualcomm IPQ40xx USB PHY
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-kernel@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        robh+dt@kernel.org, Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, John Crispin <john@phrozen.org>,
        Luka Perkov <luka.perkov@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Apr 27, 2020 at 6:45 PM Vinod Koul <vkoul@kernel.org> wrote:
>
> Hello Robert,
>
> On 01-04-20, 18:35, Robert Marko wrote:
>
> > +static int ipq4019_ss_phy_power_on(struct phy *_phy)
> > +{
> > +     struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
> > +
> > +     ipq4019_ss_phy_power_off(_phy);
> > +
> > +     reset_control_deassert(phy->por_rst);
> > +
> > +     return 0;
> > +}
> > +
> > +static struct phy_ops ipq4019_usb_ss_phy_ops = {
> > +     .power_on       = ipq4019_ss_phy_power_on,
> > +     .power_off      = ipq4019_ss_phy_power_off,
> > +};
> > +
> > +static int ipq4019_hs_phy_power_off(struct phy *_phy)
> > +{
> > +     struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
> > +
> > +     reset_control_assert(phy->por_rst);
> > +     msleep(10);
>
> why not call ipq4019_ss_phy_power_off() here as well?
Its not necessary, SS and HS PHY-s are separated but share
the same register space.
So when HS PHY is controlled, SS PHY can remain working.
>
> > +
> > +     reset_control_assert(phy->srif_rst);
> > +     msleep(10);
> > +
> > +     return 0;
> > +}
> > +
> > +static int ipq4019_hs_phy_power_on(struct phy *_phy)
> > +{
> > +     struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
> > +
> > +     ipq4019_hs_phy_power_off(_phy);
> > +
> > +     reset_control_deassert(phy->srif_rst);
> > +     msleep(10);
> > +
> > +     reset_control_deassert(phy->por_rst);
> > +
> > +     return 0;
> > +}
> > +
> > +static struct phy_ops ipq4019_usb_hs_phy_ops = {
> > +     .power_on       = ipq4019_hs_phy_power_on,
> > +     .power_off      = ipq4019_hs_phy_power_off,
> > +};
>
> So this is fiddling with resets, what about phy configuration and
> calibration, who take care of that?
As as I understand, since I don't have documentation access is that no
calibration and configuration except to properly reset them are needed.
Development hardware required some magic register values to be
written but in the previous revisions of this driver it was
discovered that they were leftovers from the development HW.
>
> > +static int ipq4019_usb_phy_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev = &pdev->dev;
> > +     struct resource *res;
> > +     struct phy_provider *phy_provider;
> > +     struct ipq4019_usb_phy *phy;
> > +     const struct of_device_id *match;
> > +
> > +     match = of_match_device(ipq4019_usb_phy_of_match, &pdev->dev);
> > +     if (!match)
> > +             return -ENODEV;
>
> you are using this to get match-data few lines below, why not use
> of_device_get_match_data() and get the match->data which you are
> interested in?
Thanks, I will look into it.
>
> --
> ~Vinod
