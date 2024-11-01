Return-Path: <linux-arm-msm+bounces-36690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 364809B8C6A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 08:54:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFC03286BE0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 07:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 729E4155725;
	Fri,  1 Nov 2024 07:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GPWq9pa3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E53914A0BC;
	Fri,  1 Nov 2024 07:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730447650; cv=none; b=lGgxKEnVI/G7NT5Q6jF5tz5VOdOftiDaXphwizFNhfM9TZ5L306kzUm73ACsDfXFmWAnuOUisQSlNATnDZoKREp05pl2LjVMZ06YXpsO9aqBBnfs5tGKlRVyljPl8fpesCH+jXeNkF6ePevCH4WZPeEuo+dFu6L31AonkDYUrks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730447650; c=relaxed/simple;
	bh=7zJEuyr+9oju1A3aTXpUe9k47f6CXTwo4qELYt/xGcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dOiYlzyrZ7mEDB/5SJGmzl27xq79t+X/jR2dfzNWufzFGXS8HnAaNbwXwdDWTrRL+MYE7VsOtFxHFUj3jCko6kFXwT4gNxbDKhtXT1L6GZw1SBWYA8jVhcu7kjQGI3LZ2B037mlh6N/mtv2t8l/+sNpX8cmd1uS9G4JY0MwF7fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GPWq9pa3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D93B3C4CECD;
	Fri,  1 Nov 2024 07:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730447649;
	bh=7zJEuyr+9oju1A3aTXpUe9k47f6CXTwo4qELYt/xGcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GPWq9pa3KMOJ3XCVEJYIc5dnKY/cilj/Mfxkt7211ycfx9fmGTUz4hKyWUOBNedu+
	 J2SdhQ9E8J3VzTHGR95pp9ERXD9WLSP70dg/wG+MdOHkgL6l1jHyWH4+qZM0VY1A1G
	 UUxjR0Z0Yzo86n5AYt1inHLHPUysIThacco6Ebnq3gY9L9XLn4q5aZ/MTtTYVSr8TA
	 uw20ASTdrDWfU84NBfx+oZY0Vn46IwocDnBzp8/Ke8jzFdfq53dgDRgfr+uFtYYUsY
	 7077XQzmz+d5/a32lL8IjhHJs84wRFHGK5oM7ABiLiDntyPlEInRFN6GTPKLcT1VRS
	 uqa1ediqAWnCg==
Date: Fri, 1 Nov 2024 08:54:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: broonie@kernel.org, konradybcio@kernel.org, 
	konrad.dybcio@oss.qualcomm.com, andersson@kernel.org, srinivas.kandagatla@linaro.org, 
	tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@linaro.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 05/10] dt-bindings: arm: qcom-soc: extend pattern
 matching for QRB4210/QRB2210 SoCs
Message-ID: <ghlkqehfs5sagxrcvyywixfkt6ie3pwwtqm2j3n3c3xytjl3sb@d435kwmo3nki>
References: <20241101053154.497550-1-alexey.klimov@linaro.org>
 <20241101053154.497550-6-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241101053154.497550-6-alexey.klimov@linaro.org>

On Fri, Nov 01, 2024 at 05:31:49AM +0000, Alexey Klimov wrote:
> Add missing QRB platform name to the pattern matching Qualcomm compatibles.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


