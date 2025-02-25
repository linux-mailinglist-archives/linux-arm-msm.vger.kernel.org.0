Return-Path: <linux-arm-msm+bounces-49347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01478A44910
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 18:55:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93EE41891427
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 17:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94FD119AD86;
	Tue, 25 Feb 2025 17:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JZVtUhek"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8A119A28D
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 17:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740506144; cv=none; b=oUsjJUbNqZyulS9CI8Ji4cvKrMIihSkrAuK3EKI8DEv9p5thcp+frcCxYiNqoarhWb2+28HmjW7Lz4lU85eFp/ZJx7tIxizi+v/Ru0U6WgOtYx7gpDiCiztQi/MidGbb9HT9U8j0h1LqpHCUgBx2n4ownfr4FEM5oxn67b1X+WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740506144; c=relaxed/simple;
	bh=ASfDaNLZIFf+zIGofhH6WgCbGbuLF+xCSiQVDoXkU/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YgJ1bgWcgLEP2HAsd2i3iaFuN9QVshAx6vjSIKZGvmApDPvciyt92XQwae0//OAENIA82fvM4BgGYpehcz/IJXywma4mPV9kqPKO57pAs8WgN5EzX2gJJ7Ao8D67Vk46Smq1+ooA6irFyWifydLY2BwLGK2F4Wd+6uHGR7w3Sjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JZVtUhek; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-309311e7b39so54031221fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 09:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740506141; x=1741110941; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eq3mOy20yNbp2lX3RjGrzkzUuuAverI0Nvq0Wo8uGL8=;
        b=JZVtUhekRCDVuQ5lZOkgRpkDbH1O36VOBeiLd8iQlxfo4aRh548p6i2VqpyMvhUYNl
         JeO2zu1LI0OrZn1L/0g1jCZwA1wpI3iGqy6Be5eOZe5Z0fcRFcXu9ouh2p0QpXXjfb/y
         ARLxK+LewTHuHYOAICzOsdk0YlOuOwG8lj+AJ12+FQIuGp5aAHS0DjFyXqEUxp2FyO4E
         az9W96z5EgtySKWar3oJSfX0jZ6Qy1Mulzvex2QclL77GHNuNkWqeVothAh2o5bcADMi
         dcMUmUMnPD/LQPVChqhXW8axhGO8IuFQkFzWK7XCK/49nd/2KLBcWyTREUCPqmtDov9j
         SW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740506141; x=1741110941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eq3mOy20yNbp2lX3RjGrzkzUuuAverI0Nvq0Wo8uGL8=;
        b=rfp1EvYwlpVsP63WY2h7Om5Nm3n8APhh0NNLlIAbxtIHka9vDEOm729adW/y3jQAB/
         BFKh9DhnKUhThSAOqFhscUGnR7DHv2MzyFsiOOQCN3ZjSf7Ca0O5cgf0iq2gTRQn3J0r
         6MkJCekU3oA1tsByHwi7aDF48FkjFO9zVTkBmhRffAZUIqK3CIJZe59Sl6ulqagf3b0y
         RHrHwHSkqHP/0LCDvAd5J0tO7LJ6eFZsQOUUKSVr+ZoA8UmlIbq4hEtTqzfflH0NfVa9
         UYKW+ySe65xdEtlZ8a8mw+KxBcVdio4Dpvs/Z9RA2KpRAzKUz+N2aom2nChIh4jdxGLT
         cYug==
X-Gm-Message-State: AOJu0YwasUx5KB275rffX9uQ/m7NlyScO7N6AfIEeSh5YNH1a42lQagr
	BjGrAUEJMc6+KM2MA029xvVJv+RRjZ3j8CDlyfIZmfKDpHatEbvn7MOaeWEnAJU=
X-Gm-Gg: ASbGncusNCcE18UdBAwXiIC4sg/h3g8+vpsjCB7Pz6xnKqI00DydoMcFsRBwt4sOz0Z
	I413wOe4gyPLUa63PvlZ3l+PdyVQ09OFXzjxFRMICdtoQJzUgAExrpPgQwo51qiwo3WkKIsxbpZ
	BbgNdbN0egKNq16TX/tTZnAqshpno4jHpZnWUpkiRbiJ/fmukV0JN5fSMg84dGBKY96N0rOMoRN
	30k8gXxh4CxdAbxJT+Qs8i9q8HD0Ra4iW589uxguV4zhN7UXEFVU9DNa23/OLJucX98pHqgAUFz
	QFc6+mPTpYfl6Ha7o7qP501XRiiMAl/iIqxCJvXClCupjlNRKtD6VW/m9Rp2hJIvwTBhwR3191X
	qV70rRQ==
X-Google-Smtp-Source: AGHT+IEtBPGhJEFmYORVcpbY565FvoQ1gkddd4xE4WqD8kbOZNOXiopkLnrRw1ytEuGRZvYQRQselw==
X-Received: by 2002:a05:6512:3a82:b0:545:271d:f92 with SMTP id 2adb3069b0e04-5493c57ef04mr234185e87.25.1740506140684;
        Tue, 25 Feb 2025 09:55:40 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514ba1d5sm243569e87.98.2025.02.25.09.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 09:55:40 -0800 (PST)
Date: Tue, 25 Feb 2025 19:55:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org, 
	andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org, 
	konradybcio@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, 
	jonas@kwiboo.se, jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com, 
	quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com, quic_jesszhan@quicinc.com
Subject: Re: [PATCH 08/11] arm64: dts: qcom: sa8775p-ride: enable Display
 serial interface
Message-ID: <tfd27qk543dt4sqcawogoszsjax3cqxmi6mcy3qd2mwzauedpf@l6xmy5okswrd>
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
 <20250225121824.3869719-9-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225121824.3869719-9-quic_amakhija@quicinc.com>

On Tue, Feb 25, 2025 at 05:48:21PM +0530, Ayushi Makhija wrote:
> Enable both DSI to DP bridge ports on SA8775P Ride plaftrom.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 66 +++++++++++++++++++++-
>  1 file changed, 64 insertions(+), 2 deletions(-)

Please squash into the previous patch. It doesn't make a lot of sense separately.

> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> index 151f66512303..02d8a9c2c909 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> @@ -128,6 +128,30 @@ dp1_connector_in: endpoint {
>  			};
>  		};
>  	};
> +
> +	dsi0-connector {

dpN-connector. It is not DSI.

> +		compatible = "dp-connector";
> +		label = "DSI0";

Is it an actual label on it?

> +		type = "full-size";
> +
> +		port {
> +			dsi0_connector_in: endpoint {
> +				remote-endpoint = <&anx7625_1_out>;
> +			};
> +		};
> +	};
> +
-- 
With best wishes
Dmitry

