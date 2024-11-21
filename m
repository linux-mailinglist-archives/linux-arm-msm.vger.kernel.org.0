Return-Path: <linux-arm-msm+bounces-38724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 643559D5599
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 23:44:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21A12284496
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 22:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B91A1DBB19;
	Thu, 21 Nov 2024 22:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g3rBFSj+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B1014387B
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 22:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732229061; cv=none; b=QHCgo9zTTq06t1j2y7+K3dW0+KD+4NcsenElJ62orOpX1CTpwp9CloFYV3LqxI8FGwQjtu+hkU6xFgx+9+4IurWtOZx8Lf2gIvC3Cn/LQvn2gR/LovAN5igaTqCl9K/dhJqKpFWvtJ6NvAiZjjj6Vg41YgqmRCWkyYAIE2cqo/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732229061; c=relaxed/simple;
	bh=UvqKl313UbCoQrV81fFTtqVbmffHswlTT+HQtjKyoJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SlnluL5ckzZ7B82wNYj1MUMOeRn0JlW3YPN8/Wge5zWj+bbI0WwhK2PdKm0YcO7x8JbkrnFaM0pCKmDHIw/4jYYFc1zNyZATnNnsIplozkL0n+VKr6pxss4TIeONFzCxwqa/NFXd01w6DxeiF5mF28LvRpGlWZcQYKKErPhy/JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g3rBFSj+; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb388e64b0so17911111fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 14:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732229058; x=1732833858; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q/Nja2Bb51yLaelcKPmFVLsubQx3+cZP82+7JwtW4Xk=;
        b=g3rBFSj+cdb2AX+iX48C7PMjjZFTT9h1MTUkIcCOyk7kbfnHV0RQ98W6nG+aM+CHQi
         3+9kVmMUWjQ2G8aecV0N1XMwYRQPZklcZ9ygPLE2/Fl3j0MUK3MZB4f36NMCdzX0EnNT
         URfeh+mcVCEb8RdKF7Zl4xRAZUgDA6UTt5ateX3z3rmudcKaahZCy7GrUcODVke95y3h
         O5MkiBqtIvIdfqR86hk433wRxWZxPAVkcr7YoPzkd5et3/aG4YuvCzZYRpW+StKni7NL
         0RlVXsdrwTzq2P9UI6g3jzblCafTbRdWHLGlKTjheJjl5pcgfPyedBBD7CkWvSPCFQ2Q
         OZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732229058; x=1732833858;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/Nja2Bb51yLaelcKPmFVLsubQx3+cZP82+7JwtW4Xk=;
        b=nZN1Pdk/zme9kIDeAZP7GKAZ8xSxzX9D63inBAErLoR9pJ7zsxjzHAe6E50wW7iWY/
         I/Iiys8xfb+AgL9vmNcpWr7/peUFQn6/bRRfoFnfPwUk23+0VH238xH/m0UnFA5CuyG0
         ZTP7W9OdUS8gu9AVMXieMn8csJgghz1nXaR2Bi1LqrtHagduqoUaifRjXOA5ZE5R+qAA
         4T7GDvWT7RgkvobPEue4zhZbgtgteG9XRtgMXzBy1s74vqYnHK7SuZnpmEDozyHt9uem
         q9DqF8pjMB4FvrPmCAeIPZvT5MDxp/7u7VEV0ILl8c1LCKWFFPrIKtJ2zRzZk9LbAFPW
         PV8A==
X-Forwarded-Encrypted: i=1; AJvYcCWEYvcVy1vIxFN3TqJalOzW+Hswkz0AWqz9e4OUsqqBWSP7dITyOR+N6UxgOwb/nVNwvA7iJBbNbvxz0SO7@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwr13NAJWAFqQd398W13dmWFb2cF69J/PI47FJ4odFcBPHAVVg
	nMFGhXBWKL+khiCkQpO0JEYIdk0CfbSfBrEGeP2tfTAQfJuRoWhPenPsiOoI4kc=
X-Gm-Gg: ASbGnctsf9FQJejGRXvYFyFakqZ6+GAOL2RGHB87gYtjQNHjmqVm3PeTdfB7tSu5ESH
	JZUsgFrH0LhWOiyanZUUpXvQ0uYjRYwDcnDpx3dlpikTnV7LgIcCdpe4hZ4/rIa2dsBiVhHI4R/
	TR96MGpICMpXFi33duRp0JsAkeQUNX2Mec4sYP2nI/RaImfnqkd7obnoD0cmqBGIXjPZ/oQR7DJ
	/zvQssvK36Jr3U0ONlE+IelVOagDd0xJbJFqY9O98dyADXYdrKmWtbcJrikbsDZci3oymcENjIL
	mK663CpxitXbBbvfUha24pAVfyP6UA==
X-Google-Smtp-Source: AGHT+IGbReTR075Ouxz1EQlRJI//zuSXefAabMn1r5zxrv9eXDCoMRD5JejlOdypknkykXEjg8Eg3g==
X-Received: by 2002:a05:651c:221b:b0:2fb:5723:c9ea with SMTP id 38308e7fff4ca-2ffa716ce5fmr1747681fa.30.1732229057836;
        Thu, 21 Nov 2024 14:44:17 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa53769f2sm665281fa.77.2024.11.21.14.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 14:44:16 -0800 (PST)
Date: Fri, 22 Nov 2024 00:44:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krishna chaitanya chundru <quic_krichai@quicinc.com>, 
	andersson@kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	Jingoo Han <jingoohan1@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, quic_vbadigan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/6] arm64: dts: qcom: qcs6490-rb3gen2: Add node for
 qps615
Message-ID: <berrvurtuyujkgy7q7hn3flx5lfusrskxh5bo7xvp374zojcro@v5mkoea2xkds>
References: <20241112-qps615_pwr-v3-0-29a1e98aa2b0@quicinc.com>
 <20241112-qps615_pwr-v3-2-29a1e98aa2b0@quicinc.com>
 <ngjwfsymvo2sucvzyoanhezjisjqgfgnlixrzjgxjzlfchni7y@lvgrfslpnqmo>
 <yjwk3gnxkxmhnw36mawwvnpsckm3eier2smishlo2bdqa23jzu@mexrtjul2qlk>
 <a4146b5a-a229-4441-b123-d13e72ab4472@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4146b5a-a229-4441-b123-d13e72ab4472@kernel.org>

On Wed, Nov 20, 2024 at 02:28:29PM +0100, Krzysztof Kozlowski wrote:
> On 20/11/2024 12:03, Dmitry Baryshkov wrote:
> >>>  
> >>>  &apps_rsc {
> >>> @@ -684,6 +708,75 @@ &mdss_edp_phy {
> >>>  	status = "okay";
> >>>  };
> >>>  
> >>> +&pcie1_port {
> >>> +	pcie@0,0 {
> >>> +		compatible = "pci1179,0623";
> >>
> >> The switch is part of SoC or board? This is confusing, I thought QPS615
> >> is the SoC.
> > 
> > QCS615 is the SoC, QPS615 is a switch.
> OK, thanks for confirming. Just to be clear, I understand above as: it
> is only the switch, nothing else.

PCIe switch, networking interface, but not the SoC (and not a part of
the SoC).

> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry

