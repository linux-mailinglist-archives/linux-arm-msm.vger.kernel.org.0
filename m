Return-Path: <linux-arm-msm+bounces-79495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D95F9C1C14A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 17:30:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 825645A1E98
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 15:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EAE2336EC4;
	Wed, 29 Oct 2025 15:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JWSOPckp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65E42EB87F;
	Wed, 29 Oct 2025 15:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761752440; cv=none; b=CldX/6PhQ6xZrRSO5rqzHoi/eWmVer9fADmx4nLnPr85WKRHmRMs6093o+rulrl2lP2q2I3Mvk25pkQYE5/+2GO0q25XxrvoNFQHKFiLl+mFfNYwosWs8s8GYf0Aaf1mE9AYqVQCQLKrH7T9Ur3YeY3H/R7S2MfEdZiPtGH00Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761752440; c=relaxed/simple;
	bh=PbZwkdXNfvQm13fSa8McCaVV+TGgfVCC2xR6UwY+jzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NUHEvu4Xz5bhQOXw8TMgXcR6wr8KFIczDVZsacZXAR8hKm+lR9W0XyrufJBu1C+LMNp0+f5BP1niTAmh9zw7LHNoEb+enWzUKUulDRdPmDd3tywRE7Tu03YnclzzmNS1dcU4NS8XZ9v4QVL4eOUkRT17I+1bf/6McsWZPUa/dQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JWSOPckp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3CEC4CEF7;
	Wed, 29 Oct 2025 15:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761752439;
	bh=PbZwkdXNfvQm13fSa8McCaVV+TGgfVCC2xR6UwY+jzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JWSOPckpSDYIkfQgJ4q/e1tdXS7lUiyCrMsZHqBM8SQ5b+pzOtyNAC8TcRTbHeWKU
	 NTlWKlOGh7qKzmxUhx8qP0gZK84ZayCIReYqTH9FQ9enQvQcp3dM4xH4ELfQWYP0bN
	 Dek14LFcV3PHvn0JUNRZRxFv7Dz0SJ0eNGQclYa3pZ1rthjcHJ3MdTQAb+wTESF/EP
	 qYodeU/KEL2l0n7Zc+Hqjee4TX0bv4t/fhfQxwReT0WxJo+rPbG7bgUoRCSqZq/5ZB
	 fMvuXnW+VNHFBgGF+2kHC44A9jn0YgTzqPsu312hwk5XxJC28Ls3rLkUMzBSQ3yJfN
	 A5VRWFyWqkkqQ==
Date: Wed, 29 Oct 2025 10:43:42 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Sudarshan Shetty <tessolveupstream@gmail.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/1] arm64: dts: qcom: Add dual-channel LVDS support
 on QCS615 Talos EVK
Message-ID: <sygckhfcazo56jpmuldhctu3jnf3unekl4ahh7n3yels63ntpg@3esgqmoewfuo>
References: <20251028061636.724667-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028061636.724667-1-tessolveupstream@gmail.com>

On Tue, Oct 28, 2025 at 11:46:35AM +0530, Sudarshan Shetty wrote:
> Hi all,
> 
> This patch introduces a new device tree for the QCS615 Talos EVK platform

"This patch"? There shouldn't be a need for a cover letter for a single
patch, the patch commit message should describe itself; as any
information in the cover-letter is lost in the mail archive when the
patch is merged.


Also, please transition to b4, per our internal guidelines.

Regards,
Bjorn

> with dual-channel LVDS display support.
> 
> The new DTS file (`talos-evk-lvds.dts`) is based on the existing
> `talos-evk.dts` and extends it to enable a dual-channel LVDS display
> configuration using the TI SN65DSI84 DSI-to-LVDS bridge.
> 
> In this setup:
> - LVDS Channel A carries odd pixels.
> - LVDS Channel B carries even pixels.
> 
> This patch only adds the new DTS and corresponding Makefile entry.
> 
> Thanks,
> Sudarshan
> 
> ---
> 
> Sudarshan Shetty (1):
>   arm64: dts: qcom: talos-evk: Add support for dual-channel LVDS panel
> 
>  arch/arm64/boot/dts/qcom/Makefile           |   1 +
>  arch/arm64/boot/dts/qcom/talos-evk-lvds.dts | 128 ++++++++++++++++++++
>  2 files changed, 129 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-lvds.dts
> 
> -- 
> 2.34.1
> 

