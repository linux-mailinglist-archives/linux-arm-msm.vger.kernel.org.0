Return-Path: <linux-arm-msm+bounces-88223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E80B7D07E02
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 09:40:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0FF2E301D165
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 08:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56D8B350A3C;
	Fri,  9 Jan 2026 08:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qUewn12+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31671318ECC;
	Fri,  9 Jan 2026 08:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767948027; cv=none; b=Pqx+rTrRD1xeTGsA9DyjDIXh6nRio80Zb8jq3x9cIdw+SoC+6JjnYniTKERNYabj4zMmEpkLH9BtMn0AMK/wn52ABA2EJiaeUW8qPtYCcFiJ9JGFNDzJaV+0rFDtxXbOO0PbI7VU/dp7/uE2r1KsR6UqG0n6+1NIVbYskQqa/TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767948027; c=relaxed/simple;
	bh=N89pRSUFySMqGXkKFHlaudBE+y8YxfQrU4YwoHlhP1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tix3Yydr82bNn/ugyeWKb3ELNoV8O4SeAYKhX8aEaDVCGrFMFNLkH1V13+vQdhi/qz2QqwrYGSjfE9yApCY0DaiZ7Y1tslUrrb49Q79AI/wcPIcfbp00jp6QQMyRy5SQzN4dFYMREKJMkMRnMNT12qqObDvJ69pyWeVzBAfIMcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qUewn12+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9070CC4CEF1;
	Fri,  9 Jan 2026 08:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767948027;
	bh=N89pRSUFySMqGXkKFHlaudBE+y8YxfQrU4YwoHlhP1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qUewn12+G9iyBGTRd+S/CiysY/5+2J+GRZ0A0WwYcHTfjparRs4JJw//I7fmzCTeW
	 46IEKIdo/KEZ8LwX1SbmwZWn57bMHRCF1yWlG9gsIqTbIAsj7dIm/BwODplbWCTwRa
	 UnzM1G2RWCSzhhV/bwqRHo4UdYKBvZQShAI5XPtmWTl5lGMbWJrPU50ez9NoB1qPOz
	 DWXA4CAejZwBM5PKiAGM3/kWeBMCw8hw/Z3b5PkDQEcw5U5HB3id/CMZebdl7Ll1tv
	 nFVzDvPI66JFlyusLI0UT9GMSfUP9aMeE3KEQ9A7YTaernH9qmit5CdEmt8z+WCE0r
	 WRc7gNl+3SAVQ==
Date: Fri, 9 Jan 2026 09:40:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: andersson@kernel.org, krzk+dt@kernel.org, mturquette@baylibre.com, 
	linux-remoteproc@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, konradybcio@kernel.org, 
	sboyd@kernel.org, p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 4/9] dt-bindings: remoteproc: qcom: add IPQ9574 image
 loader
Message-ID: <20260109-rational-vivacious-tuna-1bb4fa@quoll>
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
 <20260109043352.3072933-5-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260109043352.3072933-5-mr.nuke.me@gmail.com>

On Thu, Jan 08, 2026 at 10:33:39PM -0600, Alexandru Gagniuc wrote:
> Document the IPQ9574 native (non-PAS) WCSS image loader. It is similar
> to IPQ8074 WCSS, but requires several new clocks. These clocks must be
> enabled by the host in non-PAS mode, and are not optional.
> 
> This binding did not have an example, so add one which uses the
> "qcom,ipq9574-wcss-pil" binding.
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


