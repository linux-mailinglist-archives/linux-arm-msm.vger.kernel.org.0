Return-Path: <linux-arm-msm+bounces-44503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6C8A06D0A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 05:30:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 911E9188542E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 04:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ADA820B1F1;
	Thu,  9 Jan 2025 04:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="arIkq6Q7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DD520ADFA
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 04:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736397050; cv=none; b=CYPdc/4u1bLSkg1ILOXv/qaOMB6YUCgyEG2IyVDexBwUdQZu/e8Nbt01LtsIAQWqSLGtY3wcOXE1X4gA1FPMubTl6HH107mJSHmAHuq0fi/bt/RWQfHEi6VXx8bm3Uz0VFNmETm6n2fR/beVOW+6mV609+epVa2QntDMpZ8Nd7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736397050; c=relaxed/simple;
	bh=CjYGWC6pFZDIgl1PfQJLuOA8BUchnTEqOb54FQCWCX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=omU1TlY04pPBbbxbVmQIVmHHZvOs1/EpFj8e8x1ukaVz+6AKgxwBPGNE3LYnUNOzynFTVr2YfKdcIcGrcma8iLRqNOVRhNgKqQYISqiD0vnbIc+qhLg6fhfg8pLeL7pkWlhJYXj4tTBbUXXppMjF++akU9bf7otkn4vyag+QUYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=arIkq6Q7; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-303548a9361so3162881fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 20:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736397046; x=1737001846; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U6ZRjLdBCnvLSbysb/UpNAvZFmTM2Tj8k+ivRI6MKJs=;
        b=arIkq6Q7D5v7Ia0cgCWHLuLcFX8s/JTC3bT4i+Y1fubCKOXovNcandIEibMxNpZBB9
         tMPpytI7t5CwzsMR2yv4pjSVoLGXdg0TOxwHhd8HpB80m2GEZfCW3X0cfn21aD1F3E8h
         MCQu8N97sUMI5Jujr4SL3YjtB6tm1CDs3BBPFOQZiESDtPoLALH41oaq9WFA/ypoyc8o
         xfT2b2p+fcyqrW+laA8CAKG81RU1+3oC0rvTF6OJdyolhdwmqle2yriNbTqZN2eq5j8x
         smLY28XReX1KoU9bI/i3vYxR4nVL6r+6UKE7fwNaWuveKda93ZKcPbaPJaCSSl+3baEd
         6HNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736397046; x=1737001846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6ZRjLdBCnvLSbysb/UpNAvZFmTM2Tj8k+ivRI6MKJs=;
        b=sZW0BSwZoiV0nSvYopKxfUL+xtfwf7hxnur3B/qeNjiKEv2+gxluHUBjiPNW/6PzcT
         yWN8idgWkgaMfuyGVQL4tCZVd91/V4tDC1nmAu10zx3MMzJGeSq9DsHsLCm0bWnUdqdA
         ee/mG5ZX/SZGfsvV5AOogZuavIS1PKHPWVKY4F3LteYdbwVSpQMUKwrxOx3gTdQSEhC2
         zHzCEi5JEJd4y32G2/zLIXKZdK9hg2PqEMm/7hnezFB66/7km1VnPSzp6aCVt0HREcXS
         fb+juL2ytD2dSEy8jWluG3uxS4boY3oxru6veLEduTT25L9Ur7tyY3LgPl77cNWY3xaq
         PLtw==
X-Gm-Message-State: AOJu0YythMSlYEw/pcRhoQVyxY9jwvFLu07XAwxPGGepMao9UIoup+QF
	CWAsmMJQgtrk7ShEsBeB06eeYHWuGAAZzx5/AHMezZM0bJbdakQ+DIrGHnA1dak=
X-Gm-Gg: ASbGncsSX+wOd+RaozWlYng0N4K6cyxM1Hvwl1/N/rrKg8s67T1PhwfAgidXsHO7Uqc
	J+tlMxCzue6HK9ui+fkOlgBL21yacCfTHPYQUWvzkNNfM2d4z/9fSparKEw+7vuEMBTRmLCUNOh
	eUvFPpkjJ2C+vwf8dTmJG3YTK7+NI0dPyWPwPa+1+kQlsImUwdtnwq5PQtWgpwFIhDCa5BxHx/E
	5QDYrobmtRnk7JtklEpZChH3MPG1vHhQrkhKGyjPHI3byRA5nDKSVmxASdx/3FHcYKvo6L8c6Go
	PL7ahtXsZwj47+TLany8G3J29gzIGm3Jiesr
X-Google-Smtp-Source: AGHT+IGI95Xeh5elkDW79+sdKoMteOGmXNkLWQ3nBT794ETJS5RK6r49ksLB+H1XZatU4+ltRbTI+Q==
X-Received: by 2002:a05:651c:221e:b0:300:15d9:c625 with SMTP id 38308e7fff4ca-305f4587489mr13890791fa.14.1736397046212;
        Wed, 08 Jan 2025 20:30:46 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bec20absm73810e87.210.2025.01.08.20.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 20:30:44 -0800 (PST)
Date: Thu, 9 Jan 2025 06:30:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v3 1/5] nvmem: core: fix bit offsets of more than one byte
Message-ID: <wkcs7v76a52fiqc6znwr77kvzvz3hu2nwq4ijvek7cowurrb4l@cdgrohoefg4e>
References: <20250104-sar2130p-nvmem-v3-0-a94e0b7de2fa@linaro.org>
 <20250104-sar2130p-nvmem-v3-1-a94e0b7de2fa@linaro.org>
 <ae7f2d05-df0a-42e5-9e2e-586c35e5754d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae7f2d05-df0a-42e5-9e2e-586c35e5754d@quicinc.com>

On Thu, Jan 09, 2025 at 03:17:08AM +0530, Akhil P Oommen wrote:
> On 1/4/2025 11:49 AM, Dmitry Baryshkov wrote:
> > If the NVMEM specifies a stride to access data, reading particular cell
> > might require bit offset that is bigger than one byte. Rework NVMEM core
> > code to support bit offsets of more than 8 bits.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/nvmem/core.c | 24 +++++++++++++++++-------
> >  1 file changed, 17 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> > index d6494dfc20a7324bde6415776dcabbb0bfdd334b..c0af43a37195c3869507a203b370615309aeee67 100644
> > --- a/drivers/nvmem/core.c
> > +++ b/drivers/nvmem/core.c
> > @@ -834,7 +834,9 @@ static int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_nod
> >  		if (addr && len == (2 * sizeof(u32))) {
> >  			info.bit_offset = be32_to_cpup(addr++);
> >  			info.nbits = be32_to_cpup(addr);
> > -			if (info.bit_offset >= BITS_PER_BYTE || info.nbits < 1) {
> > +			if (info.bit_offset >= BITS_PER_BYTE * info.bytes ||
> > +			    info.nbits < 1 ||
> > +			    info.bit_offset + info.nbits >= BITS_PER_BYTE * info.bytes) {
> 
> Should it be ">" check instead of ">=" check here?
> For eg: bit_offset = 7, nbits = 1 and info.bytes = 1 is valid, isn't it?

Indeed. I'll send v-next.

> 
> -Akhil
> 
> >  				dev_err(dev, "nvmem: invalid bits on %pOF\n", child);
> >  				of_node_put(child);
> >  				return -EINVAL;
> > @@ -1627,21 +1629,29 @@ EXPORT_SYMBOL_GPL(nvmem_cell_put);
> >  static void nvmem_shift_read_buffer_in_place(struct nvmem_cell_entry *cell, void *buf)
> >  {
> >  	u8 *p, *b;
> > -	int i, extra, bit_offset = cell->bit_offset;
> > +	int i, extra, bytes_offset;
> > +	int bit_offset = cell->bit_offset;
> >  
> >  	p = b = buf;
> > -	if (bit_offset) {
> > +
> > +	bytes_offset = bit_offset / BITS_PER_BYTE;
> > +	b += bytes_offset;
> > +	bit_offset %= BITS_PER_BYTE;
> > +
> > +	if (bit_offset % BITS_PER_BYTE) {
> >  		/* First shift */
> > -		*b++ >>= bit_offset;
> > +		*p = *b++ >> bit_offset;
> >  
> >  		/* setup rest of the bytes if any */
> >  		for (i = 1; i < cell->bytes; i++) {
> >  			/* Get bits from next byte and shift them towards msb */
> > -			*p |= *b << (BITS_PER_BYTE - bit_offset);
> > +			*p++ |= *b << (BITS_PER_BYTE - bit_offset);
> >  
> > -			p = b;
> > -			*b++ >>= bit_offset;
> > +			*p = *b++ >> bit_offset;
> >  		}
> > +	} else if (p != b) {
> > +		memmove(p, b, cell->bytes - bytes_offset);
> > +		p += cell->bytes - 1;
> >  	} else {
> >  		/* point to the msb */
> >  		p += cell->bytes - 1;
> > 
> 

-- 
With best wishes
Dmitry

