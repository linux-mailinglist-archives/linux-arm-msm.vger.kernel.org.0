Return-Path: <linux-arm-msm+bounces-52814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60506A75582
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 10:39:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43A7C188F7B9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 09:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A561A3BD7;
	Sat, 29 Mar 2025 09:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JKPCq82n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E808158538
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Mar 2025 09:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743241195; cv=none; b=U4tg/us7rb1hKXdEfrwqFgIN8HjIHUa+wsiZUUdYmmMQ8QD7EL8csYiBHGTe5yORo0C+hGP3HFUzPEM5cqk4Qhb0kjramRuniSZnfjmK05nSMxakGSwUCfK4h3ikBjOeqi5XzpCUqx/sPk5YkRYs+RL34cvQD8YeK9YhiK7uq5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743241195; c=relaxed/simple;
	bh=h448OrPfM6UqZDCzp4murBMKPsAopVuytMHYVBEJNWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PCm2Kd7l4KAYpqUgtMKOvq+/S72m9vj5IukY8Ks1S6yLgRLrb5DFp226Xg2lSlwZd9bOeJc18Uu7P5olSJ8Uj5NY0tVC+etufkfww0StDhVO0L62UxGAtUlOntVYoD8OeSNSfP/sxKP7XSqjAG8U5Tgm460766P9pG2bL80tygQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JKPCq82n; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-224191d92e4so59061485ad.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Mar 2025 02:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743241193; x=1743845993; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f1B6fKZgCWYC21ZRAVBlXkt0qD2ak5SViuiSZ8N3+e4=;
        b=JKPCq82nH8bDC+cU8tnhJWItY3Ilb6xEVyaKIkICBEReBze7/s0Z04Fq90xv/ZWTu9
         uDfw19DOa1c4zb4maRAj37trhYQX5sp05MmdejOk1AjH8ny7eabJJVHj2hMJSmGXHhKa
         ze0jRZ2cQI1whbhJexo69q3G4Z4iewcdQZ1a3OrvZwEFL/3U1Rn6ukQl9zdQO+I8ck2L
         rGPRKXU63wvjNzYVXzrhWgVz16KZgrpDKpik5CfFPCs15UhmANaqePm8NjcQHkOQYlnO
         b+f3ZM398IsFY8qIiY//Oj/hCheALT6w78KIqfbP8ROf6aHYRsn//+qbt/c5t4eq/bXG
         1E6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743241193; x=1743845993;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f1B6fKZgCWYC21ZRAVBlXkt0qD2ak5SViuiSZ8N3+e4=;
        b=q3ZQW1bjibf0GjD+mKxUbuFFcGd4Ek8h14AiiSug2JNPFqbjva0ICoWhmtjMxP/7qB
         9S9LopJ+1sstrIDBDW++8ZrK0kL2taOrMfdGWiXYiO9ME2yU5qLo4I46DvFUksTBaioH
         VZMt5k0QxBC5GCC18v49OzLt0Y7rjIlyylXjDAZlzYYVnnj7ufsGyeN5xUbheNk1NP1W
         rpe9N54hqlLbNTFbT2Y0f4y/zo3ojxx12+1Jvg3LaFq8EGjV+E8d5HMhQB0J7wNmiCJ0
         +rRJV+hJjvNlyctx8NY6UjpkFLG6wiUlURFnvxB4xyXLQkxstM4PuPzUI1jqJrjf75i6
         gKMg==
X-Forwarded-Encrypted: i=1; AJvYcCWiw6t/VE+92arL9x2ZC3viOxPEc4DcY20ZhtU10dTkDQ4WIpoQqYV0THqezdZZ7gWk/9keeGkmYMW7xp9F@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6LPLFGB+4eKRIepmTsPrWOoRNl/Zf5SkKNnY1R50Wr8HFEjqz
	uSEAqovtG4hPT97zbr5/25iPUcXWOl8TvvovzhKQzk9FtiLtBIa2LUx61RNUiw==
X-Gm-Gg: ASbGncuA19znFr5wpQvI0UY12Am0tnKv/SGXxhInb4PJM51jXes9Xzf2dxbJztUqis1
	LOdm+LJ8xYee1CdNyo1zddd/+D5j4mvfJiyOwIfAS+KVDw5zg3oz7YxwVNlWDYTN/cX+g2ck2l0
	wicEAgpnxOXLXO2LhR1vOVzDrBA+LjUFDPPBzgPs+6aadGZ2m7/EYiQH/mJHSweoih5JBaWHWLE
	yWZCCFdKo3nSrMJZCHkMbxl9jjqENrP144rgEXwMeVCnbHu7yVYZ647BVdwD/rAM3zOMT7eI2lH
	teODkt9nJTHcelDAXJMrvJfra2CxXtMq7N1DvVBhLCRZ/4P3JHz8vXoi/nh2N77sRw==
X-Google-Smtp-Source: AGHT+IE1KaqJ+6Cbvp5IKf9CYxA89yFr/QCAcVpYriUorwTLgRU9GCydNQpKyuIpw63iCI+2E23ifQ==
X-Received: by 2002:a17:902:ea02:b0:21f:6546:9af0 with SMTP id d9443c01a7336-2292f9fcb73mr34169145ad.44.1743241193405;
        Sat, 29 Mar 2025 02:39:53 -0700 (PDT)
Received: from thinkpad ([120.60.65.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cf4f6sm31834655ad.152.2025.03.29.02.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 02:39:52 -0700 (PDT)
Date: Sat, 29 Mar 2025 15:09:46 +0530
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
Message-ID: <4rep2gvymazkk7pgve36cw7moppozaju7h6aqc3gflxrvkskig@62ykri6v4trs>
References: <20250316-preset_v6-v8-0-0703a78cb355@oss.qualcomm.com>
 <20250316-preset_v6-v8-4-0703a78cb355@oss.qualcomm.com>
 <3sbflmznjfqpcja52v6bso74vhouv7ncuikrba5zlb74tqqb5u@ovndmib3kgqf>
 <92c4854d-033e-c7b5-ca92-cf44a1a8c0cc@oss.qualcomm.com>
 <mslh75np4tytzzk3dvwj5a3ulqmwn73zkj5cq4qmld5adkkldj@ad3bt3drffbn>
 <5fece4ac-2899-4e7d-8205-3b1ebba4b56b@oss.qualcomm.com>
 <abgqh3suczj2fckmt4m2bkqazfgwsfj43762ddzrpznr4xvftg@n5dkemffktyv>
 <622788fa-a067-49ac-b5b1-e4ec339e026f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <622788fa-a067-49ac-b5b1-e4ec339e026f@oss.qualcomm.com>

On Sat, Mar 29, 2025 at 09:59:46AM +0100, Konrad Dybcio wrote:
> On 3/29/25 7:30 AM, Manivannan Sadhasivam wrote:
> > On Fri, Mar 28, 2025 at 10:53:19PM +0100, Konrad Dybcio wrote:
> >> On 3/28/25 7:45 AM, Manivannan Sadhasivam wrote:
> >>> On Fri, Mar 28, 2025 at 11:04:11AM +0530, Krishna Chaitanya Chundru wrote:
> >>>>
> >>>>
> >>>> On 3/28/2025 10:23 AM, Manivannan Sadhasivam wrote:
> >>>>> On Sun, Mar 16, 2025 at 09:39:04AM +0530, Krishna Chaitanya Chundru wrote:
> >>>>>> PCIe equalization presets are predefined settings used to optimize
> >>>>>> signal integrity by compensating for signal loss and distortion in
> >>>>>> high-speed data transmission.
> >>>>>>
> >>>>>> Based upon the number of lanes and the data rate supported, write
> >>>>>> the preset data read from the device tree in to the lane equalization
> >>>>>> control registers.
> >>>>>>
> >>>>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> >>>>>> ---
> >>>>>>   drivers/pci/controller/dwc/pcie-designware-host.c | 60 +++++++++++++++++++++++
> >>>>>>   drivers/pci/controller/dwc/pcie-designware.h      |  3 ++
> >>>>>>   include/uapi/linux/pci_regs.h                     |  3 ++
> >>>>>>   3 files changed, 66 insertions(+)
> >>>>>>
> >>>>>> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> >>>>>> index dd56cc02f4ef..7c6e6a74383b 100644
> >>>>>> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> >>>>>> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> >>>>>> @@ -507,6 +507,10 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
> >>>>>>   	if (pci->num_lanes < 1)
> >>>>>>   		pci->num_lanes = dw_pcie_link_get_max_link_width(pci);
> >>>>>> +	ret = of_pci_get_equalization_presets(dev, &pp->presets, pci->num_lanes);
> >>>>>> +	if (ret)
> >>>>>> +		goto err_free_msi;
> >>>>>> +
> >>>>>>   	/*
> >>>>>>   	 * Allocate the resource for MSG TLP before programming the iATU
> >>>>>>   	 * outbound window in dw_pcie_setup_rc(). Since the allocation depends
> >>>>>> @@ -808,6 +812,61 @@ static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
> >>>>>>   	return 0;
> >>>>>>   }
> >>>>>> +static void dw_pcie_program_presets(struct dw_pcie_rp *pp, enum pci_bus_speed speed)
> >>>>>> +{
> >>>>>> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >>>>>> +	u8 lane_eq_offset, lane_reg_size, cap_id;
> >>>>>> +	u8 *presets;
> >>>>>> +	u32 cap;
> >>>>>> +	int i;
> >>>>>> +
> >>>>>> +	if (speed == PCIE_SPEED_8_0GT) {
> >>>>>> +		presets = (u8 *)pp->presets.eq_presets_8gts;
> >>>>>> +		lane_eq_offset =  PCI_SECPCI_LE_CTRL;
> >>>>>> +		cap_id = PCI_EXT_CAP_ID_SECPCI;
> >>>>>> +		/* For data rate of 8 GT/S each lane equalization control is 16bits wide*/
> >>>>>> +		lane_reg_size = 0x2;
> >>>>>> +	} else if (speed == PCIE_SPEED_16_0GT) {
> >>>>>> +		presets = pp->presets.eq_presets_Ngts[EQ_PRESET_TYPE_16GTS - 1];
> >>>>>> +		lane_eq_offset = PCI_PL_16GT_LE_CTRL;
> >>>>>> +		cap_id = PCI_EXT_CAP_ID_PL_16GT;
> >>>>>> +		lane_reg_size = 0x1;
> >>>>>> +	} else {
> >>>>>
> >>>>> Can you add conditions for other data rates also? Like 32, 64 GT/s. If
> >>>>> controller supports them and if the presets property is defined in DT, then you
> >>>>> should apply the preset values.
> >>>>>
> >>>>> If the presets property is not present in DT, then below 'PCI_EQ_RESV' will
> >>>>> safely return.
> >>>>>
> >>>> I am fine to add it, but there is no GEN5 or GEN6 controller support
> >>>> added in dwc, isn't it best to add when that support is added and
> >>>> tested.
> >>>>
> >>>
> >>> What is the guarantee that this part of the code will be updated once the
> >>> capable controllers start showing up? I don't think there will be any issue in
> >>> writing to these registers.
> >>
> >> Let's not make assumptions about the spec of a cross-vendor mass-deployed IP
> >>
> > 
> > I have seen the worse... The problem is, if those controllers start to show up
> > and define preset properties in DT, there will be no errors whatsoever to
> > indicate that the preset values were not applied, resulting in hard to debug
> > errors.
> 
> else {
> 	dev_warn(pci->dev, "Missing equalization presets programming sequence\n");
> }
> 

Then we'd warn for controllers supporting GEN5 or more if they do not pass the
presets property (which is optional).

> > 
> > I'm not forseeing any issue in this part of the code to support higher GEN
> > speeds though.
> 
> I would hope so as well, but both not programming and misprogramming are
> equally hard to detect
> 

I don't disagree. I wanted to have it since there is no sensible way of warning
users that this part of the code needs to be updated in the future.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

