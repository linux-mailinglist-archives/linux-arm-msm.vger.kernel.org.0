Return-Path: <linux-arm-msm+bounces-59188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D2BAC1F51
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 11:07:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DD661C00742
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 09:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF232236EB;
	Fri, 23 May 2025 09:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e34o0JUu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2053919C540;
	Fri, 23 May 2025 09:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747991230; cv=none; b=b4iyUAOubmONlehHpd7xqnmha/yOCTVw2mhLaDKuRsTuiw89LnsArXl+JtZwpThF0Fl8rhjv8TdR7BPeSlO0o5PdjGucqEtNkW5d3f942iyXc9UV90JvVhiQ6/urQ/jfv0wk2O3SZJKLalDwZ8cI5iXjyrR5t7fBu/c4ZVJ/KDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747991230; c=relaxed/simple;
	bh=w43p4EyL6FCtdgKjiMG+C9dLXe1q27wYjQ2eiZtJ6iA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pv9QLVoq/EIYmpb1Wn2+RmDj6PR4llc6FatRzRJAI0BwSF5ef27IBCmWXSy40lvfQesoYhs6EnZufK9dU6yHcnJxp1DUYmUp/cX57+hOwuegOjZKwAPHiI0hWRkE3BbfmEB1tsW0Un4DRrKAKOjEZ5SBtJUhnYYoFE0NkCxEGG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e34o0JUu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A69C4CEEB;
	Fri, 23 May 2025 09:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747991229;
	bh=w43p4EyL6FCtdgKjiMG+C9dLXe1q27wYjQ2eiZtJ6iA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e34o0JUu10QDuA0rVdjVZLPAacJRZlQ2ll9Sec9sJW23uGr3dhRR2bX7b4ZRcr8RN
	 PuLYnYYcUWTIQYqby17/jcYiPpr4LrBRUw5MmEigGyiUEDJMaY4GkWzUytD8749yg3
	 jov6+UTaRBxGiDJbMzj78IJ74ocWCRhWa5RkGDxqggqdYGkHtMROB5+s0+caOPqNEG
	 fNAE3wCP4G22dNV0ZynfwvSubNezX6Yb3/gjMT8B2WO+QN0eYib9mPRrFaqgVjlKwW
	 J6vqao9VP5k6AQ5OS8zJRE8eJDcvsmmr0z6OuzKSKjNyZdpPWhOWk18SguU4FM4IWl
	 yE5A/yWEjJzdA==
Date: Fri, 23 May 2025 11:07:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	Georgi Djakov <djakov@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 1/4] dt-bindings: mailbox: qcom,apcs: Add separate node
 for clock-controller
Message-ID: <20250523-cunning-pearl-rottweiler-1a79d9@kuoka>
References: <20250506-qcom-apcs-mailbox-cc-v1-0-b54dddb150a5@linaro.org>
 <20250506-qcom-apcs-mailbox-cc-v1-1-b54dddb150a5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250506-qcom-apcs-mailbox-cc-v1-1-b54dddb150a5@linaro.org>

On Tue, May 06, 2025 at 03:10:08PM GMT, Stephan Gerhold wrote:
> APCS "global" is sort of a "miscellaneous" hardware block that combines
> multiple registers inside the application processor subsystem. Two distinct
> use cases are currently stuffed together in a single device tree node:
> 
>  - Mailbox: to communicate with other remoteprocs in the system.
>  - Clock: for controlling the CPU frequency.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


