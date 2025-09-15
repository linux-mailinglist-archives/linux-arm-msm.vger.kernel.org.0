Return-Path: <linux-arm-msm+bounces-73462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1F6B56D60
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 02:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62CF6177049
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 00:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66F2819F40A;
	Mon, 15 Sep 2025 00:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HVCvm19h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394B7288D2;
	Mon, 15 Sep 2025 00:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757896182; cv=none; b=C0YeB1nU5c5zjNg4nWWrPTX/gCswm5Q3EjmxDXXYetyQeuVjyo32Gvc9oKc/J6M+IUYh+N7EPfE7gDn2KPxDX0oDjBhpgLbwU5b8FcMZ/UkGOxcCe7+Efu7aQr711NsxPGzySyxd68yEXQA+gl8YOxS0tPVguSO8wlYLaceOcW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757896182; c=relaxed/simple;
	bh=MX16C5DW4m4MrQC9UWr26UFJ78bY3akq+iJz03sMB3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eNlaY51Z5wvgLiLPJK7XftKmDhVm89qzga7dlu1vm+beeUVhirMltRbW3FLRr9VxI8+bQ9EY8w4ABMP6/mV8n/YuPHJhwm8EtRJCT7z5+Qxo+y3ys1DRNDIQtGkCWyH8OnGoJaJt6kcNMtyAtQavgTG3of02i7C274BzvgakYro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HVCvm19h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 813B9C4CEF0;
	Mon, 15 Sep 2025 00:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757896181;
	bh=MX16C5DW4m4MrQC9UWr26UFJ78bY3akq+iJz03sMB3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HVCvm19hi9EXvwywJrq/GHNZpTIWW7Bdsw1vGCgA+WtfaXMYKaUC3eXMpzlvH0zNv
	 x5zAS9D25+6LLH9svGsk+rfu8Ij1I1tC+tHoqfB8opXfcrQ9bZTzYauD5xJlMSm4T7
	 Bdojn21xuFr7cyUirLW1AJggzqFPd9WHKRANPaSICBUhz6B0fiKsXiA5++OEOssyHU
	 sNRAZkI1m+BSQsMsn7l8ujdip9Cyh9uWuVNPZ6rDRfDDzyLU8rBtuWIp7/1o/2hzyF
	 NfjzBwpzlNW8h0aNrnmvol/Us6sw3wr9AA43iIEhuys+ZKf4ehRj8wizQrW/WT0GsO
	 Rw9afYx8nirag==
Date: Sun, 14 Sep 2025 19:29:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: qcom: Add Particle Tachyon
Message-ID: <175789617997.2314819.4764097790883053413.robh@kernel.org>
References: <20250910-tachyon-v1-0-5090bfd133e0@oss.qualcomm.com>
 <20250910-tachyon-v1-2-5090bfd133e0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-tachyon-v1-2-5090bfd133e0@oss.qualcomm.com>


On Wed, 10 Sep 2025 18:05:38 -0500, Bjorn Andersson wrote:
> The Particle Tachyon is a single board computer with 5G connectivity
> with AI accelerator, based on the Qualcomm QCM6490 platform.
> 
> Document the top-level compatible for this board.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


