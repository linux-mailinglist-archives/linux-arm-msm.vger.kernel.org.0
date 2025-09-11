Return-Path: <linux-arm-msm+bounces-73179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59840B53C6E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 21:39:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD4A4AC1A4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 19:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF1A266B66;
	Thu, 11 Sep 2025 19:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZ3aj/eM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBE1262FC2;
	Thu, 11 Sep 2025 19:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757619438; cv=none; b=dw2am4dhC4Z8mz0Sk7EpSRR6wCZicHiN8d//XihIqKDTdNZ83hwPDhnGKtNOeqQyPE/4cTwlQ0L0/Ts2kpVm4OtpdybYPg3gAkJmBX7D6NuDgghMOoL4EpwaEoCf4GHKVesKVYuuY1HWAht1FLf0Wieliy+9h1lC2yJbTjlxMRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757619438; c=relaxed/simple;
	bh=x2Qu5C2hbQGtbAzoIdLfE5JLrAJ8pM93bzb3A77h5gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cxzTHsipgGkQ+iMDVGMFe+ieqVm4y4qgfPeVCnilNWc1PPt8kzKFGtKYnR1hz3GG13mVRTWTYC9LSKOmq58gyeaL9/ScA1J4NNZkAjesmH7XgYw4K7cczn7sl8v9LTmRoD6fWHcu09uBiDtfMZHkDbvXU5oLq7rtoR091Rwa1fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NZ3aj/eM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9F5AC4CEF0;
	Thu, 11 Sep 2025 19:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757619435;
	bh=x2Qu5C2hbQGtbAzoIdLfE5JLrAJ8pM93bzb3A77h5gk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NZ3aj/eMVswoEBZIVpD95WLChbBcFINuymkZhW2LEW2B0anN38Pqaa2gh60edzlZY
	 dbyAGUZNCvpRfrD52GSz4hZHzX1yCDVPLdw2unuEfcKrYYXGBDDOid6he3A+jamubP
	 HWsybObBfVx4M63pFtLjv/8PA17Cvre6KzYRO/yj6TJzIabpT9auPH4YFOSmkX9rlJ
	 ifZUpaXs5UtTrEuwQ5zPeEaMbP4WqmHgYUWN1l42yVkt2sf33Lkx6QnojcvafEmzBl
	 WZv3dpoTpVrJorV/lN74MH1l/n+T96ti+dFoVtl2mwUUFEjSJWHNNrgnk9rrxiDBfL
	 xTRce0zMdb5hw==
Date: Thu, 11 Sep 2025 14:37:12 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcm6490: Introduce the Particle
 Tachyon
Message-ID: <ayke5rvko5osrromyvn4e4tvjujgdleefydcf7q5waru3prnwy@rchulogqfqki>
References: <20250910-tachyon-v1-0-5090bfd133e0@oss.qualcomm.com>
 <20250910-tachyon-v1-3-5090bfd133e0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-tachyon-v1-3-5090bfd133e0@oss.qualcomm.com>

On Wed, Sep 10, 2025 at 06:05:39PM -0500, Bjorn Andersson wrote:
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
[..]
> +&gpu_zap_shader {
> +	firmware-name = "qcom/qcom6490/particle/tachyon/a660_zap.mbn";

The should be qcm6490, not qcom6490...

Same with a couple of the other firmware paths as well.

Regards,
Bjorn

