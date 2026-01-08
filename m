Return-Path: <linux-arm-msm+bounces-88131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29872D0511B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 18:38:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A7C530123D9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 17:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A80762D249A;
	Thu,  8 Jan 2026 17:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HOOgslj+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847452C11C9;
	Thu,  8 Jan 2026 17:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767893743; cv=none; b=GSJsCDfU48Y5p1kYmUjY1zXUKepp6GukAA/0MOu6Z0L/nTcJ2lTS2rLrO0jfpRHOUiFjwddTy8I5Ds6xpnJehGk9OLJZFyIkS+9Yacw7A7u9UkppFaEmDoPGkh+jnor/XEWnpLSfDe7NCq95HjBQ5F4a5Ko03bX3x/Q3NZtM304=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767893743; c=relaxed/simple;
	bh=6GNlxXmwfPo4kRo61SwrZaFZc1YRbQmVXEEiNyH4gAo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=upQXD6uE6fssGZJX+LROBvERLfaDNec5Dbj5l03YEPL1PAk7pCsba1g7WKpwJZZPwGjKYZDDCm0TricgVl7qSTR2QTTRaRKTuOTj0Hz4fnYcVZgjQBXdkBq9t4s6oAD4ZP5cYEw0PTgc+CrZxjMcMzKqGeF2JlJlFGYUhq7luR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HOOgslj+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EA17C116D0;
	Thu,  8 Jan 2026 17:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767893743;
	bh=6GNlxXmwfPo4kRo61SwrZaFZc1YRbQmVXEEiNyH4gAo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HOOgslj+UUSj9kSGKLSlN9LklCEjQDeujInSSk4QJpNxWK1U5R4yIagTTvEB2OKUW
	 kb/0M7Eaeg+mL+XBGyqHyRn/ZsbfOlB8KqoWnIHLg+OiIjjsnRv6DG8JpZ7Npu6Jev
	 pnXYS8KzNviYsdPa2oFyr7HTg53pmtdXDRh0E2Kd8sEsOdYG+YnZqhOXvvheL8QJQO
	 CUWrX6aM+gt1quQ/mjtWeMI9j6ZrT1+RMk+we6oMufAQqvQaweuZmGja7CZA06BWY9
	 9gwmC+k7Uki3FyOFEbWyBnIKC0gkLOC9PtW7e1B3akVALvxRsh0DTBeNtwdZyYaNMm
	 nI5OYwuAGEybA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com, 
 kamal.wadhwa@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com, 
 yijie.yang@oss.qualcomm.com
In-Reply-To: <20251215-knp-pmic-mfd-v2-1-1e91138c6fc6@oss.qualcomm.com>
References: <20251215-knp-pmic-mfd-v2-1-1e91138c6fc6@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2] dt-bindings: mfd: qcom,spmi-pmic: Document
 PMICs present on Kaanapali
Message-Id: <176789374037.1117798.14242637055422802029.b4-ty@kernel.org>
Date: Thu, 08 Jan 2026 17:35:40 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Mon, 15 Dec 2025 16:39:35 +0530, Jishnu Prakash wrote:
> Document compatibles for the pmh0101, pmh0104, pmh0110 and pmk8850
> SPMI PMICs.
> 
> 

Applied, thanks!

[1/1] dt-bindings: mfd: qcom,spmi-pmic: Document PMICs present on Kaanapali
      commit: 2a84a41a8c2d3cbc2460d2bc60569a35c4157e76

--
Lee Jones [李琼斯]


