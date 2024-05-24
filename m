Return-Path: <linux-arm-msm+bounces-20368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 948BF8CDF83
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 04:33:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46D411F21B6B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 02:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69ECF1E884;
	Fri, 24 May 2024 02:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ym0ZdkDp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397EF33D8;
	Fri, 24 May 2024 02:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716517976; cv=none; b=CwSkwdlfJwWLkAeSf9wEf4jB1wyFxb4Z/bGRkuXJeh5gJofKiIKcxlB6JOYjyTHTkR1r910UiCRPMzeQUWzEUTlg5bsBROAw9wmsHZXLO8eSFDznKg6aBHe3aBPC1FN+Bx6td8rZyZGUVn/FZVmBHSh14lhSiTBlLlW90ii7NpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716517976; c=relaxed/simple;
	bh=A2LtdXVt1FOoMFQuFZN7A3gmcj+m+lSSGQ1UKkAuIUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GlNb9mX2bc8W1GV2aMhyDzOICTH4YFMuPDK2zlovh43ojHNKCtiuLfL9Q/taBIlxyu/08qFvBtJlFyKpYN21nT/3a1DEQoIZQj4gjRCQoubkqE8SQnD+Yc1nPBYo+PkMIF79+K4rUnfRfhAbYfw2hEheA5hhFB6nc5jlGnHS0ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ym0ZdkDp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95AD9C2BD10;
	Fri, 24 May 2024 02:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716517975;
	bh=A2LtdXVt1FOoMFQuFZN7A3gmcj+m+lSSGQ1UKkAuIUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ym0ZdkDptYBUPkE3hlOpEL8aNS0dZcAKflY9fiifTdmYSQ6M7h6gTBNUPa/O32+uX
	 hvr6icl4FGzK2iCeX9bCHMX2ncpBEKUzAS1ZH5dBJuqvsBJbC+OKueC+k1Wqvr+7qB
	 6zRogeiRSLzL76X+k05LJ7bFe25m/aGmtljuUAFk0A8S2Ol187Ss05jYzlI9qtN+qI
	 jJNznbDXYf5Fvu3x6u6fW4Bp9or4iLCeLPY/8xqWsSJ8PLcjToWwLmd51kLhJX7DPf
	 ivM2/NmoSN8wjEnN/k2t4mEcT5hYD0KyDTh/2IN2RFqcyPxg9/tPQ7aUyoy3fAnrbe
	 7hYBSW5g+tNng==
Date: Thu, 23 May 2024 21:32:52 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Caleb Connolly <caleb.connolly@linaro.org>, 
	Komal Bajaj <quic_kbajaj@quicinc.com>, Naina Mehta <quic_nainmeht@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Specify zap region
 for gpu
Message-ID: <7zpdjp6h26isowviky3zlcmyafrrxdutqubnqgsmxioecfhdhs@ppvk2at4vp3t>
References: <20240402-rb3gen2-gpu-v1-1-a51bb6080968@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240402-rb3gen2-gpu-v1-1-a51bb6080968@quicinc.com>

On Tue, Apr 02, 2024 at 08:33:30PM GMT, Bjorn Andersson wrote:
> Without the zap region defined the enabled GPU will, if able to find the
> other firmware files, attempt to initialize itself without the zap
> firmware loading, which causes the rb3gen2 to freeze or crash.
> 
> Add the zap-shader node and define the memory-region and firmware path
> to avoid this problem.

This statement is wrong, there is a zap-shader node already, but we're
lacking the firmware-name...

Regards,
Bjorn

> 
> Fixes: 04cf333afc75 ("arm64: dts: qcom: Add base qcs6490-rb3gen2 board dts")
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 63ebe0774f1d..5b81b5e0b4ce 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -471,6 +471,13 @@ &gcc {
>  			   <GCC_WPSS_RSCP_CLK>;
>  };
>  
> +&gpu {
> +	zap-shader {
> +		memory-region = <&gpu_microcode_mem>;
> +		firmware-name = "qcom/qcs6490/a660_zap.mbn";
> +	};
> +};
> +
>  &qupv3_id_0 {
>  	status = "okay";
>  };
> 
> ---
> base-commit: 727900b675b749c40ba1f6669c7ae5eb7eb8e837
> change-id: 20240326-rb3gen2-gpu-4343c5dc7e40
> 
> Best regards,
> -- 
> Bjorn Andersson <quic_bjorande@quicinc.com>
> 

