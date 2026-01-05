Return-Path: <linux-arm-msm+bounces-87508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A56CF43EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:53:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D978C303C22A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1598E346781;
	Mon,  5 Jan 2026 14:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SEQ3HUx1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16A92C11E2;
	Mon,  5 Jan 2026 14:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767624426; cv=none; b=m9953N0lN3sH8YwMSmTayLYgFo4NfbTzRAtCcnByGGgpWGHXewFYFTMXCD/2SwOYD/NeKhySP9Q9yQWIYACh6paTERs1P5BIqdzk2qdYsIJwVQvicLxevW8FTHUgdcatFkdQ+uiYWZs6j5ZA7MFZlJLy9lTEN+L8YulTp0+fn7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767624426; c=relaxed/simple;
	bh=+quKuNPIhmeMbJDF+EeuSj5ZqJwXuTPMmde1EfKDd6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JZwepYYI0Xx3Ctpm7+8tXxPwLvORJeJxO/cAf07Jt0Jwp5cV+3W7Q0ohk1+m6A8vib++k502RMB7EksoQNts/utTXdKJtR0s2m7qleoj0sKCdJrcJUBRZSTzrYbFnJp1PV/rYj2zIvoSE/G5e3YrC+KIuKtR+JyDTh64yhT81nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SEQ3HUx1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAB9DC116D0;
	Mon,  5 Jan 2026 14:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767624425;
	bh=+quKuNPIhmeMbJDF+EeuSj5ZqJwXuTPMmde1EfKDd6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SEQ3HUx1CCOl5vFbMM9fTT+1RLJdbXg8cuZAdkWWEA8SoSCGBYxkBah1cgwra3E0A
	 pSRVOEuUOSGyBZLh7rWn+WU8zN0xFLFCiawpokIaplxvorXfUMzEAFZ5s1787wDJzh
	 NoKeoqk/kJxWWYEqrJfW53qNmMsUJdqeSeRm/A87rFR4ibkt8rEh2dZbd9TDA/QCfN
	 nUo1PZ97x8UvfEQc4zTp/dkG4EUrVjn6cn43dnaDS+wzRkGsiR+we3Gx8z7nP0iHWT
	 YaGdY6jjCO5khzkHsC+DahIeQpbeKQk5PsUeFiu4r0xUGDWn3N8B+eUriFWK3jhseH
	 kQRAlI0o+Ayhw==
Date: Mon, 5 Jan 2026 08:47:01 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: longnoserob@gmail.com
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, david@ixit.cz, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable
 SLPI
Message-ID: <rg2ibycuc5hnwn3tigmfoac7viwjw6524dzozi3is2ivn4svb2@zzuempzehrdj>
References: <20260105-slpi-v4-0-e6e0abfad3a4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-slpi-v4-0-e6e0abfad3a4@gmail.com>

On Mon, Jan 05, 2026 at 10:31:50PM +0900, Robert Eckelmann via B4 Relay wrote:
> Enable the SLPI dsp on the Xiaomi Pocophone F1 with Qualcom SDM845 SoC.
> 

Thank you for your patches, Robert. I've already applied v3, please
check the result in linux-next and send any incremental patches on top
of that if necessary.

Thank you,
Bjorn

> Signed-off-by: Robert Eckelmann <longnoserob@gmail.com>
> ---
> Changes in v4:
> - remove not needed status change
> - Link to v3: https://lore.kernel.org/r/20251205-slpi-v3-0-a1320a074345@gmail.com
> 
> Changes in v3:
> - remove stray newline at end of file
> - Link to v2: https://lore.kernel.org/r/20251205-slpi-v2-0-dfe0b106cf1a@gmail.com
> 
> Changes in v2:
> - adjusted firmware paths
> - enabled i2c busses
> - Link to v1: https://lore.kernel.org/r/20251126-slpi-v1-0-c101d08beaf2@gmail.com
> 
> ---
> Robert Eckelmann (3):
>       arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable SLPI
>       arm64: dts: qcom: sdm845-xiaomi-beryllium: Adjust firmware paths
>       arm64: dts: qcom: sdm845-xiaomi-beryllium: Add placeholders and sort
> 
>  .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   | 44 ++++++++++++++++------
>  1 file changed, 32 insertions(+), 12 deletions(-)
> ---
> base-commit: 6987d58a9cbc5bd57c983baa514474a86c945d56
> change-id: 20251126-slpi-c616e3a391ce
> 
> Best regards,
> -- 
> Robert Eckelmann <longnoserob@gmail.com>
> 
> 

