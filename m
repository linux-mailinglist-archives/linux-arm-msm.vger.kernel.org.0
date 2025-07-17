Return-Path: <linux-arm-msm+bounces-65445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 910CDB08B7F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 13:03:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E9791C248E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 11:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8337529A307;
	Thu, 17 Jul 2025 11:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mt6JiRx8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271D21DE8A3
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 11:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752750179; cv=none; b=PKr48WsDv+xID+wEFNIWidffcAp7UGsO4oZhu19SZ9D90jGLCjEcDcWDkQyKBpyFy7MOSibNQ0w0xMTh9j8CHx9VdZDW26/bo0mG3OyKB6oRn/GpuR/fLqkaV77WCSGu22ZT8z0rimJj4mhZF5IHOYCF0IAsHlPmffIfAYIQ+/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752750179; c=relaxed/simple;
	bh=z1PtktcRsZ/1y2GQDdgiGTLHoyuyjdCFmoAI6pe4z3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ngy7lZ+lIC7f5FFtXuTXBW5yocA0064bAU8hTcfcD8kweCjHIPeOuvHMhhbosJKhHed0esU5YO/G3wdQQRzVb2XDvNl236cTiEufwU/LkDpyeRsTuQEH9/YWbBiOXIeYitnA5NnS336O/LgPFWweoX0jEc9FS8A/MYkrPrqmLmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mt6JiRx8; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae401ebcbc4so139066766b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 04:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752750175; x=1753354975; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l1EndfwEVXqzSptJa18PcD8xERGQdTClp/Pdy2O1mJs=;
        b=mt6JiRx8orAmTsD9IwCfSUzPZOs1Y8km8b3NH1CHhJAQH+D7Ya3hxlDyla7q8bDnut
         I66ZfE8kBp9Nqyd3/Lq2kdMKjuNS3iLIC+ua2XQHRUSuyr8Y+FMkB21pt5ESOFOBrRh3
         pyBGCRGAnCLtJ7feb6oTfxxdNAuaqj4fPGf6UKK5elTaBLB5dAvJJkHD2qBMVHmbfp77
         OlQNhCa58ghLBpI9m2vULZkbm6dIS0bhT5vpYJWJLGClyhhb2N098w13qAXUHIIepUU0
         wkykluMIyzAhl/yo4D3u3+G03UwHMDPRO0w4N4Xm6yPnyYaWGUM8EluzGyl1NL6xx0Zr
         ElwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752750175; x=1753354975;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1EndfwEVXqzSptJa18PcD8xERGQdTClp/Pdy2O1mJs=;
        b=gpli0Xbac12ukB2Hez0KEP6vejncRKvcNdO2pvASp3uZeKExLoxBWVhEqR07OHBuE0
         bJ4IcyziNCaI7oSiLjvZSB/j19YcFroXROHcjn2KPAovpxh260rDPsfKNfGSq07vZoQR
         7k0cuLr7hWeSoq5wXHSUyQ6Lz7TlOWKUPW58UP3/SyaAT+5zrTFuQ4riLrxc8t8DiRHy
         0wwtJM8166yOavMh2VWyct3BZLW8NwZs6hOfDyJ1W2V7lKrv+UgnOIGYBKo0aQIiykGL
         ztP+93yaLQBxEFamZ1qz85iNllgElNS+Bdsf6FR05PKMg6+d3ivyTu6/lNSWZoRtQE4z
         X9Lg==
X-Forwarded-Encrypted: i=1; AJvYcCWijJyuN3aEkQC7LF1SrEs2ytMyPLfa3V3aeQvmM3UFGcP32JLpgdo+B+aPWgpKgyluLejn6yIhFZxlaPkB@vger.kernel.org
X-Gm-Message-State: AOJu0YxtUL0rnDf+phn0MnoFg4moCXaMgQpihnyhNMSylIaY0W+6at6E
	xmTgaup5RUIsjQJvYEZnbD0U7/uEjCUMcN5R2e13upenqD5rZcZ4/L8Vm3n46p7HJlo=
X-Gm-Gg: ASbGncuHIrrWx9bn8iPm1Kk8HzmwKFBkIZD37+y7XFWmk6SRj2XLnHl7um5xRsDUGEO
	pfTgOG4MMPEY96w8n+bPpbY2d8Je1J/8bodLBLoAL8XyrEwj0ToNcq5s6DMc9dy3uM9kEV2abop
	pYc57XGSSEHqwoPkaFUBEQ+nf+Y/SYisKewksqcf1ml1EKHDLJTh243WMva/qwKf66I0C2kqLzN
	BJhjmrsLnS5pB1kvotqA8Ye9yhra6WlxY67M5D/+IySocTFgGgb7rzXykW6RiWHhcnBoSYHhpoG
	h1Vp0QKKtRAtwPKNrtuASA7fNN4E2yIjUrUWwo7OFNzWh1KMBWa4erOXAQS45xoI8eJPAmxqnDC
	i3jiq80evfO6yRwZYfZc=
X-Google-Smtp-Source: AGHT+IGeG4Q6tKxZC/ujOckjGsjHYhMxLU2nUMZOOzS48SXrFZHO4l2kj48NJp+pTDUjshnDsQO5FA==
X-Received: by 2002:a17:907:7f8f:b0:adb:2e9f:5d11 with SMTP id a640c23a62f3a-ae9c9af6f85mr650313366b.37.1752750175298;
        Thu, 17 Jul 2025 04:02:55 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8294042sm1343873966b.119.2025.07.17.04.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 04:02:54 -0700 (PDT)
Date: Thu, 17 Jul 2025 14:02:52 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: robh@kernel.org, lumag@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ulf.hansson@linaro.org,
	konrad.dybcio@oss.qualcomm.com, quic_tingguoc@quicinc.com,
	quic_rjendra@quicinc.com, kamal.wadhwa@oss.qualcomm.com,
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pmdomain: qcom: rpmhpd: Add Glymur RPMh Power Domains
Message-ID: <aHjYXFyQ2yTovMA9@linaro.org>
References: <20250716152758.4079467-1-pankaj.patil@oss.qualcomm.com>
 <20250716152758.4079467-3-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716152758.4079467-3-pankaj.patil@oss.qualcomm.com>

On 25-07-16 20:57:58, Pankaj Patil wrote:
> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> 
> Add RPMh Power Domains support for the Glymur platform.
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

