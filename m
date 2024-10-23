Return-Path: <linux-arm-msm+bounces-35570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A24C59AC19E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 10:30:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EE721F21F93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 08:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B0C215990C;
	Wed, 23 Oct 2024 08:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DyR0e0jR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC61159565;
	Wed, 23 Oct 2024 08:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729672223; cv=none; b=f3wCh6DQxiMHjZOKHyyU0JzGRxgwjd7ph7p9qxn9pTtIQJrx995AoY1y0cIi+y13Jvh2KPhdQWmfXdLEg4j1d1HttdiZisVKlxRk1lh6wy2ggSmqLiDkfgDEDMH2H20cq0/B/cj3wEoNz5zTTlh/eQ2JBkiEsJdl6piQdR3Ut/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729672223; c=relaxed/simple;
	bh=7mytYLN2WfdWcKkA/4BcRfwkzwaK4SyKL36rOzjrNlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=koMaiDgK9hyBUJ1VOjy2ovTfAmM184gkxOKcZsrxnzXVbpaAeb8SdLiTOM4w7WDKZCLSBRwlsknpeMFjbAmCmA1OfdBzYHzFR44bdGqdc1gBpENODfkAz0QB4rebm6hq7RKoHdmuseoVfo/jgPW+tMU1ECXtlBOg5QFFQjkEnQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DyR0e0jR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52ECCC4CEC7;
	Wed, 23 Oct 2024 08:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729672222;
	bh=7mytYLN2WfdWcKkA/4BcRfwkzwaK4SyKL36rOzjrNlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DyR0e0jR2hqQpRjANY8apMmNsmPZ/ycB6uRKon6dGd3XMV5OReKFu7crmnCHm+BLK
	 bW9rmncgNZYclgpNFlbE1RAeyt8CP1hPLaALY5brtc+DeR+fzrMTchCoqhG4A+Kfn/
	 XieFgZIdnFH/YBjb0yWVdASNHoUez24NcoWZZYKNYQ0zDMJVA0cEE96X2qat0FVYKx
	 aKvwA0wPec7bB6y/ja0rxgq6zarVY/0r4FLUiafIakL/qxzTqyCRO+sd+1HFuStl/Z
	 ua3fkej6bIAwFhmzh7JVD+eEz/ij5Y9ES8zmLDQNFD7qrGgXVpIVGtHP1Coqjdi0ni
	 rkYIbnMoxxgGQ==
Date: Wed, 23 Oct 2024 10:30:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, 
	=?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>, Stephen Boyd <sboyd@kernel.org>, 
	Trilok Soni <quic_tsoni@quicinc.com>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Jishnu Prakash <quic_jprakash@quicinc.com>
Subject: Re: [PATCH 2/5] dt-bindings: mfd: qcom,spmi-pmic: Document PMICs
 added in SM8750
Message-ID: <jcrtuqrj7loexcburucrneptvmzyqm6sbu6o27lwtftt3kc43c@ggd4sgfzmtvl>
References: <20241021232114.2636083-1-quic_molvera@quicinc.com>
 <20241021232114.2636083-3-quic_molvera@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241021232114.2636083-3-quic_molvera@quicinc.com>

On Mon, Oct 21, 2024 at 04:21:11PM -0700, Melody Olvera wrote:
> From: Jishnu Prakash <quic_jprakash@quicinc.com>
> 
> Document compatibles for the added pmd8028 and pmih0108 SPMI PMICs.
> 
> Signed-off-by: Jishnu Prakash <quic_jprakash@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


