Return-Path: <linux-arm-msm+bounces-27801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A379462D6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 20:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC080282A0C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 18:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F4215C143;
	Fri,  2 Aug 2024 18:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eEm4ZIHs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5814F1537A3
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Aug 2024 18:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722622129; cv=none; b=sWDY76Y1iOy2S0P+RQm+Ktnnv6bAnb/WUDyDPPw47fsg9VQlx0yM1Ziv7RJULVBe9uorTq9yNTV32L4RMkfhJjraCK2lIxEwCeQ/diWn2qL6OUXfrkVDOJTg4ZFuO8vjEQiud7uX8Fet2QomtYGtEdcRsDTMwL5T7TJJ2/zlphU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722622129; c=relaxed/simple;
	bh=1hzYSWBmFCCK+uKRWu72lLr8Q2S3/C2xUqeMNQzuPLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ehPC2BRAifforIHG2Mt5ORoYAsPZPQeVz8cv0PxFRVEURQV7TaaITlUDHJmm8eszlVgpMYEjKie8ruZbLbOAoX3RBGzXscR8AsX658iEy+Wzgb88N30beWav+UvyHdA88gB4ihlDPT7pjieHiHXHwvk+zNbdlheSIHTvPwFom4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eEm4ZIHs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722622127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aLcM9MWhiHw0bs3x9mpTiGnVhWovcyriDIOcsgAYyLw=;
	b=eEm4ZIHsmHB8KAbxxQl05DzR3RhxfLLVQQ9X4oYdae88UulzP1/sqNFScbxv0+OOzsUyDv
	+U+QnVzFH/LACLklpl9qKFVTztv421/xgRtSoPpi2NJAeoun5sPKeCa1e2AyHgueBMbACV
	JuYeTJXCxmyJfnkxM176BTEJ6dA1Eqw=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-ceBXV_nYMjCUxd7sJzQWug-1; Fri, 02 Aug 2024 14:08:44 -0400
X-MC-Unique: ceBXV_nYMjCUxd7sJzQWug-1
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-26106c817baso10682087fac.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Aug 2024 11:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722622124; x=1723226924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLcM9MWhiHw0bs3x9mpTiGnVhWovcyriDIOcsgAYyLw=;
        b=wnoFD6U+GJGy7ibzwFFhAoouk8gZBFxM7mtVkWX1WO0YVnRy4R7eqShMVKTetl+EVK
         CLSkVJqIiI3kWKVYYi34KHP2HWd8c7lb96DQ18PvKxzmBBIMXSN8dZ8gkxy0u0gYglWp
         ZbN7k0I2owfjsRgZSJ3xtrpm/fFHu/0dPG0BXnwuv94FYDWk/Gyb6+AxCtf+pUnxpUKO
         O/nx0KO8nDLOhy/6WXTbxACrhZvSsPby+qUtjvXee+cvb7zaI3fZ6g2HEmV8QcFZBTH0
         9EdZQxqgoY4IjthCNlKbsdpNR8tSHTTR342+Vbl8pYOFrCHYdAwiJZrFfd4jtbnWF8Fu
         GjFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMNPpDpDsp9hHTfPwVUnFO9NHka0FQWtKPUuVhkvndYN0J8d1b6frdEA8/2sAVKnr853PnwDyRmhbrXXVotRR1yBQ4nw/dCkhJ3PwSIA==
X-Gm-Message-State: AOJu0Yz4H1VkGxApKFDvk/AoQosbTh/wAHsoaP7iPf1ZFEeJZj2j/Hn5
	MIZD3Eh3on4W2sQpbfAQGi3eDZr44bsMlj719pq9rwSwqzV+ffTCOdZqmNToCVmoTlmIE0HGPum
	MgKvwe5ggVl48JTnUpFQVoEYyeyp8CQbCEkv1Q6WWfNYEm01o9VjIJFKSK0l0D4o=
X-Received: by 2002:a05:6870:b528:b0:25e:14f0:62c2 with SMTP id 586e51a60fabf-26891ae014cmr5007845fac.3.1722622123954;
        Fri, 02 Aug 2024 11:08:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFR8xANvIW9PT25/s/1o20v300D34AcEqg5SxNPaonYq0aR8vsoes+Ti9UOB+gaVvGdCgqf3A==
X-Received: by 2002:a05:6870:b528:b0:25e:14f0:62c2 with SMTP id 586e51a60fabf-26891ae014cmr5007818fac.3.1722622123595;
        Fri, 02 Aug 2024 11:08:43 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4518a6aaa56sm9123001cf.16.2024.08.02.11.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 11:08:43 -0700 (PDT)
Date: Fri, 2 Aug 2024 13:08:40 -0500
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
Subject: Re: [PATCH net-next 03/14] net: stmmac: remove pcs_get_adv_lp()
 support
Message-ID: <kse4bj55hlnwsmidecriuqvkxj6i2fh6eredcd37jia7u7djbs@gcpastryv7jp>
References: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
 <E1sZpo1-000eH2-6W@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1sZpo1-000eH2-6W@rmk-PC.armlinux.org.uk>

On Fri, Aug 02, 2024 at 11:46:41AM GMT, Russell King (Oracle) wrote:
> Discussing with Serge Semin, it appears that the GMAC_ANE_ADV and
> GMAC_ANE_LPA registers are only available for TBI and RTBI PHY
> interfaces. In commit 482b3c3ba757 ("net: stmmac: Drop TBI/RTBI PCS
> flags") support for these was dropped, and thus it no longer makes
> sense to access these registers.
> 
> Remove the *_get_adv_lp() functions from the stmmac driver.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Clean up seems good, I'll take Serge's word on the IP details here.

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>


