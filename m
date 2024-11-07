Return-Path: <linux-arm-msm+bounces-37224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAC69C0345
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 12:04:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00E112871F4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 11:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC281E32DC;
	Thu,  7 Nov 2024 11:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mKSn6NzV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247951DFE2F
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Nov 2024 11:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730977413; cv=none; b=uLgKJqJwb3qGGPWF1NzFUlR+sp9S97VItCE5SlyEO0f66F8dLrzBGdX1/eW3pIkiRpCU/DlS8SgiOVGeyEDG2carqWYbqc8zGzINe+fektHEuQUJxpuX/ROzZW7RM9Wk3jjDXgHMMu6aftMKrMXGUu9ls9o+CV/Gt++zQEKW1zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730977413; c=relaxed/simple;
	bh=iKqHLh3bNr2wiOOfMS8E4rI2cZXV3K1Eoc3xapH75k0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pSXA8YrhuB082Fz6UUBHX/6roThCeOCpoaHQe4o/1zmd3Ms2HD/Kpk7sTQog4jVCPFQdNB2fjnba+WCA5KcsBpQGqC9qr8KIB/OFUVsT+58UfTIyHVLfuIRu/uBthVQmY9Oecu93TWJiZ8FKfTdUAVM6Q2SN8vlrR+hDd76l+6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mKSn6NzV; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb5a9c7420so7162551fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2024 03:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730977410; x=1731582210; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c7dxiZ8Fn938cvUHlpbreYp+QiVxqNRUNjMx6Af0FIQ=;
        b=mKSn6NzVGrVdNuUq88sBaX5qRrLUpG+qP+GZn/gcPN1GU2zn4eiaL326zglvl/a/Mm
         z9UuCuLMJhTSKVRitpEj3kYV7iDsCZ2sRgcB8tTt0tdyWIoTIeRZyaFyuLYbGx/m8Osl
         qOqu5HKAmRNAKVVwDoeoY3EcEr+vkgBPf77QNpk+nDhPl+8YTVMO6ZFJeAeKMRb5i8qh
         SBRDMLMrW2fvzawtO8JOu+V7nqyJ6LOYrK7IuWCggIQyBQK+C9SvqYn+u0pL9ZDx0wHs
         1ZPLA7VEtQ7XGfpaZK2xdVr5JX6WmXz2J67hBbnFpDq+QGaidjzecRFegR3oenjWj+OZ
         YLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730977410; x=1731582210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7dxiZ8Fn938cvUHlpbreYp+QiVxqNRUNjMx6Af0FIQ=;
        b=jDGn7QTghnhxsTC7KXSlL1w6Q+rV/OQBEOXKJ6Ir5aXstRvNXW6v2nxAH6NWFouMVJ
         C4yhbDB0rFQqt3iF0pRT86wFAWY5F+Mh6t376E/BgFI3Q2ol89i8pjihmEwrbeL52uTz
         1LgXHagNZ1ESk1ljXqCFbSBO/WysoxrSOiBlJJJq+PMFq0EMDyDgVc5vg2q3/+tgU7Of
         AzJl5GQd/Kl7yKfR+IUzERwHJ03aGMyfGAai6JZSZ2vceA3pPJTysUmhI/p58HY5gcWb
         tg8dErYww+Jp1TWQ3O/LpjbN8nCwr0qYdoor6rI2v2Xmbxa3oQNtlp5X3Jq+q6ToL4iQ
         7Axg==
X-Forwarded-Encrypted: i=1; AJvYcCVjK43H+yNTcsyqyI/wbn5iYlnsSviVzjio+cE9aqg7P2oHRaoynOz95fSWYyseEPN2y4WrQWK+GpWRdBB2@vger.kernel.org
X-Gm-Message-State: AOJu0YydS0wrbDe3lCq3wLW36Jo5p1v9g3uNe9Rr3XOSAX4sydR98yDK
	/vrnRVm/2HrKQIgyzmx+z7BYLkCdIajPoiRQmlHN59JSuMq4sP/Eg6sApkn8KUM=
X-Google-Smtp-Source: AGHT+IGkKqe7h6NG8eXy+EJWj58RLL4weWM4MhZIOwjQm0gzdnZebYaYcD9o/zoPPSweNcBX3lKpig==
X-Received: by 2002:a2e:be0d:0:b0:2fb:8774:440c with SMTP id 38308e7fff4ca-2fedb7a2a10mr113601441fa.10.1730977410130;
        Thu, 07 Nov 2024 03:03:30 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff179a5f72sm1694561fa.93.2024.11.07.03.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 03:03:28 -0800 (PST)
Date: Thu, 7 Nov 2024 13:03:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	quic_ppratap@quicinc.com, quic_jackp@quicinc.com
Subject: Re: [PATCH] RFC: arm64: dts: qcom: Disable USB U1/U2 entry for QC
 targets
Message-ID: <trrbjd574futtatooisumtqp4idqerb5ji2g3nvdesiedlitdd@c6u7wuqhh4r3>
References: <20241107073650.13473-1-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107073650.13473-1-quic_kriskura@quicinc.com>

On Thu, Nov 07, 2024 at 01:06:50PM +0530, Krishna Kurapati wrote:
> Enabling U1 and U2 power-saving states can lead to stability and
> performance issues, particularly for latency-sensitive or high-
> throughput applications. These low-power link states are intended
> to reduce power consumption by allowing the device to enter partial
> low-power modes during idle periods. However, they can sometimes
> result in unexpected behavior. Over the years, some of the issues
> seen are as follows:
> 
> 1. In device mode of operation, when UVC is active, enabling U1/U2
> is sometimes causing packets drops due to delay in entry/exit of
> intermittent low power states. These packet drops are often reflected
> as Missed Isochronous transfers as the controller was not able to
> send the packet in that microframe interval and hence glitches are
> seen on the final transmitted video output.
> 
> 2. On QCS6490-Rb3Gen2 Vision kit, ADB connection is heavily unstable
> when U1/U2 is enabled. Often when link enters U2, there is a re-
> enumeration seen and device is unusable for many use cases.
> 
> 3. On QCS8300/QCS9100, it is observed that when Link enters U2, when
> the cable is disconnected and reconnected to host PC in HS, there
> is no link status change interrupt seen and the plug-in in HS doesn't
> show up a bus reset and enumeration failure happens.
> 
> 4. On older targets like SM8150/SM8250/SM8350, there have been
> throughput issues seen during tethering use cases.
> 
> To avoid such issues, the USB team at Qualcomm added these quirks
> to all targets in the past 4-5 years and extensive testing was done.
> Although these are intermittent power states, disabling them didn't
> cause any major increase in power numbers.
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
> If this is fine, the patch would be made into a series, disabling
> U1/U2 for all mobile and QCS targets.
> 
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 4 ++++
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 4 ++++
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 4 ++++
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 ++

Should the same set of quirks be applied to SAR2130P too?

>  4 files changed, 14 insertions(+)
> 

-- 
With best wishes
Dmitry

