Return-Path: <linux-arm-msm+bounces-84936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 701A3CB4005
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 21:55:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 369B1302651D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 20:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4116E326920;
	Wed, 10 Dec 2025 20:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hjrsgxwj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FADC305E01;
	Wed, 10 Dec 2025 20:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765400108; cv=none; b=HwTUETR5vR3/34snROCAiLBwihRV7WcGgmcE2Ol9V+MIeaAwoZoe+vCECeGt6iZIOMaCLphjtb7C6EptDUkSC23MhrzWLeZ+nMC4QtI2Ju+D7TP1mEQVLFS9TH8ANpBF0F8U8YeAgo/znWHWGCFzEEcT16D7R+VUnnjz5gtdbQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765400108; c=relaxed/simple;
	bh=J0WqnwnE4efMoOX19CT1EwVxRbH+WTqgRyVB3omnD2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gFlYt+YqEghKaD+Wn3vOhThKQ0O8HRM7EBE/X1I6rPTZLnAqOG6kiNPXgvJczZnO4yS6nvRrhHvWoD7pn4OE0gTUVUGdpkFP7S4KIB7ccoq4yGve/G6aD+i0pbAD8AOdufpihzUXdoFDypAlVv+V3AhE9ZHPm+Q6MRJHM7Z1pB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hjrsgxwj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C2EC4CEF1;
	Wed, 10 Dec 2025 20:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765400103;
	bh=J0WqnwnE4efMoOX19CT1EwVxRbH+WTqgRyVB3omnD2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hjrsgxwjjpSfLHYOY5btt9lFsCSon0poUS7SRHTLxh8KEiHzbhUgvuyfN9OHcwzic
	 Nc8iNNmivG6d94T1dm2BCjedWr4PZFTsJHY9ko27xYp54wS9owE7ZIpnRgpcPBgbfJ
	 Ypw136ETA8WRpI+Q8gFNqM59tUc6hjt/ZL5CC5fz0XuJjfxM8qjATYmVdMtK9yKkKO
	 OQ7+4yY3L/xkn6QVwfervt9Nj/kweRRBIV6AWNU+lLFPThNK60F8xj6WMsrPY/gvPk
	 InSsbGbW08Sl0kfuDoZMHkM8cmW6EYRHRxOLRwMqNE3ZQwlPWZrNtWLndH+SyBsVF5
	 DRmjXPS5cimXg==
Date: Wed, 10 Dec 2025 14:55:01 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Songwei Chai <songwei.chai@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, james.clark@arm.com, suzuki.poulose@arm.com,
	linux-arm-kernel@lists.infradead.org, mike.leach@linaro.org,
	linux-kernel@vger.kernel.org, conor+dt@kernel.org,
	kernel@oss.qualcomm.com, alexander.shishkin@linux.intel.com,
	krzk+dt@kernel.org, coresight@lists.linaro.org,
	andersson@kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v8 1/7] dt-bindings: arm: Add support for Qualcomm TGU
 trace
Message-ID: <176540010050.3328122.16194666326592248573.robh@kernel.org>
References: <20251203090055.2432719-1-songwei.chai@oss.qualcomm.com>
 <20251203090055.2432719-2-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203090055.2432719-2-songwei.chai@oss.qualcomm.com>


On Wed, 03 Dec 2025 01:00:49 -0800, Songwei Chai wrote:
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
> Add a new tgu.yaml file to describe the bindings required to
> define the TGU in the device trees.
> 
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/arm/qcom,tgu.yaml     | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/qcom,tgu.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


