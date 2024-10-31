Return-Path: <linux-arm-msm+bounces-36588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 401B79B8181
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 18:47:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 053B3282DE9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 17:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 089421C57A0;
	Thu, 31 Oct 2024 17:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wGh4HOXk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED191C3F1B
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 17:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730396836; cv=none; b=hCx8Q2qpo7jiRTaJPACTa0GpEQuSW6bhYpj/VMUrDoSXz45LI4J7FK/Q9N1BP/EIcm85F0wA3HU+lkaaVaZYPGMPhcpLPk5qSObYTISHW6gcw4ZL43eZEoltu3aUobgQLMz+XLoGLvg+uWX1qiCjHlpC829yAFLv2vzBBE0+6+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730396836; c=relaxed/simple;
	bh=etimWnUfHOZ0ie66fb4DurfrF26rdEKMghR+1nBtEh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJRCxcUuQURn6/ww4FMK9bYg5x3Ou0QkptX/RIaXrC+lNX56K6/1LANyt8BClHNXIoweItzj2q1sFFdrDYsJ5Hg1q03Lk0jF7oUUxf/WfWn2aPTp1u2Kj/4fC8rZYsNA0VkcxTBrUks68gWCs7Ph27OevdZ2jqw068B4MGDeNKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wGh4HOXk; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539fe02c386so2080014e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 10:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730396832; x=1731001632; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=icT0Jwpo8GGddZPXkZjIKzOMTai62xp7VfV8yD5nylk=;
        b=wGh4HOXkCu1+o9YkFCfVlb8iANFgw1xutulXFRDEberquzBUP1LDXIDwlBKCU1g/Co
         66TlMA8bAYxNPp0p4Yk4yDHkTCmPOCmYpxjeMaD1rIPsKRGi9KpVr2h1PXml4Bo8XsvT
         mnv6NHe3Ws3nKMmlUYRubo3RAbYpb+r9g+ZfwHQDNMkLUXWz0r/7QtKW+HZDwJgpYfy5
         VevOA+mtmzPtfL5xWMrYLyRNclu6BrAf6hQQe8if3OZtqbQF0/MG1Ty8/P5DbFkroJwJ
         igaC+JuQiXyvDW8Jm+MTb4pUFsxKvgg+P/+x2u1U0OFaMfGeQ0qYshk9Ewsn3KjGioib
         O7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730396832; x=1731001632;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=icT0Jwpo8GGddZPXkZjIKzOMTai62xp7VfV8yD5nylk=;
        b=ueWvLGmr5eBHrxTCPOHYBbRcyzwhjrhQ67L08Xh2WrV5DvbydWR+eyJPv2tHKLrwyU
         c16oqAGjxD+5qUwMBkiyDtQovM8AwWKeK6ryQxGOzsgE1YqcKgHdhmeMrC0KSAuKIbMk
         qNUZqp+Asb6/JcwdujTJ/RtBkUM6bfR3DUn+tnBCSFHX+DUY9JVlia9l37bh/ZLZdWmL
         NR2f3D9hmJ8Jgqq2NVLNjfcMd7qXsp/jAOyVp/EgZX8sUCfIgSp/ZmH/MXGGj2iINYVj
         rRqM4e0rNUfMbrxLpdntOp7EhR8C5AO9/58lc8BaYHdPVQxvSSH3EfDgc7A4qTh+dSya
         4KhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhKuEQEFqPbq3viMlpito/ycjWQrwbqXePrcoWA3SJR62g8ARHbAAQW+Cgj2fEGJUMNAMOHhCtN/brQdCq@vger.kernel.org
X-Gm-Message-State: AOJu0YyqdSGS62GrhMqNVZRAWYbHwtjDNY7ifNzi/8MBWdE3vZ2WSNzM
	3o9ZM2PLAe4IMwDMPkFPsHcUbUwWHs9Khqr/hqyEXwhA6TNVVwX19/SXuJn18WA=
X-Google-Smtp-Source: AGHT+IEjo7YeCGMc9+HFLWiOPZE+phU9MZtgtYpYPR3hQQmX7N1+hAOUoR8z5B0maKvphxFM4B9a5A==
X-Received: by 2002:a05:6512:3f12:b0:539:fd1b:bb0c with SMTP id 2adb3069b0e04-53d65d96dcfmr304797e87.11.1730396831927;
        Thu, 31 Oct 2024 10:47:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc9c133sm280042e87.100.2024.10.31.10.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 10:47:11 -0700 (PDT)
Date: Thu, 31 Oct 2024 19:47:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Lee Jones <lee@kernel.org>, Amit Kucheria <amitk@kernel.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH v2 04/15] pinctrl: qcom: spmi-mpp: Add PM8937 compatible
Message-ID: <ucmcr4pbmmgkuaxvrky5376jtsxu5zejuo6tp3z5l4zbm43hok@a6fzyhvjxhaz>
References: <20241031-msm8917-v2-0-8a075faa89b1@mainlining.org>
 <20241031-msm8917-v2-4-8a075faa89b1@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241031-msm8917-v2-4-8a075faa89b1@mainlining.org>

On Thu, Oct 31, 2024 at 02:19:45AM +0100, Barnabás Czémán wrote:
> The PM8937 provides 4 MPPs.
> Add a compatible to support them.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-mpp.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

