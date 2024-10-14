Return-Path: <linux-arm-msm+bounces-34363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DFB99D63B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 20:16:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B9A6283764
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 18:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45B601C0DE2;
	Mon, 14 Oct 2024 18:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iq/e39Ho"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BDF1AA79A
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 18:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728929774; cv=none; b=BwwfFw1INzkF+ObiLmMGGbHDZdZw94nJhBy5x+A9CtwaaaVMFz3Ilw0/W/W1iGbRV5nXxu9BuCXF5oEjLmlRmQiXzmDHzmwaBqgk2wjAiu1TUDvVQ+U1bmO7iXJmc1lw1JzsEmQrQjhtLpgKd5kfd0osLgUJT6dfwFjp9+0aY4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728929774; c=relaxed/simple;
	bh=LNSqYzxmmz9OD/0UUcyOFn6AeN1Z072goWVOC0q2yrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sjmEWE7MPG0fgTCApvVTvk2Q9b86o8+m0qkMZ82T9sX+oUt87CLKp7wgE1X5jplX/oaWr56cQqVxD/51FqbgP6Zw3eZHmllqZqUtk/CPBHy9f4yDJ1nPPacERbow6EUb8yWgjMVA6JfXy3aJR1XhSqktqej8zObPfoT+Jzva2KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iq/e39Ho; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d462c91a9so2904201f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 11:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728929771; x=1729534571; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UtdPkrYN7fe8w5mEL3LeVayblW7M45DrbmZRpipI97s=;
        b=iq/e39Ho83LrRJLweE7RmoiKxCReXY6UGTvGrYtrofUdDQoUHE2k87bTo/K11qN6rN
         QHS3lNmmOLU8cRSkovgIjMcq0fccawkIyu1ZjtmBKd2SK6Ar3/l4j0JB3ruCTyJNuMKg
         GdNFjTih7u6y5wWQ7JCiANNECKZ5y6hHBLORgSnfvr3h1YM2/KLAHQzqgvGpvetdeySg
         DQ/e0VAm/uk3pGbb8lbgpoQC9/eg5RPcXPiYhM2nCJgQf7z6dRNJGV5XwDqO2i2EmWIv
         YahG0RMxnK1NDCbQCtixyS5k2KdA6ardCV/9Fopma4f4wRGaT18U3awUXRjPB+l2L5yr
         rcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728929771; x=1729534571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UtdPkrYN7fe8w5mEL3LeVayblW7M45DrbmZRpipI97s=;
        b=Ish6erq2qJy/O0td+8uwBVt1InKMJXU4cw93TDjGqU5GJ12Tu/kQLUpSShtXpJ2oiv
         0czaJCEDr1aBsHA+Mg4tYdmqrW0fi4j9GLXSWY1y0tqWU3y661DuoTIxAdwAkl+Ili4g
         y3F29CCMG8/V1/TXvqfw7ndzh3E/Egf0kxcfTzlmohErxsNWLIcS5xpJ3O0VpNR28+Ln
         TT49gqFSfkF60T/Crp9HtqnfZEAZ9N4depjy2BVqYTA3PvI/DIODS9vAzYRCaBv5DcRk
         cdt8e+en6BTY5V7jyrkWHC8zG3+idFgmFMwxgdaQwlOKjhohW35I/MrLnvh0qTdeEass
         LeMA==
X-Forwarded-Encrypted: i=1; AJvYcCXiP7YG0RPtDK/arjbBCy+uj7bDjlXJnuFDbrHEqhXjnzV+KZ6I8uGCjHourUBLuRf1no/G+PAUyKUhyE9O@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+PPoNrc4eLQRqXxxv5dGEOxQhk98yMiJ7sgRZnuFp+vFQsKjU
	hoHp69qrwPGzUwCDHd3xOm44psXRrko3ht0CuuXiLwfLiNiebbPP7m2fYGwy+Gs=
X-Google-Smtp-Source: AGHT+IHIQJqhAsmdVgPSCMWemS66sPfa9EYola/ZvTPYafkvTQqqNnZqlNbzsw8xXyLnNoUxhgl25w==
X-Received: by 2002:a5d:4dc6:0:b0:37d:4657:ea78 with SMTP id ffacd0b85a97d-37d5529f8d6mr8858619f8f.54.1728929770899;
        Mon, 14 Oct 2024 11:16:10 -0700 (PDT)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b7f05bfsm12010610f8f.108.2024.10.14.11.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 11:16:10 -0700 (PDT)
Date: Mon, 14 Oct 2024 21:16:09 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: neil.armstrong@linaro.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Force host dr_mode for usb_2
 controller
Message-ID: <Zw1f6S9d1JygJ6VU@linaro.org>
References: <20241014-x1e80100-usb2-dwc3-set-dr-mode-host-v1-1-3baab3ad17d8@linaro.org>
 <c1cd82c2-5af7-44ec-ac18-996dbc212ce0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1cd82c2-5af7-44ec-ac18-996dbc212ce0@linaro.org>

On 24-10-14 17:48:37, neil.armstrong@linaro.org wrote:
> On 14/10/2024 16:14, Abel Vesa wrote:
> > The usb_2 controller has only a USB 2.0 PHY connected to it. There is no
> > USB 3.x PHY fot it. So since dual-role is not an option, explicitly set
> > the dr_mode to host to match the hardware.
> 
> I don't follow, dual role is perfectly possible with USB2 only, where is the limitation ?

You're right. USB2 could be OTG.

Consider this patch dropped.

> 
> Neil
> 
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > index 0e6802c1d2d8375987c614ec69c440e2f38d25c6..4da13c8472392d842442193dc740027fa011ee1f 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > @@ -4143,6 +4143,7 @@ usb_2_dwc3: usb@a200000 {
> >   				iommus = <&apps_smmu 0x14e0 0x0>;
> >   				phys = <&usb_2_hsphy>;
> >   				phy-names = "usb2-phy";
> > +				dr_mode = "host";
> >   				maximum-speed = "high-speed";
> >   				ports {
> > 
> > ---
> > base-commit: d61a00525464bfc5fe92c6ad713350988e492b88
> > change-id: 20241014-x1e80100-usb2-dwc3-set-dr-mode-host-35312d1d25b2
> > 
> > Best regards,
> 

Thanks for reviewing.

Abel

