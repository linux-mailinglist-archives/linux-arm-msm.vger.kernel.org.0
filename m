Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23F1B37F908
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 May 2021 15:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234125AbhEMNsB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 May 2021 09:48:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:54636 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234123AbhEMNsA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 May 2021 09:48:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B8DD4613BF;
        Thu, 13 May 2021 13:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620913611;
        bh=Hl9Tp2US/fiQulPkeoFf/XOunQPxECU8X4jZScPaoCQ=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=XkFpLapmamzs7aWn1Dd03XtYGRLQZb65b13mb5hPFMoEmp77YMQvTaOkbbtG/CVPv
         ikigHr5oou8tgfo77nYtVXP2OpVEDu6cb8ifsLsDUzQTrztGfghcX5qZ3KrKCohuQh
         k6kRLlF1l/NHImdpNW5NS1aZHNBLJQmnUl6aL8IeMvQejor2nntsHW7H3pYD8f6BM9
         2QUJFgfYPPR+uitpKft9MGTuT8+IqjRx1iqgT12wMoDGFfZDj3uM9+3KETe5bRtLXP
         QTtShd6NN1yW62iNkzR5rIjHoXQsO64tUxvRILMNVwrprtqpQFv5E0BbVQ/ALNpjJ+
         WxqVLQmEpXl3A==
From:   Felipe Balbi <balbi@kernel.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v7 1/5] usb: dwc3: host: Set PHY mode during suspend
In-Reply-To: <YJwommGqKVeMdXth@google.com>
References: <1619586716-8687-1-git-send-email-sanm@codeaurora.org>
 <1619586716-8687-2-git-send-email-sanm@codeaurora.org>
 <87tunqka2e.fsf@kernel.org> <YJwommGqKVeMdXth@google.com>
Date:   Thu, 13 May 2021 16:46:41 +0300
Message-ID: <87wns27nlq.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Matthias Kaehlcke <mka@chromium.org> writes:
>> > @@ -127,6 +142,50 @@ int dwc3_host_init(struct dwc3 *dwc)
>> >  	return ret;
>> >  }
>> >=20=20
>> > +static void dwc3_set_phy_mode(struct usb_hcd *hcd)
>> > +{
>> > +
>> > +	int i, num_ports;
>> > +	u32 reg;
>> > +	unsigned int ss_phy_mode =3D 0;
>> > +	struct dwc3 *dwc =3D dev_get_drvdata(hcd->self.controller->parent);
>> > +	struct xhci_hcd	*xhci_hcd =3D hcd_to_xhci(hcd);
>> > +
>> > +	dwc->hs_phy_mode =3D 0;
>> > +
>> > +	reg =3D readl(&xhci_hcd->cap_regs->hcs_params1);
>> > +	num_ports =3D HCS_MAX_PORTS(reg);
>>=20
>> there's a big assumption here that xhci is still alive. Why isn't this
>> quirk implemented in xhci-plat itself?
>
> That should work for determining which types of devices are connected to
> the PHYs, however IIUC the xhci-plat doesn't know about the PHY topology.
> Are you suggesting to move that info into the xhci-plat driver so that it
> can set the corresponding PHY modes?

Yes, if xHCI needs to know about PHYs in order to properly configure the
PHYs, so be it :-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCdLcERHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUiIlQgAmyUNbusUCCFnOyF9fdp17YNP2neOLsBY
B0OSC3VQcYJxUXIZNvUmk+FoKtvF06w4xCnU15iKod+WRUe53zmSIDmfQBtApqEi
nz8OvtF4huzSGg6IgPY40lXR96cLuOOfOsXCOzYzwsWMo04Sd5hUXvaazZYWUyeC
z5ZuRBD9KVGvULor2NRrDHO9laaTo4maccDkorTmywwczaNcxvT4lO7/qiRwTeSf
RahkCbPJ3xE7mcpfoe2goaytfAOfeAruMsc4K4JJKtZ0600pwLnaIwXnE71r6d6u
yI4DVSlTc2nbYKJ7iEpbkoYTF65tQ3hJqMy2kDy9yXeglq7tsePYvw==
=B6ua
-----END PGP SIGNATURE-----
--=-=-=--
