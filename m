Return-Path: <linux-arm-msm+bounces-27024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D7493BFDB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 12:24:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0FA2BB212BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 10:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EFD5198A3D;
	Thu, 25 Jul 2024 10:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nhiw/56j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7AA1741F0
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2024 10:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721903073; cv=none; b=qzKDPPpuSNG4Ey9boOCkmn/9JMngCRA8CwmaJ+n7XVTjqvNRdO45b/s2r1fIbYTsK7OpDDY6mYbIV/BSOtSrqG0f/LLa2YLJfkUMElZFQO0xDSQq2T12rXxnTq1y/c5ynmwkyuUkIvsxmZapA+NIFP5Y01GGnO/JoZP6p1RLPis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721903073; c=relaxed/simple;
	bh=CwvaLmHe/vs0rLGhaPMxOTOImY4e3eJPnOPidzlP8+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uYLlBTHtOF7n7z5K2DhKov6F3Lde3RKdqs5L8FG5PBk+rlZaB9mexTk12cfkHEAJoF0ZHIAV7idzB4LEl+gC/CBIQVHZWL+/yc7gfC4tgKn7YSJWK4ZvMnx4vwr+UN693EVISXjjfKEuda2oz6iEdJIfKnxf0MjAZj3DQ7AK2LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nhiw/56j; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52f01b8738dso610460e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2024 03:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721903070; x=1722507870; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WoxYQNUTCa1T0SH6iTcHddQ7maMyu3El9N4s8NEmbaI=;
        b=nhiw/56jnuizFAnCeyPLNVQnh6Iu7PRZFMwcCFJ117cfMWIAgg8HRySx8enbX/UqdQ
         00//43FeX3eFqYWDpBc0IUr5fNRjzMcA2ugOHk/cGs/333CjT9xu1Cyc4y+yck5r8AQ+
         wsO9qOnOI4Gi6TES6BFSfghTt9VDa+AZI6JQb/XsKNxH/DWaU+e+Ok2FydwlH8hdJx+i
         ytN0g2jzN0dcMM2ZK/8aRx20eikd3OmmvX7SJRj+LMNezxZhAQXBpiA4QnYj6BbE2sHg
         CfgWQoJqQdhw4yOInCM1cg+zmoI3OUxbFvx3lrzVyU2Yz45ftCqhroxZ4dp3UnGo+0Po
         bJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721903070; x=1722507870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WoxYQNUTCa1T0SH6iTcHddQ7maMyu3El9N4s8NEmbaI=;
        b=jS34tAolielFd7686HqFWK6H26JLQvihDAaNEUr2sEWY9mHtxNCZ49txpSZGGZ+sN1
         eKVZW/IbVa3NhSZ/b1ypkdzYbxF14p2Sr2/F5VdowrSJzcINzcfr62VjH1OW34JA/5re
         p6WnLPT7waZuSKWnAQKj28afQ+rD04GQcH1ukGHsDNl431vQbn9KVNp/SfnVgsDIG8Sx
         Fh3Z2x2C7galcBB0KNqD0wTW8sNO9MKzHgP+jYFl/Y7GlmrpS+UOau+qKV2h7YP9x4tt
         KO2Ps42Y1WHFAQwLRnx7e8AwD2Z0XTM3fLe3srfQskza47k51KLpGO3tFAHCHbWB3N/1
         OFfg==
X-Forwarded-Encrypted: i=1; AJvYcCUpJQvUZPnUF4po5pnYsrxafQvVoawAQ7M+deHsTMxB7Jl4OakEXz73nBhP5whsWKz+thI49lbVjZx2vpJqq6ej4UQ0KGAFvtJWOUxANg==
X-Gm-Message-State: AOJu0YzbNqXekCH8vma10ORrh0ZCLF1oD/UpQY7taq96a0tay1+pbPt6
	Dlv+57/HRlUqpae7g28rxNyASrNG/Rx8EfwzHRNCPBGXZd9I/Ba8y8Hrf/2Ij6o=
X-Google-Smtp-Source: AGHT+IGON4hLG0hEzvd0Z/9nSbx4Zc3GQMs6yIMVvA/tKBhu9hBIRLjsY50KwApJu8PHZ19IjLHfQA==
X-Received: by 2002:a05:6512:3e15:b0:52e:7125:c70a with SMTP id 2adb3069b0e04-52fd3f7e820mr1730350e87.47.1721903069556;
        Thu, 25 Jul 2024 03:24:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c196e7sm175346e87.190.2024.07.25.03.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 03:24:28 -0700 (PDT)
Date: Thu, 25 Jul 2024 13:24:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: PCI: qcom: Allow 'vddpe-3v3-supply' again
Message-ID: <pbkzwy63j7dh365amgdze2ns4krykckqyx2ncqjw2u4dufuoky@fg6rdpnqh5vb>
References: <20240723151328.684-1-johan+linaro@kernel.org>
 <nanfhmds3yha3g52kcou2flgn3sltjkzhr4aop75iudhvg2rui@fsp3ecz4vgkb>
 <ZqHuE2MqfGuLDGDr@hovoldconsulting.com>
 <CAA8EJppZ5V8dFC5z1ZG0u0ed9HwGgJRzGTYL-7k2oGO9FB+Weg@mail.gmail.com>
 <ZqIJE5MSFFQ4iv-R@hovoldconsulting.com>
 <y6ctin3zp55gzbvzamj2dxm4rdk2h5odmyprlnt4m4j44pnkvu@bfhmhu6djvz2>
 <ZqIVQzQA5kHpwFgN@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZqIVQzQA5kHpwFgN@hovoldconsulting.com>

On Thu, Jul 25, 2024 at 11:05:07AM GMT, Johan Hovold wrote:
> On Thu, Jul 25, 2024 at 11:57:39AM +0300, Dmitry Baryshkov wrote:
> > On Thu, Jul 25, 2024 at 10:13:07AM GMT, Johan Hovold wrote:
> 
> > > It is already part of the bindings for all platforms.
> > 
> > It is not, it is enabled only for sc7280 and sc8280xp. 
> 
> No, that's both incorrect and irrelevant. It is used by msm8996 and
> older platforms by in-kernel DTs as well. But the point is that is has
> been part of the bindings an cannot simply be removed as there can be
> out-of-tree DTs that are correctly using this property for any of these
> platforms.

It can not be removed from the driver, but it definitely can be remove
from bindings.

-- 
With best wishes
Dmitry

