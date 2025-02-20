Return-Path: <linux-arm-msm+bounces-48629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB0FA3D564
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 10:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1641D3BB6BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 09:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C951F0E50;
	Thu, 20 Feb 2025 09:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T3FUE++P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DEE1F03D9
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 09:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740044879; cv=none; b=CSUH7Zd4iiSt+kmmwRRvW3JckytdlETcwHhANTCa1ouaEGA6TaJUR94Gn+eyh/PJOPX0KrsYgpE8Lik7qXpYaG6tmu1xhphEacwOtuh2j7c9gqVDVUMMLUlcgDzbTWGRu9yvDPgZxVe2aPJQ8VMKk8aJqFkNdaf0l7IEG2PH3IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740044879; c=relaxed/simple;
	bh=IWsg9d6lbEashhnUPHSkRjmEXhpeKPSMS9vOhHCIlfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mb4YFA6kx0CYshfc0qddU4qW+5SBSKniGuruVWzphkJqVDxwLBnOF2pdi911SKTOHiALLt9hYAD/lq2GgMX6LsRkik2FrLA+Ti2qHnHA0eODu1LE6JcIoT88dyyQGZawch31JJgCLrMI0OmDkBiVc9e7j3Ch5/0mn4yZJRE7dyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T3FUE++P; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso6521215e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 01:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740044875; x=1740649675; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3C+kognpjmHLZgIVXwXKpXpKvfpiYLWcBqUjAjWp7Tc=;
        b=T3FUE++PN0U3+a3SEBSaJHD8QqhO+UgkgQYM8dZRMXZTGqpAYZyJgQT0Q1+6jGr07H
         H/iUU00igxlY5xiwrjsc19xEVFpDgGInfAqueY4x3/u4hGxRg3JATpGpYuMbtOAnuilk
         MXfFw17oXJIEnn2s+1bTZOg920iciE+LRztDeurB7uIsV1j3UQQFZ3O4+0jWkcyvf1ca
         82mvTdeOWU62CIiq8nCmKCtRc/Hsg/Q+wuS7wV2OIJiyuee0tC0WsLCdj1zUQgiTbC4u
         qHmGahno5mqJsr+fY/iMRbFD/Vl1pJ8HWZfCVueAYZw1spkCPghqbvnjm3snlyEnP747
         b1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740044875; x=1740649675;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3C+kognpjmHLZgIVXwXKpXpKvfpiYLWcBqUjAjWp7Tc=;
        b=gbNuPKzI3qVe0OfoLcpfiqCFGXy8hcSWszDQkk3wLsjpnHQJoT/48k+i8rr9Kn+kte
         kAiuKz0NEnEMKT0LwAWRfVlkfE1ZACIz72RjHb85wqjEmVG+J/gcqewRRLnDQ3/CIezc
         1BZxo0Ol+7VfYAbY3new9nPvS2tpJajlLTw8VZGnVILuPiPGOb23xNfQLpMy4B0NrUHR
         Ve24U6jdomhmRRrxPiQFgctAJ9FNzjbhst4brr0qM73P4PXCbmJclgV3xzX+pqszOM3r
         vQRP/hhNJX8dPxMc5Nkg6FpH/lpPW86R4bqxB7ca4Azg18Dld5PZio1pGGD14FnSPu2z
         uK4g==
X-Forwarded-Encrypted: i=1; AJvYcCXyd3WCQ8nd4qcjlWqkKAGzI79kLYpg5T+WlqiB50x090qcdzrWCCqXjtnCySAseo966A3JwjfPS3iQgozX@vger.kernel.org
X-Gm-Message-State: AOJu0YyqxkqH+ZMh4VQikPEbwdr0zXtq2z0qYxJben7AY1u8rftKk+V5
	4dW2ao2ipgre6bhpcZ8D0y+6sQwIrBsuy+gk3IlnP8CLs0JIZfb2hXmWhlvqcwBr0eQP5mmZq75
	C
X-Gm-Gg: ASbGnct947s6rC8UycmpLuKVv0AoENHdE+VdqJESSu+1OObIRcs7gxZi+6dXfK3DABb
	jQHojYGyvd592adIc5P5Bz0PMpWYIWPjf5zxFrW+BuomH94tatpMcy2DjauKDyocX09I0CcnKqd
	jKur8e+5JhA8UzPyUR/uFyl/oiaHgxw/lWiL2+B/cDOd7LNXVwLipUwtdfsjhk2p/kPrmH2NhKl
	d6JKmKGDU/lvrSp2PzXnUSazewxNDU4OIVlx6hv+pzAyHkaar+DLgsaadmZBDZXnB/ap8U9PqNm
	Rc1HrDeJp/GqvD94JzSeqKmaIRo=
X-Google-Smtp-Source: AGHT+IEsCez3GPLSZunwwFDyUVqq7Wkm5lBgpW3JvRE36iu83J5JlqvN9UXFhpA6HMjqTat9XWSXuQ==
X-Received: by 2002:adf:f08c:0:b0:38f:30c7:eae4 with SMTP id ffacd0b85a97d-38f33f56507mr18120522f8f.52.1740044875163;
        Thu, 20 Feb 2025 01:47:55 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:b30c:3d94:4d4a:a6eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f561bee3esm5514525f8f.21.2025.02.20.01.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 01:47:54 -0800 (PST)
Date: Thu, 20 Feb 2025 10:47:49 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH 3/3] i2c: qup: Vote for interconnect bandwidth to DRAM
Message-ID: <Z7b6ReQdDtAUn5GP@linaro.org>
References: <20231128-i2c-qup-dvfs-v1-0-59a0e3039111@kernkonzept.com>
 <20231128-i2c-qup-dvfs-v1-3-59a0e3039111@kernkonzept.com>
 <5dr5ps4vb57xj2mfelgsxgoyrr3gg4ggwqggqchff6pda3ffsn@thxpg4h6kgel>
 <Z7W1EJ7uGsaTZMRh@linaro.org>
 <sc54ro4pwg5j2lqelsryx7cdw6ipcdp4gfk3ce5sxsvk3s7wzp@wup2pgdzmxtl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sc54ro4pwg5j2lqelsryx7cdw6ipcdp4gfk3ce5sxsvk3s7wzp@wup2pgdzmxtl>

On Wed, Feb 19, 2025 at 08:30:35PM +0100, Andi Shyti wrote:
> On Wed, Feb 19, 2025 at 11:40:16AM +0100, Stephan Gerhold wrote:
> > On Wed, Feb 19, 2025 at 12:02:06AM +0100, Andi Shyti wrote:
> > > 
> > > sorry for the very late reply here. Just one question.
> > > 
> > 
> > Thanks for bringing the patch back up after such a long time. I've been
> > meaning to resend it, but never found the time to do so... :-)
> 
> We have a long list of forgotten patches that belong to the far
> past. I'm trying to revive them.
> 

Thanks, this is much appreciated!

> [...]
> > > > @@ -1745,6 +1775,11 @@ static int qup_i2c_probe(struct platform_device *pdev)
> > > >  			goto fail_dma;
> > > >  		}
> > > >  		qup->is_dma = true;
> > > > +
> > > > +		qup->icc_path = devm_of_icc_get(&pdev->dev, NULL);
> > > > +		if (IS_ERR(qup->icc_path))
> > > > +			return dev_err_probe(&pdev->dev, PTR_ERR(qup->icc_path),
> > > > +					     "failed to get interconnect path\n");
> > > 
> > > Can we live without it if it fails?
> > > 
> > 
> > of_icc_get() returns NULL if the interconnect API is disabled, or if
> > "interconnects" is not defined in the device tree, so this is already
> > handled. If "interconnects" is enabled and defined, I think we shouldn't
> > ignore errors. Therefore, this should work as intended.
> 
> yes, because qup_i2c_vote_bw() checks inside for NULL values.
> 
> My idea was that:
> 
> 	if (IS_ERR(...)) {
> 		dev_warn(...)
> 		qup->icc_path = NULL;
> 	}
> 
> and let things work. Anyway, if you want to keep it this way,
> fine with me, I don't have a strong opinion, rather than a
> preference to keep going.

I would prefer to keep it the way it is. It's okay to omit the
"interconnects" in the DT (either for old device trees, or because you
don't define the "dmas" either). But if they are defined, we should not
be ignoring errors. -EPROBE_DEFER definitely needs to be handled, but
even for -EINVAL or similar it would be better to make it obvious in my
opinion.

None of the existing users should be affected, since no one defines
"interconnects" at the moment.

Thanks,
Stephan

