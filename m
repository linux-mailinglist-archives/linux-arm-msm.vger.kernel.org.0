Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0C6D1CAF36
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2020 15:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729236AbgEHNPy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 May 2020 09:15:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727958AbgEHMpp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 08:45:45 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5B24C05BD43;
        Fri,  8 May 2020 05:45:44 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id o14so460579ljp.4;
        Fri, 08 May 2020 05:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=YSng6s9kq7jWuWtp8R03+la3j7hugWr6HZq0thRDMsw=;
        b=b69aJl/1L7KB2qJ0oF7F6kv2hwxAQ4daURADql9u/ekBS/L1Tz2ZHu89m3XVcb2w6W
         dNwZGU1DjplF/G0O18SW/cEBR4KEayJ4aU1GHAQjI843Tce1+GtZRPrc9bl1C6X0Ac+a
         9eBUM4ABedE0ae3lmUoA4hrodg3QrX7lNRZPUjk8kviXNLv+Ud32Srz8spWXDFJlrtCx
         0IQqzPRS9tWz5bONsL5w7EiC89orR/22yzymWjK3xsZS3mhrzdLq1WYwb22m577hA4hr
         BHSJza1xJZUtIhyLawSd4eSrSVxZ+Xu8RAiERDAn9m9vZpe7zrGe1JJrwNqj7kH/McZq
         6rBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=YSng6s9kq7jWuWtp8R03+la3j7hugWr6HZq0thRDMsw=;
        b=BYL79snopseVuk2BNcws7JxWnX6bFj59xWTGaA6jWzndbKquQmeMFnUHhmC2AAuy8G
         ZLjT1bTNbtGIy3Pz+GIyD0R5PS3l+A4cyT/NGdcpeTZ2iD2T70Aoh0dweLriBjpXHoaJ
         5CnXGIBEGz3BMwaECXp+2NQ4inYz41JCQm9s6ThB5PYjh6AGyRVWioJe38p/NC8PBLkK
         5FMx8GmmqjFkC41XfYOqhTat6I8tBdGxbC0sl/NIEZDdWte5585zPAfCbgDeoc5dYBIV
         69FgRUsyTf0tRvu+OVL1TFQml9Fx+HmQq1/w+re36rx4NGyvjsIxLLp+GWtdyqcL4y0o
         KuLg==
X-Gm-Message-State: AOAM531PGdJSEB4EgZUy34zS69hY0rdBpeiW414hYkSibkB3NrxcBliv
        RF7br3dGDCVCW0d+kL3pHLpbpuKiOLk=
X-Google-Smtp-Source: ABdhPJwDS/GZZFlRRnVMI1EzibGW84OxWoBLd1oUiwjHRj+J4PaXXb+wv/M7CIgJEp5mHbyNe2lZQg==
X-Received: by 2002:a2e:6e13:: with SMTP id j19mr1615226ljc.292.1588941943223;
        Fri, 08 May 2020 05:45:43 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id r3sm1133891lfm.52.2020.05.08.05.45.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 May 2020 05:45:42 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Wesley Cheng <wcheng@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: Re: [RFC 1/3] usb: dwc3: Resize TX FIFOs to meet EP bursting requirements
In-Reply-To: <1588888768-25315-2-git-send-email-wcheng@codeaurora.org>
References: <1588888768-25315-1-git-send-email-wcheng@codeaurora.org> <1588888768-25315-2-git-send-email-wcheng@codeaurora.org>
Date:   Fri, 08 May 2020 15:45:37 +0300
Message-ID: <878si2mw7i.fsf@kernel.org>
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


Hi,

Wesley Cheng <wcheng@codeaurora.org> writes:
> Some devices have USB compositions which may require multiple endpoints
> that support EP bursting.  HW defined TX FIFO sizes may not always be
> sufficient for these compositions.  By utilizing flexible TX FIFO
> allocation, this allows for endpoints to request the required FIFO depth =
to
> achieve higher bandwidth.  With some higher bMaxBurst configurations, usi=
ng
> a larger TX FIFO size results in better TX throughput.

This needs to be carefully thought out as it can introduce situations
where gadget drivers that worked previously stop working.

> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 4c171a8..e815c13 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -675,6 +675,7 @@ struct dwc3_event_buffer {
>   *		isochronous START TRANSFER command failure workaround
>   * @start_cmd_status: the status of testing START TRANSFER command with
>   *		combo_num =3D 'b00
> + * @fifo_depth: allocated TXFIFO depth
>   */
>  struct dwc3_ep {
>  	struct usb_ep		endpoint;
> @@ -718,6 +719,7 @@ struct dwc3_ep {
>  	u8			resource_index;
>  	u32			frame_number;
>  	u32			interval;
> +	int			fifo_depth;
>=20=20
>  	char			name[20];
>=20=20
> @@ -1004,6 +1006,7 @@ struct dwc3_scratchpad_array {
>   * 	1	- utmi_l1_suspend_n
>   * @is_fpga: true when we are using the FPGA board
>   * @pending_events: true when we have pending IRQs to be handled
> + * @needs_fifo_resize: not all users might want fifo resizing, flag it
>   * @pullups_connected: true when Run/Stop bit is set
>   * @setup_packet_pending: true when there's a Setup Packet in FIFO. Work=
around
>   * @three_stage_setup: set if we perform a three phase setup
> @@ -1044,6 +1047,7 @@ struct dwc3_scratchpad_array {
>   * @dis_metastability_quirk: set to disable metastability quirk.
>   * @imod_interval: set the interrupt moderation interval in 250ns
>   *                 increments or 0 to disable.
> + * @last_fifo_depth: total TXFIFO depth of all enabled USB IN/INT endpoi=
nts
>   */
>  struct dwc3 {
>  	struct work_struct	drd_work;
> @@ -1204,6 +1208,7 @@ struct dwc3 {
>  	unsigned		is_utmi_l1_suspend:1;
>  	unsigned		is_fpga:1;
>  	unsigned		pending_events:1;
> +	unsigned		needs_fifo_resize:1;

Instead of passing a flag, this could be detected in runtime during ->udc_s=
tart()

> diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
> index 6dee4da..7ee2302 100644
> --- a/drivers/usb/dwc3/ep0.c
> +++ b/drivers/usb/dwc3/ep0.c
> @@ -611,6 +612,43 @@ static int dwc3_ep0_set_config(struct dwc3 *dwc, str=
uct usb_ctrlrequest *ctrl)
>  		return -EINVAL;
>=20=20
>  	case USB_STATE_ADDRESS:

are you sure it's safe to fiddle with TX FIFO allocation at SetAddress()
time?

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
> +
> +				dev_dbg(dwc->dev, "%s(): %s fifo_depth:%x\n",
> +					__func__, dep->name,
> +					dep->fifo_depth);

no dev_dbg() calls in this driver, please.

> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 00746c2..6baca05 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -540,6 +540,97 @@ static int dwc3_gadget_start_config(struct dwc3_ep *=
dep)
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
> + * In the ideal world, we would always be able to satisfy the
> + * following equation:
> + *
> + * ((512 + 2 * MDWIDTH-Bytes) + (Number of IN Endpoints - 1) * \
> + * (3 * (1024 + MDWIDTH-Bytes) + MDWIDTH-Bytes)) / MDWIDTH-Bytes
> + *
> + * Unfortunately, due to many variables that's not always the case.
> + */
> +static int dwc3_gadget_resize_tx_fifos(struct dwc3 *dwc, struct dwc3_ep =
*dep)
> +{
> +	int fifo_size, mdwidth, max_packet =3D 1024;
> +	int tmp, mult =3D 1, fifo_0_start, ram1_depth;
> +
> +	if (!dwc->needs_fifo_resize)
> +		return 0;
> +
> +	/* resize IN endpoints excepts ep0 */

typo: excepts

> +	if (!usb_endpoint_dir_in(dep->endpoint.desc) || dep->number <=3D 1)
> +		return 0;
> +
> +	/* Don't resize already resized IN endpoint */
> +	if (dep->fifo_depth) {
> +		dev_dbg(dwc->dev, "%s fifo_depth:%d is already set\n",
> +					dep->endpoint.name, dep->fifo_depth);

no dev_dbg()

> @@ -620,6 +711,10 @@ static int __dwc3_gadget_ep_enable(struct dwc3_ep *d=
ep, unsigned int action)
>  	int			ret;
>=20=20
>  	if (!(dep->flags & DWC3_EP_ENABLED)) {
> +		ret =3D dwc3_gadget_resize_tx_fifos(dwc, dep);

technically, you're no resizing a single FIFO. In any case, what happens
when you run out of space midway through the resizing? You already
accepted the gadget driver, you're already bound to it, then you resize
the FIFOs and things start to fall apart. How do we handle that?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl61VHEACgkQzL64meEa
mQaO5hAAijU5AvEFe4sTMgb/COtCQI4iIFQWYlb/myz6eJ/um98np7FTt/nJuxbn
Z1SjqTkKgOcAA542perYF9xmAjsB7ll4Nmluq1Z6brX1Pr3H6JbnPTKq2uvXF4+v
OgMPIYa3X8hgK5Wi/wyooVm6IlbymDOHGHCI2/3X1YVrs1wZg9HznPibFooMIVS7
pFwO95hnMSDLnzklaIbQYurpGt3KPjBJCSkyxZoUTCpcL5gbgCFE62kSCmJnjIoX
dncti3l6eBc1D2eGf8Vl926WbsrROrnX7bD/56CA4Wrk3XfA4JzouMOpxLuTl6ca
RcQYauEXIsm6SgrD10l3Dw3DEC44wEo+IUd6H7eF+96HHRtvgEYiFp165LyOOvtB
s6QX1XnzZbHUa0CbaHZ8TmgefWMe9faCdPiILCQP7UDHS2/tyoePVd/W77TydlFP
2f8UiAmJwGhVWx4evDBvCKYUCH049OY9xi980U4yMw+A3U6jicOGuUI5kiCHWENO
l6l4M6V/mR1Q/bJaoFNyddTCMBOUCSM6Og2Hy8sfcRSvzf1PzuUMHNhFxGFExIKM
gO68Hllos8wpaHTnDXRemD97zzzKufB/kYc/PQ0rqpk3LNaUHftozhODkjnMua6m
K69ac7JRE/ElKMEbQFcnsO9426COQTv5KLJULWApDuHQoCaqwHI=
=bjYh
-----END PGP SIGNATURE-----
--=-=-=--
