Return-Path: <linux-arm-msm+bounces-13602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CD4874E33
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 12:52:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E774B2627C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 11:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D5B1292CA;
	Thu,  7 Mar 2024 11:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W6Yp9Wsa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644E584FD7
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Mar 2024 11:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709812053; cv=none; b=nRd/EbJ19LdtcdzL8FOatR8j7Y2Mx/vcMplflHnUsl+nFMrACf+YASBJthh5Is33dMJ+S9CTbRR7hQAK20ijJ9yTP8tPXyKxmYu/ZqwHET0tfezX4X6L2eZ5WhFQ4PG7eoHE7b8Q3JLdygbQ0VkSIHN2gNmi49eBDo1KQmOYJl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709812053; c=relaxed/simple;
	bh=YvjRBsx4NNUuFJLAuYRgRN71netU30jNtmha+Q+ZmKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z5ZEfUl9ifKFtucv2mae2G9PegOtiHPLwIEKKnaYl2tCXTS4t6bZmNISJjeeQee5xchYVazWV+QMq90PuqiYmIqaStrpfnon1orAbIv6sF875jnN96xeeVVdG/wBWomi0XN2+Fcdf8cExocSWQkJIrlCDzxzVlGvtThSldoXecE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W6Yp9Wsa; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-42a029c8e62so5634691cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Mar 2024 03:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709812049; x=1710416849; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1Tq4PX5OVD/1UTnQNhTdu/i2sdk567MAMJr4rNiSaJg=;
        b=W6Yp9WsamSkUsISNl92eb1eOWkXtPvXUZo9yEozFl7d73o5IUkH/YVDNOw+28OauF3
         ta25mngvQ4SaP4En+7PsxowY4wGPpEpY2jYD/0fpUezRCG5Wef/5CIsN3tNjQoTVJext
         3Kjg/mUhpQl05EyFVhmz7uk+3vhr+hDbITi4S7CU/rFpSaJLNuahc+oadTF4VY7qCVL5
         IPpyvAHgY4XbX/tSsw7gtN+66BufnVboJn4zixvoT8ISAZyTnXq4KGqFDunrdXLZ95pb
         55P+QsrKmCQuw47G/g5baweubhPiYgjflT/pjgdvFqQW2/X//2Xm57XlI+z6uW/2ptTR
         Wdaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709812049; x=1710416849;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Tq4PX5OVD/1UTnQNhTdu/i2sdk567MAMJr4rNiSaJg=;
        b=AEN6eNkKZ6rhLZrycOnksb47a8Ivj3TPb0DBEPLPm/0qK+ELo3t24y94R+jc1466Y+
         y5hDCHeMoBn0edSMKimuxc18s4LzAPGW/qQQpgYg9NXBVd9NTfLu1zHHZ94erIiNULNt
         i9AmM1qSIK11qJmls0C42qhdEDLUcOuT3Np0Zf0gjxAY8uMHt75Di/jvEuiq5w+cS54g
         YHJLwGyy1ABNpQQh6ttt4l4byhdtdJ90BhcHdn4r0ssmaFWP1QTOcDI36kLugNFZu/PY
         GTLRZfA6j+RFQ6lwR7ByNtzyK6zViCxmVKxgymgk9N1/qkqiaQRW1uSYVW0m99982SlE
         zYDg==
X-Forwarded-Encrypted: i=1; AJvYcCU0EimGqmr0UMe+Src70Zc6bgUCAj3oESQlvlvbARPPyz/xMg+TWM0zia7jMkmjcIYeKc5lrs5qo30aV63XuZdJWUf7PGprvFfYwdGERA==
X-Gm-Message-State: AOJu0YzCmNWZhFgZ3G3zKdsT2QQSu6in4P35a+dlya+EFBRQv+wOc7Mr
	RM4gw634F6fhWL1OeSmyY53dSlOP2rLu9BDJ3Ba23rHsSh025jIRK8omrR9XBg==
X-Google-Smtp-Source: AGHT+IFUNofwrKTBAIXXPmsun8JrYn0jaY+Ooem6VqmseUjsKRP2oyvAAP6mw8k+L8p89SOqoZhZTg==
X-Received: by 2002:a05:622a:1a09:b0:42e:b163:ecf1 with SMTP id f9-20020a05622a1a0900b0042eb163ecf1mr9091826qtb.2.1709812047717;
        Thu, 07 Mar 2024 03:47:27 -0800 (PST)
Received: from thinkpad ([117.217.178.39])
        by smtp.gmail.com with ESMTPSA id k6-20020ac80746000000b0042ee243ca95sm4943818qth.50.2024.03.07.03.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 03:47:27 -0800 (PST)
Date: Thu, 7 Mar 2024 17:17:19 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] PCI: qcom: Enable BDF to SID translation properly
Message-ID: <20240307114719.GA13049@thinkpad>
References: <20240307-pci-bdf-sid-fix-v1-1-9423a7e2d63c@linaro.org>
 <afc709b5-4e4e-4308-a399-e0b521592250@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afc709b5-4e4e-4308-a399-e0b521592250@linaro.org>

On Thu, Mar 07, 2024 at 12:19:56PM +0100, Konrad Dybcio wrote:
> 
> 
> On 3/7/24 12:05, Manivannan Sadhasivam wrote:
> > Qcom SoCs making use of ARM SMMU require BDF to SID translation table in
> > the driver to properly map the SID for the PCIe devices based on their BDF
> > identifier. This is currently achieved with the help of
> > qcom_pcie_config_sid_1_9_0() function for SoCs supporting the 1_9_0 config.
> > 
> > But With newer Qcom SoCs starting from SM8450, BDF to SID translation is
> > set to bypass mode by default in hardware. Due to this, the translation
> > table that is set in the qcom_pcie_config_sid_1_9_0() is essentially
> > unused and the default SID is used for all endpoints in SoCs starting from
> > SM8450.
> > 
> > This is a security concern and also warrants swapping the DeviceID in DT
> > while using the GIC ITS to handle MSIs from endpoints. The swapping is
> > currently done like below in DT when using GIC ITS:
> > 
> > 			/*
> > 			 * MSIs for BDF (1:0.0) only works with Device ID 0x5980.
> > 			 * Hence, the IDs are swapped.
> > 			 */
> > 			msi-map = <0x0 &gic_its 0x5981 0x1>,
> > 				  <0x100 &gic_its 0x5980 0x1>;
> > 
> > Here, swapping of the DeviceIDs ensure that the endpoint with BDF (1:0.0)
> > gets the DeviceID 0x5980 which is associated with the default SID as per
> > the iommu mapping in DT. So MSIs were delivered with IDs swapped so far.
> > But this also means the Root Port (0:0.0) won't receive any MSIs (for PME,
> > AER etc...)
> > 
> > So let's fix these issues by clearing the BDF to SID bypass mode for all
> > SoCs making use of the 1_9_0 config. This allows the PCIe devices to use
> > the correct SID, thus avoiding the DeviceID swapping hack in DT and also
> > achieving the isolation between devices.
> > 
> > Cc:  <stable@vger.kernel.org> # 5.11
> > Fixes: 4c9398822106 ("PCI: qcom: Add support for configuring BDF to SID mapping for SM8250")
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> 
> Looks sensible..
> 
> Does switching away from bypass show any performance degradation?
> 

Not at all with my throughput test on SM8450 dev board. But there shouldn't be
any performance related issue since we are just forcing the hw to use a
different SID (correct one) than the default one.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

