Return-Path: <linux-arm-msm+bounces-24576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4EA91B8C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 09:46:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EE631C20FFC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 07:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820B3143881;
	Fri, 28 Jun 2024 07:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZKxRiur2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB606143751
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 07:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719560735; cv=none; b=eCa5jexnqYx6dkUeTpnJ4fBcrPc+i1YTLR9eGOrDvpSWccbvCCaFKZawg9H55YfuH901daBCHcAy7QkiM1u1c4iIs7fkNZMXIKtoljRtKZeyUJM+XyrSXmrwG5Be6ECKWN9EDWrKSZRLmGATfSXslQd3qqJ/s0gduCLyBxgt7IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719560735; c=relaxed/simple;
	bh=TIn3dSD9Y/O5J9F3VJziLjzKGSBP8XVxfPmWbVXuIdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VkDfCTzc+H4svxehyv4clB/HVmWizOQr0NfZ7eHNwVPi7ZArKmQeR/5HQNdNx3CEh+ivcm7cpD7sPtoyGeoDBIddK/5F9F0I4isDKBXXigYUg8gzW69+yFw4HFZdXPSbBkMuUigxFZji9SLaWWm+oWOWw9UXt07EnV3v8LPBSt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZKxRiur2; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ebe6495aedso2770781fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 00:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719560732; x=1720165532; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ta6pOQl7Ba5DSAPgv+iFZZAffaH8uQvfzLUSjfY48d8=;
        b=ZKxRiur2uw+Ob41YMzaY+MPU0HMX/paXToRlgrM2EhGXcaJMFkR1TXlkW+dEjskXEi
         pIu1jl60kAOodXrv2fWITfEQJyVZG1cT8LkVnweKmYYh5tyI+90dce0ZDARHIWsiWv8q
         sSQKTO4005xNTZGqs9bMsNTrqalXQRKp9liFFty5jMsRHZ3op0G0pshgpj0C/fCVTCli
         Vc6TY6pu0RScd2KBfQ6S6rsHIzLYfjE1FGWDys/FAdHKgJEGG/YzRYoVgNLbZ61RYW4S
         1HVBCA00AtehjpYta1O0c7USQFcJ4gc2sE/ElVuxOAfka7kcLfqwEDY0lpIvq98rmkOk
         c5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719560732; x=1720165532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ta6pOQl7Ba5DSAPgv+iFZZAffaH8uQvfzLUSjfY48d8=;
        b=BLMweaMiJpuqpCt2CEY8ULsW6+pGOw1Zk/DL+uJhBVbgygcJD4/GHJCrIcm3IJUkBg
         00fLars3QkB7nJXKomY2ME6UF5hMEAwSxVWnj9OO87RetAtzqo2rhJm6A9S3gY++uSJX
         zMVmSg16LU6dOniuRyqBImFGeI3CaxLXOdvpn2AjfkmV93cVFpAGY+zZrSUl/LkK2ru+
         Lhv81pduBxA9yBpD+pX/uLLRMutvNX9Jc4bc06wDf/WjG+D2lDAYXuGQROI/Uk+pcI9H
         152r8PN+woqgXBoMEOwmbrci6QA4DuPQjzbKV3zuTmTvPXzUtuF4xcmaaxH4y6ZzjMBm
         HwEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQ9X6LtUs/uYlKzOgy2vIBiHtDgQb1tMARxqXubfW4/FLtXJoSOhKzrE7RMvAFFfP5SLhFssoY0fJeO/aNtbJsV5AxTsu0OorKcTJZlQ==
X-Gm-Message-State: AOJu0Yxo39QN9U+IF4zQXIbJyvH4HocgIFTgRsYWrUz8wyWaOM6N+QFU
	7DtFiYppYPsPoCIirNto9qLjpnPCRASdcuI8WrKF/QxKzfnK7mZnpomU7y6j5VY=
X-Google-Smtp-Source: AGHT+IHqmAR6Aan/s3t39wcFt4NqZCBUJkjEf/RYG6yrSKTVA4mH3xmpTPmcNJL1Afj2I7QNcp83Kw==
X-Received: by 2002:a05:651c:1046:b0:2ec:6756:e3ea with SMTP id 38308e7fff4ca-2ec6756e4d7mr71538561fa.43.1719560732156;
        Fri, 28 Jun 2024 00:45:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee51680450sm2017551fa.76.2024.06.28.00.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 00:45:31 -0700 (PDT)
Date: Fri, 28 Jun 2024 10:45:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-sound@vger.kernel.org, srinivas.kandagatla@linaro.org, 
	bgoswami@quicinc.com, lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konrad.dybcio@linaro.org, perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org, 
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org, elder@linaro.org, 
	krzysztof.kozlowski@linaro.org, caleb.connolly@linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sm6115: add description of
 lpi_i2s2 pins
Message-ID: <qe62q5k7r3wwlceqkapwntdwhpngbwtvpwhq5wxwslhke3h6lt@kaveepinffka>
References: <20240628010715.438471-1-alexey.klimov@linaro.org>
 <20240628010715.438471-7-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628010715.438471-7-alexey.klimov@linaro.org>

On Fri, Jun 28, 2024 at 02:07:14AM GMT, Alexey Klimov wrote:
> This is required to enable to HDMI audio playback on
> QRB4210 RB2 board.

Are they SoC-specific or board-specific? In the latter case it might be
more suitable to move them to the board DT file.

> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 34 ++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 


-- 
With best wishes
Dmitry

