Return-Path: <linux-arm-msm+bounces-53766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DD2A839BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 08:49:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CEDE3BDEE7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 06:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A872420409D;
	Thu, 10 Apr 2025 06:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LYokwitx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E641D63C7;
	Thu, 10 Apr 2025 06:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744267654; cv=none; b=rWaxaanF8LhK2qrjof5erK42Aj3ddpdg7Y0YnrUBVcuSMZosPTBXhRUNFAUZS8MoQNFltcT2Woc6C64z4sDjqCw+7qGbgJ9U2kYoK1I8WF9fbXgFgr5666MzghKij78iG20gvPYdjW08v+zk5dvkN5pjV47qBGoWB5W15n/RUPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744267654; c=relaxed/simple;
	bh=8hkLcLDH7nSI13qsqezdG+87BGroYwujWBW8KumB1MM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q97m0YpKnCZKibtN6CWySy08oaoaob7tT1OI5e3iATvNV7F842qT4Xe7DaJR0uM32W+kNiEpT9lhJLjdAKgzKWdwohQa5mZM8sKXGn52voRsrIlcLRpLJIwQAa0w1fKR9FSR87DOxyiHw+yYleD7prKEl49s0iNDFgePByz+wSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LYokwitx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 573C1C4CEE3;
	Thu, 10 Apr 2025 06:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744267653;
	bh=8hkLcLDH7nSI13qsqezdG+87BGroYwujWBW8KumB1MM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LYokwitx/IQTfloJqvtw9W73YftJtdBU9KKufIeVzr+DmF74EgudgIWvwL5qBMRS4
	 jlp6EKU8xwPIazNpv/LIihUWSCGEhx5fFvCcm1Bg7ujD7sWjnmKQ0udLkRJCjla8wG
	 2la6raLHHiilW8u2uMsju0vz314FXtc5GtUwXJeK8FYzeqPLd3pEN+45lUkKeYRF/G
	 D7BXESDXQ5HkD+c1IXKwHovGosEVDPYnF6bSALkkjYvyPZRsUHwHyHgRz3SrHxQFoR
	 NfDhJU1HBUy+zx3oG6MjlVlciUHm1GdOTi8+mPJ1sgInqt6RWcInhWuuEeoMEzTnnB
	 WQUf2NuxzZ7Xg==
Date: Thu, 10 Apr 2025 08:47:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Tingwei Zhang <quic_tingweiz@quicinc.com>, Jinlong Mao <quic_jinlmao@quicinc.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 2/5] dt-bindings: arm: Add an interrupt property for
 Coresight CTCU
Message-ID: <20250410-demonic-woodoo-kudu-bcd994@shite>
References: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
 <20250410013330.3609482-3-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250410013330.3609482-3-jie.gan@oss.qualcomm.com>

On Thu, Apr 10, 2025 at 09:33:27AM GMT, Jie Gan wrote:
> Add an interrupt property to CTCU device. The interrupt will be triggered
> when the data size in the ETR buffer exceeds the threshlod of the

typo: threshold?

> BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
> of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


