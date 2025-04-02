Return-Path: <linux-arm-msm+bounces-53054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD97A79356
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 18:38:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75BE73B6A39
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 16:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B00A15575B;
	Wed,  2 Apr 2025 16:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WryUlco5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDA018C936
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Apr 2025 16:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743611676; cv=none; b=fbjU8sejWIR6IkYk06ZjQxpw/E32+JazqKbm099PulPLmohla70XmclIMTXPKNwSV7RF61MxlhwqQ7Dh/fOH7XpuZJv2U89gNPL+rZ7J8QuIhielMJs6fuC/FFm4bFaM1v1q1rZ9TcysxEQiWtjZExdEGqeFn1R9U36tLbXCl4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743611676; c=relaxed/simple;
	bh=94iAnc9Shr1KNMRlohviLeg6vbCIV52UqCqvGoY6Pz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ccyZkiHzJjhUaUYl1/MUywUNK4wA4a4huAB9wM9BpIkBUJnfvqeGFGmANdpmpKehBhvJyuLP2dvpHUw1SlAbJW+rVbIVQplyBEAIc3iViVNvYPM72VJYuczY+UZd4/mbxh93MucguhCgoXiG7feY5mYZOyNYftLXJCgLUUJMQYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WryUlco5; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso44647a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 09:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743611674; x=1744216474; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eZdpy6Ml0Pui2AhkBW6h3RbvRJAyHYCFyqCZJKTd7F0=;
        b=WryUlco5klYSzHJfymsrOmYzaO6WCTJUOgVuVRr4yBbEyaF+Pbezy27dlOS8yfUxZX
         D2Z/I70x4+8tkPr3s6ueavbGmrgLD6VYDu4v8e79cIEpP6bE2wnsLuSH/fFDYLDA3I7F
         t4MK8io8nYaGbwfQbtKzwGyBrWO41/KEkNIRO90QWx2xEl3HsZ3up2Zon/rexd6RAXJk
         geuqbnHgqz7KFrcWRQsvAA/4YqmqpjJCBzmU5NGkZJhrTpXRZadzpck35bLLBBK4QG3K
         2CamkGp1LrC2uxwkYEZAkfoyOj01GVH3NsZVQY0lYa0yb6kwbjQeoTSoYT/6mEMGt9SA
         NnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743611674; x=1744216474;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eZdpy6Ml0Pui2AhkBW6h3RbvRJAyHYCFyqCZJKTd7F0=;
        b=Jnnbd1zXPWc0Swf0ajq+blSOrgnoSsmaYk2yh94hwjgb7k+X+0KRupSMma7MyLCdfU
         kv2MzTM6EcdFt64FgFz9lO9cOULJ0z4uhGy5FAOgANC6UBdbhJmZphCu/K+cUcjLcTVF
         E+2dNkIHnBUOTHWxWo69bI9PF0zQYlmqwd/dvCtIJbT3/X69dIv7dFod9XgC6Rvvcl4h
         qdXIvBiR/qmAg4Sa9MKUH6v/Jp7H4gyQ1fdpPUSQ6ZV77SnNEJGlBJNp2hP7YynXh0vo
         U2GEHG7BBrqGVVItLfi8VqVothF4vPiDtoVj77Jozr9UQ3WnkuXc8SaORz859BJ1ZiCB
         YJpg==
X-Forwarded-Encrypted: i=1; AJvYcCVetESMsgkXNfUJNFcuBTKBY66ks/Z1BTg20tURcMHXtDu1Luo2ZyhKtQAd+zLr1xLFC52DloXaaf1vANEg@vger.kernel.org
X-Gm-Message-State: AOJu0YxGEjZq69jUBuUQkw+EkfRxxawaocIESm6dZ9yyjEd/3w207ZE8
	Pmk6mIj3F3Bvcp9FnDvSwLuxYkTNHeUeTmNFAlX7cNzJw6A+FdC5dK/joRkFFw==
X-Gm-Gg: ASbGncvCuMcUMwo4/48TH4pQdN8d9BNRzm4wFG6XXfpYHXwbdOf6Epz25GvAwS8ayfe
	7u4SZGLfziWog4A/hLSnopX6DV7fgGALnK57YRbbkl1ShEGkZ++nGYSlLv7LJZO6peHPxdzf+Et
	EmsUhTGnPgtK7GW0I4T31FB3HyMR8Mrcy8/Q15rtoZkIXpIixXpsx8ybdN0IpyaQU6WIGNenLbl
	5RUHzgLfwKjlCwJbEexBDZG4Xo9HU9CrLyVWbXsqswLSGbw8JLUQexSK+PvNclwDTwZlhcf22OR
	UfVNC60kRAbqc7paGNcx0h0rQ1OakuJGjBcbKZhdrVgCqeEusfJbNdlV
X-Google-Smtp-Source: AGHT+IE/CzlAT3gO9ai3KbEGAzW5CvaCu5880YJUcNp+BFAEgWNGWwwMz45bkA+8xVzcrlD0wVuvWw==
X-Received: by 2002:a05:6a20:6f8f:b0:1f5:8678:183d with SMTP id adf61e73a8af0-2009f608c2dmr28766038637.14.1743611674073;
        Wed, 02 Apr 2025 09:34:34 -0700 (PDT)
Received: from thinkpad ([120.56.205.103])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93b67e828sm10156208a12.4.2025.04.02.09.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 09:34:33 -0700 (PDT)
Date: Wed, 2 Apr 2025 22:04:28 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH] PCI: qcom-ep: Set intx_capable in epc_features
Message-ID: <rkdzsql5vqk36wea5mvr34jz5t32jwleep7brigrgkuir3jlxy@qcbdb3pty7iq>
References: <20250402091628.4041790-2-cassel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250402091628.4041790-2-cassel@kernel.org>

On Wed, Apr 02, 2025 at 11:16:28AM +0200, Niklas Cassel wrote:
> While I do not have the technical reference manuals, the qcom-ep
> maintainer assures me that all compatibles support generating INTx IRQs.
> 

Yes, all Qcom EP controllers do support INTx.

> Thus, set intx_capable to true in epc_features.
> 

Hmm, this, I do not want to do atm. Qcom endpoints cannot raise INTx due to lack
of the driver support. So setting this flag would imply that the INTx is
functionally supported by the endpoint, but it is not.

Atleast, 'pci_epc_features' is not a devicetree configuration, that it has to
match what the hw supports instead of the driver support availability :)

- Mani

-- 
மணிவண்ணன் சதாசிவம்

