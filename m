Return-Path: <linux-arm-msm+bounces-71745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B27E6B41762
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 09:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EAB23A4E01
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 07:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04DA72E1F00;
	Wed,  3 Sep 2025 07:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kC5uixl/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13D32D594A;
	Wed,  3 Sep 2025 07:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756886241; cv=none; b=J+sfqNZ2nqGqAujUKHiTEG7/2+HZFz4KDOGPAGUuAVj0hCRFexS8P8zTURmL8GGi4fxO7Gxc8wIcOrpb4F5556d0tQ3ALfQeBPsoqY45yHnkKSyNu3pAhE7gIH/8j+BhA2sJ47Ne8NqwA7UcVxIqwTGETjW5BQLaa0vHmu/z6IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756886241; c=relaxed/simple;
	bh=FccL4P8IthcNQ5XP+dp4QoktmyEo1KSS+bFZd+k5K2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A+RMf+xzDxNDjs+riWAmz2Ik8gat1C40UeGZjHwse3Hbz7u7zed16H12FZvgkPOHP3XH49o1N/AZNjuEgx4WF+aghULD9UtJfg6xfBFoCpRHHfL802KIryUGbv3/s5+6kM42/qgyeGQZD3/tjWBUNMrdI1fygKR7FSTU8+w2IDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kC5uixl/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F32A5C4CEF0;
	Wed,  3 Sep 2025 07:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756886241;
	bh=FccL4P8IthcNQ5XP+dp4QoktmyEo1KSS+bFZd+k5K2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kC5uixl/p+6oR2AN9pclrRYWEF+yJR0UzbIMMO8f/KMURtxqRSSVbpwi/XcbpFNU2
	 5KrGjFyc+L/YbIuRpFpb5HKZCBMICKG96DpQMRi5FQJL1fH6eyMXRqN+4qLm/zXPgQ
	 jTB8S7XB4BLS0CN3x7vulIUoBKTHt8NmNywfTw7xN9eCsz/Rrjtv0NUrpnElJKdNGk
	 KE9qQRqEtFMX4iyq88Pf2nBQ+aJVnXhDTDSViNiiPHlM8D6fmNxzmKVZMX2IIFId14
	 v03Yx18wSc8PkhlKB7JGFp5p/zuMRnl2sYZkit2CGkRQvCNu49THQ/rY7TAjFqjIsJ
	 wRcMz0YkVvFvw==
Date: Wed, 3 Sep 2025 09:57:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: srini@kernel.org, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] ASoC: dt-bindings: qcom: Add Glymur LPASS wsa and va
 macro codecs
Message-ID: <20250903-diligent-tunneling-angelfish-bae3b3@kuoka>
References: <20250902140044.54508-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250902140044.54508-5-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250902140044.54508-5-srinivas.kandagatla@oss.qualcomm.com>

On Tue, Sep 02, 2025 at 03:00:42PM +0100, Srinivas Kandagatla wrote:
> Document compatibles for Qualcomm Glymur SoC macro digital codecs
> (VA and WSA), compatible with previous generation (SM8550 and SM8650).
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 1 +
>  .../devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml          | 1 +
>  2 files changed, 2 insertions(+)
>

What about tx and rx? Not yet ready?


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


