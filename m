Return-Path: <linux-arm-msm+bounces-59801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D2958AC7B0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 11:30:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0E9C7AD2A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 09:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF1D21D00E;
	Thu, 29 May 2025 09:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9GHpRmV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8C121CA16;
	Thu, 29 May 2025 09:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748510984; cv=none; b=iIEmnl7XbkEXCvVI5Y+z3B3Mej2PJiWQfJmyGgQ2m2a39SGkjbFIKmMe9XS3QuA8JfTMM7wcF0x/1rGdn8/S8Rl+67r52VnuiX3e9RQYU2SUY0v0dt9N0WEkM7drsjowB8EppSA3Qc1Ah68LOqOGT4Sk35sZETO9q+Xp6n8P/Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748510984; c=relaxed/simple;
	bh=G56AeSItIapsy2ij5qQsCN9drj3iBh2hJMUbSS9WNMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UQ24r6u8SH/aDjMUCOtUnQfKp6SeGwnrk8mXLxQEOOhWchylTI0eev1AGYbAfZHhmnVjveI/t8MaYPM/jmQce4JXvdIxMdMUSywVnA6Ozv2Oq4g1mMf+NfAEzyyboWC5gW84CNzP+yc1I9WZOnguy154e+CI/kcPqb4+gLzrZTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M9GHpRmV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC36C4CEEB;
	Thu, 29 May 2025 09:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748510984;
	bh=G56AeSItIapsy2ij5qQsCN9drj3iBh2hJMUbSS9WNMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M9GHpRmVMR2FP2Ac2+er400ZUpTzsI1Kqaymz2t0XFDGcoq5dFC/SZgbxljt/CMYh
	 ctTR76Yp2sK8qaNMSz//tH/DqnanvsSMehIV8kuILOlTPdK9R5uuHGO5kLx/fjbc5X
	 6uSs/6WP+MsyEhM68wRJIOih8/dVb2I8nSCxAc7dmMI105b3CyObejcUt8phr3nXbi
	 L5T6oZhHguOEwdGo2mVbwrkvubknY215t3PyKRhT6pgIYxaIOrPlqVN6uNrXheDmA8
	 y9kFoT6x3rJaFTUso932pU0gpxe0ZfGuoA/baLLjkskB7up9R6ek5TtPfyNzrUwYpq
	 0CglLX/WGzd1g==
Date: Thu, 29 May 2025 11:29:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: arm: qcom: Add Dell Latitude 7455
Message-ID: <20250529-optimistic-victorious-fulmar-68a4d8@kuoka>
References: <20250525095341.12462-2-val@packett.cool>
 <20250525095341.12462-3-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250525095341.12462-3-val@packett.cool>

On Sun, May 25, 2025 at 06:53:33AM GMT, Val Packett wrote:
> Document the X1E80100-based Dell Latitude 7455 laptop.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


