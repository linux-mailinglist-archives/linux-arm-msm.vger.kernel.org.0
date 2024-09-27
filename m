Return-Path: <linux-arm-msm+bounces-32698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EB0988CA2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Sep 2024 00:49:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEC9D1F221BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 22:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B9391B6523;
	Fri, 27 Sep 2024 22:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+fQJQDe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601B21B3728;
	Fri, 27 Sep 2024 22:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727477386; cv=none; b=ZAfP+5EHQNogE4F9ARu/Y3CT3HF0eyfIAeqEMS+oYthfYYtpdXPCr6Vj1pmBmYlgVCvybvHgEQJ1sYLnxHwNNQ0yaeDVj+gmx5JGi7fbgL0yuiWKZ7NYnn1IOppxPHSFhjOfKAW8KbLYy/MmMZ0xigo7UgDOiQ+R3QRcmXDujs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727477386; c=relaxed/simple;
	bh=MFU0qQAtAXr5JslIwaEJ5LhNO312cYBvIiVtSoZmqg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmYw33Rd76F1820vGcdJQ9hTwKmAcRmqvLDd36BeSq/ZTFG4Ju7XFkMU3Z/eldFYZaz3I0QkBOKXkEAPZPm4asRB4ufjqncK92Mx09Bw7VeGjEEZW4ZGv+nODucEI+377TUgXUfD2f6nlHc7VLO9hTsqAPX9M1+IlTb6v4yB6Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g+fQJQDe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8084C4CEC4;
	Fri, 27 Sep 2024 22:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727477386;
	bh=MFU0qQAtAXr5JslIwaEJ5LhNO312cYBvIiVtSoZmqg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g+fQJQDe4Xlwlu0FLTjHSbuNKlIPMe6JRfbD4yXWdTQQkD5KWrBrwy2Q3nXhVlJ25
	 hjwEYdGBC3MOReDBL0IF+tSeiLWBzcbGI6fIEn+Wi2WI3AkNtFRHXbSfwJ3mNTHbZe
	 eqFLIRJHtH9MS41H2xplm4uoewFgN9K9yI7iFaMCeMyK5deDW6FrElxPcv40Za4KM3
	 7L3VA0i3L5dL2A+PI82eeH/r3yRjQhxIbODqz27gzSlwzdSUeuL4MiIpfQbUpOrE7B
	 IHpVV+A/6cb8qopgMXFm9EThXCeKahTi3agUnHtcotDED7yMQhFfH+N7QBc9/W5jxn
	 RLLTvyav1TrEg==
Date: Fri, 27 Sep 2024 17:49:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 3/3] dt-bindings: clock: qcom,sm8450-camcc: generalize
 title and description
Message-ID: <172747738366.162020.7473958088280465044.robh@kernel.org>
References: <20240927103212.4154273-1-vladimir.zapolskiy@linaro.org>
 <20240927103212.4154273-4-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927103212.4154273-4-vladimir.zapolskiy@linaro.org>


On Fri, 27 Sep 2024 13:32:12 +0300, Vladimir Zapolskiy wrote:
> Currently the qcom,sm8450-camcc.yaml IP documentation serves as
> a description of camera clock controllers of Qualcomm SC8280xp, SM8450,
> SM8550, SM8650 and X1E80100 SoCs, and there is a room for more
> controllers to be supported by this device tree bindings documentation
> in future.
> 
> Generalize the title and description in the documentation file similarly
> to a number of other Qualcomm clock controller documentation files.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml          | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


