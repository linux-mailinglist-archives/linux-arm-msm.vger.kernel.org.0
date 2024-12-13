Return-Path: <linux-arm-msm+bounces-41977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 101A39F0A53
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 12:02:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A0EC188843C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC721C3BFA;
	Fri, 13 Dec 2024 11:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nMGAmTMU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48221C3BE2;
	Fri, 13 Dec 2024 11:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734087754; cv=none; b=qoiFxDbkKp1v3ejc6YDB0VwOTpfTqtQQogRK+LIQOYe08dYOur6OPyJXPQmln6tpPq1RVhQt3vkyw2wNsqUvUBq+XbBOKfnZDhA+J3B/DQLcWmlhCHLL41a/LFGLhVi/o6ivHOSfzBBaaxc0Uvyuq1oqaLKlDZBROtZ26m2y0l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734087754; c=relaxed/simple;
	bh=dwYQH80t3mrSx0fy+leXaGl4ffEJpazM10NKcW2KtWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dSDEpdjqLdwFzP5eczn26ai+8a2V5w/RVgAl7GjAVPEjipItee6vC+JHIZCPyrKTPgUibztOiJsmA/LA3QjK+z3+2u69bIpYy0pjqi1S60+DAjMISwwIOHqaJlc7qhUi+4TeDGLHeCSoEAKyNnuxE0alYZfjqXI7Q6+giQSFII8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nMGAmTMU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B027EC4CED0;
	Fri, 13 Dec 2024 11:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734087753;
	bh=dwYQH80t3mrSx0fy+leXaGl4ffEJpazM10NKcW2KtWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nMGAmTMU1FQbBL8/62PyqwRfTDwkiiDHbCtdI+588QOh3MdCOFAZYNjaj5astQpj2
	 hLbFwzp4COXHbiPotqCzfceL/4R/fHhGFqVL+cODtOIKHDxOhWJyWO7ZjaPe5KtupN
	 mQlPJeqcLL8Ez77rfEXN7mYWmjVJNA3ESN4SB1dRUA/1il+U2vq8zak9435B04xvKR
	 GUAAITpciR5+2gSrYhjdYw1Ti22XUdBlK2TDkOGR2fpjMuooVOQN7Ih42EOHvsaH/6
	 Sp9lhAEYtYGOI632JTT0tePxX6KWCNnMhi7snNQv1SVTvfqsEbywgg1bG3ISyoTHgW
	 VpHZvV+YmbrCg==
Date: Fri, 13 Dec 2024 12:02:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, johan+linaro@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	gty0622@gmail.com, chenxuecong2009@outlook.com
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Document Huawei Matebook E
 Go (sc8280xp)
Message-ID: <arnx436ck3qvjryukahnn6rjapaks2whn42sihrf7rwefyvcqw@jpe6s5nvt6vh>
References: <20241211153754.356476-1-mitltlatltl@gmail.com>
 <20241211153754.356476-2-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241211153754.356476-2-mitltlatltl@gmail.com>

On Wed, Dec 11, 2024 at 11:37:52PM +0800, Pengyu Luo wrote:
> Add compatible for the SC8280XP-based Huawei Matebook E Go,
> using its codename, gaokun3, which means it is the 3rd gen gaokun.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

<form letter>
This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tag is "received", when
provided in a message replied to you on the mailing list. Tools like b4
can help here. However, there's no need to repost patches *only* to add
the tags. The upstream maintainer will do that for tags received on the
version they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577
</form letter>

Best regards,
Krzysztof


