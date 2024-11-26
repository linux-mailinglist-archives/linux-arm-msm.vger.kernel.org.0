Return-Path: <linux-arm-msm+bounces-39192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 798E49D9673
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 12:49:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21EC7163287
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 11:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C141CDA15;
	Tue, 26 Nov 2024 11:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u/kneQym"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540B51BCA07
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 11:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732621761; cv=none; b=KMb9QCZ+AGGq6diEAyMOxj7xd94zisj3DE4TIY1yzDtly1NGJnEj4AaKWgaQgVxqmjTXfKVdzBh/ajAF+FvlymcKYQObU49Ay3e0QQoz1WXQg8hFSTbX+wAQ3Dhm7oTPifI6UDQ3axYX3BWU4PlD8WBQ7saKB0iafv4v11UMUso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732621761; c=relaxed/simple;
	bh=UGw0zzCTxmWhjk2Kr7lUkghqevSUdxS2ujFgteFo7bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMDzRZBKaXHsE4t0kxovQGJtC7ApFCIs1F0QKFt3EbmZA6n3rDWfSyF7yMfuqCiiC2T/snQqq7SrMAFZrkTdsqp1ZoobhsbdipLr6wk9b9suSvd4h0pzOqf9l7TwnDvg//1lg9pKyP1Rd8mRQIQC0gcWNV2KuSEU1YzYgM+hkw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u/kneQym; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53de880c77eso1030124e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 03:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732621757; x=1733226557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qbQUZzbSmChhIBAFL2qH1RGbuk5eGQ4M+u90/hV2Yco=;
        b=u/kneQym9SNLuY38M0eMt+LwbmDISko6PJAUxodZ4o+ZyMEyEXNrEB5htcPL76FP5g
         yNEKs15e0xgUG93NbHOaRLM3AEwQP8BU1RaU4UUwgXvjcBuLYTMV68MucNjUDQCmsxEj
         LM5SutlkYMgVR82ooMhKHsO2HRiOFx9vaOAHwzI5syudolkhpPzGgRZjMWo0yG3k3pUk
         FKZ6784j1bFAq8Q49UMZvW/SBecLohZqLiQOkHFwGpuFKmQo9o45+6amsGZiDvjYnOOt
         dUm9OVcxcmGYYZZhtf5dAemWEtNWPWxVPVPtid3PsIVnBhtVXALoSFeh0t2PjEoP6ofb
         2bXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732621757; x=1733226557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbQUZzbSmChhIBAFL2qH1RGbuk5eGQ4M+u90/hV2Yco=;
        b=pW52F+yMgPs1MNoGol6moow9ZY0gXYe/QnHele+cNel85DkWUB+mX0isFIUNKG4U2l
         uHyBj6Dwf5upnbDomXrJbVcuIOt55vlioR5a9AL/n2GMNsOCOKLcyqgXUwJmStd8xVWh
         3L/COI6RCKHQxNU4NML+7zcx36pRkzHejQRM8leErk0/2WAeRx/gQ7j0wQy9O0jnVVVD
         yWXPDWkVfOawBG0v4+TUoFi1GmQ0ac0rt+zYcvdKYYVsSkzEkY/FfmYV74UV/HvO/asZ
         /v0s517GhGbpeO2Arlg3Oq87aCOyT4JC8ym4Yd4d9VrrED0UjvTUtOYZhvUXrVV5UQhK
         0jUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxRKmCtJ7mRLXgTndyGTKx0gaKS0tR3sJF3pGNisWLoCM7e0Tq1HAX//Mj+4YS7cJeV7UhBK0fmUn22PuT@vger.kernel.org
X-Gm-Message-State: AOJu0YxpyI+VWAepHNuV6iOUuczuoubmV+W244ABFe0XN6dO1fiwQmG0
	hAN+LdQMUIYRlYy5TgWw1vSHaEU4n/SZZhX2SlH+WiSeskHo5y+YUoVY0YWaZ2E=
X-Gm-Gg: ASbGncsFyEdXinbpNdaVUpoJ/JTsDL/8J0B4kESzhHvYGb8PsvXCWcoB4iG4QM+1tnm
	kCASWAj5s+AfTYYh76nsnDeZjMr1QB6mQIuiSov4u3abjyu+rkBg2R2HicSPWTZVD0wt2el0zJd
	poQfb4bg4oBcCgF/ojvqRNP5oDitABSYtPp97Qnkkp8tUl1J86auXax9rBpUbQeiAJNwjnS3o5W
	+U+BLNMmDUAOr0De9wxx/E3tXvVsddQfSQJsZy1DXwvhn6rpTbcTeYeSesffWoUf2o9CY4dxn3+
	ZS14HSfgzM300PwEB1vGuft3YcLXzg==
X-Google-Smtp-Source: AGHT+IHASf7kbq6ptV3Ip32BjIMPh2Df4iR7dpz+DS9GMEkuPq44nPlThPmRMDSlE/KTqC3KTABcig==
X-Received: by 2002:a05:6512:b17:b0:539:905c:15ab with SMTP id 2adb3069b0e04-53dd3992d93mr9289024e87.32.1732621757253;
        Tue, 26 Nov 2024 03:49:17 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2481424sm1996842e87.133.2024.11.26.03.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 03:49:16 -0800 (PST)
Date: Tue, 26 Nov 2024 13:49:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8650: Add 'global' interrupt to
 the PCIe RC nodes
Message-ID: <vhyqpnparlikqpzltdi6suo4emt7ezyawgz6neyjssznlm7ank@pt7cryux7jbp>
References: <20241126-topic-sm8x50-pcie-global-irq-v1-0-4049cfccd073@linaro.org>
 <20241126-topic-sm8x50-pcie-global-irq-v1-3-4049cfccd073@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126-topic-sm8x50-pcie-global-irq-v1-3-4049cfccd073@linaro.org>

On Tue, Nov 26, 2024 at 11:22:51AM +0100, Neil Armstrong wrote:
> Qcom PCIe RC controllers are capable of generating 'global' SPI interrupt
> to the host CPUs. This interrupt can be used by the device driver to
> identify events such as PCIe link specific events, safety events, etc...
> 
> Hence, add it to the PCIe RC node along with the existing MSI interrupts.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

