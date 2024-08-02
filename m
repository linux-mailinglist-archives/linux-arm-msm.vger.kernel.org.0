Return-Path: <linux-arm-msm+bounces-27804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4C8946363
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 20:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37BFF2837DA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 18:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 708FB1547F2;
	Fri,  2 Aug 2024 18:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XRb9hWpp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4801547E3
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Aug 2024 18:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722624735; cv=none; b=ckDbpce5p53LEEh3ILQTUScQAOGuOpN/OIUQoexnpTQlXiM0FUD2kH6vwRTcSFsywVPTEWYB+uNe5DMKynLmdk8gz85UruaoonQoiBxSWIOeKMjtqPKPXRuK002T+OdbQcl7Igy0A85ZYw/guOmvTUejb+/lEhRRD3JIMXE8NA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722624735; c=relaxed/simple;
	bh=Rcqjex2lBU0wKQMtNrMiM+8XWMnqbPa1RsnpSfVQEtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PuaYhEsLUlso0TvEDzRAqhHEor+t7doO5dhLZdZxyCgjRO7/BT+imEZpKrwfEUon77sKbvXUPKSfOqqtFt2+6Z6ri1UFOxUdxEmOJtmwt8k0eeMTRO2saC1xdfcE9N0J9gCEmRQW8jB1vey2kH3+ldGWlT+9Fny0cOf8niRwQpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XRb9hWpp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722624732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CG1jgLVdC2fEObYmK2QTtuJTwCPC+G97aquoLWftjeI=;
	b=XRb9hWppg383RS+ere6szAd/2/5sjb0p3EGdAkPM0TZzkY3DggHROQfzafFTCEUDQULABe
	WuYq9cqlui4tRQg/HMjQSkharfcD0nv6YYzuGoQNETOuhSPWgbMvCgqW8YSdEMTm8kXqO8
	jdCL6u06HZfzUJMPCDLVnNWmXkOn44k=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-HD4O-1BhM_mAbLSRIcjY0w-1; Fri, 02 Aug 2024 14:52:11 -0400
X-MC-Unique: HD4O-1BhM_mAbLSRIcjY0w-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4501f170533so84151171cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Aug 2024 11:52:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722624730; x=1723229530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CG1jgLVdC2fEObYmK2QTtuJTwCPC+G97aquoLWftjeI=;
        b=pod4TeFGwTTWUF3SwHE56anqOaHec7PA5wm9quhXD5/K54cWnb15+OSfgyVA9YlQm5
         na4iMyte9lBoNTiolgge/uqQdgFf9eR9yUp58rx/CzNImwQe/e8Ssb8wKoHumgpSAWIn
         rKUim9njy0G/Mar0pg1uJQZi8Y6oHCIqhrEUCAPQLPQF4TLhSbnyyBIETyKrAXSWkL1p
         KkSMeFYQuhK3hVMOjnZ822uB26CNyLaXuj/ODw6ds4iPkb+Sjb3bEiLIIuC7M6TORORM
         /nsz36/7jvHEdxy6llDpVggc+3awgJAjPfrzb8uBTYT4QBeW5K2ohjEGlMpt4WUtcCcR
         xBBg==
X-Forwarded-Encrypted: i=1; AJvYcCXd5IewFLHCB7ZNmV7vBPFJ8CQZFl0MBa03BSlpiCGMn/PXSb2KOwoTCRg6KZdK7DOI5Smu87wmXh0+9RhbAVA62nsostWWU2oQMWmkng==
X-Gm-Message-State: AOJu0YzdRXzmhkPm7/8Ev3hNOcYoi58GQ1wP08zm4sxW7xYmQsOJkOGr
	akIAcrk68Up9PEC855b75bNJ6BKoWCSryFzqC6AzMdtHA/uPiue9oWQpEMtiBmU9j8V/Lv9/ksC
	57WbZQ1uhRaNG83Bourqo8nY5VwQ6Rx4Yf1jZeP1tXuPpo6NSYvU1epE53093psg=
X-Received: by 2002:a05:622a:34c:b0:447:d4ce:dd26 with SMTP id d75a77b69052e-451892c1523mr52041171cf.56.1722624730522;
        Fri, 02 Aug 2024 11:52:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaUYKiXGc9VmWENZJ7EtnEJAQEzZy6OYbhTn3EVsmtVqd1bg6xDc1wbjVNcpxbrWR12YCYMA==
X-Received: by 2002:a05:622a:34c:b0:447:d4ce:dd26 with SMTP id d75a77b69052e-451892c1523mr52040901cf.56.1722624730143;
        Fri, 02 Aug 2024 11:52:10 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4518a755579sm9510731cf.59.2024.08.02.11.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 11:52:09 -0700 (PDT)
Date: Fri, 2 Aug 2024 13:52:07 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Alexei Starovoitov <ast@kernel.org>, bpf@vger.kernel.org, 
	Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Jose Abreu <joabreu@synopsys.com>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 11/14] net: stmmac: pass stmmac_pcs into
 dwmac_pcs_isr()
Message-ID: <eyup477eanpmbgldj63cvwwkwqjshweqrve6u2enyzodoqillw@cuzhm7u37rz7>
References: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
 <E1sZpog-000eHn-8r@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1sZpog-000eHn-8r@rmk-PC.armlinux.org.uk>

On Fri, Aug 02, 2024 at 11:47:22AM GMT, Russell King (Oracle) wrote:
> Pass the stmmac_pcs into dwmac_pcs_isr() so that we have the base
> address of the PCS block available.

nitpicky, but I think it would be nice say something like "stmmac_pcs
already contains the base address of the PCS registers. Pass that in
instead of recalculating the base address again" if I'm following the
motivation correctly.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> index 083128e0013c..c73a08dab7b2 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> @@ -61,18 +61,18 @@
>  
>  /**
>   * dwmac_pcs_isr - TBI, RTBI, or SGMII PHY ISR
> - * @ioaddr: IO registers pointer
> + * @spcs: pointer to &struct stmmac_pcs
>   * @reg: Base address of the AN Control Register.
>   * @intr_status: GMAC core interrupt status
>   * @x: pointer to log these events as stats
>   * Description: it is the ISR for PCS events: Auto-Negotiation Completed and
>   * Link status.
>   */
> -static inline void dwmac_pcs_isr(void __iomem *ioaddr, u32 reg,
> +static inline void dwmac_pcs_isr(struct stmmac_pcs *spcs,
>  				 unsigned int intr_status,
>  				 struct stmmac_extra_stats *x)

Please drop the reg variable from the kerneldoc, you've annihilated it!

Thanks,
Andrew


