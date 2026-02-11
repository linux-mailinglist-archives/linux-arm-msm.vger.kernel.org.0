Return-Path: <linux-arm-msm+bounces-92533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QD1TG/XLi2n7bAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 01:23:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CFF120476
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 01:23:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 878BC3048063
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 00:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9230C1E7660;
	Wed, 11 Feb 2026 00:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kWj7nfxl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665A91D5146
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 00:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770769392; cv=none; b=XzUN5wThBqSFcjzT0sxZcN1vqOoc4aJPROTKu70MtMoH51Zb1mezysXdIKtGaX4K7gwG/l/8Y+1BOuSFpnREeVygAfqalPVWyYue67vHHt23EWPCtE4q2nyVhqbwnqeAlGGzj24VxOcMb8DstULAxN6X6/AXYYR+5+VuSi5WX4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770769392; c=relaxed/simple;
	bh=C8WZi0z/u2y60Pf8uDacg4eZxEeOjHEhT72SWreY+Jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AwDkOUobS1CaUhTADScr9ixapTFDy1gwA5jU5N+uv0yfy/oaEtbNgjsxMW4ZUlkmCDoDcQIOVu3eLUFFuF81UJrPEAJQboKoaevux8a+z5+Y8OibiEzPmhpAIaczDnJGjLFRLe4ez0a9Wy7hh2N+VovuukAoBJS7YIDP9K1PyHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kWj7nfxl; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8c6b16bd040so609975285a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 16:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770769390; x=1771374190; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9/MaZcyv8F5yh3X5VNhCYnJaIE/OuTNMR/VFAInu+s=;
        b=kWj7nfxlLWjLA5LXqCA9TO3IzcsuojzY0pkehXBc+s3ZMsR2aRPPqFwHdMD+jxtfZ6
         bHKapokHoh8vLznCw+fYNdT+2zdkzcVVI5MslJ5ewErXsScMbiP9KOoD/Wt46/JZVEY5
         /kWlOnfK02LrFFPm43k3gLwImTpDKNL8/1O8MlS6uYh7Yvat5zgd/2PnVsQg8qpyQxgE
         Kew2VSoeRlpmk6i23ziFBvGIxMO703cR/p+oPk9A+yT4RJfRcfhrmnrb/xfu4H4CFtMG
         P2F0ejyGFdEJqkkuqRlvyqWNVFy8g2hqRyawL2PzSdkQ6Lo8RlL7Gk0umgnl0SuDJLgx
         Ot5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770769390; x=1771374190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y9/MaZcyv8F5yh3X5VNhCYnJaIE/OuTNMR/VFAInu+s=;
        b=hU6yo/ZC1c+L3KirkWRbBNHLq5FD+cM7Y8kYHvTJvFKy5r7YmRmI/QC73trZnNpXRo
         GwDcV688bL332HHAm/vQv7iPUZxs+IMqUjIIbqYmTthUrStkwk/Two7PmF/Du7mborWD
         N2hLEEKP9eRENu67fRHTpxbvfakQXlHSbw6ziDOWNTbhuBD0x2X4tOmUrj6CGsNRd1l7
         sW5tLATLginFmlMFJsOyVKay+reE36dOir9htmuu2tCrWLe3xmYvAc8ML8Ll2ugzYTfQ
         jw+dZcVSQZi2YF1rhccDbaZL1QP+rQ3+twung9diFzdEMSTWX+ETOLjHeiZNZU/laPLb
         qcQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwqPbN2QgW/BfFCM9u9U+KWttVcZtU/tkF786C2oln7AkLNIMn2G+wuaPuTmAb1bkmOwSqGk+IKlGpzbGA@vger.kernel.org
X-Gm-Message-State: AOJu0Yya/xcxCpJD8KEj/cksUwBuovZDg48bZmmzliKMEPtfZ+jXgv+W
	hcFW2YgTUbn2TGzmlYJydHUAbs21itbwXqrHfGgZ+s6MYu0oVHpuOWi6
X-Gm-Gg: AZuq6aIlVXQn1BJz6RQ72uHO4jZL/c4VAZ7j9t0VsXWISdkd2/MzcWOnfhs2Rw7Lz+a
	wCLZgYiyWG1hjcs5+oE80Y+2d4iE3GdT1ImSnPPJqKeCtRKr7s4gM+MjhHvFdX38c1u7m/XoPLV
	B1TRLVEmNvpvY9oPFrbXHSDgU/ZQ6asvxEfwxY7vvWeVqBctVZ/cZcnRnQGorDlxiJIcn/LtYZ5
	XUQcRS7iz0CPpWIelSKsyM32nzETfwghD6q0gQxVNVbYo9qOPzASzEp4QpuBV9T0pf4jf70I4RK
	xIOwIbP+sAuILRsuo7gKCsyuDQNI/m8fzR9+XGgOnZQKHueE5Vu3ydSVMHU1Deo8IATO7VVqiHG
	z3eVe6Gss1CZnMurJ0uC6irSnLeb/ng1z8bJjmvDvzeg0JaFgfY4/FnDx5hIgtkpmzmU7er0hrZ
	iGbTGQ1zGb4eCRKb4PJhCq6mJGeozCeeY5Zn+W
X-Received: by 2002:a05:620a:4045:b0:8c7:fdc:e87c with SMTP id af79cd13be357-8cb1f6ebe1bmr530701885a.51.1770769390235;
        Tue, 10 Feb 2026 16:23:10 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2965edb5sm27227785a.11.2026.02.10.16.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 16:23:09 -0800 (PST)
Date: Tue, 10 Feb 2026 19:23:36 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm670: add lpi pinctrl
Message-ID: <aYvMCCWxVPXQeRCZ@rdacayan>
References: <20260210021109.11906-1-mailingradian@gmail.com>
 <20260210021109.11906-4-mailingradian@gmail.com>
 <2b3d9528-56d0-407f-bd3f-e805cfdea5e3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b3d9528-56d0-407f-bd3f-e805cfdea5e3@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92533-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,62b40000:email]
X-Rspamd-Queue-Id: D5CFF120476
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 08:42:59AM +0100, Krzysztof Kozlowski wrote:
> On 10/02/2026 03:11, Richard Acayan wrote:
> > +		lpi_tlmm: pinctrl@62b40000 {
> > +			compatible = "qcom,sdm670-lpass-lpi-pinctrl";
> > +			reg = <0 0x62b40000 0 0x20000>;
> > +			gpio-controller;
> > +			#gpio-cells = <2>;
> > +			gpio-ranges = <&lpi_tlmm 0 0 32>;
> > +			status = "disabled";
> 
> Why is this disabled? We disable blocks needing external resources or
> being busses/connectors. This is not the case.

There are reserved GPIOs on the Pixel 3a. Since commit 4f0d22ec60ce
("pinctrl: lpass-lpi: implement .get_direction() for the GPIO driver"),
this can't be probed when the reserved GPIOs are unspecified.

