Return-Path: <linux-arm-msm+bounces-23211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D16D90ED2B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 15:14:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 262C81F218C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 13:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B20181422B8;
	Wed, 19 Jun 2024 13:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EQ738Xvk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D2014389C
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 13:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718802895; cv=none; b=BlmimENMGdyP4czuBrQAprKKcd/Iqfwu0E+EsEmtSttJ94DrJ5RXDqJwab7E4s9vJOwrUMOfmvs6aoXaINIFhBinb9BONgZkxUdvdalhGrlAV2M2bMUDt2TYNE+4akkp4r/A6wxSclQ55rsi7Ke9dl7xc/yLq1n3n5WaZNwxI0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718802895; c=relaxed/simple;
	bh=R2OnpwciP0oC4IIhwvb0aevylEV7Krkhr8J7EtNkXG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NpmNJhB2Iv6LA4dthP80YhcIGniuSVI8vJvOpHdFRR7uR9N53PAebHiixh6hq2dUt8WkKk4WinecQrfNlB6HCzNNqKvS2vRoJuAMn+GCjxjkiRzOYVD2l0yr+ZR7pPjzbE/SkB2GGMPGZHhrYs9A4CbIGEqwSJh4C+kbddADKrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EQ738Xvk; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ec3f875e68so7851001fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 06:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718802892; x=1719407692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iQ0JJofFrf5mr0BiiHPeR/6U3FXiSH0jOw38NAMwcQM=;
        b=EQ738XvkkJRWlrLNGhSx3CHx1msdZC85eWxyczqsG6paJO/ri+yesjkIE7bgFA6ISF
         K2Yep1Qq3kgoXxwRaldiDMFHEge07PByEnzE04aegOu+doE/uaHTuTPzbXRjfZbkVjP1
         0sVuENgD+c5zZr7b9fCcpxa/NU0nQRw5D6rMWgABFJbwZJ0CyjOgJ563BvWu0sOK3u0z
         nUjFzFN0aiNiZguibzhFXTFV/gHBA6vAhTw6xnTl1aC0XM/9E/x1xVbtSVS/kESjgJe5
         OCx4AyeNxvpAvtQlimkI7VZglqrvVPoPZpBEeUB60wFaxaawJxjp8rwaFoDdw86F6Log
         T63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718802892; x=1719407692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQ0JJofFrf5mr0BiiHPeR/6U3FXiSH0jOw38NAMwcQM=;
        b=o7o6un/vw9NDB0GDMboXm5akSLT/a/Cgl+S6b9XKRDnsEBRsYc+1yz2L7JnXuL0vUt
         FzTUqUP6E5jLHDFIdddq4crruhAZJbTPCthzvoDyj0Z24M0d57DW3xU48HrtuVW/3xNG
         Nw745JxHia9YP6HXbDeCwA2ATRFcLVg2LeXCt9S0B43qlqRpnR7tz9/Dw+q6aNx6Ddav
         DL4GQrTAwY/8z+93vsmmGvl+POoYSIHUWGdZ1PZHUMmfdKETKEaYpXQmo619Twj2rOsQ
         c2u+rn3cqXyG+MeUy4J8awbBMjMYUKknTVackda7F0dQ0wV/mYCazAdPyR7yckljrN4K
         sM1g==
X-Forwarded-Encrypted: i=1; AJvYcCWrEzjtkCoIewxuxcKZw2885pW8wqvCMa56rzed2jt8FBBvRM2xcNWdb/fsgHSUGr2ffOEt487qIjhDbjFNoOooaBQs5hrCXAtZiQyleQ==
X-Gm-Message-State: AOJu0YxXbQKb+MuNwIxKlCqNxPuRbnC3lQPkM9ewcd7wUqJ4rnW7oIRT
	0HKEY6DbSgAldDVSR1+43hGDgfDcCznEjrEEmDUTuBj3ZtRtKmjshzGFcYXA8V0=
X-Google-Smtp-Source: AGHT+IGAr6zFuKGag3tE7C+jY+4YsV2wmalrV2K1g5pJkLBgtvhd5T1iZT+QiolbE08sTlZPilLXIg==
X-Received: by 2002:a2e:be94:0:b0:2ec:3dd4:75f7 with SMTP id 38308e7fff4ca-2ec3dd476e4mr15443801fa.47.1718802892125;
        Wed, 19 Jun 2024 06:14:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c07012sm19724001fa.48.2024.06.19.06.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 06:14:51 -0700 (PDT)
Date: Wed, 19 Jun 2024 16:14:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Komal Bajaj <quic_kbajaj@quicinc.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Andersson <quic_bjorande@quicinc.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable secure QFPROM driver
Message-ID: <rx4kwsdzprnblczndf4t4ditxl64dztkzooqljpvz6eehuqqgy@rv745qkxmxmq>
References: <20240619105642.18947-1-quic_kbajaj@quicinc.com>
 <5582a2a0-c772-4573-9d55-2f963cb87df1@linaro.org>
 <ZnLKwqENxC4wzrUm@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnLKwqENxC4wzrUm@hu-mojha-hyd.qualcomm.com>

On Wed, Jun 19, 2024 at 05:40:42PM GMT, Mukesh Ojha wrote:
> On Wed, Jun 19, 2024 at 01:08:48PM +0200, Krzysztof Kozlowski wrote:
> > On 19/06/2024 12:56, Komal Bajaj wrote:
> > > Enable the secure QFPROM driver which is used by QDU1000
> > 
> > Qualcomm QDU1000. You are changing kernel-wide defconfig, not some
> > Qualcomm downstream stuff.
> > 
> > > platform for reading the secure qfprom region to get the
> > > DDR channel configuration.
> > > 
> > > Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> > > ---
> > >  arch/arm64/configs/defconfig | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > > index 838b4466d6f6..c940437ae1b3 100644
> > > --- a/arch/arm64/configs/defconfig
> > > +++ b/arch/arm64/configs/defconfig
> > > @@ -1575,6 +1575,7 @@ CONFIG_NVMEM_LAYERSCAPE_SFP=m
> > >  CONFIG_NVMEM_MESON_EFUSE=m
> > >  CONFIG_NVMEM_MTK_EFUSE=y
> > >  CONFIG_NVMEM_QCOM_QFPROM=y
> > > +CONFIG_NVMEM_QCOM_SEC_QFPROM=y
> > 
> > Module
> 
> Should not this be inline with what CONFIG_NVMEM_QCOM_QFPROM is having ?
> Either both CONFIG_NVMEM_QCOM_QFPROM and CONFIG_NVMEM_QCOM_SEC_QFPROM
> should be m or both y

Looking back in time, CONFIG_NVMEM_QCOM_QFPROM was enabled as built-in
to get TSENS to work (which makes sense, we don't want the CPUs to
burn). What the actual users for NVMEM_QCOM_SEC_QFPROM?

> 
> -Mukesh
> > 
> > >  CONFIG_NVMEM_RMEM=m
> > >  CONFIG_NVMEM_ROCKCHIP_EFUSE=y
> > >  CONFIG_NVMEM_ROCKCHIP_OTP=y
> > > --
> > > 2.42.0
> > > 
> > 
> > Best regards,
> > Krzysztof
> > 

-- 
With best wishes
Dmitry

