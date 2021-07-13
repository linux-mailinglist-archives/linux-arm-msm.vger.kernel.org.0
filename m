Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C246F3C6C18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jul 2021 10:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234577AbhGMImM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jul 2021 04:42:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:46632 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234512AbhGMImM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jul 2021 04:42:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 667EE611CB;
        Tue, 13 Jul 2021 08:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626165562;
        bh=NPsCtWdGFx1mXGQ1yI4ME6zfRGklNQElsVvOuGSvTD4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=kRKP1QxY0785pt8Q0IGaK5nOl0X3B3u6N5MLaEOD9rLLPNZoK9SA58lcVG0O30Vfl
         g7Fw2RSArHPcQihTVzNbv5BditrNvAg2uEe/kz3B0AwDQw+OlCLP4olXsuqzOvk0Ac
         4rX6elwTnyC/Sm6FBBFfZeLnz87HwVtKe0Cmuv4/1BdJfvf26Yp/NKG31gcnrJvyHz
         Tj0/NkJGfR8EPmL5thbXNDqX9qQ/+3o/iuxyDVLEyYDjEjU1p6GPxqPtY7D77qyt84
         1ga72L1MuTaAU0BQjyo2Br5xUQ1yrxGKYhkYBsTjr8cpPJDhmnH3FoxWGWDUUcLx9n
         YrKCSnaMA75AA==
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Wesley Cheng <wcheng@codeaurora.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "agross@kernel.org" <agross@kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "frowand.list@gmail.com" <frowand.list@gmail.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jackp@codeaurora.org" <jackp@codeaurora.org>
Subject: Re: [PATCH v14 3/6] usb: dwc3: Resize TX FIFOs to meet EP bursting
 requirements
In-Reply-To: <b65463e9-3a8d-1ee5-3e26-09990aa8ec53@synopsys.com>
References: <1625908395-5498-1-git-send-email-wcheng@codeaurora.org>
 <1625908395-5498-4-git-send-email-wcheng@codeaurora.org>
 <b65463e9-3a8d-1ee5-3e26-09990aa8ec53@synopsys.com>
Date:   Tue, 13 Jul 2021 11:39:13 +0300
Message-ID: <87czrmzjym.fsf@kernel.org>
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

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
> Wesley Cheng wrote:
>> Some devices have USB compositions which may require multiple endpoints
>> that support EP bursting.  HW defined TX FIFO sizes may not always be
>> sufficient for these compositions.  By utilizing flexible TX FIFO
>> allocation, this allows for endpoints to request the required FIFO depth=
 to
>> achieve higher bandwidth.  With some higher bMaxBurst configurations, us=
ing
>> a larger TX FIFO size results in better TX throughput.
>>=20
>> By introducing the check_config() callback, the resizing logic can fetch
>> the maximum number of endpoints used in the USB composition (can contain
>> multiple configurations), which helps ensure that the resizing logic can
>> fulfill the configuration(s), or return an error to the gadget layer
>> otherwise during bind time.
>>=20
>> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
>> ---
>>  drivers/usb/dwc3/core.c   |  15 +++
>>  drivers/usb/dwc3/core.h   |  16 ++++
>>  drivers/usb/dwc3/ep0.c    |   2 +
>>  drivers/usb/dwc3/gadget.c | 232 +++++++++++++++++++++++++++++++++++++++=
+++++++
>>  4 files changed, 265 insertions(+)
>>=20
>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>> index ba74ad7..b194aecd 100644
>> --- a/drivers/usb/dwc3/core.c
>> +++ b/drivers/usb/dwc3/core.c
>> @@ -1267,6 +1267,7 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>>  	u8			rx_max_burst_prd;
>>  	u8			tx_thr_num_pkt_prd;
>>  	u8			tx_max_burst_prd;
>> +	u8			tx_fifo_resize_max_num;
>>  	const char		*usb_psy_name;
>>  	int			ret;
>>=20=20
>> @@ -1282,6 +1283,13 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>>  	 */
>>  	hird_threshold =3D 12;
>>=20=20
>> +	/*
>> +	 * default to a TXFIFO size large enough to fit 6 max packets.  This
>> +	 * allows for systems with larger bus latencies to have some headroom
>> +	 * for endpoints that have a large bMaxBurst value.
>> +	 */
>> +	tx_fifo_resize_max_num =3D 6;
>> +
>>  	dwc->maximum_speed =3D usb_get_maximum_speed(dev);
>>  	dwc->max_ssp_rate =3D usb_get_maximum_ssp_rate(dev);
>>  	dwc->dr_mode =3D usb_get_dr_mode(dev);
>> @@ -1325,6 +1333,11 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>>  				&tx_thr_num_pkt_prd);
>>  	device_property_read_u8(dev, "snps,tx-max-burst-prd",
>>  				&tx_max_burst_prd);
>> +	dwc->do_fifo_resize =3D device_property_read_bool(dev,
>> +							"tx-fifo-resize");
>> +	if (dwc->do_fifo_resize)
>> +		device_property_read_u8(dev, "tx-fifo-max-num",
>> +					&tx_fifo_resize_max_num);
>
> Why is this check here? The dwc->tx_fifo_resize_max_num should store
> whatever property the user sets. Whether the driver wants to use this

Ack!

> property should depend on "dwc->do_fifo_resize". Also why don't we have
> "snps," prefix to be consistent with the other properties?

Ack!

> Can we enforce to a single property? If the designer wants to enable
> this feature, he/she can to provide the tx-fifo-max-num. This would
> simplify the driver a bit. Since this is to optimize for performance,
> the user should know/want/test the specific value if they want to set
> for their setup and not hoping that the default setting not break their
> setup. So we can remove the "do_fifo_resize" property and just check
> whether tx_fifo_resize_max_num is set.

Ack!

All very valid points :-)

>> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
>> index dccdf13..735e9be 100644
>> --- a/drivers/usb/dwc3/core.h
>> +++ b/drivers/usb/dwc3/core.h
>> @@ -1023,6 +1023,7 @@ struct dwc3_scratchpad_array {
>>   * @rx_max_burst_prd: max periodic ESS receive burst size
>>   * @tx_thr_num_pkt_prd: periodic ESS transmit packet count
>>   * @tx_max_burst_prd: max periodic ESS transmit burst size
>> + * @tx_fifo_resize_max_num: max number of fifos allocated during txfifo=
 resize
>>   * @hsphy_interface: "utmi" or "ulpi"
>>   * @connected: true when we're connected to a host, false otherwise
>>   * @delayed_status: true when gadget driver asks for delayed status
>> @@ -1037,6 +1038,7 @@ struct dwc3_scratchpad_array {
>>   *	1	- utmi_l1_suspend_n
>>   * @is_fpga: true when we are using the FPGA board
>>   * @pending_events: true when we have pending IRQs to be handled
>> + * @do_fifo_resize: true when txfifo resizing is enabled for dwc3 endpo=
ints
>>   * @pullups_connected: true when Run/Stop bit is set
>>   * @setup_packet_pending: true when there's a Setup Packet in FIFO. Wor=
karound
>>   * @three_stage_setup: set if we perform a three phase setup
>> @@ -1079,6 +1081,11 @@ struct dwc3_scratchpad_array {
>>   * @dis_split_quirk: set to disable split boundary.
>>   * @imod_interval: set the interrupt moderation interval in 250ns
>>   *			increments or 0 to disable.
>> + * @max_cfg_eps: current max number of IN eps used across all USB confi=
gs.
>> + * @last_fifo_depth: last fifo depth used to determine next fifo ram st=
art
>> + *		     address.
>> + * @num_ep_resized: carries the current number endpoints which have had=
 its tx
>> + *		    fifo resized.
>>   */
>>  struct dwc3 {
>>  	struct work_struct	drd_work;
>> @@ -1233,6 +1240,7 @@ struct dwc3 {
>>  	u8			rx_max_burst_prd;
>>  	u8			tx_thr_num_pkt_prd;
>>  	u8			tx_max_burst_prd;
>> +	u8			tx_fifo_resize_max_num;
>>=20=20
>>  	const char		*hsphy_interface;
>>=20=20
>> @@ -1246,6 +1254,7 @@ struct dwc3 {
>>  	unsigned		is_utmi_l1_suspend:1;
>>  	unsigned		is_fpga:1;
>>  	unsigned		pending_events:1;
>> +	unsigned		do_fifo_resize:1;
>>  	unsigned		pullups_connected:1;
>>  	unsigned		setup_packet_pending:1;
>>  	unsigned		three_stage_setup:1;
>> @@ -1281,6 +1290,10 @@ struct dwc3 {
>>  	unsigned		dis_split_quirk:1;
>>=20=20
>>  	u16			imod_interval;
>> +
>> +	int			max_cfg_eps;
>> +	int			last_fifo_depth;
>> +	int			num_ep_resized;
>>  };
>>=20=20
>>  #define INCRX_BURST_MODE 0
>> @@ -1512,6 +1525,7 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, u=
nsigned int cmd,
>>  		struct dwc3_gadget_ep_cmd_params *params);
>>  int dwc3_send_gadget_generic_command(struct dwc3 *dwc, unsigned int cmd,
>>  		u32 param);
>> +void dwc3_gadget_clear_tx_fifos(struct dwc3 *dwc);
>>  #else
>>  static inline int dwc3_gadget_init(struct dwc3 *dwc)
>>  { return 0; }
>> @@ -1531,6 +1545,8 @@ static inline int dwc3_send_gadget_ep_cmd(struct d=
wc3_ep *dep, unsigned int cmd,
>>  static inline int dwc3_send_gadget_generic_command(struct dwc3 *dwc,
>>  		int cmd, u32 param)
>>  { return 0; }
>> +static inline void dwc3_gadget_clear_tx_fifos(struct dwc3 *dwc)
>> +{ }
>>  #endif
>>=20=20
>>  #if IS_ENABLED(CONFIG_USB_DWC3_DUAL_ROLE)
>> diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
>> index 3cd2942..d28d085 100644
>> --- a/drivers/usb/dwc3/ep0.c
>> +++ b/drivers/usb/dwc3/ep0.c
>> @@ -619,6 +619,8 @@ static int dwc3_ep0_set_config(struct dwc3 *dwc, str=
uct usb_ctrlrequest *ctrl)
>>  		return -EINVAL;
>>=20=20
>>  	case USB_STATE_ADDRESS:
>> +		dwc3_gadget_clear_tx_fifos(dwc);
>> +
>>  		ret =3D dwc3_ep0_delegate_req(dwc, ctrl);
>>  		/* if the cfg matches and the cfg is non zero */
>>  		if (cfg && (!ret || (ret =3D=3D USB_GADGET_DELAYED_STATUS))) {
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index af6d7f1..e56f1a6 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -632,6 +632,187 @@ static void dwc3_stop_active_transfer(struct dwc3_=
ep *dep, bool force,
>>  		bool interrupt);
>>=20=20
>>  /**
>> + * dwc3_gadget_calc_tx_fifo_size - calculates the txfifo size value
>> + * @dwc: pointer to the DWC3 context
>> + * @nfifos: number of fifos to calculate for
>> + *
>> + * Calculates the size value based on the equation below:
>> + *
>> + * DWC3 revision 280A and prior:
>> + * fifo_size =3D mult * (max_packet / mdwidth) + 1;
>> + *
>> + * DWC3 revision 290A and onwards:
>> + * fifo_size =3D mult * ((max_packet + mdwidth)/mdwidth + 1) + 1
>> + *
>> + * The max packet size is set to 1024, as the txfifo requirements mainl=
y apply
>> + * to super speed USB use cases.  However, it is safe to overestimate t=
he fifo
>> + * allocations for other scenarios, i.e. high speed USB.
>> + */
>> +static int dwc3_gadget_calc_tx_fifo_size(struct dwc3 *dwc, int mult)
>> +{
>> +	int max_packet =3D 1024;
>> +	int fifo_size;
>> +	int mdwidth;
>> +
>> +	mdwidth =3D dwc3_mdwidth(dwc);
>> +
>> +	/* MDWIDTH is represented in bits, we need it in bytes */
>> +	mdwidth >>=3D 3;
>> +
>> +	if (DWC3_VER_IS_PRIOR(DWC3, 290A))
>> +		fifo_size =3D mult * (max_packet / mdwidth) + 1;
>> +	else
>> +		fifo_size =3D mult * ((max_packet + mdwidth) / mdwidth) + 1;
>> +	return fifo_size;
>> +}
>> +
>> +/**
>> + * dwc3_gadget_clear_tx_fifo_size - Clears txfifo allocation
>> + * @dwc: pointer to the DWC3 context
>> + *
>> + * Iterates through all the endpoint registers and clears the previous =
txfifo
>> + * allocations.
>> + */
>> +void dwc3_gadget_clear_tx_fifos(struct dwc3 *dwc)
>> +{
>> +	struct dwc3_ep *dep;
>> +	int fifo_depth;
>> +	int size;
>> +	int num;
>> +
>> +	if (!dwc->do_fifo_resize)
>> +		return;
>> +
>> +	/* Read ep0IN related TXFIFO size */
>> +	dep =3D dwc->eps[1];
>> +	size =3D dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(0));
>> +	if (DWC3_IP_IS(DWC3))
>> +		fifo_depth =3D DWC3_GTXFIFOSIZ_TXFDEP(size);
>> +	else
>> +		fifo_depth =3D DWC31_GTXFIFOSIZ_TXFDEP(size);
>> +
>> +	dwc->last_fifo_depth =3D fifo_depth;
>> +	/* Clear existing TXFIFO for all IN eps except ep0 */
>> +	for (num =3D 3; num < min_t(int, dwc->num_eps, DWC3_ENDPOINTS_NUM);
>> +	     num +=3D 2) {
>> +		dep =3D dwc->eps[num];
>> +		/* Don't change TXFRAMNUM on usb31 version */
>> +		size =3D DWC3_IP_IS(DWC3) ? 0 :
>> +			dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(num >> 1)) &
>> +				   DWC31_GTXFIFOSIZ_TXFRAMNUM;
>> +
>> +		dwc3_writel(dwc->regs, DWC3_GTXFIFOSIZ(num >> 1), size);
>> +	}
>> +	dwc->num_ep_resized =3D 0;
>> +}
>> +
>> +/*
>> + * dwc3_gadget_resize_tx_fifos - reallocate fifo spaces for current use=
-case
>> + * @dwc: pointer to our context structure
>> + *
>> + * This function will a best effort FIFO allocation in order
>> + * to improve FIFO usage and throughput, while still allowing
>> + * us to enable as many endpoints as possible.
>> + *
>> + * Keep in mind that this operation will be highly dependent
>> + * on the configured size for RAM1 - which contains TxFifo -,
>> + * the amount of endpoints enabled on coreConsultant tool, and
>> + * the width of the Master Bus.
>> + *
>> + * In general, FIFO depths are represented with the following equation:
>> + *
>> + * fifo_size =3D mult * ((max_packet + mdwidth)/mdwidth + 1) + 1
>> + *
>> + * In conjunction with dwc3_gadget_check_config(), this resizing logic =
will
>> + * ensure that all endpoints will have enough internal memory for one m=
ax
>> + * packet per endpoint.
>> + */
>> +static int dwc3_gadget_resize_tx_fifos(struct dwc3_ep *dep)
>> +{
>> +	struct dwc3 *dwc =3D dep->dwc;
>> +	int fifo_0_start;
>> +	int ram1_depth;
>> +	int fifo_size;
>> +	int min_depth;
>> +	int num_in_ep;
>> +	int remaining;
>> +	int num_fifos =3D 1;
>> +	int fifo;
>> +	int tmp;
>> +
>> +	if (!dwc->do_fifo_resize)
>> +		return 0;
>> +
>> +	/* resize IN endpoints except ep0 */
>> +	if (!usb_endpoint_dir_in(dep->endpoint.desc) || dep->number <=3D 1)
>> +		return 0;
>
>> +
>> +	ram1_depth =3D DWC3_RAM1_DEPTH(dwc->hwparams.hwparams7);
>> +
>> +	if ((dep->endpoint.maxburst > 1 &&
>> +	     usb_endpoint_xfer_bulk(dep->endpoint.desc)) ||
>> +	    usb_endpoint_xfer_isoc(dep->endpoint.desc))
>> +		num_fifos =3D 3;
>> +
>> +	if (dep->endpoint.maxburst > 6 &&
>> +	    usb_endpoint_xfer_bulk(dep->endpoint.desc) && DWC3_IP_IS(DWC31))
>> +		num_fifos =3D dwc->tx_fifo_resize_max_num;
>
> Why only bulk? Isoc should be at least equal or more than bulk.
> Also, make this applicable to DWC_usb32 also.

this should be applicable to all DWC3 versions, no? dwc3, 31 and 32.

>> @@ -648,6 +829,10 @@ static int __dwc3_gadget_ep_enable(struct dwc3_ep *=
dep, unsigned int action)
>>  	int			ret;
>>=20=20
>>  	if (!(dep->flags & DWC3_EP_ENABLED)) {
>> +		ret =3D dwc3_gadget_resize_tx_fifos(dep);
>> +		if (ret)
>> +			return ret;
>> +
>>  		ret =3D dwc3_gadget_start_config(dep);
>>  		if (ret)
>>  			return ret;
>> @@ -2498,6 +2683,7 @@ static int dwc3_gadget_stop(struct usb_gadget *g)
>>=20=20
>>  	spin_lock_irqsave(&dwc->lock, flags);
>>  	dwc->gadget_driver	=3D NULL;
>> +	dwc->max_cfg_eps =3D 0;
>>  	spin_unlock_irqrestore(&dwc->lock, flags);
>>=20=20
>>  	free_irq(dwc->irq_gadget, dwc->ev_buf);
>> @@ -2585,6 +2771,51 @@ static int dwc3_gadget_vbus_draw(struct usb_gadge=
t *g, unsigned int mA)
>>  	return ret;
>>  }
>>=20=20
>> +/**
>> + * dwc3_gadget_check_config - ensure dwc3 can support the USB configura=
tion
>> + * @g: pointer to the USB gadget
>> + *
>> + * Used to record the maximum number of endpoints being used in a USB c=
omposite
>> + * device. (across all configurations)  This is to be used in the calcu=
lation
>> + * of the TXFIFO sizes when resizing internal memory for individual end=
points.
>> + * It will help ensured that the resizing logic reserves enough space f=
or at
>> + * least one max packet.
>> + */
>> +static int dwc3_gadget_check_config(struct usb_gadget *g)

Might be better to pass the actual config being used. And, instead of
check_config, perhaps validate_config is a little more fitting.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmDtUTERHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUg2LAgAgNDwBaeK0uX0Cv8lJlJDHPfjzb8HkXfo
+3eCag9AJtv1BzaZDb6K+rzsYmGR+DFBKVbCdsNfj3aAyJLXuBhZrD94iaphzKJZ
y9KfnkIgLGhg0qv7wOcdkdp/6rw3Z9gKIU0BmT3qgg8ZH4YbnQBXzPC3f5bfhQ9R
oIVj1bfTlbuzzwHwga3g/4djS5AB89bIbU+5yLYQwlB72cxQ1pG+lO2Z8SBdYaGr
yLSf3tazKNshE/Qeli5h0G09M1pznBeJ0MUTFi2vU7JmWGH/l2Lf9QxErzhMreJr
I0Pzz0d0V/0H47ERdxyXa+ztzlwYz11QiIoAruarkz6g9CdJrbE7zw==
=epcY
-----END PGP SIGNATURE-----
--=-=-=--
