Return-Path: <linux-arm-msm+bounces-39120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 258AF9D8A93
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 17:45:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6DC11660E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 16:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 765221B413E;
	Mon, 25 Nov 2024 16:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jNiTBHsZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BCF77102
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 16:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732553147; cv=none; b=GfnChQzx8qODHG+kZ88NOyI7o6I9/3qcHN9qBNngJ2rGjEg+pGSFwaHbgZRIfTopEIJfDi2OU0DHI5mcsxr785iIzwV0pHG+836pTA8EzLgestEKVA86QnQjDaKRmPNnW5VjlK72ITlzr/S6cBNz5mg4p/INoMy2bUZOEwMHS7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732553147; c=relaxed/simple;
	bh=pntte1+Z8hWk6WRTFB8PfobjrAF8mnuCEH1yqjlijng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mbS/O8cf5v78lbvgd3z9gP93s7EawFDYYrD/hsUqJPMm6Tt58PTEHgcm1nhKRKjKiRBmc+C0wSuGQrbNDh67pcXdDcinEeNHx0B2OYMSx7uizYMW6eke5v9ZrkgboXqBxtziI6SXArNIuYQCqTT4dTwxZs1AT7oKUinwe8zuFpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jNiTBHsZ; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53de880c77eso22165e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 08:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732553144; x=1733157944; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fIAgeAhmCn372flnwJB0OBUFPTeilzavFF36VaP2Itg=;
        b=jNiTBHsZi11Abuz2rbREBYuGJjFunTAO8IigJ9bFMKVIXl+jycz7Dkzs8xvHLr1+VG
         dC4EOmOYOgQ+CGUS6xNhpFU+z2YzvEeuvxT5R1PNlTUm0a+n2KUIHmuHuq8QO1Lfn7z+
         XOuBh4zGrmPcexBLp0m9O/AcKtWkTty7aoPLkxzgK+31XgCzXP09yHjMg+o45nHvZp42
         aEgQUqHDTw+iscjh0IxZiolHqdkqytI0XKEd2rPpCniOKMmYo/XTN/1QvbNkXW0kHuy6
         Ryd87jwcm4KNGsxbtflR1f1C7D7tnliChul1lYYqZBpk6+JPKtlszFU9gQJIyDhDbum5
         nCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732553144; x=1733157944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIAgeAhmCn372flnwJB0OBUFPTeilzavFF36VaP2Itg=;
        b=iWcHl1nscG+dLcEXL0Zx2iJ1uuOPiNLeuQWGH+CrUJIdNX4NafKqClEclqeF+8y+JP
         uDFzHUfkKdo3yXy8h6e0bSvAPnU77E72MEH5JAU4766BopkYM7IYeKVhLPZ/5lyCOMzs
         3OPtCI+vgyGf8SUg3qSB+E8Tef7DsGEqeMlQF3nBBhUMzOAHtm3XctQp82aLHk3NHS63
         r8oqtmlcLHgQyPovGDUb9ZSXMqWzAzmahgGBvADduYfTFwA8RNXnKlBOcB8HUxEExguw
         s42ovXWe94F0oTqRSGAN+/qKFPItb/Ak9Ix0LrKxndLGB2pGiF2sn10ffmXaH89AbHTD
         7MJw==
X-Forwarded-Encrypted: i=1; AJvYcCWPkm1KJzFW8cYWiZ2sQ5iBCGIzcf7RHSdcLmjvIyC1ccMQspKsBAHrcQUvDiTtpNSwtyPU6tUaThsv5TMn@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1VdXE9kdu6LRHcKCp57yVaeVFjd3BAKVJExKWCLJihkn8n8Mi
	GXsg+3zvMeTuXhkj+Yte1J2U2xgc4mlhnYKAY2NmIivGpdRs7y6V+/pHmibN3Jg=
X-Gm-Gg: ASbGncuBDxZc0wthL0bApeUEVzywLqgz0tHNp1WuojLAHstEsWwg0EqdbIam99WktRT
	DFJcgcQ/VPw0XZBMu3qyhHFqYLqsdIA+IZhFaCRobZYywX3TTcN8sD5eWjS+/w7H5IFw5isSvNz
	r1JsnBojICfiXO9n/2pEAYJQG5LkWZuaZpZdAfIH8RiN6bvxAsuGpHdgE87p0QmAxVcGzEEHDn0
	aOC7nUlI3xnurJmhWSczD/mg5ymwSK+5gYpK6N1B268YB9CSg0/ztOZmJZMKPKwp8IPzDKYPwws
	eTzYVBOyoPmcOKo9FTeC9cquA6p7cA==
X-Google-Smtp-Source: AGHT+IF6AynL9UpDhBawUpEwDkQ2c3G14CtiWofl68FeWiQ6izt6omfKnKNwyR4f3DSsQ0mgBCkCPg==
X-Received: by 2002:a05:6512:ea4:b0:53d:de12:ef26 with SMTP id 2adb3069b0e04-53dde12efbfmr3507612e87.4.1732553143652;
        Mon, 25 Nov 2024 08:45:43 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53ddd09737csm1089610e87.156.2024.11.25.08.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 08:45:42 -0800 (PST)
Date: Mon, 25 Nov 2024 18:45:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xin Liu <quic_liuxin@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@quicinc.com, quic_jiegan@quicinc.com, quic_aiquny@quicinc.com, 
	quic_tingweiz@quicinc.com
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: qcs8300-ride: Add watchdog node
Message-ID: <wty3opxcapeesat2bnai6ntbk4utwxk2hf56w4hymwjxj57ora@6f7f2lwtdcpo>
References: <20241125093503.1162412-1-quic_liuxin@quicinc.com>
 <20241125093503.1162412-4-quic_liuxin@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125093503.1162412-4-quic_liuxin@quicinc.com>

On Mon, Nov 25, 2024 at 05:35:03PM +0800, Xin Liu wrote:
> Add watchdog clock on the Qualcomm QCS8300 Ride platform.
> 
> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> index 7eed19a694c3..d4e4c7a8b453 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> @@ -265,3 +265,7 @@ &ufs_mem_phy {
>  	vdda-pll-supply = <&vreg_l5a>;
>  	status = "okay";
>  };
> +
> +&watchdog {
> +    clocks = <&sleep_clk>;
> +};

I'd really prefer to have this in the SoC dtsi. It's not a part that can
change between boards.

-- 
With best wishes
Dmitry

