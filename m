Return-Path: <linux-arm-msm+bounces-52403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9A7A6E44E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 21:26:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A07A8188536B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 20:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C95D1C84C6;
	Mon, 24 Mar 2025 20:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YpyucDn/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52DD1C84A7;
	Mon, 24 Mar 2025 20:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742847996; cv=none; b=iA0VN68dxd+qWZA897dWJMAYaqSpUaDkzLBbQEFiWhq76h7zH7xtVAHzsm8z17lEtkE/58Cyz0ZOJ/ybGH8ybOfVIlcHAWT8uqQqepConfS8ZIqjoolbN9mRFuYyYifbUFFbzLgTri5r6vwPbPo4A+H8Kb3894tX2uZiUiRTROM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742847996; c=relaxed/simple;
	bh=U2itnEtEw8dYRuqh+Nkd+n+cV/VkuXPkeCP/FByVvn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QPkIvhLd2ycXmyulUzJ0w321+7XjdTThwE3NuARB3FfPqP60aYoRiFJro7nIoDaJ3UTsNBasRk0WI+eIE50pZvm5DWMfsbnIXAqShxCKg5lTE9w6wbv/1guz/eWOn5vb3p6/EhuqS1dd5Xpkj5lDLFQlP5z3yOyFkmYonoV9LpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YpyucDn/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14E38C4CEDD;
	Mon, 24 Mar 2025 20:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742847995;
	bh=U2itnEtEw8dYRuqh+Nkd+n+cV/VkuXPkeCP/FByVvn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YpyucDn/QAvK0eQpzRJI1sbLV5MJQINSLAB8fswkB4uz6+jdAX1XDBH8eGgCI3aCc
	 vOrtllfdHI0B11aB3jrSQJkCZcnQFJaUCTUTvBNcDD18XNPru8kmn5bxFErmlh/KGF
	 gGbclZN+au0HKYdCNww7YBTGS2CD0whXXqOn/Pw3zSLRTwORsFdITEiBKaZpNp03Hj
	 EdzSFH5rwElpTZiUbi6QBuPLKwBju4oxMGBpbV8lbFRsEiiK/3LePbari2zdgSO5Dr
	 ODUXEKm5rbyY9g24tb1LNg5N82SLCckSSG2jVkoZV2W20acQIYaeOhI7+ck1c9vEIk
	 IsiZxWeDoC/Nw==
Date: Mon, 24 Mar 2025 15:26:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Alex Elder <elder@kernel.org>,
	netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: net: qcom,ipa: Correct indentation and
 style in DTS example
Message-ID: <174284799393.813695.16014567995562723088.robh@kernel.org>
References: <20250324125222.82057-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324125222.82057-1-krzysztof.kozlowski@linaro.org>


On Mon, 24 Mar 2025 13:52:22 +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/net/qcom,ipa.yaml     | 124 +++++++++---------
>  1 file changed, 62 insertions(+), 62 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


