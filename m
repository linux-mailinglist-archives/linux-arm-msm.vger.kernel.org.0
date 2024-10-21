Return-Path: <linux-arm-msm+bounces-35174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B70F79A5DB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 09:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D9541F21822
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 07:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 135031E0E11;
	Mon, 21 Oct 2024 07:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kx8vG8LF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D421DFE22;
	Mon, 21 Oct 2024 07:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729497274; cv=none; b=BxNokTdA3iY4ANQQE9ndEh+ObfOO5iUB/jtao4vkd7TdVDJOGlsQkL9CRo/V6SlgOWUFU4N0LGhF0KJuVlRrimLQEmk43qs2Ri8LVtv/Dy4SgOh+1Qjg+Xw7VijBg97dSPUuDB5BmeKGMUwqNSzGVfDJfU/oWQwaFU97Caq0BgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729497274; c=relaxed/simple;
	bh=6359T+D+9oRpIhkYbz4Y7iD91c89IBjAmXYD+Y3JrtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K98i58T1xkOHQtnURPYuNiI0epSSYmwvf56RyIPhf9oWarw8Ml/WVz6cRZWL2UUObVKiVXolIEbakNNfrrIPjpEnmHJCUvb8lsbjbTi1mNFPx3CtJePGPhdYj/epkZGIqq0bLpN8Rqn4aZrG/FJixxdtj1IdhIsOumY7wnw1y0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kx8vG8LF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A950FC4CEC3;
	Mon, 21 Oct 2024 07:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729497274;
	bh=6359T+D+9oRpIhkYbz4Y7iD91c89IBjAmXYD+Y3JrtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kx8vG8LFj5ak8fzzyCPr+V5wikO2BRTG4JW1YeyfyHd8lghUrCjHziO4y04SefVHn
	 9nzFgoeT/AIYKGUPlMZsuHtSdN49DINLUxVpJrarvuheWXfegxXcm00pSx0/ttn56U
	 b7mlWnOdUH1Nxpuyb4znOTYC6m3KS3KkJb3rG2pfDHytjZoGSoB8gIZ47Ec9a3x4qg
	 7Y4Wf2CbRAFgBe39euB0oUiM7NC5Xzwy89dSdKKo4mwDPvToexgEEvq91M/YESupvI
	 Jauky9sPnLsqvrrVXq9sgqIFsage8izTqLo5hJFeJjflGZEI9MWOfoY6XdTyBaITXG
	 p7EnwPNdwkwaA==
Date: Mon, 21 Oct 2024 09:54:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Imran Shaik <quic_imrashai@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: clock: qcom: Add GPU clocks for QCS8300
Message-ID: <wbkon6izhasg2jn2fqkjbzcawn7qx444kb7dvfoncaqkcr7gry@vote5okvj4gs>
References: <20241018-qcs8300-mm-patches-v1-0-859095e0776c@quicinc.com>
 <20241018-qcs8300-mm-patches-v1-1-859095e0776c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241018-qcs8300-mm-patches-v1-1-859095e0776c@quicinc.com>

On Fri, Oct 18, 2024 at 04:42:29PM +0530, Imran Shaik wrote:
> Add support for qcom GPU clock controller bindings for QCS8300 platform.

Why are you adding defines to SA8775p header? Commit msg should explain
non-obvious contents.

Best regards,
Krzysztof


