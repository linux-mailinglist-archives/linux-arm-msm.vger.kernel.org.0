Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7F172714F6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Sep 2020 16:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbgITOSX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Sep 2020 10:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbgITOSX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Sep 2020 10:18:23 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1B03C0613CF
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2020 07:18:22 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id w16so13766895oia.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2020 07:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tXYVVjGeX/xuyfCibo3bpfqRj6kkCOVBFK4enHIceHE=;
        b=Wg6OqqlH6rIm7Xfhn2EakhbSEojfIFe0MYKmRSXC0V+4z00gQXgjQYwbDrcRQ83MKd
         3hqA767bQlOQY7GH5QnV3szoPe6Hkl4a93vPVwNetPylG9f1Od3hBS3PozkeewcN4+sx
         SLbbh5ePxxAttoxhvDaIAOM8UF7Oy0wHhAScghdyyFUzYkvSlUGhHf5HI2JoV63MSSlF
         JcfuAw+l+rIMMLvs0j2lf6rHpJDLoF3qRKrweIfiyblm6yAdphVbGI14KKwpcqi+bdC5
         UdBzZa+2iP+oHItcJbBvT6Q+Z3kVdJK6RY7J4Trdu30LCH4mlEqUhJCGTkIDuVf4KjRC
         OxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tXYVVjGeX/xuyfCibo3bpfqRj6kkCOVBFK4enHIceHE=;
        b=mRy62dD6DvrITvOL+I2Jo72/kOG81dkRC9zi7S+Z2o529Txnp0SCnymNsSx9AR0HCz
         0BL52+L9PjtSbekLF+ooBZuD0pUxzRhuhMAMDxKFMvfdjZVic0A1GbG/Qt6bqb7bcac0
         rpIEU37iEFIzX92Rr4G+9oV9vM04+U+3MPsXg1PdQp4wdUOBXJ+VTfnYEb67xUQy6xFK
         gje9JEg/WD4w2FbbC9XWMQ/GFOgzrTiOYCeipWl0F3euImlcqMP2OEQu71aEvMPLlzgf
         ghHQMD6D+N40F3s84IKwotIFxptk6nzR9qp/cSk9+58sWHBlMvX7Jmzcv5ZuwwmtS3ur
         skIA==
X-Gm-Message-State: AOAM531sBbRJzc/OKj1gp8sBvkuPLso/gaM0ANC3meEcQolWbxS4aFXx
        OMEjNj0sXRtvyJ4a8VF1uIH4IrvR5WD7kXV/N2PZrQ==
X-Google-Smtp-Source: ABdhPJyrqOxV6k9JkXLWX+/F0Z1cR467cTi2opsDkYvpZyhMXkoQG5oWI2IbqBq37FNrxJaYLykL8u/i2T7+qBJ0mcQ=
X-Received: by 2002:a05:6808:a05:: with SMTP id n5mr15212386oij.154.1600611502232;
 Sun, 20 Sep 2020 07:18:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200918205633.2698654-1-robert.marko@sartura.hr>
 <20200918205633.2698654-3-robert.marko@sartura.hr> <20200920001904.GB3673389@lunn.ch>
In-Reply-To: <20200920001904.GB3673389@lunn.ch>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Sun, 20 Sep 2020 16:18:11 +0200
Message-ID: <CA+HBbNHqfwErgUg41h9-zZoPNwS1wu5iT_jwvMohqWcT-aH0Hg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] net: mdio-ipq4019: add Clause 45 support
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        David Miller <davem@davemloft.net>, kuba@kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Luka Perkov <luka.perkov@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Sep 20, 2020 at 2:19 AM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +
> > +/* 0 = Clause 22, 1 = Clause 45 */
> > +#define MDIO_MODE_BIT                                BIT(8)
>
> How about calling this MDIO_MODE_C45

Good idea, will rename it.

>
> > +             /* Enter Clause 45 mode */
> > +             data = readl(priv->membase + MDIO_MODE_REG);
> > +
> > +             data |= MDIO_MODE_BIT;
> > +
> > +             writel(data, priv->membase + MDIO_MODE_REG);
>
> It then becomes clearer what this does.
>
> Otherwise this looks O.K.
>
>           Andrew

v4 has been pushed to address your comment
Regards,
Robert
