Return-Path: <linux-arm-msm+bounces-40887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C909E83A8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 06:32:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F963165A31
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 05:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BF8F381AF;
	Sun,  8 Dec 2024 05:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IAPHcyw0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F99C18E1F
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Dec 2024 05:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733635934; cv=none; b=qoSLbUKU1ApICP/KQ7ZDflH/DcrxJlWK4xSN0bsAT8HzbdE53Teel77T99kTogCLD/WWtCEICVPSEkCr8cAerDokYUE9nTUez+zN6ol/vVZd7kEgWucKdZbSTBhblsaPUMvVAvT+0zE0x2zEAwDegEMWRwIJ1Q29r9rouOMPE8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733635934; c=relaxed/simple;
	bh=ZH9c+nbPI18/8YvQMcmvQRtgXojPyyQ3bR6i6JGEYIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QnMpTje2SjSNI1y2gUcJwmumuxqWRzRVuh1hEWHtDbIBs6MmZP3LNbfd3Pc94tbg21RCCEkAjXcmJK69TBUAcNg/sej0dKu0por+kKmmPJmMZNutmRNXE6X6LWQ0+1IXKrGnqQlC945KgKGVUWLJHsDf/CDq7Tor+ogue/YARB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IAPHcyw0; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so30164371fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Dec 2024 21:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733635930; x=1734240730; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P6nFzI3wt1FIwd3t3T0zMAhozPOD3DEG6nWM7JBmOLo=;
        b=IAPHcyw0z9ku0Xz/QfKZl+CCa0mRbsUE3aVaqffK+2EO+0MPpHzovRiijLZSbhBWZ4
         0x4RasIigYgHrM8mrk/DCS66T6vWqCX5OEzyCvT3UmccZJxCZk5IU48jZ9g3qZ2t01T6
         kxbX7tbajKcHD1g3VaDD7HZgDdLr++sVm5NLpnn08N/ulhDArDXRlVle3ODwGj7Rkqau
         F3ReMIQkGIQGQvg9Jb71CLh+BgM4SJ+overyI0w93AqI07EHUPBrPhnOnr67OXhpGqky
         sr+YN2Hav7hzryy0lyqzQLZAy2P6p0vUOeICJ1dtfTh/P1FYNkNeDiSWVBYEuoe+Lyvj
         q7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733635930; x=1734240730;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6nFzI3wt1FIwd3t3T0zMAhozPOD3DEG6nWM7JBmOLo=;
        b=iGBqzqCAAErWk/Qrys/iu5VF2SBcbxghsJHDYK0aqZUWFwGq1wCvVNAd5ZscU86WDl
         YLRW2QeKAov2BBHgT80EF/R+Q6Sj+nLsNPrhf367KySESG01AnZ/we8WEv4flW9U690d
         cPKYPNcBK7GHWVM0VlbmvT+E/ZEsf9O1F+6YWk6APM9aXJFgiwbzhLcSVD/bMfCQgfxS
         dwHMTfc+wFNZNcdSjGNeNbGkyaGNTGL6p9f6/ZORwkSyjQKkhfbed9WIuR5SNNqSsLgS
         Lrvug/iycAvn4EfqIZR5H5qJiLMGX4QcPM7TTt9YCCIlhC17JP8GnIqpLNH2hRfdG979
         8Qxw==
X-Forwarded-Encrypted: i=1; AJvYcCXuSwEGmTGEfKmh5/9Ni4F1ZmGc+Cr0dAxLmb6abgPqtKuyDFNQY/WqiBKevehAk4T0zLmlSH0Ktf+xIzqF@vger.kernel.org
X-Gm-Message-State: AOJu0YyAHNFDgkIAnM3aaPJZdKHghL+TC69FbLg+wkbgXGbHBitmoBzG
	IBStCFH1r0jOmsD4ww57a/Z4nqI8kDJnpVq9ftZi/G5F1CsCQH7x2KjrAwLlzMA=
X-Gm-Gg: ASbGncuFvbjpHGMiuVjZY3gHQJedN/1m8flhLNWJj20WTqO31ZvDLV2Ef478MfhZ/vR
	SC+S8VZ3SZ9SiuBPtjzbx/nBxbyCniXCzEUvwfraIwW1kRJVcAT1jweRhaZ1pjfNo+w2boR60HP
	XNLb8Ilc2otdsthD4u05ZvvCDOeEe6FJq0QvfZqyjgVdxPdBNf/YERkHuUPtZJO0VgzWYMA9H4f
	R1fK9WMHPK565pNvydaaGzTHMX4XlFQQ6r6y8zF6Fn97yjTME0+XzXRrLebRi2gkLClUHtvANTU
	aLwMtEZQQznRVa0XbGkC4kSISIyGuA==
X-Google-Smtp-Source: AGHT+IHM6HUUTb8wNdmSb6sHgl/L0lzJE9vsiapY5lOubCX/APlM2HXRklZ2wiKCWtgwS0Gfxw7uWw==
X-Received: by 2002:a2e:bc84:0:b0:300:3a15:8f19 with SMTP id 38308e7fff4ca-3003a15931fmr37023771fa.32.1733635930310;
        Sat, 07 Dec 2024 21:32:10 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3021e43be73sm621751fa.42.2024.12.07.21.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 21:32:09 -0800 (PST)
Date: Sun, 8 Dec 2024 07:32:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: sm8150-microsoft-surface-duo:
 fix typos in da7280 properties
Message-ID: <sgcfb6mz6hdnpbbq3lz2jyoehpgukqqv2p4kpiisrbfe44y6t5@gzpot5gpfen7>
References: <20241206-topic-misc-dt-fixes-v2-0-fb6b9cadc47f@linaro.org>
 <20241206-topic-misc-dt-fixes-v2-6-fb6b9cadc47f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206-topic-misc-dt-fixes-v2-6-fb6b9cadc47f@linaro.org>

On Fri, Dec 06, 2024 at 11:12:58AM +0100, Neil Armstrong wrote:
> The dlg,const-op-mode & dlg,periodic-op-mode were mis-names with twice
> the "dlg," prefix, drop one to match the bindings.
> 
> This fixes:
> sm8150-microsoft-surface-duo.dtb: da7280@4a: 'dlg,const-op-mode' is a required property
> 	from schema $id: http://devicetree.org/schemas/input/dlg,da7280.yaml#
> m8150-microsoft-surface-duo.dtb: da7280@4a: 'dlg,periodic-op-mode' is a required property
> 	from schema $id: http://devicetree.org/schemas/input/dlg,da7280.yaml#
> sm8150-microsoft-surface-duo.dtb: da7280@4a: 'dlg,dlg,const-op-mode', 'dlg,dlg,periodic-op-mode' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/input/dlg,da7280.yaml#
> 
> With the dlg,da7280.yaml converted from dlg,da7280.txt at [1].
> 
> [1] https://lore.kernel.org/all/20241206-topic-misc-da7280-convert-v2-1-1c3539f75604@linaro.org/
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Fixes: d1f781db47a8 ("arm64: dts: qcom: add initial device-tree for Microsoft Surface Duo")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
> index b039773c44653ae8cd5c2b9fdeccbd304ad2c9e5..a1323a8b8e6bfb556a2d6d865f8b560bd6c4d429 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
> @@ -376,8 +376,8 @@ da7280@4a {
>  		pinctrl-0 = <&da7280_intr_default>;
>  
>  		dlg,actuator-type = "LRA";
> -		dlg,dlg,const-op-mode = <1>;
> -		dlg,dlg,periodic-op-mode = <1>;
> +		dlg,const-op-mode = <1>;
> +		dlg,periodic-op-mode = <1>;
>  		dlg,nom-microvolt = <2000000>;
>  		dlg,abs-max-microvolt = <2000000>;
>  		dlg,imax-microamp = <129000>;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

