Return-Path: <linux-arm-msm+bounces-44972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF54A1015B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 08:35:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C3EC18867DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 07:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8751F23D3CD;
	Tue, 14 Jan 2025 07:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZzyJLMNr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554381BD9E5;
	Tue, 14 Jan 2025 07:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736840129; cv=none; b=dzPEOADYZk8KvW334yMO6xguLuzYi5FixtFJIWQ79DISWyF1ebDXR2FP5lhGS3UVxL1fNqONx/+8quPavUSo9x4bx7FGp3v2CJGUxxKZp9DKMYHCbhDQvLmzEvWEkgyYRV76Fa9RwqGuhCtVC4c7TIiJ0cZSYpn9hE5cKoHI7i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736840129; c=relaxed/simple;
	bh=S/i0gCRzDaXGtYYVv2Zxs38lN7Aca/FNPAhgbOuZpcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IFS3WwBG07aNW8u/ec5rBRBODETTfe7yklIb2dv4hY2QAS83ntNFNJbz8iYyYjjFQG77CPk651KAJeQyNe+yEulis1wzmwSRxnIAvERM4DElBxwebA4pRkXWxnXk6JNDo8iy28CSBw1OyAHkaX/EoeIL/fhfqYcVh1saafRq6j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZzyJLMNr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26087C4CEDD;
	Tue, 14 Jan 2025 07:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736840126;
	bh=S/i0gCRzDaXGtYYVv2Zxs38lN7Aca/FNPAhgbOuZpcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZzyJLMNrSRaugcJCsl3kfLwZt9sLPftx/4pvZU6DN7PXFeV3VK45p20hjIknYeaJR
	 H44TpgKO5fP7X+qfTVs8keL5stccEHZvafwBTYxpFI1Ot4OwY+hKrXN+IoMApiALrc
	 froj+V6cNMOQ1dd47G6Sqn2q0lPbfiC+1PZmxQfHTTGMfRiAxuaUsWZL3fnHVsyxI8
	 GjQpe7oZGtPn0zIRO6kTI4GDYLBfp21fiS+71JNQM7KZ5e6yjZxL5dI3koUHEDOcZc
	 vuZ2BKtc6ledBSrddgHbVMKITz6V6ONzGSgNzqbFkpv0l+k78EqHZbJUvMbTUuvhE6
	 nFx11iFlG/uQg==
Date: Tue, 14 Jan 2025 08:35:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/7] arm64: defconfig: Add M31 eUSB2 PHY config
Message-ID: <7vsuyuig7p2xojx5hwnqq3wvkptd6yp4jqnckbrjohajtghyy2@koqdxx373ttc>
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-6-09afe1dc2524@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250113-sm8750_usb_master-v1-6-09afe1dc2524@quicinc.com>

On Mon, Jan 13, 2025 at 01:52:12PM -0800, Melody Olvera wrote:
> Add configs for the M31 eUSB2 PHY for SM8750 USB.

What is SM8750? Which company? Which board needs it? That's a defconfig
for all platforms, not only for your SoC.

Best regards,
Krzysztof


