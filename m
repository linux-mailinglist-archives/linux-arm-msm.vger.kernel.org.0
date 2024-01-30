Return-Path: <linux-arm-msm+bounces-9054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BAE842876
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 16:53:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9608628A4E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 15:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F145F86AD9;
	Tue, 30 Jan 2024 15:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IopQ6CkF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDD085C66
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 15:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706630011; cv=none; b=G+GQ0R3MdTtY+AVlxDnpryteHOrrAkHhuMC0p5H6LYbwPgqNqHfCvjcVXNDzs+aHTPK51k1xghJ7NQrMTFOyTCypqsea45IyFswEDB28D/J8rl97o/1zWw9w+2oUZ4f1KL2QEdjpylkTqD/7T/1OLfAMJ3R139ifrACIq+jqpr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706630011; c=relaxed/simple;
	bh=5gq9bk2CACo+T8MhwqInhSIy3rOGWTcRWK1IgBCsVxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oGbbFevGscbl81/IH4I6t6hAgmAzQRhXT5hICip4rmTzt8MbZcseg0G+73Zx22z825ex95tkDDdr5yYpy+5d3tbM3KyzjimsrO+8ccKwuskgO0qkq0R/VQRxh8D6eBtfGZTZ3/zuUxw4BekFvqv6482yT0kK+6QmLMB8aWR1/U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IopQ6CkF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706630009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oSj1lyNclmh9b1DFiLfFnvUIxkzThYLUPlpLm9/wz/A=;
	b=IopQ6CkFdtaCaqV5cZ7dzixRvffYOoCKSoWpBlyKmr4hl10LYNAoynDeTDKhN4BjWUJqpE
	hgz3Eh5ZjBkbOqH7HaagGu2qIG4gP2dM8CKmGjarZGRNuZyiqhso8Si1dsWpTiPhUQGQvc
	vQ5nBVOIn3kzRE5EQoaWwvZn2S6rtC0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-cvjMjgRvP-iEBlfoCCyKZQ-1; Tue, 30 Jan 2024 10:53:25 -0500
X-MC-Unique: cvjMjgRvP-iEBlfoCCyKZQ-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-42ab1521acfso19923161cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 07:53:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706630005; x=1707234805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSj1lyNclmh9b1DFiLfFnvUIxkzThYLUPlpLm9/wz/A=;
        b=rz2a5UPm3l1Tn0akbNKlgUp4+f9AS/fgbZjtKFbpYN3N4Emy+GBOD7W4SQGOimdGYV
         fuNX/P01UR96iXWDbZBsF7lsfo0L7jAzZD82Snp5P1hpwo5qvA+CJL0iwQn7kj7r82QO
         AW6Oi6dVPKMRMaLTTO+G6XnzAWPj0Z55JYxrEBKQsG1L4HkFo9iZW06ovKmcq/F4e8ES
         ORpazZzYIHlzP3QWgWLMws08jaLie4TPfnfEkyfLp3xt1bywgapckD6S0jcpSzK76Mok
         N98CnzQ2S8HMLzBI1x7g/sdxSzgv4KGVmJmX/SGmoXqyEWObGwp/Zy6QP5ZDsrJjWq4+
         gsyA==
X-Gm-Message-State: AOJu0YynzygSRgztWLE8K+UV+EeRJL6zyhfpQIqm+SvbG6NIbTz+Vw+x
	m0nwu399EkrySTgwL1pnaidG2hh4oTA13Hh/OlC/nK2wA5JTyiXPrOAsgkdAcsIlz4xcAHut3DJ
	1TDb0az4uDhaF6a6nYCpQVWRI/17Siuv2QaB8EZXcCH5DZv17+mhViY+HqdCHDtU=
X-Received: by 2002:ac8:5950:0:b0:42a:6df3:1f1d with SMTP id 16-20020ac85950000000b0042a6df31f1dmr12272881qtz.74.1706630005301;
        Tue, 30 Jan 2024 07:53:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVEawnHTN95Z6HJiyigSQy1AJjcgY3k8TnIlbRXYXuot4rDh5Z3hGCkiEuIFI9fTvFfvDK0Q==
X-Received: by 2002:ac8:5950:0:b0:42a:6df3:1f1d with SMTP id 16-20020ac85950000000b0042a6df31f1dmr12272860qtz.74.1706630005018;
        Tue, 30 Jan 2024 07:53:25 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::47])
        by smtp.gmail.com with ESMTPSA id z12-20020ac87cac000000b0042a1223cb9bsm3313663qtv.70.2024.01.30.07.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 07:53:24 -0800 (PST)
Date: Tue, 30 Jan 2024 09:53:22 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: bhupesh.linux@gmail.com, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: Re: [PATCH] MAINTAINERS: Drop unreachable reviewer for Qualcomm
 ETHQOS ethernet driver
Message-ID: <ual3c4fuuz5trgn2ekklsfeslwvswfjg5nij5epbnuf5mihfay@pp32fs6btwxk>
References: <20240129-remove-dwmac-qcom-ethqos-reviewer-v1-1-2645eab61451@redhat.com>
 <ZbkWwn-oN5wqoPfJ@matsya>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZbkWwn-oN5wqoPfJ@matsya>

On Tue, Jan 30, 2024 at 09:03:22PM +0530, Vinod Koul wrote:
> On 29-01-24, 11:12, Andrew Halaney wrote:
> > Bhupesh's email responds indicating they've changed employers and with
> > no new contact information. Let's drop the line from MAINTAINERS to
> > avoid getting the same response over and over.
> 
> Looks like Bhupesh sent the patch changing but never followed up with a
> v2 for this:
> lore.kernel.org/r/20230915191600.3410862-1-bhupesh.linux@gmail.com
> 
> Would prefer if this is changed to his email (copied him as well)
> 

Thanks for finding that! Bhupesh, do you plan on spinning a v2 soon? If
so I will not send a v2, otherwise I can respin this with your email and
no .mailmap change.

> 
> > 
> > Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> > ---
> > If anyone knows how to contact Bhupesh / if they're willing to continue
> > being a reviewer feel free to suggest an alternative, but for the moment
> > this is better than nothing.
> > ---
> >  MAINTAINERS | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 939f6dd0ef6a..b285d9a123ce 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -18080,7 +18080,6 @@ F:	drivers/net/ethernet/qualcomm/emac/
> >  
> >  QUALCOMM ETHQOS ETHERNET DRIVER
> >  M:	Vinod Koul <vkoul@kernel.org>
> > -R:	Bhupesh Sharma <bhupesh.sharma@linaro.org>
> >  L:	netdev@vger.kernel.org
> >  L:	linux-arm-msm@vger.kernel.org
> >  S:	Maintained
> > 
> > ---
> > base-commit: 596764183be8ebb13352b281a442a1f1151c9b06
> > change-id: 20240129-remove-dwmac-qcom-ethqos-reviewer-1a37d8c71383
> > 
> > Best regards,
> > -- 
> > Andrew Halaney <ahalaney@redhat.com>
> 
> -- 
> ~Vinod
> 


