Return-Path: <linux-arm-msm+bounces-80528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 360D7C39840
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 09:08:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 600BE4F9A24
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 08:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D52A301003;
	Thu,  6 Nov 2025 08:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VfT5vlZn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001FC3009F6;
	Thu,  6 Nov 2025 08:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762416395; cv=none; b=hrKh4RV7hHKHfjnY9Ic9edmkHWSJQsunCCzWZnwAZsWRlkEVP8YPKTJ+N0bbz4Fa3wLGrkQwANaY1sXOrglJbuLgkVdSCq7sjhwaWM0WUsMcDgOkTLIIHCDXiWqH5hSAnnb/U4R3TUPOuXDgN2yox1l1jKvhh5e9ACOCXFYwhso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762416395; c=relaxed/simple;
	bh=NZJEEB7lZBSzZDIY1p0BSIdTuiG56Bm2tc5geVPOkII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXjFdlKYyT84xOVwosAMc+8H7LDoEmZL/NpNQCaL3MCf0CcZKP9cz9K0HSngOabS2FvBc99cR0F6OCLpQpJXn4sz77gum2v1RI9VH5thaH3pUmf5Pi5bCGPIX1HK4pU9NcewYS9rvOj2gCe7LAgJo/mM4MUnhU3gjsNs8ntEtJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VfT5vlZn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3133EC4CEF7;
	Thu,  6 Nov 2025 08:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762416394;
	bh=NZJEEB7lZBSzZDIY1p0BSIdTuiG56Bm2tc5geVPOkII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VfT5vlZnoSoEMgEMN1ip4cyOypizViYB3BL6yxLxe7Zr3zFkcDDpXIZSS8SpXM9/L
	 84yt7X1fLX2s8k1WtkJPzRwLwNVYfYw8qc8v3vdaltUYUGMa8KlLV3An3Yz/BzM8Oy
	 bqBC6FwOWIHbWUa7i41hS5ebzpY3WEDICCuST7OpI9wPnIueKY7CWnrxqonqnhcgfx
	 4Y7S+LWMiOHcEiIlHc6j0+fhzbJMPiPyPSoVDDFBvItc2SKRgrk1/GfiSmqZ9V6gEv
	 C8GI7KUxSzG6xCbXRhYq2J9YXyyKtZEsSO7Vh2T87NpK2XrmVZNP0IU9Wb0k+tdpf3
	 luLw/Ydgp1l/g==
Date: Thu, 6 Nov 2025 09:06:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Georg Gottleuber <ggo@tuxedocomputers.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ettore Chimenti <ettore.chimenti@linaro.org>, Srinivas Kandagatla <srini@kernel.org>, 
	stefan.schmidt@linaro.org, stephan.gerhold@linaro.org, wse@tuxedocomputers.com, 
	cs@tuxedo.de
Subject: Re: [PATCH v2 5/7] dt-bindings: arm: qcom: Add TUXEDO Computers
 device
Message-ID: <20251106-prophetic-flat-panda-6f2b54@kuoka>
References: <20251105154107.148187-1-ggo@tuxedocomputers.com>
 <20251105154107.148187-6-ggo@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251105154107.148187-6-ggo@tuxedocomputers.com>

On Wed, Nov 05, 2025 at 04:41:05PM +0100, Georg Gottleuber wrote:
> Document the X1E80100-based TUXEDO laptop

Which one? Please use full product names and full sentences ending with
full stop.

Best regards,
Krzysztof


