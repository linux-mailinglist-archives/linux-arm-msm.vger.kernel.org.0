Return-Path: <linux-arm-msm+bounces-27799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 649D89462BF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 19:55:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF59E2823BF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 17:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6027E15C124;
	Fri,  2 Aug 2024 17:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="et0HRwr9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FB31537CB
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Aug 2024 17:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722621329; cv=none; b=T7FSkl7IrXwwVhFx1ae55x6S6Kmq9gNSq5SWpG527hJ75jfbITKx9xjXg21n/c2zF0qkLc/ca/I90HNMRe4/xJl/UZprv44tyb6mVanLS5am4IsqD8fJ21L4KtqLtz6lo8Uj3pFyXT8BR/fGX/Jqm2vFhwjvUQyWTuCpw4GYQzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722621329; c=relaxed/simple;
	bh=BUt+yk47QC8u8sxCCzSSGLY3xmfY6eBtRyfTRA+BW70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uqk57Qnv8yP5t8gT/DRUYBuqtcoakm7A/YpX5HkLQIJJc7UdXPDOSyE6JFEhZ+V/PKYS1evBBiGRRlnFGKGR3ZqXrXfrH2N5CWctdCEfO+QJHQ3iuRs3lmJfJKh9cc1q81I+zjVSYTE9OZvckfx24GVMfsowsuQ9cCoud7TIAyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=et0HRwr9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722621326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mSKMynH7mqtKWkD5s3WwP3QMfudW/geCCwMv+N77MHg=;
	b=et0HRwr9juix77jxhvxhU/qc/9OYLIvxDK71ZNCF/8dAAaiu+n5zpk+HYH4F6ZPzJ56ySJ
	1L9oa3NvKOmbzgLIJOq4BUKGt2jDX1OiDaxeTs3bofSilX8NmYj61VV9ti+IoV8fnJdkuJ
	eKn+9OXsccpaA5Ea79qrusvCy3hvQ34=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-1KlSJmJiOkCKzIsFwy4Cgg-1; Fri, 02 Aug 2024 13:55:25 -0400
X-MC-Unique: 1KlSJmJiOkCKzIsFwy4Cgg-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6b79d1eb896so115201366d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Aug 2024 10:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722621325; x=1723226125;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSKMynH7mqtKWkD5s3WwP3QMfudW/geCCwMv+N77MHg=;
        b=PyEI5UgXy2feuWkRedup7vuBlnmrdczcMlumTz+rAcivuZpAeTo2kY1C21STQYdOLi
         69MdxSwfFOY5hrO+GyOJamIR1+6peNaqmRyK868IfCWXoeyV/+bUc3uL27pHcxbavxZb
         pKHmVDjnpfyCX8j6+Wu0l2JXER6bB1e0mYOzCGNG82hh3ipKma3N0H7R3fnjj9JZisbF
         VVRVWhN1l9fj02/mMDaRcsE1InGyYv1fgQvPb4j5DW6aIX3/g8qB9rMHG2uB/X++HKu/
         uGV7YguW4cAg83TPaxOAC9ujRALAUg3Mr47P+eRknuhC0783k4j+Geqw/vH5VbLXNxct
         9axQ==
X-Forwarded-Encrypted: i=1; AJvYcCXodKPkYOKcfFqGALqqXwpEYXkeLX5E5RSz5yc1Bxyil5am2O/rqiKLFD0fpOjqEUAnCAPA4xttjljHVmc6qUPM3aUfDBVMtADhhYRcgQ==
X-Gm-Message-State: AOJu0YzGnD0yZp/MisLaSeaz9ERi5QEV0W4Up77bd7kVx6LuogNyCZ1R
	bsPDhSAn/ESWzfYXyFmzdBud0WHywer99GpeCMv/cfdo0udF8FhILu5mNVqF54hAW09w8gNMmDP
	WQr635kQXWmK4m/lS9E5O4dymFQcAIeaoIRhMUv8y9OKD0aN8JsCVZFjUgk0QK5o=
X-Received: by 2002:a05:6214:4906:b0:6b7:a1aa:994f with SMTP id 6a1803df08f44-6bb984930cbmr43871546d6.45.1722621325077;
        Fri, 02 Aug 2024 10:55:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvfmiXBn0WLDUS/+iZqeB7tPbwkJPYVpv9lxcQTRxIly8p6qsOwWEvqQVQyo1Xl6zPYGN0/g==
X-Received: by 2002:a05:6214:4906:b0:6b7:a1aa:994f with SMTP id 6a1803df08f44-6bb984930cbmr43871396d6.45.1722621324736;
        Fri, 02 Aug 2024 10:55:24 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c839787sm9000496d6.99.2024.08.02.10.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 10:55:24 -0700 (PDT)
Date: Fri, 2 Aug 2024 12:55:22 -0500
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
Subject: Re: [PATCH net-next 01/14] net: stmmac: qcom-ethqos: add
 ethqos_pcs_set_inband()
Message-ID: <fc77km3ws5ucl7w2oyi3w6gvr6ovkzrt5tlhzh47qyowrak4hg@bqpjm5jgygbx>
References: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
 <E1sZpnq-000eGq-U0@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1sZpnq-000eGq-U0@rmk-PC.armlinux.org.uk>

On Fri, Aug 02, 2024 at 11:46:30AM GMT, Russell King (Oracle) wrote:
> Add ethqos_pcs_set_inband() to improve readability, and to allow future
> changes when phylink PCS support is properly merged.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>


