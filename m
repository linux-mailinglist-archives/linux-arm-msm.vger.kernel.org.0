Return-Path: <linux-arm-msm+bounces-52029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B273A699B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 20:48:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F19F3B4E6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 19:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B14C520DD45;
	Wed, 19 Mar 2025 19:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k83A1uaj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C2A17A2F0;
	Wed, 19 Mar 2025 19:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742413532; cv=none; b=pPgwoQXZ9Lr1GtS3zlduEb5s6q4Si5rqVTrDTgig+Ul2SsOr6E6/83Gw4W6tMG0YdF9Ubj8um+z0LjbN5k2E8QuuuCvNbYasEkTl2N9PBNEBVikufRGPWCY+QE/Ob9H67d1SVznGv0iSqykXIviuxyfDA2uUUTtAW+QlyfUan8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742413532; c=relaxed/simple;
	bh=Myrbj9m3hCsLiGJ67e/0Ahc4o+JFpDhFwC5X4tYyaWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uGSsKS4zOs7/+CbOFr19m03/S3NkqQ81qFNYvKMmWsjBTs4S+I7I5mltlU7Jlk2PYnR/9a4CSMKjo4YKKybzuSTaa7Xrz0sOtv+u7VxdGqypzOR9YlkEekINwv79fQaU7/UYuvytpyZ9wXsbb2MymCf7iDSvh7tsP5XzcM5RrgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k83A1uaj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 194F1C4CEE4;
	Wed, 19 Mar 2025 19:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742413532;
	bh=Myrbj9m3hCsLiGJ67e/0Ahc4o+JFpDhFwC5X4tYyaWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k83A1uajWbT+HjRfBwWMJPneWcAaqV8JUKcAotRtn3xRccysHf6Se8rOR6tPMmIRx
	 MRaiXTRZ3l2DSxZNErw8zsSjnDQ14rm0PJ1zS29pTXfGn7vASw0CMSPOiYObcExFLk
	 sxAr1VvnTVur/2PG9RUpkq77dounwhdqyNcqIjaHoBj74JBsVwM6aP0q2sacTOCqOO
	 /e/66r7FNUHCQdGe6AHAI+qsfL99iNMlMKcRxWSSxFIDeKjLK8Iroa8SO0WgJxJsDJ
	 pcygy6FToNzIz85JZ3cqVwsfXV6BL0A2rkytbN+EKRCTPMB0RLv7JFPQsHkiwOLEjk
	 //6tSSP1ZNk8w==
Date: Wed, 19 Mar 2025 14:45:29 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: bjorn.andersson@oss.qualcomm.com, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100-dell-xps13-9345: Enable
 fingerprint sensor
Message-ID: <4kh3zg3ohqzarbhv4r64iapi5x7paz2r7z3wkesgbjmm5fvgsy@dkkbbgmgt6mo>
References: <20250318-xps13-fingerprint-v1-0-fbb02d5a34a7@oss.qualcomm.com>
 <20250318-xps13-fingerprint-v1-2-fbb02d5a34a7@oss.qualcomm.com>
 <CAMcHhXoE+UvoKmy1ULJoAq1nrr+PO6qie3vxLuqQbUpiE=SMBQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMcHhXoE+UvoKmy1ULJoAq1nrr+PO6qie3vxLuqQbUpiE=SMBQ@mail.gmail.com>

On Wed, Mar 19, 2025 at 04:05:41PM +0100, Aleksandrs Vinarskis wrote:
> On Wed, 19 Mar 2025 at 04:22, Bjorn Andersson via B4 Relay
> <devnull+bjorn.andersson.oss.qualcomm.com@kernel.org> wrote:
> >
> > From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> >
> > The fingerprint sensor, hidden in the power button, is connected to one
> > of the USB multiport ports; while the other port is unused.
> >
> > Describe the USB controller, the four phys and the repeater involved to
> > make the fingerprint sensor operational.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > ---
> 
> Thanks for getting to the bottom of this, it was certainly a long
> awaited feature :)
> 

Didn't think it was something I wanted, but now that it's working I
proved myself wrong ;)

> >  .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     | 59 +++++++++++++++++++++-
> >  1 file changed, 57 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> > index 967f6dba0878b51a985fd7c9570b8c4e71afe57d..a35557c562d771e2ce209fca05b82c1943d70f63 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> > @@ -744,8 +744,21 @@ touchscreen@10 {
> >
> >  &i2c9 {
> >         clock-frequency = <400000>;
> > -       status = "disabled";
> > -       /* USB3 retimer device @0x4f */
> > +       status = "okay";
> > +
> > +       eusb6_repeater: redriver@4f {
> > +               compatible = "nxp,ptn3222";
> > +               reg = <0x4f>;
> > +               #phy-cells = <0>;
> > +
> > +               vdd3v3-supply = <&vreg_l13b_3p0>;
> > +               vdd1v8-supply = <&vreg_l4b_1p8>;
> > +
> > +               reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
> > +
> > +               pinctrl-0 = <&eusb6_reset_n>;
> > +               pinctrl-names = "default";
> > +       };
> >  };
> >
> >  &i2c17 {
> > @@ -967,6 +980,14 @@ edp_reg_en: edp-reg-en-state {
> >                 bias-disable;
> >         };
> >
> > +       eusb6_reset_n: eusb6-reset-n-state {
> > +               pins = "gpio184";
> > +               function = "gpio";
> > +               drive-strength = <2>;
> > +               bias-disable;
> > +               output-low;
> > +       };
> > +
> >         hall_int_n_default: hall-int-n-state {
> >                 pins = "gpio92";
> >                 function = "gpio";
> > @@ -1172,3 +1193,37 @@ &usb_1_ss1_dwc3_hs {
> >  &usb_1_ss1_qmpphy_out {
> >         remote-endpoint = <&retimer_ss1_ss_in>;
> >  };
> > +
> > +&usb_mp {
> > +       status = "okay";
> > +};
> > +
> > +&usb_mp_hsphy0 {
> > +       vdd-supply = <&vreg_l2e_0p8>;
> > +       vdda12-supply = <&vreg_l3e_1p2>;
> > +
> > +       phys = <&eusb6_repeater>;
> 
> I was under the impression that the fingerprint reader is on the 2nd
> port of the root hub, as:
> * In ACPI, the only USB device of MP is listed under PRT1, PRT0 is empty
> * On Windows the device is listed as PORT2...HUB1...
> * `lsusb -t` for the device gives `Port 002: Dev 002,...12M`
> 
> Do `usb_mp_hsphy0` and `usb_mp_hsphy1` translate to port 1 and 2
> respectively? Because if yes, repeater may belong to `usb_mp_hsphy1`
> instead?
> 

That would be more logical, I'll dig up some documentation for the
SoC and see if I can better understand the naming of these instances.

> Current series works. Moving `phys = <&eusb6_repeater>;` to
> `usb_mp_hsphy1` also works, I'm assuming because we are not actually
> disabling unused phys.
> 

While not being used for any communication, the PHY is there and the
multiport controller seems to need them both to be present. Further
regardless of something being connected to the PHY, it's still there, so
it seems correct to represent it in the dtsi. That said, I didn't dig
deeper into the exact details here.

> Tested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> 

Thanks.

Regards,
Bjorn

> 
> > +
> > +       status = "okay";
> > +};
> > +
> > +&usb_mp_hsphy1 {
> > +       vdd-supply = <&vreg_l2e_0p8>;
> > +       vdda12-supply = <&vreg_l3e_1p2>;
> > +
> > +       status = "okay";
> > +};
> > +
> > +&usb_mp_qmpphy0 {
> > +       vdda-phy-supply = <&vreg_l3e_1p2>;
> > +       vdda-pll-supply = <&vreg_l3c_0p9>;
> > +
> > +       status = "okay";
> > +};
> > +
> > +&usb_mp_qmpphy1 {
> > +       vdda-phy-supply = <&vreg_l3e_1p2>;
> > +       vdda-pll-supply = <&vreg_l3c_0p9>;
> > +
> > +       status = "okay";
> > +};
> >
> > --
> > 2.48.1
> >
> >

