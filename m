Return-Path: <linux-arm-msm+bounces-49748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6DAA48822
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 19:48:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF833188D69B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 18:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEE321F5852;
	Thu, 27 Feb 2025 18:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tWqiHQel"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD6F1DE886
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 18:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740682100; cv=none; b=U/t3GfMnd40KDqoDDEZ2Xay07aV4f1CMS74l7elMWDlUOXbDZSTdgdPV7CbfDpOr6e36k62N/G9jhal5m8ybOFjPIHvZnbmJtRaBWkUDj9ZNsoyXh3OgqSeKri3yl5FutUDyAVNH2SwRrWZ5RCLVberaTG9f7Mqed7XHnpJIfto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740682100; c=relaxed/simple;
	bh=Htmc6kuxWi2eizHOPH/z948eIEA0rcPXX8El+BENUM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sMVO3cWmnpyQfLBZJeJzO+GmXtLbauluwzcJ4qh6knJbjKSd5Ykz9PflWSc+28zW/sleAqK4f8O2HTYFoEQ3BPghyEBJ5w2jPZaO5R2m/SpSV9bz0eEV/O50pLd7guiucCpG3FHNEvl+QQyoVcyxmzZw+FDz/fuwmyCeqzESeR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tWqiHQel; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4394036c0efso8883305e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 10:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740682096; x=1741286896; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bb8KXZX3ANfGIeTHJHU3o05Jpgv+u6AQgRQwt9Zi9Z4=;
        b=tWqiHQelNy4cfMxGOJ+rkm1AOU5UpKjCz9ajupBYL5cDcdxdlz+DKLuYYEYg8KFcNW
         wGNqAp37N28v5jWiHRpjLYVgpCQZs34CMKmAmFSdr9PRN7rBA/Kv5bCYMzFEWvhMLgNP
         HzttUEgzA5qm3iZcavj4lyFlwuqIOtu4zb/Cptq32L14tQCNJQFtES+0ljhySiwqmrOq
         PjcaPkVk4KLsmsptFCsbdO+Bmo6XfecvAeOvI2wKZnt4qcVUCbwK/7FQv61mMCZhtEUK
         dOc1e8Fg0LJrETdnAeTi1Zpx4Kotk4lDG41woT3dlpcEs+4kVrnovFcX/o9k9HO6LHj0
         d6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740682096; x=1741286896;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bb8KXZX3ANfGIeTHJHU3o05Jpgv+u6AQgRQwt9Zi9Z4=;
        b=lr5Ck6VGe9yYwO9iubnzR9BHjmZ0tPWRgAZiqzkO3i8VbGHeT+514zlPIAg0KvS2dR
         8bJBadofRF8V0qdDDTVRPublvx89+gMIM+MZUzPYTUpbxHho2LPO9rD50aTgIquLPIIv
         63TTwyuQNQyWM3qDNX03j8n7Vk7Ccx/ru+DRgX5dCtAm1EauufrZllLe+CnnV5I7GBDE
         fjR5Bih9wg+13URMPOTadD7/Aep6LIVu5vXavYo1pIpTG4PJvYGp7eGePG7FNyPE5TQy
         +d23x+xGhX3ah1jtZgGAoeCT9JOn7vVfr4bvSWbaELfmd2UYsp0s1Wk6doCRxctpzNGe
         TPYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzJVWEDoXdK1VUpO6mOIzmc+RAslR2gRyqlum+yaOyYWcLZAsphn9UQDQ0Oxn2C5AKgKwVBZ47zzyVX8e2@vger.kernel.org
X-Gm-Message-State: AOJu0YwOCToNSUBV130RDL5x6+xD4tL+kBpGgGzFQTqwvsMYVbgtSUiK
	DNG/qRcf8LcGPWmhNi56kKi0G1V74CzJwETTmdSGgB0/+DpCpN660PhN3XCftYM=
X-Gm-Gg: ASbGncuKiTZE6C+6271jombz1xsHjZB48mv4vbdNcLMTWry1IG/SrwuQ8DVZEluEozk
	c7rwOZWmOhjNT849npHkDWovjLkxjWX9tDHng7ST2s3C8ydmBf40H2O9AJGp2H8EkIZqDAxdwk7
	UnWE31vHjbdoCrAWEOMMFDBNIjZJXJBBgCAgVuXClHE5aKwDtMLohx8Oe5budR+qcTk7pzHdgUP
	9OGR/x4zojyREsgVSDobDrYfmhtx/4BPEEf1xXbOLvjLTe0Af8QweijiT84PtvpEUtM/p712uiY
	5XUskf4G3TzffYGBH7q4x/QPrBYxbTFCJ/FCrg==
X-Google-Smtp-Source: AGHT+IH7I6OW3lREJS4GrA2RHi98FtxVjQEk2Xg/DMwogBGx+loLDRbFTnwNdW1JjJJdWpL7kZTwIA==
X-Received: by 2002:a05:6000:184c:b0:390:e50a:af81 with SMTP id ffacd0b85a97d-390eca64d7bmr259381f8f.53.1740682096027;
        Thu, 27 Feb 2025 10:48:16 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:1269:a239:cdb3:1db7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4844c0dsm2758577f8f.80.2025.02.27.10.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 10:48:15 -0800 (PST)
Date: Thu, 27 Feb 2025 19:48:11 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: sm8650: fix PMU interrupt flag
Message-ID: <Z8Cza7ZZxy3fbBC9@linaro.org>
References: <20250227-topic-sm8650-pmu-ppi-partition-v3-0-0f6feeefe50f@linaro.org>
 <20250227-topic-sm8650-pmu-ppi-partition-v3-1-0f6feeefe50f@linaro.org>
 <7535057b-b6fc-4831-ac5b-b68903083747@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7535057b-b6fc-4831-ac5b-b68903083747@oss.qualcomm.com>

On Thu, Feb 27, 2025 at 06:50:31PM +0100, Konrad Dybcio wrote:
> On 27.02.2025 5:04 PM, Neil Armstrong wrote:
> > The ARM PMU interrupt is sometimes defined as IRQ_TYPE_LEVEL_LOW,
> > or IRQ_TYPE_LEVEL_HIGH, but downstream and recent platforms used the
> > IRQ_TYPE_LEVEL_HIGH flag so align the SM8650 definition to have a
> > functional PMU working.
> > 
> > Fixes: c8a346e408cb ("arm64: dts: qcom: Split PMU nodes for heterogeneous CPUs")
> > Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
> > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > ---
> 
> I couldn't find anything to back this up, not inside, not on Arm's
> website, but downstream agrees, so..
> 

The GIC doesn't really have a notion of LOW vs HIGH in the programmable
registers. This is generally a design time parameter, e.g. for GIC-600:

  Level-sensitive PPI signals are active-LOW by default, as with
  previous Arm GIC implementations. However, individual PPI signals can
  be inverted and synchronized using parameters
  gic600_<config_name>_PPI<ppi_id>_<cpu_number>_<ppi_number>_<INV/SYNC>.

  https://developer.arm.com/documentation/100336/0106/components-and-configuration/redistributor/redistributor-ppi-signals

For Linux it shouldn't really matter, because gic_configure_irq()
ignores the polarity and looks only at IRQ_TYPE_LEVEL_MASK.

If you still want this to represent the actual truth, then all hints
I can find only back this down (not up) I'm afraid:

Arm® Cortex®‑A520 Core Technical Reference Manual
Arm® Cortex®-A720 Core Technical Reference Manual
Arm® Cortex®-X4 Core Technical Reference Manual

  17.2 Performance monitors interrupts
  When the PMU generates an interrupt, the nPMUIRQ[n] output is driven LOW.

  https://developer.arm.com/documentation/102517/0004/Performance-Monitors-Extension-support-/Performance-monitors-interrupts
  https://developer.arm.com/documentation/102530/0002/Performance-Monitors-Extension-support-/Performance-monitors-interrupts
  https://developer.arm.com/documentation/102484/0003/Performance-Monitors-Extension-support-/Performance-monitors-interrupts

So please check if this patch is really needed, otherwise I'd suggest
dropping it.

Thanks,
Stephan

