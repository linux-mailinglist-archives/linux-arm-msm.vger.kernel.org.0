Return-Path: <linux-arm-msm+bounces-37791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2B39C7157
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 14:49:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 419C428B77C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 13:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0160B2022F1;
	Wed, 13 Nov 2024 13:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="imgopd3p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A691201036
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2024 13:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731505600; cv=none; b=sWiovSl738p2AoEyg7Wctbf73XMasedxeA7hCYkOCIpyNKL6zx4ZEHcpD3q4FerVzNhNMUncsAjfq+09IPLc08aMgFPsLiUPoWgo1icZkgyHJvkhC7AdAJ8jM41Tb2KoEbYJ5Aq0SIjSQ9xO8ICe7ztygikf2CC3GC+GQ6vsPHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731505600; c=relaxed/simple;
	bh=EdLD+Q8pDtxewY4WF3zggOuWnFq3zsa0mjLSXKPIkec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WnLFDU6hjpctbAHs9q8pU1QclDrQDZvXHhGjP5N7KLoGaQmPq30ALatS0fhYGlLlTsriWomSPY/4cISZG/DC9eFoPBVzI5XESPoSbm4OvcSQxJJYeH63ywMD+GX3Tt8XPktSM7w9zho4DjFDvXhYKQhDxPsXND3lLu1yACgTm4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=imgopd3p; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb584a8f81so62611011fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2024 05:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731505597; x=1732110397; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EdLD+Q8pDtxewY4WF3zggOuWnFq3zsa0mjLSXKPIkec=;
        b=imgopd3pnBZLYjb72bdPfPpUU+NdDrw4BC5AhWQw5pfagVjMIp8UENu0HmEFL5RbIb
         /pAeZH8bUcai2ufP4rTmBGHSjf2uB7p8BYk9vXvbbaRdRiV+STSFKBnw9tANQ4Z+gWJH
         zjNYYs4TsU+hUmjl5GXeq67lW9Y6RaJmLIribn6mmCNZU9jCdKodan3rAnpNZvcarceA
         uKvJoOMlzPDspcmrGdFEMwrmU1iC18LgmZJVYC+y4Trvv+MF7CuEcvxFh4bCIoD8kRTc
         /ESWvzuwOpBvfRofNKXP85CIX452SKBwDOoQEVF7bEann2d12x5RyRjma1FJw3pzvY8I
         gaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731505597; x=1732110397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EdLD+Q8pDtxewY4WF3zggOuWnFq3zsa0mjLSXKPIkec=;
        b=iXCIMjYU42BFmj5xBiJRoTkWRkCBO7GkTWB5KdbBBBb2Fx/jWmZFaOTwjP/dA26MJa
         S99GahAKqY04IMBu5EwMkIH5NgWLWI5Enj7h8RW5tfS42ktfsG+AIiUuaXvaSxcHsOaX
         UJbtyA2me5D2TVCiEX7LqFxlb0ruUei436gvK335w0Md7bWdT7z5iR3lxEOXUpcFRedR
         dByX3oKMhuKciKKeF3XzrxpXcBLfgxBzvnsyOaUoSQY17YMPMpnCBnm//69JJ7V21bRs
         VEKG21898DQFcjWNhYqPo6d5T8+6msJua8hiELcYlpnAyWOsoHIQUkeeZNRQvPMCCvIY
         oAWA==
X-Forwarded-Encrypted: i=1; AJvYcCUR5d4ulBfKEDbjog9d9HIh0B0aAFy/Jx2Ed5gGeqRO1ypg1OItRXycsM3pAa+qiCzv/eKO+QzG55PMmki8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9c+NRWX+a7hQ4Znx8I2/SASwaVbzppMylD5aI4ccV84tK6nZ1
	MQQLrLr/E9PREynP3PUuOI0BR9XrFOqTArioZ5Qs3d+2bPYnwBqFMbnoA07tkf8FhXqK+IZvOaQ
	uvXUL+4nHHhhk6Tr2VQnYAXMnxEl1d9eB6YwPYg==
X-Google-Smtp-Source: AGHT+IH78gKDxiLNiG3PdvB2QCBIQEbIx/9ikXcexsuPISd7pctKrNBtAfwjli1J6tIfmE7VP/Ox9gNfWjgsaotqPb4=
X-Received: by 2002:a05:651c:543:b0:2fb:2b5d:215d with SMTP id
 38308e7fff4ca-2ff201284e2mr97745341fa.7.1731505597462; Wed, 13 Nov 2024
 05:46:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112002843.2804490-1-quic_molvera@quicinc.com>
In-Reply-To: <20241112002843.2804490-1-quic_molvera@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 13 Nov 2024 14:46:25 +0100
Message-ID: <CACRpkdZ8b5k9NHq1ZiNaofUg8_jKHEHvxD=T1GRy86Mb0rS2zw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: qcom: Introduce pinctrl for SM8750
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Trilok Soni <quic_tsoni@quicinc.com>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2024 at 1:29=E2=80=AFAM Melody Olvera <quic_molvera@quicinc=
.com> wrote:

> Add pinctrl block for the SM8750 SoC.
>
> The Qualcomm Technologies, Inc. SM8750 SoC is the latest in the line of
> consumer mobile device SoCs. See more at:
> https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/images/compa=
ny/news-media/media-center/press-kits/snapdragon-summit-2024/day-1/document=
s/Snapdragon8EliteProductBrief.pdf

Patches applied for v6.13!

Yours,
Linus Walleij

