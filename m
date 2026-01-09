Return-Path: <linux-arm-msm+bounces-88216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2C6D07D46
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 09:31:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 428EE3013BF3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 08:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE3243446DB;
	Fri,  9 Jan 2026 08:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/F98IYC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C0F337680;
	Fri,  9 Jan 2026 08:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767947477; cv=none; b=iZiGfBBFR0ql1xrwKllYH0ah4Ti6r6N0hwjAqjGeGbudmVpo5+dzEAynDPv58fSJnJOxICXIGLKiv19MZPfMM2DkAnfn/x95+TbIV7HiLucxh28x+Y1DuyCfEcHqJM4Z+aNJji+EAp3gzJigURVA1IGHP2HpseMoQm8C1yd7s4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767947477; c=relaxed/simple;
	bh=z/3K945QaPnxo9J+uTHlZjInxvBPFTxyR9rwDXWHnBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Si2kmzWgdx7UExOaQUYQ7eJlttQi9kBNoEUDeUUdxyBhBFdrZqVLNlRf2irnoH06WvOwEwTj4zBRpWykQArDucmJVayb+QqCEyeNLvPePmeTTS3tQ0bEOVQcx5R2s+GcI34xYKlGs9F/8uXfbVwifi4EPHMF4xdMWENvvAcv6Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/F98IYC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49C3BC4CEF7;
	Fri,  9 Jan 2026 08:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767947477;
	bh=z/3K945QaPnxo9J+uTHlZjInxvBPFTxyR9rwDXWHnBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h/F98IYCnm230ekFZV6Odp+YUCpsetRbeBwvHWXz1TUVfP9wo6MZsFkDelPRwFRHL
	 s+y0GrTUTALP5YsT+pIWPl56Kug2XTs0jogTxnjqHgHzwom4AGndIykRGE4z7q4wZp
	 aU6ZkRQehPCAGn4dp3Mn62eaNJNtyEoeFcqk+dXcMDbu5xw67Zc6Y1ueNtYK9HC7iC
	 SmUg16Lb+k2o5hyqSbg+mXIT1l6HUJ2QN6ZFsvnqDB2UVpiEGPNnxrrxOF9sRXqWD3
	 xqXBnhGuEj8/D05wt+n59J/B5EH/RYgF5uph7tntf36f8hwHZmbiixOgQdVSqo7cC6
	 AfcmupFlPFv2Q==
Date: Fri, 9 Jan 2026 09:31:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: andersson@kernel.org, krzk+dt@kernel.org, mturquette@baylibre.com, 
	linux-remoteproc@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>, Govind Singh <govinds@codeaurora.org>, robh@kernel.org, 
	conor+dt@kernel.org, konradybcio@kernel.org, sboyd@kernel.org, p.zabel@pengutronix.de, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 1/9] remoteproc: qcom_q6v5_wcss: drop unused clocks
 from q6v5 struct
Message-ID: <20260109-rough-goldfish-of-sufficiency-adbfbf@quoll>
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
 <20260109043352.3072933-2-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260109043352.3072933-2-mr.nuke.me@gmail.com>

On Thu, Jan 08, 2026 at 10:33:36PM -0600, Alexandru Gagniuc wrote:
> Three of the clocks from struct q6v5_wcss are not populated, and are
> not used. Remove them.
> 
> Fixes: 0af65b9b915e ("remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404")
> 

Drop blank line. There are no spacers between tags.

> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


