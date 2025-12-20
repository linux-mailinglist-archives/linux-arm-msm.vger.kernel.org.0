Return-Path: <linux-arm-msm+bounces-86006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3FACD2AE7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 09:46:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7692830109A6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 08:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AE5E240611;
	Sat, 20 Dec 2025 08:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qw+bBk0a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8D81FC0EF;
	Sat, 20 Dec 2025 08:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766220341; cv=none; b=oWiUc6SEPUmsCUyoGtnmwA3rdBKRyhUllQ2C/OSAOhMNeIXnMJuBos2aIdE2uKw6pexz7k24c0p704T7FWPFqtmM4gP2UN1p81d+2ueyGdRWtthaKdsdmYkWs1C/MxZp69S4rx6pKPQYsmXMEUE9LjxLbTuIf4l2YN7HRNnU6kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766220341; c=relaxed/simple;
	bh=E83PYgXKvVNpmYokx8X6uiQgxTVJQc9K3iHEnK4jIFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pmOTJhzGi4MKKkClwH/wGNJZto0aCBPI5XKAIf2o8FF5nLdRTfRkXD37yn90XD99WOfmHiRuQr6IFqdphIBS5FDNDmlg1JjJzglVc+1KOWWtrMLO3ztOmnrus87Cg/2tXYdXjYcOqeSQf29j5ILiQyYhdXaG8kqhuXTGE6Ygvbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qw+bBk0a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D55FDC4CEF5;
	Sat, 20 Dec 2025 08:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766220340;
	bh=E83PYgXKvVNpmYokx8X6uiQgxTVJQc9K3iHEnK4jIFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qw+bBk0aWGbD12vZnCAphj0rpC6mSJd8DQ9g+4IY1c9Hl9SZLwaFZPive4DrpQJ7j
	 kpmPSKE7jgdfy9HU6aH4rvQG9/c3i1sQ7Bl/r7b+WZgMFcTpT9eUrqkiMS4ZlKDDVw
	 j4fqTj4O12Ma+4HaOXAZZe+tXjntd/wgcv4kTxOU4B5dRV0+fNUXpREbWCarz6XQL+
	 ncPOMf0Os/fpsgeG6ur9Z0mSQXYniJ+KGu4GHEVOp5bx/Pb7288j349CU+TuVYB8/v
	 /2ny1wn4IACx0X68mYtCDBswuiJM9nezFbMPcnXpKTz3Dw0xb6yAYQftF5ZOy0bzmS
	 GN+wXznC7V+yg==
Date: Sat, 20 Dec 2025 09:45:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org, 
	quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>, 
	George Moussalem <george.moussalem@outlook.com>
Subject: Re: [PATCH v8 6/6] arm64: dts: qcom: ipq9574: add nodes to bring up
 q6
Message-ID: <20251220-gleaming-papaya-toucanet-c2cb88@quoll>
References: <20251219031010.2919875-1-varadarajan.narayanan@oss.qualcomm.com>
 <20251219031010.2919875-7-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251219031010.2919875-7-varadarajan.narayanan@oss.qualcomm.com>

On Fri, Dec 19, 2025 at 08:40:10AM +0530, Varadarajan Narayanan wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> Enable nodes required for q6 remoteproc bring up.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

Incomplete DCO.

Best regards,
Krzysztof


