Return-Path: <linux-arm-msm+bounces-34964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B6B9A3F32
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 15:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E4E6B23435
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 13:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F4FC1885B8;
	Fri, 18 Oct 2024 13:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lIf22cHf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0771CD2B;
	Fri, 18 Oct 2024 13:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729257040; cv=none; b=MRm1/uuG4DrOG5eWwTAByTMrnCY64uW9wwzR2UgvL32K9+yERjHl5Ca1xWfb19ZQupWx5/gFWUkY+mcWlyAeqa6ACk1L3yVhHabl6PaMLsYNUyvWw8NiSbX1VJMWx80YqbNKMTxqZyrW74GYEN+HHvo12491shsi6//yz+ypUhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729257040; c=relaxed/simple;
	bh=cisQ9dR0zkrRPv6D4aCeUm4L5dcfw4wm5Zn04tZtpgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fIqoxX9SATR3QGhI3Fo1xGE8vJgE10ftWBDInLnNDcbI7jqscZDvm0I6ScwvATZtYVND7RWLfM9rYUADdb08h6aIW4DBhiSVeW14Fq5IE/TAaDXLI1l76PkVjehAlO//FWN3TmfgmCmXA9BKEAPrepyIpmz1KlkcNXFIhW1lZJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lIf22cHf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 318AFC4CEC3;
	Fri, 18 Oct 2024 13:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729257039;
	bh=cisQ9dR0zkrRPv6D4aCeUm4L5dcfw4wm5Zn04tZtpgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lIf22cHfIu0LUeu9vifzpCg8M50WBJIRXB+OyWlfGCCWW4LgzCRqNSxia1PW8nRWc
	 FV3YF8puqcUy7jMd/f2pgaEgRdQNJg9+8rmQdlh+ZAvPOXZpTUzesYm/+XIiBNZ0qo
	 iMjiCNbdglKSkDxMXrFLDVXOteHUatSlyE5u1yZ/PT80eQXA+7TtNoFn6T1WUe/2YV
	 Sn5mugkIP8oDfib6ebu5hI3XR3YvmrRLy47fbtzlZv1ehsStj9r+8Gf4aOwTLcOs+R
	 sOPcoe+/SJlVyeDQ5CC7KoRMph2xQkc4LiOxZXQBYjqFd6WSD7bZI+0MUhFEOw5pKa
	 dSPzKHfwwqmtw==
Date: Fri, 18 Oct 2024 08:10:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mailbox: qcom,apcs-kpss-global: correct
 expected clocks for fallbacks
Message-ID: <172925703750.50980.16962540750008969372.robh@kernel.org>
References: <20241017091447.41450-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017091447.41450-1-krzysztof.kozlowski@linaro.org>


On Thu, 17 Oct 2024 11:14:47 +0200, Krzysztof Kozlowski wrote:
> Commit 1e9cb7e007dc ("dt-bindings: mailbox: qcom,apcs-kpss-global: use
> fallbacks") and commit 34d8775a0edc ("dt-bindings: mailbox:
> qcom,apcs-kpss-global: use fallbacks for few variants") added fallbacks
> to few existing compatibles.  Neither devices with these existing
> compatibles nor devices using fallbacks alone, have clocks, so the
> "if:then:" block defining this constrain should be written as
> "contains:".
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/mailbox/qcom,apcs-kpss-global.yaml     | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


