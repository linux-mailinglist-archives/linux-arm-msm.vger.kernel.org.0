Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B72C22405DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Aug 2020 14:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbgHJM1q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Aug 2020 08:27:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbgHJM1p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Aug 2020 08:27:45 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53AC3C061756;
        Mon, 10 Aug 2020 05:27:44 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id 140so4589160lfi.5;
        Mon, 10 Aug 2020 05:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=Gxqygr0JZ/pB21ogFMQ/Jn+CE1eOCdPD88TlAVeBA8g=;
        b=mkJ33crWA60Y8MJIimiOaO4PhYCWU94raJzsF9BzC60Bpjkyfry70QHLhLjMd3SeCP
         3THdvUmaSP0kTnjVygFREal8NtzMgYT+EIxbR1wZsdyh5Fvekj0H19UPQwfuvqBvJ0Fv
         1BMDfJTDa0N5nsqUH7lpNgtYs3CmuB0k9sMhV9jTJxWBwwXKh9KCyWAZLlVMpOGMLIBW
         C1+rxMVbvLEfO7DNVDiHPRx8LIr638ZaNCd57X6DQ6otNWSJzuvad+cPRzBxU4KPIlpb
         yuZIPoKsoe7wOyFj2IggeAR4jL2aNU0q4FFRj87PO0khoB2wSQFXTHQ/VQoXhpaWCEav
         sc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=Gxqygr0JZ/pB21ogFMQ/Jn+CE1eOCdPD88TlAVeBA8g=;
        b=KtF5JLsKdkTFfQfRvjdrq8nP6P+2NuZ9De8LwrnoZ7fbQ2na/CvZ9v0JxwNXrFobHo
         GVAwmL0SREAw4dFfu7bO7HORu+g8rxE8LB3SG61Sjtg9MNIyaGi0s1r5piPgcLSkIV25
         r/+iSERGpRGsV5JRYzaZNIYwt+Eo+2RmA2qxSRC0IrZ2RCJHZMTUiUsuDKfjHw6+R5gt
         koPmz3Gzxk/MLz1i/bJ5KYE2CLCb2ebge9Y2jrd4KWzJYwej8E9La7e7FDJ5oPgNvrzy
         vPQsEnxonESmpfjPZ4mOpiJSO/wNzfrGHfGe0Ja5C2cPcZ9tLqSoLM1pi75jihtPcotm
         A0pw==
X-Gm-Message-State: AOAM5316gbuJT96rdcAuYYaiPbWzBY4VZ7jvAhJKC+EMBojkihvb0vc8
        Hkjti5T6Z0EIYeYEEamgM3k=
X-Google-Smtp-Source: ABdhPJye8OXBbZke33jmjvnrB1xZJoivWVybUtpqzg+N9E+LBX1YutHbvTzyyC33FvKlxmsVUMFcVg==
X-Received: by 2002:a05:6512:281:: with SMTP id j1mr395105lfp.214.1597062462554;
        Mon, 10 Aug 2020 05:27:42 -0700 (PDT)
Received: from saruman ([194.34.132.58])
        by smtp.gmail.com with ESMTPSA id m27sm10724584lfq.19.2020.08.10.05.27.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Aug 2020 05:27:41 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Wesley Cheng <wcheng@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, gregkh@linuxfoundation.org,
        robh+dt@kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: Re: [RFC v4 1/3] usb: dwc3: Resize TX FIFOs to meet EP bursting requirements
In-Reply-To: <20200624022848.7765-2-wcheng@codeaurora.org>
References: <20200624022848.7765-1-wcheng@codeaurora.org> <20200624022848.7765-2-wcheng@codeaurora.org>
Date:   Mon, 10 Aug 2020 15:27:37 +0300
Message-ID: <87d03yptxi.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Wesley Cheng <wcheng@codeaurora.org> writes:

Hi,

> Some devices have USB compositions which may require multiple endpoints
> that support EP bursting.  HW defined TX FIFO sizes may not always be
> sufficient for these compositions.  By utilizing flexible TX FIFO
> allocation, this allows for endpoints to request the required FIFO depth =
to
> achieve higher bandwidth.  With some higher bMaxBurst configurations, usi=
ng
> a larger TX FIFO size results in better TX throughput.

how much better? What's the impact? Got some real numbers of this
running with upstream kernel? I guess mass storage gadget is the
simplest one to test.

> diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
> index 6dee4dabc0a4..76db9b530861 100644
> --- a/drivers/usb/dwc3/ep0.c
> +++ b/drivers/usb/dwc3/ep0.c
> @@ -601,8 +601,9 @@ static int dwc3_ep0_set_config(struct dwc3 *dwc, stru=
ct usb_ctrlrequest *ctrl)
>  {
>  	enum usb_device_state state =3D dwc->gadget.state;
>  	u32 cfg;
> -	int ret;
> +	int ret, num, size;

no, no. Please one declaration per line.

>  	u32 reg;
> +	struct dwc3_ep *dep;

Keep reverse xmas tree order.

> @@ -611,6 +612,40 @@ static int dwc3_ep0_set_config(struct dwc3 *dwc, str=
uct usb_ctrlrequest *ctrl)
>  		return -EINVAL;
>=20=20
>  	case USB_STATE_ADDRESS:
> +		/*
> +		 * If tx-fifo-resize flag is not set for the controller, then
> +		 * do not clear existing allocated TXFIFO since we do not
> +		 * allocate it again in dwc3_gadget_resize_tx_fifos
> +		 */
> +		if (dwc->needs_fifo_resize) {
> +			/* Read ep0IN related TXFIFO size */
> +			dep =3D dwc->eps[1];
> +			size =3D dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(0));
> +			if (dwc3_is_usb31(dwc))
> +				dep->fifo_depth =3D DWC31_GTXFIFOSIZ_TXFDEP(size);
> +			else
> +				dep->fifo_depth =3D DWC3_GTXFIFOSIZ_TXFDEP(size);
> +
> +			dwc->last_fifo_depth =3D dep->fifo_depth;
> +			/* Clear existing TXFIFO for all IN eps except ep0 */
> +			for (num =3D 3; num < min_t(int, dwc->num_eps,
> +				DWC3_ENDPOINTS_NUM); num +=3D 2) {
> +				dep =3D dwc->eps[num];
> +				/* Don't change TXFRAMNUM on usb31 version */
> +				size =3D dwc3_is_usb31(dwc) ?
> +					dwc3_readl(dwc->regs,
> +						   DWC3_GTXFIFOSIZ(num >> 1)) &
> +						   DWC31_GTXFIFOSIZ_TXFRAMNUM :
> +						   0;
> +
> +				dwc3_writel(dwc->regs,
> +					    DWC3_GTXFIFOSIZ(num >> 1),
> +					    size);
> +				dep->fifo_depth =3D 0;
> +			}
> +			dwc->num_ep_resized =3D 0;

care to move this into a helper that you call unconditionally and the
helper returns early is !needs_fifo_resize?

> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 00746c2848c0..777badf3e85d 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -540,6 +540,117 @@ static int dwc3_gadget_start_config(struct dwc3_ep =
*dep)
>  	return 0;
>  }
>=20=20
> +/*
> + * dwc3_gadget_resize_tx_fifos - reallocate fifo spaces for current use-=
case
> + * @dwc: pointer to our context structure
> + *
> + * This function will a best effort FIFO allocation in order
> + * to improve FIFO usage and throughput, while still allowing
> + * us to enable as many endpoints as possible.
> + *
> + * Keep in mind that this operation will be highly dependent
> + * on the configured size for RAM1 - which contains TxFifo -,
> + * the amount of endpoints enabled on coreConsultant tool, and
> + * the width of the Master Bus.
> + *
> + * In general, FIFO depths are represented with the following equation:
> + *
> + * fifo_size =3D mult * ((max_packet + mdwidth)/mdwidth + 1) + 1
> + *
> + * Conversions can be done to the equation to derive the number of packe=
ts that
> + * will fit to a particular FIFO size value.
> + */
> +static int dwc3_gadget_resize_tx_fifos(struct dwc3_ep *dep)
> +{
> +	struct dwc3 *dwc =3D dep->dwc;
> +	int ram1_depth, mdwidth, fifo_0_start, tmp, num_in_ep;
> +	int min_depth, remaining, fifo_size, mult =3D 1, fifo, max_packet =3D 1=
024;

one declaration per line, also make sure you order it in reverse xmas
tree order.

> +	if (!dwc->needs_fifo_resize)
> +		return 0;
> +
> +	/* resize IN endpoints except ep0 */
> +	if (!usb_endpoint_dir_in(dep->endpoint.desc) || dep->number <=3D 1)
> +		return 0;
> +
> +	/* Don't resize already resized IN endpoint */
> +	if (dep->fifo_depth)

using fifo_depth as a flag seems flakey to me. What happens when someone
in the future changes the behavior below and this doesn't apply anymore?

Also, why is this procedure called more than once for the same endpoint?
Does that really happen?

> +		return 0;
> +
> +	ram1_depth =3D DWC3_RAM1_DEPTH(dwc->hwparams.hwparams7);
> +	mdwidth =3D DWC3_MDWIDTH(dwc->hwparams.hwparams0);
> +	/* MDWIDTH is represented in bits, we need it in bytes */
> +	mdwidth >>=3D 3;
> +
> +	if (((dep->endpoint.maxburst > 1) &&
> +			usb_endpoint_xfer_bulk(dep->endpoint.desc))
> +			|| usb_endpoint_xfer_isoc(dep->endpoint.desc))
> +		mult =3D 3;
> +
> +	if ((dep->endpoint.maxburst > 6) &&
> +			usb_endpoint_xfer_bulk(dep->endpoint.desc)
> +			&& dwc3_is_usb31(dwc))
> +		mult =3D 6;
> +
> +	/* FIFO size for a single buffer */
> +	fifo =3D (max_packet + mdwidth)/mdwidth;

add spaces around integer division operator

> +	fifo++;
> +
> +	/* Calculate the number of remaining EPs w/o any FIFO */
> +	num_in_ep =3D dwc->num_eps/2;
> +	num_in_ep -=3D dwc->num_ep_resized;
> +	/* Ignore EP0 IN */
> +	num_in_ep--;
> +
> +	/* Reserve at least one FIFO for the number of IN EPs */
> +	min_depth =3D num_in_ep * (fifo+1);
> +	remaining =3D ram1_depth - min_depth - dwc->last_fifo_depth;
> +
> +	/* We've already reserved 1 FIFO per EP, so check what we can fit in

comment style is wrong

> +	 * addition to it.  If there is not enough remaining space, allocate
> +	 * all the remaining space to the EP.
> +	 */
> +	fifo_size =3D (mult-1) * fifo;

spaces around subtraction

> +	if (remaining < fifo_size) {
> +		if (remaining > 0)
> +			fifo_size =3D remaining;
> +		else
> +			fifo_size =3D 0;
> +	}
> +
> +	fifo_size +=3D fifo;
> +	fifo_size++;

why the increment?

> +	dep->fifo_depth =3D fifo_size;
> +
> +	/* Check if TXFIFOs start at non-zero addr */
> +	tmp =3D dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(0));
> +	fifo_0_start =3D DWC3_GTXFIFOSIZ_TXFSTADDR(tmp);
> +
> +	fifo_size |=3D (fifo_0_start + (dwc->last_fifo_depth << 16));
> +	if (dwc3_is_usb31(dwc))
> +		dwc->last_fifo_depth +=3D DWC31_GTXFIFOSIZ_TXFDEP(fifo_size);
> +	else
> +		dwc->last_fifo_depth +=3D DWC3_GTXFIFOSIZ_TXFDEP(fifo_size);
> +
> +	/* Check fifo size allocation doesn't exceed available RAM size. */
> +	if (dwc->last_fifo_depth >=3D ram1_depth) {
> +		dev_err(dwc->dev, "Fifosize(%d) > RAM size(%d) %s depth:%d\n",
> +				(dwc->last_fifo_depth * mdwidth), ram1_depth,
> +				dep->endpoint.name, fifo_size);
> +		if (dwc3_is_usb31(dwc))
> +			fifo_size =3D DWC31_GTXFIFOSIZ_TXFDEP(fifo_size);
> +		else
> +			fifo_size =3D DWC3_GTXFIFOSIZ_TXFDEP(fifo_size);
> +		dwc->last_fifo_depth -=3D fifo_size;
> +		dep->fifo_depth =3D 0;
> +		return -ENOMEM;
> +	}
> +
> +	dwc3_writel(dwc->regs, DWC3_GTXFIFOSIZ(dep->number >> 1), fifo_size);
> +	dwc->num_ep_resized++;

add a blank line here

> +	return 0;
> +}
> +
>  static int dwc3_gadget_set_ep_config(struct dwc3_ep *dep, unsigned int a=
ction)
>  {
>  	const struct usb_ss_ep_comp_descriptor *comp_desc;
> @@ -620,6 +731,10 @@ static int __dwc3_gadget_ep_enable(struct dwc3_ep *d=
ep, unsigned int action)
>  	int			ret;
>=20=20
>  	if (!(dep->flags & DWC3_EP_ENABLED)) {
> +		ret =3D dwc3_gadget_resize_tx_fifos(dep);
> +		if (ret)
> +			return ret;

doesn't it look odd that you're resizing every fifo every time a new
endpoint is enabled? Is there a better way to achieve this?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl8xPTkACgkQzL64meEa
mQYA3hAAj6/Qx+aAx2Uq9+UlhgzciFWWJ8T4LQPB7Oesbsntb/01VaQpbzUePFQq
aL8folVLgoutxP5+AoVLIzLIhrINtoF+PPneVIbDt2LI0QwI5m2DLRqf+5c5tP7T
sdBf34KlxM0ABBijW5S/p2Xh6yKm4mjlkzin1hpyIkN9BM3O+zXroHuBloTXjZwb
LVxysSEijB7FwKZEDJHEmqbDJgx/81B/DYUgrkA7gFNl89zNcICEMElbP9s9aHzh
xDj/7kJWW7J6TiXGZvGV2s/Z/E9/p6LmIRNRNJ2A/v7Qf561EJmTuLYhuKlXO4LY
VVXiV3JwzG3z7swiylnGO0bB7OR1cQ/sTQdrJiTmQZZh5Xa1X/tbG5gQYrD6Rfbb
f6HrCbQqobWMJClWGWCXNDkqwjxiHK8OgXdyagh9dtWQ+MGFqo3cmiEd7cnTDjFZ
/kDotfcN+35CjF2sg8p7030ILhdT3V8Zq/IjzkGi7urhFUeq44Sg4J4JaQ699wp6
xTRnNo+LLVVhcl+XSl4O/QeXVeiDBQSxk3CA+5Ed9pemJIPNQQM6yiU6/2GgxQuM
nLctww2h/2LudeA2dYksAF0Frn4Ud3OOldk1y2ClJdO99wHIuLwtfYvEf9ZFYWBx
VM7w+Jy5ABdctH430DnOFnbXxLykhUPtWcoDU2bZilM9n/d9VVc=
=JObr
-----END PGP SIGNATURE-----
--=-=-=--
