Return-Path: <linux-arm-msm+bounces-86005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 147DECD2ADB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 09:45:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B4093018185
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 08:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A28E22F772;
	Sat, 20 Dec 2025 08:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q6fOAW5M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584452F5498;
	Sat, 20 Dec 2025 08:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766220311; cv=none; b=Bv2WIZsQ5pqB/OJ/W30hW8LpMlneM5Yo7Nlii6Q6VQWq/+8V9HIwx8PqNnFZoJQrmyIc44XvSXU1jQQXWJptU46Lfe+aQzM/dhE3+sd8TT1fHlzoGNGtEo9EAxP/O+2ZtIxMRhX3rU6Eqsvs/zSGGWjjFA2rj609h3w2gg60ss8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766220311; c=relaxed/simple;
	bh=efN9MhWgEWbKAGAdZP1aJI01POr/BYPB1YAW4Yx//WM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pv2qC1niB7xCjv1h/A1cjfocUhPxjGNf51ns/F+vLqRieFTDc1UsCcsmQdQDGupFICVjbxCZOSz0OXrwfzgERpoFOC2dzIEv6BlIcZqH+cZcXJ8ybNmifI7ME8JyWn5jxVsss3q0yDOIi08q0oiNUiIIUSC4T4XdafNYCDZ9r2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q6fOAW5M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0811BC4CEF5;
	Sat, 20 Dec 2025 08:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766220310;
	bh=efN9MhWgEWbKAGAdZP1aJI01POr/BYPB1YAW4Yx//WM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q6fOAW5M/tHvvwbuIDtSB+lNvP/Z0vfCzF3NOUhUPeLfJyx+ia5o2PTG09t5htN+q
	 LeWzfJd8E7i2HmDGfZ3+J2T1o4szlOVsrxHooIA+xL0RWkj0znboEn0KWw/g3Bh1KS
	 Txf5cquKV3rMSJM1FzxuOYzJ9QcdvytsYNxOJh8KmVsa71O0QzabPYG1QZWwxeDgo7
	 yWX2SpSaJLaYh2BqRGvtpO8Cut+7WvkPOoXeabY07tHF64mpRuD9UCnnxIs3QcrBo8
	 2b7fBVThNNmZn9dliWICOrW86I7vql9OF+C58F3oIdpEaEGkBIb435le7zhtuSHQpS
	 pAIFyjcL3xkpw==
Date: Sat, 20 Dec 2025 09:45:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org, 
	quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>, 
	George Moussalem <george.moussalem@outlook.com>
Subject: Re: [PATCH v8 5/6] arm64: dts: qcom: ipq5332: add nodes to bring up
 q6
Message-ID: <20251220-hasty-hypersonic-boa-65f895@quoll>
References: <20251219031010.2919875-1-varadarajan.narayanan@oss.qualcomm.com>
 <20251219031010.2919875-6-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251219031010.2919875-6-varadarajan.narayanan@oss.qualcomm.com>

On Fri, Dec 19, 2025 at 08:40:09AM +0530, Varadarajan Narayanan wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> Enable nodes required for q6 remoteproc bring up.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

Mess with DCO chain. This patchset has this mess sine some time - v7 had
it, now in different version v8 has it.

Fix how you handle the patches.

Best regards,
Krzysztof


