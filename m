Return-Path: <linux-arm-msm+bounces-52809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AF78AA75482
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 07:30:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A96B7A66B7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 06:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33C3014F9E2;
	Sat, 29 Mar 2025 06:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="buaHV/8y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D201BC58
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Mar 2025 06:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743229814; cv=none; b=YeJViRVtU5mlnCNJFJ1Ld8VJgcLjweIWAgD+YK2AeSfJniQfoShduUZ5ast4fwpP0NcMV1H8bbFdlvzj8EaPwkXOHmGHf52fCdeQvv9rdRF5G+jZ+16MdsB0jy/RKDNEZZZe7ylR0SpJC1H/7VYw3AVi2IK5z5H44ZMxsxmd8S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743229814; c=relaxed/simple;
	bh=KjMUV/ZuoBfUpDVseEcSGZkXoQ0n1jHCmyszINRhhYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=thRicW+FUd7jbLv/uvI2a1URXTCTYm2117EZnxn3Lz7ciR+M+WWaM6kqqlaS1xqiYAeaJaNH7YiOgZS572T/mzM6f6qtwy6d44GxfcPQXCunNwbH3UlgTO416ex3PwAP+lO1i1/gWoF+TA+BdbCHJKVbIb44G86NdQsLYWs/Zj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=buaHV/8y; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2254e0b4b79so77952645ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 23:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743229812; x=1743834612; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=29agrZP6Lfh+HeKReJnJgMRF/oBpnBKDnVn7f/m90NU=;
        b=buaHV/8yMFRF+TlsEx6X2YKhHPqcK3P6yRpXIFphjr45MMbi+/UB1eqmPhJsmJ19wI
         yVRDZlLFUQTC9L2zsjU3af3vXCbRiMoSVGlTnUd31BFS8QkyzUB/VtVVdiOz9SmkNjQM
         v0Axc3ANeov8B0TzzEGnYwQGluuI6/hxzrcqDZmBhR3EkEtNj3H7d7xnvc6yN0PTx7gd
         A0o64arpsNFlc5YmnQN02QQrOrMjSM8yS7aEJZn2G+Q5tnNy0Gpr/KrSJ8bWy269uWDT
         ZmBERbdPg8pRXH7KNgBgh4L31h2RBl8RQ6nqXHo50MTfWfrm67iaDp+BWbk8q2s/eRbM
         Pp6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743229812; x=1743834612;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=29agrZP6Lfh+HeKReJnJgMRF/oBpnBKDnVn7f/m90NU=;
        b=lod7AyJyFhtxg5lQdFNOJhlKOZNX2+x2HzjNLzW8qdPH31LnqF1xtYE5ISqH44XDuJ
         atwckJZqmz4y3LpB1uzr98Qm8QoWkMvLfJrdl+Wkks1bqsaArHlHukMgruXqMZIYa7yk
         hIkh2weqOuF/BgYwEQFoiBERemaXnMjWr9ahzIq2T3ZSPlDU4sGyxV/2PR+P6g6Ttlou
         ua37QW7DnTB4eEL92dfXoks4JmjPgAaZJ4Ms/z0i9yc9ZU2CGyGqqTyksWVlaSR95qAu
         6mcMWOh6ySLUCU5nika01SozvlbKJHijM2xIUCIPtgdns5EZwBU9CTYRqCVhUncVkwPd
         Qt8g==
X-Forwarded-Encrypted: i=1; AJvYcCUqAuNIT9+yALYAHKr4Y8nLFQOiaa0zhoNDZH3VqAlR/66aJd7WqtaTKRZ2uOObho3pAGgpMbu4Uag2bIY4@vger.kernel.org
X-Gm-Message-State: AOJu0YyMGZBxh0CzBJD1aXVgCejNeRrHeD+DZ6FdP2euLrhi5U2tWY11
	KglIJB65dctbFWHq1je1In15j+lNboHTi6eW2RMPDwo8Ef6ft8pRwLFqYHce3Q==
X-Gm-Gg: ASbGncvlE1B93td4Iyj/X/A9PKELDwGZ0nQYw9grpw6yCpPb5FFuJ8mRpiZsiLVPuti
	Mnmi/xnR5WNcgrsUJ7UleuWZimk6hmyQQl4gfjsFLk0Vseu3H4kK8Nu7KYpf3SD6QLO6NThDuk4
	0JVrBHlyLpiF2t3L33BBeMBoWhd08Z23GqqUXw1mol0cTD8HUT08cBdXG4i5/A84bRu3+iBPW1+
	ibClic78S8/c3+oIkGESINKyOfcDvVPC2mn+vKnYZ88tb7jum/A18pMMu4BC4C+9Ql/RZVUsD65
	CZBFZ28MmSIz1dq8Bl0hZW3+1DLqbhxYsBeZw0GcmuSxfM6heZ9aqUw=
X-Google-Smtp-Source: AGHT+IGKsn0gCVkAh6587pUzg9QcLOKhKmhzuEowgu5diEKiwz5qdVlA62iuXoEFG9MckC9kYGhfmA==
X-Received: by 2002:a05:6a20:cfa1:b0:1f5:8153:9407 with SMTP id adf61e73a8af0-2009f6381c4mr2822454637.20.1743229811595;
        Fri, 28 Mar 2025 23:30:11 -0700 (PDT)
Received: from thinkpad ([120.60.65.227])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93b67d9dbsm2676026a12.5.2025.03.28.23.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 23:30:11 -0700 (PDT)
Date: Sat, 29 Mar 2025 12:00:04 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Jingoo Han <jingoohan1@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, quic_mrana@quicinc.com, 
	quic_vbadigan@quicinc.com
Subject: Re: [PATCH v8 4/4] PCI: dwc: Add support for configuring lane
 equalization presets
Message-ID: <abgqh3suczj2fckmt4m2bkqazfgwsfj43762ddzrpznr4xvftg@n5dkemffktyv>
References: <20250316-preset_v6-v8-0-0703a78cb355@oss.qualcomm.com>
 <20250316-preset_v6-v8-4-0703a78cb355@oss.qualcomm.com>
 <3sbflmznjfqpcja52v6bso74vhouv7ncuikrba5zlb74tqqb5u@ovndmib3kgqf>
 <92c4854d-033e-c7b5-ca92-cf44a1a8c0cc@oss.qualcomm.com>
 <mslh75np4tytzzk3dvwj5a3ulqmwn73zkj5cq4qmld5adkkldj@ad3bt3drffbn>
 <5fece4ac-2899-4e7d-8205-3b1ebba4b56b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5fece4ac-2899-4e7d-8205-3b1ebba4b56b@oss.qualcomm.com>

On Fri, Mar 28, 2025 at 10:53:19PM +0100, Konrad Dybcio wrote:
> On 3/28/25 7:45 AM, Manivannan Sadhasivam wrote:
> > On Fri, Mar 28, 2025 at 11:04:11AM +0530, Krishna Chaitanya Chundru wrote:
> >>
> >>
> >> On 3/28/2025 10:23 AM, Manivannan Sadhasivam wrote:
> >>> On Sun, Mar 16, 2025 at 09:39:04AM +0530, Krishna Chaitanya Chundru wrote:
> >>>> PCIe equalization presets are predefined settings used to optimize
> >>>> signal integrity by compensating for signal loss and distortion in
> >>>> high-speed data transmission.
> >>>>
> >>>> Based upon the number of lanes and the data rate supported, write
> >>>> the preset data read from the device tree in to the lane equalization
> >>>> control registers.
> >>>>
> >>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> >>>> ---
> >>>>   drivers/pci/controller/dwc/pcie-designware-host.c | 60 +++++++++++++++++++++++
> >>>>   drivers/pci/controller/dwc/pcie-designware.h      |  3 ++
> >>>>   include/uapi/linux/pci_regs.h                     |  3 ++
> >>>>   3 files changed, 66 insertions(+)
> >>>>
> >>>> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> >>>> index dd56cc02f4ef..7c6e6a74383b 100644
> >>>> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> >>>> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> >>>> @@ -507,6 +507,10 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
> >>>>   	if (pci->num_lanes < 1)
> >>>>   		pci->num_lanes = dw_pcie_link_get_max_link_width(pci);
> >>>> +	ret = of_pci_get_equalization_presets(dev, &pp->presets, pci->num_lanes);
> >>>> +	if (ret)
> >>>> +		goto err_free_msi;
> >>>> +
> >>>>   	/*
> >>>>   	 * Allocate the resource for MSG TLP before programming the iATU
> >>>>   	 * outbound window in dw_pcie_setup_rc(). Since the allocation depends
> >>>> @@ -808,6 +812,61 @@ static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
> >>>>   	return 0;
> >>>>   }
> >>>> +static void dw_pcie_program_presets(struct dw_pcie_rp *pp, enum pci_bus_speed speed)
> >>>> +{
> >>>> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >>>> +	u8 lane_eq_offset, lane_reg_size, cap_id;
> >>>> +	u8 *presets;
> >>>> +	u32 cap;
> >>>> +	int i;
> >>>> +
> >>>> +	if (speed == PCIE_SPEED_8_0GT) {
> >>>> +		presets = (u8 *)pp->presets.eq_presets_8gts;
> >>>> +		lane_eq_offset =  PCI_SECPCI_LE_CTRL;
> >>>> +		cap_id = PCI_EXT_CAP_ID_SECPCI;
> >>>> +		/* For data rate of 8 GT/S each lane equalization control is 16bits wide*/
> >>>> +		lane_reg_size = 0x2;
> >>>> +	} else if (speed == PCIE_SPEED_16_0GT) {
> >>>> +		presets = pp->presets.eq_presets_Ngts[EQ_PRESET_TYPE_16GTS - 1];
> >>>> +		lane_eq_offset = PCI_PL_16GT_LE_CTRL;
> >>>> +		cap_id = PCI_EXT_CAP_ID_PL_16GT;
> >>>> +		lane_reg_size = 0x1;
> >>>> +	} else {
> >>>
> >>> Can you add conditions for other data rates also? Like 32, 64 GT/s. If
> >>> controller supports them and if the presets property is defined in DT, then you
> >>> should apply the preset values.
> >>>
> >>> If the presets property is not present in DT, then below 'PCI_EQ_RESV' will
> >>> safely return.
> >>>
> >> I am fine to add it, but there is no GEN5 or GEN6 controller support
> >> added in dwc, isn't it best to add when that support is added and
> >> tested.
> >>
> > 
> > What is the guarantee that this part of the code will be updated once the
> > capable controllers start showing up? I don't think there will be any issue in
> > writing to these registers.
> 
> Let's not make assumptions about the spec of a cross-vendor mass-deployed IP
> 

I have seen the worse... The problem is, if those controllers start to show up
and define preset properties in DT, there will be no errors whatsoever to
indicate that the preset values were not applied, resulting in hard to debug
errors.

I'm not forseeing any issue in this part of the code to support higher GEN
speeds though.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

