Return-Path: <linux-arm-msm+bounces-30171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B729659AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 10:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D93D282A92
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 08:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ADA6168C33;
	Fri, 30 Aug 2024 08:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p+0ucVEV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCCB166F3F
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 08:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725005535; cv=none; b=hejptnHp0XZDfQ5iTEldxewMIIWb4WYYLyL0Xd7CfeHAKmZjGlLtLNamNnwmmRcjwoXW/SA2lSy75roqzI71IGQA0jVZXo4nQfbJH6VWgBaK3rvlE5m0NTFds01JX7j8rXFUsCv06CSphc1kRmVYYLXvWL9ObG4XEyGvrgqHfYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725005535; c=relaxed/simple;
	bh=Q5bXYbl4dV+VYYIPMv/Rb99ZiL+XzXzN25xBOihod3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Edkqy4vBk81gb54KbBoOeba7ObHy7DwKQCpLpiIWov9DU+LtiTqZC4sjbddxrX5OdyAO2G3PwFA3SuZdMNzahrKODuYaKZx6+JqhTWSQoMx4S2lyyVL+mhM2gm/+HKYpdeu+f1jW7g0LUNlhDDAxR7wNieyhM5XahmL9W+0Tr70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p+0ucVEV; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-202508cb8ebso9953615ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 01:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725005533; x=1725610333; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aUHV0wbyIdVXwPB5dolmt5OPeFFiHv5Yfm1U7ilTAZ0=;
        b=p+0ucVEVXbe6yrAIbm1gphBMUslR2F4/xe2krIfjfb8iIaFeOtWQnUuvAkkKkl7pcX
         r277bZSPnxaIvv0qMY6RQX1FPryNiOj1AB+4stXyEqg76ey1XTNAFgMGjhRAjYOgrvjQ
         CQOM9LAveneujVIMciWzPzZogQezRqnnY8mHytTHaPDEVB8OL7Az4lC/X7XWWT4wNTol
         CYrUNoaN7X0h/treDopdYBupQQFw/bdNXN5repbBDmUn3Ao8SKxc2dm9avRQbi6vq9AR
         u/GM1nbdAM2JRJ+vTQJm7XxAss9JfV4Rxvoomz3NqOkS3zPMXdBgUg+SfjCH+fBkVZzj
         lcqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725005533; x=1725610333;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aUHV0wbyIdVXwPB5dolmt5OPeFFiHv5Yfm1U7ilTAZ0=;
        b=Y4ARMDRccz7B6xaAVfICFED/f8eQ1L6WdCqBXs9hzdo6NNHZkrOExfN6W58KyShFPc
         5GUcWDuDjjkbmKWzNI9xQpUODj9aWF6RHgpPZZagfYAVlgWrLGS/eqDrpUl6iuRQBluQ
         m705/7jvKUJl/EWymDPn8rxWLdCXPS5wB0NT8CyBjDpFHjr9aigomx47O/DAXYg9m2kA
         pvJKxksR/xM6XAp+xES7kh3xYOMd9PCRJXEDMVPGXYMrCVYZ1JRQWhmwCeBFAMo0l2Pk
         d05axim8AmqqHgZfe4/ZF18Mm2Tq7hHGF5ycI0iSNgvaguPfraPfLWHhkgCtpEs7ik99
         GvKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfqOmBvdtIlOM/u1ggeVXPxXZIW2/o472H3YrEfRNBcwZFmT2YfMSnC4ZZDgKrrlG0KdiTpSLHAjkicp0A@vger.kernel.org
X-Gm-Message-State: AOJu0YwAMi/zZsUULVHgQbzT0AtO0FVSqXiWCHKsRVxg41pshIa8NSgI
	ht8U2tOY3cN8F1FCobX5lTQRdPRMzo+IL33HUg4u6Bcasy7S1FbYHPcin7QSXQ==
X-Google-Smtp-Source: AGHT+IE/BW3u6yWbfrYcy/l5d0lHQgaNZ0qFHfjJAZ8BG59rWjAxYM55Dn1n/0jPPnypv9IrkiwExw==
X-Received: by 2002:a17:903:35ce:b0:202:1a0b:7cfd with SMTP id d9443c01a7336-2050c3dbf8fmr54516345ad.28.1725005532965;
        Fri, 30 Aug 2024 01:12:12 -0700 (PDT)
Received: from thinkpad ([117.193.213.95])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20515551e79sm22132855ad.248.2024.08.30.01.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 01:12:12 -0700 (PDT)
Date: Fri, 30 Aug 2024 13:42:05 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
	robh@kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2] PCI: qcom-ep: Enable controller resources like PHY
 only after refclk is available
Message-ID: <20240830081205.x3ucsausk5znk27e@thinkpad>
References: <20240829164455.ts2j46dfxwp3pa2f@thinkpad>
 <20240829170624.GA67120@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240829170624.GA67120@bhelgaas>

On Thu, Aug 29, 2024 at 12:06:24PM -0500, Bjorn Helgaas wrote:
> On Thu, Aug 29, 2024 at 10:14:55PM +0530, Manivannan Sadhasivam wrote:
> > On Thu, Aug 29, 2024 at 07:38:08AM -0500, Bjorn Helgaas wrote:
> > > On Thu, Aug 29, 2024 at 11:07:20AM +0530, Manivannan Sadhasivam wrote:
> > > > On Wed, Aug 28, 2024 at 03:59:45PM -0500, Bjorn Helgaas wrote:
> > > > > On Wed, Aug 28, 2024 at 07:31:08PM +0530, Manivannan Sadhasivam wrote:
> > > > > > qcom_pcie_enable_resources() is called by qcom_pcie_ep_probe() and it
> > > > > > enables the controller resources like clocks, regulator, PHY. On one of the
> > > > > > new unreleased Qcom SoC, PHY enablement depends on the active refclk. And
> > > > > > on all of the supported Qcom endpoint SoCs, refclk comes from the host
> > > > > > (RC). So calling qcom_pcie_enable_resources() without refclk causes the
> > > > > > whole SoC crash on the new SoC.
> > > > > > 
> > > > > > qcom_pcie_enable_resources() is already called by
> > > > > > qcom_pcie_perst_deassert() when PERST# is deasserted, and refclk is
> > > > > > available at that time.
> > > > > > 
> > > > > > Hence, remove the unnecessary call to qcom_pcie_enable_resources() from
> > > > > > qcom_pcie_ep_probe() to prevent the crash.
> > > > > > 
> > > > > > Fixes: 869bc5253406 ("PCI: dwc: ep: Fix DBI access failure for drivers requiring refclk from host")
> > > > > > Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > > > ---
> > > > > > 
> > > > > > Changes in v2:
> > > > > > 
> > > > > > - Changed the patch description to mention the crash clearly as suggested by
> > > > > >   Bjorn
> > > > > 
> > > > > Clearly mentioning the crash as rationale for the change is *part* of
> > > > > what I was looking for.
> > > > > 
> > > > > The rest, just as important, is information about what sort of crash
> > > > > this is, because I hope and suspect the crash is recoverable, and we
> > > > > *should* recover from it because PERST# may occur at arbitrary times,
> > > > > so trying to avoid it is never going to be reliable.
> > > > 
> > > > I did mention 'whole SoC crash' which typically means unrecoverable
> > > > state as the SoC would crash (not just the driver). On Qcom SoCs,
> > > > this will also lead the SoC to boot into EDL (Emergency Download)
> > > > mode so that the users can collect dumps on the crash.
> > > 
> > > IIUC we're talking about an access to a PHY register, and the access
> > > requires Refclk from the host.  I assume the SoC accesses the register
> > > by doing an MMIO load.  If nothing responds, I assume the SoC would
> > > take a machine check or similar because there's no data to complete
> > > the load instruction.  So I assume again that the Linux on the SoC
> > > doesn't know how to recover from such a machine check?  If that's the
> > > scenario, is the machine check unrecoverable in principle, or is it
> > > potentially recoverable but nobody has done the work to do it?  My
> > > guess would be the latter, because the former would mean that it's
> > > impossible to build a robust endpoint around this SoC.  But obviously
> > > this is all complete speculation on my part.
> > 
> > Atleast on Qcom SoCs, doing a MMIO read without enabling the
> > resources would result in a NoC (Network On Chip) error, which then
> > end up as an exception to the Trustzone and Trustzone will finally
> > convert it to a SoC crash so that the users could take a crash dump
> > and do the analysis on why the crash has happened.
> > 
> > I know that it may sound strange to developers coming from x86 world
> > :)
> 
> It's only strange if the system design forces a crash for events that
> happen in normal operation.  Sounds like part of the problem here is
> the non-SRIS mode that depends on Refclk from the host.  That and the
> fact that operating in non-SRIS mode has an unavoidable race where
> PERST# from the host at the wrong time can crash the endpoint.
> 

Precisely.

> I think users of non-SRIS mode need to be aware of this issue, and
> this patch to narrow the race window, but not close it completely, is
> one good place to mention it.
> 

Okay. I'll mention it in patch description.

> > But this NoC error is something NVidia has also reported before, so
> > I wouldn't assume that this is a Qcom specific issue but rather for
> > SoCs depending on refclk from host.
> 
> Are there other drivers that need a similar band-aid?
> 

AFAIK, only tegra194 and qcom-pcie-ep drivers require refclk from host. Rest of
the endpoint drivers seem to have independent clock.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

