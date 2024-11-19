Return-Path: <linux-arm-msm+bounces-38351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 858709D2ACD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 17:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82720B29525
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 16:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F8D1CF7DB;
	Tue, 19 Nov 2024 16:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EzEtY2uq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2971713AA35;
	Tue, 19 Nov 2024 16:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732033340; cv=none; b=RXVJTPxZ0DIYvqVyLWGTmxTmUn1gb7/mwo+iP8QH5MYgOO8CvTztJE+2D3b8O0Q+Cv/P5JIL4ylr7rOQ+PCiQdpOOmhJc/g5oYfD3R+1dQ29sikWWBpQJTF/ZMzttl1kcsSWdmoLh7DL18RWh7ygpl/eQ7rLze4MyxRxDj9b+t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732033340; c=relaxed/simple;
	bh=L2c7hq/N5CpA+t9DJDAqqXyAdM4Y47pSKX7bd5KrWM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QMO3HIYn12H/jUAJtMUytk2TkTCAbXmHaOHTC01JtizFtSqIc51QCebGCI7ifM0Yu+iAGghGMcvl2JdDMws/4S0LEXi2PGMTjr6Yl2gH0u1Cg2grVpdR9vK8nBjbP4uDOCEXxk5iNpy+/rf/3G3hGGoxIeKWOR+U796q3Ho/y3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EzEtY2uq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D11C4CECF;
	Tue, 19 Nov 2024 16:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732033339;
	bh=L2c7hq/N5CpA+t9DJDAqqXyAdM4Y47pSKX7bd5KrWM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EzEtY2uqIFfFJDe4sDFnh1rDghd23ltbfRkRDG/2ADvBxI+5SkiSpMrr53BIQZIYq
	 XR0/ZvO+MEbuhuKlRw1LZOpgx7wV/eLp7iX23DPP740ieHpz3KFBX8LBpKw+J/gIhu
	 ooHq++9yKLSCingrIx0MwNqWzelfHTC3BzujwVBR9l5y1W6S5dEbT+xY1XlYAppmIQ
	 ldpvp/W37Uh3R/AwfZY1H10T17zIZNu6qsq/ThSnbKvG9XOUoA13S8zuvZ95tP4oaN
	 xN7NAQC2bE7zKDySc9GRhv5dQbtZaVBcWHby8Y9CEHlYkooRoyISQEPAL6Lgor3Zl9
	 vv9RVCX9rFhVQ==
Date: Tue, 19 Nov 2024 10:22:17 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: regulator: qcom-labibb-regulator: document
 the pmi8950 labibb regulator
Message-ID: <173203333699.1761782.8447977397526994554.robh@kernel.org>
References: <20241115-topic-sdm450-upstream-lab-ibb-bindings-v1-1-1f4bff4583b0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115-topic-sdm450-upstream-lab-ibb-bindings-v1-1-1f4bff4583b0@linaro.org>


On Fri, 15 Nov 2024 11:04:26 +0100, Neil Armstrong wrote:
> Document the pmi8950 labibb regulator with the pmi8998 compatible
> as fallback since they share the same hardware settings.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../devicetree/bindings/regulator/qcom-labibb-regulator.yaml       | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


