Return-Path: <linux-arm-msm+bounces-21145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E74448D504D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 18:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E17B51C22199
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 16:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FEE43D57A;
	Thu, 30 May 2024 16:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xyC29hpk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947F147773
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 16:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717088169; cv=none; b=f8leRbE94cYXKBGgYD3zSK2LF90CggNopBYaMmQvvqJSv8rdFlYUasn+Vubm0vFQDAspWUAeBQA/GRMpcKdFJ0rtnwZPL/hoJafbATfRoIVX6FWeplcGxK3GfB0StDr7hvjkY1sdAQ7OZduKHazX1w0cizmwKuJ4u68C9FK3TIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717088169; c=relaxed/simple;
	bh=FNrmY43/YCzNI9mINWD2Oip2Z3faB3SaM34C9EeG3bI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VCKmCHDoaEhtKXVHuGD29VhLrRo96jb0sbi2juUAj0Q77WeiqClxb9Eb2QZ7jqUFdqajyL0f5d4oP5PQ2XGOM6kNJP2DCw/b4Tx8cDe3vxghLvaUFjj39EhEcWiWzW7VVkwzv9dd1oFookjo5P+dTaX3SCtL8D28AaFjdXzM26Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xyC29hpk; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52b7ca4ad02so1209845e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 09:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717088165; x=1717692965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8cIZAyHQuyLuODFacqdYEeEJFSKlS0O4NsDUdsqJPEQ=;
        b=xyC29hpkU8lb5bGyPHU+LV2WHOBHZ2K+zp9S93zTm54DA4visFwpvjQ2PI/lb/ZJIc
         pjoADgtuh714Ap86aZmUtR5XDDBajF1Q+8XyYJf3gsbiMFuE6rYiAKFItR/DqnjQpSW2
         ms4h8CbIFqK6PtUKuRoPFQ5stjfllJB2GnJxVju9JSbK64ajXpSDPpI1jCpGBD9p5D7D
         hX16oVcAegclQYRdTI58l86zKLYTjbHsuZtcptbq3GdHGQKaDrU8aR+tRzzSuNgq+xvX
         9AnwQyg9NLVPcs/0D1KHC6sBXWh+zBNL4VfqXrbtKTC5dMPvqYpFovs+jyvga2fnmdLT
         wldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717088165; x=1717692965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8cIZAyHQuyLuODFacqdYEeEJFSKlS0O4NsDUdsqJPEQ=;
        b=KeOriWW98uoNubfl0PqKCL8yctybKe1E92KGpr8UcPAdx/wsvSDdBNr/SAtM30QC99
         hUvC5mhN7ZBL2otszcD/4idVhhTFSDxvjoIIwY5VlCb/WijLncsfMaRaa4etXUfgXsZI
         qdJQEWAgwwte+UhcfMVWWqo2d0u2A4ZYFOgiH0w5czD1qn8rrRZMYewwDEOSoI9hQv0S
         xHFSINg9mJCQXOU0BucvxjnK0MbfGQaKJz2dkqMiXCHrbN4ldUlGSuebvubGYltbQav8
         1pQ/Yq+C9WYIY1UzEe8THRGZWcYRH8CQ3WaJM98tha3JskkrDy/tebxPD7w+WpH0wrld
         T6KQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqGNYUYOhv8IY2jATTmoDqDBLZtYe9noe+z4jpWOkdUxO8UnlXuiDuvVwXYy3rQUTfs/MrqYBxKTiu3na9ULOZMS9xz5HCGFTQF0FgzQ==
X-Gm-Message-State: AOJu0Yyd/DmOOqZMNfb0h83gDFyEqe+aEoEf/ZusU7FYqfimyBj6eBAd
	NASenqgR/2mybtVZb4gJZmR73GXSCLb8eHoiP6RNMX5ofiQbv34Tl7eVOnnxuds=
X-Google-Smtp-Source: AGHT+IHE+Ow+K5cH0iKEEiLQu1RK9+EhmsE5q4RgF+Mo8KYrQlphENI6AkOOWkHJbu2VU2gveInE3w==
X-Received: by 2002:a05:6512:3694:b0:52b:7984:2333 with SMTP id 2adb3069b0e04-52b7d490620mr1600521e87.63.1717088164719;
        Thu, 30 May 2024 09:56:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d7870asm14601e87.136.2024.05.30.09.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 09:56:04 -0700 (PDT)
Date: Thu, 30 May 2024 19:56:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: pm7250b: Add node for PMIC VBUS
 booster
Message-ID: <zmid5knlldfg3rbp6xlanc3fy5siyddznn7cdryo57bwxk4ntw@cd2vkkuvstri>
References: <20240530-fp4-tcpm-v3-0-612d4bbd5e09@fairphone.com>
 <20240530-fp4-tcpm-v3-1-612d4bbd5e09@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530-fp4-tcpm-v3-1-612d4bbd5e09@fairphone.com>

On Thu, May 30, 2024 at 05:05:47PM +0200, Luca Weiss wrote:
> Add the required DTS node for the USB VBUS output regulator, which is
> available on PM7250B. This will provide the VBUS source to connected
> peripherals.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/pm7250b.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

