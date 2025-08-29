Return-Path: <linux-arm-msm+bounces-71257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7E5B3C210
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 19:50:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B6D85A08D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 17:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0114E3376BF;
	Fri, 29 Aug 2025 17:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iy1WN3LL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83501F4631;
	Fri, 29 Aug 2025 17:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756489849; cv=none; b=IIhEpY/tAJ2PNLMgcO6uNWCD6O2kzztr/ToVq6yFOs5yeNcuXfSEoXdB743b/dNR/FxvUUXzZK/69noQAfP+TTiez32B48VhJyTktbgl5X5fWwBg8Zne0a96VSkYyw34OB/+NN17WjRZ3SuLrVVgYG1ncyUDoRUC8nhhf++oLJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756489849; c=relaxed/simple;
	bh=7qIvpZlYTi//fSzjgZvpyX5N/FgxRpkmRhI5BQCHWyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MNJkT/+uhAXJBPrxa06NJupTa0+Gdc3jHA7AM3oUZCMZIU2p+sMAD5Kk+/5W0xpVTTuBu8xk35LSfXz4o17+Dot/WapRFPENSRYmHMCoJJvICks7FlREWgSIyq1h1QWa15VZqfZ7VhscyC+hL+/SK5QBrGLQ6yhZ4bO9JR4j16M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iy1WN3LL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E33C4CEF0;
	Fri, 29 Aug 2025 17:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756489849;
	bh=7qIvpZlYTi//fSzjgZvpyX5N/FgxRpkmRhI5BQCHWyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Iy1WN3LLMTh8o28cBvQ2uz8LR2949jBvHlcSEag1c6FkEswp5kPcpdnM8oJyTt/Tu
	 hBKNMlhvZpUXkkvoryVlxfH3gfZM4OYVZ8v/M+WKlgdZcxGaw/pKyQ16bdmcF4QGa4
	 zB4J/T1fuluugizSv00DOXYekb9hauLY69nOyusgmM8NgT4jUXlSn9Y7UWW74G2VBQ
	 dlT+jNyIa3zC0iWqD2tKdI745xbuxi9BUA7fyfgIdvngQc96Zx1y4HdHgwWAdgPDVf
	 PHfQYNt4qYn7LjMQNimQ6xgA2T5L95TzF4ZNLyJ38o62nwV/r+nZVDZAhjL5Jq+EdK
	 X0/WWfIdsZLhw==
Date: Fri, 29 Aug 2025 12:50:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, kernel@oss.qualcomm.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Mike Leach <mike.leach@linaro.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: qcom: Add Coresight
 Interconnect TNOC
Message-ID: <175648984746.1068381.2779865131984484045.robh@kernel.org>
References: <20250828-itnoc-v3-0-f1b55dea7a27@oss.qualcomm.com>
 <20250828-itnoc-v3-1-f1b55dea7a27@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828-itnoc-v3-1-f1b55dea7a27@oss.qualcomm.com>


On Thu, 28 Aug 2025 02:27:22 -0700, Yuanfang Zhang wrote:
> Add device tree binding for Qualcomm Coresight Interconnect Trace
> Network On Chip (ITNOC). This TNOC acts as a CoreSight
> graph link that forwards trace data from a subsystem to the
> Aggregator TNOC, without aggregation or ATID functionality.
> 
> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> ---
>  .../bindings/arm/qcom,coresight-itnoc.yaml         | 90 ++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


