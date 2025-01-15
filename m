Return-Path: <linux-arm-msm+bounces-45148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73749A129B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 18:23:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B5F43A1675
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 17:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3AA31791F4;
	Wed, 15 Jan 2025 17:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WOkEvGH0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030B743ACB
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 17:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736961795; cv=none; b=jNV9WQZQN1sZltPSNvP/u++50RAVtCc/15IqO+NubdtBkJWv64jEn6XYfUK8w2yQ/+5x67eyaHrG5PMuXSc0L3kc2FwaUR7oKyxRTfhGISRv0fUtQMBQOJiL13FvdTImhjDc9vXdyWQhJBCPHyAK5/IdqDqnKnvTbsWhelHC7CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736961795; c=relaxed/simple;
	bh=1KB7txDCZ93nbVXZ0ai+jU1Hipar0RSY2izZhKnCt40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eAufZ2LWMBxyq1qJm2Fg/5vfunIfCx4m806OHADUHByMxhv/IzXgQvI1aMjn6bh9Iw1NG5gChU2kOjivy/rKZamcSZxRDImW+3oe21AVXrVr/Wre2PvU+UTnnel093gMZyaVwRsn4kbQzHih3Kstke2U+7e+B9FmrmI7zZmsLSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WOkEvGH0; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ee67e9287fso122443a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 09:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736961793; x=1737566593; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LGc/C1yzuBbuvav0aaHLoiBeH6vLxOKW0EyhRVyasAY=;
        b=WOkEvGH0QMD5GRUjKSnDxypGaEkgX5f3K073bReGxTOLkZcPxk4bdt9yUSIVR993TQ
         Yex/y/wQILZt5XNKZ8BkYp1gqf2d6jdmN22gyXjOJwE2HnYjY87vHVGMhNgqFV75dezs
         5bEKG92pZrKdUYdtfCw8DzUUR8nsDrDLQqrG4XFjYSecnlaSkqBF9zYYZhYB1nsdSXY5
         JI9Tb+7+BRhxKeQ9sN5G7fWbpSRpftDLa8c5UIVaEikylVAd0hG4QU+3V8pk63AXD5u0
         uLoD74NNURsc8/tYYy2xyR361WtInlqUTazGdGVqrK0J71eUu6V8GcIw3LHkGU6DPcPw
         2WJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736961793; x=1737566593;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LGc/C1yzuBbuvav0aaHLoiBeH6vLxOKW0EyhRVyasAY=;
        b=bPEGZxo8L128Kg8Wzm2pVea8W2zYMvwIlFbWkTmtC/1G3J04fU/bC7ECsnmyxRfZmF
         38OBmCpWezMJ/z9muhEzxTUkR0I0P4kgnBQAqhpnEiEnFp+z5KCYcUFaZZsjD8rQe8/8
         L2H5In/NTMX6w0DTcjFRMrUOoKHbmeE/+Z7JFTqOtyBWDlsmucdJLMGq/hiqHL/3UpuF
         ehjltsRC55NQ4mSzCpov9mfejrmKMHthPInDozOHVDBWNz6fb+zOINpMRYHeexJUtlUT
         jzjZEhqevXAnnP0ksyj2Ck4t+1GtGpg8CWpmi6bjBSIx0khgSTmQPRcJ5zhqkIRH3F8o
         RNQg==
X-Forwarded-Encrypted: i=1; AJvYcCXxsdglOa0vA3m35X9S1YIZQqqBTJz+Bnvl/10maQZjZpUMoHi8eFUxZgy8XPpNI5r55MprdB5L1Dj3FeLx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4tlIvXvCgyt7akz7ncc80RuMKabzUG0BS0R2yGLcWh61JjsZk
	Jx7Js2CPQ7ADPpYcP56Hx4l1xrAav56xZBv3/CuZrIp5bkHsjfuXqBD7wG9A7T3eacGJIZxKX7U
	=
X-Gm-Gg: ASbGncueT55DtlN1EeRF88nXmNxYrRFyBtlR4z7ibEeKy79AZrcYz3FmFY7GwKdYd2z
	BEWMOJ3XwV/6N5ZovccUONjwJMEWENTyBWa72yK0/2O1sKx9o6XEI4cP8YlgaUNR9jJmOuHsJop
	ouh7YT6kzlAtX9LGwXK+klYzjNOgkpNbv//ZEFtenkMd2u2UoXDyqFjonMYS8CDjrj4Snwew5Db
	QcxhsIx9VXHsqYRBEy+TO25QaNVWXDS8/BCOexwEiY3Y7K/G6jMjcL5kj2MrVHeTYo=
X-Google-Smtp-Source: AGHT+IF95efwqWrgS/F1QQMyR5CmEdptuRTAbW6O82AZwIxPM/ttdhBkwmweSD0dvhrGKAnwUqY7KA==
X-Received: by 2002:a17:90a:dfcb:b0:2ea:5054:6c49 with SMTP id 98e67ed59e1d1-2f548da510amr51228181a91.0.1736961793330;
        Wed, 15 Jan 2025 09:23:13 -0800 (PST)
Received: from thinkpad ([120.60.139.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c2bb332sm1781624a91.36.2025.01.15.09.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 09:23:11 -0800 (PST)
Date: Wed, 15 Jan 2025 22:53:04 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Krishna Chaitanya Chundru <quic_krichai@quicinc.com>,
	andersson@kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Jingoo Han <jingoohan1@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, quic_vbadigan@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: PCI: Add binding for qps615
Message-ID: <20250115172304.5jxgot6enijumbqy@thinkpad>
References: <eysqoiiizunkjxqyvfaxbx4szwnz4osv42j7xr247irnthifwu@nhxytsl4brvu>
 <20250107224244.GA187680@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250107224244.GA187680@bhelgaas>

On Tue, Jan 07, 2025 at 04:42:44PM -0600, Bjorn Helgaas wrote:
> On Tue, Dec 24, 2024 at 11:49:42AM +0200, Dmitry Baryshkov wrote:
> > On Tue, Dec 24, 2024 at 02:41:10PM +0530, Krishna Chaitanya Chundru wrote:
> > > On 12/5/2024 2:55 AM, Bjorn Helgaas wrote:
> > > > On Tue, Nov 12, 2024 at 08:31:33PM +0530, Krishna chaitanya chundru wrote:
> > > > > Add binding describing the Qualcomm PCIe switch, QPS615,
> > > > > which provides Ethernet MAC integrated to the 3rd downstream port
> > > > > and two downstream PCIe ports.
> 
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
> > > > 
> > > > This binding describes a switch.  I don't think bus-range should
> > > > appear here at all because it is not a feature of the hardware (unless
> > > > the switch ports are broken and their Secondary/Subordinate Bus
> > > > Numbers are hard-wired).
> > > > 
> > > > The Primary/Secondary/Subordinate Bus Numbers of all switch ports
> > > > should be writable and the PCI core knows how to manage them.
> > > 
> > > The dt binding check is throwing an error if we don't keep bus-range
> > > property for that reason we added it, from dt binding perspective i think it
> > > is mandatory to add this property.
> > 
> > Could you please provide an error message? I don't see any of the PCIe
> > bindingins declaring bus-range as mandatory. I might be missing it
> > though.
> 
> I think the warning message is like this:
> 
>   Warning (pci_device_bus_num): /soc@0/pcie@1c00000/pcie@0/wifi@0: PCI bus number 1 out of range, expected (0 - 0)
> 
> and only happens if there's a device below a Root Port or a Switch.
> In that case the device "reg" property apparently has to include the
> bus/device/function.
> 
> IIUC, in this case, we're describing a Switch with an integrated
> Ethernet MAC:
> 
>   pcie@0 {
>     device_type = "pci";
>     reg = <0x0 0x0 0x0 0x0 0x0>;           # 00:00.0 RP to [bus 01-ff]
>     bus-range = <0x01 0xff>;
> 
>     pcie@0,0 {
>       compatible = "pci1179,0623";
>       reg = <0x10000 0x0 0x0 0x0 0x0>;     # 01:00.0 Switch USP to [bus 02-ff]
>       device_type = "pci";
>       bus-range = <0x02 0xff>;
> 
>       pcie@1,0 {
>         reg = <0x20800 0x0 0x0 0x0 0x0>;   # 02:01.0 Switch DSP to [bus 03-ff]
>         device_type = "pci";
>         bus-range = <0x03 0xff>;
>         qcom,no-dfe-support;
>       };
> 
>       pcie@2,0 {
>         reg = <0x21000 0x0 0x0 0x0 0x0>;   # 02:02.0 Switch DSP to [bus 04-ff]
>         device_type = "pci";
>         bus-range = <0x04 0xff>;
>         qcom,nfts = <10>;
>       };
> 
>       pcie@3,0 {
>         reg = <0x21800 0x0 0x0 0x0 0x0>;   # 02:02.1 Switch DSP to [bus 05-ff]
>         device_type = "pci";
>         bus-range = <0x05 0xff>;
>         qcom,tx-amplitude-millivolt = <10>;
> 
>         pcie@0,0 {
>           reg = <0x50000 0x0 0x0 0x0 0x0>; # 05:00.0 Ethernet MAC, I guess?
>           device_type = "pci";
>           qcom,l1-entry-delay-ns = <10>;
>         };
> 
>         ...
>       };
>     };
>   };
> 
> So I think the bus-range properties are needed to match the reg
> properties of the downstream devices.
> 
> I do think the bus-ranges of the Switch Downstream Ports look bogus
> because they all extend to bus ff, so they overlap.  The Switch
> wouldn't know how to route config transactions to the correct DSP.
> I suppose the PCI core would fix these overlaps at boot time, but 
> it seems wrong to describe them this way here.
> 

Yeah, max bus range is really a dynamic value. But I don't know how we could
define a legal value other than 'ff' statically.

Open firmware PCI bus binding defines 'bus-range' as:

"Two integers, each encoded as with encode-int, the first representing the bus
number of the PCI bus implemented by the bus controller represented by this node
(the secondary bus number in PCI-to-PCI bridge nomenclature), and the second
representing the largest bus number of any PCI bus in the portion of the PCI
domain that is subordinate to this node (the subordinate bus number in
PCI-to-PCI bridge nomenclature)."

https://www.openfirmware.info/data/docs/bus.pci.pdf

- Mani

-- 
மணிவண்ணன் சதாசிவம்

