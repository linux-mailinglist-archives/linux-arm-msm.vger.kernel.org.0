Return-Path: <linux-arm-msm+bounces-35490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3109ABA8E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 02:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44FD3284AC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 00:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8121217C8D;
	Wed, 23 Oct 2024 00:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gnHCghX1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A061798F;
	Wed, 23 Oct 2024 00:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729643541; cv=none; b=YZ7KzPNbP0n+XoXf8PcnLclU0qEONYjgl0jwPIKYVKUQ2d53+lCJ1qvqBAWeD+AHYxAI0Bsia0VvGizpr0AeQxGhw0SfJGCohFPrZ6UqRH1CT7gubWNKJW39PFOQP9jNrJrOPQ7uvy55LpPTUPQ/OW30gXVCCfb163y662JcnBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729643541; c=relaxed/simple;
	bh=32vogJ3H/e22R0yvIgsyByJwn5cSztlF2rePM1v1wvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cATXFT9XzNNyIH3c9bwS5Bfwnwfcxn1x8732Vava3UDkaO4V+YwssyvHMIkEvMy/QdSSLgHuEPnHTnam5l0V3dcPb1NnadCIZG/5lVnxFC9GtQ4NOD5lql5dhWZmYtqZbcJEmPWm9cPObNQoXgZ385YqPpZaDj+HT2P93BYvKzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gnHCghX1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5052C4CEC3;
	Wed, 23 Oct 2024 00:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729643541;
	bh=32vogJ3H/e22R0yvIgsyByJwn5cSztlF2rePM1v1wvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gnHCghX1ajNmfpugIjVZwE+ACEE5sguAmZG0SLlF7GcVqqMGkk+30C+6kUvOeC6qA
	 yXLxBGe3+83X7NKMEYdsENEs6CneCamHndhKDPWysb18dYX6cltZNMWU05EAUE6g5P
	 fB/7itp/kXlKxQYUYF2ySZd0wFwreNWF3Q5cUWwcOEXw80xgiMalED6ijGIc6e6wrp
	 cOfh1hEBCF6gs/kS+/u+9j/TWuQ/yAHCfQliOWhQ2n0JMhDx8khkMakHBgTKu22jdo
	 yd0vDfBYwCC+jcSurplCAEPY30xvVVVifcc3Uzz2IdTk5p/+ZrD4TQbcWhMhMEv0bs
	 tUF+VfrRRwIiA==
Date: Tue, 22 Oct 2024 19:32:18 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Sibi Sankar <quic_sibis@quicinc.com>, 
	Johan Hovold <johan@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: x1e80100-crd: Enable external DP
Message-ID: <hoszdyny34qr5kmtkq2fk3m24kixuwlyavpr4ufrf5vo7gkz7o@gxo2mw2lbxj3>
References: <20241022-x1e80100-ps8830-v3-0-68a95f351e99@linaro.org>
 <20241022-x1e80100-ps8830-v3-4-68a95f351e99@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022-x1e80100-ps8830-v3-4-68a95f351e99@linaro.org>

On Tue, Oct 22, 2024 at 01:26:57PM GMT, Abel Vesa wrote:
> Enable the remaining MDSS DP instances and force 2 data lanes for each DP.

Please document why you're forcing 2 data lanes for each DP (should this
restriction remain when we add support for 4 lanes?) - and I would be
extra happy if you spelled out your abbreviations.

Regards,
Bjorn

> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> index 7cc45a5cd7eb7e70915d04ea7e181b56f693f768..db36e3e1a3660f3bcd7d7ddc8286e1ff5d00c94a 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> @@ -1105,6 +1105,30 @@ &mdss {
>  	status = "okay";
>  };
>  
> +&mdss_dp0 {
> +	status = "okay";
> +};
> +
> +&mdss_dp0_out {
> +	data-lanes = <0 1>;
> +};
> +
> +&mdss_dp1 {
> +	status = "okay";
> +};
> +
> +&mdss_dp1_out {
> +	data-lanes = <0 1>;
> +};
> +
> +&mdss_dp2 {
> +	status = "okay";
> +};
> +
> +&mdss_dp2_out {
> +	data-lanes = <0 1>;
> +};
> +
>  &mdss_dp3 {
>  	compatible = "qcom,x1e80100-dp";
>  	/delete-property/ #sound-dai-cells;
> 
> -- 
> 2.34.1
> 

