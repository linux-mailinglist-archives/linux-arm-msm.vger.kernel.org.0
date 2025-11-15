Return-Path: <linux-arm-msm+bounces-81938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B332C604F4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 13:26:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22E783AF0E0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 12:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F112428C840;
	Sat, 15 Nov 2025 12:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OuZBf7Ax"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6598212564;
	Sat, 15 Nov 2025 12:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763209593; cv=none; b=RtveVpXCTY9fDZzCY2ngJp1IM2Gr8wydyepumMMx/9sJNsMBZjIMt3Ard3sJcxDQau8eK7j4g3oT6Nwt6QF3B3JwJ0OJoT8QvcxWPbeFQ5lEyVgNdgujsewJ/uin1GMhRxP3cX6yc6giJnP6k8EPQIENdds6G827v8wbNSG84gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763209593; c=relaxed/simple;
	bh=pX48DUNv03OctBtMmAn2ZIlf+o5Gd8/XOkRTjZIKGtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=do2ara8zVmi3fV/bERM6cRBb32/L5nNnmCqsRnBU+metvJND41YWJvyplbdfL98VTh+Qb7awJ3RbqV9AgrlC5rdi7l0m9ErODkUmO6eCB4TYXu8HdyCPJBKbVCTd8cQlilLtBwvfADHcJtvbfwwyYF2rM74SWedPL/FideqB/K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OuZBf7Ax; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB1F2C113D0;
	Sat, 15 Nov 2025 12:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763209593;
	bh=pX48DUNv03OctBtMmAn2ZIlf+o5Gd8/XOkRTjZIKGtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OuZBf7AxKbEN1fPiATDGBlAgvMIUpJ9hXUjHDLV54pA5ppcD9f+SubchjXzdsjbAi
	 xFlUynDOlR9W7eSGK6uzEgCpFsedrci3NHtvlBEwaiRs/CPeLnHBSZ0SmdL6/wEeVS
	 kNGZWNPSO39nIfuNjgJfX2Elg62uikanGAgFLA2L/BdGhcpi09lflshilmTxLqdXs6
	 y3eUQYvdiQFFyzIPHk7vD3hnXncPdYE0WFty7y16vprqI69fUeT68xQmq+Q4R3M9fF
	 YbHNkuSKFn2ykbJcdFzf1kgNPSx7m18TWePFn8imR3QkNyTwaQAIAL5EI/aPL3UsOD
	 483GazTfdnVwQ==
Date: Sat, 15 Nov 2025 13:26:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Roger Shimizu <rosh@debian.org>
Subject: Re: [PATCH 2/2] dt-bindings: arm: qcom: rubikpi3: document rubikpi3
 board binding
Message-ID: <20251115-attentive-mustard-dove-a02c56@kuoka>
References: <20251115-rubikpi-next-20251114-v1-0-fc630dc5bb5d@thundersoft.com>
 <20251115-rubikpi-next-20251114-v1-2-fc630dc5bb5d@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251115-rubikpi-next-20251114-v1-2-fc630dc5bb5d@thundersoft.com>

On Sat, Nov 15, 2025 at 12:34:16AM +0800, Hongyang Zhao wrote:
> Add binding for the Thundercomm RUBIK Pi 3 board,
> which is based on the Qualcomm Dragonwing QCS6490 SoC.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> Reviewed-by: Roger Shimizu <rosh@debian.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

A nit, subject: drop second/last, redundant "binding". The
"dt-bindings" prefix is already stating that these are bindings. And
that this is documentation...
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Please organize the patch documenting the compatible (DT bindings) before the patch using that compatible.
See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


