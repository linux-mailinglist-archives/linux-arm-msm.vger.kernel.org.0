Return-Path: <linux-arm-msm+bounces-47021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4186CA2A646
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 11:44:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4226D1882F3E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 10:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15BDD227583;
	Thu,  6 Feb 2025 10:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ax+BbU4+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FC422757C;
	Thu,  6 Feb 2025 10:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738838653; cv=none; b=DAjTeYIuc4zAiX7MjpOh4nPxgS5a8CxZheE7o4HJQHAaIPVQxEzCtoD913JNEeNsTAvziXtf/d/nEEy4hmx4Hj3iuhoeN9ce+Pufw9uT7GGqjhUWIqk1b5Vt9VGKEZZpmE2OcdloUFPke/b/X71hr+Ss78gUKzb/wdggNYr1OG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738838653; c=relaxed/simple;
	bh=fkAc2VR7diVGb/W/U7bfFYgHh0dLjJKR556XFs2OhdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=knzjRUeHN4HLR3mCOsEo6CzU+ucOAknsQB68iyeifizTvyokAWkGVecN/Jjpk61C9ORqFBCs5mFq+jF4+3lyP5HB2xma6aCvhNEnnIxOuyNCO91y8K0GSWoTNB7r79s33QLOk8uFRDGQBs/nPdNCVcDSW+UJjKIGMajAQwkvciA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ax+BbU4+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B112C4CEDD;
	Thu,  6 Feb 2025 10:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738838652;
	bh=fkAc2VR7diVGb/W/U7bfFYgHh0dLjJKR556XFs2OhdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ax+BbU4+159AkAlNdkM3Z7EW3X1Rvq43m49RYfgwLucI7JN7SEDRygCNwgLo9QE5m
	 X4gR3pTSNzBtUk2AJXAgmORCtcBn5zneL5+2NIrdqBOAnRFMVpCtm2HAyhAgrM/KiC
	 T6NuYYzw279MjqpjR/zyPDQBy/btAkxggljg+GTO+AmLm6PWclGF31gO8zKqq2+efl
	 NInKWJyxaphKuwatwTAzDQEnN4tNVmpew8D5EtdQDu7edKvI5VKBPPx/du4FOYacP/
	 5tGqTYE8zSwvvuv3nh/mJDGGZlVGvYGhM/L+/jhEN9eSfIUISINqGa7iL6T+y+7XzD
	 /5YXB+WaA2bog==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tfzMo-000000003U2-2QLa;
	Thu, 06 Feb 2025 11:44:19 +0100
Date: Thu, 6 Feb 2025 11:44:18 +0100
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rajendra Nayak <quic_rjendra@quicinc.com>
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Add the watchdog device
Message-ID: <Z6SSgmoUPFv3vDDY@hovoldconsulting.com>
References: <20250206-x1e80100-add-watchdog-v1-1-77147510c2d7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-x1e80100-add-watchdog-v1-1-77147510c2d7@linaro.org>

On Thu, Feb 06, 2025 at 12:37:13PM +0200, Abel Vesa wrote:
> From: Rajendra Nayak <quic_rjendra@quicinc.com>
> 
> The X Elite implements Server Base System Architecture (SBSA) specification
> compliant generic watchdog.
> 
> Describe it.
> 
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 9d38436763432892ceef95daf0335d4cf446357c..007815699e4b9137c3b5cf72263c9dd3a64e6bb3 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -3708,6 +3708,13 @@ pcie4_phy: phy@1c0e000 {
>  			status = "disabled";
>  		};
>  
> +		watchdog@1c840000 {

Please keep the nodes sorted by unit address. Looks like this ones goes
much further down.

> +			compatible = "arm,sbsa-gwdt";
> +			reg = <0 0x1c840000 0 0x1000>,
> +			      <0 0x1c850000 0 0x1000>;
> +			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
>  		tcsr_mutex: hwlock@1f40000 {
>  			compatible = "qcom,tcsr-mutex";
>  			reg = <0 0x01f40000 0 0x20000>;

Johan

