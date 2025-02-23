Return-Path: <linux-arm-msm+bounces-49052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 300ACA40E9B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 12:52:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9157C188FE89
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 11:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B86205E25;
	Sun, 23 Feb 2025 11:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h7L1j5Z4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C656A205AA4;
	Sun, 23 Feb 2025 11:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740311528; cv=none; b=jP0Uj+fyb3dKjsD2oqpSqXRso9ASvL4WizWEZI32tRcIGxxKAw58RXWJGuvpuUZJgRithUB3rzMYzJV+cusG1OWn72YUOtCp9Km7OIK0k9zj+qd7Ln7ZZrW7LY+Y7Cqo4cWPBtzTZV4z5sdxRLOrA0AMd0eqTMroIcVVr579vyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740311528; c=relaxed/simple;
	bh=g00fXgKmgUjZV3xG7CeSK90P8cJwJoK2Pn53R6or8ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dfLgOSlpaeud7Tzy6Z+wby9ki3Be8hckWN5dQns6ccgo2SqyseVhdDSWjPMoyu0AFLTT17GAk+piCWcy64WiDm0yFrVc7URVCUFVlon0zAbBdHCchuQLOwU6g3jwK4ZB2x9Qyxj83wPtifrTVtIXWY9+Hsx/OFZlo6Xos5W6DsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h7L1j5Z4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B1F8C4CEDD;
	Sun, 23 Feb 2025 11:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740311528;
	bh=g00fXgKmgUjZV3xG7CeSK90P8cJwJoK2Pn53R6or8ps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h7L1j5Z4CF1bHHxnACvakbNxdW36SLOQ5RApwJX2FNBVDsgKBdg7qohdqTsPZ9YHA
	 +GxeLTHRSelhVZl8xkDbFZixeCRrKrjlwpJudNZs10am7/nfut3ZWKMcQnJrC8Yy5Y
	 RgrzzXv4LmBJupb4fdeuu/nmL7IprCt0IJdZ1nSL3byDa2k6NJrcD5o53kvChQxd33
	 AgpUNwkzuuqQfOYERzHTFnHJ65UQofHJLiDP/Gl3s4IgbPHpUzAXoAgALFfFDODzyC
	 M+vS5p5zGiY7GXfPuslPsrJ2cmlcUxsw016+GK+38ubIe1tTmlUDVxifJYpnzFZh2O
	 7uahS7DsY3fmw==
Date: Sun, 23 Feb 2025 12:52:05 +0100
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
Subject: Re: [PATCH 1/4] dt-bindings: vendor-prefixes: document Shenzhen DJN
 Optronics Technology
Message-ID: <20250223-garrulous-orange-binturong-acf1bb@krzk-bin>
References: <20250222-fp3-display-v1-0-ccd812e16952@lucaweiss.eu>
 <20250222-fp3-display-v1-1-ccd812e16952@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250222-fp3-display-v1-1-ccd812e16952@lucaweiss.eu>

On Sat, Feb 22, 2025 at 06:58:04PM +0100, Luca Weiss wrote:
> Add the vendor prefix for DJN (http://en.djnlcd.com/).
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


