Return-Path: <linux-arm-msm+bounces-52716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A1042A74413
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 07:44:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30F8B7A7C60
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 06:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB030211487;
	Fri, 28 Mar 2025 06:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KZnAacXG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36118211A01
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 06:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743144229; cv=none; b=BCNKiubofqdrfR8sV4EG8TxQamoslE8N8sJtc53CXc2uWQ+0YKXWQsGERVNMBmpbtPzPKSxh5npx1VmI8iXsZUSU1QzBrm7Oc0/loHJ3Wf6oQ8DPxKP+Li7UuZdiMgl20INzw+46anMO+V/welzRfOTqn9B7CVgfv9TCumEA9LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743144229; c=relaxed/simple;
	bh=9gHYkn22rLzWvMO0bj/sd6YJ6w0VDygYaZJoz/6Ho5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fv9+cITMeD4r64k7JdVeuqOZaZPdMivWSplPMofjPErmhNWYYR6xEZK2C3SqKACzYelejgbSXwxvW1EWX4EXcV8pMRpH+57glI3wK4+knFCfkeAU5uJ5r5nSHxaAO8HWhdgiR8FWhGk9hnexJWGo32A0dDI22A0eFkaI7v1QAag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KZnAacXG; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-303a66af07eso2522546a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 23:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743144227; x=1743749027; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4pqG4hQwbhscVZFAP8F4bfxFu0QSUaEoh/MTDWwHPFU=;
        b=KZnAacXGEyReGD+v1vOo5nGzwXfShkeVgzEjOMTLsULk/Pt3qq+bIWIn3V4RqQ26gA
         Vl/bTthliqovqZpT/Fg0ZPSWpFj9haEAbMYSHcWRcGyVyWi0dybWuLU+kgcKa9w/wupy
         fYHUaxz+dBgSCtAIJKpbbKqGsUDWVn1C6Zn82E/eM9XXI/gxRcNFtK37Z+aaw8u5UJmX
         jg8Bo22onJ7zSz+azIKPrAbUDW3647dTgG7pg6PW4s6ewAguxuitpwqV+gEjaImE0D7v
         6Q46tJzPEZRsjSGobsg1jBZI7o18+n0wzP4Y7nch7OETPHtCkBRD/FyWGTMeQZDSw1GM
         oHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743144227; x=1743749027;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4pqG4hQwbhscVZFAP8F4bfxFu0QSUaEoh/MTDWwHPFU=;
        b=dY7YKeUGG3Evmom76dv84ztsDUQuGnF4V5C611G2+Iyh4XOqGzHm8/kJiJnnmrRXAK
         6/uLJ3FMimxw6jqkKYpzcd8+fYRmjHRwXxdGTV6Uicg8wxCChXyOhbpmtNj0Jzf24kB3
         nTcR23i4ENVCo2hS6WTWlZnVUaOB89IGaIxPmejnaXXFwmsvZXV6SExUMPTPyjbIYljn
         tXp+jpinvqHZkusgj+mbZgE5Hw0si9YYywho4ZWhbn/R6pyq2JFXM5p8c02wDa8PXabW
         B168eGaudKpyjyNuZ+f7XbsJoAm702MApmJ+y9GxFys1Z3eiPtDimI036rKOmdrmMU+T
         BlJg==
X-Forwarded-Encrypted: i=1; AJvYcCUgIrsqzAkqPu2UFPhENt4c8GTicz4Npz3fO4vakXzZslbgDQnIECosgqZaOnaD5cnLs2Bhz6ZotyTvFFaJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwjXbWpeF6Y8ARJrpRrXSb1xbS5AT1smF2xHkaMTlwFhOh+bSUu
	n/Lb3axeF+aCtLfJ8LWilBXoR8aR+5PS3zJT7aW5Wd0FmZq7zXf+w7+SQPhSRQ==
X-Gm-Gg: ASbGncsFXikvuPsFmWBA1QLHvOguHL4ftB0nAGnxHIBUoPFWAXOKOKSsnR67B55jhlf
	vtvHvGN17+9nrKils8FUsezZveMRKnA713N7/GwR94JMB58xEiV5b2Ir31nW6Gh2xHXpf/6QepM
	t7iaanupySl8yiBDOMfMDID9ITirp5F782TjgWphHIFDihquUR8sD7ym8Q3TwGWBBgnGl4uRyDr
	Sshuq6TFdrj5WCY+O1SG772hEYmGy7MRMzOk0RA1LZjDVNExcklrMHROQFG8XrVzuXY70u5t0t0
	AW1i2wLObPhyiFc+LLmLYUQtRbDB+FOilEAawYU9zV/DjHbDrurn2wk=
X-Google-Smtp-Source: AGHT+IG/FVmwgfHC7BvrjYr6Thd5v8WbLAe0kILb9pAQWylgj/z/boQSWc3aPoouzs8lbrJVeb83NQ==
X-Received: by 2002:a17:90b:554f:b0:2fa:e9b:33b8 with SMTP id 98e67ed59e1d1-303a8064dcemr11430379a91.18.1743144227250;
        Thu, 27 Mar 2025 23:43:47 -0700 (PDT)
Received: from thinkpad ([120.60.68.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cdd52sm10401615ad.157.2025.03.27.23.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 23:43:46 -0700 (PDT)
Date: Fri, 28 Mar 2025 12:13:40 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, quic_mrana@quicinc.com, quic_vbadigan@quicinc.com
Subject: Re: [PATCH v8 2/4] PCI: of: Add of_pci_get_equalization_presets() API
Message-ID: <epg6mtsnemzwnqvsze7zbkehovxvu6fpmw52kzfrjmjahadg66@k4gprl4zg5b3>
References: <20250316-preset_v6-v8-0-0703a78cb355@oss.qualcomm.com>
 <20250316-preset_v6-v8-2-0703a78cb355@oss.qualcomm.com>
 <gl2klkvpkb2vrxrzdqbqjomfis66tldy6witvbqdd2ig3st3rw@jstguoejcofa>
 <7a0724ad-89a5-0ccd-eba5-ca4871ce1cdd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a0724ad-89a5-0ccd-eba5-ca4871ce1cdd@oss.qualcomm.com>

On Fri, Mar 28, 2025 at 10:54:25AM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 3/28/2025 10:09 AM, Manivannan Sadhasivam wrote:
> > On Sun, Mar 16, 2025 at 09:39:02AM +0530, Krishna Chaitanya Chundru wrote:
> > > PCIe equalization presets are predefined settings used to optimize
> > > signal integrity by compensating for signal loss and distortion in
> > > high-speed data transmission.
> > > 
> > > As per PCIe spec 6.0.1 revision section 8.3.3.3 & 4.2.4 for data rates
> > > of 8.0 GT/s, 16.0 GT/s, 32.0 GT/s, and 64.0 GT/s, there is a way to
> > > configure lane equalization presets for each lane to enhance the PCIe
> > > link reliability. Each preset value represents a different combination
> > > of pre-shoot and de-emphasis values. For each data rate, different
> > > registers are defined: for 8.0 GT/s, registers are defined in section
> > > 7.7.3.4; for 16.0 GT/s, in section 7.7.5.9, etc. The 8.0 GT/s rate has
> > > an extra receiver preset hint, requiring 16 bits per lane, while the
> > > remaining data rates use 8 bits per lane.
> > > 
> > > Based on the number of lanes and the supported data rate,
> > > of_pci_get_equalization_presets() reads the device tree property and
> > > stores in the presets structure.
> > > 
> > > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > > ---
> > >   drivers/pci/of.c  | 44 ++++++++++++++++++++++++++++++++++++++++++++
> > >   drivers/pci/pci.h | 32 +++++++++++++++++++++++++++++++-
> > >   2 files changed, 75 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> > > index 7a806f5c0d20..18691483e108 100644
> > > --- a/drivers/pci/of.c
> > > +++ b/drivers/pci/of.c
> > > @@ -851,3 +851,47 @@ u32 of_pci_get_slot_power_limit(struct device_node *node,
> > >   	return slot_power_limit_mw;
> > >   }
> > >   EXPORT_SYMBOL_GPL(of_pci_get_slot_power_limit);
> > > +
> > > +/**
> > > + * of_pci_get_equalization_presets - Parses the "eq-presets-Ngts" property.
> > > + *
> > > + * @dev: Device containing the properties.
> > > + * @presets: Pointer to store the parsed data.
> > > + * @num_lanes: Maximum number of lanes supported.
> > > + *
> > > + * If the property is present, read and store the data in the @presets structure.
> > > + * Else, assign a default value of PCI_EQ_RESV.
> > > + *
> > > + * Return: 0 if the property is not available or successfully parsed else
> > > + * errno otherwise.
> > > + */
> > > +int of_pci_get_equalization_presets(struct device *dev,
> > > +				    struct pci_eq_presets *presets,
> > > +				    int num_lanes)
> > > +{
> > > +	char name[20];
> > > +	int ret;
> > > +
> > > +	presets->eq_presets_8gts[0] = PCI_EQ_RESV;
> > > +	ret = of_property_read_u16_array(dev->of_node, "eq-presets-8gts",
> > > +					 presets->eq_presets_8gts, num_lanes);
> > > +	if (ret && ret != -EINVAL) {
> > > +		dev_err(dev, "Error reading eq-presets-8gts :%d\n", ret);
> > 
> > 'Error reading eq-presets-8gts: %d'
> > 
> > > +		return ret;
> > > +	}
> > > +
> > > +	for (int i = 0; i < EQ_PRESET_TYPE_MAX - 1; i++) {
> > > +		presets->eq_presets_Ngts[i][0] = PCI_EQ_RESV;
> > > +		snprintf(name, sizeof(name), "eq-presets-%dgts", 8 << (i + 1));
> > > +		ret = of_property_read_u8_array(dev->of_node, name,
> > > +						presets->eq_presets_Ngts[i],
> > > +						num_lanes);
> > > +		if (ret && ret != -EINVAL) {
> > > +			dev_err(dev, "Error reading %s :%d\n", name, ret);
> > 
> > 'Error reading %s: %d'
> > 
> > > +			return ret;
> > > +		}
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +EXPORT_SYMBOL_GPL(of_pci_get_equalization_presets);
> > > diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> > > index 01e51db8d285..78c9cc0ad8fa 100644
> > > --- a/drivers/pci/pci.h
> > > +++ b/drivers/pci/pci.h
> > > @@ -9,6 +9,8 @@ struct pcie_tlp_log;
> > >   /* Number of possible devfns: 0.0 to 1f.7 inclusive */
> > >   #define MAX_NR_DEVFNS 256
> > > +#define MAX_NR_LANES 16
> > 
> > Why did you limit to 16?
> > 
> As per PCIe spec we support maximum of 16 lanes only right
> 

No. PCIe spec defines Max Link Width up to 32 lanes. Though, we have only seen
16 lanes used widely. This field should correspond to 'Maximum Link Width' value
in the Link Capabilities Register.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

