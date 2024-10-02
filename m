Return-Path: <linux-arm-msm+bounces-32944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB6898D98A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 16:12:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 795ACB215B5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 14:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158431D1506;
	Wed,  2 Oct 2024 14:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ejWPZ3Kv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEEF198A1A;
	Wed,  2 Oct 2024 14:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727878068; cv=none; b=o1Du6joZLjywWrpexRUppQFn81EPxmcKsubCjyEctzWLYDC/pN5AIWmSc10FV4FmTVCm12E6wqlJs4oBIWQvfiOUgE/WjRdUztjM4Cz6tnDcfjtOyzrBS94aAoZeGV254wAQBy/79Ou1GoKM8KEO+BTO2xE13PlVQcTkPKYeP3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727878068; c=relaxed/simple;
	bh=8Fu+NhRjMt9DZvQMbWNjfPX0Sw2ayIi7klwNzm9YV8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=di+OkVtiK8X1hh46H/dsk+1+gwyIGk+5XinNVH6cCVOVxixEvQcbcI7TkQWS6kxjT3qOCRKTCWI0R1OlFM//waauhmvMSzEQM5WSOgJ/rUs801qp2rE9eZXGtOmwpyovj1fBZreVnJ9jJGGGz5qDKj8Tl0JEAMgnEfkT25qTLgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ejWPZ3Kv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70CC3C4CEC2;
	Wed,  2 Oct 2024 14:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727878067;
	bh=8Fu+NhRjMt9DZvQMbWNjfPX0Sw2ayIi7klwNzm9YV8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ejWPZ3KvhY5ZDy9UN1E7hwKs5BfY0mWQ1fbu7z7k7qJ7qtJrHq8xn5hsn9HefcNyG
	 EYIUUaSFnYNhyGOYxwTf3QTVxMhrpOPDUQrfPB2l2OZG4LB6noeH6F6899JzkPENcF
	 QcUWTzOVUx/CinC7PoxO5p3zmpXpHT1Cy8e93i/oXSxDc6hFHzE7OhyZ1Y4Q6kx/r9
	 redGt0KNc0wGLuXxTv2OiEXeQ762pc2Gc85jGzV6zQ6i96sBmqOfoLzKpwKDflQHvn
	 IvvDywihkHLdmiVH1fUWJDXuE9vuBPsmBS8J5FC9SPtrfxX84EDOyo/2Kae+lp93aX
	 a4mKEkQVNvPdA==
Date: Wed, 2 Oct 2024 15:07:42 +0100
From: Lee Jones <lee@kernel.org>
To: Nikunj Kela <quic_nkela@quicinc.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@quicinc.com,
	quic_psodagud@quicinc.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Shazad Hussain <quic_shazhuss@quicinc.com>
Subject: Re: [PATCH v3] dt-bindings: mfd: qcom,tcsr: document support for
 SA8255p
Message-ID: <20241002140742.GF7504@google.com>
References: <20240905194741.3803345-1-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240905194741.3803345-1-quic_nkela@quicinc.com>

On Thu, 05 Sep 2024, Nikunj Kela wrote:

> Add compatible for tcsr representing support on SA8255p SoC.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
> 
> Changes in v3:
> 	- Removed the patch from original series[1]
> 
> Changes in v2:
> 	- Added Reviewed-by tag
> 
> [1]: https://lore.kernel.org/all/20240903220240.2594102-1-quic_nkela@quicinc.com/
> ---
>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks

-- 
Lee Jones [李琼斯]

