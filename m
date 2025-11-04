Return-Path: <linux-arm-msm+bounces-80266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B811CC2FCC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 09:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6657F189D93C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 08:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 177D4313536;
	Tue,  4 Nov 2025 08:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HWy+lEK5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC844311952;
	Tue,  4 Nov 2025 08:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762244221; cv=none; b=jmWER1ebw2bKjbu3Go6ECoWnub941g/W9NcSU+N+gdIJJUEV8Vq6l4OWKOrHXP0D6yUqTLw3TUk2qorQ794IARBKCVVUjOVvEm4OMoaly1tXtRlbN5SGjrn2PR/F600rLl2vlQ/UvLbduLTCakriOnN8PEXEeIJN0FxkL/Qg5ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762244221; c=relaxed/simple;
	bh=Yk7ThFaaDtJlPY8rrxE8kyU1OXkaJMR1gUk6ZatLi28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wkewh0aw6pRV05yvPyQoOx9PyvKCAWOXazpmOvfcRW1mg8AtruunlyrKVvL+dqsQTbsLF1c5dUHAlmWpHmx1IE4lwdme0E+4ddcxnWMSb8wnxKdamKxkJc3H6QAmFPtnRRtvEKN9pU+XYTd5KEsk8G02oA5iK0NgzWrT6CIhwyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HWy+lEK5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAAAFC4CEF7;
	Tue,  4 Nov 2025 08:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762244220;
	bh=Yk7ThFaaDtJlPY8rrxE8kyU1OXkaJMR1gUk6ZatLi28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HWy+lEK5fDUblCRFLVWdlkyTzUmubwMD5MR+UP6UGgbJCKkIglo/2i0IRA+lHI4dC
	 Y7uzpQO5K3qm7icWdUPfl/Yrx5ApA59d0sCl3u1muNCj7GUvHCxuTOOZRLfbA3sJwK
	 u4I431SFI4ZcpF7t//mGWvS2VnfEh4oIzuTIm+uCLriqq4u+4fDTCEstgHCoJw5gvx
	 twAxfQoQ7k72Vp20qTjNvCfIxu7FkBGO2C0TWE5mgRCyqEVCrLiMGAtkZYG5+7MMtE
	 sN1GXCK9qggAZvXSqfDe+E5iyVqTAc005I+/APQPXJYXV/NCGP+1MU7efcMZ6unHv3
	 SBUabvJG9BI2Q==
Date: Tue, 4 Nov 2025 09:16:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: soc: qcom: Add qcom,kaanapali-imem
 compatible
Message-ID: <20251104-glaring-rebel-pillbug-a467ca@kuoka>
References: <20251102-knp-soc-binding-v3-0-11255ec4a535@oss.qualcomm.com>
 <20251102-knp-soc-binding-v3-1-11255ec4a535@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251102-knp-soc-binding-v3-1-11255ec4a535@oss.qualcomm.com>

On Sun, Nov 02, 2025 at 11:25:06PM -0800, Jingyi Wang wrote:
> Document qcom,kaanapali-imem compatible. Kaanapali IMEM is not a syscon or
> simple-mfd, also "reboot reason" is not required on Kaanapali like some

I do not see correlation. Something is not a syscon, so you add a new
generic compatible? No.

> other platforms. So define a common "qcom,imem" binding and fallback to it.

You did not define fallback to it!

...

> +      - items:
> +          - enum:
> +              - qcom,kaanapali-imem
> +          - const: qcom,imem

I do not understand what this generic compatible is supposed to express,
not explained in commit msg. Considering this wasn't before, it is a
major and really undesired change. It also makes no sesne. There was no
generic compatible before but "if not syscon" now this must have generic
compatible, what?

NAK

Best regards,
Krzysztof


