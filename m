Return-Path: <linux-arm-msm+bounces-27805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABF094638A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 21:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9183B22392
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 19:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E56D15C13C;
	Fri,  2 Aug 2024 19:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L0W0XaTb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11971547EE
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Aug 2024 19:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722625353; cv=none; b=nQei5zl5emYI0bfTD291pTg4IepHvmw2uDJVcUq/Oqhg6k1ni3VZ5ZqBGeCI63amfvuxzs01KzUsxirEsjavTiCKWHhNt3PReX2ywH342XmaOtVWHrJF3ymQrzVqcGCFIDyyP3bpoVJtRjp8ij2E0SxUWiDVlLc9gZB9Yq/Mg9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722625353; c=relaxed/simple;
	bh=XwnlLTMdPliINTV5vAsANgmZhdN+2IjBYhQ9jtQVvcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ppSpVvhIi0/mRel7tb5VFDSvjIrDYCE87gkzwJ+AH0enIA5vd4f5BcJ1sYzX972/i2yA4BVlrwkZ5tJLgKebqmXacLoNKToptAFD6kdvgkHbin/hk39EfrsqzjG+pwLjC0LVwFWblDeCfV9UYHLSfkhGQBY8Rz3G22CNLTqF628=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L0W0XaTb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722625351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3mGGPNMYW+PwVsxgLN/1XKLLl4dJIQ78l9NLO9EBmCQ=;
	b=L0W0XaTbkF5quboRCkN0dXqWVRIKkmQ5l4vDRwjWAc+E60PmGEpyno0dbCOBlpv28NPMnd
	8L1bwoFuod9HvSflCR5dxP2xsuWpUFxBS2RNSOo5bpGrUo/Ef9Mb3wtlqJtN2Iwn5l94nH
	IdgU1Z0yLao9BCTFcE+R0o/ui4fP8F0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-ef886IO-Nj68ioYdd9rpXw-1; Fri, 02 Aug 2024 15:02:29 -0400
X-MC-Unique: ef886IO-Nj68ioYdd9rpXw-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7a1d4335cceso677749585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Aug 2024 12:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722625349; x=1723230149;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3mGGPNMYW+PwVsxgLN/1XKLLl4dJIQ78l9NLO9EBmCQ=;
        b=rMCrII5eILIz/uX8ViwNIIRJuHvjc2mYP0hfheCzne8FXuof0mecGML9alhHQjyuyN
         gll/hzWGvvEtNn5isW9UWKUk/jccG85504TGj1JBhrsH2sngDNd8x8VvBUkVDOAeEn00
         4Hp32fiR26MCOb65ezu7aoxb5FxOh2HLDmzekOKfQzi+hnoZrU8mTkeYN212jro9c7n0
         +CLpSsbx3qnuP95W55GsLtixsdxneb/jZ2c3WbUAP82YMBSqmsXS1U3RN7pZdmYaJjpT
         KECGF6N0W6m4io8Gfz8dXcPrtcPwvnx0YAs2LKQD3odP8NBBb6ax4nRdOj09W+SXHxQK
         apUw==
X-Forwarded-Encrypted: i=1; AJvYcCUrTAjmCfDY44zIo/JV/s6WmwBHUjTiE5ABMarhnuAxd9sbyAPlBeUJKSKQYqHUT/R4BtgXjc+BYTMlQksy9opsN5UtjA5EDC8Em4RCUA==
X-Gm-Message-State: AOJu0YxIEQZqdu34yXXuWTz+KbuC35vRuPrwxRANhRyhSIYNp2yd66z1
	JshXjW5LgJv8L689YHPFeC79JaQgJ6p7WIKNuYinO0S3VNUkbbyA7ZOHtNI7AknjdZemwSVjBWD
	jFreGog1smqvc+sfC4E/+WJZlAzu/Kk7VVXnnau9hMAzg6TudIegh1saQAw9q9ShFR7HVWZY=
X-Received: by 2002:a05:620a:3904:b0:7a1:df8e:3266 with SMTP id af79cd13be357-7a34c06899cmr982696285a.16.1722625348944;
        Fri, 02 Aug 2024 12:02:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfNmVNiVUXQYiFVSaa9qpl6QZ/E/1LfvB87rHqYLChQThUb1cOPW5N5oeiv7xY8fOXZ6JvXw==
X-Received: by 2002:a05:620a:3904:b0:7a1:df8e:3266 with SMTP id af79cd13be357-7a34c06899cmr982691085a.16.1722625348564;
        Fri, 02 Aug 2024 12:02:28 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a34f6e7d6esm111860785a.36.2024.08.02.12.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 12:02:28 -0700 (PDT)
Date: Fri, 2 Aug 2024 14:02:25 -0500
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
Subject: Re: [PATCH net-next 13/14] net: stmmac: remove obsolete pcs methods
 and associated code
Message-ID: <ij562xfhvgxmvpgh2l6rhsvcpi43yvvkvef4wgpjupwusi6uwy@cpnkopeu7cpc>
References: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
 <E1sZpoq-000eHy-GR@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1sZpoq-000eHy-GR@rmk-PC.armlinux.org.uk>

On Fri, Aug 02, 2024 at 11:47:32AM GMT, Russell King (Oracle) wrote:
> The pcs_ctrl_ane() method is no longer required as this will be handled
> by the mac_pcs phylink_pcs instance. Remove these methods, their common
> implementation, the pcs_link, pcs_duplex and pcs_speed members of
> struct stmmac_extra_stats, and stmmac_has_mac_phylink_select_pcs().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

...

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> index 3c8ae3753205..799af80024d2 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> @@ -321,48 +321,6 @@ static int stmmac_ethtool_get_link_ksettings(struct net_device *dev,
>  {
>  	struct stmmac_priv *priv = netdev_priv(dev);
>  
> -	if (!(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS) &&

This change effectively makes the INTEGRATED_PCS flag useless, I think
we should remove it entirely.

Thanks,
Andrew


