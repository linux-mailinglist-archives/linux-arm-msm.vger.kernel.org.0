Return-Path: <linux-arm-msm+bounces-54617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D72BCA915D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 09:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD6217AF35C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 07:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 650D1221F3B;
	Thu, 17 Apr 2025 07:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wG9uc4w3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD876221F3C
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 07:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876489; cv=none; b=p8s+u1WF7n4NwUGtQE2eBboiyug7uRLIBbarlx6tB6YTGn3woskc3pnDHfc/WViqalFrwtj06lKYp2I5rMaFzhhx9EwbqGN7wZ+kBVkehZMSZ1KPMNIWlkr5b2DrLTzv4hddwAssqOzRwqCuwZcNG6lCF56/epTrkLJbXhrOrdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876489; c=relaxed/simple;
	bh=G2wbLDTBuDuot2uMyXXKGIFRZm9zNrwNLtVXgIYuceY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GGthPzaetSjkilANooes+AIJjyVETfOKcIlWLXmus7lJE06fMH3OsOI/y+YZZL+bZi41sDxcuQJj29irrWeG3D8nVcDp1eKA6QZRYY9qqfOEQxV2hxLo7VMuPSdmmBmrImQR2wXxie47r+sheAOwiw22qBaq3nDPK1+3aus34ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wG9uc4w3; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-306b602d2ffso431462a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 00:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744876487; x=1745481287; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HzOw82UGgblpmMtgHt3tu3Y7oCEf0jc/oLwNceOiuZ8=;
        b=wG9uc4w3y66E0GeVCyjISU03ftpy1Q4tEfO80mk3nz3WtZxabOH5DE8yzgmeWzUDCx
         re5AEW+yeJ9kUF/ZOFgPVI/xWVx8TcHBrgZ5VAOwCwdisvE6sa7VK9EIcbx/iL2vP+BV
         fkveyoWcQjoQvpFRKFWxftTOFlA78J9y9k8J0ArDDwxyShJrc/GKWoubCzekyyTDTCqT
         EAsnv4WAoz0bpBQp4IUgZ9pEui+TBni1434iSzPvj4bVYAn0Za1eYWyeVWw99285Eo4V
         XFaA3z4B6so7vtKL7Fo5ulqcbhI3wpiCNM5Y2jHM61424hwtZSLFtMtWKOuB1j912qv+
         Bffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876487; x=1745481287;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HzOw82UGgblpmMtgHt3tu3Y7oCEf0jc/oLwNceOiuZ8=;
        b=fOS6XKNDLIbd83mGQ3xBPi5VinQARVS+NE8s8x8zGYCBg0e9fRzed8TrqO8ifTtZkH
         vpwEriVq9NJ0PcSKhwoo+8o2TOTxagZt+qufCbx7Vh5P+OwihJLX+NHRCEpS7KFuqVnf
         Z2pwcq/0SvjZUQrNooJLsv8o5hliMyIv1CGik1JNegRSzGqvyrCy9T5JEgTExtTVL5t9
         aogiYzA5VDpT5UAtej6cRjBayL02AtjwOzTMdlhMXDefMxfdc0w7PwrwCvEl1B9Hk1Gz
         UcfGqrmLsRXsL4KTc77seWwg4EKZcnx/Blo4bnHY2JSsAsYPBDttn/0fa128Jg7691WG
         EevQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7peIOYr7VwrENFGhbAgUrAFV2s3vGfKTaJO7ho0foedwzB2sRCWsD6H3PYbWd5mESIc4M8AyyKEkB5crX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7wwYqlHyNA6s8Z+XbtDwzZCyvF1g58+sdvJGpq7ipCUeVAkGT
	nXCXqDS4ZKDKA7FhijdmLg6fuupY2FZLp2F45EsSdaRYN0i48Q+R1DOf7gZ3/Q==
X-Gm-Gg: ASbGnculKIq7x6cJmH35dPY2KkLIw2vhqJ59yu22jQlO1Q+RVx59kCf2RfvpzmYfHCb
	WWNCbEjn0K/+Cb0WPBQVhWmSSqd8+alCJf9AKEfjNwOSCUmCsWbz25ZiA9DFbqATLaUsSEs3+zM
	npB/Ts7VfBRaUEkVHybZ/MZr4poOjJm4VvfCN4wVTZ9I0FAQTkGYvQ/dL/VgSi0Q7nByq4OTgzW
	A3sMWfRAcnKXnNJPybTWQjq9T/WQKvyKcWBJ95XHXf2Nq5jTuUz5RmUqk9ZtUtkz0ROceaT2sk+
	/xM8lvU7ank5hqA3bzdztBBGo1nWjD45cSur1UlfeutUQn4N
X-Google-Smtp-Source: AGHT+IHr4TLOn+vWmMUG8we+6H82JH3XHC68smquEz0SW0g3spOjs92CiF0f680vTLzBzdTTUPC87Q==
X-Received: by 2002:a17:90b:5824:b0:2fe:a79e:f56f with SMTP id 98e67ed59e1d1-30863f19571mr7527508a91.13.1744876487050;
        Thu, 17 Apr 2025 00:54:47 -0700 (PDT)
Received: from thinkpad ([120.60.54.0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308613b2f13sm3318363a91.36.2025.04.17.00.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 00:54:46 -0700 (PDT)
Date: Thu, 17 Apr 2025 13:24:41 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, dingwei@marvell.com, cassel@kernel.org, 
	Lukas Wunner <lukas@wunner.de>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/4] PCI: Add link down handling for host bridges
Message-ID: <lsehjhqicvit32jcsjkfqemgypnpim6zbxwapzdrncm3hwrp44@bvwg2acyyvle>
References: <20250416-pcie-reset-slot-v2-0-efe76b278c10@linaro.org>
 <20250416-pcie-reset-slot-v2-3-efe76b278c10@linaro.org>
 <26b70e1b-861f-4c94-47a7-a267c41cadbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26b70e1b-861f-4c94-47a7-a267c41cadbb@oss.qualcomm.com>

On Wed, Apr 16, 2025 at 11:21:49PM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 4/16/2025 9:59 PM, Manivannan Sadhasivam via B4 Relay wrote:
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
> > The PCI link, when down, needs to be recovered to bring it back. But that
> > cannot be done in a generic way as link recovery procedure is specific to
> > host bridges. So add a new API pci_host_handle_link_down() that could be
> > called by the host bridge drivers when the link goes down.
> > 
> > The API will iterate through all the slots and calls the pcie_do_recovery()
> > function with 'pci_channel_io_frozen' as the state. This will result in the
> > execution of the AER Fatal error handling code. Since the link down
> > recovery is pretty much the same as AER Fatal error handling,
> > pcie_do_recovery() helper is reused here. First the AER error_detected
> > callback will be triggered for the bridge and the downstream devices. Then,
> > pcie_do_slot_reset() will be called for each slots, which will reset the
> > slots using 'reset_slot' callback to recover the link. Once that's done,
> > resume message will be broadcasted to the bridge and the downstream devices
> > indicating successful link recovery.
> > 
> > In case if the AER support is not enabled in the kernel, only
> > pci_bus_error_reset() will be called for each slots as there is no way we
> > could inform the drivers about link recovery.
> > 
> The PCIe endpoint drivers are registering with err_handlers and they
> will be invoked only from pcie_do_recovery, but there are getting built
> by default irrespective of AER is enabled or not.
> 

AER is *one* of the functionalities of an endpoint. And the endpoint could
mostly work without AER reporting (except for AER fatal/non-fatal where recovery
need to be performed by the host). So it wouldn't make sense to add AER
dependency for them.

> Does it make sense to built err.c irrespective of AER is enabled or not
> to use common logic without the need of having dependency on AER.
> 

Well, yes and no. Right now, only DPC reuses the err handlers except AER. But
DPC driver itself is functional dependent on AER. So I don't think it is really
required to build err.c independent of AER. But I will try to rework the code in
the future for fixing things like 'AER' prefix added to logs and such.

> Also since err.c is tied with AER, DPC also had a hard requirement
> to enable AER which is not needed technically.
> 

DPC driver is functional dependent on AER.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

