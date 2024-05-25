Return-Path: <linux-arm-msm+bounces-20475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E4F8CF13A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 22:12:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8618928182A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 20:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D393126F1B;
	Sat, 25 May 2024 20:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pf3yvl00"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CDB126F1F
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 May 2024 20:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716667935; cv=none; b=j8qfcDhv+xLjfCZ/Fccrkv6LTW1rzA0KNH3XFXgRMc43E73OLdbOaZqCNcyv76DkZDPcppfN1Tc2lbCIKK5sK0AQ8qWVrHmzS8IjrMKTmj+ZWNq1Fgwi4dsEv4vz+O9rgS5aeYrb5yYMUiyjjIfcKdccTQzQC+ifjJjG2kkAONc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716667935; c=relaxed/simple;
	bh=GCkb8VpIK5yTvW6Od6UzlY1UVmtUIlmab/m5x0kcX9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f0p21vopcbOSq8Jus1PG/H8Y8JhhlKZD8kb+vtPorvOcsrJPBhOZtAa6s4l6JWCUj7sU2EyFYFIXUaUx1Lxi2y3aAwhRoWn4Mqe8+pbAJWxg4wfjx7pG9ZVUiT+5+ol58IBqGl+ol4JluA6Utl+5uPTsAcLSfHqdJTL688weDmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pf3yvl00; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2e95afec7e6so15804121fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 May 2024 13:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716667932; x=1717272732; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sADZzhExqTF5ighoBfS1sBeZMakfeGbASWxc2TzHoV0=;
        b=Pf3yvl00sbQrkElgHBymzGSyGGuvWruUozP/hi7jeM2+QSrtdpECV/9qSn3CDj+JU1
         Qek3LUvGeokt1HVp2UQsTpCypaefVM9xDReyFz0KC50aevaPdYWvsm4fAB5PrMgXfxzu
         YVgHYdb2NI9/XtKB8ohKl9/dOtDbAZn+LXZ/B4AzuDSCxVm4LgpVLCcB1ACCml3QDbMa
         hKiqmbM5RzZtBMJgyqbOYkELQGgQrkh1YU89uDerWLwqhtri8ySWngRV2Jyyd5Iq7xdq
         8PdgQs0vlrTqZHL7PNfoNc/vIJX7YUzH9uZwmTEsyBQRmplr7Lx5QpNKULEHtLLH6h/p
         WIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716667932; x=1717272732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sADZzhExqTF5ighoBfS1sBeZMakfeGbASWxc2TzHoV0=;
        b=kQWU1b/laxA4tPXU+CejqduAMb/mRxob67pxNA1jzj7/3VwuWR7BOqXZkovycM1Lwb
         DN2UN7bLR2zK9NleJqifaj9/teYBetDSb8SHrS7YU6ulio8EVohBMfRnN1zxqmOSpPqE
         FgCCfCQknegVx5XKqjlkev5kjLO9JAvzimaNZ1oP2aD0tr3A6VWxu36nk5EUVRnmhm6D
         lgk8al43J0goSUwYqA01th4MM0W5xCAILX3LiqH1NXkVv97Ea1qacwPAHtubCT5A6neh
         t4eCfEbg4y+kjidUjRYzo9YEUuwxUUwOkhCSNOxXI2NPQZzBX90TujSqC4TCli5iO8I6
         qzfw==
X-Forwarded-Encrypted: i=1; AJvYcCWK7FLqLipdpDl9WF/2ym0YmYShjEJM/AW8fyRR1rpyyLcbG0JlCpPmnnAf8kAkSV9ev72tiWeZvyKYnmvVlfYKVQvqUBuhxL213qexAA==
X-Gm-Message-State: AOJu0YznePFLiWrXjpOgHSb/WW36YoddGv+L5vHXpmdwHRuOuE6nl7Yt
	wMRWleK2QVtEyfnRRAtmX81rux7RzMy2/gMFYdUgG95bdpiiREw9qDhB01bdNbE=
X-Google-Smtp-Source: AGHT+IFqhwDDv3N63doOvlPH07F4vAQD70/YFm2+cAidzJLN6LyukrPD1Qf58Yu1YCc6YnzMrtc47g==
X-Received: by 2002:a2e:2e19:0:b0:2e6:a1c4:4328 with SMTP id 38308e7fff4ca-2e95a104423mr16964041fa.22.1716667931997;
        Sat, 25 May 2024 13:12:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bcd7bbcsm8824091fa.32.2024.05.25.13.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 13:12:11 -0700 (PDT)
Date: Sat, 25 May 2024 23:12:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8180x: Fix aoss_qmp node
Message-ID: <bd4cklk6dh7n7fparardg7kii5xm6vijibw2442ogfoisvzjdh@srpclqicd4ju>
References: <20240525-sc8180x-aop-validation-fix-v1-1-66cfa3c9ccf6@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240525-sc8180x-aop-validation-fix-v1-1-66cfa3c9ccf6@quicinc.com>

On Sat, May 25, 2024 at 10:54:07AM -0700, Bjorn Andersson wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> The #power-domains property is no longer accepted according to the AOSS
> QMP binding, drop it from the node.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8180x.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

