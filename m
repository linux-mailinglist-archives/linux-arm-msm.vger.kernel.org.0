Return-Path: <linux-arm-msm+bounces-88218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D08D07DA9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 09:38:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12FFC300983B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 08:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A741C318ECC;
	Fri,  9 Jan 2026 08:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LcdJy21D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8100A2FA0DF;
	Fri,  9 Jan 2026 08:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767947904; cv=none; b=GpY1qO+/WYZJMjNmxVVBAiU51pyjgF4FPHg3P41Y8GveQ3w6Pbna7y4fTFn1v7PMA/N3dQJl+9ocCQ0vRkMZWOQPFhbKmq1/tJboz8U4gpmzU6H3QnqXFG5T3TXMeJSyFts+HQ0/I7TUVqRmjRwCzr5QRXK3yhtU3jB6ZSKWHBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767947904; c=relaxed/simple;
	bh=GOK6m9wIFd/54meS8u7eNi+3Ziy96yomzx/Fy24h6WA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gXvw4TWTkJCIJDubYlJlTwaBkeNr6kLXknygZjJWKeLBw+JtLrQYrcnIQEdsnuRFFT0ofISGtR0Axa31eHXundGKUFhxvkjhCTq9lNsgu5+FJOjI715euo0Vwxd6VlkbC5klbyjaM6SCwux1Up0m1eYIT8xyz++APj7n/9FBNn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LcdJy21D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE4A9C4CEF1;
	Fri,  9 Jan 2026 08:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767947904;
	bh=GOK6m9wIFd/54meS8u7eNi+3Ziy96yomzx/Fy24h6WA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LcdJy21DgoWTMDUB9ocHeRm34vaw9uU50QDWkTaMoCRW5pHB0sbN36GdLftlCnUla
	 eWgJVRUpWJh70UBPWlvFpiNG2e7oKeuFsxTWvTYayOhcOZ1bgZle/IXXEq2PjHDbWA
	 dkJup7svvwrrmyg1ICF3OXszmMvVmQRK9gw4a6F60DtvvHeExAxg+O0XXrG4iW7XX2
	 wYWxoxtlIMz9Y9GGkoiUDVvRce6zEtXbGZhJ5EPt9NLNQf/pdT7RI4a+OA3KV4shbI
	 XMGZrAIvx9JRoXnaSY1brksqvf9wNTi49CsYSPh/pI7OF6P2yWDDcOnGFwJhoFzI9C
	 yLQyPK5p90l5Q==
Date: Fri, 9 Jan 2026 09:38:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: andersson@kernel.org, krzk+dt@kernel.org, mturquette@baylibre.com, 
	linux-remoteproc@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, konradybcio@kernel.org, 
	sboyd@kernel.org, p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/9] dt-bindings: remoteproc: qcom,ipq8074-wcss-pil:
 convert to DT schema
Message-ID: <20260109-silky-authentic-gibbon-1f92ef@quoll>
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
 <20260109043352.3072933-3-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260109043352.3072933-3-mr.nuke.me@gmail.com>

On Thu, Jan 08, 2026 at 10:33:37PM -0600, Alexandru Gagniuc wrote:
> Convert the QCS404 and IPQ WCSS Peripheral Image Loader bindings to DT
> schema. The text bindngs incorrectly implied that IPQ8074 needs only
> one qcom,smem-states entry. This is only true for QCS404. IPQ8074
> requires both "stop" and "shutdown".
> 
> The example is to be added in a subsequent commit that adds the
> IPQ9574 binding.
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


