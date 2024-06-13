Return-Path: <linux-arm-msm+bounces-22621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C27090798C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 19:18:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 499291C22F16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 17:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98ED812D76D;
	Thu, 13 Jun 2024 17:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YmWy2cfD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC3013CF85;
	Thu, 13 Jun 2024 17:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718299128; cv=none; b=a21j1Y0Un0mwEEiKfD4wBslbN56/PKf9BKDD5/fbY0Zos6Ks+1UzmTSJfT29fXynonV74rCaMdhsl3at2i3EJm0e7rygm0zQMVaeh3hGq9B6lnYrREp2kcou/3h+hGEnw/gMknRE6DWCuJzX1O4sVtNuVgIGeOgEJVfAjXvck4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718299128; c=relaxed/simple;
	bh=NzeNxgZX0C2quUpUoW26DoTjgXYHI3/jLgEVyVXZHik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZcCTRn50TraI2FURXwW7Efayfk7np3/5+cVaTUz06DqtZ+mvbzTPysLJTrvladC0E9PHWSGCfhHiifar/Mz/FtkMp5ly+ECqgw43IwZTBUFkjWXgLvFP/ED9Do2fckahUHdMQNAFBxyfMuaE4mKjEx5Zzo/98sVG9KGna0TFmHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YmWy2cfD; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57a30dbdb7fso1828804a12.3;
        Thu, 13 Jun 2024 10:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718299125; x=1718903925; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cwcCGDwb60DzgqVPFb1/1oCx//cSi4Srw7sRj+1jaLY=;
        b=YmWy2cfDrWvGbG39HT/AvfE2BBqW/X05HQ84DgElPv9DyHomx7Uba4EQjTXNAU6Nnn
         pj89kAiJE5n10o3AejfJexgIBeZnG+rNN5rjNJ84Nnd+xCDRZyR5rUcl+QE47xQvgxPy
         3C3egfmdNdrxoiJWZvm8TbZe92C6kN2TqN90ZKmxedXiw2VRTsvb/tuDcX9+TO0HaIuH
         w9ow1SRBdS9iov2pPXYT5Yxjz5nB61Ji+HFnnQ+UvD3umw7Mm4S2DiyvUEAgpeLyrqtO
         gCjaZBO1VomvgNqmP2/V1rGZdbho+laiTf6AhyoLDr4VILAZmP6soguvAIYAwfabZ3uE
         gsKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718299125; x=1718903925;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cwcCGDwb60DzgqVPFb1/1oCx//cSi4Srw7sRj+1jaLY=;
        b=vga9/COw24xLx/fJF3GOuGAQD2DUiQse0ZpOzcaKOS/JQ4oCkurmb0Nr6DZn0CDdr9
         N/r/7RXUJ3RCeBMC9MsrWq9/I2jzWK1gmPvCr++7pVjLy5QY5HuC72UX+Salkn8HbDHG
         qMtvhl0qQta9gjIT1OQrfNY4uj4roRqj3CyC3rh1yKzB1EE30GRC/qTC7grWSdw+mliB
         GrJrMcDtYC/Dwb22zckDssTjL2tC6NvXQ9o5ZskI6b7FZiObbL8MGSex2OLD9yQ8LHp3
         aDcmpB28bfEDB0qtfb8nf/3EKwFwFHXfimwBYumtYkIdWhqcTq+9b5uy7P9lofHccpnb
         3YNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1kJhHsmGpA0+Xnx6UUliIkdXjcJK3N8aOHW2AaXwCi+FHxGpD1CX2/rLjjjArboUPP7/mm6qavTqydRTJGg8CoCKHX70mDVArXG8ikFlvlbNthomV2OvrCxqVUuKooeixcIBIBC8Z0bRMHXREGVI9h4i8eSNP6oLuQrWs7wRP78azEIZAiEs+/eiHn4konOaZ4xgcqZPgHD+YqXRfqEzq6gFFOg==
X-Gm-Message-State: AOJu0YxGE/xZIzuZNA6nSlpeLezvWQvi3/mk/LgKLhs/y/UwZLWQNvXY
	9LxcFGTPB6PGis4hSnnoY4+ZYgq+Y/82whbPl17szLIIAPofMgvH
X-Google-Smtp-Source: AGHT+IGdIR8K+VU7ZoWeYaXJouZP25nKSmNr2Ci+hRTo46h3PKiZ1ed05PMzYhGyYbF+2HCHDXPaJw==
X-Received: by 2002:a50:8e18:0:b0:57a:2fe7:6699 with SMTP id 4fb4d7f45d1cf-57cbd66272cmr286625a12.14.1718299125009;
        Thu, 13 Jun 2024 10:18:45 -0700 (PDT)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb741e7a5sm1139124a12.75.2024.06.13.10.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 10:18:44 -0700 (PDT)
Date: Thu, 13 Jun 2024 19:18:42 +0200
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: qcom: motorola-falcon: add accelerometer,
 magnetometer
Message-ID: <Zmsp8kPRCE/fIPQk@standask-GA-A55M-S2HP>
References: <ZmWMh6fuLasvGkR/@standask-GA-A55M-S2HP>
 <2b39d763-5b79-4b21-85f9-22fee9f87468@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b39d763-5b79-4b21-85f9-22fee9f87468@linaro.org>

On Thu, Jun 13, 2024 at 09:48:26AM +0200, Konrad Dybcio wrote:
> 
> 
> On 6/9/24 13:05, Stanislav Jakubek wrote:
> > Add the accelerometer and magnetometer that are present on the Motorola
> > Moto G (2013) device.
> > 
> > Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
> > ---
> 
> [...]
> 
> > +&blsp1_i2c2 {
> 
> Consider setting a clock-frequency = <>

Hi Konrad,

checking downstream [1], qcom,i2c-bus-freq for I2C2 is 100000, which seems
to be the default. Should I specify it anyway?

Though, now that I've checked, it seems that I missed the clock-frequency
for I2C3, for which qcom,i2c-bus-freq is 400000...
The currently supported HW on it seems to work fine though ¯\_(ツ)_/¯

[1] https://github.com/LineageOS/android_kernel_motorola_msm8226/blob/cm-14.1/arch/arm/boot/dts/msm8226.dtsi#L983

Stanislav

> 
> With that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Konrad

