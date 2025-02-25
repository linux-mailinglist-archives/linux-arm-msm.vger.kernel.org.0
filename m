Return-Path: <linux-arm-msm+bounces-49287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4D8A43E60
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 12:56:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 381C33A8116
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 11:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A0B267F4B;
	Tue, 25 Feb 2025 11:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fhhx23vt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE47267B68
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 11:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740484330; cv=none; b=QQyUZSLpICxuBPhluKSRDW/Fcy8XnY0K8d+HU1b0AAcc6Sq2CdZHeC6YqRQsTDbxGp11tbn07S7MXBovDbhVwe/XaGVkknSpdrP3x+1z1WQkp4rsh9itLpkKF7/FCm3+er/cudCQKCvm9P3pTrLmNoMS0kVVXaWLLXPuB2SNnKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740484330; c=relaxed/simple;
	bh=06Py7aJp14BHUIJAvzvlfHnZrSajm4jMw3RXc7l2ukA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FUYGmRX2Sbu9LdGO70JDVxqKRmdDbGBI8Sffj41XBdfjraRZoohH+f3wNGi0HjxVr4mhhh3i0Ze7ecal0TAQ5HSKp43xRzFizH3vu+zoCLYynodvEHyAMWwBZD3lfFlZnaLMfGeFN19mEe8gHkFusRRU8NYfoR6KKR2VyhBi80Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fhhx23vt; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54622e97753so5045838e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 03:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740484326; x=1741089126; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3wS9tak0NaNpAhLlFW6uyty61j0I79uv4Vz/GWJtmTk=;
        b=Fhhx23vtDyhPWmr52coCHVGH3HTuXpIT+JMJoX+OyQ5JSQIqiLiGO5Ix+5otyrU9c4
         R7kUTZ3HMznaOxWFuV3TUSXLHi8T5YVAm8mLz4aVEAwcapnLwZySY9wTbmHc3M8gZXAL
         qnA/S4uFMWTii4KQayzWa0BXkVOzkx+ACKFJUyOR8fxUqvRU0VhrghE32Jod1YlL/MI2
         BAXG4wssYVUL2DetcQ0eVbnU2XhdW3kzWywWEiB3nVr2AyEnM699J8s8PNhdrHbPCjBa
         4LHAQZbHPrq12e1AdKRGqNUXmh+OXUCIn0MnoMzpS3V435udP07OXuhL4D0L1NegVeKA
         DH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740484326; x=1741089126;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wS9tak0NaNpAhLlFW6uyty61j0I79uv4Vz/GWJtmTk=;
        b=XsOiiK8NXDhkFxtJW6m8aDk8/8wuw/g+8yqDhFeVHCgBGjtN9/nbxiPqMWLE5RXdL+
         hJpomaqAKxPHorJpeJns7GIrtRU0dkPbpbWjCZJEsMd1ob6pomo5k2KrUkSLlIUg/qHz
         qVjsQwXpOcEqqA1y0qjMN773DrXah491HwcKXgAU7gJJ/6USyIH0d9M2l1iGmT+jceml
         5ZsBU7Xm8VvsJSf5ZaRoYqXUjDfQB3Gg7QHli0oYmi+mUsghofBLS1RvGWzEmK4zXw7A
         uC9l0WD+QvEZ9+P1glrUIqniIqYtJaX9qhGfql3s3XU9CshVY6JNEuH08/XS912diyVq
         MqjA==
X-Forwarded-Encrypted: i=1; AJvYcCXdNxtRl/GfraMtREo/JXLt62F5LPxXy6zJ4DXdvqC8BDfromnLG1NdgAI915Uev1ydCc5BQS8XFJ/wxCMY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2zWhoIhjpkBu6WSd99yZc0/+0/t7WMfNHtNqCmA65CbgV5FRX
	zdAQ0DU+Vb2lF2akl+TwP5gZmlNZH+gyR64anaLFHU6AePlS3IOd/b4zAsKBr5o=
X-Gm-Gg: ASbGnctsbo4GbBEZ/dAHHG2+nLnA3/17c1d+WqleohMD3M7aOW6qVfSAoPW0DlKiK4T
	CXOSsqMssezEtDTr6bMZChCwDK8HhnIBBl7fDfkBIwbjTRDaNIa51VKXS/oaF4bVe+wAtp7Xm7o
	2N1t1LLx49S/Ce3h5G1+b9Or2WQi1wyoRiStu2ZgHIeP8GGFJPJaDLLz3dELulQPCl/V+q+tBeg
	cXsGKfEkuJuH0c1TbssSNKgqbUCHek0cBAe7lh4A6KkgOrs1pt7d2LQfq/P0zvAUMFRz3pAR+Xf
	jm6Q1IIHjAbwXoaxUXdvbp2AfxTneR395u7joRdmhqmro+qk3uajAXleORsa/vL/onb+qEZiaSI
	MJZxkbw==
X-Google-Smtp-Source: AGHT+IHaCOYYY1hFZ2o6pI3+gD73kquLWGQBBvEHfmt0Roiv69QaC0Cnq2VStk0d5J4mPbpT0ertdw==
X-Received: by 2002:a05:6512:e88:b0:545:457:e588 with SMTP id 2adb3069b0e04-54838c5e762mr6148340e87.10.1740484325931;
        Tue, 25 Feb 2025 03:52:05 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514fa1d7sm151829e87.238.2025.02.25.03.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 03:52:04 -0800 (PST)
Date: Tue, 25 Feb 2025 13:52:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	chaitanya chundru <quic_krichai@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	Jingoo Han <jingoohan1@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, quic_vbadigan@quicnic.com, 
	amitk@kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com
Subject: Re: [PATCH v4 10/10] arm64: dts: qcom: sc7280: Add 'global'
 interrupt to the PCIe RC nodes
Message-ID: <kkqydwutpaxzj6beqbdkmjanpzvvloqc3csm4ze2phoibmvmoy@asxc2ffipkgj>
References: <20250225-qps615_v4_1-v4-0-e08633a7bdf8@oss.qualcomm.com>
 <20250225-qps615_v4_1-v4-10-e08633a7bdf8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-qps615_v4_1-v4-10-e08633a7bdf8@oss.qualcomm.com>

On Tue, Feb 25, 2025 at 03:04:07PM +0530, Krishna Chaitanya Chundru wrote:
> Qcom PCIe RC controllers are capable of generating 'global' SPI interrupt
> to the host CPUs. This interrupt can be used by the device driver to
> identify events such as PCIe link specific events, safety events, etc...
> 
> Hence, add it to the PCIe RC node along with the existing MSI interrupts.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

