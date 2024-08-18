Return-Path: <linux-arm-msm+bounces-28890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5749E955D6F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 18:19:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 891A51C20823
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 16:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F2C114659A;
	Sun, 18 Aug 2024 16:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IeqgubYU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006581428F3;
	Sun, 18 Aug 2024 16:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723997955; cv=none; b=lBFuQly6MlMrTRbhYFBeTzeHlP0oTV7Xz2ERSHd4yLhprFrqiawkLYMVS5IYC1z3vxqKvzNaaY/HgiwD44S2la2X3ygHQN57zmATbb4ALdahoIndquzYMid262TmPXoy+xeEI9xf3iwdd7Hoyd1i2pRNHrKYVX0+dvogrrP/lNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723997955; c=relaxed/simple;
	bh=YluesXjsB2R7i7RQH2TQx+24tHrAM4md6f5U78cPnJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k96pKAlgENIBPI1YGdkFG4h++pRkW7vQWrWSTu/mr0d11jBJyg+B+lL5qQFf7peG5Jru1A3DKqI9GHRKHqkTnINnQqh0fk5uLqhjK38bYx+vf0RC54eHex9pK86E08igy7U2aK8o6dXIPEWW3t3mUf8QtlMNLlFVzY1p6a3KJac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IeqgubYU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6769BC32786;
	Sun, 18 Aug 2024 16:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723997954;
	bh=YluesXjsB2R7i7RQH2TQx+24tHrAM4md6f5U78cPnJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IeqgubYUZEbOcoLQ1o4KkHX4pB/T8RSICw3Hzi44ssR3GnPHaVFpc2Akq8KJlNikE
	 PTpBRmq4gLk/SO/JFVZIOxaW9lUO1iuB9LtAD6E4IdI3Vc0dwsVkYHmWVXenEnPR+E
	 asrtOrONdL2uj7UnujoAh9Cop6Nk/TdYhW30UevC0itvLVyzxe/GC6mKynJgbZ4LUO
	 Iq+iASlgTnCk0FvbdBSkopMuGg5fxz9zhJYduSEZbcKeDG+aCw6QK/wCTm74R3wd0M
	 Ii9251OHdcKibgmdTUHaFE2T1AC0k/L+vEbzgqxFYBItVlxg5iCf3NYWvNuer5Rbdp
	 CMXKcTxaLmt4w==
Date: Sun, 18 Aug 2024 10:19:12 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Taniya Das <quic_tdas@quicinc.com>, Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom,sc7280-lpasscorecc: order
 properties to match convention
Message-ID: <172399795204.184314.12520196650917925923.robh@kernel.org>
References: <20240817094605.27185-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240817094605.27185-1-krzysztof.kozlowski@linaro.org>


On Sat, 17 Aug 2024 11:46:04 +0200, Krzysztof Kozlowski wrote:
> By convention we expect first "compatible", then "reg" and then rest.
> Order properties to match convention and what is in "required:" block.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Cc: Taniya Das <quic_tdas@quicinc.com>
> ---
>  .../clock/qcom,sc7280-lpasscorecc.yaml        | 21 ++++++++++---------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


