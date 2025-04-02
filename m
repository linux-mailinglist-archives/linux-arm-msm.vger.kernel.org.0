Return-Path: <linux-arm-msm+bounces-52992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DE0A787C8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 08:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D3A93AEDF7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 06:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D7F221DB2;
	Wed,  2 Apr 2025 06:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sBLc54bM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B8C136A
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Apr 2025 06:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743573748; cv=none; b=b32EHk/bNiHqsEHLPyAl8obWWQbMURSZP/FOKBAUWtWDfwWRZtqc7GIywKCVX/eB9mMp+tQS6Fa3Q2GHY3CX7ykO6aJKZV2iKocHLWcWanKgNNWbAHIKuP+3CQHuXxgdWdXFdrWRsPqjW5nG+KciYefKg6sjKUxZea4MErb5ihE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743573748; c=relaxed/simple;
	bh=wFoBMSzK4NpZw+UmRIp53Lw67dBhRYws9fCWeqmmtIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dme6xzaRhJQqoLJ7tFfrrWTX3S8hvrcZatUk49QNFrAR/E9v94wi8DnP1YUeSnfuqZVBC2SQNoMjVN8GFo2M5dWwrC29nVH0ALd+xM9h8H9IAqePJs5bIK1EvMDCuXAr5K8NEywTPNFimuxlRN8ChnMkdxpQq/J1VSlT1jrNvW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sBLc54bM; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2241053582dso108841385ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 23:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743573745; x=1744178545; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XSPVI8TUn/isK4noC55TC4qkMMEfDFkjVI/2eFz1WUo=;
        b=sBLc54bMO1oGmgtvH7gIGW0iJyMIrVBQsEWT53r90OBmFKbCj6ld5CIi04+5nJX9pg
         eQsSYMkvw2Wz99gjJPZNZUrdbQaSgr6fmZr1JqNTWuIgWd+Y8UEM4Yu99XRU/vTcOY1o
         wwHAqDWVJ06jq+lx0SRyaXNkxVD4LbukuKmNSzuZGmhLyNyj/bCm/09TZsO/keitgplf
         UoMkrmjvaTPRlX42EG8rziPoAsgJfTvczMkvA3GksHc1IhhSa81vN/8sRk3ms23wxZRt
         /+R077ehCzp9Q7aW8yE/o2OfYgm6LkbnY9d6e6YLvKJtrwxqKAmZfdMfMldm/BUdGI9n
         X8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743573745; x=1744178545;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XSPVI8TUn/isK4noC55TC4qkMMEfDFkjVI/2eFz1WUo=;
        b=UeVNuUJUtrdA7MXhBWirfUwO1b/LPIQ/ACnCntIx1cKBNeBqPmCoTKIiWYGwNXEgbS
         UJXuFLHGezsUE7eT/XIspfNvCIEIsEvdur8k8hK+MI0anOx9hy25P1mdtys2PDVe4L1e
         t8pcRImouqQ29WalAXOT682UFRHZZy+pP5nIy3d4HIIMPGXeoHgNF91U107KQkH65LOf
         Uieo6zM64+CYMtwhk4G9eN9RLxX7SkJoanxtEC09HBsdDXnWlFkAdGLSQ2uFQ7YmR1Kw
         sSFUy7EjDIYn7SgMEJTKUXOIC4U9+RsKygodNOPI63l86jsy+mw7M4NwDzmhOYmJ6RjT
         ZCQg==
X-Forwarded-Encrypted: i=1; AJvYcCVyy40N5ffqw7dFLjp5oHT/MNlClgI8kqIvMErjxs6SOmXFER1wpKv3mYUTnE9mJAp9nrgGtAuTBHRfzHVy@vger.kernel.org
X-Gm-Message-State: AOJu0YwfLlhGx7djoOK2L2EPNzXmyeChemmC/Vy7OqGi4zfY+ua2Hf0I
	U4ko4yv+QK9yTiYxi+ljI3h8mlx32oZLgSkvzOJT6W8ZLggbT/8aTr6l5KzwuA==
X-Gm-Gg: ASbGncugkMCX5gpFxfUdhY7RiMlOoo6biKBlF19NMprh2kc99NqO4D/uqHl+t1/gB4F
	mwS4zZdP6nRLz+lTdPC1lZWPEOK6m2wcf89jjzsJOAiScPfhFSt+VY0hkgIyW4KEpFVaR2ONbGz
	oWRKx9h4sXQWk8fW6efZNOH4EOZ5fWi34NNpWf7MykAVSDKKdcjHZmNRu86FLXQ5dbRqPygHYZL
	O2vn71Gff4Zq7IIO53DC2RdXo89R3mNUhyYIexc5yvmZRm82Qj2vcUOcak6qIMp5wJDXolYWPtQ
	d7YinKyYOmjxHxpqezAKMhW9lLUxBPtvJmOyiQrvmJcrg64QOl0j0w0h
X-Google-Smtp-Source: AGHT+IH0V718KRlf/K5+UQm5rQKFssSsYgy9kQmxhhjMozcy/p40GYl5cS1u4E7j5U8om1rF1JIOqw==
X-Received: by 2002:a05:6a00:148a:b0:736:5c8e:baaa with SMTP id d2e1a72fcca58-7398033ad19mr19011284b3a.2.1743573745001;
        Tue, 01 Apr 2025 23:02:25 -0700 (PDT)
Received: from thinkpad ([120.56.205.103])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7397106c7b7sm10030584b3a.116.2025.04.01.23.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 23:02:24 -0700 (PDT)
Date: Wed, 2 Apr 2025 11:32:16 +0530
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
Message-ID: <utswwqjgfy3iybt54ilyqnfss77vzit7kegctjp3tef636hc3p@724xe3dzlpip>
References: <20250316-preset_v6-v8-0-0703a78cb355@oss.qualcomm.com>
 <20250316-preset_v6-v8-4-0703a78cb355@oss.qualcomm.com>
 <3sbflmznjfqpcja52v6bso74vhouv7ncuikrba5zlb74tqqb5u@ovndmib3kgqf>
 <92c4854d-033e-c7b5-ca92-cf44a1a8c0cc@oss.qualcomm.com>
 <mslh75np4tytzzk3dvwj5a3ulqmwn73zkj5cq4qmld5adkkldj@ad3bt3drffbn>
 <5fece4ac-2899-4e7d-8205-3b1ebba4b56b@oss.qualcomm.com>
 <abgqh3suczj2fckmt4m2bkqazfgwsfj43762ddzrpznr4xvftg@n5dkemffktyv>
 <622788fa-a067-49ac-b5b1-e4ec339e026f@oss.qualcomm.com>
 <4rep2gvymazkk7pgve36cw7moppozaju7h6aqc3gflxrvkskig@62ykri6v4trs>
 <ed8a59ce-0527-4514-91f8-c27972d799d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ed8a59ce-0527-4514-91f8-c27972d799d4@oss.qualcomm.com>

On Sat, Mar 29, 2025 at 12:42:02PM +0100, Konrad Dybcio wrote:
> On 3/29/25 10:39 AM, Manivannan Sadhasivam wrote:
> > On Sat, Mar 29, 2025 at 09:59:46AM +0100, Konrad Dybcio wrote:
> >> On 3/29/25 7:30 AM, Manivannan Sadhasivam wrote:
> >>> On Fri, Mar 28, 2025 at 10:53:19PM +0100, Konrad Dybcio wrote:
> >>>> On 3/28/25 7:45 AM, Manivannan Sadhasivam wrote:
> >>>>> On Fri, Mar 28, 2025 at 11:04:11AM +0530, Krishna Chaitanya Chundru wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 3/28/2025 10:23 AM, Manivannan Sadhasivam wrote:
> >>>>>>> On Sun, Mar 16, 2025 at 09:39:04AM +0530, Krishna Chaitanya Chundru wrote:
> >>>>>>>> PCIe equalization presets are predefined settings used to optimize
> >>>>>>>> signal integrity by compensating for signal loss and distortion in
> >>>>>>>> high-speed data transmission.
> >>>>>>>>
> >>>>>>>> Based upon the number of lanes and the data rate supported, write
> >>>>>>>> the preset data read from the device tree in to the lane equalization
> >>>>>>>> control registers.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> >>>>>>>> ---
> >>>>>>>>   drivers/pci/controller/dwc/pcie-designware-host.c | 60 +++++++++++++++++++++++
> >>>>>>>>   drivers/pci/controller/dwc/pcie-designware.h      |  3 ++
> >>>>>>>>   include/uapi/linux/pci_regs.h                     |  3 ++
> >>>>>>>>   3 files changed, 66 insertions(+)
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> >>>>>>>> index dd56cc02f4ef..7c6e6a74383b 100644
> >>>>>>>> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> >>>>>>>> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> >>>>>>>> @@ -507,6 +507,10 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
> >>>>>>>>   	if (pci->num_lanes < 1)
> >>>>>>>>   		pci->num_lanes = dw_pcie_link_get_max_link_width(pci);
> >>>>>>>> +	ret = of_pci_get_equalization_presets(dev, &pp->presets, pci->num_lanes);
> >>>>>>>> +	if (ret)
> >>>>>>>> +		goto err_free_msi;
> >>>>>>>> +
> >>>>>>>>   	/*
> >>>>>>>>   	 * Allocate the resource for MSG TLP before programming the iATU
> >>>>>>>>   	 * outbound window in dw_pcie_setup_rc(). Since the allocation depends
> >>>>>>>> @@ -808,6 +812,61 @@ static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
> >>>>>>>>   	return 0;
> >>>>>>>>   }
> >>>>>>>> +static void dw_pcie_program_presets(struct dw_pcie_rp *pp, enum pci_bus_speed speed)
> >>>>>>>> +{
> >>>>>>>> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >>>>>>>> +	u8 lane_eq_offset, lane_reg_size, cap_id;
> >>>>>>>> +	u8 *presets;
> >>>>>>>> +	u32 cap;
> >>>>>>>> +	int i;
> >>>>>>>> +
> >>>>>>>> +	if (speed == PCIE_SPEED_8_0GT) {
> >>>>>>>> +		presets = (u8 *)pp->presets.eq_presets_8gts;
> >>>>>>>> +		lane_eq_offset =  PCI_SECPCI_LE_CTRL;
> >>>>>>>> +		cap_id = PCI_EXT_CAP_ID_SECPCI;
> >>>>>>>> +		/* For data rate of 8 GT/S each lane equalization control is 16bits wide*/
> >>>>>>>> +		lane_reg_size = 0x2;
> >>>>>>>> +	} else if (speed == PCIE_SPEED_16_0GT) {
> >>>>>>>> +		presets = pp->presets.eq_presets_Ngts[EQ_PRESET_TYPE_16GTS - 1];
> >>>>>>>> +		lane_eq_offset = PCI_PL_16GT_LE_CTRL;
> >>>>>>>> +		cap_id = PCI_EXT_CAP_ID_PL_16GT;
> >>>>>>>> +		lane_reg_size = 0x1;
> >>>>>>>> +	} else {
> >>>>>>>
> >>>>>>> Can you add conditions for other data rates also? Like 32, 64 GT/s. If
> >>>>>>> controller supports them and if the presets property is defined in DT, then you
> >>>>>>> should apply the preset values.
> >>>>>>>
> >>>>>>> If the presets property is not present in DT, then below 'PCI_EQ_RESV' will
> >>>>>>> safely return.
> >>>>>>>
> >>>>>> I am fine to add it, but there is no GEN5 or GEN6 controller support
> >>>>>> added in dwc, isn't it best to add when that support is added and
> >>>>>> tested.
> >>>>>>
> >>>>>
> >>>>> What is the guarantee that this part of the code will be updated once the
> >>>>> capable controllers start showing up? I don't think there will be any issue in
> >>>>> writing to these registers.
> >>>>
> >>>> Let's not make assumptions about the spec of a cross-vendor mass-deployed IP
> >>>>
> >>>
> >>> I have seen the worse... The problem is, if those controllers start to show up
> >>> and define preset properties in DT, there will be no errors whatsoever to
> >>> indicate that the preset values were not applied, resulting in hard to debug
> >>> errors.
> >>
> >> else {
> >> 	dev_warn(pci->dev, "Missing equalization presets programming sequence\n");
> >> }
> >>
> > 
> > Then we'd warn for controllers supporting GEN5 or more if they do not pass the
> > presets property (which is optional).
> 
> Ohh, I didn't think about that - and I can only think about solutions that are
> rather janky.. with perhaps the least janky one being changing the else case I
> proposed above into:
> 
> else if (speed >= PCIE_SPEED_32_0GT && eq_presets_Ngts[speed - PCIE_SPEED_16_0GT][0] != PCI_EQ_RESV) {

s/PCIE_SPEED_16_0GT/PCIE_SPEED_32_0GT

> 	...

So this I read as: Oh, your controller supports 32 GT/s and you firmware also
wanted to apply the custom preset offsets, but sorry we didn't do it because we
don't know if it would work or not. So please let us know so that we can work
with you test it and then finally we can apply the presets.

> }> 
> >>>
> >>> I'm not forseeing any issue in this part of the code to support higher GEN
> >>> speeds though.
> >>
> >> I would hope so as well, but both not programming and misprogramming are
> >> equally hard to detect
> >>
> > 
> > I don't disagree. I wanted to have it since there is no sensible way of warning
> > users that this part of the code needs to be updated in the future.
> 
> I understand, however I'm worried that the programming sequence or register
> may change for higher speeds in a way that would be incompatible with what
> we assume here
> 

Honestly, I don't know why you are having this opinion. This piece of code is
not in Qcom driver and the registers are the same for 8 GT/s, 16 GT/s as per the
PCIe spec. So the hardware programming sequence and other arguments doesn't
apply here (atleast to me).

- Mani

-- 
மணிவண்ணன் சதாசிவம்

