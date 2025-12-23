Return-Path: <linux-arm-msm+bounces-86347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F07CD964F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 14:02:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 379B230194C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 13:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00EBB3358C0;
	Tue, 23 Dec 2025 13:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JOXtAxZY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B9DBA34;
	Tue, 23 Dec 2025 13:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766494970; cv=none; b=CoqbPWgl317cqb/4f6Jx7d/xM9ITHUJLL/k769IXIQYrGzSXIVZccUyd8UcLRo66vapfyF6uFTRicnk5+xenxftcB2SKrArNo/lYnxarAfCxGDz6hrcXyVCndYYsJvUaoxpjOXLrzDIOga/FYbXwibd8vlU4x5ith+YJC4ulX3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766494970; c=relaxed/simple;
	bh=V0wqiOmpi4CzomRNd3MA/Fpe0+qbU6Doo0s6NTZmI/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IYBksI3nUGd8mMbsTdxiFekeEaiRcjEooC4Q9sWbR4TR/FQbHRIJxAFsbrhcxEb3XPMjMQ1FmgcErYX4H1EZKXXPUUmHpTG1USWxsJblnHyXQfhioa8iXfuXbhl/fSZfcoVWIcYMeUmVQqyitEh+mKY0zJ3AQXqgLdfV9tvp6IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JOXtAxZY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86685C113D0;
	Tue, 23 Dec 2025 13:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766494970;
	bh=V0wqiOmpi4CzomRNd3MA/Fpe0+qbU6Doo0s6NTZmI/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JOXtAxZYIghCWzWiYvb+yy0wes7+xe8e/roEQmPo19+qzhou46aEr64ngY4kfi7nm
	 etI5ah2tueI5yAuYHDmqjn7QEmE8J1yC9I3eFby/IOn8fKlWl0PyFu61Vwkb2gYxb4
	 cTfXAMI+3FNFXbVCDAyoG+vYl82rNxzlDC3ynlXjF/2nFhmjd0j6hX3pXeNy/CbDFL
	 fuDdyLyNQuBAwTwjYv6Ju9572hY4hbBNeUnUI0/O+lnRrMFwnfBBD7ZmFTwbNZXjw4
	 ywrV1wPjZoYQgl4tyAfdPei5JmGsnVT2M5OC3WPPpWIXdKawVvxH6cFVZCBUDkjI+A
	 PcCJHefRxaGqA==
Date: Tue, 23 Dec 2025 14:02:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali ADSP
Message-ID: <20251223-impetuous-muskox-of-cubism-a3cfbd@quoll>
References: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
 <20251223-knp-remoteproc-v3-1-5b09885c55a5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251223-knp-remoteproc-v3-1-5b09885c55a5@oss.qualcomm.com>

On Tue, Dec 23, 2025 at 01:13:47AM -0800, Jingyi Wang wrote:
> Document compatible for Qualcomm Kaanapali SoC ADSP PAS which looks fully
> compatible with SM8750, which can fallback to SM8550 except for one more
> interrupt ("shutdown-ack").
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


