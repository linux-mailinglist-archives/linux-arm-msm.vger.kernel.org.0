Return-Path: <linux-arm-msm+bounces-53338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4968AA7D683
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 09:46:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6A977A5E08
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 07:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24616226CF9;
	Mon,  7 Apr 2025 07:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sTc4AU+h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685C6225A59
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Apr 2025 07:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744011904; cv=none; b=DLghMbjE4UbxGRizu8YN9hnsvy5IKqrYr7a/eM3HUs4noAiXLWF1FnfmkFzjvSDCugwSSbpiykNspuZ13+rxZPgM/YqoLi/MggXJltE214az9hcaecnHeYfK+PSQfuIcrXw2c3Dqw8kpVwpWfydQ7fxZa+ubtQL2piceosxw5fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744011904; c=relaxed/simple;
	bh=tYR5OsW0DxS03ZNpNqNCjjugrDqa6bpqk8h3hPCTJIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A9ey9wRO6lYoCPGZbEdU3jMljrQQu17KpRN6ifXWHnVV7XZfJt+G1WAisalcU5LjtQYY5Omane8gwHmHEI0kCNEWY+bSm8Zdi67/X6jHg5SLQXJWx1my0seOh80M9YPPJWcraGtln2srijPDELyFtEkPV/n/L5NxJdwePqS4VBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sTc4AU+h; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736b350a22cso3335514b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Apr 2025 00:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744011902; x=1744616702; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o3NHeKTvtrNLVJ7Xwv0eZCsKPdpzCtXi2/NrHXy46hY=;
        b=sTc4AU+hZgcD+aAfUKUeLA7YouGKnKNn0xAik35BhSnhQEm2lNWH8hi4dfdsk/Kmj3
         NBMLjgP8+aNVHD2G5sirHPWvSZf2GpjGD03kTXlZ+kZ16ak5MO2z/YILGmQtjtzjdBTo
         kuMRragN8elKXy0q0+Y5B9hUi87VS1im4+WLTgd9DyAEFbD9jmxMFK2mskEE17UbVMvg
         EwBsfpYSzHQ18GxMGJl+4okie9jRNYB27t2EMFvcfo2ac60zKxUP2TNBEjg6uL3BKvVk
         rWonGEiUYWbPuUOXhAZQHQwVudCT4Y2D21b7A/MGWEPw675Jtk+YxmiW6r4Ne0LJ1LdZ
         twRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744011902; x=1744616702;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o3NHeKTvtrNLVJ7Xwv0eZCsKPdpzCtXi2/NrHXy46hY=;
        b=CsUXCEQt8ZcbpQPicJB+elxhfJQ4rIEVHSfKD5oBSCKdgTuF+dNiElHYb4gQm+xFwz
         4zdqaqdoHqj50xymidGfNZXksjfncRw4C0OVegh04MObXLk9jDSifSUUq0FMrXgGhjV9
         YKaP/40e7zJsRC36vXn/pY9cIwTq3Xzn6MOFsAa023jn+ygYdQIqlArU6F+eGOUOBn3l
         4AQEVeJljh0igrmFKBw0PAVcMP5wMGH4NneNBagpaUejUo0FEXois0/T4iby7HgNyd09
         Hbuw9Gv7MCOTUawwM83jVRGTW+5s0pUj/5PDJe6wtUcJEep3UHz1OnU+JlPy855X7cVY
         XayQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBOErs06lDSxv7STFkaXX9VxW5RWkLBsrXG9MNeFwKNnoWlhr6+PS24+O2cShmUNMXhF4AOf7Gra/K1a5a@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj0MZeJem69agucOG/gV4qZbmf6u443d/gNFI9iMEY33JDKPxQ
	3of8R9RC7+D+WlTDJa7fn8LTFrDO795Cd4K0IlgAijNE03grEMRZp3sJINOwSQ==
X-Gm-Gg: ASbGncvNOV3+j+yfbBTOva1CgvnKAr4QbQGVmKPl6IYw9jmZXKoq78pHiHzjTaS687B
	yHshj8+TYHsRa7msHzQAnJ2Fv/tl0DI1cpbbmo/39GqeoVuVe1nZl0NyuyRhOc1K246L7Qn8khf
	L/6kACdPMFw5yQHlUJfVtKsWhpK6/y4DY6Fg53uxeVL0mCL1QzW2Z/kKvBffdFiM0/AxS9Zp7MI
	fk2wtc2C494Hiou8FQVnk0vRmWeivTHMR2jVSslWKa9/LwszF9inyoair1KmCoZ15WV7LuHR+gy
	pesLp89RWd1C3um3VEqVzbsREdy6jUc1olKwW63NzA6CsAwX0TBy48o=
X-Google-Smtp-Source: AGHT+IENobJ4uhI9CmAsS3iKtExZlmVr/Dw2mLVdyX06yvJmgGIWTlO27UTxouzUZOs/bVIxrsfjdQ==
X-Received: by 2002:a05:6a21:999e:b0:1f5:77bd:ecbc with SMTP id adf61e73a8af0-201045a726dmr17705262637.16.1744011901653;
        Mon, 07 Apr 2025 00:45:01 -0700 (PDT)
Received: from thinkpad ([36.255.17.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc41ad0csm6707969a12.66.2025.04.07.00.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:45:01 -0700 (PDT)
Date: Mon, 7 Apr 2025 13:14:56 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/3] PCI: Add sysfs support for exposing PTM context
Message-ID: <lhtklncbcyphq2ljxn6w5p7wk4rdj5wxzskmlly4mrr664b2lj@w5clch5uzvd3>
References: <20250324-pcie-ptm-v2-1-c7d8c3644b4a@linaro.org>
 <20250324162854.GA1251469@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250324162854.GA1251469@bhelgaas>

On Mon, Mar 24, 2025 at 11:28:54AM -0500, Bjorn Helgaas wrote:
> On Mon, Mar 24, 2025 at 03:34:35PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
> > Precision Time Management (PTM) mechanism defined in PCIe spec r6.0,
> > sec 6.22 allows precise coordination of timing information across multiple
> > components in a PCIe hierarchy with independent local time clocks.
> > 
> > PCI core already supports enabling PTM in the root port and endpoint
> > devices through PTM Extended Capability registers. But the PTM context
> > supported by the PTM capable components such as Root Complex (RC) and
> > Endpoint (EP) controllers were not exposed as of now.
> > 
> > Hence, add the sysfs support to expose the PTM context to userspace from
> > both PCIe RC and EP controllers. Controller drivers are expected to call
> > pcie_ptm_create_sysfs() to create the sysfs attributes for the PTM context
> > and call pcie_ptm_destroy_sysfs() to destroy them. The drivers should also
> > populate the relevant callbacks in the 'struct pcie_ptm_ops' structure
> > based on the controller implementation.
> 
> Can we include some motivation here, e.g., what is the value of
> exposing this information?  Is this for debugging or bringup purposes?
> Can users or administrators use this for something?  Obviously they
> can read and update some internal PTM state, but it would be nice to
> know what that's good for.
> 

This was a request from one of the Qualcomm customers, but they didn't share how
they are using these context. They just said that they want to collect the PTM
timestamps for comparing with PTP timestamps from a different PCIe switch. That
was not a worth of information to be mentioned in the cover letter, so I skipped
it intentionally.

Also, the spec itself didn't mention any specific usecases unfortunately.

> It looks like this requires device-specific support, i.e., the context
> itself, context update modes, access to the clock values, etc., is not
> specified by the generic PCIe spec.

Right.

>  Consequently this probably can't
> be done by generic drivers like ACPI, and maybe this is a candidate
> for debugfs instead of sysfs.
>

Well, we can still create syfs ABI for vendor specific features. Problem with
debugfs is that the customers cannot use debugfs in a production environment.
Moreover, I cannot strictly classify PTM context as a debugging information.
 
- Mani

-- 
மணிவண்ணன் சதாசிவம்

