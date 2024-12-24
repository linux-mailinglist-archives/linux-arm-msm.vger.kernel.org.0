Return-Path: <linux-arm-msm+bounces-43192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A51F9FB9FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 07:54:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D61F5164AC4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 06:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0AB183098;
	Tue, 24 Dec 2024 06:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b4D3nifP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DB817BB32
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 06:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735023273; cv=none; b=LYSyRXwJurJd9RPhvmgyGbPq6s/+ZY9Xc9iOpGgQuayqWZRpx2ZXMJMuxKQzLgmdH9jtRbJzUmVtAIo7tt2KP2BaTSUYBKRFVM/jAONCMyW6vCGra9waSbyFPKoUCDwe7AL83Ubokmh3y3CyU7p1PnfATUXbnMHiV1bEMeegK/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735023273; c=relaxed/simple;
	bh=4DUMIWTcQDyWIbVXaeXDpEXf7v/bUzgqUFDdHOg5A0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pPoUBOh++OUihpcgkBqLhLVA9Q2IMKmW7RnzQqAIJf8ayL9DmaXq+c4Y5WhRMZgQN4aOSx6uRKVMz7GOL8cOv0QdAF4GAJrbKfoatrhK73n6KhcHBnjDmKMGcvZWbfbpQCpmS8gjMr7XqdZi97byLYuetN4G//f9GmJNFt38v+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b4D3nifP; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53e399e3310so5807916e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 22:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735023269; x=1735628069; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RAn3MjV4rabnamQM3Om5cfvaIbOj8lJLAJvI91e//wk=;
        b=b4D3nifP4KWYZD/XkSEKDsc7OsUnwifKZoKyisN3VqBB1DB75enjuDrihA9gJAEOb+
         tegQTzVb8OKEPllXnBEUur5K9QavHUwg+oIRsDW+75BsynXVsAuPoLHbw0p75wOmWykr
         la2q/NqxdMvgaDg9ngn+azzLxcdnoQeoyC8ebH3OP2lGFHvIVCDKXKxfXLF1FggivGwn
         aiOn32tFflSk+fWOTIhqpHgETNlOMwcpASextcew/3ZhXS3/BPcuSIhULwJ7D86NwsPs
         hPpZ58EnCULvRogHG1QjE7T0Vx6ad8QM6tH0UrDmwhPUzI/nzS+erryIJ9EC6Dh8Cq6C
         66cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735023269; x=1735628069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAn3MjV4rabnamQM3Om5cfvaIbOj8lJLAJvI91e//wk=;
        b=uJQtyC7CpSm1w5An65gd58EsbeK/mKXYIwPAB4KACV7MnSIMyTwn3jiTmwicCl5nxG
         39z1YIbMruVMLMu3GCqSiUOeBg4UOIjsgcVwRPsJ0IhqNSOzQTRE1fc6ZlCYKzCrSD2y
         Js2dRgWg9YX0j8AmZROj4PdElRtoLib8XNg1wk3tuLoZ52L5zS/GnhUztXLS1/1n8yMR
         gt4b8ZETlwaYwI6mZYO2ojcjlzyiZkamMDk62t+IcnSbHF+81FqMwSi9S2C5hiH7D1Qz
         OkCIa6phJfy+2jpiV20f67Cu/EIXNXloL0odMjBsQJDQWoU9RwcTsyRkg6BXrHwmkkYK
         DMQg==
X-Forwarded-Encrypted: i=1; AJvYcCULqxHRAAF3/2JSEJAkcgMv2RUUQAJUeWQydIebdd85Qy7yRYvoyT916e5GNZ+KowcfN6ANMQPnlTF3+tX7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+04mXTWTjQ4sur60WRkWWnjfiC2V1QN9wZu5hfCZGPjhwgfek
	LSXupH9YwOSF8g8D0DxwUhqe4PtaeORUwh8xWT9e2viQZNvT8lD08RbG6AT/Xog=
X-Gm-Gg: ASbGncsv0W2KbhfFtvTJZTWb9OIsh6fC+Kb8G8NHM+gM08M+40HDoehhbU6sVrW0xAj
	+EMFMlKNBPUoXv1yglP+Fs5UcLLGhI9WrfYZDNZJ8F/kuoOxRKkdFxtvoPgVUx3SjnboH+MKYOD
	uV2My0MVyF64LM6cqsAUQGGlSgW/DzCesn4pLwoiKa/x6y20xASuj3a+19GGTChZeIneWv+i+is
	I2Dm1CN5eDvQROav3gZN/rQVhWifYL980UAPLQaNm7tLxTonQdF2TEv3+6Dj8YqZjEpF1kzhq7+
	ADpLncbhX0w8ju791v779ACDWURerOuqu16w
X-Google-Smtp-Source: AGHT+IFZ9FYmkPeWqRN0z9ijU4bPknptgOJQz35q+Y9vZlQwpafVypdbiy89iGCV3AEf9UuusS4AGg==
X-Received: by 2002:a05:6512:4482:b0:542:2999:399d with SMTP id 2adb3069b0e04-542299939bbmr4076054e87.40.1735023269333;
        Mon, 23 Dec 2024 22:54:29 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235ffe72sm1526883e87.77.2024.12.23.22.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 22:54:28 -0800 (PST)
Date: Tue, 24 Dec 2024 08:54:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, andersson@kernel.org, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	Jingoo Han <jingoohan1@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, quic_vbadigan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: PCI: Add binding for qps615
Message-ID: <srts5hm5kvbu2k6fxtejuei7eo2fjvvhpxho2giskto3w3nvoh@iymonedukgrs>
References: <20241112-qps615_pwr-v3-0-29a1e98aa2b0@quicinc.com>
 <20241112-qps615_pwr-v3-1-29a1e98aa2b0@quicinc.com>
 <20241115161848.GA2961450-robh@kernel.org>
 <74eaef67-18f2-c2a1-1b9c-ac97cefecc54@quicinc.com>
 <kssmfrzgo7ljxveys4rh5wqyaottufhjsdjnro7k7h7e6fdgcl@i7tdpohtny2x>
 <9bcbbd2b-7fe9-d0ad-656a-f759b14a32dc@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bcbbd2b-7fe9-d0ad-656a-f759b14a32dc@quicinc.com>

On Tue, Dec 24, 2024 at 11:34:10AM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 12/24/2024 12:27 AM, Dmitry Baryshkov wrote:
> > On Sun, Nov 24, 2024 at 07:02:48AM +0530, Krishna Chaitanya Chundru wrote:
> > > 
> > > 
> > > On 11/15/2024 9:48 PM, Rob Herring wrote:
> > > > On Tue, Nov 12, 2024 at 08:31:33PM +0530, Krishna chaitanya chundru wrote:
> > > > > Add binding describing the Qualcomm PCIe switch, QPS615,
> > > > > which provides Ethernet MAC integrated to the 3rd downstream port
> > > > > and two downstream PCIe ports.
> > > > > 
> > > > > Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> > > > > ---
> > > > >    .../devicetree/bindings/pci/qcom,qps615.yaml       | 205 +++++++++++++++++++++
> > > > >    1 file changed, 205 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/pci/qcom,qps615.yaml b/Documentation/devicetree/bindings/pci/qcom,qps615.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..e6a63a0bb0f3
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/pci/qcom,qps615.yaml
> > > > > @@ -0,0 +1,205 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/pci/qcom,qps615.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Qualcomm QPS615 PCIe switch
> > > > > +
> > > > > +maintainers:
> > > > > +  - Krishna chaitanya chundru <quic_krichai@quicinc.com>
> > > > > +
> > > > > +description: |
> > > > > +  Qualcomm QPS615 PCIe switch has one upstream and three downstream
> > > > > +  ports. The 3rd downstream port has integrated endpoint device of
> > > > > +  Ethernet MAC. Other two downstream ports are supposed to connect
> > > > > +  to external device.
> > > > > +
> > > > > +  The QPS615 PCIe switch can be configured through I2C interface before
> > > > > +  PCIe link is established to change FTS, ASPM related entry delays,
> > > > > +  tx amplitude etc for better power efficiency and functionality.
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    enum:
> > > > > +      - pci1179,0623
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  i2c-parent:
> > > > > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > > > > +    description: |
> > > > 
> > > > Don't need '|' if no formatting to preserve.
> > > > 
> > > ack
> > > > > +      A phandle to the parent I2C node and the slave address of the device
> > > > > +      used to do configure qps615 to change FTS, tx amplitude etc.
> > > > > +    items:
> > > > > +      - description: Phandle to the I2C controller node
> > > > > +      - description: I2C slave address
> > > > > +
> > > > > +  vdd18-supply: true
> > > > > +
> > > > > +  vdd09-supply: true
> > > > > +
> > > > > +  vddc-supply: true
> > > > > +
> > > > > +  vddio1-supply: true
> > > > > +
> > > > > +  vddio2-supply: true
> > > > > +
> > > > > +  vddio18-supply: true
> > > > > +
> > > > > +  reset-gpios:
> > > > > +    maxItems: 1
> > > > > +    description:
> > > > > +      GPIO controlling the RESX# pin.
> > > > 
> > > > Is the PERST# or something else?
> > > > 
> > > it is not PERST GPIO, it is similar to PERST in terms
> > > of functionality which brings switch out from reset.
> > 
> > Do you have an actual PERST# on upstream facing port? Is it a separate
> > wire? Judging by the RB3 Gen2 this line is being used as PERST#
> > 
> we had PERST# as a separate line. It has two inputs one is PERST# &
> other one is RESX# gpio functionality wise both are similar.

I don't think I follow. Are you describing the QPS615 side or the SoC side?

> > > > > +
> > > > > +  qps615,axi-clk-freq-hz:
> > > > 
> > > > qps615 is not a vendor prefix.
> > > > 
> > > > > +    description:
> > > > > +      AXI clock rate which is internal bus of the switch
> > > > > +      The switch only runs in two frequencies i.e 250MHz and 125MHz.
> > > > > +    enum: [125000000, 250000000]
> > > > > +
> > > > > +allOf:
> > > > > +  - $ref: "#/$defs/qps615-node"
> > > > > +
> > > > > +patternProperties:
> > > > > +  "@1?[0-9a-f](,[0-7])?$":
> > > > 
> > > > You have 3 ports. So isn't this fixed and limited to 0-2?
> > > > 
> > > sure I will change it to below as suggested
> > > "@1?[0-3](,[0-1])?$"
> > 
> > Why do you still need '1?' ?
> > 
> we want to represent integrated ethernet MAC also here and to represent it
> we need '1' as it is multi function device. I will update the
> description to reflect the same.

Note, I has asked about the '1?' part, not about the [0-1].

However as you've mentioned it, you are describing the first level
subnodes. Per your example, these subnodes are "pcie@1,0", "pcie@2,0"
and "pcie@3,0". Thus this patternProperties should have the regexp of
"^pcie@[1-3],0$". The multifunction devices for the ethernet node are
hidden under the pcie@3,0 and as such they are not being matched against
this regexp.

> > > > > +    description: child nodes describing the internal downstream ports
> > > > > +      the qps615 switch.
> > > > 
> > > > Please be consistent with starting after the ':' or on the next line.
> > > > 
> > > > And start with capital C.
> > > > 
> > > > 
> > > ack
> > > 
> > > > > +    type: object
> > > > > +    $ref: "#/$defs/qps615-node"
> > > > > +    unevaluatedProperties: false
> > > > > +
> > > > > +$defs:
> > > > > +  qps615-node:
> > > > > +    type: object
> > > > > +
> > > > > +    properties:
> > > > > +      qcom,l0s-entry-delay-ns:
> > > > > +        description: Aspm l0s entry delay.
> > > > > +
> > > > > +      qcom,l1-entry-delay-ns:
> > > > > +        description: Aspm l1 entry delay.
> > > > 
> > > > These should probably be common being standard PCIe things. Though, why
> > > > are they needed? I'm sure the timing is defined by the PCIe spec, so
> > > > they are not compliant?
> > > > 
> > > Usually the firmware in the endpoints/switches should do this these
> > > configurations. But the qps615 PCIe switch doesn't have any firmware
> > > running to configure these. So the hardware exposes i2c interface to
> > > configure these before link training.
> > 
> > If they are following the standard, why do you need to have them in the
> > DT? Can you hardcode thos evalues in the driver?
> > 
> These values can be changed from platform to platform based upon the
> different power goals and latency requirements so we can't have hard coded
> values.
> 
> And even DWC controllers also provide provision to change these values
> currently we are not using them. As bjorn suggested if we move these to
> common pcie bindings these can be used in future by controller drivers also.

Ack

> > > > > +
> > > > > +      qcom,tx-amplitude-millivolt:
> > > > > +        $ref: /schemas/types.yaml#/definitions/uint32
> > > > > +        description: Change Tx Margin setting for low power consumption.
> > > > > +
> > > > > +      qcom,no-dfe-support:
> > > > > +        type: boolean
> > > > > +        description: Disable DFE (Decision Feedback Equalizer), which mitigates
> > > > > +          intersymbol interference and some reflections caused by impedance mismatches.
> > > > > +
> > > > > +      qcom,nfts:
> > > > > +        $ref: /schemas/types.yaml#/definitions/uint32
> > > > > +        description:
> > > > > +          Number of Fast Training Sequence (FTS) used during L0s to L0 exit
> > > > > +          for bit and Symbol lock.
> > > > 
> > > > Also something common.
> > > > 
> > > > The problem I have with all these properties is you are using them on
> > > > both the upstream and downstream sides of the PCIe links. They belong in
> > > > either the device's node (downstream) or the bus's node (upstream).
> > > > 
> > > This switch allows us to configure both upstream, downstream ports and
> > > also embedded Ethernet port which is internal to the switch. These
> > > properties are applicable for all of those.
> > > > > +
> > > > > +    allOf:
> > > > > +      - $ref: /schemas/pci/pci-bus.yaml#
> > > > 
> > > > pci-pci-bridge.yaml is more specific and closer to what this device is.
> > > > 
> > > I tried this now, I was getting warning saying the compatible
> > > /local/mnt/workspace/skales/kobj/Documentation/devicetree/bindings/pci/qcom,qps615.example.dtb:
> > > pcie@0,0: compatible: ['pci1179,0623'] does not contain items matching the
> > > given schema
> > >          from schema $id: http://devicetree.org/schemas/pci/qcom,qps615.yaml#
> > > /local/mnt/workspace/skales/kobj/Documentation/devicetree/bindings/pci/qcom,qps615.example.dtb:
> > > pcie@0,0: Unevaluated properties are not allowed ('#address-cells',
> > > '#size-cells', 'bus-range', 'device_type', 'ranges' were unexpected)
> > > 
> > > I think pci-pci-bridge is expecting the compatible string in this format
> > > only "pciclass,0604".
> > 
> > I think the pci-pci-bridge schema requires to have "pciclass,0604" among
> > other compatibles. So you should be able to do something like:
> > 
> > compatible = "pci1179,0623", "pciclass,0604";
> > 
> > At least if follows PCI Bus Binding to Open Firmware document.
> > 
> let us try this and come back.
> > > 
> > > > > +
> > > > > +unevaluatedProperties: false
> > > > > +
> > > > > +required:
> > > > > +  - vdd18-supply
> > > > > +  - vdd09-supply
> > > > > +  - vddc-supply
> > > > > +  - vddio1-supply
> > > > > +  - vddio2-supply
> > > > > +  - vddio18-supply
> > > > > +  - i2c-parent
> > > > > +  - reset-gpios
> > > > > +
> > > > > +examples:
> > > > > +  - |
> > > > > +
> > > > > +    #include <dt-bindings/gpio/gpio.h>
> > > > > +
> > > > > +    pcie {
> > > > > +        #address-cells = <3>;
> > > > > +        #size-cells = <2>;
> > > > > +
> > > > > +        pcie@0 {
> > > > > +            device_type = "pci";
> > > > > +            reg = <0x0 0x0 0x0 0x0 0x0>;
> > > > > +
> > > > > +            #address-cells = <3>;
> > > > > +            #size-cells = <2>;
> > > > > +            ranges;
> > > > > +            bus-range = <0x01 0xff>;
> > > > > +
> > > > > +            pcie@0,0 {
> > > > > +                compatible = "pci1179,0623";
> > > > > +                reg = <0x10000 0x0 0x0 0x0 0x0>;
> > > > > +                device_type = "pci";
> > > > > +                #address-cells = <3>;
> > > > > +                #size-cells = <2>;
> > > > > +                ranges;
> > > > > +                bus-range = <0x02 0xff>;
> > > > > +
> > > > > +                i2c-parent = <&qup_i2c 0x77>;
> > > > > +
> > > > > +                vdd18-supply = <&vdd>;
> > > > > +                vdd09-supply = <&vdd>;
> > > > > +                vddc-supply = <&vdd>;
> > > > > +                vddio1-supply = <&vdd>;
> > > > > +                vddio2-supply = <&vdd>;
> > > > > +                vddio18-supply = <&vdd>;
> > > > > +
> > > > > +                reset-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
> > > > > +
> > > > > +                pcie@1,0 {
> > > > > +                    reg = <0x20800 0x0 0x0 0x0 0x0>;
> > > > > +                    #address-cells = <3>;
> > > > > +                    #size-cells = <2>;
> > > > > +                    device_type = "pci";
> > > > > +                    ranges;
> > > > > +                    bus-range = <0x03 0xff>;
> > > > > +
> > > > > +                    qcom,no-dfe-support;
> > > > > +                };
> > > > > +
> > > > > +                pcie@2,0 {
> > > > > +                    reg = <0x21000 0x0 0x0 0x0 0x0>;
> > > > > +                    #address-cells = <3>;
> > > > > +                    #size-cells = <2>;
> > > > > +                    device_type = "pci";
> > > > > +                    ranges;
> > > > > +                    bus-range = <0x04 0xff>;
> > > > > +
> > > > > +                    qcom,nfts = <10>;
> > > > > +                };
> > > > > +
> > > > > +                pcie@3,0 {
> > > > > +                    reg = <0x21800 0x0 0x0 0x0 0x0>;
> > > > > +                    #address-cells = <3>;
> > > > > +                    #size-cells = <2>;
> > > > > +                    device_type = "pci";
> > > > > +                    ranges;
> > > > > +                    bus-range = <0x05 0xff>;
> > > > > +
> > > > > +                    qcom,tx-amplitude-millivolt = <10>;
> > > > > +                    pcie@0,0 {
> > > > > +                        reg = <0x50000 0x0 0x0 0x0 0x0>;
> > > > > +                        #address-cells = <3>;
> > > > > +                        #size-cells = <2>;
> > > > > +                        device_type = "pci";
> > > > 
> > > > There's a 2nd PCI-PCI bridge?
> > > This the embedded ethernet port which is as part of DSP3.
> > 
> > So is there an adidtional bus for that ethernet device?
> > 
> yes for ethernet it has aditional bus assigned.
> 
> > > 
> > > - Krishna Chaitanya.
> > > > 
> > > > > +                        ranges;
> > > > > +
> > > > > +                        qcom,l1-entry-delay-ns = <10>;
> > > > > +                    };
> > > > > +
> > > > > +                    pcie@0,1 {
> > > > > +                        reg = <0x50100 0x0 0x0 0x0 0x0>;
> > > > > +                        #address-cells = <3>;
> > > > > +                        #size-cells = <2>;
> > > > > +                        device_type = "pci";
> > > > > +                        ranges;
> > > > > +
> > > > > +                        qcom,l0s-entry-delay-ns = <10>;
> > > > > +                    };
> > 
> > What is this?
> > 
> Ethernet endpoint is a multi function device which has 2 functions
> This node represents 2nd node. I will update the description to
> reflect the same.

If this is an ethernet device, why does it have a name of pcie@? Per
bindings the pcie@ name should be used only for devices with the class
0604. Whas is the PCI device class for those devices? I think ethernet@
(0200) should probably be the best fit, judgin by your description.

> 
> - Krishna Chaitanya.
> 
> > > > > +                };
> > > > > +            };
> > > > > +        };
> > > > > +    };
> > > > > 
> > > > > -- 
> > > > > 2.34.1
> > > > > 
> > 

-- 
With best wishes
Dmitry

