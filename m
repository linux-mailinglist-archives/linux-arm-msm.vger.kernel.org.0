Return-Path: <linux-arm-msm+bounces-47339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3447FA2E1B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 00:55:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FEF13A74DF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 23:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD58165F1A;
	Sun,  9 Feb 2025 23:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lb32Wsi+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04821243398;
	Sun,  9 Feb 2025 23:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739145316; cv=none; b=ORQW009kXf5uYGCuaSaPmaYkvnjOXEtjVphGGfcVK3xzKJ0aX7FqX1rseQF69bMj++yV/y7FIrOIsOrMUxIODFuyphFhcU+l68jwRu4AuvejfbFW+p4lruseAdtndWSKIrMQcuWcJnDJX2PYO7OPRtWJCmpV6srrkNw0ZWUlFcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739145316; c=relaxed/simple;
	bh=Vpgeiu3yPvEnpgOikzPLi0BpfjaIFxbh7rRt/NIbeJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L+x+L28fl6anfhgDzViGUfc1DPOq4MRgrvus+TYIUfpbftOJGUSI5gpHTYoG0os49xNVh+Fq5VPX+aR15JOuCK25NNrZS723GEfi72klFWEWt9Jrjp0yWATs7AmmfRJwX8QiSCKXASnpRTSE57JgcKoygKmhKfEpZb9B26N+ymU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lb32Wsi+; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6e440e64249so41858686d6.3;
        Sun, 09 Feb 2025 15:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739145314; x=1739750114; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5nOQRwLkPOzthZnSVbvgZOMtj7EqiDSr+E+m0fXEUDI=;
        b=lb32Wsi+41fEzA0XXmX9WBpPCmpf9v1p4rLjcfG8kaYr9cwZOBOnYPr2wCLT4NF/Un
         DAr9ErUsPKuQtx+YlgkB9J74lNrPVqz8mnZ6owWNc13q1a5lQwV1mVBw7sN7J7S67ZD7
         DMr3kQJQQ08z/oUrFdfrgZWSlH6COrGy5vYlIvG32AI+n+lQHRTsPT2OSUUAm+VMkvZ5
         K9XIwaqp6XoOJqMffZSGvVeBDX/bIB05PQo4zNKKupHBjvwquqycc9pS5OPQ2VJ4dfYr
         id137KuOfgrZ6sKfl4iLN2FtMvnbw7llyCehwhGvdWxXEWLAut5VrNUjXdeCvY+en+CZ
         ezMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739145314; x=1739750114;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5nOQRwLkPOzthZnSVbvgZOMtj7EqiDSr+E+m0fXEUDI=;
        b=lH9GRQiWO+s5WJ6Q6AFWloNyR94NVg19jRDSGJb6xkAP8jKPQRg0TNaIguo5itwqQv
         nfJ9bbb2w0I5ZM21KrtMaVhZyYfZ1+LCZPAllTtMZJABNju+pjTaO/lWSoHRErxDPDaJ
         +q97lPCeptkGyqmdjrPLuPiQ78V8E46nDk1hLEtYEXGTaKMfaa3pLAvsZAGf9YZMHAuA
         cWwOEXlG2DWCCxYn+uKePabkiY2UkmLmgI33wO1VLBw/4jO8NcI9wPJPqEJjOQIS5D5Z
         e0fYlX3pQRUtffMtIFGrPWn/MMOGoCChgM/WEAt0iR60+s3yWOeyZR//v22Wt8zu+t/0
         Rw5A==
X-Forwarded-Encrypted: i=1; AJvYcCUHF9U/Se/9OGosGSibQql7n7uj01zn+zL1jqWrldEsdqqpyeqVyjXYKog+yRD0+dgl4MgTBxCoq7GFxzdX@vger.kernel.org, AJvYcCVE8zYgHsIKNDd9ZmL+Ea8AQojWJ83ZOoj+zg8nbP0uBDJTNZPu1Z0yesJha3ECcNUWktsHv4kJm5R3aR2Aow==@vger.kernel.org, AJvYcCVJvpv64A581U2QREsUcqOfEk3VXUIwdGj6VBujerbTi879xq9KbuOeCChPXaQSmWtyTfxr1cBCAzcv@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1mQNTPqIUIG60oX0P7SCE8KJCkjBXX/mBNg3PvnnYhkE+KRsr
	t74CiAoqOOcIkJd2zqhjp7NjU8TsGCq3bEOehLRvkkqrdDeJ499f/2a+ycdX4ClBXx+JkbdA6zW
	hPuTgiVs6y9ljobJv0kkKblp8e9/CuYjdTyEdCg==
X-Gm-Gg: ASbGnctgmTM4DypdzpjBkX0IU0Hag7/hYq0TM2CN8+DdiYnchEbUTut4C6izV1JG6pW
	/BEwLMXTKgr6m6saVZR/LA1grQd661dmmmx7bRssdzzzJ6iNy2rN9Uh0D94FezGBi02bZJ5QZr1
	LFOWbZBfNJpyr95/ma9/wYEiE+2dsJxA==
X-Google-Smtp-Source: AGHT+IEG7ZZLTlsEAxtj8MSR9G0aKXoGrU8hXoe7VtxDZdV8GZUVZQqv8KFoC7NCPdeiBpqi+XVLJJbBKEDxtLCg3p4=
X-Received: by 2002:a05:6214:411c:b0:6e2:481c:3713 with SMTP id
 6a1803df08f44-6e445705b4emr150345066d6.37.1739145313923; Sun, 09 Feb 2025
 15:55:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250208-expressatt-bam-v1-1-8794ec853442@gmail.com> <3nz6k4oqwpcmu4miohcgv2wlhz3x5hluuytvkhe6txzg2njatx@icgiiyolzt5w>
In-Reply-To: <3nz6k4oqwpcmu4miohcgv2wlhz3x5hluuytvkhe6txzg2njatx@icgiiyolzt5w>
From: Rudraksha Gupta <guptarud@gmail.com>
Date: Sun, 9 Feb 2025 15:54:37 -0800
X-Gm-Features: AWEUYZm0n2GkopWIuHV_Pr69PyYfyWa0KwL0PO68lcp_IHICdfI57MUqOXBeUiI
Message-ID: <CABhZbsXkpbx_DxJsdPNgJuK1vcdEfxu-bQqz4NuGdfeVX+o=fw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: qcom: msm8960: Add BAM
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sam Day <me@samcday.com>
Content-Type: text/plain; charset="UTF-8"

> > +             sdcc3bam: dma-controller@12182000 {
> > +                     compatible = "qcom,bam-v1.3.0";
> > +                     reg = <0x12182000 0x2000>;
>
> APQ8064 has 0x8000 here, but I think 0x2000 should be enough.

Downstream seems to use 0x2000:
https://codeberg.org/LogicalErzor/Android_Kernel_Samsung_D2/src/branch/cm-14.1/arch/arm/mach-msm/devices-8960.c#L1217

>
> > +                     interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks = <&gcc SDC3_H_CLK>;
> > +                     clock-names = "bam_clk";
> > +                     #dma-cells = <1>;
> > +                     qcom,ee = <0>;
> > +             };
>
> Please keep DT nodes sorted on the @reg part. So sdcc3bam goes after
> sdcc3 node, sdcc1bam goes after sdcc1.


Thanks! I've sent in v2.

