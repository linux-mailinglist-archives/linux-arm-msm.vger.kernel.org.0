Return-Path: <linux-arm-msm+bounces-89067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED992D21375
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 21:48:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C79E0301AE25
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 20:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D82C356A1A;
	Wed, 14 Jan 2026 20:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HkgeI6x8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD99F2DEA90
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 20:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768423730; cv=none; b=FDyhBB4WVtFCA0JnbWa4RAIz6LK/dKI7LVzrTMOcVUG8Sc22zAVCuDN1GPQXmY3ZyY+lO7/FHf6CzSfwcz8C8P2y0AvSY7F+b6zK26U6rjS5s9+MmQ7nsQ/ODjT8QXtrSvZZDtX3hT0gaAHFYq3m4/E+yGlNU3/ESkTBw5NF/rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768423730; c=relaxed/simple;
	bh=8QxqO3FSD5L1Vmub+oryPemAGs1Qef51fqxuqIV6Ei8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bb6mtrK2/nuz9YbmLkkjEmCI4w3BSQuj58WAZsNcHMQ5L7Y+cz+sZP4gJHWXZDqyM3P66Ekh1Hf/aY9IOSdzUORiQyE2JNSK9eCEIxKjI/Fdvd8e9Rsy7ALLo03fCtv47/Zdk5ykTynUOe8yzOog9FnZKGfJBVjrMrw57yUA1/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HkgeI6x8; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b8712506a3eso2985666b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 12:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768423727; x=1769028527; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=it8YUnHSXKXXQABJkL2UVvwmRP+gSrkDN7MsvYyaZ9k=;
        b=HkgeI6x8JApyEaDjNhQ3sd86gY0G9OYvP5k3LL1uuwJmqPQ/TyhW61RyQ9UYPa6N0d
         LSOtrj2RXe9k/0Znk+B6N/s5HM1ai5pQI3BP9FTw2WjAYA/zYHKuEWq2sDrLvRnTzP50
         z+3M3gNDsoNQCOcjqkXnMfYDm7hlykRa3fFQp8VDsGAk2SVnsraMzjB80BSnzRuMhK7i
         rMWEhPdQ0uCPa+zsvjZyFyFOgkQ9tM/Gg6osE8baYvMGvZPqEQhcPQPWcPF9zKQGB/H8
         NAtAmu0O2vYOy1TdPU2fcscVVhbjnlINXj0KghSlD8dZVoUrI2UhKs7mKfpPeyej3dKL
         XS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768423727; x=1769028527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=it8YUnHSXKXXQABJkL2UVvwmRP+gSrkDN7MsvYyaZ9k=;
        b=fksOj/rw+w/QkcBzL3Ew/xSviYPNkL1k6Iiw6dUbR+DNJgPFllHy3YoowHBdCNSAxr
         v3z6rKgrqEVIcMntVJRftRA8wRudbewHR880NLUjMi+aFWqwGRisE8MJQfApYdQe6kmc
         Aqpv83DG3oeEks40AZfRb86lajdTT3im0BlLYnSz2TKzfM7njXRq/PVTS5dbcDkKFXbg
         Wjk+i0QzxVHYZljpUkuPmVyBAmmRYFiQlavtrcJ+JdF29sFjht7G/rF5aed2JP+cGHIm
         C+MtAKCACq4PBchQ5wpNoVamB89bPSkRmwecJB5ClT7mbiiKKhiBw5cTpcYQ/kouCAQC
         frLA==
X-Forwarded-Encrypted: i=1; AJvYcCVxr94RYYebBJ6jhXBQ54FHFFQXth2BOYhXrG8Mw21V0owtiAinhQ+YbCCJHjDmTW5y2sS/52QHFcgA/UVJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4Pa8M5zt09PzDyE0krbZJ13fIty7i7txw01DOicfQYLe3I9x/
	v9DRHrFEoRDj7314zlsh+N70nQ545VilP3AVsixiUkBTmf9tCJA++y/6
X-Gm-Gg: AY/fxX5bBnMmL4TYB3DKVAVmCjUPDeszWZllASB/bRbLw3LzWKUiJ1CwkF9dkcZKGdB
	0/qRy4wVGd+gAXdE5DTfWWTDpOWFtDDWKb8RR+juBZ33Ep/nsnJEV2gwpZwVMdoBwm47lFEFZFZ
	vn5rgKVch5E7qij8Zn3um41MGPE1kmfNfIcYDjCkNSJu0kMr++CbHuh1CdvAHJorvfM3VboOM+q
	janVwIloHBjziB4j7wkfy6M+pIYnHYG2pnFwlX4MNexkz/K8fc4S9jeYC3/B+OONVUjxeiKeRUI
	ufgPwfhrcEvPuhop6CCaCmGDD9ZuMNaAIwzbrVAhFR8CAu0UzatbDAFxvg6Umsyko08/Pyprv7l
	FV4IeqihQqwPs1+hUejcwaV05C6w+FLkgsRH+CGoyM/7ibRS063hkrJTb0yUpNrE703OnA0XTxw
	AVbCs=
X-Received: by 2002:a17:907:d1f:b0:b87:2780:1b33 with SMTP id a640c23a62f3a-b876114f9b7mr180435166b.3.1768423726590;
        Wed, 14 Jan 2026 12:48:46 -0800 (PST)
Received: from skbuf ([2a02:2f04:d703:5400:9b39:8144:8a26:667e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b870b0dba4esm1111374666b.17.2026.01.14.12.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 12:48:45 -0800 (PST)
Date: Wed, 14 Jan 2026 22:48:43 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 01/14] net: stmmac: qcom-ethqos: remove mac_base
Message-ID: <20260114204843.e4pyfb64n5jn3wop@skbuf>
References: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
 <E1vg4vi-00000003SFh-0Abn@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vg4vi-00000003SFh-0Abn@rmk-PC.armlinux.org.uk>

On Wed, Jan 14, 2026 at 05:45:14PM +0000, Russell King (Oracle) wrote:
> Since the blamed commit, ethqos->mac_base is only written, never
> read. Let's remove it.
> 
> Fixes: 9b443e58a896 ("net: stmmac: qcom-ethqos: remove MAC_CTRL_REG modification")
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

I think we reserve the use of Fixes: tags for user-visible issues, not
cleanup of dangling variables. You can move the sha1sum and its commit
title in the main commit message body and delete that tag.

