Return-Path: <linux-arm-msm+bounces-23650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 829E5912F12
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 23:01:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E97C281173
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 21:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67A0816C857;
	Fri, 21 Jun 2024 21:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LsIx0lbm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D22155329
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 21:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719003672; cv=none; b=aEsJUHCTzgnYLtO4fZsBx2YYA1eUHg0foHs5Uk2k+JYtgHUbsldL81fdghp8huAs5qkdrqaI/vfawIW3oIhwYmLORRWp0kIDTnWG3Fvdh49gHg61OBTpj1WcKwQ+Rsinn5edbxxxTCc8EaTITsZEKDDsGfWxEZ2WbMEa3GHEIa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719003672; c=relaxed/simple;
	bh=r1NowRJipfzB30i47UKAvLVjWIfE1kpajQsXNuqHCzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nojwOpTyl4rYmok5ba+akxhCDaVf7M9FM5vLT/4sD/bEmOBkvIFdVqRRZWFM+yvVliigSRm2aXaqJ7+Q3UZ1g0/OkD678szQH9250kBoHuKTzwG5Ce4dEAttbywoBX2lhG7uv5V1VHfgktMU80GzHKpxTk18Vn829lPDtGj7qwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LsIx0lbm; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52cd9f9505cso1037135e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 14:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719003669; x=1719608469; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MR0pq37AFaUSgmvqO3ZUjRvaH0Q8OniBl660xU6Kqts=;
        b=LsIx0lbm3GldOWpV5zcGt4iMMjm5jnNypwcWCJZ0FX7XFmyo9DY5PiBf8FjBLpcS6Q
         JamSA8v+D8P8b35xgvlkR3iVyrzwApTjhJwyDF0i7Bv1a9mLEjHOpMiEwlOHEwuoP50k
         AkUOTCUdJ26yNWKngwaEEemHWvKjWGkA8bYdVHjJICPRgI5GX3a1HuChNtqIanxTtD8Z
         y3bEgrfKFokwh3TESrn1OO05rHZsgG4ufOCC8K8kwUIYTn+kdWzTaXw1TyhyOmC40lET
         /5rnWuN4P9cD4t14R9bkIgleckqdemfiB+48EnisyA0C+HRY8L47/Hdblf/Oiks8mZL7
         KLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719003669; x=1719608469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MR0pq37AFaUSgmvqO3ZUjRvaH0Q8OniBl660xU6Kqts=;
        b=Puw9WVVErJSHzXKsnqd2Gf3+6dmhI5CinbbKMt62y0zJ4yCUeMJaT7q21GqaW6dODH
         k/qFFV7dZcN79/+XcddE6iGw145mXE8f24rPL7k9lBOuVbtEAYzT/2/MKuOB7CmpAk0k
         Vw6eFTaNnbRVpWOoX+7oAK0k4nY/TY+KXYmol0575FgtF0cxwo9hK/zgAPylfS4cU1qf
         pK3Nx7i8fXC0AKtrmZ3BuRRBifgcjWx35fUhaHgI/g1uKmLVcemIQOf9K3l9C2H8g42i
         Ld+VmJIf7gbs7t46h5s3qYd0dR01ZVZn8EhQ5TmRYN1zGz4z7Sfjtsvr8B5IkTE/YoGs
         Y0xA==
X-Forwarded-Encrypted: i=1; AJvYcCV1Rj8CS5D515UisbdXTXY5XxpsA84Mte6NOUq62e3dhwZCv0NAQ+iD9H7v3NPyzfDatRS8MsF6qYKsPHfo708NZeZRf8xYaa/RWxGL7g==
X-Gm-Message-State: AOJu0YwddlEMuoGZFbsAisBKZi9/yDo1FToxlUcUl1ezJdUDSaK9kzO1
	/Hi8LqcAZ3+GQvYkrSDPagZA2T49j8T2Edkbgdgk61Bg/e2BylBNUwz7sB2gXus=
X-Google-Smtp-Source: AGHT+IEEW5ijUuPiugCxz/kwSbiittcMaFfgfc/yQbBM7kgngVvBeI7F/QcSaPHdfkNWuZnR0+uuOw==
X-Received: by 2002:a19:2d4c:0:b0:52c:d96d:7b4f with SMTP id 2adb3069b0e04-52cd96d7cfemr1352156e87.40.1719003669028;
        Fri, 21 Jun 2024 14:01:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cdb4a7215sm170809e87.171.2024.06.21.14.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 14:01:08 -0700 (PDT)
Date: Sat, 22 Jun 2024 00:01:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Valeriy Klimin <vdos63@gmail.com>
Cc: ~postmarketos/upstreaming <~postmarketos/upstreaming@lists.sr.ht>, 
	phone-devel <phone-devel@vger.kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] ARM: dts: qcom: Add Sony Xperia Z3 Compact smartphone
Message-ID: <4zpqdpeulfejfbnkp5prxvznohoqmdxcomztbbl6e3mazxdew2@tppmtxqxxpkk>
References: <20240621-sony-aries-v1-0-bcf96876980e@gmail.com>
 <20240621-sony-aries-v1-1-bcf96876980e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621-sony-aries-v1-1-bcf96876980e@gmail.com>

On Fri, Jun 21, 2024 at 11:14:46AM GMT, Valeriy Klimin wrote:
> Add the dts for the Z3 Compact. This is currently almost the same
> as the plain Z3 as they share almost the same hardware and
> nothing device-specific is currently supported.
> 
> Signed-off-by: Valeriy Klimin <vdos63@gmail.com>
> ---
>  arch/arm/boot/dts/qcom/Makefile                    |  1 +
>  .../qcom-msm8974pro-sony-xperia-shinano-aries.dts  | 44 ++++++++++++++++++++++
>  2 files changed, 45 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

