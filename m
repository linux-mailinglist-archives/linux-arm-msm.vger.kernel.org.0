Return-Path: <linux-arm-msm+bounces-116652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b26HJWRTS2qUPQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:04:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 878A570D446
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:04:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=IpEh56T1;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116652-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116652-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BFDC8300C7DE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 07:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B35342643C;
	Mon,  6 Jul 2026 06:44:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E5842A799;
	Mon,  6 Jul 2026 06:44:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783320293; cv=none; b=It+cdTbbOfPdxDSuLspBAiqv3Cc0xBDBFPIB0Sq0PAi9alCGpwHzOKfvzGYLFWcx9TSYIr5xCTjuYokcBtFexMGaHcPgp7GEdQpaetaegHjMVHgESKY/HyphQI8Y9dlCXgP1gqkgTFgnB/ko9sju7WVWP61MxHWVMlRIl2RkGAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783320293; c=relaxed/simple;
	bh=xQqqE7JBbyahFaqaJ0tvO7axntcfjCqwxtMCYAG7yKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fA0oM7UIGi6b7k9Z+p6Sfvo9XwsTat5pt6glYP3BWmpBiMnH2JgVgKiGewjDlp0+HiBPMQkIc9NA4SdskyL/Y7Hn9B+sJLGlIYLxpWNjFgjcG2vzyWkmmcLej2JrVRjZ3if0yKvnnJ+drQs+Kas9ps507Qbl5TnHgWO77jItr6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IpEh56T1; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F44C1F000E9;
	Mon,  6 Jul 2026 06:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783320280;
	bh=/fPwJ5XgRM6mvxg/vC5xFu7gKO1w6g8o9vmcGDZN3lw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IpEh56T1GIDmOQX1RCRaoOsSsgDiuNbWlgnxSxm4/DHvKCf1EIK1Iu0pDmKgay+th
	 GW15L23bEe6g/qbRQ3a7oM5eHrf9jker/7266zhJHse7XaPZPE1QhQYYN1LHUs1PLx
	 64AlDCa0/X1LxnNiNGjcHbRxomlJmU8/C32bnq8TZRZ7m3JFGcA28gP7Kt0JafX1M9
	 ah1yk8O/jJdN6v2rrdBmJgriO8C31X9rAsm/Gc67754018FNdBwT+DvLh0MemtDLkS
	 hMtEPNB1d8Zo0A+3UUNFZlU2nVc+70lwPjmNQUOydNemM834P+i2Cnt4Sv7mvhB+9x
	 hqi7uNJA/SDWQ==
Date: Mon, 6 Jul 2026 08:44:29 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/4] Bluetooth: hci_qca: Support QCA2066 on M.2
 connector via pwrseq
Message-ID: <l4qycbmz2zaroe5rreuop4dx7ugfcx37hfaketvn43trdpaept@jyx65agqznq4>
References: <20260702-monza-wireless-v2-0-7b56e2a6a6d4@oss.qualcomm.com>
 <20260702-monza-wireless-v2-3-7b56e2a6a6d4@oss.qualcomm.com>
 <43re752djujsh2kiyvjlkpmztxsh4atg6472qhir4lgay24zbo@mtlkn2xc2ors>
 <rxt4n6vuscu33mrw24af72lb3s6urqfpkhtia44yfo4j7wtu6o@3xp57owekrgj>
 <u5ieok3hgjcf74sxjdzv6xurmlbve46xa3imgfnom4hpjarmxa@fna5daqpyk3r>
 <zat6uuvh7jwfxajvqtif6d67osf6h5b2vxig3bmuch76btpdkj@bfxjj7kk5fjk>
 <ynhos7h4x3kbqbio2gkigoo5rqbwogrzihkylxv5pqjtqpqmnq@rlyjaiopx74a>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ynhos7h4x3kbqbio2gkigoo5rqbwogrzihkylxv5pqjtqpqmnq@rlyjaiopx74a>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:loic.poulain@oss.qualcomm.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116652-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,holtmann.org,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 878A570D446

On Sat, Jul 04, 2026 at 03:11:13AM +0300, Dmitry Baryshkov wrote:
> On Thu, Jul 02, 2026 at 05:08:56PM +0200, Manivannan Sadhasivam wrote:
> > On Thu, Jul 02, 2026 at 05:34:31PM +0300, Dmitry Baryshkov wrote:
> > > On Thu, Jul 02, 2026 at 04:17:43PM +0200, Manivannan Sadhasivam wrote:
> > > > On Thu, Jul 02, 2026 at 03:14:49PM +0300, Dmitry Baryshkov wrote:
> > > > > On Thu, Jul 02, 2026 at 12:46:15PM +0200, Loic Poulain wrote:
> > > > > > For QCA2066 (and other QCA chips) on M.2 connectors, the UART enable
> > > > > > is controlled by the W_DISABLE2# signal managed by the pcie-m2 power
> > > > > > sequencer rather than a dedicated BT enable GPIO.
> > > > > > 
> > > > > > When the serdev controller has an OF graph (indicating it is connected
> > > > > > to an M.2 connector), acquire the 'uart' pwrseq target from the
> > > > > > connector's power sequencer and use it to control BT power instead of
> > > > > > the bt-enable GPIO.
> > > > > > 
> > > > > > Also allocate bt_power unconditionally for all SOC types since the
> > > > > 
> > > > > Can we just fold it into the main struct?
> > > > > 
> > > > > > pwrseq path is independent of the SOC type switch.
> > > > > > 
> > > > > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > > > > ---
> > > > > >  drivers/bluetooth/hci_qca.c | 81 ++++++++++++++++++++++++---------------------
> > > > > >  1 file changed, 43 insertions(+), 38 deletions(-)
> > > > > > @@ -2387,6 +2390,35 @@ static int qca_init_regulators(struct qca_power *qca,
> > > > > >  	return 0;
> > > > > >  }
> > > > > >  
> > > > > > +/*
> > > > > > + * Acquire the M.2 connector power sequencer.
> > > > > > + *
> > > > > > + * An OF graph link on the serdev controller is only present when the BT
> > > > > > + * device is attached through an M.2 Key E connector. In that case the UART
> > > > > > + * enable (W_DISABLE2#) is driven by the pcie-m2 power sequencer instead of a
> > > > > > + * dedicated BT enable GPIO, so grab the "uart" pwrseq target from it.
> > > > > > + *
> > > > > > + * Returns 0 if no M.2 connector is present (nothing to do), a negative errno
> > > > > > + * on error, otherwise 0 with qcadev->bt_power->pwrseq populated.
> > > > > > + */
> > > > > > +static int qca_serdev_get_m2_pwrseq(struct qca_serdev *qcadev, bool *bt_en_available)
> > > > > > +{
> > > > > > +	struct serdev_device *serdev = qcadev->serdev_hu.serdev;
> > > > > > +	struct device *dev;
> > > > > > +
> > > > > > +	if (!of_graph_is_present(dev_of_node(&serdev->ctrl->dev)))
> > > > > > +		return 0;
> > > > > > +
> > > > > > +	qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->ctrl->dev, "uart");
> > > > > > +	if (IS_ERR(qcadev->bt_power->pwrseq))
> > > > > > +		return PTR_ERR(qcadev->bt_power->pwrseq);
> > > > > > +
> > > > > > +	dev = pwrseq_to_device(qcadev->bt_power->pwrseq);
> > > > > > +	*bt_en_available = device_property_present(dev, "w-disable2-gpios");
> > > > > 
> > > > > I think here you are looking into the exact details of the other of the
> > > > > graph. There might be other devices on that side, while the code now
> > > > > assumes M.2. Or, consider having an M.2 controller which handles
> > > > > W_DISABLE2# internally rather than through the GPIO.
> > > > > 
> > > > 
> > > > This code only deals with M.2 connector in specific, so I'm not sure why we need
> > > > to worry about *other* kind of devices. Let's worry about them when they show up
> > > > (with graph interface ofc).
> > > 
> > > I don't think we want to go through the drivers using M.2 connectors in
> > > such a case. In the end, the contract should be that there is a power
> > > sequencer on the other side of the graph, but the specifics of the
> > > connector should be abstracted out. Do you know, if in the x86 world the
> > > W_DISABLE2# is a GPIO or is controleed by the hub.
> > > 
> > 
> > I tried to abstract out, but Bartosz didn't want pwrctrl APIs to do that level
> > of abstraction as pwrctrl APIs should be generic and should not be bind to a
> > specific connector and exposing its internals.
> > 
> > That's why we ended up having pwrctrl core exposing the 'struct dev' using
> > pwrseq_to_device() and letting the consumer extracting whatever information it
> > needs.
> 
> Do we have other ways to control M.2? For example on the x86 systems,
> are those signals controlled via GPIOs (or GPIO-like registers) or are
> they controlled separately by something like M.2 controller? Or do you
> have an idea about other non-x86 systems?
> 

Thre is no OS-visible M.2 power control in ACPI systems. ACPI defines PRx
objects to control power to the PCI devices based on the D-state and the OS just
evaluates the _ON/_OFF methods of the respective objects.

So this API is not going to be useful on non-DT systems where the BT_EN GPIO
handling is abstracted away. And also on platforms where BT_EN is not controlled
by GPIOs. But I haven't seen DT platforms handling BT_EN (or W_DISABLE2#)
signal in a non-GPIO way.

I too prefer an API to query whether the connector supports BT_EN or not, but
I'm not sure how to come up with a generic pwrseq API which also satisfies the
requirement. If you have any suggestions, please let me know!

FWIW, I tried adding pwrseq_is_fixed() API [1] earlier, which was turned down by
Bartosz.

- Mani

[1] https://lore.kernel.org/all/20260422-pwrseq-m2-bt-v1-1-720d02545a64@oss.qualcomm.com/

-- 
மணிவண்ணன் சதாசிவம்

