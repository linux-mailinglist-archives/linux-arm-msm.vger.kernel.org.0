Return-Path: <linux-arm-msm+bounces-76282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC31BC320B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 03:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CDE1189AE44
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 01:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F16299AA3;
	Wed,  8 Oct 2025 01:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q6YwRGh7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92690299A8C;
	Wed,  8 Oct 2025 01:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759888369; cv=none; b=f5ov9r87pcP2FFFDzBHEZuBYyBySjd0liDNkhsnKpZFsijdpHhPLEVVdESWUEWupGlZj1Ones+3Iu2KBIUwKJNI8XM0nh0BjgVAUFkig2b7lW8IObq971RkPn/0vC6D8B1b1uAstfKi9LLjbYZxnoZz3p0HKGu3IBKJCVRC6Uyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759888369; c=relaxed/simple;
	bh=Y/wrk1/4xnydHp1gNibcavnN1FK1yRjkXaMV9UkqDTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qc3GRKrFrLC15I3YsngfjInBmfRAOOXQOkx5LUNT9c5J8x8UkK2/G7HKzm3WQx5LEpHZqHhPSzXmh/szY2FGWB6OHmyzuYxAPTr2ouHt0UcqREONl8bzuDhWcGBw+sP4xjKGYymGx0yZMr7NinR9LSmDXvTUKm1DIl/D7vqfmmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q6YwRGh7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3946C4CEF1;
	Wed,  8 Oct 2025 01:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759888368;
	bh=Y/wrk1/4xnydHp1gNibcavnN1FK1yRjkXaMV9UkqDTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q6YwRGh7F0kSC/I+xenz+vWoYQaKu9PbWbsOD/O7uR5P8nrNALgejyfaU4itdUl3N
	 elnvXrgYTTKVprLbnP82VIzR/xCp/BreN1Dug8m3kaNTEDwBcSzoO6AXvpI7Bj4cZj
	 FKxPMgf5H4avQWuXLL9EqlDFDD6HR61wOgzWQfbOqOZmEP7NWIMvbs46nWhzz5+aPn
	 7Y/LiMfmIYfXda3AiSow0byzk+yXSp/A7fYOban+3oBXFHU+z919xoyi7xuEm6HH+U
	 Ml+F2x8vph8Wuvr2N2CUw6tkLgt2G1ZQYM0SADqZ7frLE2SivkywtnPDDRhBdKpCuO
	 MM+DtApzrHjiA==
Date: Tue, 7 Oct 2025 20:52:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add Asus ZenFone 2
 Laser/Selfie
Message-ID: <175988836348.1936094.2521428840092458686.robh@kernel.org>
References: <20250930132556.266434-1-xerikasxx@gmail.com>
 <20250930132556.266434-2-xerikasxx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930132556.266434-2-xerikasxx@gmail.com>


On Tue, 30 Sep 2025 16:20:09 +0300, Erikas Bitovtas wrote:
> Add a compatible for Asus ZenFone 2 Laser/Selfie (1080p)
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


