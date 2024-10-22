Return-Path: <linux-arm-msm+bounces-35480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0499AB981
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 00:31:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C04D91F23D33
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 22:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD971CCEE0;
	Tue, 22 Oct 2024 22:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RgSt4Lny"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0EC19E810;
	Tue, 22 Oct 2024 22:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729636296; cv=none; b=ewmyxMUQxjYyxWcheYhs5ffukrP7G5Fp9LADHF8ZOmSYVdBsEkuWaK0NM14o0AGoUSU0s+CQnc/HpOa14YWG92WD2xJWZJOp0gsDNPf0s4NDT1Pz+PA2w7jRNdCbFCZrauT8QchiWK60YXTQYxWCh8OlAS+pVmUdSJf1fD981Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729636296; c=relaxed/simple;
	bh=jb6n/Hf6W94zrY5Vg/sXsWIEdSYA1Ugqf2Bk4yWaXq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iqm8lFmDEe0mn/0MU/O3Q+ZQzyCobVjpaHHJxWKo4+ncvSAG0SX8K7+3u6KhJy9qlr8LaeXoAvyhZXOpmYDjfHpkhZamh/Panmp1R19J0mckBbO3XcCnA7O0Qxv7JGvh+qoWo4y1/NtirvQ5Cy2pkPN/aIVGDsrwcs/DDyqaICA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RgSt4Lny; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE82DC4CEC3;
	Tue, 22 Oct 2024 22:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729636295;
	bh=jb6n/Hf6W94zrY5Vg/sXsWIEdSYA1Ugqf2Bk4yWaXq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RgSt4LnyX6ZooatLF4ZAEURWQWgCQf0R+SvHp2Rkcqk4a0j68XMOUjAvaUu3YrxyN
	 LqyGtQL+njuQpS//gqf3UUF2f+CTcECRgrqb4TB+WQK35ctE1yYEp+9MJnwp3Ro0pI
	 mpwSRdNrCRWsm2DXxBGRaHZ1KiNI4JNxvTxil+FprUMEqL3ftZYkj7jZJaRVIYQzMA
	 8QSkoJIvulcFR06R3AZIbDfVzQs5Mdwgd0/kVbRMyvL48GokmUmG0qllP6WTkMk/hN
	 Ib3i1a7YJGsIucYVM1J4KHP2SJ8+VCA+gPPGoph8YbLh9jOwoYtZWZxkTSb8MwwUii
	 1FIN1+sBvU/ag==
Date: Tue, 22 Oct 2024 17:31:32 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, quic_imrashai@quicinc.com, quic_jkona@quicinc.com, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 7/8] arm64: dts: qcom: Update sleep_clk frequency to
 32000 on SA8775P
Message-ID: <amnapm4ig6ivhmle4tgywi2n7ah54cha3gpl5sowvf2rqvhg6s@7xg2afpus4ej>
References: <20241011-sa8775p-mm-v4-resend-patches-v5-0-4a9f17dc683a@quicinc.com>
 <20241011-sa8775p-mm-v4-resend-patches-v5-7-4a9f17dc683a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011-sa8775p-mm-v4-resend-patches-v5-7-4a9f17dc683a@quicinc.com>

On Fri, Oct 11, 2024 at 12:28:37AM GMT, Taniya Das wrote:
> The HW supported sleep_clk frequency on SA8775P is 32000, hence
> update the sleep_clk frequency with the correct value on SA8775P.
> 
> Fixes: 603f96d4c9d0 ("arm64: dts: qcom: add initial support for qcom sa8775p-ride")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>

It's generally expected that bug fixes are sent first in patch series,
but perhaps it's fine as this is the first DT-patch in the series.

That said, the only relationship between this patch and the rest of this
series is...you. There's no reason for sending this together with the
multimedia clock drivers.


Further, the patch subject doesn't match the expected format. It's too
long (not a summary) and it doesn't have the expected subject prefix for
changes to this file.

Please correct this.

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> index 0c1b21def4b62cc65a693552983ec0bc7eec697d..adb71aeff339b564eb3acc42a38bba2f03507508 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> @@ -517,7 +517,7 @@ &serdes1 {
>  };
>  
>  &sleep_clk {
> -	clock-frequency = <32764>;
> +	clock-frequency = <32000>;
>  };
>  
>  &spi16 {
> 
> -- 
> 2.45.2
> 

