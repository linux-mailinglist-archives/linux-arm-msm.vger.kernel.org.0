Return-Path: <linux-arm-msm+bounces-15127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D594088BBC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 08:56:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 579EAB2312C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 07:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 945F613443B;
	Tue, 26 Mar 2024 07:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QEzirItq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E256913441F
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 07:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711439792; cv=none; b=IsMklxy3q34YWJBKINMMAwBHWqoCPUOTq5CsaHxsIC1mcUtPzHl35kqYR7PV14Pbx857DCUxead3wGbPRFkmTyoLz4mjk/ws+xilJ/xk9ACZxZSJeovUYprj1/f8rvnmTnc018ZfVagGzBQ7pPXPk6hbwfX9q6+US/xTemGEhVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711439792; c=relaxed/simple;
	bh=63vX4jpafQjPqEVR/t5tqsl4TA+CR/G2jQNsq7L6wBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IefTtGS/lpqM2XfOhJmuexX8p+nusfuIqwlyyVcDZde5hCwG/u0lHV4OvLGjqNNHA+JJ1KKF9nbIz2sq++T2lmVKyRnFJx0EnbfTzyuxL5gft9xV7VCWqSJiQsyyTzlwgTN4tCAAp8IgXyD368BRV1zi8YtaaToXchyKqWKR2Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QEzirItq; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-29c75e348afso3754115a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 00:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711439790; x=1712044590; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jKhopOw7fOrbkL/7HBWWGU431gOPI8AulqVWyi8Mf+A=;
        b=QEzirItqhmQTQwqAsjTw00s2et6I7I2D7hawp5jHONr8QLq7DM+wGcJkuLLGomd4EB
         1W7fh9uTplU/a6oz5ZyRbiGtN+of73qdtw3F2z5XwGAAoG0ss+J8ELe7wyDB6oNYlhf3
         m9U+fimwLvO5/bYtC4MIjNXpqHjueQ86NjR+uDCfcogHQket7SCkYbMCfYi7TxLzLrFu
         X4I3ilb0Kvr+VmuRj89AJ/N0saa18EEAQdns1Do6z6TaOilfcqKGMkWfd09gw2Sr2ghc
         R0pjv+eyPZhcsTpZzrnZPt2tDKC5AMHl71Fiy66Q7aMmLYkZjeohR6yy3ZQaBdS5DNZx
         9/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711439790; x=1712044590;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jKhopOw7fOrbkL/7HBWWGU431gOPI8AulqVWyi8Mf+A=;
        b=Bm5mf5e9ruBE5b+5Hf4DjNFv+ANCyUsHGlsZMN1arJ6uGT7xfjFvvdetCZbIyZYJn6
         r8rnUmFxcUMad+CQI+HV/PFVyZ8mnMD3jU1RzwiwhiTHSJ613sFYgCBXh3xuLBJ4WmNp
         SwNvjJ0xmAG0MdY0hwsMePMCOxfGAlxwgYWpjohcP5vqzrxD04Ps8oGfwSJhNx4AmjlG
         pKO0f3Sei3TFk2GskbAjCskjUQ+YwXJGMX8Tfjbnb+8yIb/OKHWK86WejUEwxjb3iGmo
         RudTUq2aCVwxIZ5yU8Bvyno2NGJhu3AoNdZot4MKU+i/tMeai7r9Mfgny2N3DX7PU2Ux
         8ktA==
X-Forwarded-Encrypted: i=1; AJvYcCUALAVekzBRJ3pkETxBkkL6RNJa/VzNaScprBoSLl0pukTzIh/M6MTMGlvhAoRK1ajIfMW1H95H0DSOwdJnet1zstlswlvrR86g6nRoMg==
X-Gm-Message-State: AOJu0Yyeri8e77kiGdsXjw/Krelyp+R+1aZjz8M3iEG990p0tM3ESD62
	ee8pv24lBsX5pOV6JMN8m3EftQuiDaYwP0qyV+smuMsAIYdE7f0cPuzMdamwfA==
X-Google-Smtp-Source: AGHT+IGQ7WhZEVFO29WnqrklLDrhQum07Jd12D1I7yMg/ubf+zTylUXcP0KkwS2QJv/QTuUJTf14qg==
X-Received: by 2002:a17:902:c115:b0:1df:16b:9cb8 with SMTP id 21-20020a170902c11500b001df016b9cb8mr8516819pli.2.1711439789975;
        Tue, 26 Mar 2024 00:56:29 -0700 (PDT)
Received: from thinkpad ([117.207.28.168])
        by smtp.gmail.com with ESMTPSA id y16-20020a17090264d000b001db5bdd5e3asm6242831pli.84.2024.03.26.00.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 00:56:29 -0700 (PDT)
Date: Tue, 26 Mar 2024 13:26:22 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 03/11] PCI: endpoint: Rename core_init() callback in
 'struct pci_epc_event_ops' to init()
Message-ID: <20240326075622.GE9565@thinkpad>
References: <20240314-pci-epf-rework-v1-0-6134e6c1d491@linaro.org>
 <20240314-pci-epf-rework-v1-3-6134e6c1d491@linaro.org>
 <Zf2tEM1ueugQyJfK@ryzen>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zf2tEM1ueugQyJfK@ryzen>

On Fri, Mar 22, 2024 at 05:08:48PM +0100, Niklas Cassel wrote:
> On Thu, Mar 14, 2024 at 08:53:42PM +0530, Manivannan Sadhasivam wrote:
> > core_init() callback is used to notify the EPC initialization event to the
> > EPF drivers. The 'core' prefix was used indicate that the controller IP
> > core has completed initialization. But it serves no purpose as the EPF
> > driver will only care about the EPC initialization as a whole and there is
> > no real benefit to distinguish the IP core part.
> > 
> > So let's rename the core_init() callback in 'struct pci_epc_event_ops' to
> > just init() to make it more clear.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/endpoint/functions/pci-epf-mhi.c  |  4 ++--
> >  drivers/pci/endpoint/functions/pci-epf-test.c |  4 ++--
> >  drivers/pci/endpoint/pci-epc-core.c           | 16 ++++++++--------
> >  include/linux/pci-epf.h                       |  4 ++--
> >  4 files changed, 14 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> > index e5d67aec7574..da894a9a447e 100644
> > --- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
> > +++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> > @@ -700,7 +700,7 @@ static void pci_epf_mhi_dma_deinit(struct pci_epf_mhi *epf_mhi)
> >  	epf_mhi->dma_chan_rx = NULL;
> >  }
> >  
> > -static int pci_epf_mhi_core_init(struct pci_epf *epf)
> > +static int pci_epf_mhi_epc_init(struct pci_epf *epf)
> >  {
> >  	struct pci_epf_mhi *epf_mhi = epf_get_drvdata(epf);
> >  	const struct pci_epf_mhi_ep_info *info = epf_mhi->info;
> > @@ -881,7 +881,7 @@ static void pci_epf_mhi_unbind(struct pci_epf *epf)
> >  }
> >  
> >  static const struct pci_epc_event_ops pci_epf_mhi_epc_event_ops = {
> > -	.core_init = pci_epf_mhi_core_init,
> > +	.init = pci_epf_mhi_epc_init,
> >  };
> >  
> >  static const struct pci_epc_bus_event_ops pci_epf_mhi_bus_event_ops = {
> > diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
> > index 751dab5799d5..1dae0fce8fc4 100644
> > --- a/drivers/pci/endpoint/functions/pci-epf-test.c
> > +++ b/drivers/pci/endpoint/functions/pci-epf-test.c
> > @@ -746,7 +746,7 @@ static int pci_epf_test_set_bar(struct pci_epf *epf)
> >  	return 0;
> >  }
> >  
> > -static int pci_epf_test_core_init(struct pci_epf *epf)
> > +static int pci_epf_test_epc_init(struct pci_epf *epf)
> 
> Why have _epc_ init in the name at all?
> 
> Isn't
> static int pci_epf_test_init(struct pci_epf *epf)
> 
> Enough?
> 
> From my perspective, it is the EPF that is initializing
> (by configuring the BARS according to it's liking),
> not the EPC initializing.
> 

Hmm, you are right. It makes sense to remove 'epc' from the naming.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

