Return-Path: <linux-arm-msm+bounces-38039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 194B89CEC08
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 16:13:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C41621F28B4B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 15:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 557B61D47B6;
	Fri, 15 Nov 2024 15:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g6uWxtGi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CEF1D54C2;
	Fri, 15 Nov 2024 15:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731683588; cv=none; b=Tf64QlIEMuxE9btQkDuB3rh6k29dgI3DGZssWbgVcTVwJhyBCPa+vQabskreE5JG70P+3pYLcG+1ai9i9IFK1B66kDKYqQhKWJ6wrfTM8Ka850Q7kmjWcd/wOT74RpdT5w7asdXJRofMWQ3WBgZT3tFepkekM4mx//Vu6hhC4Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731683588; c=relaxed/simple;
	bh=VFJq4FmuDHQna4ybq4+6PkEP/orjQAqeR9GFf5ZES7c=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=TqmDFsV0D4o+WohjwMsN4APOa7b/VqOGiyqbJr76/zadd97f8N71uPELFfHeKRgPFhZ73ExKmaoSEJ3qPtzQpN+gRIwlmwFgR7pvHl6xjFX7XAks85H6h4MC+XNbsgxo0s8reewucB5jxw8g/WBZyDddeAXl1eR19L8R2wFR9Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g6uWxtGi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC90C4CED8;
	Fri, 15 Nov 2024 15:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731683587;
	bh=VFJq4FmuDHQna4ybq4+6PkEP/orjQAqeR9GFf5ZES7c=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=g6uWxtGiiieXpygDK5p0qO6QVx+VxCDbm4Y90Y2cXoWhd4oOeo5QBmNQZ+RBmydE5
	 g4qtosk4ebPG7Uswm2+L0oJ9uIoAxI8I7TUqAnkW3I3m5Rc6qR9GR9nuBvcSefHQFX
	 zSvVk5dKg/t23ZCEHdmuWUUu56ecom1qLVyqy59sXLkm6qahkjPLAgKZpUrBdBNC4a
	 DLsl0rfyEiGlCcLpIKfl8VMSRpI5xsoXR7hYKyrSIayjWn8LSxFCu2euXgQ7GqwRk2
	 vYlxd9Beyu6p7YcZ4gdQrB0hE+hV1Z50Zru2swQPVR/ETNx1eh5JUmKkeKUnscFC9q
	 jkNk62bF4JOhg==
Date: Fri, 15 Nov 2024 09:13:05 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org, 
 Stephan Gerhold <stephan@gerhold.net>, phone-devel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>
To: Jakob Hauser <jahau@rocketmail.com>
In-Reply-To: <20241114220718.12248-1-jahau@rocketmail.com>
References: <20241114220718.12248-1-jahau.ref@rocketmail.com>
 <20241114220718.12248-1-jahau@rocketmail.com>
Message-Id: <173168321575.2749850.6753805357544168038.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-samsung-serranove: Add
 display panel


On Thu, 14 Nov 2024 23:07:18 +0100, Jakob Hauser wrote:
> From: Stephan Gerhold <stephan@gerhold.net>
> 
> Add the Samsung S6E88A0-AMS427AP24 panel to the device tree for the
> Samsung Galaxy S4 Mini Value Edition. By default the panel displays
> everything horizontally flipped, so add "flip-horizontal" to the panel
> node to correct that.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> Co-developed-by: Jakob Hauser <jahau@rocketmail.com>
> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>
> ---
> Patch base is kernel/git/qcom/linux.git current branch "arm64-for-6.13".
> 
> The panel driver was recently added to linux-next:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c?h=next-20241101
> 
> The associated dt-binding in linux-next is:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams427ap24.yaml?h=next-20241101
> ---
>  .../dts/qcom/msm8916-samsung-serranove.dts    | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y qcom/msm8916-samsung-serranove.dtb' for 20241114220718.12248-1-jahau@rocketmail.com:

arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-acc']
arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-acc']
arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-acc']
arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-acc']






