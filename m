Return-Path: <linux-arm-msm+bounces-49430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50149A456ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 08:47:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50912178A9B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 07:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1D5B26BD89;
	Wed, 26 Feb 2025 07:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QgqyvX99"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7218526B089;
	Wed, 26 Feb 2025 07:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740556016; cv=none; b=Ztnn5LNRVdXNjW6enplwMCwZm+5RmKZu35Iwd9M151cuJOUrd1EB0jiolf85rWyRTEjbpn0a2zh0Ukl1r5J+bJhrBhpoM825tys+RTJhHqvM0o68UhoNIMyJ2piKauRi31iLX/LFJ3MdPAqTBRoo/ghGNQYBjWY82PdwCbtw8SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740556016; c=relaxed/simple;
	bh=JoAj9xLaECtQl+Lj5BZuQBxUIeb2+n1Z1pxP79r2H3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eU9lyG/z4UHwTeSKKNts5ArqPqrLQThZNRaMXBXR5d9HzllUCI6FawshxGfYL9EVfBNS4VAU/T+R5nTnRwEsCK61bQU2WfrlbWgqpm8binmKcCC8kJB613GSQKC/zWhA0+eO5lMNoE0MrHBf/hjDGdnXOS7nCLOqCx8LRFoVpoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QgqyvX99; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40DD5C4CED6;
	Wed, 26 Feb 2025 07:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740556013;
	bh=JoAj9xLaECtQl+Lj5BZuQBxUIeb2+n1Z1pxP79r2H3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QgqyvX991q884nQHjvQHuZwzm9PwsbnVmBzYqk3CBYUFaJ+IehlBR3Uc/dYSSApK8
	 Ers6An5ej3cLmBul0T3wXnqmqZVpjcp8B+G1zE6YzWwkEvSMY1oLRUQagoKt14v7SK
	 qksaH7l01YxnXAm+jKHOuNdqwauJdD8dc6yqrUrnN3NMKL7pCHetBWb1b2hfpgWWJH
	 Hc01Ac9dcH4cvsYcyoL0GaXqoJZ2s+NEq8nYuzV+M+RGs9iib1uuuMO8suO2kVTOVk
	 gXK/8oQVI9uLrC+De8O5bk7aP3pEQ1j+7QFaYzsPOc7d6VbrxB//6T6tgwF4IlKn2m
	 GmBiGYyfnN1lg==
Date: Wed, 26 Feb 2025 08:46:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: display: panel: Add Himax HX83112B
Message-ID: <20250226-speedy-dark-mushroom-5d7c4b@krzk-bin>
References: <20250225-fp3-display-v2-0-0b1f05915fae@lucaweiss.eu>
 <20250225-fp3-display-v2-2-0b1f05915fae@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250225-fp3-display-v2-2-0b1f05915fae@lucaweiss.eu>

On Tue, Feb 25, 2025 at 10:14:30PM +0100, Luca Weiss wrote:
> Himax HX83112B is a display driver IC used to drive LCD DSI panels.
> Describe it and the Fairphone 3 panel (98-03057-6598B-I) from DJN using
> it.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  .../bindings/display/panel/himax,hx83112b.yaml     | 75 ++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 

Discussion is still going. Sending v2 after two days is hiding that
previous talk, so that makes me sad.

I am still at v1 and I am not going to review this one here.

Best regards,
Krzysztof


