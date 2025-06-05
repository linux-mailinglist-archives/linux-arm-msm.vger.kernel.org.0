Return-Path: <linux-arm-msm+bounces-60352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2395ACF441
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 18:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 488113A8507
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 16:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD9571F2BAB;
	Thu,  5 Jun 2025 16:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IIrq+RRC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF9A2E659;
	Thu,  5 Jun 2025 16:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749140866; cv=none; b=VP93Ke/K3DCobC7Fuv92mlSgmB8Rq8yMcPcn43aQLZpLKwx/HvTC4X33uT0scUHROxDnuKcJdRTyg9FlCwDj75S/ERWK1TME/So0RYZVypVaL6wKzRNfFqoYbPij4daQkHJyMFdCYJW1uKFoFIYXZuT3P533fMDO4lCJEhkFM5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749140866; c=relaxed/simple;
	bh=kYLvhfDO84c4DA9StBqV8ZGHqoWAR6ExdP7P4Gbcg9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SNX612h3yEOUljvaols5teMDSE7MjmIDb1o4ugVm+khhrwj5NznKYd6yUVMp34kqLJXhtPjDh722hcGdvxmgr1VPQSdLVBZZPam+FY8BIkErt+TVIiAl8xx1BtQEpvK9wXGvPx61o6Zx3WmoQXb96fg0IaHZOMsCPrN5mKpo9X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IIrq+RRC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 886C7C4CEFF;
	Thu,  5 Jun 2025 16:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749140865;
	bh=kYLvhfDO84c4DA9StBqV8ZGHqoWAR6ExdP7P4Gbcg9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IIrq+RRC3lJ8JM9hZevCtF5Fia5h+GyYKAOlBq4VxLEWhleE56O+H+2p7Wh2Nx9Yv
	 4Hk7jZDEOymv+owP4rU0eZKJd3xa0aAExqpUy1tfNUUomODwAjRsIFKUioTI/n9lPV
	 NFSI0UzpCknBHf17V162zGLYLpO3h1dCundj5pPPZf/Sd8qK8vMBsKj61fGI4TliJ/
	 BQy3Ig3t60rnQKvE6G+Dkehx0/SnYoCTrer8jycOMDLlbdSMjimkZQvWUz5/iVcmAw
	 +9fvwHfUsMVBa+1XJ87dCk9nfwANPBXAk/6ZGxb4SYQUf5OJ6+SLCnCBDikQfkUV6D
	 TYpZq/JUNpk4A==
Date: Thu, 5 Jun 2025 11:27:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Songwei Chai <quic_songchai@quicinc.com>
Cc: Rob Herring <robh+dt@kernel.org>, James Clark <james.clark@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	coresight@lists.linaro.org, Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andy Gross <agross@kernel.org>
Subject: Re: [PATCH v5 1/7] dt-bindings: arm: Add support for Coresight TGU
 trace
Message-ID: <174914086148.2803656.8177326064551626527.robh@kernel.org>
References: <20250529081949.26493-1-quic_songchai@quicinc.com>
 <20250529081949.26493-2-quic_songchai@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529081949.26493-2-quic_songchai@quicinc.com>


On Thu, 29 May 2025 16:19:42 +0800, Songwei Chai wrote:
> The Trigger Generation Unit (TGU) is designed to detect patterns or
> sequences within a specific region of the System on Chip (SoC). Once
> configured and activated, it monitors sense inputs and can detect a
> pre-programmed state or sequence across clock cycles, subsequently
> producing a trigger.
> 
>    TGU configuration space
>         offset table
>  x-------------------------x
>  |                         |
>  |                         |
>  |                         |                           Step configuration
>  |                         |                             space layout
>  |   coresight management  |                           x-------------x
>  |        registers        |                     |---> |             |
>  |                         |                     |     |  reserve    |
>  |                         |                     |     |             |
>  |-------------------------|                     |     |-------------|
>  |                         |                     |     | priority[3] |
>  |         step[7]         |<--                  |     |-------------|
>  |-------------------------|   |                 |     | priority[2] |
>  |                         |   |                 |     |-------------|
>  |           ...           |   |Steps region     |     | priority[1] |
>  |                         |   |                 |     |-------------|
>  |-------------------------|   |                 |     | priority[0] |
>  |                         |<--                  |     |-------------|
>  |         step[0]         |-------------------->      |             |
>  |-------------------------|                           |  condition  |
>  |                         |                           |             |
>  |     control and status  |                           x-------------x
>  |           space         |                           |             |
>  x-------------------------x                           |Timer/Counter|
>                                                        |             |
> 						       x-------------x
> TGU Configuration in Hardware
> 
> The TGU provides a step region for user configuration, similar
> to a flow chart. Each step region consists of three register clusters:
> 
> 1.Priority Region: Sets the required signals with priority.
> 2.Condition Region: Defines specific requirements (e.g., signal A
> reaches three times) and the subsequent action once the requirement is
> met.
> 3.Timer/Counter (Optional): Provides timing or counting functionality.
> 
> Add a new coresight-tgu.yaml file to describe the bindings required to
> define the TGU in the device trees.
> 
> Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
> ---
>  .../bindings/arm/qcom,coresight-tgu.yaml      | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


