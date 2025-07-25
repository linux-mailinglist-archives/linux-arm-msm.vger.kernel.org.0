Return-Path: <linux-arm-msm+bounces-66652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90212B11961
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 09:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C909D5A0D8D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 07:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E58022577C;
	Fri, 25 Jul 2025 07:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="arGz9KEt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F6A41A8F;
	Fri, 25 Jul 2025 07:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753429752; cv=none; b=ZfFOYd9b5NwXQv8ubVU8k2rpg1TEn5iqitPY7n2j3kLkn4JWyLyW/9tp4VWr4Wcr0RuChzsbXZE0RIhG2M8hrXMriu6tVvCdtPuKI7t0OhQDHTJ7s/LZkOGQ95e3Dtt123aoOSCX+zq131Pi0FgSC97LjSaPx5v5KpJVmv99QQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753429752; c=relaxed/simple;
	bh=b7t02t/Q3eL6j/CVB7xaaIalybsf4crGHifTvyW67MI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F5jSCuNliL3TEYn5CHrOpr2WKo1Lh8BGr0y9Ylj+7yfoeoMeE1/8WLLXtTVpnjIXzClxVOQD6O3/wk7NeSi7p6t2mD6uV46MhW5wIn32xNFXSbhOLWAmzasRrdEM0mQBRS599DY93vtTSnoU1/WGR+Zyrct3qJF1r69DK8hdLfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=arGz9KEt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FEBEC4CEE7;
	Fri, 25 Jul 2025 07:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753429751;
	bh=b7t02t/Q3eL6j/CVB7xaaIalybsf4crGHifTvyW67MI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=arGz9KEtyzg38s1B7wJOt5EMuGXepL95RBcBftWsesSD9XQWFbP/9vV6YcUp3Rrmt
	 69UwnXh7UJzw6PhXKYXbGa1IlW7+Zb0TEEWrJIAA050aRh11+UYzQLOYo3WvlZLf/X
	 4wiiHHGR1MWqfWY54CZnF2QLtX+6MWaGBF8Tt8hJj3SrjXDC4R/Odrgq6BXVGi+jgr
	 gITPkpSlHBRMWSn61dqzEBXUMvPi8a6KSIQ7TbvAG30cS9Muj85unRUsS19XwG/9NC
	 qDJX9kxEpAVLzlYSFIXv72OpIWshm4kFslM56TK4SQhFfgPez8IC9k5YybiJODGzZ9
	 fZelPxkm5r9RQ==
Date: Fri, 25 Jul 2025 09:49:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] dt-bindings: clock: qcom: Document the Glymur
 TCSR Clock Controller
Message-ID: <20250725-chubby-spiked-tanuki-eefcd9@kuoka>
References: <20250724-glymur_clock_controllers-v2-0-ab95c07002b4@oss.qualcomm.com>
 <20250724-glymur_clock_controllers-v2-2-ab95c07002b4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250724-glymur_clock_controllers-v2-2-ab95c07002b4@oss.qualcomm.com>

On Thu, Jul 24, 2025 at 02:59:10PM +0530, Taniya Das wrote:
> Add documentation to support the Glymur Clock Controller, which is

What is "Glymur Clock Controller"? GCC? But this is TCSR? Please write
accurate commit messages.

> necessary to provide a complete description of the clock control module.

That's redundant, just describe the hardware.

Best regards,
Krzysztof


