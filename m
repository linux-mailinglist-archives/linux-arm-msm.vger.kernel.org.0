Return-Path: <linux-arm-msm+bounces-59603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BACAC5A79
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 21:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CADA37A893E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 19:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420CA27FD6B;
	Tue, 27 May 2025 19:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQPN7bIl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D5A156CA;
	Tue, 27 May 2025 19:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748373187; cv=none; b=agMQewfSjichF+5mS6uOQKO0c8nPyuMTCSNFhk3sDZvag5MqpNRtn1+p2l/nzf6Q20/mCKo2XB5dfBT4L19cPL3qwYDPjOTa1A3Bli0xcHTesEbfCoAv2EN54pzBiNMtXr5uvcvB4SZuNpxF1URmxq0v4X+NJtr4r+R76e1CAtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748373187; c=relaxed/simple;
	bh=ozlZ6ad1wq7Ak9GnlK1ruqF55DzzNDPNnFPG9giPuCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o18CT612+Xoo0YkiasbjEYjxEG4Zo8ZLtyklyR9yJ4xMDXVzZ4rvuY0bdhPB6iXXjCdKji/Z+Y1hZcbZAYAOk+2wxkHMLi79NDKSTHFIyq2rLYzxE6wIpAy+dEebqPBCozlwlyR0RVLMBfGKxBG7/eP8sl2R1b7LwSC+GLB+gVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZQPN7bIl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C882C4CEE9;
	Tue, 27 May 2025 19:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748373186;
	bh=ozlZ6ad1wq7Ak9GnlK1ruqF55DzzNDPNnFPG9giPuCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZQPN7bIlvf0N9RSQtr6DAvKBK2P8eUE23nKs0E9iQAg3Su0CEoG3UXexfhLpvE2wi
	 wVYTKTstMZGj3DaL/i4ncP9QJp0XykDwxW+2aTdahn5uHfhf1T4TZQwbM2YhgaYGfv
	 mrgHZMhHfywHhG6iSuE3E2flyl/Iuo1cO2stl4+i4K0JdLQ1FaT6SPKHYNSkLFAZu9
	 XgIDSkOy3sdHoR9+YQBDMwKlor67o4nyzi2vX09rSVZVinL21DCUQ967Rrqs3U44mo
	 Mo+NZN4AGnECBhXz/puBM1xs/UM0vb1FU3pzGPagzl4sly/Ptp6gwfaQhh7twTrYfV
	 IHqrf481S5E5Q==
Date: Tue, 27 May 2025 14:13:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rao Mandadapu <quic_srivasam@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: soundwire: qcom: Document v2.1.0 version of
 IP block
Message-ID: <174837318334.1029846.8735268990996464177.robh@kernel.org>
References: <20250519080453.29858-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519080453.29858-2-krzysztof.kozlowski@linaro.org>


On Mon, 19 May 2025 10:04:54 +0200, Krzysztof Kozlowski wrote:
> All Qualcomm SoC Soundwire controllers are version-detectable (even
> 1.x), however certain unidentified quirks might be potentially needed,
> so document v2.1 version used on Qualcomm SM8650 and SM8750 SoCs,
> fallbacking to v2.0.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/soundwire/qcom,soundwire.yaml    | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 

Applied, thanks!


